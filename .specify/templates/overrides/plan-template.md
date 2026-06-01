# Implementation Plan: [FEATURE]

**Branch**: `[###-feature-name]` | **Date**: [DATE] | **Spec**: [link]

**Input**: Feature specification from `/specs/[###-feature-name]/spec.md`

**Hub**: CRH-Backend | **Front sibling**: `../CRH-Frontend`

## Summary

[Extract from feature spec: primary requirement + technical approach]

## Technical Context

**Language/Version**: PHP 8.1+ (Laravel 10), Dart 3.5+ (Flutter ≥3.5)

**Primary Dependencies**: Laravel Sanctum, Eloquent, Provider; Flutter Provider, HTTP client via services

**Storage**: MySQL (Backend migrations in `database/migrations/create_*`)

**Testing**: `php artisan test --filter=`, `flutter test`

**Target Platform**: Laravel API + Android/iOS Flutter app

**Project Type**: Dual-repo congregational app (Iglesia CRH)

**Constraints**: Jarvis collaboration (ask before implement); PII miembros; no WebSocket (Pusher+FCM only)

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

- [ ] Dual-repo paths documented (Backend + Front)
- [ ] CRH domain rules (roles, pastoral content, donations) addressed if applicable
- [ ] Migration norm respected per AGENTS.md
- [ ] Relevant `crh-*` skills cited

## Project Structure

### Documentation (this feature)

```text
specs/[###-feature]/
├── spec.md
├── plan.md
├── research.md
├── data-model.md
├── quickstart.md
├── contracts/
└── tasks.md
```

### Backend (CRH-Backend)

```text
app/
├── Http/Controllers/
├── Http/Requests/
├── Services/
├── Models/
database/migrations/create_*_table.php
tests/Feature/
tests/Unit/
```

### Frontend (../CRH-Frontend)

```text
lib/
├── auth/
├── onboarding/
├── config/
├── shared/
test/
```

**Structure Decision**: [Describe which Backend and Front directories this feature touches]

## API Contracts (if applicable)

Document endpoints under `specs/[###-feature]/contracts/` using CRH envelope:

`{ "success": bool, "data": {}, "message": string }`

## Complexity Tracking

> Fill ONLY if Constitution Check has violations that must be justified

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
