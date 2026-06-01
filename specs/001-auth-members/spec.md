# Feature Specification: Auth + Member Registration

**Feature Branch**: `001-auth-members`

**Created**: 2026-06-01

**Status**: Draft — pilot Spec Kit artifact (implementation pending scaffold + user OK)

**Input**: First product feature for Iglesia CRH: Sanctum authentication, member registration, and basic profile so new congregants can access the app.

## User Scenarios & Testing

### User Story 1 — Member registers and logs in (Priority: P1)

As a **new member**, I can register with email/password (or OAuth when configured) and receive a Sanctum token to access protected content.

**Why this priority**: Foundation for all other modules (events, announcements, donations).

**Independent Test**: POST register → 201 + token; POST login → 200 + token; GET profile with Bearer token → member data.

**Acceptance Scenarios**:

1. **Given** valid registration data, **When** user submits register, **Then** account is created with role `member` and token returned.
2. **Given** existing credentials, **When** user logs in, **Then** API returns token and basic profile.
3. **Given** invalid credentials, **When** user logs in, **Then** API returns 401 with standard envelope.

---

### User Story 2 — Basic profile after registration (Priority: P2)

As a **member**, I can complete a minimal profile (name, phone optional, photo optional) after first login.

**Why this priority**: Enables pastoral recognition and future ministry assignment.

**Independent Test**: PUT profile updates fields; validation errors use 422 envelope.

**Acceptance Scenarios**:

1. **Given** authenticated member, **When** updating profile with valid data, **Then** changes persist and return in GET profile.
2. **Given** missing required fields, **When** submitting profile, **Then** validation errors are returned.

---

### User Story 3 — Flutter auth flow (Priority: P2)

As a **member** on the app, I see login/register screens aligned with CRH brand and store token securely.

**Independent Test**: Widget tests for form validation; integration test mock API login success.

**Acceptance Scenarios**:

1. **Given** valid credentials on login screen, **When** user submits, **Then** token is stored and user navigates to home/onboarding.
2. **Given** network error, **When** login fails, **Then** user sees generic error message (no stack traces).

## Requirements

### Functional

- FR-001: Backend MUST expose register, login, logout, and profile endpoints per `crh-api-patterns`.
- FR-002: Sanctum tokens with configurable expiration.
- FR-003: Role `member` assigned on self-registration; pastor/admin via invitation (out of scope US1).
- FR-004: Front MUST use `AppConfig.apiUrl` and secure token storage.
- FR-005: PII handled per AppSec guidelines (no verbose logs of phone/email).

### Non-Functional

- NFR-001: Feature tests in `tests/Feature/Auth/` post-scaffold.
- NFR-002: Rate limiting on login/register endpoints.

## Review & Acceptance Checklist

- [x] User stories prioritized and independently testable
- [ ] Scaffold Laravel + Flutter completed
- [ ] User approved `/speckit-implement`

## Out of Scope

- OAuth Google/Apple (follow-up spec)
- Pastor/admin invitation flow
- KYC or document verification
- Pack Lanzamiento / investor documentation
