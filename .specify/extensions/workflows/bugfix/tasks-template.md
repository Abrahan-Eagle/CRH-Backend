# Tasks: [BUG TITLE]

**Bug ID**: bugfix-###
**Branch**: `bugfix/###-short-description`

## Phase 1 — Analyze and reproduce
- [ ] T001 Reproduce bug locally (Backend and/or Frontend)
- [ ] T002 Document root cause in `bug-report.md`

## Phase 2 — Regression test (BEFORE fix)
- [ ] T003 `backend:` Write failing PHPUnit test — `tests/Feature/...`
- [ ] T004 `front:` Write failing widget/unit test — `../CRH-Frontend/test/...`
- [ ] T005 Confirm tests fail on current code

## Phase 3 — Fix
- [ ] T006 `backend:` Apply minimal fix
- [ ] T007 `front:` Apply minimal fix (if UI/API client)
- [ ] T008 Confirm regression tests pass

## Phase 4 — Verify
- [ ] T009 Run `php artisan test` (scoped or full)
- [ ] T010 Run `flutter test` / `flutter analyze` on touched Front files
- [ ] T011 Manual verification on device/emulator

---
*Quality gate: regression test before fix (constitution §VI)*
