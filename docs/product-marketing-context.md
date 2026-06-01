# Product Marketing Context — Iglesia CRH

> **Última actualización:** 2026-06-01  
> **Uso:** Skills CRO, analytics y copy (`crh-*-cro`, `crh-analytics-events`, `crh-scenario-analysis`) deben leer este archivo **antes** de actuar. Complementa `docs/active_context.md` (técnico) y `AGENTS.md`.

---

## Product Overview

**One-liner:** App congregacional para Iglesia CRH — conectar miembros, líderes y pastores en comunidad digital.

**Qué es:** App Flutter + API Laravel. Avisos, eventos, devocionales, streaming en vivo, ministerios y donaciones (fase 2).

**Categoría:** App de iglesia / comunidad religiosa.

**Modelo:** Servicio a la congregación; sin comisiones comerciales. Donaciones son diezmos/ofrendas, no marketplace.

---

## Target Audience

| Actor | Quién es | Job to be done |
|-------|----------|----------------|
| **Miembro** | Feligrés activo o visitante | Enterarse, inscribirse a eventos, crecer espiritualmente, dar |
| **Líder** | Líder de ministerio/grupo | Coordinar su equipo, asistencia, comunicación interna |
| **Pastor/Admin** | Liderazgo pastoral | Comunicar visión, avisos urgentes, reportes agregados |

**Geografía:** Venezuela (copy ES-VE).

---

## Pain Points

| Actor | Dolor |
|-------|-------|
| Miembro | Información dispersa en WhatsApp; pierde eventos y avisos oficiales |
| Líder | Difícil saber quién asiste; grupos sin herramienta unificada |
| Pastor | Sin canal oficial único; poca visibilidad de engagement |

---

## Value Proposition

| Beneficio | Mensaje |
|-----------|---------|
| Centralización | "Todo lo de tu iglesia en un solo lugar" |
| Eventos | "No te pierdas el próximo servicio" |
| Devocional | "Un paso diario con tu comunidad" |
| Live | "Únete al culto desde donde estés" |

---

## Tono y copy (ES-VE)

- Cálido, pastoral, inclusivo
- Evitar jerga técnica en UI
- Urgente solo cuando categoría = pastoral/urgente
- No prometer respuesta pastoral instantánea por la app

---

## Métricas norte (piloto)

- MAU miembros registrados
- Tasa apertura avisos push
- Inscripciones evento / asistencia reportada
- Devocionales completados / semana
- Concurrentes en live dominical

---

## MVP vs Fase 2

| MVP | Fase 2 |
|-----|--------|
| Auth, perfil, avisos, eventos, devocional, streaming embed | Donaciones, ministerios+asistencia, chat grupal, directorio familias |

Ver [`MODULES.md`](MODULES.md) para dependencias técnicas.

---

## Coordinación Frontend

Copia de referencia en Frontend: enlazar siempre al canónico Backend `CRH-Backend/docs/product-marketing-context.md`.
