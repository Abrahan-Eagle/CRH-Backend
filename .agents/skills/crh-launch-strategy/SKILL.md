---
name: crh-launch-strategy
description: Estrategia GTM digital para lanzamiento app congregación y expansión SaaS. Complementa crh-launch-piloto.
license: UNLICENSED
metadata:
  author: CRH Team
  version: "1.0"
  related-skills: [crh-launch-piloto, crh-content-strategy, crh-aso-audit]
  auto_invoke:
    - "Estrategia GTM lanzamiento digital"
---

# CRH Launch Strategy

Go-to-market **digital** para piloto iglesia anfitriona y primeras iglesias SaaS.

## Fases

### Fase 0 — Pre-lanzamiento (T+0)

- Scaffold app + spec `001-auth-members` implementado.
- `docs/BRAND_CRH.md` finalizado.
- Landing mínima o waitlist [PENDIENTE].
- ASO prep: `crh-aso-audit` (Front).

### Fase 1 — Piloto congregación (Day-D)

- Lanzamiento app a miembros iglesia piloto (`crh-launch-piloto`).
- KPIs: registros, DAU semana 1, primer evento/devocional visto.
- Comunicación: pastor en púlpito + QR + anuncio in-app.

### Fase 2 — Validación (T+30–90)

- Iterar onboarding (`crh-onboarding-cro`).
- Email secuencia reactivación (`crh-email-sequence`).
- Documentar aprendizajes en `docs/active_context.md`.

### Fase 3 — Expansión SaaS (post-piloto)

- Prospección iglesias B2B (`crh-church-partnerships`).
- Referidos (`crh-referral-program`).
- Pricing piloto (`crh-pricing-strategy`).

## Canales (prioridad piloto)

| Canal | Esfuerzo | Skill |
|-------|----------|-------|
| Pastor / boca a boca | Alto impacto | crh-launch-piloto |
| App stores | Medio | crh-aso-audit |
| Email | Medio | crh-email-sequence |
| Paid ads | Bajo (fase 3+) | — excluido MVP |

## Checklist lanzamiento

- [ ] Módulos MVP funcionando según `ALINEACION_LANZAMIENTO_VS_PRODUCTO.md`
- [ ] Push FCM configurado (`crh-realtime-events`)
- [ ] Plan comunicación pastor aprobado
- [ ] Métricas en `crh-analytics-events`
