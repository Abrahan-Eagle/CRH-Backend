---
name: jarvis-experts
description: >
    Panel de Expertos de JARVIS para CRH (Iglesia CRH). Define el roster completo de roles,
    criterios de activación y combinaciones recomendadas.
    Trigger: Antes de planificar/ejecutar cualquier tarea técnica, o cuando una decisión cruza áreas.
license: UNLICENSED
metadata:
    author: CRH Team
    version: "1.0"
    scope: [root]
    auto_invoke:
        - "Cualquier tarea no trivial"
        - "Decisión cross-rol"
        - "Definir alcance de un módulo"
    triggers: experto, expertos, agencia, panel, rol, roles, jarvis-experts
    related-skills: [jarvis-core, code-review-playbook, security]
allowed-tools: [Read, Glob, Grep]
---

# Panel de Expertos JARVIS — CRH Backend

## Cómo usar

1. **Identifica** 1–3 roles primarios.
2. **Declara:** `> Roles: backend (Laravel) + AppSec`.
3. **Combina** roles secundarios automáticamente cuando aplique.
4. **No spam** en tareas triviales.

## Roster

| Área | Rol | Activar cuando… |
|------|-----|-----------------|
| Dirección | CTO / Tech lead | priorizar, trade-offs, roadmap |
| Dirección | Arquitecto | sistemas, integraciones, escalabilidad |
| Desarrollo | Backend (Laravel) | endpoints, modelos, jobs, eventos |
| Plataforma | DevOps / SRE | CI/CD, observabilidad, incidentes |
| Plataforma | DBA | migraciones, índices, SQL lento |
| Calidad | QA / SDET | tests, fixtures, contract tests |
| Calidad | AppSec | auth, uploads, IDOR, OWASP |
| Calidad | Privacidad | datos de miembros, retención, consentimiento |
| Producto | PM | scope, priorización, criterios aceptación |
| Producto | UX writer | microcopy, notificaciones, mensajes API |
| Soporte | Technical writer | docs API, onboarding |

## Combinaciones recomendadas (CRH)

| Tarea | Combinación |
|-------|-------------|
| Auth / roles iglesia | backend + AppSec + privacidad |
| Datos de miembros / familias | backend + privacidad + DBA |
| Donaciones / pagos | backend + AppSec + legal (consultivo) |
| Push / anuncios masivos | backend + integraciones + privacidad |
| Streaming / live | backend + integraciones + SRE |
| Migración con FK | backend + DBA |

## Especialización CRH

App congregacional: miembros, eventos, anuncios, diezmos/ofrendas, ministerios/grupos, devocionales, streaming en vivo. Stack Laravel API + Flutter app.

## Anti-patrones

- Más de 3 roles declarados.
- CTO en un fix de typo.
- Pedir permiso para activar AppSec en auth nuevo.
