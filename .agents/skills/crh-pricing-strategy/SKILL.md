---
name: crh-pricing-strategy
description: Estrategia de precios SaaS congregacional. Tiers iglesia, freemium vs paid. Par de crh-financial-model.
license: UNLICENSED
metadata:
  author: CRH Team
  version: "1.0"
  related-skills: [crh-financial-model, crh-startup-context, crh-church-partnerships]
  auto_invoke:
    - "Pricing tiers SaaS iglesia"
---

# CRH Pricing Strategy

Diseño de **precios y empaquetado** para Iglesia CRH como SaaS multi-iglesia.

## Contexto obligatorio

- `crh-startup-context` — no inventar cifras
- `docs/Lanzamiento/UNIT_ECONOMICS.md` — `[PENDIENTE]` hasta OK humano
- `crh-financial-model` — coherencia PROYECCION

## Dimensiones de pricing

| Dimensión | Opciones | Notas |
|-----------|----------|-------|
| Unidad | Por iglesia / por sede | Multi-campus |
| Métrica | Miembros activos / asientos | Evitar penalizar crecimiento |
| Módulos | Base + add-ons (streaming, donaciones) | Alineado a `docs/MODULES.md` |
| Frecuencia | Mensual / anual | Descuento anual [PENDIENTE] |

## Tiers sugeridos (placeholders)

| Tier | Target | Incluye |
|------|--------|---------|
| Piloto | 1 iglesia anfitriona | MVP módulos |
| Iglesia única | Congregación mediana | Full MVP |
| Multi-sede | Denominación | Admin central + sedes |
| Enterprise | Red de iglesias | SLA, soporte [PENDIENTE] |

## Frameworks

- **Value metric:** valor percibido = tiempo ahorrado pastoral + engagement miembros.
- **WTP:** validar con entrevistas pastor (`crh-church-partnerships`); no asumir.
- **Anclaje:** comparar vs Planning Center / Tithe.ly (`crh-competitor-profiling`).

## Output

- Matriz tier × módulo × precio `[PENDIENTE]`.
- Recomendación piloto (precio simbólico o gratis T+90).
- Riesgos (churn, sensibilidad VE).
