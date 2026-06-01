# Forense: spec-kitty → CRH (subset)

> **Fecha:** 2026-06-01  
> **Upstream:** [Priivacy-ai/spec-kitty](https://github.com/Priivacy-ai/spec-kitty) (MIT, `spec-kitty-cli` v3.1.x)  
> **CRH base:** Spec Kit v0.8.15 + spec-kit-extensions + constitution v1.2.0

## Veredicto

**No instalar spec-kitty CLI.** Adoptados **patrones de misión** (WP lanes, review/accept/closeout, retrospectiva) sobre el hub `specs/` existente.

## Inventario

| Componente upstream | CRH | Notas |
|---------------------|-----|-------|
| WP lane model (6 lanes) | Adoptado | Markdown en `tasks.md` |
| review → accept → closeout | Adoptado | `speckit-review`, `speckit-accept`, `speckit-closeout` |
| Retrospective | Adoptado | `retrospective-template.md` |
| Delta-spec (modify) | Parcial | constitution v1.2.0 + `/speckit-modify` |
| Dual-repo WP ownership | Adoptado | `backend:` / `front:` / `dual` |
| CLI `spec-kitty-cli` | No | Conflicto con `.specify/` |
| `kitty-specs/`, `.kittify/` | No | Hub canon `specs/` |
| `status.events.jsonl` | Diferir fase 3 | Sin CLI |
| Dashboard kanban | Diferir fase 3 | Post-piloto |
| auto-merge / auto-commit | No | Prohibido CRH |
| `/spec-kitty.*` commands | No | Convención `speckit-*` |

## Ubicación en CRH

```
CRH-Backend/.specify/extensions/workflows/mission/
├── work-package-template.md
├── tasks-wp-template.md
├── review-checklist-template.md
├── accept-checklist-template.md
├── retrospective-template.md
└── command.md
```

Skills: `.cursor/skills/speckit-{review,accept,closeout}/` (espejo Frontend).

## Decision tree

```
Feature nueva:
  speckit-specify → plan → tasks → implement
  → speckit-review → speckit-accept → merge (user OK)
  → speckit-closeout

Modify:
  speckit-modify (delta spec — leer código primero)

Bugfix/hotfix:
  extensions workflow; closeout opcional (hotfix: post-mortem obligatorio)
```

## Flujo extendido

```
/speckit-implement
  → /speckit-review 00N
  → /speckit-accept 00N
  → finishing-a-development-branch
  → /speckit-closeout 00N
```

## Wiring Jarvis

| Patrón | Skill CRH |
|--------|-----------|
| Review | `requesting-code-review`, `code-review-playbook` |
| Accept | `verification-before-completion` |
| Closeout | `session-learner-ops`, `documentar-avances` |
| WP worktree | `using-git-worktrees` |

## Licencia upstream

MIT — [spec-kitty](https://github.com/Priivacy-ai/spec-kitty)
