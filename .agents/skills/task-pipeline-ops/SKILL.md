---
name: task-pipeline-ops
description: >
  Pipeline multi-paso para CRH Backend: Plan → Spec → Exec → Verify → Fix (máx. 3).
  Complementa jarvis-core con criterios de aceptación medibles.
  Trigger: Tareas con más de 3 pasos o que cruzan módulos.
license: UNLICENSED
metadata:
  version: "1.0.0"
  auto_invoke:
    - "Iniciar módulo"
  related-skills: [jarvis-core, verification-before-completion, brainstorming-ops]
---

# Task pipeline ops — CRH Backend

Adaptado desde clawvis-openclaw (oh-my-claudecode).

## Pipeline

```
PLAN → SPEC → EXEC → VERIFY → FIX (≤3) → COMPLETE | ESCALATE
```

## Fase PLAN

- Entregable: pasos numerados en `.agents/plans/implementation_plan.md`
- Activar: `brainstorming-ops`, `deep-interview-ops` si aplica
- Salida: aprobación usuario

## Fase SPEC

| Paso | Done when |
|------|-----------|
| Ejemplo endpoint | Test feature pasa + respuesta JSON documentada |
| Migración | `migrate` OK en local + política AGENTS respetada |

## Fase EXEC

- Seguir `jarvis-core` (Laravel, Sanctum, tests)
- Si un paso falla → FIX, no saltar

## Fase VERIFY

- Invocar `verification-before-completion`
- Tabla pass/fail con evidencia (salida `php artisan test`)

## Fase FIX

- Máximo 3 intentos; luego escalar al usuario

## No usar pipeline completo

- Typos, docs de una línea, respuesta informativa
- Hotfix acordado explícitamente como "rápido"

## Cierre módulo

- [ ] Todos los pasos PASS o ESCALATE documentado
- [ ] `walkthrough.md` actualizado
- [ ] `session-learner-ops` si hubo lecciones nuevas
