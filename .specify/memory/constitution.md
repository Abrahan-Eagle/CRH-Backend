# Iglesia CRH Constitution

> **Hub SDD:** CRH-Backend (`specs/`, `.specify/`).  
> **Canon largo:** [AGENTS.md](../../AGENTS.md), [.cursorrules](../../.cursorrules).  
> **Front hermano:** `../CRH-Frontend` — rutas Flutter en planes/tasks con prefijo explícito.

**Version**: 1.2.0 | **Ratified**: 2026-06-01 | **Last Amended**: 2026-06-01

---

## I. Collaboration & Governance (NON-NEGOTIABLE)

1. **User leads the project** — ask before acting; propose diffs; wait for explicit OK before editing multiple files or implementing `/speckit-implement`.
2. **No git push/merge** without explicit user order; local commits only when requested.
3. **User tests first** before production deploy claims.
4. **Session context:** read `docs/active_context.md` when resuming work.
5. **Jarvis skills** (`.agents/skills/jarvis-core`, `jarvis-experts`, `crh-*`) remain mandatory for domain logic; Spec Kit (`.cursor/skills/speckit-*`) governs SDD workflow only.
6. **Do not use Spec Kit** for `docs/Lanzamiento/` (investor pack, financial figures) — use `crh-lanzamiento-docs` + `crh-startup-context`.

---

## II. Dual-Repository Architecture

| Repo | Role | Stack |
|------|------|-------|
| **CRH-Backend** | API hub, specs canon, Laravel | PHP 8.1+, Laravel 10, MySQL, Sanctum |
| **CRH-Frontend** | Mobile client | Flutter ≥3.5, Dart 3.5+, Provider |

- Feature specs live in **Backend** `specs/00N-feature-name/`.
- Every plan and task list MUST include **Backend paths** and **Frontend paths** when the feature touches UI.
- API contract changes require alignment with `crh-api-patterns` response envelope.

---

## III. Backend Engineering Principles

1. **Business logic in Services**, not Controllers.
2. **Form Requests** for all input validation.
3. **`DB::transaction()`** for critical multi-step writes.
4. **Eager loading** (`with()`) — no N+1 on list endpoints.
5. **Paginate** all list endpoints.
6. **API response pattern:**
   ```json
   { "success": true|false, "data": {}, "message": "" }
   ```
7. **Migrations (local/dev):** prefer editing original `create_*` migration; append-only in staging/prod per AGENTS.md policy.
8. **Uploads:** max 5MB; allowed MIME types only; moderate pastoral content per `crh-content-moderation`.
9. **PII miembros:** minimizar exposición; AppSec en auth y exports.

### CRH domain modules (MVP)

| Módulo | Skill |
|--------|-------|
| Miembros / auth | `crh-members`, `crh-api-patterns` |
| Eventos | `crh-events` |
| Anuncios | `crh-announcements` |
| Donaciones | `crh-donations` |
| Ministerios | `crh-ministries` |
| Devocionales | `crh-devotionals` |
| Streaming | `crh-streaming` |
| Chat grupal (fase 2) | `crh-group-chat`, `crh-realtime-events` |

**Roles:** `admin`, `pastor`, `leader`, `member`.

**Realtime:** Pusher + FCM (`crh_fcm`) — **NO WebSocket directo**.

---

## IV. Frontend Engineering Principles

1. **`AppConfig.apiUrl`** — never hardcode API URLs.
2. **Provider (ChangeNotifier)** for state management.
3. **Colors:** theme tokens / `crh-ui-design` — no raw `Colors.*` in feature screens.
4. **Onboarding:** `crh-onboarding-cro` + `crh-onboarding-ui` + `crh-signup-flow-cro`.
5. **Pastoral tone:** copy accesible; no lenguaje comercial agresivo (ver `docs/BRAND_CRH.md`).

---

## V. Quality Gates

| Repo | Command | Gate |
|------|---------|------|
| Backend | `./vendor/bin/pint --test` | Must pass on touched PHP (post-scaffold) |
| Backend | `php artisan test` | Must pass; use `--filter=` for scoped runs |
| Frontend | `flutter analyze --no-fatal-infos` | No new errors/warnings in touched files |
| Frontend | `flutter test` | Must pass |

Do not claim completion without running relevant gates.

---

## VI. Spec-Driven Workflow (Spec Kit)

### Workflow selection (constitution v1.2.0)

