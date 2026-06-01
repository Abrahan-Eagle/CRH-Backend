# Hotfix: [INCIDENT TITLE]

**Hotfix ID**: hotfix-###
**Branch**: `hotfix/###-short-description`
**Severity**: [ ] P0 (Critical) | [ ] P1 (Major) | [ ] P2 (Significant)
**Status**: [ ] Investigating | [ ] Fix Deployed | [ ] Monitoring | [ ] Post-Mortem Complete

## Incident Timeline

**Incident Start**: [YYYY-MM-DD HH:MM:SS UTC]
**Detection**: [YYYY-MM-DD HH:MM:SS UTC]
**Fix Deployed**: [YYYY-MM-DD HH:MM:SS UTC]
**Incident End**: [YYYY-MM-DD HH:MM:SS UTC]

## Input
User description: "$ARGUMENTS"

## Immediate Fix Applied

### What Changed
**Backend**:
- [file — change]

**Frontend** (if applicable):
- [file — change]

**Commit SHA**: [hash]

### Why This Fix
[Brief explanation]

## Impact
- **Users affected**: [estimate]
- **Downtime**: [duration or none]
- **Data loss**: [ ] No | [ ] Yes — recovery plan

## Root Cause (preliminary)
[Quick analysis — refine in post-mortem]

## Rollback Plan
```bash
git revert [commit-sha]
# deploy previous release
```

## Constitution Bypass (hotfix only)
- [ ] Tests written **after** fix (allowed for P0/P1 only)
- [ ] Post-mortem scheduled ≤48h
- [ ] Follow-up `/speckit-bugfix` for regression test

## Verification
- [ ] Service restored
- [ ] Monitoring normal 24–48h
- [ ] Stakeholders notified

---
*Hotfix — CRH `/speckit-hotfix` workflow*
