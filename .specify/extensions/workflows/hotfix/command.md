# `/speckit-hotfix` — CRH workflow command

Run from **CRH-Backend** repo root:

```bash
.specify/scripts/bash/create-hotfix.sh --json "<incident description>"
```

Templates:
- `.specify/extensions/workflows/hotfix/hotfix-report-template.md`
- `.specify/extensions/workflows/hotfix/post-mortem-template.md`

Expedited fix; tests **after** deploy (P0/P1). Post-mortem ≤48h mandatory.

Next: `/speckit-plan` → `/speckit-tasks` → `/speckit-implement` → follow-up `/speckit-bugfix` for regression test.
