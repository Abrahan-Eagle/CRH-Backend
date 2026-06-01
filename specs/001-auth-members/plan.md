# Implementation Plan: Auth + Member Registration

**Branch**: `001-auth-members` | **Date**: 2026-06-01 | **Spec**: [spec.md](./spec.md)

**Hub**: CRH-Backend | **Front sibling**: `../CRH-Frontend`

## Summary

Implement Sanctum-based authentication with member registration and basic profile. Backend provides REST endpoints; Flutter provides login/register screens and token persistence. Depends on Laravel and Flutter scaffold (not yet done).

## Technical Context

**Language/Version**: PHP 8.1+ (Laravel 10), Dart 3.5+ (Flutter ≥3.5)

**Primary Dependencies**: Laravel Sanctum, Eloquent, Provider

**Storage**: MySQL — `users`, `members` or profile fields on user (TBD in data-model)

**Testing**: `php artisan test --filter=Auth`, `flutter test`

**Constraints**: Ask before implement; PII minimization; `crh-api-patterns` envelope

## Constitution Check

- [x] Dual-repo paths documented
- [x] CRH domain (members, roles) addressed
- [x] Skills cited: `crh-members`, `crh-api-patterns`, `crh-signup-flow-cro`, `crh-onboarding-ui`
- [ ] Scaffold pending — plan executes after `composer create-project` / `flutter create`

## Project Structure

### Backend (CRH-Backend)

```text
app/Http/Controllers/Auth/
app/Http/Requests/Auth/
app/Services/AuthService.php
app/Models/User.php
routes/api.php
tests/Feature/Auth/
```

### Frontend (../CRH-Frontend)

```text
lib/auth/screens/login_screen.dart
lib/auth/screens/register_screen.dart
lib/auth/services/auth_service.dart
lib/config/user_provider.dart
test/auth/
```

## API Contracts

See [contracts/auth-api.md](./contracts/auth-api.md)

## Complexity Tracking

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| Scaffold not done | Phase 0 | Spec artifacts precede implementation by design |
