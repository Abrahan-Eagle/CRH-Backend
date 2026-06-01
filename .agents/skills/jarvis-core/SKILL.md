---
name: jarvis-core
description: >
    Protocolo base del sistema JARVIS para CRH (Iglesia CRH). Define las reglas de honestidad, foco de negocio y el flujo de trabajo obligatorio por módulos.
    Trigger: Al iniciar un nuevo feature, planificar desarrollo, terminar un módulo, o modificar el sistema en sí.
license: UNLICENSED
metadata:
    author: CRH Team
    version: "1.0"
    scope: [root]
    auto_invoke:
        - "Iniciar módulo"
        - "Planificar desarrollo"
        - "Terminar módulo"
    triggers: jarvis, workflow, módulo, feature, plan, core
    related-skills: [git-commit, brainstorming-ops, task-pipeline-ops, verification-before-completion, session-learner-ops, writing-plans, executing-plans, using-git-worktrees, finishing-a-development-branch]
allowed-tools: [Read, Edit, Write, Glob, Grep, Bash, WebFetch, WebSearch, Task]
---

# JARVIS Core System - CRH Backend

## Protocolo de calidad

| Skill | Cuándo |
|-------|--------|
| `deep-interview-ops` | Requisitos vagos (claridad ≥ 3.5/5) |
| `brainstorming-ops` | Antes de planificar/codificar módulo |
| `task-pipeline-ops` | Tareas >3 pasos: Plan→Spec→Exec→Verify→Fix |
| `verification-before-completion` | **Obligatorio** antes de "listo" o commit |
| `structured-commits-ops` | Commits con decisiones de arquitectura |
| `session-learner-ops` | Cierre módulo → `docs/active_context.md` |
| `writing-plans` | Tras diseño aprobado → `.agents/plans/implementation_plan.md` |
| `executing-plans` | Ejecutar plan paso a paso |
| `using-git-worktrees` | Features paralelas aisladas en `.worktrees/` |
| `requesting-code-review` / `receiving-code-review` | Antes/después de merge grande |
| `finishing-a-development-branch` | Cierre módulo: tests + opciones merge/PR |
| `crh-scenario-analysis` | Decisiones producto what-if |
| `crh-analytics-events` | Métricas y eventos embudo |
| `crh-member-engagement` | Retención miembros inactivos |
| `crh-content-moderation` | Moderación anuncios/devocionales |
| `crh-llm-judge` | Auditoría LLM-as-judge pre-publicación (JSON score/must_fix) |
| `error-recovery` | RETRY/REPLAN/SKIP/ABORT ante errores CI/API (antes de debug profundo) |
| `crh-marketing-psychology` | Persuasión ética copy pastoral/SaaS |
| `crh-content-strategy` | Pilares y calendario contenido CRH |
| `crh-email-sequence` | Secuencias email iglesia + reactivación miembros |
| `crh-referral-program` | Referidos iglesia-a-iglesia |
| `crh-pricing-strategy` | Tiers SaaS (par `crh-financial-model`) |
| `crh-competitor-profiling` | Planning Center, Tithe.ly, Subsplash |
| `crh-launch-strategy` | GTM digital (par `crh-launch-piloto`) |
| `crh-i18n` | Flutter ARB + Laravel lang, español-first, Accept-Language |
| `context-updater` | Fin de sesión → `docs/active_context.md` |
| `documentar-avances` | Propone "Cambios recientes" en AGENTS (con OK usuario) |
| `crh-jarvis-subagents-map` | Orquestación tarea → skill canon |

**Marketing/CRO:** leer `docs/product-marketing-context.md` antes de escenarios o analytics.

**Dominio CRH:** skills `crh-*` según módulo (miembros, eventos, donaciones, etc.).

**Transiciones de estado:** donaciones (`crh-donations`) e inscripciones evento (`crh-events`) usan máquinas de estados fail-fast (400/409) y broadcast vía `crh-realtime-events` (`schema_version`, `event_id`).

## Router de flujo (Spec Kit vs Jarvis clásico)

| Tipo de tarea | Flujo |
|---------------|-------|
| **Nueva feature producto** (API + Flutter) | `/speckit-specify` → … → implement → **review → accept → closeout** + `crh-*` |
| **Bug con regresión / spec** | `/speckit-bugfix` → plan → tasks → implement + `systematic-debugging`, `test-driven-development` |
| **Cambio feature existente** | `/speckit-modify 00N` → plan → tasks → implement + `crh-api-patterns` si API |
| **Emergencia producción (P0/P1)** | `/speckit-hotfix` → plan → tasks → implement; post-mortem ≤48h; follow-up `/speckit-bugfix` |
| **Bug trivial** (1 archivo, typo) | `task-pipeline-ops` + `systematic-debugging` — sin artefacto en `specs/` |
| **Pack Lanzamiento / inversor** | `crh-lanzamiento-docs` + `crh-startup-context` — **no** Spec Kit |
| **Cierre módulo** | `/speckit-closeout` + `session-learner-ops` + walkthrough |
| **Fin de sesión** | `context-updater` |
| **Registrar avance en AGENTS** | `documentar-avances` |

Ver [docs/crh/SPEC_KIT_CRH.md](../../docs/crh/SPEC_KIT_CRH.md) y [.specify/memory/constitution.md](../../.specify/memory/constitution.md).

## Directivas Principales

1. **Honestidad Absoluta:** Si cometes un error o una request no es óptima, dilo.
2. **Proactividad:** Ofrece mejoras de diseño (DB, API) o sugerencias para la operación de la iglesia.
3. **Memoria Persistente:** Revisa `AGENTS.md`, `docs/active_context.md` y este skill al iniciar.
4. **Panel de Expertos:** Declara roles en tareas no triviales: `> Roles: backend (Laravel) + AppSec`.

## Flujo de Trabajo Obligatorio

### 0. Activar Panel de Expertos
Identifica roles y decláralos. Consulta `jarvis-experts` si la tarea cruza áreas.

### 1. Planificación
- **NO escribas código inmediatamente.**
- **Feature producto nueva:** usar Spec Kit (`/speckit-specify` …) — specs en `specs/`; ver constitution.
- **Módulo sin spec formal:** crear `.agents/plans/implementation_plan.md` con propuesta arquitectónica.
- Analiza riesgos e impactos en módulos existentes. Pide validación.

### 2. Desarrollo
- Patrones: Sanctum, Eloquent, MVC del proyecto CRH.
- Usa skills `crh-*` del dominio correspondiente.

### 3. Loop de Feedback
Pregunta: **"¿Desea revisar las modificaciones del módulo?"**

### 4. Testing
`php artisan test` + `verification-before-completion` con evidencia fresca.

### 5. Actualización de memoria
Genera/actualiza `.agents/plans/walkthrough.md` y ofrece actualizar `docs/active_context.md`.

### 6. Commit de Cierre
Solicita autorización expresa. **Nunca push sin orden.**
