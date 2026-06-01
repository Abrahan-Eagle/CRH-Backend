# Forense: github/spec-kit → CRH (auditoría + sync selectivo)

> **Fecha:** 2026-06-01  
> **Upstream:** [github/spec-kit](https://github.com/github/spec-kit) (MIT, `specify-cli` **v0.9.0**)  
> **CRH base sync:** v0.8.15 → **v0.9.0 parcial** + capas JARVIS + constitution v1.2.0

## Veredicto

**Spec Kit ya ES la base de CRH.** Este forense audita el stack existente y aplica **sync selectivo** desde v0.9.0 — **sin** `specify init --force` (destruiría customizaciones CRH).

## Capas CRH sobre Spec Kit

```
┌─────────────────────────────────────────┐
│ JARVIS (jarvis-core + crh-* skills)     │  ← dominio iglesia, router
├─────────────────────────────────────────┤
│ Extensiones CRH (bugfix/modify/hotfix/  │  ← forenses extensions + kitty
│ mission closeout)                       │
├─────────────────────────────────────────┤
│ Overrides dual-repo (plan/tasks)        │  ← equivalente preset Laravel+Flutter
├─────────────────────────────────────────┤
│ Constitution v1.2.0 CRH                 │  ← governance canónica
├─────────────────────────────────────────┤
│ Git extension (hooks optional)          │  ← upstream bundled
├─────────────────────────────────────────┤
│ Core Spec Kit (9 commands + scripts)      │  ← github/spec-kit v0.9.0 sync parcial
└─────────────────────────────────────────┘
```

**Resolución plantillas:** `overrides/` > workflows CRH > `extensions/` > core `templates/`

## Inventario skills (20 SDD)

| Grupo | Skills | Origen |
|-------|--------|--------|
| Core (9) | constitution, specify, clarify, plan, tasks, analyze, checklist, implement, taskstoissues | Spec Kit upstream |
| Git (5) | git-commit, git-feature, git-initialize, git-remote, git-validate | Extension git upstream |
| Extensions CRH (3) | bugfix, modify, hotfix | Forense spec-kit-extensions |
| Mission (3) | review, accept, closeout | Forense spec-kitty |

Upstream v0.9.0 expone 9 core + 5 git = **14**; CRH añade **6** propios = **20**.

## Diff v0.8.15 → v0.9.0 (cherry-pick aplicado)

| Artefacto | Decisión | Detalle |
|-----------|----------|---------|
| `setup-plan.sh` | **Adoptado** | No sobrescribe `plan.md` si ya existe; JSON mode stderr |
| `check-prerequisites.sh` | **Adoptado parcial** | `--paths-only` sin validación branch; mensajes `/speckit-*` CRH |
| `speckit-clarify` | **Adoptado parcial** | Paso: cargar constitution antes de scan |
| `common.sh` | **Omitido** | Solo placeholders `__SPECKIT_COMMAND_*__` y newline |
| Core templates | **Omitido** | CRH mantiene `/speckit-*` en templates; overrides dual-repo intactos |
| Git extension | **Sin cambio** | Idéntico a v0.9.0 |
| Workflows CRH | **Sin cambio** | bugfix, modify, hotfix, mission |
| Constitution | **Sin cambio** | v1.2.0 CRH |
| Community extensions | **Diferir** | Multi-Sites, Token Budget, agent-context, etc. |
| Presets community | **Diferir** | Overrides CRH suficientes fase 0 |

## Qué NO se adopta

- `specify init --force` en repos configurados
- Reemplazar constitution CRH por template upstream
- Instalar presets/extensions community sin forense dedicado
- Placeholders `__SPECKIT_COMMAND_*__` (CRH usa `/speckit-*` explícito en skills)
- Migrar hub `specs/` ni eliminar workflows CRH

## Decision tree

```
¿Feature producto API+Flutter?
  → speckit-specify → clarify → plan → tasks → analyze → implement
  → review → accept → merge (OK usuario) → closeout

¿Bug con spec?
  → speckit-bugfix → plan → tasks → implement

¿Cambio feature existente?
  → speckit-modify (delta spec)

¿Emergencia prod?
  → speckit-hotfix (+ post-mortem)

¿Lanzamiento/inversor?
  → crh-lanzamiento-docs (NO Spec Kit)

¿Actualizar Spec Kit upstream?
  → Diff v0.X.Y readonly; cherry-pick scripts/skills; NUNCA init --force
```

## Ubicación en CRH

```
CRH-Backend/
├── .specify/                    # hub Spec Kit + extensiones CRH
│   ├── memory/constitution.md   # v1.2.0 CRH
│   ├── templates/overrides/     # dual-repo preset equivalent
│   ├── extensions/workflows/    # bugfix, modify, hotfix, mission
│   └── scripts/bash/            # core + create-*.sh CRH
├── .cursor/skills/speckit-*/    # 20 skills (espejo Frontend)
├── specs/                       # hub features
└── docs/crh/
    ├── SPEC_KIT_CRH.md
    └── FORENSE_SPEC_KIT_RESUMEN.md  ← este doc

CRH-Frontend/
└── .cursor/skills/speckit-*/    # espejo; specs hub en Backend
```

## Wiring Jarvis

| Upstream Spec Kit | CRH |
|-------------------|-----|
| Core SDD flow | jarvis-core router |
| Git hooks (optional) | speckit-git-*; user OK commits |
| Dual-repo | overrides plan/tasks |
| Brownfield | speckit-modify |
| Quality gates | speckit-analyze, speckit-checklist |
| Closeout | speckit-review/accept/closeout (kitty forense) |
| Domain logic | crh-* skills (mandatory en implement) |

## Licencia upstream

MIT — [github/spec-kit](https://github.com/github/spec-kit)
