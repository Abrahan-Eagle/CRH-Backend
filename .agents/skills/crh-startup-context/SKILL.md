---
name: crh-startup-context
description: Contexto canónico Iglesia CRH (SaaS congregacional / multi-iglesia). Leer ANTES de finanzas, pitch o auditoría pack. Cifras solo desde docs/Lanzamiento aprobados — no inventar.
---

# crh-startup-context

Fuente única de verdad para agentes en **fundraising, finanzas o pack Lanzamiento**. Adaptado de marcos founder-playbook; dominio **app congregacional** (no marketplace).

## Cuándo aplicar (obligatorio primero)

- Antes de `crh-financial-model`, `crh-investor-materials`, `crh-fundraising-narrative`.
- Tareas con capital, SAFE, burn, iglesias clientes SaaS, TAM, donaciones platform fee.
- Al trabajar en `docs/Lanzamiento/` o `docs/crh/`.

## Producto y etapa

| Campo | Valor canónico |
|-------|----------------|
| Producto | **Iglesia CRH** — app gestión congregacional (miembros, eventos, anuncios, donaciones, ministerios, devocionales, streaming) |
| Etapa | Pre-seed / piloto; Fase 0 estructura IA + scaffold pendiente |
| Modelo | Iglesia única (MVP) → multi-sede → **SaaS multi-iglesia** (fase 2+) |
| Stack | Laravel API + Flutter; Sanctum; FCM + Pusher |
| Monetización futura | Suscripción iglesia/mes + fee donaciones en línea [PENDIENTE cifras] |

## Market Type

**Mercado existente** con diferenciación por experiencia móvil integrada (no categoría nueva).

| Comparables (lente) | Notas |
|---------------------|-------|
| Planning Center, Tithe.ly, Subsplash | Referencia internacional |
| Apps locales / WhatsApp + Excel | Competencia real en LATAM |

**Anti-patrón:** no pitch «creamos el mercado de iglesia digital» — competir en UX, pastoral-first, LATAM/VE.

## Tiers de proyección

| Tier | Uso | Fuente |
|------|-----|--------|
| Lean | Conservador | `docs/Lanzamiento/PROYECCION_FINANCIERA_12M.md` [PENDIENTE] |
| Base | Plan principal | idem |
| Growth | Upside | idem |

**Prohibido:** mezclar tiers sin etiquetar columna. Cifras `[PENDIENTE]` hasta aprobación humana.

## Métricas clave (placeholders)

| Métrica | Placeholder | Doc |
|---------|-------------|-----|
| ARPU iglesia SaaS | [PENDIENTE] USD/mes | UNIT_ECONOMICS |
| Iglesias activas piloto | [PENDIENTE] | PLAN_LANZAMIENTO |
| Miembros activos / iglesia | [PENDIENTE] | product-marketing-context |

## Roles app (producto)

`admin` · `pastor` · `leader` · `member`

## Reglas para agentes

1. **No regenerar cifras** — citar doc o marcar `[PENDIENTE]`.
2. Spec Kit **no** para Lanzamiento — usar `crh-lanzamiento-docs`.
3. Revenue piloto ≠ MRR SaaS genérico sin contexto iglesia.

## Skills relacionadas

- `crh-lanzamiento-docs`, `crh-financial-model`, `crh-fundraising-narrative`
