---
name: crh-ministries
description: >
    Ministerios y grupos CRH: líderes, miembros, asistencia y reuniones.
    Trigger: Ministerios, grupos, células, asistencia, líderes.
license: UNLICENSED
metadata:
    author: CRH Team
    version: "1.0"
    scope: [app/Models/, app/Http/Controllers/]
    auto_invoke:
        - "Trabajar con ministerios o grupos"
    triggers: ministerios, ministries, grupo, célula, asistencia, líder
    related-skills: [crh-api-patterns, crh-members, crh-events]
allowed-tools: [Read, Edit, Write, Glob, Grep, Bash]
---

# CRH Ministries

## Entidades

- **Ministry:** nombre, descripción, categoría (jóvenes, matrimonios, alabanza, etc.)
- **Group:** subgrupo dentro de ministerio (célula, equipo)
- **Leader:** miembro con rol leader sobre ministerio/grupo
- **Attendance:** registro por reunión

## Permisos

- Líder: CRUD miembros de su grupo, registrar asistencia, crear eventos del grupo
- Miembro: ver grupos a los que pertenece, unirse/solicitar unirse
- Pastor/admin: todos los ministerios

## Endpoints típicos

- `GET /api/v1/ministries`
- `POST /api/v1/ministries/{id}/join`
- `POST /api/v1/groups/{id}/attendance` — líder registra asistencia
- `GET /api/v1/groups/{id}/members`

## Fase 2

- Chat grupal por ministerio (integración realtime)
