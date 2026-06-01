---
name: crh-events
description: >
    Calendario y eventos CRH: servicios, inscripciones, recordatorios y capacidad.
    Trigger: Eventos, calendario, servicios, inscripciones, recordatorios.
license: UNLICENSED
metadata:
    author: CRH Team
    version: "1.0"
    scope: [app/Models/, app/Http/Controllers/]
    auto_invoke:
        - "Trabajar con eventos o calendario"
    triggers: eventos, events, calendario, servicio, inscripción
    related-skills: [crh-api-patterns, crh-announcements, crh-realtime-events]
allowed-tools: [Read, Edit, Write, Glob, Grep, Bash]
---

# CRH Events

## Tipos de evento

- Servicio dominical / culto
- Reunión de ministerio
- Conferencia / retiro
- Evento especial (bautismos, matrimonios)

## Campos clave

- título, descripción, fecha/hora inicio-fin, ubicación
- ministerio organizador (opcional)
- capacidad máxima, requiere_inscripción
- recordatorio (push/email X horas antes)

## Endpoints típicos

- `GET /api/v1/events` — calendario (filtros: mes, ministerio, tipo)
- `POST /api/v1/events` — crear (pastor/leader/admin)
- `POST /api/v1/events/{id}/register` — inscripción miembro
- `DELETE /api/v1/events/{id}/register` — cancelar inscripción
- `POST /api/v1/events/{id}/check-in` — líder/pastor marca asistencia

## Estados de inscripción

```
registered → cancelled   (miembro, antes del evento)
registered → checked_in  (líder/pastor en el evento)
(checked_in es terminal; cancelled es terminal)
```

| Estado | Descripción | Quién activa |
|--------|-------------|--------------|
| `registered` | Miembro inscrito | Miembro (POST register) |
| `cancelled` | Inscripción cancelada | Miembro (DELETE register) |
| `checked_in` | Asistió al evento | Líder, pastor, admin |

### Transiciones válidas (fail-fast)

| Desde | Hacia | Rol permitido |
|-------|-------|---------------|
| — | `registered` | member (si hay cupo) |
| `registered` | `cancelled` | member |
| `registered` | `checked_in` | leader, pastor, admin |

Transición inválida → **HTTP 400**.

### Capacidad

- Si `requiere_inscripción` y `registrations_count >= capacidad_maxima` → **HTTP 409** al intentar register.
- Contar solo inscripciones en estado `registered` o `checked_in` (no `cancelled`).

### Broadcast

- `EventRegistrationUpdated` al cambiar estado de inscripción
- `EventReminder` 24h / 1h antes (push FCM) — ver `crh-realtime-events`

## Integraciones

- Notificaciones push vía FCM al publicar, recordar o cambiar inscripción
- Sincronización opcional calendario externo (fase 2)
