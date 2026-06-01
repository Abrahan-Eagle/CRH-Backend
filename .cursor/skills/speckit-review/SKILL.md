---
name: "speckit-review"
description: "Artifact review gate after implement: WP lanes to for_review, checklist against spec/plan/tasks. CRH dual-repo."
compatibility: "Requires CRH-Backend specs/ hub; run from Backend or Frontend with Backend paths"
metadata:
  author: "CRH-adapted from spec-kitty mission workflow (MIT)"
  source: ".specify/extensions/workflows/mission/command.md"
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

Input: `/speckit-review 001` or `/speckit-review 001-auth-members` — feature number or slug.

**When:** After `/speckit-implement` completes (or user requests mid-feature review).

**Hub:** `CRH-Backend/specs/00N-feature/`

1. Resolve feature directory under `specs/` (match `001-*`).

2. Load:
   - `spec.md`, `plan.md`, `tasks.md`
   - `.specify/extensions/workflows/mission/review-checklist-template.md`

3. If `tasks.md` has WP table, set each completed WP lane to `for_review` in the document.

4. Walk review checklist:
   - Spec acceptance criteria vs implementation
   - Dual-repo paths (`backend:` / `front:`)
   - `crh-api-patterns` if API changed
   - PII/auth if members touched

5. Invoke `requesting-code-review` if user wants formal PR review (optional, separate from this artifact review).

6. Write or update `specs/00N-*/review.md` from template with findings.

7. Report:

```
Review complete — [FEATURE]

**Review file**: specs/00N-*/review.md
**WP lanes**: updated to for_review where applicable

Next: fix gaps OR `/speckit-accept 00N` if pass
```

**Do NOT merge or push.** User leads merge decisions.
