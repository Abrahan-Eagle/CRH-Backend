---
name: "speckit-bugfix"
description: "Create a bug fix workflow with regression test-first and minimal documentation. CRH dual-repo (Laravel + Flutter)."
compatibility: "Requires CRH-Backend .specify/ hub; run script from Backend repo root"
metadata:
  author: "CRH-adapted from spec-kit-extensions (MIT)"
  source: ".specify/extensions/workflows/bugfix/command.md"
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

The text after `/speckit-bugfix` **is** the bug description. Do not ask the user to repeat unless empty.

**Hub:** Run all scripts from **CRH-Backend** repository root. Specs live in `CRH-Backend/specs/`.

Given the bug description:

1. **Run once** (Backend repo root):
   ```bash
   .specify/scripts/bash/create-bugfix.sh --json "<bug description>"
   ```
   Parse JSON: `BUG_ID`, `BRANCH_NAME`, `BUG_REPORT_FILE`, `BUG_NUM`. Use absolute paths.

2. Load `.specify/extensions/workflows/bugfix/bug-report-template.md` for required sections.

3. Write `bug-report.md` at `BUG_REPORT_FILE`:
   - Current vs expected behavior, reproduction steps
   - Severity from keywords (crash/data loss → Critical; broken feature → High)
   - Dual-repo scope: `backend:` Laravel paths; `front:` ../CRH-Frontend paths
   - Leave root cause and fix strategy for investigation/plan phases
   - Regression test section: `php artisan test --filter=` and/or `flutter test`

4. **Quality gates (CRH):**
   - Regression test **before** fix (`test-driven-development`)
   - PII/auth: invoke `crh-api-patterns`, `security` if members/auth touched
   - Close with `verification-before-completion`

5. Report completion:

```
✅ Bug fix workflow initialized

**Branch**: [BRANCH_NAME]
**Bug ID**: [BUG_ID]
**Bug Report**: [BUG_REPORT_FILE]

📋 **Next Steps:**
1. Investigate and update root cause in bug-report.md
2. `/speckit-plan` — fix plan + regression test strategy
3. `/speckit-tasks` — use bugfix/tasks-template.md patterns
4. `/speckit-implement` — fix only after failing test exists

💡 Write regression test BEFORE implementing fix
```

**Do NOT use for:** new features (`/speckit-specify`), intentional behavior change (`/speckit-modify`), production emergency (`/speckit-hotfix`), trivial one-file typo (`task-pipeline-ops`).
