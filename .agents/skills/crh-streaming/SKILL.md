---
name: crh-streaming
description: >
    Streaming en vivo CRH: estado live, embed YouTube/Vimeo o RTMP, agenda de transmisiones.
    Trigger: Streaming, live, transmisión, YouTube, Vimeo, en vivo.
license: UNLICENSED
metadata:
    author: CRH Team
    version: "1.0"
    scope: [app/Models/, app/Http/Controllers/]
    auto_invoke:
        - "Trabajar con streaming o transmisiones"
    triggers: streaming, live, transmisión, youtube, vimeo, en vivo
    related-skills: [crh-api-patterns, crh-events]
allowed-tools: [Read, Edit, Write, Glob, Grep, Bash]
---

# CRH Streaming

## Modos de integración

1. **Embed (MVP):** URL YouTube Live / Vimeo — app muestra WebView o player nativo
2. **Estado manual:** admin marca "En vivo" con URL activa
3. **Webhook/API (fase 2):** detectar inicio/fin automático desde plataforma

## Entidades

- **StreamSession:** título, platform (youtube|vimeo|custom), stream_url, status (scheduled|live|ended), started_at, ended_at
- Vinculación opcional a Event (servicio dominical)

## Endpoints típicos

- `GET /api/v1/streaming/current` — sesión live o próxima programada
- `GET /api/v1/streaming/schedule` — agenda
- `POST /api/v1/streaming/{id}/go-live` — admin (manual)
- `POST /api/v1/streaming/{id}/end` — admin

## Notificaciones

- Push "Estamos en vivo" al iniciar transmisión (opt-in miembros)

## Consideraciones

- No almacenar credenciales RTMP en cliente
- Cache corto en endpoint `current` (30–60s)
