# Tasks: Auth + Member Registration

**Input**: [spec.md](./spec.md), [plan.md](./plan.md)

**Prerequisites**: Laravel + Flutter scaffold on branch `dev`

## Work Packages

| WP | Title | Owner | Lane | Tasks |
|----|-------|-------|------|-------|
| WP01 | Setup + constitution review | dual | planned | T001–T002 |
| WP02 | Foundational scaffold | dual | planned | T003–T004 |
| WP03 | US1 — Register & Login (Backend) | backend | planned | T005–T006, T009 |
| WP04 | US1 — Register & Login (Front) | front | planned | T007–T008, T010 |
| WP05 | US2 — Profile | dual | planned | T011–T012 |
| WP06 | Polish + closeout | dual | planned | T013–T014 |

**Lanes:** `planned` | `in_progress` | `for_review` | `approved` | `done` | `blocked`

**Closeout:** `/speckit-review 001` → `/speckit-accept 001` → merge (user OK) → `/speckit-closeout 001`

## Phase 1: Setup

- [ ] T001 Confirm branch `001-auth-members` or implement on `dev` per user decision
- [ ] T002 [P] Review constitution; invoke `crh-members`, `crh-api-patterns`, `crh-signup-flow-cro`

## Phase 2: Foundational (Blocking)

- [ ] T003 backend: Scaffold Laravel if not done (`composer create-project`, Sanctum install)
- [ ] T004 [P] front: Scaffold Flutter if not done (`flutter create`, Provider setup)

## Phase 3: User Story 1 — Register & Login (P1)

- [ ] T005 [US1] backend: `AuthController` register/login/logout + Form Requests
- [ ] T006 [P] [US1] backend: Sanctum config + rate limiting middleware
- [ ] T007 [US1] front: `login_screen.dart`, `register_screen.dart`, `auth_service.dart`
- [ ] T008 [P] [US1] front: Token storage + `UserProvider`
- [ ] T009 [US1] backend: `php artisan test --filter=AuthTest`
- [ ] T010 [P] [US1] front: `flutter test test/auth/`

## Phase 4: User Story 2 — Profile (P2)

- [ ] T011 [US2] backend: Profile GET/PUT endpoints + validation
- [ ] T012 [P] [US2] front: Profile completion step in onboarding flow

## Phase 5: Polish

- [ ] T013 Run pint + full test suites on touched files
- [ ] T014 Update `docs/active_context.md` (user approval)
