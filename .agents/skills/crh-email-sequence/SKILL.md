---
name: crh-email-sequence
description: Secuencias email para onboarding iglesia SaaS y reactivación miembros. Complementa crh-member-engagement.
license: UNLICENSED
metadata:
  author: CRH Team
  version: "1.0"
  related-skills: [crh-member-engagement, crh-onboarding-cro, crh-church-partnerships]
  auto_invoke:
    - "Secuencias email iglesia o reactivación"
---

# CRH Email Sequences

Secuencias drip y lifecycle para **iglesia cliente** (B2B) y **miembro** (B2C en app).

## Secuencia B2B — onboarding iglesia piloto

| # | Día | Objetivo | Asunto (ejemplo) |
|---|-----|----------|------------------|
| 1 | 0 | Bienvenida + acceso admin | "Tu iglesia ya está en CRH" |
| 2 | 2 | Primer anuncio publicado | "Guía: tu primer aviso pastoral" |
| 3 | 5 | Invitar miembros | "Cómo invitar a tu congregación" |
| 4 | 10 | Check-in soporte | "¿Necesitas ayuda con CRH?" |
| 5 | 21 | Feedback piloto | "Cuéntanos tu experiencia" |

## Secuencia B2C — reactivación miembro

| # | Trigger | Objetivo |
|---|---------|----------|
| 1 | 7 días sin login | Recordatorio evento/devocional |
| 2 | 14 días sin login | Valor: "Te extrañamos en la comunidad" |
| 3 | 30 días sin login | Último intento suave; respetar opt-out |

Par técnico: `crh-member-engagement`, `crh-analytics-events`.

## Reglas

1. Un CTA por email.
2. Opt-out visible (LGPD/privacidad miembros).
3. No usar urgencia falsa (`crh-marketing-psychology`).
4. Copy pastoral; invocar `crh-llm-judge` antes de campaña masiva.

## Output

- Tabla secuencia con asuntos, cuerpo resumido, CTA.
- Métricas sugeridas: open rate, click, activación (evento `member_reactivated`).
