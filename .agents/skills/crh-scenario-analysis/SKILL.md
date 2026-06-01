---
name: crh-scenario-analysis
description: >
    Análisis what-if para decisiones producto/negocio CRH (rollout módulos, donaciones, streaming, privacidad).
    Trigger: qué pasa si, escenarios, comparar opciones estratégicas, riesgos de lanzamiento.
license: UNLICENSED
metadata:
    author: CRH Team
    version: "1.0"
    scope: [docs/]
    auto_invoke:
        - "Análisis de escenarios producto"
    triggers: escenario, what-if, priorizar, rollout, riesgo lanzamiento
    related-skills: [deep-interview-ops, brainstorming-ops, writing-plans, jarvis-experts, crh-analytics-events]
allowed-tools: [Read, Glob, Grep]
---

# CRH Scenario Analysis

Análisis estructurado para decisiones de producto en Iglesia CRH. No ejecuta simulaciones multi-agente.

## Cuándo usar

- Rollout gradual de módulos (donaciones antes que chat grupal)
- Método de pago VE (manual vs pasarela fase 2)
- Streaming YouTube embed vs RTMP propio
- Privacidad del directorio de miembros
- Priorizar MVP vs fase 2

**No usar para:** bugs, implementación de un endpoint, copy de una pantalla (usar `crh-*-cro` o `brainstorming-ops`).

## Prerrequisitos

1. Leer [`docs/product-marketing-context.md`](../../../docs/product-marketing-context.md)
2. Leer [`docs/active_context.md`](../../../docs/active_context.md)
3. Si afecta API: skill `crh-*` del módulo relevante

## Proceso

### 1. Semilla concreta

| Débil | Fuerte |
|-------|--------|
| "Mejorar engagement" | "¿Qué pasa si lanzamos devocional push diario antes que donaciones online?" |
| "Más miembros activos" | "¿Si el directorio es privado por defecto, baja un 30% las inscripciones a eventos?" |

### 2. Variables (3–6)

Documentar actual, rango y si es controlable (MVP scope, privacidad, integraciones).

### 3. Escenarios (mínimo 3)

- **Base:** continuidad actual
- **Optimista:** adopción alta, fricción baja
- **Pesimista:** baja adopción o restricción externa

### 4. Matriz de riesgos

Impacto × probabilidad; mitigación técnica o pastoral.

### 5. Recomendación

Una opción con confianza (Alta/Media/Baja) y próximo paso en `.agents/plans/`.

## Flujo con otras skills

```
deep-interview-ops → crh-scenario-analysis → brainstorming-ops → writing-plans
```
