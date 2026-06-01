---
name: "speckit-accept"
description: "Pre-merge accept gate: verification-before-completion, constitution checks, WP lanes to approved. CRH dual-repo."
compatibility: "Requires CRH-Backend specs/ hub"
metadata:
  author: "CRH-adapted from spec-kitty accept phase (MIT)"
  source: ".specify/extensions/workflows/mission/accept-checklist-template.md"
---

## User Input

```text
$ARGUMENTS
```

You **MUST** consider the user input before proceeding (if not empty).

## Outline

Input: `/speckit-accept 001` — after successful `/speckit-review` or when user confirms ready.

1. Resolve `specs/00N-feature/`.

2. Load `.specify/extensions/workflows/mission/accept-checklist-template.md`.

3. **Run verification (mandatory):**
   - Backend: `php artisan test` (scoped if scaffold exists; else note pending scaffold)
   - Frontend: `flutter test` / `flutter analyze` on touched paths if scaffold exists
   - Invoke `verification-before-completion` — evidence before claims

4. Constitution gates: Sanctum, API envelope, no secrets, **no auto-merge**.

5. Update WP lanes in `tasks.md` to `approved` where accept criteria met.

6. Write `specs/00N-*/accept.md` from template.

7. Invoke `finishing-a-development-branch` — present merge/PR/keep/discard options; **wait for user OK**.

```
Accept complete — [FEATURE]

**Accept file**: specs/00N-*/accept.md
**Tests**: [evidence summary]

Next: user chooses merge option via finishing-a-development-branch
Then: /speckit-closeout 00N post-merge
```

**Never** `git push` or merge without explicit user order.
