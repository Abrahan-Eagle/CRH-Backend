---
name: crh-members
description: >
    Módulo de congregación CRH: perfiles, familias, membresía, bautismos y directorio.
    Trigger: Miembros, perfiles, familias, membresía, bautismo, directorio.
license: UNLICENSED
metadata:
    author: CRH Team
    version: "1.0"
    scope: [app/Models/, app/Http/Controllers/]
    auto_invoke:
        - "Trabajar con miembros o congregación"
    triggers: miembros, members, familia, membresía, bautismo, perfil
    related-skills: [crh-api-patterns, security]
allowed-tools: [Read, Edit, Write, Glob, Grep, Bash]
---

# CRH Members (Congregación)

## Entidades principales

- **Member/Profile:** datos personales, contacto, foto, estado membresía
- **Family:** núcleo familiar vinculado (padre/madre/hijos)
- **Membership:** fecha ingreso, bautismo, estado (activo, visitante, inactivo)

## Reglas de negocio

- Un usuario autenticado = un perfil de miembro (1:1)
- Pastores/admins ven directorio completo; miembros ven directorio limitado (privacidad configurable)
- Campos sensibles (teléfono, dirección): visibilidad por rol o opt-in del miembro
- Historial de bautismo y membresía auditable

## Endpoints típicos

- `GET /api/v1/members` — listado (filtrado por rol)
- `GET /api/v1/members/{id}` — detalle
- `PUT /api/v1/members/me` — actualizar propio perfil
- `GET /api/v1/families/{id}` — familia

## Privacidad

- Cumplir principio de mínima exposición
- Consentimiento para mostrar datos en directorio público interno
