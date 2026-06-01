# `/speckit-modify` — CRH workflow command

Run from **CRH-Backend** repo root:

```bash
.specify/scripts/bash/create-modification.sh --json <NNN> "<change description>"
# interactive list:
.specify/scripts/bash/create-modification.sh --list-features "<description>"
```

Templates:
- `.specify/extensions/workflows/modify/modification-spec-template.md`
- `.specify/extensions/workflows/modify/impact-analysis-template.md`

Impact scan: `.specify/extensions/workflows/modify/scan-impact.sh`

Next: `/speckit-plan` → `/speckit-tasks` → `/speckit-implement`.
