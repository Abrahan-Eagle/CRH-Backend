# Bug Report: [TITLE]

**Bug ID**: [bugfix-###]
**Branch**: `bugfix/[###-short-description]`
**Created**: [DATE]
**Severity**: [ ] Critical | [ ] High | [ ] Medium | [ ] Low
**Component**: [backend module / Flutter feature / API contract]
**Status**: [ ] Investigating | [ ] Root Cause Found | [ ] Fixed | [ ] Verified

## Input
User description: "$ARGUMENTS"

## Current Behavior
[What actually happens — steps, error messages, HTTP status, Flutter exception]

## Expected Behavior
[What should happen per spec or reasonable user expectation]

## Reproduction Steps
1. [Step 1]
2. [Step 2]
3. [Observe incorrect behavior]

**Frequency**: [ ] Always | [ ] Sometimes | [ ] Rare
**Environment**: Laravel local / Flutter device / staging / production

## Dual-repo scope

| Repo | Likely paths |
|------|----------------|
| **Backend** | `app/`, `routes/`, `tests/Feature/` |
| **Frontend** | `lib/features/`, `test/` (../CRH-Frontend) |

## Root Cause Analysis
*Filled during investigation (before `/speckit-plan`)*

**Technical Explanation**:

**Files Involved**:
- Backend: [path:line — issue]
- Frontend: [path:line — issue]

**Related Features**:
- [specs/00N-feature/spec.md if applicable]

## Fix Strategy
*Filled during `/speckit-plan`*

**Approach**:

**Files to Modify**:
- `backend:` [paths]
- `front:` [paths under ../CRH-Frontend]

**Breaking Changes**: [ ] Yes | [ ] No

## Regression Test
*Write BEFORE fix — `/speckit-tasks` + `/speckit-implement`*

- [ ] Backend: `php artisan test --filter=` [TestName]
- [ ] Frontend: `flutter test` [test path]
- [ ] Test fails before fix, passes after

**Test File(s)**:
**Test Description**:

## Verification Checklist
- [ ] Bug reproduced
- [ ] Root cause documented
- [ ] Regression test written first
- [ ] Fix implemented
- [ ] `php artisan test` / `flutter analyze` pass
- [ ] `verification-before-completion` evidence captured
- [ ] PII/auth reviewed if members data involved (`crh-members`, `security`)

## Prevention
[Validation, monitoring, or test gap to close]

---
*Bug report — CRH `/speckit-bugfix` workflow (spec-kit-extensions adapted)*
