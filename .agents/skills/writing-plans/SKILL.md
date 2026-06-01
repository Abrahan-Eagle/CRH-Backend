---
name: writing-plans
description: >
  Plan de implementación bite-sized antes de codificar módulos Laravel. Guardar en .agents/plans/.
  Trigger: Tras brainstorming aprobado, antes de EXEC.
license: UNLICENSED
metadata:
  version: "1.0.0"
  upstream: superpowers:writing-plans
  auto_invoke:
    - "Planificar desarrollo"
  related-skills: [brainstorming-ops, task-pipeline-ops, test-driven-development]
---

# Writing plans — CRH Backend

Adaptado desde [superpowers](https://github.com/obra/superpowers).

## Cuándo usar

Tras diseño aprobado (`brainstorming-ops`), **antes** de escribir código.

## Dónde guardar

| Tipo | Ruta |
|------|------|
| Plan módulo (obligatorio jarvis-core) | `.agents/plans/implementation_plan.md` |
| Plan detallado opcional | `.agents/plans/YYYY-MM-DD-<feature>.md` |

## Encabezado obligatorio del plan

```markdown
# [Nombre módulo] — Plan Backend

**Goal:** Una frase.
**Architecture:** 2-3 frases (modelos, endpoints, migraciones).
**Tech:** Laravel 10, Sanctum, MySQL, tests Feature.

> Sub-skills: TDD, verification-before-completion, finishing-a-development-branch
```

## Granularidad de tareas

Cada tarea 2–5 min de trabajo del agente:

- [ ] Escribir test que falla
- [ ] Implementar mínimo para verde
- [ ] `php artisan test --filter=...`
- [ ] Commit (solo si usuario pidió)

Incluir **rutas exactas**: `app/Http/Controllers/...`, `tests/Feature/...`, migraciones.

## Reglas CRH

- Leer `AGENTS.md` política migraciones (local `create_*` vs append prod).
- Impacto en módulos: auth, ministerios, chat, ministerios, orders.
- DRY, YAGNI, TDD.
- No inventar endpoints sin `crh-api-patterns`.

## Contexto de negocio

Si el plan afecta UX/copy: leer `docs/product-marketing-context.md`.
