---
name: "speckit-hotfix"
description: "Emergency hotfix workflow with expedited process and mandatory post-mortem within 48h. CRH dual-repo."
compatibility: "Requires CRH-Backend .specify/ hub; run script from Backend repo root"
metadata:
  author: "CRH-adapted from spec-kit-extensions (MIT)"
  source: ".specify/extensions/workflows/hotfix/command.md"
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

**⚠️ EMERGENCY WORKFLOW — EXPEDITED PROCESS ⚠️**

The text after `/speckit-hotfix` **is** the incident description.

**Hub:** CRH-Backend repo root.

1. **Run once**:
   ```bash
   .specify/scripts/bash/create-hotfix.sh --json "<incident description>"
   ```
   Parse JSON: `HOTFIX_ID`, `BRANCH_NAME`, `HOTFIX_FILE`, `POSTMORTEM_FILE`, `TIMESTAMP`.

2. Load `.specify/extensions/workflows/hotfix/hotfix-report-template.md`.

3. Write `hotfix.md` at `HOTFIX_FILE`:
   - Timeline with `TIMESTAMP`
   - Severity: P0 service down, P1 major broken, P2 workaround exists
   - Impact assessment; leave "Immediate Fix Applied" empty until deploy
   - Note constitution exception: tests **after** fix for P0/P1 only

4. Report completion:

```
⚠️ HOTFIX WORKFLOW INITIATED

**Hotfix ID**: [HOTFIX_ID]
**Branch**: [BRANCH_NAME]
**Hotfix Report**: [HOTFIX_FILE]
**Post-Mortem**: [POSTMORTEM_FILE] (due ≤48h)

📋 **Next Steps:**
1. Confirm severity; notify stakeholders
2. `/speckit-plan` → `/speckit-tasks` → `/speckit-implement` (minimal change)
3. Monitor production 24–48h
4. Complete post-mortem.md
5. Follow-up `/speckit-bugfix` for regression test

💡 Only workflow allowing test-after-fix (constitution §VI)
```

**Skills:** `error-recovery` for CI flakes; `verification-before-completion` after deploy.
