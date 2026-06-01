# Active context — CRH Backend (memoria viva para Jarvis)

> **Leer al iniciar** junto con `AGENTS.md` y `.cursorrules`.

**Última actualización:** 2026-06-01

## Estado del proyecto

| Aspecto | Estado |
|---------|--------|
| Fase | **0 — Estructura IA + Spec Kit configurados** |
| Scaffold Laravel | Pendiente |
| Spec Kit piloto | `specs/001-auth-members/` (artefactos; implement pendiente) |
| Rama activa | `main` |

## Decisiones tomadas

1. **Stack:** Laravel 10+ (API) + Flutter (app)
2. **JARVIS híbrido:** `jarvis-core` + Panel Expertos (CorralX) + **Spec Kit SDD** (ZonixPharma) + pack startup `crh-*`
3. **Adaptación forense ZonixPharma (2026-06-01):** `.specify/`, `.cursor/skills/speckit-*`, constitution CRH, `docs/crh/SPEC_KIT_CRH.md`, startup skills (11), `context-updater`, `documentar-avances`, `crh-jarvis-subagents-map`, `crh-realtime-events`, `qa-testing-playwright`, `docs/Lanzamiento/`, `docs/BRAND_CRH.md`
4. **Adaptación forense CorralX:** skills producto CRO/analytics; `product-marketing-context.md`
5. **Adaptación forense clawvis-openclaw (2026-06-01):** +2 calidad, +7 marketing SaaS, docs orquestación (referencia). **No** clonar binarios OpenClaw.
6. **Adaptación forense strangeverse (2026-06-01):** backoff/Retry-After en `error-recovery`, parseo JSON LLM, skill `crh-i18n`. **No** portar motor simulación.
7. **Adaptación forense Zonix-Eats (2026-06-01):** patrones transaccionales en `crh-donations`, `crh-events`, contrato payload en `crh-realtime-events`. **No** portar delivery/payments marketplace. Subagentes Zonix → referencia en `crh-jarvis-subagents-map`.
8. **Adaptación forense spec-kit-extensions (2026-06-01):** workflows bugfix/modify/hotfix; constitution v1.1.0 → **v1.2.0** tras spec-kitty forense
9. **Adaptación forense spec-kitty (2026-06-01):** WP lanes, mission closeout (`speckit-review|accept|closeout`), templates `.specify/extensions/workflows/mission/`, delta-spec en modify. **Sin CLI.** [FORENSE_SPEC_KITTY_RESUMEN.md](docs/crh/FORENSE_SPEC_KITTY_RESUMEN.md)
10. **Adaptación forense awesome-spec-kits (2026-06-01):** lista curada MetaSpec (referencia, **no instalar**); taxonomía SD-X. [FORENSE_AWESOME_SPEC_KITS_RESUMEN.md](docs/crh/FORENSE_AWESOME_SPEC_KITS_RESUMEN.md)
11. **Auditoría forense github/spec-kit (2026-06-01):** base actual; sync selectivo v0.8.15→**v0.9.0** (scripts + clarify); **prohibido** `specify init --force`. [FORENSE_SPEC_KIT_RESUMEN.md](docs/crh/FORENSE_SPEC_KIT_RESUMEN.md)
12. **Router:** feature → specify … **review → accept → closeout**; bug → bugfix; modify (delta); hotfix; trivial → task-pipeline; Lanzamiento → `crh-lanzamiento-docs`
13. **Módulos MVP:** auth, miembros, anuncios, eventos, devocionales, streaming
14. **Git:** `dev` → test, `main` → producción; sin push automático

## Backlog fase 2 (desde forense Zonix-Eats)

- `crh-payments` — pago móvil VE + webhooks (cuando donaciones pase a pasarela)
- `crh-disputes` — reclamos donación / corrección comprobante
- `stripe-integration` — skill genérica pasarela

## Documentación canónica

- [PRODUCT_VISION.md](PRODUCT_VISION.md), [MODULES.md](MODULES.md), [product-marketing-context.md](product-marketing-context.md)
- [BRAND_CRH.md](BRAND_CRH.md), [docs/crh/SPEC_KIT_CRH.md](docs/crh/SPEC_KIT_CRH.md)
- Forense: [FORENSE_CLAWVIS_RESUMEN.md](docs/crh/FORENSE_CLAWVIS_RESUMEN.md), [FORENSE_STRANGEVERSE_RESUMEN.md](docs/crh/FORENSE_STRANGEVERSE_RESUMEN.md), [FORENSE_ZONIX_EATS_RESUMEN.md](docs/crh/FORENSE_ZONIX_EATS_RESUMEN.md), [FORENSE_SPEC_KIT_EXTENSIONS_RESUMEN.md](docs/crh/FORENSE_SPEC_KIT_EXTENSIONS_RESUMEN.md), [FORENSE_SPEC_KITTY_RESUMEN.md](docs/crh/FORENSE_SPEC_KITTY_RESUMEN.md), [FORENSE_AWESOME_SPEC_KITS_RESUMEN.md](docs/crh/FORENSE_AWESOME_SPEC_KITS_RESUMEN.md), [FORENSE_SPEC_KIT_RESUMEN.md](docs/crh/FORENSE_SPEC_KIT_RESUMEN.md)
- Skills: **~80** en `.agents/skills/` + **20** speckit en `.cursor/skills/` (+review, accept, closeout)

## Próximos pasos (pendiente OK usuario)

1. Scaffold Laravel + Flutter (incluir `crh-i18n`: ARB + `lang/es`; state machines donations/events)
2. Rama `dev`
3. `/speckit-implement` spec 001-auth-members tras scaffold
4. CI (Pint + tests)

## Notas

- Auditoría forense 2026-06-01: GAP-1 cerrado (Frontend realtime espejo); skills Lanzamiento limpiadas de dominio delivery legacy
- No mezclar dominio food delivery (repartidores, OSRM, marketplace payments)
- Cifras Lanzamiento: `[PENDIENTE]` hasta aprobación humana
- Idioma app: **es** por defecto; `Accept-Language` en API
- Realtime: payloads con `schema_version` + `event_id` (idempotencia cliente)
