# Forense Zonix-Eats — Resumen de adaptación CRH

**Repos analizados:** `zonix-eats-back` (~34 skills), `zonix-eats-front` (~29 skills)  
**Fecha del análisis:** 2026-06-01  
**Objetivo:** Extraer patrones transaccionales y realtime de un MVP hermano (Laravel + Flutter, VE) sin portar dominio food delivery.

---

## Qué es Zonix-Eats

Marketplace food delivery **MVP operativo**: órdenes multi-rol, pagos VE, delivery, Pusher+FCM, ~377 tests backend. JARVIS más ligero que CRH: prefijo `zonix-*`, subagentes en `.cursor/agents/`, sin Spec Kit ni `jarvis-core`.

CRH ya comparte línea forense: `context-updater`, `documentar-avances`, pack `docs/Lanzamiento/`, stack Pusher+FCM.

---

## Qué se adoptó (2026-06-01)

Enriquecimiento de skills existentes (0 skills nuevas):

| Origen Zonix | Destino CRH | Adaptación |
|--------------|-------------|------------|
| `zonix-realtime-events` v2.0 | `crh-realtime-events` | `schema_version`, `event_id` idempotencia, catálogo `DonationStatusChanged`, `EventRegistrationUpdated` |
| `zonix-order-lifecycle` (patrón) | `crh-donations` | Máquina estados pending→confirmed/rejected, matriz rol, fail-fast 400, broadcast |
| lifecycle simplificado | `crh-events` | Inscripción registered/cancelled/checked_in, capacidad 409, check-in líder |

### Documentación

| Archivo | Propósito |
|---------|-----------|
| `docs/crh/FORENSE_ZONIX_EATS_RESUMEN.md` | Este documento |

### Referencia subagentes (no clonados)

Zonix usa `.cursor/agents/` (`security-auditor`, `verifier`, `api-contract-checker`, `test-runner`). CRH mapea a skills canon vía `crh-jarvis-subagents-map` + `jarvis-experts` — **no** se crea `.cursor/agents/` en CRH fase 0.

| Subagente Zonix | Canon CRH |
|-----------------|-----------|
| security-auditor | `security`, `security-requirement-extraction`, `crh-members` |
| verifier | `verification-before-completion` |
| api-contract-checker | `crh-api-patterns`, `requesting-code-review` |
| test-runner | `verification-before-completion`, `laravel-specialist` |

---

## Qué NO se adoptó (y por qué)

| Concepto Zonix | Razón |
|----------------|-------|
| `zonix-delivery-system`, `zonix-order-tracking-ui` | Repartidores, OSRM, mapas — no aplica iglesia |
| `zonix-payments` (completo) | Marketplace VE/Binance/comisiones — diferir fase 2 |
| `zonix-disputes-and-refunds` | Disputas comercio/comprador — diferir |
| `zonix-analytics`, `zonix-admin-analytics-ui` | CRH tiene `crh-analytics-events` |
| `stripe-integration` | Fase 2 pasarela donaciones |
| Stitch pack (5 skills front) | Web/React; CRH Flutter nativo |
| `zonix-onboarding` | CRH tiene `crh-onboarding-ui` + CRO |
| `MASTER_SYSTEM_PROMPT.md` | CRH JARVIS más maduro (Spec Kit, 80 skills) |
| Modelo JARVIS ligero Zonix | CRH mantiene `jarvis-core` + panel expertos |

---

## Qué se difiere (fase 2 — donaciones/pasarela)

| Skill futura CRH | Origen Zonix | Cuándo |
|------------------|--------------|--------|
| `crh-payments` | `zonix-payments` | Pasarela + pago móvil VE automatizado |
| `crh-disputes` | `zonix-disputes-and-refunds` | Reclamos donación, corrección comprobante |
| `stripe-integration` | skill genérica Zonix | Integración pasarela internacional |

---

## Principio aplicado

> Solo lo que CRH necesita realmente: patrones transaccionales y contrato realtime de un MVP hermano, no el dominio comida/reparto.

---

## Totales

| Métrica | Antes | Después |
|---------|-------|---------|
| Skills Backend `.agents/` | ~80 | **~80** (3 enriquecidas, 0 nuevas) |
| Docs `docs/crh/` forense | 2 | **3** |

---

## Archivos modificados

| Ruta | Cambio |
|------|--------|
| `.agents/skills/crh-realtime-events/SKILL.md` | schema_version, idempotencia, catálogo |
| `.agents/skills/crh-donations/SKILL.md` | state machine, roles, broadcast |
| `.agents/skills/crh-events/SKILL.md` | inscripción estados, capacidad |
| `.agents/skills/crh-jarvis-subagents-map/SKILL.md` | mapeo subagentes Zonix |
| `docs/crh/FORENSE_ZONIX_EATS_RESUMEN.md` | Nuevo |

---

## Referencias

- Upstream back: `/var/www/html/proyectos/AIPP/DESARROLLO/ZONIX-EAT/zonix-eats-back/`
- Upstream front: `/var/www/html/proyectos/AIPP/DESARROLLO/ZONIX-EAT/zonix-eats-front/`
- Forense clawvis: [FORENSE_CLAWVIS_RESUMEN.md](FORENSE_CLAWVIS_RESUMEN.md)
- Forense strangeverse: [FORENSE_STRANGEVERSE_RESUMEN.md](FORENSE_STRANGEVERSE_RESUMEN.md)
