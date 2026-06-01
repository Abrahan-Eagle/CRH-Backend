---
name: finishing-a-development-branch
description: >
  Cerrar rama feature: tests, opciones merge/PR/keep/discard. Base dev.
  Trigger: Módulo completo, tests verdes.
license: UNLICENSED
metadata:
  version: "1.0.0"
  upstream: superpowers:finishing-a-development-branch
  auto_invoke:
    - "Terminar módulo"
  related-skills: [verification-before-completion, session-learner-ops, speckit-accept, speckit-closeout]
---

# Finishing a development branch — CRH Backend

## Paso 0 — Accept gate (features con spec)

Si la feature siguió Spec Kit (`specs/00N-*`), invocar **`/speckit-accept 00N`** antes de ofrecer merge.  
Si accept falla → no continuar.

## Paso 1 — Verificar (obligatorio)

```bash
php artisan test
```

Si falla → **no** ofrecer merge. Mostrar salida.

Invocar `verification-before-completion`.

## Paso 2 — Base branch

Por defecto: **`dev`**. Producción: **`main`** solo con orden explícita.

## Paso 3 — Opciones al usuario

```
Módulo listo (tests OK). ¿Qué prefieres?

1. Merge local a dev
2. Push y Pull Request (gh pr create)
3. Dejar la rama (tú gestionas después)
4. Descartar trabajo

¿Opción?
```

**No hacer push/merge sin orden explícita** (reglas AGENTS).

## Paso 4 — Limpieza worktree

Si usaste worktree: `git worktree remove ...`

## Paso 5 — Documentación

- `/speckit-closeout 00N` post-merge → `specs/00N-*/retrospective.md`
- `session-learner-ops` → `docs/active_context.md`
- `.agents/plans/walkthrough.md`
