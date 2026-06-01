# Tasks: [FEATURE NAME] — Work Packages

**Feature**: specs/00N-feature-name
**Input**: spec.md, plan.md

## WP summary

| WP | Title | Owner | Lane | Tasks |
|----|-------|-------|------|-------|
| WP01 | [Setup / scaffold] | backend | planned | T001–T004 |
| WP02 | [US1 backend] | backend | planned | T005–T009 |
| WP03 | [US1 front] | front | planned | T007–T010 |
| WP04 | [Polish] | dual | planned | T013–T014 |

**Lanes:** `planned` | `in_progress` | `for_review` | `approved` | `done` | `blocked`

Obligatorio WP table cuando la feature tiene **>5 tasks** o cruza Backend + Front.

## Phase 1 — Setup

- [ ] T001 … **Lane:** planned → in_progress when started

## Dependencies

[From plan.md — WP02 blocked until WP01 done, etc.]

## Review / accept / closeout

1. `/speckit-review 00N` — all WPs → `for_review`
2. `/speckit-accept 00N` — gates pass → `approved`
3. Merge/PR via `finishing-a-development-branch` (user OK)
4. `/speckit-closeout 00N` — retrospective.md

---
*CRH dual-repo — prefixes `backend:` / `front:` on every path task*
