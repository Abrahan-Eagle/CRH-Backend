# Forense strangeverse — Resumen de adaptación CRH

**Repo analizado:** `/var/www/strangeverse` (motor simulación multi-agente, Python/Flask + Node)  
**Fecha del análisis:** 2026-06-01  
**Objetivo:** Extraer solo patrones de ingeniería útiles para Iglesia CRH (Laravel + Flutter). **No** portar el motor de simulación.

---

## Qué es strangeverse

Motor de **swarm intelligence** para predicción de escenarios: GraphRAG, memoria Zep Cloud, simulación OASIS (CAMEL-AI), agentes con personalidad, reportes post-simulación. Stack: Python 3.11+, Flask, OpenAI-compatible LLM, frontend Node.

**Dominio:** predicción macro/micro (política, narrativa, finanzas). **No aplica** a CRH como producto congregacional.

---

## Qué se adoptó (2026-06-01)

| Origen strangeverse | Destino CRH | Adaptación |
|---------------------|-------------|------------|
| `backend/app/utils/retry.py` | `error-recovery` (enriquecida) | Backoff exponencial, jitter, `max_delay`, header `Retry-After` en 429 |
| `backend/app/utils/llm_client.py` | `crh-llm-judge` + `crh-content-moderation` | Parseo JSON robusto: fences markdown, primer objeto, fallback reasoning |
| `backend/app/utils/locale.py` + `locales/*.json` | **`crh-i18n`** (nueva) | Flutter ARB + Laravel `lang/es`, `Accept-Language`, español-first VE |

### Documentación

| Archivo | Propósito |
|---------|-----------|
| `docs/crh/FORENSE_STRANGEVERSE_RESUMEN.md` | Este documento |

---

## Qué NO se adoptó (y por qué)

| Concepto strangeverse | Razón |
|----------------------|-------|
| OASIS / `simulation_runner` / swarm agents | Producto CRH ≠ sandbox de predicción |
| GraphRAG, `graph_builder`, ontología LLM | No hay grafo de conocimiento en MVP |
| Memoria Zep Cloud | Dependencia externa; no aplica app iglesia |
| `report_agent`, perfiles OASIS | Dominio simulación |
| Frontend Node del simulador | CRH usa Flutter |
| Dashscope / Qwen / perfiles LLM cloud | CRH no integra ese stack en fase 0 |
| CI Docker GHCR | CRH usará `github-actions-templates` post-scaffold |
| Convención ADR (`adr-graph-backend.md`) | YAGNI; Spec Kit + `active_context` bastan |
| Doc Ollama local (`CONFIGURACION_LLM_LOCAL.md`) | Moderación LLM no está en MVP scaffold |

---

## Principio aplicado

> Solo lo **necesario y útil** para CRH: patrones de resiliencia API/LLM e i18n español-first. El motor strangeverse permanece referencia externa, no dependencia.

Skills como Markdown en `.agents/skills/`. Sin código Python de strangeverse en el repo CRH.

---

## Totales

| Métrica | Antes | Después |
|---------|-------|---------|
| Skills Backend `.agents/` | ~79 | **~80** (+1 `crh-i18n`; +2 enriquecidas) |
| Docs `docs/crh/` | +2 clawvis | +1 forense strangeverse |

---

## Archivos creados/modificados

| Ruta | Cambio |
|------|--------|
| `.agents/skills/crh-i18n/SKILL.md` | Nuevo |
| `.agents/skills/error-recovery/SKILL.md` | Sección backoff / Retry-After |
| `.agents/skills/crh-llm-judge/SKILL.md` | Robustez parseo JSON |
| `.agents/skills/crh-content-moderation/SKILL.md` | Nota parseo JSON |
| `docs/crh/FORENSE_STRANGEVERSE_RESUMEN.md` | Nuevo |
| `crh-jarvis-subagents-map`, `jarvis-core`, `AGENTS.md`, `active_context.md` | Wiring |

---

## Referencias

- Upstream: `/var/www/strangeverse/` (README, `backend/app/utils/`)
- Forense clawvis: [FORENSE_CLAWVIS_RESUMEN.md](FORENSE_CLAWVIS_RESUMEN.md)
- i18n skill: `.agents/skills/crh-i18n/SKILL.md`
