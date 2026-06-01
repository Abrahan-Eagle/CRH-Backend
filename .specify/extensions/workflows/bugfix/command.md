# `/speckit-bugfix` — CRH workflow command

Run from **CRH-Backend** repo root (spec hub):

```bash
.specify/scripts/bash/create-bugfix.sh --json "<bug description>"
```

Template: `.specify/extensions/workflows/bugfix/bug-report-template.md`

Next: `/speckit-plan` → `/speckit-tasks` → `/speckit-implement` (regression test **before** fix).

Dual-repo: mark paths `backend:` / `front:` (../CRH-Frontend).
