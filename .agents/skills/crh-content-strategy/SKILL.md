---
name: crh-content-strategy
description: Estrategia de contenido pastoral y marca CRH. Pilares, calendario editorial, alineación producto.
license: UNLICENSED
metadata:
  author: CRH Team
  version: "1.0"
  related-skills: [crh-marketing-psychology, crh-launch-strategy, crh-content-moderation]
  auto_invoke:
    - "Estrategia de contenido CRH"
---

# CRH Content Strategy

Define **qué** publicar para congregación (app) y **qué** comunicar para captar iglesias (SaaS).

## Contexto obligatorio

- `docs/product-marketing-context.md`
- `docs/BRAND_CRH.md`
- `docs/MODULES.md` (no prometer módulos fase 2 como MVP)

## Pilares sugeridos (app miembro)

| Pilar | Ejemplos | Módulo |
|-------|----------|--------|
| Comunidad | Anuncios, eventos | crh-announcements, crh-events |
| Formación | Devocionales | crh-devotionals |
| Servicio | Ministerios, streaming | crh-ministries, crh-streaming |
| Generosidad | Donaciones (fase 2+) | crh-donations |

## Pilares sugeridos (SaaS B2B)

| Pilar | Canal | Skill |
|-------|-------|-------|
| Casos de uso iglesia | Blog, email pastor | crh-church-partnerships |
| Comparativa vs Excel/WhatsApp | Landing | crh-competitor-profiling |
| Onboarding digital | Demo, trial | crh-launch-piloto |

## Calendario editorial (plantilla)

- **Semanal:** 1 devocional destacado, 1 evento próximo, 1 tip pastoral.
- **Mensual:** resumen producto, testimonio iglesia (con permiso).
- **Lanzamiento:** ver `crh-launch-strategy`.

## Checklist

- [ ] Cada pieza enlaza a un módulo real o roadmap documentado
- [ ] Tono pastoral (`docs/BRAND_CRH.md`)
- [ ] Moderación pre-publicación si es masivo (`crh-llm-judge`)
