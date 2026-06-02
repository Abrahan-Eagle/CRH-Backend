# Product Marketing Context — Iglesia CRH

> **Última actualización:** 2026-06-01  
> **Uso:** Skills CRO, analytics y copy (`crh-*-cro`, `crh-analytics-events`, `crh-scenario-analysis`) deben leer este archivo **antes** de actuar. Complementa `docs/active_context.md` (técnico) y `AGENTS.md`.

---

## Product Overview

**One-liner:** App congregacional para Iglesia CRH — conectar miembros, líderes y pastores en comunidad digital.

**Qué es:** App Flutter + API Laravel para una **iglesia celular** (modelo G12 + clásico) con **red de iglesias** (una principal + asociadas futuras). Avisos, eventos, devocionales, streaming en vivo, ministerios y donaciones (fase 2).

**Categoría:** App de iglesia / comunidad religiosa.

**Modelo:** Servicio a la congregación; sin comisiones comerciales. Donaciones son diezmos/ofrendas, no marketplace.

**Estructura de la comunidad:** jerarquía de discipulado de 8 niveles (pastor → co-pastor → líder de red → supervisor → líder de célula → timoteo → miembro → visita) + ministerios (N:M). El contenido (anuncios/eventos) se publica por **audiencias reusables** (iglesia, ministerio, célula, rango); cada miembro ve la unión de sus scopes. Detalle: [PRODUCT_VISION.md](PRODUCT_VISION.md).

---

## Target Audience

| Actor | Quién es | Job to be done |
|-------|----------|----------------|
| **Visita** | Nuevo / interesado | Conocer la iglesia, ser consolidado |
| **Miembro** | Feligrés activo | Enterarse, inscribirse a eventos, crecer espiritualmente, dar |
| **Timoteo** | Miembro en formación de líder | Lo de miembro + apoyar a su líder de célula |
| **Líder (célula/ministerio/red)** | Liderazgo intermedio | Coordinar su célula/equipo/red, asistencia, comunicación por scope |
| **Pastor/Co-pastor/Admin** | Liderazgo pastoral | Comunicar visión, avisos urgentes, reportes agregados, configuración |

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
| Auth Google, perfil/jerarquía, iglesias (principal), audiencias, avisos, eventos, devocional, streaming embed, push básico | Donaciones, células/ministerios+asistencia/reportes/consolidación, chat grupal, directorio+familias navegable, panel web, push avanzado |

Ver [`MODULES.md`](MODULES.md) para dependencias técnicas (fuente de fases) y [`crh/WORKSHOP_DECISIONS.md`](crh/WORKSHOP_DECISIONS.md) para decisiones operativas.

---

## Coordinación Frontend

Copia de referencia en Frontend: enlazar siempre al canónico Backend `CRH-Backend/docs/product-marketing-context.md`.
