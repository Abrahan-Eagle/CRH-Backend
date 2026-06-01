---
name: deep-interview-ops
description: >
  Entrevista socrática antes de tareas ambiguas en CRH Backend. Gate de claridad >= 3.5/5.
  Trigger: Requisitos vagos, módulo nuevo sin spec, cambios que cruzan auth/DB/API.
license: UNLICENSED
metadata:
  version: "1.0.0"
  related-skills: [brainstorming-ops, jarvis-experts]
---

# Deep interview ops — CRH Backend

Adaptado desde clawvis-openclaw.

## Gate

```
NO EJECUTAR SI CLARIDAD PROMEDIO < 3.5 / 5.0
```

## Secuencia

`deep-interview-ops` → `brainstorming-ops` → ejecución

Si el pedido es específico (ej. "arregla test X"), saltar esta skill.

## 6 dimensiones (1–5 cada una)

| Dimensión | Pregunta guía |
|-----------|---------------|
| Alcance | ¿Qué endpoints/modelos entran y cuáles no? |
| Criterio de éxito | ¿Qué test o respuesta API confirma "listo"? |
| Restricciones | ¿Migración prod? ¿Compatibilidad app en `dev`? |
| Dependencias | ¿Contrato con Frontend? ¿Servicios externos? |
| Riesgos | ¿PII miembros, donaciones, rate limits? |
| Contexto oculto | ¿Privacidad directorio, deuda en `active_context`? |

## Scorecard (plantilla)

```markdown
| Dimensión | Nota | Supuesto | Pendiente |
|-----------|------|----------|-----------|
| Alcance | | | |
| Criterio éxito | | | |
| Restricciones | | | |
| Dependencias | | | |
| Riesgos | | | |
| Contexto | | | |
**Promedio:** /
```

## Casos típicos CRH

- Donaciones + comprobantes + privacidad
- Chat grupal ministerio + Pusher + FCM (fase 2)
- Anuncios + moderación contenido
- Auth email/teléfono Sanctum
- Rollout gradual módulos (MVP vs fase 2)
