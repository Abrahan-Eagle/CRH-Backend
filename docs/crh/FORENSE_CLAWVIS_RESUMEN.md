# Forense clawvis-openclaw — Resumen de adaptación CRH

**Repo analizado:** `/var/www/clawvis-openclaw` (holding multi-agente OpenClaw, ~100 skills)  
**Fecha del análisis:** 2026-06-01  
**Objetivo:** Portar valor reutilizable a Iglesia CRH (JARVIS Backend) sin clonar infraestructura holding.

---

## Qué es clawvis-openclaw

Holding multi-agente con agentes `jarvis`, `marketing`, `ventas`, JMC (Mission Control), modos autonomía A–D, scripts `activity-log`/`handoff`/`coordinator`, ~42 marketing skills, integraciones Slack/Trello/Notion, pipeline media (video, carousel, TTS).

**No es app de producto.** CRH es SaaS congregacional (Laravel + Flutter) con asistente JARVIS en Cursor.

---

## Qué CRH ya tenía heredado (antes de este forense)

| Concepto clawvis | Skill CRH | Notas |
|------------------|-----------|-------|
| Session learner | `session-learner-ops` | Dice "Adaptado desde clawvis-openclaw" |
| Deep interview | `deep-interview-ops` | Gate claridad |
| Task pipeline | `task-pipeline-ops` | Plan→Spec→Exec→Verify |
| Structured commits | `structured-commits-ops` | Trailers decisión |
| Scenario analysis | `crh-scenario-analysis` | What-if producto |

---

## Qué se adoptó en este forense (2026-06-01)

### Fase 1 — Calidad genérica (+2 skills)

| Origen clawvis | Destino CRH | Adaptación |
|----------------|-------------|------------|
| `llm-as-judge-ops` | `crh-llm-judge` | Rúbricas pastorales: anuncio, devocional, evento, push; JSON score/must_fix |
| `error-recovery` | `error-recovery` | RETRY/REPLAN/SKIP/ABORT; sin binario bash |

### Fase 2 — Marketing SaaS curado (+7 skills)

| Origen clawvis | Destino CRH | Adaptación |
|----------------|-------------|------------|
| `marketing-psychology` | `crh-marketing-psychology` | Persuasión ética iglesia/SaaS |
| `content-strategy` | `crh-content-strategy` | Pilares pastoral + B2B |
| `email-sequence` | `crh-email-sequence` | Onboarding iglesia + reactivación miembros |
| `referral-program` | `crh-referral-program` | Iglesia→iglesia, miembro→miembro |
| `pricing-strategy` | `crh-pricing-strategy` | Tiers SaaS; par `crh-financial-model` |
| `competitor-profiling` | `crh-competitor-profiling` | Planning Center, Tithe.ly, Subsplash |
| `launch-strategy` | `crh-launch-strategy` | GTM digital; par `crh-launch-piloto` |

### Fase 3 — Documentación (+2 docs)

| Archivo | Propósito |
|---------|-----------|
| `docs/crh/ORQUESTACION_MULTIAGENTE.md` | Patrón clawvis como referencia; por qué CRH no lo ejecuta |
| `docs/crh/FORENSE_CLAWVIS_RESUMEN.md` | Este documento |

### Fase 4 — Wiring

- `crh-jarvis-subagents-map` — filas nuevas
- `jarvis-core` — protocolo calidad ampliado
- `AGENTS.md` — cambios recientes + auto-invoke
- `sync.sh` ejecutado
- Grep anti-contaminación en skills `crh-*` nuevas

---

## Qué NO se adoptó (y por qué)

| Concepto clawvis | Razón |
|------------------|-------|
| `proposal-ops`, `pipeline-health-ops`, `lead-research-ops` | Dominio agencia/holding |
| `strategic-briefing-ops`, `dual-retrieval-ops` | MemPalace/Graphify; no aplica CRH |
| `economic-accountability-ops`, `model-router`, `clawflows-capability-map` | Infra holding |
| `last30days-openclaw` | Analytics holding |
| Integraciones Slack, Trello, Notion, tmux, himalaya, gog | CRH no opera en ese stack |
| Pipeline media (video-*, carousel, tts, subtitles, image-*) | No es agencia de contenido |
| `brand-kit` | CRH tiene `docs/BRAND_CRH.md` |
| Binarios `activity-log`, `handoff`, `coordinator` | Solo referencia doc |
| Gates AG-01..13 | Aprobaciones holding |
| Paid ads, programmatic SEO, revops, popup-cro, etc. | Ya cubiertos o no MVP (`crh-aso-audit`, CRO skills) |
| `career-ops` | RRHH agencia |

---

## Principio aplicado

> CRH es un asistente en Cursor sobre una app de producto. Portar solo lo que aporta valor a desarrollo SaaS congregacional; documentar (no clonar) orquestación multi-agente.

Skills creadas como Markdown en `.agents/skills/`. Sin dependencias OpenClaw ni servidores adicionales.

---

## Totales

| Métrica | Antes | Después |
|---------|-------|---------|
| Skills Backend `.agents/` | ~70 | **~79** (+2 calidad, +7 marketing) |
| Skills Frontend | 59 | 59 (sin cambios) |
| Docs crh/ nuevos | — | +2 |

---

## Archivos creados

| Ruta | Descripción |
|------|-------------|
| `.agents/skills/crh-llm-judge/SKILL.md` | LLM-as-judge pastoral |
| `.agents/skills/error-recovery/SKILL.md` | Heurística errores |
| `.agents/skills/crh-marketing-psychology/SKILL.md` | Psicología marketing ético |
| `.agents/skills/crh-content-strategy/SKILL.md` | Estrategia contenido |
| `.agents/skills/crh-email-sequence/SKILL.md` | Secuencias email |
| `.agents/skills/crh-referral-program/SKILL.md` | Referidos |
| `.agents/skills/crh-pricing-strategy/SKILL.md` | Pricing SaaS |
| `.agents/skills/crh-competitor-profiling/SKILL.md` | Competidores |
| `.agents/skills/crh-launch-strategy/SKILL.md` | GTM digital |
| `docs/crh/ORQUESTACION_MULTIAGENTE.md` | Referencia orquestación |
| `docs/crh/FORENSE_CLAWVIS_RESUMEN.md` | Este documento |

---

## Referencias

- Upstream: `/var/www/clawvis-openclaw/jarvis-ecosystem/`
- Orquestación CRH: [ORQUESTACION_MULTIAGENTE.md](ORQUESTACION_MULTIAGENTE.md)
- Mapeo skills: `.agents/skills/crh-jarvis-subagents-map/SKILL.md`
