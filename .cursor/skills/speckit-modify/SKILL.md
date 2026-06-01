---
name: "speckit-modify"
description: "Modify an existing CRH feature spec with impact analysis and backward compatibility tracking (Laravel + Flutter)."
compatibility: "Requires CRH-Backend .specify/ hub; run script from Backend repo root"
metadata:
  author: "CRH-adapted from spec-kit-extensions (MIT)"
  source: ".specify/extensions/workflows/modify/command.md"
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

Input formats:
- `/speckit-modify 001 "add phone to member profile"`
- `/speckit-modify "add phone to member profile"` → interactive feature list

**Hub:** CRH-Backend repo root; specs in `specs/00N-feature/`.

1. **Parse arguments**
   - Leading 3 digits → feature number + description
   - Else → interactive mode

2. **Interactive mode** (no feature number):
   ```bash
   .specify/scripts/bash/create-modification.sh --list-features "<description>"
   ```
   Present numbered feature list; wait for user selection; extract feature number.

3. **Run once** (feature number known):
   ```bash
   .specify/scripts/bash/create-modification.sh --json <NNN> "<description>"
   ```
   Parse JSON: `MOD_ID`, `BRANCH_NAME`, `MOD_SPEC_FILE`, `IMPACT_FILE`, `FEATURE_NAME`, `MOD_NUM`.

4. Read `IMPACT_FILE` and original `specs/<FEATURE_NAME>/spec.md` and `contracts/` if present.

5. Load `.specify/extensions/workflows/modify/modification-spec-template.md`.

6. Write `modification-spec.md` at `MOD_SPEC_FILE`:
   - Why modify, Added/Modified/Removed/Unchanged
   - Impact summary from scan (backend + front paths)
   - Backward compatibility and `crh-api-patterns` envelope if API changes

7. Report completion:

```
✅ Modification workflow initialized

**Modification ID**: [MOD_ID]
**Original Feature**: specs/[FEATURE_NAME]
**Modification Spec**: [MOD_SPEC_FILE]
**Impact Analysis**: [IMPACT_FILE]

📋 **Next Steps:**
1. Review modification-spec.md and impact-analysis.md
2. `/speckit-plan` → `/speckit-tasks` → `/speckit-implement`
```

**Do NOT use for:** new features (`/speckit-specify`), defects (`/speckit-bugfix`), emergencies (`/speckit-hotfix`).
