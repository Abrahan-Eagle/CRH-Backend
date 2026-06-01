---
name: "speckit-closeout"
description: "Post-merge mission closeout: retrospective.md + session-learner-ops. CRH dual-repo."
compatibility: "Requires CRH-Backend specs/ hub"
metadata:
  author: "CRH-adapted from spec-kitty retrospective (MIT)"
  source: ".specify/extensions/workflows/mission/retrospective-template.md"
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

Input: `/speckit-closeout 001` — **after merge to dev/main** (or user confirms feature closed).

1. Resolve `specs/00N-feature/`.

2. Load `.specify/extensions/workflows/mission/retrospective-template.md`.

3. Write `specs/00N-*/retrospective.md`:
   - Spec fidelity vs shipped code
   - WP summary (planned vs actual)
   - Patterns for `docs/active_context.md`

4. Update WP lanes to `done` in `tasks.md` if not already.

5. Invoke `session-learner-ops` — propose active_context paragraph (user approves before write).

6. Optional: invoke `documentar-avances` for AGENTS.md paragraph.

7. For hotfix workflows: ensure `post-mortem.md` exists; closeout complements it.

```
Closeout complete — [FEATURE]

**Retrospective**: specs/00N-*/retrospective.md
**Session learner**: [proposed active_context paragraph — awaiting user OK]
```

Recommend closeout within 48h of merge (constitution v1.2.0).
