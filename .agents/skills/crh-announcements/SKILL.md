---
name: crh-announcements
description: >
    Anuncios y avisos CRH: categorías, prioridad, push y email a la congregación.
    Trigger: Anuncios, avisos, notificaciones masivas, comunicaciones.
license: UNLICENSED
metadata:
    author: CRH Team
    version: "1.0"
    scope: [app/Models/, app/Http/Controllers/]
    auto_invoke:
        - "Trabajar con anuncios o avisos"
    triggers: anuncios, announcements, aviso, comunicado, push
    related-skills: [crh-api-patterns, crh-events]
allowed-tools: [Read, Edit, Write, Glob, Grep, Bash]
---

# CRH Announcements

## Categorías

- General (toda la iglesia)
- Ministerio específico
- Urgente / pastoral
- Administrativo

## Campos

- título, cuerpo (rich text o markdown), categoría, prioridad
- audiencia: todos | ministerio | rol
- published_at, expires_at
- pin (destacado en feed)

## Flujo

1. Pastor/líder/admin crea borrador
2. Publicación → visible en feed + push opcional
3. Archivo automático tras expires_at

## Endpoints típicos

- `GET /api/v1/announcements` — feed paginado
- `POST /api/v1/announcements` — crear
- `POST /api/v1/announcements/{id}/publish` — publicar + disparar notificación

## Rate limiting

Limitar creación masiva y envío push para evitar spam accidental.
