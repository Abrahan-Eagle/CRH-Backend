# Work Package: WP[NN] — [TITLE]

**Feature**: specs/00N-feature-name
**Lane**: planned | in_progress | for_review | approved | done | blocked
**Owner repo**: backend | front | dual
**Branch / worktree**: [optional — see `using-git-worktrees`]

## Owned paths

| Repo | Paths |
|------|-------|
| backend: | `app/...`, `tests/Feature/...` |
| front: | `../CRH-Frontend/lib/...`, `../CRH-Frontend/test/...` |

## Goal

[One paragraph — what this WP delivers independently]

## Subtasks

- [ ] [Txxx] description
- [ ] [Txxx] description

## Independent test

[How to verify this WP alone — `php artisan test --filter=` / `flutter test`]

## Lane transitions (CRH subset)

```
planned → in_progress → for_review → approved → done
              ↓ blocked (reason required)
```

Update lane in `tasks.md` WP table when status changes.

---
*WP template — CRH mission workflow (adapted from spec-kitty status model, simplified)*
