---
name: crh-member-engagement
description: >
    Retención y reactivación de miembros inactivos: sin login, sin devocional, sin eventos.
    Playbooks push/email. Adaptado de churn-prevention.
    Trigger: Métricas retención, campaña reactivación miembros.
license: UNLICENSED
metadata:
    author: CRH Team
    version: "1.0"
    scope: [app/Jobs/, docs/]
    auto_invoke:
        - "Trabajar con retención o engagement"
    triggers: churn, retención, inactivo, reactivación, engagement
    related-skills: [crh-analytics-events, crh-events, crh-devotionals]
allowed-tools: [Read, Edit, Write, Glob, Grep]
---

# CRH Member Engagement

## Definición inactividad

| Señal | Umbral orientativo |
|-------|-------------------|
| Sin login app | 14 días |
| Sin devocional completado | 7 días (si opt-in push) |
| Sin inscripción evento dominical | 21 días |

## Playbooks

### D1 — Bienvenida activa

- Push: "Tu devocional de hoy te espera"
- CTA: pantalla devocional o próximo evento

### D7 — Comunidad

- Recordatorio evento del fin de semana
- Invitación a ministerio según perfil (fase 2)

### D30 — Win-back pastoral

- Mensaje pastoral genérico (no automatizar copy sensible sin revisión)
- Encuesta 1 pregunta: "¿Cómo podemos ayudarte a conectar?"

## Backend (fase 2)

- Job: `InactiveMemberNotification`
- Query: último `last_login_at` en users/profiles
- Respetar opt-out notificaciones

## Métricas

- Tasa reactivación 7d post-campaña
- `live_joined` vs miembros activos MAU
