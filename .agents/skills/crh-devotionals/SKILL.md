---
name: crh-devotionals
description: >
    Devocionales CRH: planes de lectura, contenido diario y progreso del miembro.
    Trigger: Devocionales, lectura bíblica, planes, contenido diario.
license: UNLICENSED
metadata:
    author: CRH Team
    version: "1.0"
    scope: [app/Models/, app/Http/Controllers/]
    auto_invoke:
        - "Trabajar con devocionales"
    triggers: devocional, devotional, lectura, biblia, plan
    related-skills: [crh-api-patterns]
allowed-tools: [Read, Edit, Write, Glob, Grep, Bash]
---

# CRH Devotionals

## Modelo

- **DevotionalPlan:** serie (ej. 30 días, lectura anual)
- **DevotionalEntry:** día N — título, pasaje bíblico, reflexión, pregunta opcional
- **MemberProgress:** día completado, streak, última lectura

## Flujo miembro

1. Elegir plan activo de la iglesia
2. Ver entrada del día
3. Marcar como leído → actualiza progreso y streak

## Endpoints típicos

- `GET /api/v1/devotionals/plans`
- `GET /api/v1/devotionals/today` — entrada del día según plan activo
- `POST /api/v1/devotionals/progress` — marcar completado

## Contenido

- Admin/pastor publica planes y entradas
- Soporte markdown en reflexión
- Notificación push matutina opcional (configurable)
