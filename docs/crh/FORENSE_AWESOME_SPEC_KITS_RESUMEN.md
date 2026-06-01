# Forense: awesome-spec-kits → CRH (referencia)

> **Fecha:** 2026-06-01  
> **Upstream:** [acnlabs/awesome-spec-kits](https://github.com/acnlabs/awesome-spec-kits) (CC0, lista curada MetaSpec)  
> **CRH base:** Spec Kit v0.8.15 + extensions + mission closeout + constitution v1.2.0

## Veredicto

**No instalar nada de awesome-spec-kits.** Es una **lista curada (awesome-list) + registro** `speckits.json`, no una herramienta con código adoptable. Mismo trato que clawvis-openclaw: **referencia, no instalar**.

Valor para CRH: **taxonomía SD-X** (SDD / SDS / SDM) y **mapa de alternativas** al Spec Kit ya invertido.

## Qué es upstream

| Componente | Descripción |
|------------|-------------|
| `README.md` | Filosofía Spec-Driven X (Specs → AI → Anything) |
| `speckits.json` | Registro de speckits (5 activos al 2025-11-22) |
| MetaSpec | Framework opcional para crear nuevos speckits (`pip install meta-spec`) |
| Bot de registro | PR automático al registrar un speckit en la lista |

**Nota:** El README dice "0 speckits" pero `speckits.json` lista 5 entradas activas.

## Inventario (5 speckits registrados)

| Speckit | Repo | sd_type | CRH | Notas |
|---------|------|---------|-----|-------|
| `specify-cli` | [github/spec-kit](https://github.com/github/spec-kit) | SDD | **Base actual** | `.specify/`, 20 skills `speckit-*`, hub `specs/` |
| `openspec` | [Fission-AI/OpenSpec](https://github.com/Fission-AI/OpenSpec) | SDD | **Descartado** | Alternativa TypeScript; no migrar (inversión Spec Kit) |
| `meta-spec` | [ACNet-AI/MetaSpec](https://github.com/ACNet-AI/MetaSpec) | SDS + SDD | **Descartado** | Meta-framework; over-engineering fase 0 |
| `marketing-spec-kit` | [ACNet-AI/marketing-spec-kit](https://github.com/ACNet-AI/marketing-spec-kit) | SDM | **Paralelo CRH** | CRH usa `docs/Lanzamiento/` + `crh-lanzamiento-docs` — **no** Spec Kit |
| `mcp-speckit` | [ACNet-AI/mcp-spec-kit](https://github.com/ACNet-AI/mcp-spec-kit) | SDD | **Diferir fase 3** | Solo si CRH publica servidores MCP propios |

## Taxonomía SD-X en CRH

| Tipo | Significado | CRH |
|------|-------------|-----|
| **SDD** | Spec-Driven Development | Features producto API+Flutter → Spec Kit (`speckit-*`) |
| **SDS** | Spec-of-Specs (meta) | No aplica fase 0 |
| **SDM** | Spec-Driven Marketing | `docs/Lanzamiento/` + skills `crh-marketing-*`, `crh-lanzamiento-docs` |

**Regla CRH:** SDD para producto; SDM para Lanzamiento/inversor — **dominios separados**, sin mezclar en `specs/`.

## Decision tree

```
¿Es código/plantilla adoptable?
  No → solo documentar (este forense)

¿Es alternativa a Spec Kit (openspec, meta-spec)?
  Evaluada → descartada; mantener github/spec-kit v0.8.15

¿Es SD-Marketing (marketing-spec-kit)?
  Paralelo → crh-lanzamiento-docs + pack Lanzamiento

¿Es MCP lifecycle (mcp-speckit)?
  Diferir hasta que CRH publique MCP servers

¿Buscar nuevos speckits en el ecosistema?
  Consultar speckits.json upstream como referencia; no instalar sin forense CRH
```

## Qué NO se adopta

- `pip install meta-spec` / `metaspec init`
- Migración a OpenSpec o MetaSpec
- `marketing-spec-kit` CLI (Lanzamiento ya tiene router JARVIS)
- `mcp-speckit` (sin servidores MCP CRH)
- Nuevas skills `speckit-*` o `crh-*` desde esta lista
- Bump de constitution (sin cambio de governance)

## Wiring Jarvis (referencia cruzada)

| Necesidad CRH | Herramienta actual | Speckit upstream equivalente |
|---------------|-------------------|------------------------------|
| Feature producto | `speckit-*` + `crh-*` | `specify-cli` |
| Lanzamiento / pitch | `crh-lanzamiento-docs` | `marketing-spec-kit` (SDM) |
| Evaluar alternativa SDD | Este doc + `SPEC_KIT_CRH.md` | `openspec`, `meta-spec` |
| MCP server lifecycle | — (fase 3) | `mcp-speckit` |

## Ubicación en CRH

Solo documentación — sin archivos en `.specify/` ni skills nuevos:

```
CRH-Backend/docs/crh/
├── FORENSE_AWESOME_SPEC_KITS_RESUMEN.md   ← este doc
└── SPEC_KIT_CRH.md                        ← sección "Ecosistema SDD"
```

## Licencia upstream

CC0 (Public Domain) — [awesome-spec-kits](https://github.com/acnlabs/awesome-spec-kits)

Speckits individuales en `speckits.json` tienen licencias propias (MIT en los 5 registrados).
