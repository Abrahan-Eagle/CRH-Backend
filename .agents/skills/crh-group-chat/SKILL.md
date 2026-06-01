---
name: crh-group-chat
description: >
    Chat grupal CRH (fase 2): conversaciones por ministerio/grupo vía Pusher/Echo. Sin ofertas comerciales.
    Trigger: Chat grupal, mensajes ministerio, WebSockets, Pusher.
license: UNLICENSED
metadata:
    author: CRH Team
    version: "1.0"
    scope: [app/Events/, app/Http/Controllers/, routes/channels.php]
    auto_invoke:
        - "Trabajar con chat grupal"
    triggers: chat, WebSocket, Pusher, Echo, mensajes, conversación, ministerio
    related-skills: [crh-api-patterns, crh-ministries, crh-realtime-events]
allowed-tools: [Read, Edit, Write, Glob, Grep, Bash]
---

# CRH Group Chat (Fase 2)

> **Estado:** Especificado — implementar cuando ministerios fase 2 esté activo.

## Arquitectura

- Laravel Echo + Pusher/Soketi — ver **`crh-realtime-events`**
- Canales privados por grupo/ministerio
- Broadcast eventos mensaje nuevo

## Modelos previstos

- `GroupConversation` — conversación de un grupo ministerial
- `GroupMessage` — mensaje de texto (fase 1); adjuntos moderados fase 2+

## Endpoints previstos

```
GET    /api/v1/groups/{id}/messages      → Listar mensajes
POST   /api/v1/groups/{id}/messages      → Enviar mensaje (líder o miembro del grupo)
POST   /api/v1/groups/{id}/messages/read → Marcar leído
```

## Eventos broadcast

- `GroupMessageSent` — nuevo mensaje en grupo
- `GroupConversationUpdated` — metadata actualizada

## Diferencias vs marketplace chat

- **No** ofertas comerciales ni listings
- Moderación: líder puede eliminar mensajes; admin global
- Rate limit estricto anti-spam

## Frontend

UI: skill `crh-group-chat-ui` en CRH-Frontend.

## Seguridad

- Policy: solo miembros del grupo acceden al canal
- AppSec en validación contenido y rate limits
