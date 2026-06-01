# Accept Checklist: [FEATURE 00N]

**Feature**: specs/00N-feature-name
**Accept date**: [DATE]
**Pre-merge gate** — run before merge/PR (`finishing-a-development-branch`)

## Verification (mandatory)

- [ ] `php artisan test` — pass (scoped or full on touched Backend)
- [ ] `flutter test` / `flutter analyze` — pass on touched Front
- [ ] `verification-before-completion` — fresh evidence captured
- [ ] User tested on device/emulator (CRH rule)

## Constitution gates

- [ ] Sanctum/auth patterns if auth touched
- [ ] API response envelope unchanged or migration documented
- [ ] No secrets in diff
- [ ] **No auto-merge** — user explicit OK for merge/push

## Work packages → approved

| WP | Lane | Evidence |
|----|------|----------|
| WP01 | approved | [test command / screenshot] |
| WP02 | approved | |

## Merge readiness

- [ ] Branch targets **`dev`** (default) unless user ordered `main`
- [ ] Worktree cleanup planned if used
- [ ] `docs/active_context.md` update proposed (user approval)

## Outcome

- [ ] **Accepted** — offer merge options via `finishing-a-development-branch`
- [ ] **Blocked** — reason:

---
*Accept ≠ merge. User chooses merge/PR/discards.*
