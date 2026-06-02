# Spec Kit (SDD) en Iglesia CRH

> **Última actualización:** 1 junio 2026  
> **Toolkit:** [github/spec-kit](https://github.com/github/spec-kit) v0.9.0 (`specify-cli`) — sync parcial desde v0.8.15

## Arquitectura

| Repo | Rol |
|------|-----|
| **CRH-Backend** | Hub SDD: `specs/`, `.specify/`, constitution canon |
| **CRH-Frontend** | Espejo Cursor: skills `speckit-*`; specs en Backend |

## Skills: speckit vs crh

| Namespace | Ubicación | Propósito |
|-----------|-----------|-----------|
| `speckit-*` | `.cursor/skills/` | Proceso SDD (specify, plan, tasks, implement) |
| `crh-*` | `.agents/skills/` | Dominio iglesia, API, CRO, startup pack |
| `jarvis-core` | `.agents/skills/` | Orquestación módulos + router Spec Kit vs bugfix |

**Regla:** Spec Kit no reemplaza Jarvis. En implementación, invocar siempre las `crh-*` del dominio.

## Capas CRH sobre Spec Kit

Stack (de arriba abajo):

1. **JARVIS** — `jarvis-core` + skills `crh-*` (dominio, router, governance usuario)
2. **Extensiones CRH** — bugfix, modify, hotfix, mission closeout (`.specify/extensions/workflows/`)
3. **Overrides dual-repo** — `templates/overrides/plan-template.md`, `tasks-template.md` (equivalente preset Laravel+Flutter)
4. **Constitution v1.3.0** — `.specify/memory/constitution.md` (no reemplazar por template upstream)
5. **Git extension** — hooks en `.specify/extensions.yml` (commits optional)
6. **Core Spec Kit** — 9 commands + scripts bash

**Resolución plantillas:** overrides > workflows CRH > extensions > core templates.

Forenses relacionados: [FORENSE_SPEC_KIT_RESUMEN.md](./FORENSE_SPEC_KIT_RESUMEN.md), [FORENSE_SPEC_KIT_EXTENSIONS_RESUMEN.md](./FORENSE_SPEC_KIT_EXTENSIONS_RESUMEN.md), [FORENSE_SPEC_KITTY_RESUMEN.md](./FORENSE_SPEC_KITTY_RESUMEN.md), [FORENSE_AWESOME_SPEC_KITS_RESUMEN.md](./FORENSE_AWESOME_SPEC_KITS_RESUMEN.md).

**Anti-patrón:** no ejecutar `specify init --force` en repos CRH ya configurados — sobrescribe constitution, workflows CRH y overrides.

## Flujo en Cursor

### Feature (nueva)

1. `/speckit-constitution` — [.specify/memory/constitution.md](../../.specify/memory/constitution.md)
2. `/speckit-specify` — crear `specs/00N-feature/spec.md`
3. `/speckit-clarify` — antes de plan si hay ambigüedad
4. `/speckit-plan` — `plan.md` con rutas Backend + Front
5. `/speckit-tasks` — `tasks.md` con prefijos `backend:` / `front:`
6. `/speckit-analyze` — coherencia pre-implement
7. `/speckit-implement` — **solo con OK explícito del usuario**

### Mission closeout (spec-kitty patterns, sin CLI)

Tras implement en features:

1. `/speckit-review 00N` — checklist artefactos; WP → `for_review`
2. `/speckit-accept 00N` — tests + constitution → `approved`
3. `finishing-a-development-branch` — merge/PR (**OK usuario**)
4. `/speckit-closeout 00N` — `retrospective.md` + `session-learner-ops`

Plantillas: `.specify/extensions/workflows/mission/`

**WP lanes** (opcional; recomendado si >5 tasks o dual-repo): `planned` | `in_progress` | `for_review` | `approved` | `done` | `blocked`

### Extension workflows (spec-kit-extensions adaptado)

| Comando | Script | Artefactos |
|---------|--------|------------|
| `/speckit-bugfix "..."` | `.specify/scripts/bash/create-bugfix.sh` | `specs/bugfix-NNN-*/bug-report.md` |
| `/speckit-modify 00N "..."` | `.specify/scripts/bash/create-modification.sh` | `specs/00N-*/modifications/MMM-*/` |
| `/speckit-hotfix "..."` | `.specify/scripts/bash/create-hotfix.sh` | `specs/hotfix-NNN-*/hotfix.md`, `post-mortem.md` |

Plantillas: `.specify/extensions/workflows/{bugfix,modify,hotfix}/`  
Habilitados: `.specify/extensions/enabled.conf`

Tras bugfix/modify/hotfix: `/speckit-plan` → `/speckit-tasks` → `/speckit-implement` (mismo hub que features).

Skills Cursor (20 total SDD): core 9 + git 5 + extensions 3 + **mission closeout 3** (`speckit-review`, `speckit-accept`, `speckit-closeout`).

Ver [FORENSE_SPEC_KIT_EXTENSIONS_RESUMEN.md](./FORENSE_SPEC_KIT_EXTENSIONS_RESUMEN.md), [FORENSE_SPEC_KITTY_RESUMEN.md](./FORENSE_SPEC_KITTY_RESUMEN.md) y [FORENSE_AWESOME_SPEC_KITS_RESUMEN.md](./FORENSE_AWESOME_SPEC_KITS_RESUMEN.md).

## Ecosistema SDD (registro awesome-spec-kits)

Referencia: [acnlabs/awesome-spec-kits](https://github.com/acnlabs/awesome-spec-kits) — lista curada CC0 de speckits MetaSpec. **No instalar**; solo mapa de alternativas evaluadas.

| Speckit upstream | Decisión CRH | Razón |
|------------------|--------------|-------|
| `specify-cli` (GitHub Spec Kit) | **Base actual** | Ya invertido: `.specify/`, 20 skills, hub `specs/` |
| `openspec` (Fission-AI) | Descartado | Alternativa SDD; no migrar |
| `meta-spec` (MetaSpec) | Descartado | Meta-framework; YAGNI fase 0 |
| `marketing-spec-kit` (SDM) | Paralelo CRH | `docs/Lanzamiento/` + `crh-lanzamiento-docs` — no Spec Kit |
| `mcp-speckit` | Diferir fase 3 | Relevante solo si CRH publica servidores MCP |

**Taxonomía SD-X en CRH:** SDD → features producto (`speckit-*`); SDM → Lanzamiento/inversor (`crh-lanzamiento-docs`); SDS → no aplica fase 0.

Detalle forense: [FORENSE_AWESOME_SPEC_KITS_RESUMEN.md](./FORENSE_AWESOME_SPEC_KITS_RESUMEN.md).

## Documentación relacionada

Taxonomía de docs en `docs/crh/`:

| Tipo | Archivos | Propósito |
|------|----------|-----------|
| **Guía canónica SDD** | [SPEC_KIT_CRH.md](./SPEC_KIT_CRH.md) | Flujos, capas CRH, cuándo usar qué |
| **Forenses (7)** | [FORENSE_SPEC_KIT_RESUMEN.md](./FORENSE_SPEC_KIT_RESUMEN.md), [FORENSE_SPEC_KIT_EXTENSIONS_RESUMEN.md](./FORENSE_SPEC_KIT_EXTENSIONS_RESUMEN.md), [FORENSE_SPEC_KITTY_RESUMEN.md](./FORENSE_SPEC_KITTY_RESUMEN.md), [FORENSE_AWESOME_SPEC_KITS_RESUMEN.md](./FORENSE_AWESOME_SPEC_KITS_RESUMEN.md), [FORENSE_CLAWVIS_RESUMEN.md](./FORENSE_CLAWVIS_RESUMEN.md), [FORENSE_STRANGEVERSE_RESUMEN.md](./FORENSE_STRANGEVERSE_RESUMEN.md), [FORENSE_ZONIX_EATS_RESUMEN.md](./FORENSE_ZONIX_EATS_RESUMEN.md) | Adaptaciones upstream → CRH; inventario adoptar/descartar |
| **Startup / skills** | [SKILLS_STARTUP_USAR_NO_USAR.md](./SKILLS_STARTUP_USAR_NO_USAR.md) | Qué skills startup usar; pack Lanzamiento |
| **Orquestación** | [ORQUESTACION_MULTIAGENTE.md](./ORQUESTACION_MULTIAGENTE.md) | Referencia multiagente (no Spec Kit producto) |

Estado actual: Spec Kit **v0.9.0** sync parcial, **20** skills SDD, constitution **v1.3.0**, **4** workflows CRH (bugfix, modify, hotfix, mission).

## Cuándo usar qué

| Tarea | Herramienta |
|-------|-------------|
| Nueva feature producto (API + app) | `/speckit-specify` … implement → review → accept → closeout |
| Bug con regresión / spec en `specs/` | `/speckit-bugfix` → plan → tasks → implement |
| Cambio a feature existente (`001-auth-members`, etc.) | `/speckit-modify 00N` → plan → tasks → implement (delta spec) |
| Emergencia producción P0/P1 | `/speckit-hotfix` (+ post-mortem ≤48h) |
| Bug trivial (1 archivo, typo) | `task-pipeline-ops` + `systematic-debugging` |
| Pack `docs/Lanzamiento/` | `crh-lanzamiento-docs` — **no** Spec Kit |
| Pitch / finanzas / SaaS multi-iglesia | `crh-fundraising-narrative`, `crh-financial-model` |

## Piloto

Feature de referencia: [specs/001-auth-members/](../../specs/001-auth-members/) (artefactos listos; implement pendiente scaffold + OK usuario).

## CLI útil

```bash
specify version
specify integration list
cd CRH-Backend && specify init . --force --integration cursor-agent --script sh
```

Instalación CLI: `uv tool install specify-cli --from git+https://github.com/github/spec-kit.git@v0.9.0`

## Overrides CRH

Plantillas dual-repo: `.specify/templates/overrides/plan-template.md`, `tasks-template.md`
