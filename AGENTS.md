# AGENTS.md - CRH Backend (Laravel API)

> Instrucciones para AI coding agents trabajando en el backend de Iglesia CRH.
> Para documentación de producto, ver `docs/PRODUCT_VISION.md` y `docs/MODULES.md`.
> Para reglas de mantenimiento de skills, ver [MAINTENANCE_SKILLS.md](MAINTENANCE_SKILLS.md).

## Project Overview

| Métrica | Valor |
| ------------------------ | ---------------------------------------- |
| **Producto** | App Iglesia CRH — gestión congregacional |
| **Framework** | Laravel 10.x / PHP 8.1+ (pendiente scaffold) |
| **Base de Datos** | MySQL |
| **Estado** | Fase 0 — Estructura IA configurada |
| **Frontend hermano** | CRH-Frontend (Flutter) |
| **Última actualización** | Junio 2026 |
| **Agentes IA** | Cursor + Gemini (no Claude/Codex/OpenCode) |

> **Memoria viva (Jarvis):** [`docs/active_context.md`](docs/active_context.md) — leer al iniciar trabajo.  
> **Contexto producto/marketing:** [`docs/product-marketing-context.md`](docs/product-marketing-context.md) — leer antes de skills CRO, analytics o escenarios.

## Cambios recientes

- **2026-06-01:** **Workshop Fase 0 consolidado** (bloques 9–21): decisiones de privacidad, login Google, navegación, donaciones, líderes, panel web, contenido, push (MVP vs Fase 2), streaming, promoción de roles, familias y multi-iglesia en [docs/crh/WORKSHOP_DECISIONS.md](docs/crh/WORKSHOP_DECISIONS.md). Remediaciones de coherencia: MVP unificado (iglesias+audiencias+push) en PRODUCT_VISION/MODULES/active_context/marketing; `timoteo` en matriz de roles; **constitution v1.2.0 → v1.3.0** (roles 8 niveles + scopes, auth Google).
- **2026-06-01:** Auditoría forense **github/spec-kit → CRH**: sync selectivo v0.8.15→**v0.9.0** (setup-plan, check-prerequisites, speckit-clarify); capas CRH documentadas; **prohibido** `init --force`. [FORENSE_SPEC_KIT_RESUMEN.md](docs/crh/FORENSE_SPEC_KIT_RESUMEN.md)
- **2026-06-01:** Adaptación forense **awesome-spec-kits → CRH (referencia)**: taxonomía SD-X, mapa 5 speckits evaluados (openspec/meta-spec descartados); **sin instalar**. [FORENSE_AWESOME_SPEC_KITS_RESUMEN.md](docs/crh/FORENSE_AWESOME_SPEC_KITS_RESUMEN.md), sección ecosistema en [SPEC_KIT_CRH.md](docs/crh/SPEC_KIT_CRH.md).
- **2026-06-01:** Adaptación forense **spec-kitty → CRH (subset)**: WP lanes, mission closeout skills `speckit-review|accept|closeout` (20 SDD), `.specify/extensions/workflows/mission/`, constitution **v1.2.0**, piloto WP en `001-auth-members/tasks.md`, [FORENSE_SPEC_KITTY_RESUMEN.md](docs/crh/FORENSE_SPEC_KITTY_RESUMEN.md). Sin CLI.
- **2026-06-01:** Adaptación forense **spec-kit-extensions → CRH**: workflows bugfix/modify/hotfix (`.specify/extensions/workflows/`), scripts `create-*.sh`, skills Cursor `speckit-bugfix|modify|hotfix` (17 SDD en ese hito; **superseded → 20 SDD**, constitution **v1.2.0**), router `jarvis-core` + [SPEC_KIT_CRH.md](docs/crh/SPEC_KIT_CRH.md), [FORENSE_SPEC_KIT_EXTENSIONS_RESUMEN.md](docs/crh/FORENSE_SPEC_KIT_EXTENSIONS_RESUMEN.md).
- **2026-06-01:** Adaptación forense **Zonix-Eats → CRH**: enriquecidos `crh-realtime-events` (schema_version, idempotencia), `crh-donations` (state machine), `crh-events` (inscripción/check-in); doc `FORENSE_ZONIX_EATS_RESUMEN.md`. Backend ~80 skills.
- **2026-06-01:** Adaptación forense **strangeverse → CRH**: enriquecido `error-recovery` (backoff/Retry-After), `crh-llm-judge`/`crh-content-moderation` (parseo JSON LLM), nueva skill `crh-i18n`, doc `FORENSE_STRANGEVERSE_RESUMEN.md`. Backend ~80 skills.
- **2026-06-01:** Adaptación forense **clawvis-openclaw → CRH**: +2 calidad (`crh-llm-judge`, `error-recovery`), +7 marketing SaaS (`crh-marketing-psychology`, `crh-content-strategy`, `crh-email-sequence`, `crh-referral-program`, `crh-pricing-strategy`, `crh-competitor-profiling`, `crh-launch-strategy`), docs `ORQUESTACION_MULTIAGENTE.md` + `FORENSE_CLAWVIS_RESUMEN.md`. Backend ~79 skills.
- **2026-06-01:** Adaptación forense **ZonixPharma → CRH**: Spec Kit SDD (`.specify/`, `.cursor/skills/speckit-*`, `specs/001-auth-members/`), pack startup `crh-*`, `context-updater`, `documentar-avances`, `crh-jarvis-subagents-map`, `crh-realtime-events`, `qa-testing-playwright`, `docs/Lanzamiento/`, `docs/BRAND_CRH.md`.
- **2026-06-01:** Adaptación forense CorralX → CRH: skills producto CRO/analytics; `docs/product-marketing-context.md`.
- **2026-06-01:** Estructura IA JARVIS inicial (dominio `crh-*`, workspace multi-root).

