---
name: session-learner-ops
description: >
  Tras cerrar un módulo significativo: extraer patrones y actualizar memoria en docs/active_context.md
  y walkthrough. Trigger: Terminar módulo, incidente resuelto, cierre sprint.
license: UNLICENSED
metadata:
  version: "1.0.0"
  auto_invoke:
    - "Terminar módulo"
  related-skills: [jarvis-core, speckit-closeout]
---

# Session learner ops — CRH Backend

Adaptado desde clawvis-openclaw.

## Cuándo activar

- Cierre de módulo (auth, ministerios, chat, ministerios, etc.)
- Bug complejo resuelto (root cause documentado)
- **No** en cambios triviales

## Quality gates (los 4)

1. Concreto
2. Reproducible
3. Accionable
4. Nuevo (no duplicar AGENTS/skills)

## Dónde documentar

| Tipo | Destino |
|------|---------|
| Decisión de producto/técnica | `docs/active_context.md` |
| Resumen del módulo | `.agents/plans/walkthrough.md` |
| Retrospectiva feature | `specs/00N-*/retrospective.md` — plantilla [`.specify/extensions/workflows/mission/retrospective-template.md`](../../.specify/extensions/workflows/mission/retrospective-template.md); invocar `/speckit-closeout` |
| Mejora a skill | Proponer al usuario; no editar sin OK |

## Plantilla active_context

```markdown
### [YYYY-MM-DD] Título breve
- **Contexto:** módulo/tarea
- **Hallazgo:** qué aprendimos
- **Patrón:** regla para repetir
- **Pendiente:** si aplica
```

## Proceso

1. Revisar qué se hizo vs plan
2. Extraer 1–3 hallazgos que pasen los 4 gates
3. Actualizar `active_context` + `walkthrough`
4. Preguntar si actualizar `AGENTS.md` / skills
