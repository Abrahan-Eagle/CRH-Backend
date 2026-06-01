# Review Checklist: [FEATURE 00N]

**Feature**: specs/00N-feature-name
**Review date**: [DATE]
**Reviewer**: [human / agent + user]

## Work packages

| WP | Lane before | Lane after | OK |
|----|-------------|------------|-----|
| WP01 | in_progress | for_review | [ ] |
| WP02 | in_progress | for_review | [ ] |

## Artifact review

- [ ] `spec.md` — acceptance criteria addressed
- [ ] `plan.md` — implementation matches design
- [ ] `tasks.md` — all completed tasks checked; lanes updated
- [ ] `contracts/` — API envelope (`crh-api-patterns`) if touched
- [ ] Dual-repo: Backend + Front paths both reviewed

## Code quality (artifact-level)

- [ ] No hardcoded API URLs in Front (`AppConfig.apiUrl`)
- [ ] PII/members: minimization reviewed if applicable
- [ ] Pastoral copy tone (`docs/BRAND_CRH.md`) if UI strings changed

## Outcome

- [ ] **Pass** — proceed to `/speckit-accept 00N`
- [ ] **Changes requested** — WP lane back to `in_progress` with notes below

### Notes

[Review feedback]

---
*Artifact review — use `requesting-code-review` for formal PR review*
