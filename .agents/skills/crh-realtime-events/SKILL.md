---
name: crh-realtime-events
description: >
  Eventos en tiempo real Iglesia CRH. Pusher, FCM (canal crh_fcm), anuncios, eventos, streaming, chat grupal.
  Trigger: Pusher, broadcasting, FCM, notificaciones push, tiempo real.
license: UNLICENSED
metadata:
  author: CRH Team
  version: "1.0"
  scope: [app/Events/, config/broadcasting.php, routes/channels.php]
  related-skills: [crh-group-chat, crh-streaming, crh-announcements]
---

# Eventos en tiempo real — Iglesia CRH

> **NO WebSocket directo.** Pusher Channels + FCM.

## Arquitectura

```
Flutter ←→ Pusher Channels ←→ Laravel Broadcasting
                                    ↓
              Firebase Cloud Messaging (FCM) → Push (canal crh_fcm)
```

## Roles y canales

| Rol | Canal broadcast | FCM topic |
|-----|-----------------|-----------|
| member | `private-user.{id}` | user_{id} |
| leader | `private-ministry.{id}` | ministry_{id} |
| pastor/admin | `private-church.{id}` | church_{id} |

## Eventos previstos

| Evento | Cuándo | Canales |
|--------|--------|---------|
| `AnnouncementPublished` | Nuevo anuncio pastoral | church-wide + push |
| `EventReminder` | Recordatorio evento (24h / 1h) | user + push |
| `LiveStreamStarted` | Inicio transmisión | church-wide + push |
| `GroupMessageSent` | Mensaje chat ministerio (fase 2) | ministry private |
| `DonationStatusChanged` | Donación pending → confirmed/rejected | user + push (miembro) |
| `EventRegistrationUpdated` | Inscripción registered/cancelled/checked_in | user + push (opcional) |

## Contrato payload (schema_version)

Todo broadcast Pusher y data FCM deben incluir metadatos de versión e idempotencia:

```json
{
  "schema_version": 1,
  "event_id": "uuid-v4",
  "type": "donation.status_changed",
  "entity_id": "42",
  "occurred_at": "2026-06-01T12:00:00Z",
  "payload": { }
}
```

| Campo | Regla |
|-------|-------|
| `schema_version` | Entero; incrementar solo en breaking changes del payload |
| `event_id` | UUID único por emisión; cliente ignora duplicados |
| `type` | Snake case estable (`announcement.published`, `donation.status_changed`, etc.) |

### Reglas cliente Flutter

1. **Idempotencia:** si `event_id` ya procesado en sesión → ignorar.
2. **Cache:** si `schema_version` > versión local conocida → invalidar cache del módulo y refetch.
3. **Offline:** encolar por `event_id`; no aplicar dos veces al reconectar.

## FCM payload mínimo

```json
{
  "notification": { "title": "...", "body": "..." },
  "data": {
    "schema_version": "1",
    "event_id": "uuid",
    "type": "announcement",
    "id": "123"
  }
}
```

## Ejemplo broadcast

```php
class AnnouncementPublished implements ShouldBroadcast
{
    public function __construct(public Announcement $announcement) {}

    public function broadcastOn(): array
    {
        return [new PrivateChannel("church.{$this->announcement->church_id}")];
    }

    public function broadcastAs(): string
    {
        return 'announcement.published';
    }
}
```

## Config

- `config/broadcasting.php` → driver `pusher`
- `.env`: `PUSHER_*`, `FIREBASE_CREDENTIALS`
- Canal FCM: **`crh_fcm`**

## Skills relacionadas

- `crh-group-chat` — chat grupal fase 2 (depende de esta skill)
- `crh-streaming` — live stream events
- `mobile-developer` — Flutter FCM setup
