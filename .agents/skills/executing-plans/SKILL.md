---
name: executing-plans
description: >
  Ejecutar plan aprobado paso a paso con verificaciones. Trigger: Plan listo en .agents/plans/.
license: UNLICENSED
metadata:
  version: "1.0.0"
  upstream: superpowers:executing-plans
  related-skills: [writing-plans, verification-before-completion, finishing-a-development-branch]
---

# Executing plans — CRH Backend

## Inicio

1. Leer `.agents/plans/implementation_plan.md` (o plan fechado).
2. Revisar críticamente — preguntar al usuario si hay huecos.
3. Confirmar rama/worktree (`dev`, no `main` sin permiso).

## Por cada tarea

1. Seguir pasos del plan en orden.
2. TDD según `test-driven-development`.
3. Verificar: `php artisan test` (o `--filter`).
4. No saltar tareas si una falla — arreglar o escalar.

## Bloqueo

**PARAR** si: test rojo no entendido, migración ambigua prod, contrato API con Frontend no definido.

## Fin

Invocar `finishing-a-development-branch` + `session-learner-ops` + actualizar `walkthrough.md`.

## Integración

- `using-git-worktrees` si el plan lo indicó
- `requesting-code-review` antes de merge grande
- `verification-before-completion` antes de declarar módulo listo
