---
name: crh-referral-program
description: Programa de referidos iglesia-a-iglesia y miembro invita miembro. Growth congregacional ético.
license: UNLICENSED
metadata:
  author: CRH Team
  version: "1.0"
  related-skills: [crh-church-partnerships, crh-member-engagement, crh-pricing-strategy]
  auto_invoke:
    - "Programa de referidos iglesia"
---

# CRH Referral Program

Diseño de referidos para **SaaS multi-iglesia** y **crecimiento orgánico** dentro de la congregación.

## Dos loops

### Loop B2B — iglesia refiere iglesia

- **Actor:** pastor/admin que ya usa CRH.
- **Incentivo:** [PENDIENTE] mes gratis, descuento tier — definir en `crh-pricing-strategy` + `UNIT_ECONOMICS.md`.
- **Mecánica:** código único por iglesia, tracking en CRM futuro.
- **Skill:** `crh-church-partnerships`.

### Loop B2C — miembro invita miembro

- **Actor:** miembro activo.
- **Incentivo:** reconocimiento pastoral (no monetario por defecto); evitar gamificación agresiva.
- **Mecánica:** deep link `crh://invite/{code}` (post-scaffold).
- **Privacidad:** no exponer directorio completo.

## Reglas éticas

1. Referido = invitación personal, no spam a contactos.
2. Pastor aprueba mensajes masivos de invitación.
3. Cifras de referidos solo desde analytics real (`crh-analytics-events`).

## Checklist diseño

- [ ] Incentivo documentado en pack Lanzamiento (no inventar)
- [ ] Flujo técnico en spec futuro (no MVP auth)
- [ ] Copy revisado con `crh-marketing-psychology`
