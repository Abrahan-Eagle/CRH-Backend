# Forense: spec-kit-extensions → CRH

> **Fecha:** 2026-06-01  
> **Upstream:** [MartyBonacci/spec-kit-extensions](https://github.com/MartyBonacci/spec-kit-extensions) (MIT)  
> **Base CRH:** Spec Kit v0.8.15 + extensión `git` en `.specify/extensions/git/`

## Veredicto

Adoptados **3 workflows** (bugfix, modify, hotfix) para cubrir ~75% del trabajo SDD que antes iba solo a Jarvis clásico sin artefactos en `specs/`.

## Inventario

| Componente upstream | CRH | Notas |
|---------------------|-----|-------|
| **bugfix** | ✅ Adoptado | Regresión antes del fix |
| **modify** | ✅ Adoptado | Impact analysis + `specs/00N/modifications/` |
| **hotfix** | ✅ Adoptado | Test-after-fix P0/P1; post-mortem ≤48h |
| refactor | ⏸ Fase 2 | YAGNI — sin scaffold Laravel/Flutter |
| deprecate | ⏸ Fase 2 | Sin features en producción |
| SpecSwarm | ❌ No | Claude Code only; CRH = Cursor `.cursor/skills/` |
| Constitution Tweeter | ❌ No | Dominio ajeno |
| `.github/copilot-instructions.md` | ❌ No | CRH usa Cursor skills |
| Submodule upstream | ❌ No | Copy/adapt forense |

## Ubicación en CRH

```
CRH-Backend/.specify/
├── extensions/
│   ├── enabled.conf
│   └── workflows/
│       ├── bugfix/   (bug-report-template, tasks-template, command.md)
│       ├── modify/   (modification-spec-template, impact-analysis-template, scan-impact.sh)
│       └── hotfix/   (hotfix-report-template, post-mortem-template)
└── scripts/bash/
    ├── create-bugfix.sh
    ├── create-modification.sh
    └── create-hotfix.sh
```

Skills Cursor: `.cursor/skills/speckit-{bugfix,modify,hotfix}/` (espejo en CRH-Frontend).

## Decision tree

```
¿Nueva capacidad producto?
  → /speckit-specify

¿Bug en comportamiento existente?
  ¿Necesita spec + regresión en specs/?
    Sí → /speckit-bugfix
    No (1 archivo, typo) → task-pipeline-ops

¿Cambio intencional a feature 00N?
  → /speckit-modify 00N

¿P0/P1 producción?
  → /speckit-hotfix → post-mortem ≤48h → follow-up /speckit-bugfix

¿Pack Lanzamiento / inversor?
  → crh-lanzamiento-docs (NO Spec Kit)
```

## Wiring Jarvis

| Quality gate | Skill CRH |
|--------------|-----------|
| Regression test first | `test-driven-development` |
| Root cause | `systematic-debugging` |
| Pre-merge verify | `verification-before-completion` |
| Modify API | `crh-api-patterns`, `requesting-code-review` |
| Hotfix CI flake | `error-recovery` |

## Constitution

Amend **v1.1.0** — §VI Workflow Selection en [.specify/memory/constitution.md](../../.specify/memory/constitution.md).

## Convenciones CRH

- Skills con guión: `speckit-bugfix` (no `speckit.bugfix`)
- Hub specs: **CRH-Backend** `specs/`
- Dual-repo en templates: prefijos `backend:` / `front:` (../CRH-Frontend)
- Tests: `php artisan test --filter=` / `flutter test`

## Hooks git

La extensión `git` aplica hooks en flujo feature (`before_specify`). Los scripts bugfix/modify/hotfix crean ramas propias (`bugfix/`, `00N-mod-`, `hotfix/`); no reutilizan `create-new-feature.sh`.

## Verificación

```bash
cd CRH-Backend
.specify/scripts/bash/create-bugfix.sh "test workflow" --json
# → specs/bugfix-001-test-workflow/ + rama bugfix/001-test-workflow
```

## Licencia upstream

MIT — [spec-kit-extensions](https://github.com/MartyBonacci/spec-kit-extensions)