| Workflow | Command | When | Test order |
|----------|---------|------|------------|
| **Feature** | `/speckit-specify` … implement → review → accept → closeout | New product capability | Spec → plan → TDD in implement |
| **Bugfix** | `/speckit-bugfix` → plan → tasks → implement | Defect with regression spec in `specs/bugfix-NNN/` | **Regression test before fix** |
| **Modify** | `/speckit-modify 00N` → plan → tasks → implement | Change existing feature; **delta spec** — read code first | TDD per plan |
| **Hotfix** | `/speckit-hotfix` → plan → tasks → implement | P0/P1 production emergency | Test **after** fix; post-mortem ≤48h |
| **Lanzamiento / inversor** | `crh-lanzamiento-docs` | Pack startup, cifras | **Not** Spec Kit |
| **Trivial bug** (1 file, typo) | `task-pipeline-ops` + `systematic-debugging` | No spec artifact needed | Ad hoc |

**Modify philosophy (spec-kitty adapted):** For `/speckit-modify`, the modification spec describes the **delta** from current code. Read implementation before plan; code is ground truth for "what exists now."

**Work Packages:** Features with >5 tasks or dual-repo SHOULD use WP lanes in `tasks.md`: `planned` | `in_progress` | `for_review` | `approved` | `done` | `blocked`.

**Mission closeout (features):** After implement → `/speckit-review` → `/speckit-accept` → merge/PR (**user OK only**) → `/speckit-closeout` with `retrospective.md` ≤48h post-merge.

**Anti auto-merge:** Never auto-commit or auto-merge (no upstream `auto_commit`). User explicit OK required.

Branch naming:
- Feature: `00N-short-description` (e.g. `001-auth-members`)
- Bugfix: `bugfix/NNN-desc`
- Modify: `00N-mod-MMM-desc`
- Hotfix: `hotfix/NNN-desc`

### Feature SDD sequence

1. `/speckit-constitution` — this file (amend with user approval).
2. `/speckit-specify` — what & why (no tech stack in first pass).
3. `/speckit-clarify` — before plan when ambiguous.
4. `/speckit-plan` — Laravel + Flutter paths, contracts, data model.
5. `/speckit-tasks` — ordered tasks with file paths; `[P]` for parallel-safe; prefixes `backend:` / `front:`.
6. `/speckit-analyze` — consistency check before implement.
7. `/speckit-implement` — **only after user OK**; respect Jarvis collaboration rules.
8. `/speckit-review` → `/speckit-accept` — artifact + test gates before merge.
9. `/speckit-closeout` — `retrospective.md` post-merge; invoke `session-learner-ops`.

**Extension workflows:** `.specify/extensions/workflows/` (bugfix, modify, hotfix, mission). Enabled list: `.specify/extensions/enabled.conf`.

**Router Jarvis:** see [docs/crh/SPEC_KIT_CRH.md](../../docs/crh/SPEC_KIT_CRH.md) and `jarvis-core`.

---

## VII. Auto-Invoke Skills (by task type)

| Task | Skills |
|------|--------|
| API / controllers / routes | `laravel-specialist`, `crh-api-patterns` |
| Miembros / perfiles | `crh-members` |
| Eventos / anuncios | `crh-events`, `crh-announcements` |
| Donaciones | `crh-donations` |
| Pusher / FCM | `crh-realtime-events` |
| Flutter screens | `flutter-expert`, `crh-ui-design` |
| CRO onboarding | `crh-onboarding-cro`, `crh-signup-flow-cro` |
| Pack inversor / SaaS | `crh-startup-context`, `crh-lanzamiento-docs` |

Full matrix: [AGENTS.md](../../AGENTS.md) § Auto-invoke Skills + [crh-jarvis-subagents-map](../../.agents/skills/crh-jarvis-subagents-map/SKILL.md).

---

## VIII. Key Reference Documents

- [docs/BRAND_CRH.md](../../docs/BRAND_CRH.md)
- [docs/PRODUCT_VISION.md](../../docs/PRODUCT_VISION.md)
- [docs/MODULES.md](../../docs/MODULES.md)
- [docs/product-marketing-context.md](../../docs/product-marketing-context.md)
- [docs/crh/SPEC_KIT_CRH.md](../../docs/crh/SPEC_KIT_CRH.md) — router speckit vs Jarvis

---

## Governance

- This constitution is the **executable summary** for Spec Kit phases; `AGENTS.md` remains the detailed canon.
- Amendments require user approval and version bump in the header.
- Complexity beyond these rules must be justified in plan § Complexity Tracking.