---

## Agentes IA soportados

| Agente | Rutas | Uso |
|--------|-------|-----|
| **Cursor** | `.cursorrules`, `.cursor/skills/speckit-*`, `.agents/skills/` | SDD + JARVIS (primario) |
| **Gemini** | `.gemini/skills` → `.agents/skills/` | Skills dominio (symlink) |

Fuente canónica de skills: **`.agents/skills/`** (editar aquí). Spec Kit hub: `.specify/` + `specs/`. No crear `.claude/` ni `.codex/`.

---

## Brand y experiencia (fuente canónica)

**Nombre en UI:** Iglesia CRH / CRH App. **Detalle:** [docs/BRAND_CRH.md](docs/BRAND_CRH.md). No duplicar paleta en `.cursorrules`.

---

## Spec-Driven Development (Spec Kit)

Toolkit [github/spec-kit](https://github.com/github/spec-kit) **v0.9.0** (sync parcial desde v0.8.15). **20** skills SDD en `.cursor/skills/`. **No** usar para `docs/Lanzamiento/` — usar skills startup.

| Concepto | Ubicación |
| -------- | --------- |
| Constitution | [.specify/memory/constitution.md](.specify/memory/constitution.md) |
| Feature specs | [specs/](specs/) (hub Backend) |
| Skills SDD | `.cursor/skills/speckit-*` |
| Skills dominio | `.agents/skills/crh-*` + `jarvis-core` |
| Guía | [docs/crh/SPEC_KIT_CRH.md](docs/crh/SPEC_KIT_CRH.md) |

**Flujo:** specify → clarify (opc.) → plan → tasks → analyze → implement (**solo OK usuario**).

**Router:** feature producto → Spec Kit; bugfix → `task-pipeline-ops`; Lanzamiento → `crh-lanzamiento-docs`.

---

## Skills startup (SaaS multi-iglesia)

Guía: [docs/crh/SKILLS_STARTUP_USAR_NO_USAR.md](docs/crh/SKILLS_STARTUP_USAR_NO_USAR.md). Pack: [docs/Lanzamiento/](docs/Lanzamiento/).

| Skill | Uso |
|-------|-----|
| `crh-startup-context` | Contexto y tiers — **primero** |
| `crh-lanzamiento-docs` | Router pack Lanzamiento |
| `crh-launch-piloto` | Piloto app congregación |
| `crh-fundraising-narrative` | Pitch / narrativa |
| `crh-financial-model` | Unit economics |
| `crh-jarvis-subagents-map` | Orquestación tarea → skill |

---

## Panel de Expertos JARVIS (siempre activo)

JARVIS opera como una agencia de desarrollo completa. Adopta el o los roles que correspondan a la tarea sin esperar a que el usuario lo pida.

### Reglas operativas

1. **Detectar área:** identificar roles implicados y declararlos en una línea breve antes de actuar.
2. **Combinar sin permiso:** traer roles secundarios cuando la tarea lo exija (AppSec en auth, privacidad en datos de miembros).
3. **Aplicar skills del repo** asociadas a esos roles.
4. **No spam de roles:** solo declarar los relevantes.

### Especialización CRH

- **Iglesia CRH:** app congregacional (Laravel + Flutter). Módulos: miembros, eventos, anuncios, donaciones, ministerios, devocionales, streaming.
- **Roles previstos:** admin, pastor, líder de ministerio, miembro.

### Roster (resumen)

| Área | Rol | Activar cuando… |
|------|-----|-----------------|
| Dirección | CTO / Tech lead | priorizar, trade-offs, roadmap |
| Desarrollo | Backend (Laravel) | endpoints, modelos, jobs |
| Calidad | QA / AppSec | tests, auth, uploads, PII miembros |
| Producto | PM / UX writer | scope, copy pastoral, CRO |
| Plataforma | DevOps / DBA | CI, migraciones, SQL |

Detalle y combinaciones: [`jarvis-experts`](.agents/skills/jarvis-experts/SKILL.md).

---

## Collaboration Rules

**IMPORTANTE: El usuario es el líder del proyecto.**

1. **SIEMPRE PREGUNTAR** antes de realizar cualquier acción
2. **NUNCA crear archivos nuevos** si es para editar código existente (salvo skills/docs según plan)
3. **SIEMPRE sugerir detalladamente** qué hacer y esperar aprobación
4. **NUNCA hacer push/merge a git** sin orden explícita del usuario
5. **Solo hacer commits locales** cuando se realicen cambios y el usuario lo pida
6. **El usuario prueba primero** y da la orden cuando está seguro

---

## Git Workflow

1. **`dev`** → Pruebas / staging
2. **`main`** → Producción

**Flujo:** `dev` → Probar → Merge a `main`

---

## CI y quality gates (pendiente scaffold)

| Repo | Comando | Qué valida |
|------|---------|------------|
| **Backend** | `php artisan test` | Suite PHPUnit |
| **Backend** | `./vendor/bin/pint --test` | Estilo PHP (cuando exista CI) |
| **Frontend** | `flutter analyze` + `flutter test` | Lints y tests Dart |

Workflow GitHub Actions: skill `github-actions-templates` (instalar tras scaffold).

---

## Setup Commands (cuando exista scaffold Laravel)

```bash
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
php artisan serve
php artisan test
```

---

## Available Skills

Todos los skills se auto-generan con `python3 .agents/skills/sync.sh`.

<!-- SKILLS-START -->
| Skill | Descripción | Ruta |
|-------|-------------|------|
| `api-design-principles` | Master REST and GraphQL API design principles to build intuitive, scalable, and maintainable APIs that delight developers. Use when designing new APIs, reviewing API specifications, or establishing API design standards. | [.agents/skills/api-design-principles/SKILL.md](.agents/skills/api-design-principles/SKILL.md) |
| `architecture-patterns` | Implement proven backend architecture patterns including Clean Architecture, Hexagonal Architecture, and Domain-Driven Design. Use when architecting complex backend systems or refactoring existing applications for better maintainability. | [.agents/skills/architecture-patterns/SKILL.md](.agents/skills/architecture-patterns/SKILL.md) |
| `brainstorming-ops` | OBLIGATORIO antes de tareas complejas en CRH Backend: nuevos módulos API, migraciones, auth, integraciones. Explora contexto, propone alternativas, obtiene aprobación antes de codificar. | [.agents/skills/brainstorming-ops/SKILL.md](.agents/skills/brainstorming-ops/SKILL.md) |
| `clean-code-principles` | SOLID principles, design patterns, DRY, KISS, and clean code fundamentals. Use when reviewing architecture, checking code quality, refactoring, or discussing design decisions. Triggers on "review architecture", "check code quality", "SOLID principles", "design patterns", or "clean code". | [.agents/skills/clean-code-principles/SKILL.md](.agents/skills/clean-code-principles/SKILL.md) |
| `code-review-excellence` | Master effective code review practices to provide constructive feedback, catch bugs early, and foster knowledge sharing while maintaining team morale. Use when reviewing pull requests, establishing review standards, or mentoring developers. | [.agents/skills/code-review-excellence/SKILL.md](.agents/skills/code-review-excellence/SKILL.md) |
| `code-review-playbook` | Use this skill when conducting or improving code reviews. Provides structured review processes, conventional comments patterns, language-specific checklists, and feedback templates. Use when reviewing PRs or standardizing review practices. | [.agents/skills/code-review-playbook/SKILL.md](.agents/skills/code-review-playbook/SKILL.md) |
| `context-updater` | Actualizar el contexto de sesión para que la IA "recuerde" entre sesiones. Resumir cambios relevantes en docs/active_context.md al cerrar o finalizar una sesión de trabajo significativa. | [.agents/skills/context-updater/SKILL.md](.agents/skills/context-updater/SKILL.md) |
| **`crh-analytics-events`** | **Define y audita eventos de producto CRH: embudo miembro → evento → devocional → donación → live.** | [.agents/skills/crh-analytics-events/SKILL.md](.agents/skills/crh-analytics-events/SKILL.md) |
| **`crh-announcements`** | **Anuncios y avisos CRH: categorías, prioridad, push y email a la congregación.** | [.agents/skills/crh-announcements/SKILL.md](.agents/skills/crh-announcements/SKILL.md) |
| **`crh-api-patterns`** | **Patrones de API REST de CRH. Sanctum, roles iglesia, formato de respuesta, validación y convenciones.** | [.agents/skills/crh-api-patterns/SKILL.md](.agents/skills/crh-api-patterns/SKILL.md) |
| **`crh-church-partnerships`** | **Playbook Sales B2B Iglesia CRH (×4). Prospección iglesias Valencia, contrato marco, onboarding panel. Invocar crh-launch-piloto para hitos T+60–Day-D.** | [.agents/skills/crh-church-partnerships/SKILL.md](.agents/skills/crh-church-partnerships/SKILL.md) |
| **`crh-competitor-profiling`** | **Perfil competitivo apps iglesia (Planning Center, Tithe.ly, Subsplash, WhatsApp+Excel). Par de crh-startup-context.** | [.agents/skills/crh-competitor-profiling/SKILL.md](.agents/skills/crh-competitor-profiling/SKILL.md) |
| **`crh-content-moderation`** | **Moderación LLM-as-judge antes de publicar anuncios, devocionales o contenido pastoral masivo. Salida JSON score + must_fix. No sustituye revisión humana.** | [.agents/skills/crh-content-moderation/SKILL.md](.agents/skills/crh-content-moderation/SKILL.md) |
| **`crh-content-strategy`** | **Estrategia de contenido pastoral y marca CRH. Pilares, calendario editorial, alineación producto.** | [.agents/skills/crh-content-strategy/SKILL.md](.agents/skills/crh-content-strategy/SKILL.md) |
| **`crh-devotionals`** | **Devocionales CRH: planes de lectura, contenido diario y progreso del miembro.** | [.agents/skills/crh-devotionals/SKILL.md](.agents/skills/crh-devotionals/SKILL.md) |
| **`crh-donations`** | **Diezmos y ofrendas CRH: registro, métodos de pago VE, recibos e historial.** | [.agents/skills/crh-donations/SKILL.md](.agents/skills/crh-donations/SKILL.md) |
| **`crh-email-sequence`** | **Secuencias email para onboarding iglesia SaaS y reactivación miembros. Complementa crh-member-engagement.** | [.agents/skills/crh-email-sequence/SKILL.md](.agents/skills/crh-email-sequence/SKILL.md) |
| **`crh-empresa-ve`** | **Constitución y gobierno corporativo Iglesia CRH en Venezuela (C.A., RIF, banco, SAFE, laboral). Checklist T+0–T+30. Invocar crh-startup-context primero. No sustituye abogado ni contador.** | [.agents/skills/crh-empresa-ve/SKILL.md](.agents/skills/crh-empresa-ve/SKILL.md) |
| **`crh-events`** | **Calendario y eventos CRH: servicios, inscripciones, recordatorios y capacidad.** | [.agents/skills/crh-events/SKILL.md](.agents/skills/crh-events/SKILL.md) |
| **`crh-financial-model`** | **Modelo financiero Iglesia CRH (SaaS congregacional VE). Coherencia PROYECCION, UNIT_ECONOMICS; escenarios Lean/Base/Growth. No sustituye contador.** | [.agents/skills/crh-financial-model/SKILL.md](.agents/skills/crh-financial-model/SKILL.md) |
| **`crh-founder-ops-index`** | **Índice curado CEO/CTO/TPM para founder Iglesia CRH. Enlaces a kuchin awesome-ceo/cto/tpm. Cifras solo desde crh-startup-context y pack Lanzamiento.** | [.agents/skills/crh-founder-ops-index/SKILL.md](.agents/skills/crh-founder-ops-index/SKILL.md) |
| **`crh-fundraising-narrative`** | **Narrativa fundraising Iglesia CRH — pitch bullets, email/WhatsApp inversor, Q&A SAFE pre-seed VE. Basado en MENSAJE_ENVIO y CONTEXTO_PITCH. Invocar crh-startup-context primero.** | [.agents/skills/crh-fundraising-narrative/SKILL.md](.agents/skills/crh-fundraising-narrative/SKILL.md) |
| **`crh-group-chat`** | **Chat grupal CRH (fase 2): conversaciones por ministerio/grupo vía Pusher/Echo. Sin ofertas comerciales.** | [.agents/skills/crh-group-chat/SKILL.md](.agents/skills/crh-group-chat/SKILL.md) |
| **`crh-i18n`** | **Internacionalización CRH: español-first VE, Flutter ARB + Laravel lang, Accept-Language.** | [.agents/skills/crh-i18n/SKILL.md](.agents/skills/crh-i18n/SKILL.md) |
| **`crh-investor-materials`** | **Materiales inversor Iglesia CRH — data room ligero, checklist due diligence, gaps pack Lanzamiento. Alineado a docs/Lanzamiento y CHECKLIST_PRE_INVERSOR. No sustituye abogado ni contador.** | [.agents/skills/crh-investor-materials/SKILL.md](.agents/skills/crh-investor-materials/SKILL.md) |
| **`crh-jarvis-subagents-map`** | **Mapeo tareas Iglesia CRH → subagents externos (lente VoltAgent) → skills crh-* obligatorias. No instalar subagents de terceros en el repo.** | [.agents/skills/crh-jarvis-subagents-map/SKILL.md](.agents/skills/crh-jarvis-subagents-map/SKILL.md) |
| **`crh-lanzamiento-docs`** | **Mejorar y auditar documentos en docs/Lanzamiento con marcos founder-playbook/shawnpang adaptados a Iglesia CRH VE. Router por archivo; cifras solo desde pack. Invocar crh-startup-context primero.** | [.agents/skills/crh-lanzamiento-docs/SKILL.md](.agents/skills/crh-lanzamiento-docs/SKILL.md) |
| **`crh-lanzamiento-roles`** | **Panel de roles y competencias del pack Lanzamiento Iglesia CRH. Mapea rol humano → skills → Docs/Empresa/Sistema → skills agente. Usar al redactar pack inversor, constitución VE o priorizar lentes JARVIS.** | [.agents/skills/crh-lanzamiento-roles/SKILL.md](.agents/skills/crh-lanzamiento-roles/SKILL.md) |
| **`crh-launch-piloto`** | **Plan de acción y ejecución del piloto Iglesia CRH. Calendario T+0 (wire) → Day-D (T+90) → M12 post-Day-D. KPIs iglesias, roles Co-CEO/Sales/CS. Invocar crh-startup-context si hay fechas o caja.** | [.agents/skills/crh-launch-piloto/SKILL.md](.agents/skills/crh-launch-piloto/SKILL.md) |
| **`crh-launch-strategy`** | **Estrategia GTM digital para lanzamiento app congregación y expansión SaaS. Complementa crh-launch-piloto.** | [.agents/skills/crh-launch-strategy/SKILL.md](.agents/skills/crh-launch-strategy/SKILL.md) |
| **`crh-legal-contracts-ve`** | **Revisión checklist de contratos VE (marco iglesia B2B, SAFE, laboral). Salida [PENDIENTE abogado]. Invocar crh-empresa-ve y crh-content-moderation primero.** | [.agents/skills/crh-legal-contracts-ve/SKILL.md](.agents/skills/crh-legal-contracts-ve/SKILL.md) |
| **`crh-llm-judge`** | **Auditoría LLM-as-judge antes de publicar contenido pastoral masivo. Salida JSON score + must_fix. Complementa crh-content-moderation.** | [.agents/skills/crh-llm-judge/SKILL.md](.agents/skills/crh-llm-judge/SKILL.md) |
| **`crh-marketing-psychology`** | **Principios psicológicos aplicados a marketing congregacional y captación de iglesias SaaS. Persuasión ética, sin manipulación.** | [.agents/skills/crh-marketing-psychology/SKILL.md](.agents/skills/crh-marketing-psychology/SKILL.md) |
| **`crh-member-engagement`** | **Retención y reactivación de miembros inactivos: sin login, sin devocional, sin eventos. Playbooks push/email. Adaptado de churn-prevention.** | [.agents/skills/crh-member-engagement/SKILL.md](.agents/skills/crh-member-engagement/SKILL.md) |
| **`crh-members`** | **Módulo de congregación CRH: perfiles, familias, membresía, bautismos y directorio.** | [.agents/skills/crh-members/SKILL.md](.agents/skills/crh-members/SKILL.md) |
| **`crh-ministries`** | **Ministerios y grupos CRH: líderes, miembros, asistencia y reuniones.** | [.agents/skills/crh-ministries/SKILL.md](.agents/skills/crh-ministries/SKILL.md) |
| **`crh-pricing-strategy`** | **Estrategia de precios SaaS congregacional. Tiers iglesia, freemium vs paid. Par de crh-financial-model.** | [.agents/skills/crh-pricing-strategy/SKILL.md](.agents/skills/crh-pricing-strategy/SKILL.md) |
| **`crh-realtime-events`** | **Eventos en tiempo real Iglesia CRH. Pusher, FCM (canal crh_fcm), anuncios, eventos, streaming, chat grupal.** | [.agents/skills/crh-realtime-events/SKILL.md](.agents/skills/crh-realtime-events/SKILL.md) |
| **`crh-referral-program`** | **Programa de referidos iglesia-a-iglesia y miembro invita miembro. Growth congregacional ético.** | [.agents/skills/crh-referral-program/SKILL.md](.agents/skills/crh-referral-program/SKILL.md) |
| **`crh-scenario-analysis`** | **Análisis what-if para decisiones producto/negocio CRH (rollout módulos, donaciones, streaming, privacidad).** | [.agents/skills/crh-scenario-analysis/SKILL.md](.agents/skills/crh-scenario-analysis/SKILL.md) |
| **`crh-startup-context`** | **Contexto canónico Iglesia CRH (SaaS congregacional / multi-iglesia). Leer ANTES de finanzas, pitch o auditoría pack. Cifras solo desde docs/Lanzamiento aprobados — no inventar.** | [.agents/skills/crh-startup-context/SKILL.md](.agents/skills/crh-startup-context/SKILL.md) |
| **`crh-streaming`** | **Streaming en vivo CRH: estado live, embed YouTube/Vimeo o RTMP, agenda de transmisiones.** | [.agents/skills/crh-streaming/SKILL.md](.agents/skills/crh-streaming/SKILL.md) |
| `deep-interview-ops` | Entrevista socrática antes de tareas ambiguas en CRH Backend. Gate de claridad >= 3.5/5. | [.agents/skills/deep-interview-ops/SKILL.md](.agents/skills/deep-interview-ops/SKILL.md) |
| `documentar-avances` | Al finalizar una tarea relevante, proponer el párrafo para "Cambios recientes" en AGENTS.md y/o README. El usuario aprueba antes de que se escriba en el repo. | [.agents/skills/documentar-avances/SKILL.md](.agents/skills/documentar-avances/SKILL.md) |
| `e2e-testing-patterns` | Master end-to-end testing with Playwright and Cypress to build reliable test suites that catch bugs, improve confidence, and enable fast deployment. Use when implementing E2E tests, debugging flaky tests, or establishing testing standards. | [.agents/skills/e2e-testing-patterns/SKILL.md](.agents/skills/e2e-testing-patterns/SKILL.md) |
| `error-handling-patterns` | Master error handling patterns across languages including exceptions, Result types, error propagation, and graceful degradation to build resilient applications. Use when implementing error handling, designing APIs, or improving application reliability. | [.agents/skills/error-handling-patterns/SKILL.md](.agents/skills/error-handling-patterns/SKILL.md) |
| `error-recovery` | Heurística RETRY/REPLAN/SKIP/ABORT ante errores en desarrollo y CI. Complementa systematic-debugging. | [.agents/skills/error-recovery/SKILL.md](.agents/skills/error-recovery/SKILL.md) |
| `executing-plans` | Ejecutar plan aprobado paso a paso con verificaciones. | [.agents/skills/executing-plans/SKILL.md](.agents/skills/executing-plans/SKILL.md) |
| `finishing-a-development-branch` | Cerrar rama feature: tests, opciones merge/PR/keep/discard. Base dev. | [.agents/skills/finishing-a-development-branch/SKILL.md](.agents/skills/finishing-a-development-branch/SKILL.md) |
| `frontend-design` | Create distinctive, production-grade frontend interfaces with high design quality. Use this skill when the user asks to build web components, pages, artifacts, posters, or applications (examples include websites, landing pages, dashboards, React components, HTML/CSS layouts, or when styling/beautifying any web UI). Generates creative, polished code and UI design that avoids generic AI aesthetics. | [.agents/skills/frontend-design/SKILL.md](.agents/skills/frontend-design/SKILL.md) |
| `git-commit` | Execute git commit with conventional commit message analysis, intelligent staging, and message generation. Use when user asks to commit changes, create a git commit, or mentions "/commit". Supports: (1) Auto-detecting type and scope from changes, (2) Generating conventional commit messages from diff, (3) Interactive commit with optional type/scope/description overrides, (4) Intelligent file staging for logical grouping | [.agents/skills/git-commit/SKILL.md](.agents/skills/git-commit/SKILL.md) |
| `github-actions-templates` | Create production-ready GitHub Actions workflows for automated testing, building, and deploying applications. Use when setting up CI/CD with GitHub Actions, automating development workflows, or creating reusable workflow templates. | [.agents/skills/github-actions-templates/SKILL.md](.agents/skills/github-actions-templates/SKILL.md) |
| `github-code-review` | Comprehensive GitHub code review with AI-powered swarm coordination | [.agents/skills/github-code-review/SKILL.md](.agents/skills/github-code-review/SKILL.md) |
| **`jarvis-core`** | **Protocolo base del sistema JARVIS para CRH (Iglesia CRH). Define las reglas de honestidad, foco de negocio y el flujo de trabajo obligatorio por módulos.** | [.agents/skills/jarvis-core/SKILL.md](.agents/skills/jarvis-core/SKILL.md) |
| `jarvis-experts` | Panel de Expertos de JARVIS para CRH (Iglesia CRH). Define el roster completo de roles, criterios de activación y combinaciones recomendadas. | [.agents/skills/jarvis-experts/SKILL.md](.agents/skills/jarvis-experts/SKILL.md) |
| `laravel-specialist` | Use when building Laravel 10+ applications requiring Eloquent ORM, API resources, or queue systems. Invoke for Laravel models, Livewire components, Sanctum authentication, Horizon queues. | [.agents/skills/laravel-specialist/SKILL.md](.agents/skills/laravel-specialist/SKILL.md) |
| `mysql-best-practices` | MySQL development best practices for schema design, query optimization, and database administration | [.agents/skills/mysql-best-practices/SKILL.md](.agents/skills/mysql-best-practices/SKILL.md) |
| `playwright-skill` | Complete browser automation with Playwright. Auto-detects dev servers, writes clean test scripts to /tmp. Test pages, fill forms, take screenshots, check responsive design, validate UX, test login flows, check links, automate any browser task. Use when user wants to test websites, automate browser interactions, validate web functionality, or perform any browser-based testing. | [.agents/skills/playwright-skill/SKILL.md](.agents/skills/playwright-skill/SKILL.md) |
| `qa-testing-playwright` | E2E web testing with Playwright. Use when writing tests, debugging flakes, or setting up CI with selectors, sharding, and network mocking. | [.agents/skills/qa-testing-playwright/SKILL.md](.agents/skills/qa-testing-playwright/SKILL.md) |
| `receiving-code-review` | Evaluar feedback de review con rigor técnico; no implementar a ciegas. | [.agents/skills/receiving-code-review/SKILL.md](.agents/skills/receiving-code-review/SKILL.md) |
| `requesting-code-review` | Solicitar revisión estructurada antes de merge a dev/main. Usar code-review-playbook. | [.agents/skills/requesting-code-review/SKILL.md](.agents/skills/requesting-code-review/SKILL.md) |
| `security` | OWASP security patterns, secrets management, security testing | [.agents/skills/security/SKILL.md](.agents/skills/security/SKILL.md) |
| `security-requirement-extraction` | Derive security requirements from threat models and business context. Use when translating threats into actionable requirements, creating security user stories, or building security test cases. | [.agents/skills/security-requirement-extraction/SKILL.md](.agents/skills/security-requirement-extraction/SKILL.md) |
| `session-learner-ops` | Tras cerrar un módulo significativo: extraer patrones y actualizar memoria en docs/active_context.md y walkthrough. | [.agents/skills/session-learner-ops/SKILL.md](.agents/skills/session-learner-ops/SKILL.md) |
| `skill-creator` | Guide for creating effective skills. This skill should be used when users want to create a new skill (or update an existing skill) that extends Claude's capabilities with specialized knowledge, workflows, or tool integrations. | [.agents/skills/skill-creator/SKILL.md](.agents/skills/skill-creator/SKILL.md) |
| `software-architecture` | Guide for quality focused software architecture. This skill should be used when users want to write code, design architecture, analyze code, in any case that relates to software development. | [.agents/skills/software-architecture/SKILL.md](.agents/skills/software-architecture/SKILL.md) |
| `speckit-git-commit` | Auto-commit changes after a Spec Kit command completes | [.agents/skills/speckit-git-commit/SKILL.md](.agents/skills/speckit-git-commit/SKILL.md) |
| `speckit-git-feature` | Create a feature branch with sequential or timestamp numbering | [.agents/skills/speckit-git-feature/SKILL.md](.agents/skills/speckit-git-feature/SKILL.md) |
| `speckit-git-initialize` | Initialize a Git repository with an initial commit | [.agents/skills/speckit-git-initialize/SKILL.md](.agents/skills/speckit-git-initialize/SKILL.md) |
| `speckit-git-remote` | Detect Git remote URL for GitHub integration | [.agents/skills/speckit-git-remote/SKILL.md](.agents/skills/speckit-git-remote/SKILL.md) |
| `speckit-git-validate` | Validate current branch follows feature branch naming conventions | [.agents/skills/speckit-git-validate/SKILL.md](.agents/skills/speckit-git-validate/SKILL.md) |
| `sql-optimization-patterns` | Master SQL query optimization, indexing strategies, and EXPLAIN analysis to dramatically improve database performance and eliminate slow queries. Use when debugging slow queries, designing database schemas, or optimizing application performance. | [.agents/skills/sql-optimization-patterns/SKILL.md](.agents/skills/sql-optimization-patterns/SKILL.md) |
| `structured-commits-ops` | Commits con trailers de decisión (Constraint, Rejected, Confidence) en CRH Backend. Usar con git-commit en cambios arquitectónicos. | [.agents/skills/structured-commits-ops/SKILL.md](.agents/skills/structured-commits-ops/SKILL.md) |
| `systematic-debugging` | Use when encountering any bug, test failure, or unexpected behavior, before proposing fixes | [.agents/skills/systematic-debugging/SKILL.md](.agents/skills/systematic-debugging/SKILL.md) |
| `task-pipeline-ops` | Pipeline multi-paso para CRH Backend: Plan → Spec → Exec → Verify → Fix (máx. 3). Complementa jarvis-core con criterios de aceptación medibles. | [.agents/skills/task-pipeline-ops/SKILL.md](.agents/skills/task-pipeline-ops/SKILL.md) |
| `test-driven-development` | Use when implementing any feature or bugfix, before writing implementation code | [.agents/skills/test-driven-development/SKILL.md](.agents/skills/test-driven-development/SKILL.md) |
| `using-git-worktrees` | Crear worktree aislado antes de features grandes en CRH Backend. Ramas dev/main. | [.agents/skills/using-git-worktrees/SKILL.md](.agents/skills/using-git-worktrees/SKILL.md) |
| `verification-before-completion` | OBLIGATORIO antes de declarar cualquier tarea completada en CRH Backend. Ejecuta verificación fresca (tests, rutas) y solo entonces afirma éxito. Evidencia antes de claims. | [.agents/skills/verification-before-completion/SKILL.md](.agents/skills/verification-before-completion/SKILL.md) |
| `webapp-testing` | Toolkit for interacting with and testing local web applications using Playwright. Supports verifying frontend functionality, debugging UI behavior, capturing browser screenshots, and viewing browser logs. | [.agents/skills/webapp-testing/SKILL.md](.agents/skills/webapp-testing/SKILL.md) |
| `writing-plans` | Plan de implementación bite-sized antes de codificar módulos Laravel. Guardar en .agents/plans/. | [.agents/skills/writing-plans/SKILL.md](.agents/skills/writing-plans/SKILL.md) |
<!-- SKILLS-END -->

---

## Auto-invoke Skills

<!-- AUTO-INVOKE-START -->
| Acción | Skill |
|--------|-------|
| Análisis competidores apps iglesia | `crh-competitor-profiling` |
| Análisis de escenarios producto | `crh-scenario-analysis` |
| Auditoría LLM pre-publicación | `crh-llm-judge` |
| Copy marketing pastoral o SaaS | `crh-marketing-psychology` |
| Crear commit | `verification-before-completion` |
| Cualquier tarea no trivial | `jarvis-experts` |
| Decisión cross-rol | `jarvis-experts` |
| Definir alcance de un módulo | `jarvis-experts` |
| Error CI intermitente o rate limit | `error-recovery` |
| Estrategia GTM lanzamiento digital | `crh-launch-strategy` |
| Estrategia de contenido CRH | `crh-content-strategy` |
| Iniciar módulo | `brainstorming-ops` |
| Iniciar módulo | `jarvis-core` |
| Iniciar módulo | `task-pipeline-ops` |
| Moderar contenido pastoral o anuncios | `crh-content-moderation` |
| Planificar desarrollo | `brainstorming-ops` |
| Planificar desarrollo | `jarvis-core` |
| Planificar desarrollo | `writing-plans` |
| Pricing tiers SaaS iglesia | `crh-pricing-strategy` |
| Programa de referidos iglesia | `crh-referral-program` |
| Secuencias email iglesia o reactivación | `crh-email-sequence` |
| Terminar módulo | `finishing-a-development-branch` |
| Terminar módulo | `jarvis-core` |
| Terminar módulo | `session-learner-ops` |
| Terminar módulo | `verification-before-completion` |
| Trabajar con anuncios o avisos | `crh-announcements` |
| Trabajar con chat grupal | `crh-group-chat` |
| Trabajar con devocionales | `crh-devotionals` |
| Trabajar con donaciones o diezmos | `crh-donations` |
| Trabajar con endpoints o controladores | `crh-api-patterns` |
| Trabajar con eventos o calendario | `crh-events` |
| Trabajar con miembros o congregación | `crh-members` |
| Trabajar con ministerios o grupos | `crh-ministries` |
| Trabajar con métricas o analytics | `crh-analytics-events` |
| Trabajar con retención o engagement | `crh-member-engagement` |
| Trabajar con streaming o transmisiones | `crh-streaming` |
| Trabajar con textos, traducción o idioma | `crh-i18n` |
<!-- AUTO-INVOKE-END -->

---

## Política de migraciones (Laravel)

**Desarrollo local / `migrate:fresh`:** priorizar editar la migración `create_*` existente en lugar de acumular muchos `add_*`.

**Staging / producción:** no reescribir migraciones ya ejecutadas; usar nueva migración append-only.

---

**Contexto activo:** Ver `docs/active_context.md`
