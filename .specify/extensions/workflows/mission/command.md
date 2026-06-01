# Mission closeout workflow — CRH (adapted from spec-kitty patterns)

**No CLI.** Use Cursor skills after `/speckit-implement`:

```
/speckit-review 00N   → review-checklist-template.md
/speckit-accept 00N  → accept-checklist-template.md
finishing-a-development-branch (merge/PR — user OK)
/speckit-closeout 00N → retrospective-template.md
```

Templates: `.specify/extensions/workflows/mission/`

WP lanes in `tasks.md` when feature has >5 tasks or dual-repo.
