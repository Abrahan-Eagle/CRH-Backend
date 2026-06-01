# Modification Spec: [CHANGE DESCRIPTION]

**Original Feature**: [specs/00N-feature-name/spec.md](../../00N-feature-name/spec.md)
**Modification ID**: 00N-mod-###
**Branch**: `00N-mod-###-short-description`
**Created**: [DATE]
**Status**: Draft

## Input
User description: "$ARGUMENTS"

## Why Modify?
[Business or technical justification]

## What's Changing?

### Added
- [New capability]

### Modified
- **Was**: … **Now**: … **Why**: …

### Removed
- [If any — migration path required]

### Unchanged
- [Contracts/behavior that MUST NOT break]

## Impact Analysis
*See `impact-analysis.md` — review scan-impact.sh output*

### Backend (Laravel)
- [app/Http/Controllers/, app/Models/, routes/api.php]

### Frontend (Flutter)
- [../CRH-Frontend/lib/features/...]

### Contracts
- Original: `specs/00N-feature/contracts/`
- [ ] API envelope unchanged (`crh-api-patterns`)
- [ ] Breaking change documented + migration

### Tests
- [ ] Update PHPUnit tests
- [ ] Update Flutter tests
- [ ] New contract tests if endpoints change

## Backward Compatibility
**Breaking Changes**: [ ] Yes | [ ] No

## Constitution Compliance (CRH)
- [ ] Spec-first — this document complete before code
- [ ] Dual-repo paths in plan/tasks
- [ ] TDD — tests updated before or with implementation
- [ ] PII/Sanctum reviewed if auth/members touched

## Rollout / Rollback
[Rollback plan if modification fails in staging]

---
*Modification spec — CRH `/speckit-modify` workflow*
