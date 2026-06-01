---
name: crh-jarvis-subagents-map
description: Mapeo tareas Iglesia CRH → subagents externos (lente VoltAgent) → skills crh-* obligatorias. No instalar subagents de terceros en el repo.
---

# crh-jarvis-subagents-map

Orquestación JARVIS: los subagents de [VoltAgent/awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents) son **lente opcional**; el canon operativo y de negocio está en skills `crh-*` locales y `jarvis-core`.

## Reglas

1. **Siempre** invocar la skill `crh-*` (o proceso Jarvis) de la columna «Canon obligatorio».
2. El subagent externo solo aporta estructura de revisión o checklist genérica — no cifras ni legal sin skill CRH.
3. **No copiar** definiciones de subagents al repo sin revisar licencia y relevancia.

## Mapeo por tarea

| Tarea CRH | Rol humano | Subagent lente (VoltAgent) | Canon obligatorio |
|-----------|------------|----------------------------|-------------------|
| Nueva feature producto API+Flutter | CTO, PM | — | Spec Kit + `crh-api-patterns`, `jarvis-core` |
| Auditar pack inversor / gaps SaaS | CFO, IR | — | `crh-startup-context`, `crh-investor-materials`, `crh-financial-model` |
| Pitch / email inversor multi-iglesia | IR, Founder | — | `crh-fundraising-narrative`, `crh-investor-materials` |
| Constitución / contratos VE | Legal | — | `crh-empresa-ve`, `crh-legal-contracts-ve` |
| Alianza iglesia / denominación B2B | Legal, Pastoral | — | `crh-church-partnerships`, `crh-legal-contracts-ve` |
| Plan lanzamiento app congregación | Pastor, PM | project-manager (lente) | `crh-launch-piloto`, `crh-lanzamiento-roles` |
| Pack docs/Lanzamiento | Founder | — | `crh-lanzamiento-docs`, `crh-startup-context` |
| API Laravel congregacional | CTO | laravel-specialist, api-designer | `crh-api-patterns`, `laravel-specialist` |
| UI Flutter miembro/líder | CPO, UX | flutter-expert, mobile-developer | `crh-ui-design`, `crh-flutter-arch`, `crh-i18n` |
| Textos / idioma / traducción app | UX, Dev | — | `crh-i18n`, `crh-ui-design` |
| Onboarding / activación | UX, PM | — | `crh-onboarding-cro`, `crh-signup-flow-cro`, `crh-onboarding-ui` |
| Donaciones | AppSec, Finanzas | — | `crh-donations`, `crh-realtime-events` |
| Inscripciones / check-in eventos | Pastor, Líder | — | `crh-events`, `crh-realtime-events` |
| Push / streaming / eventos live | Mobile, SRE | — | `crh-realtime-events`, `crh-streaming` |
| Chat ministerios (fase 2) | Backend, Mobile | — | `crh-group-chat`, `crh-realtime-events` |
| Moderación contenido pastoral | PM, AppSec | — | `crh-content-moderation`, `crh-llm-judge` |
| Auditoría LLM pre-publicación | PM, AppSec | — | `crh-llm-judge`, `crh-content-moderation` |
| Error CI / rate limit / credenciales | Dev, SRE | debugger (lente) | `error-recovery`, `systematic-debugging` |
| Estrategia marketing SaaS / GTM | PM, Founder | — | `crh-launch-strategy`, `crh-content-strategy`, `crh-marketing-psychology` |
| Pricing tiers iglesia | CFO, Founder | — | `crh-pricing-strategy`, `crh-financial-model`, `crh-startup-context` |
| Competidores apps iglesia | PM, Sales | — | `crh-competitor-profiling`, `crh-fundraising-narrative` |
| Email onboarding / reactivación | PM, CS | — | `crh-email-sequence`, `crh-member-engagement` |
| Programa referidos | Growth, Sales | — | `crh-referral-program`, `crh-church-partnerships` |
| Retención miembros inactivos | PM, Data | data-analyst (lente) | `crh-member-engagement`, `crh-analytics-events` |
| Seguridad auth / PII miembros | CISO | security-auditor (lente) | `security`, `security-requirement-extraction`, `crh-members` |
| Verificación pre-merge / tests | QA | verifier, test-runner (lente MVP hermano) | `verification-before-completion`, `laravel-specialist` |
| Contrato API back/front | Backend, Mobile | api-contract-checker (lente MVP hermano) | `crh-api-patterns`, `requesting-code-review` |
| Bugfix puntual | Dev | debugger (lente) | `systematic-debugging`, `task-pipeline-ops` |
| Cierre sesión / memoria | — | — | `context-updater`, `session-learner-ops` |
| Cambios recientes AGENTS | — | — | `documentar-avances` |

## Modelo sugerido (Opus vs Sonnet)

Tareas profundas (arquitectura, seguridad, finanzas SaaS) → modelo con más razonamiento; implementación rutinaria → modelo rápido.

## Skills relacionadas

- `jarvis-experts`
- `crh-lanzamiento-roles`
- [docs/crh/SPEC_KIT_CRH.md](../../docs/crh/SPEC_KIT_CRH.md)
- [docs/crh/ORQUESTACION_MULTIAGENTE.md](../../docs/crh/ORQUESTACION_MULTIAGENTE.md)
- [docs/crh/FORENSE_CLAWVIS_RESUMEN.md](../../docs/crh/FORENSE_CLAWVIS_RESUMEN.md)
- [docs/crh/FORENSE_STRANGEVERSE_RESUMEN.md](../../docs/crh/FORENSE_STRANGEVERSE_RESUMEN.md)
- [docs/crh/FORENSE_ZONIX_EATS_RESUMEN.md](../../docs/crh/FORENSE_ZONIX_EATS_RESUMEN.md)
