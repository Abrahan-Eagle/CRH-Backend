---
name: brainstorming-ops
description: >
  OBLIGATORIO antes de tareas complejas en CRH Backend: nuevos módulos API, migraciones,
  auth, integraciones. Explora contexto, propone alternativas, obtiene aprobación antes de codificar.
  Trigger: Planificar módulo, feature ambiguo, refactor grande.
license: UNLICENSED
metadata:
  author: CRH Team
  version: "1.0.0"
  scope: [root]
  auto_invoke:
    - "Planificar desarrollo"
    - "Iniciar módulo"
  related-skills: [deep-interview-ops, jarvis-core, task-pipeline-ops]
---

# Brainstorming ops — CRH Backend

Adaptado desde clawvis-openclaw. Para producto Laravel, no holding OpenClaw.

## Regla

**NO escribir código** hasta presentar diseño y obtener aprobación del usuario (líder del proyecto).

## Cuándo se activa

- Nuevo módulo API (eventos, anuncios, ministerios, documentos, etc.)
- Cambios de esquema / migraciones
- Auth, Sanctum, permisos, uploads
- Integraciones (FCM, Pusher chat fase 2, YouTube/Vimeo streaming)

## Checklist

1. Leer `AGENTS.md`, `docs/active_context.md`, skills del dominio (`crh-*`).
2. Preguntas clarificadoras (una a la vez).
3. Proponer 2–3 alternativas con trade-offs.
4. Presentar diseño (impacto en BD, API, tests).
5. Escribir o actualizar `.agents/plans/implementation_plan.md`.
6. Esperar OK del usuario.

## Secuencia con otras skills

```
deep-interview-ops (si vago) → brainstorming-ops → task-pipeline-ops → ejecución
```

## Contexto CRH

- API: `AppConfig` / Sanctum / formato `{ success, data, message }`.
- Migraciones: política en `AGENTS.md` (local `create_*` vs append-only en prod).
- Producto/marketing: leer `docs/product-marketing-context.md` antes de CRO o copy.

## Anti-patrones

- Saltar al código sin plan en `.agents/plans/`.
- Asumir comportamiento de planes `.cursor/plans` sin leer código.
- Push/commit sin orden explícita del usuario.
