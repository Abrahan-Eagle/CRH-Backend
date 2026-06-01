---
name: crh-launch-piloto
description: Plan de acción y ejecución del piloto Iglesia CRH. Calendario T+0 (wire) → Day-D (T+90) → M12 post-Day-D. KPIs iglesias, roles Co-CEO/Sales/CS. Invocar crh-startup-context si hay fechas o caja.
---

# crh-launch-piloto

Skill para **planificar y ejecutar** el lanzamiento comercial y operativo de Iglesia CRH — no para redactar el pack inversor ni para código aislado.

## Cuándo aplicar

- Armar cronograma operativo tras cierre de inversión (T+0).
- Seguimiento hitos T+30 / T+60 / Day-D.
- Coordinar Co-CEO, Sales, Marketing, CS, logística.
- Cruzar avance real vs [PROYECCION_FINANCIERA_12M.md](../../docs/Lanzamiento/PROYECCION_FINANCIERA_12M.md) §1.1 (solo Lean tiene M1–M12 detallado).

## Obligatorio antes

1. **`crh-startup-context`** — T+0 = wire tier; Day-D = T+90; caja Fase 0 ~28k desde [PENDIENTE] Lean.
2. [PLAN_LANZAMIENTO_COMERCIAL.md](../../docs/Lanzamiento/PLAN_LANZAMIENTO_COMERCIAL.md) — fuente canónica de fases.
3. [BRIEF_UNA_PAGINA.md](../../docs/Lanzamiento/BRIEF_UNA_PAGINA.md) — Definition of Done piloto.

## Convención de tiempo (no mezclar)

| Hito | Significado |
|------|-------------|
| **T+0** | Wire del capital (ej. USD [PENDIENTE] Lean) |
| **T+90 = Day-D** | Inicio piloto público en app = **M1** del modelo financiero |
| **Fase 0** | T+0 → T+90 (legal, equipo, tech, pre-iglesias) — **no** repetir one-shots en M1 |
| **M1–M12** | Meses **después** de Day-D |

## Fases y skills por fase

| Fase | Objetivo | Docs pack | Skills agente |
|------|----------|-----------|---------------|
| **T+0** | Wire, kick-off abogado/contador, plan interno 90 días | PLAN_LANZAMIENTO §1, MENSAJE (comunicado inversor) | `crh-empresa-ve`, `crh-lanzamiento-roles` |
| **T+0–T+30** | Constitución C.A., RIF, banco, contratación equipo | PLAN §2.1–2.2, ESTRUCTURA_LEGAL | `crh-empresa-ve` |
| **T+30–T+60** | HQ, stack productivo, onboarding iglesias piloto | PLAN §2.3+, PROPUESTA_VALOR_CLIENTE_B2B | `crh-church-partnerships`, `documentar-avances` |
| **T+60–T+90** | Módulos MVP, pre-Day-D, QA piloto | PLAN_MODULO, MODULES | `crh-events`, `crh-members`, `qa-testing-playwright` |
| **Day-D** | Lanzamiento público app Valencia metro | BRIEF, README pack | `crh-content-moderation` (copy), Marketing humano |
| **M1–M12** | Escala iglesias, Meta, soporte, equilibrio ~M11 Lean | PROYECCION §1.1, UNIT_ECONOMICS | `crh-financial-model`, `crh-analytics` |

## KPIs piloto (planning — Lean)

Referencia [PROYECCION_FINANCIERA_12M.md](../../docs/Lanzamiento/PROYECCION_FINANCIERA_12M.md) §1.1 (no inventar otras cifras):

- **M11:** equilibrio mensual ~**151** iglesias activas (ARPU ~50).
- **M12:** ~**159** activas; caja cierre ~**42.209** (sin waiver).
- Firmas acumuladas año 1 ref. **175** en tabla §1.1.

Si el equipo real va detrás del plan, documentar desviación y sensibilidad (ver PROYECCION §7).

## Playbook por rol (ejecución)

| Rol | Prioridad Fase 0 / Day-D | Skills de apoyo |
|-----|--------------------------|----------------|
| **Co-CEO** | Procesos, cash, reporting inversor, SLA onboarding iglesias | `crh-launch-piloto`, `crh-church-partnerships` |
| **Sales B2B ×4** | Prospección, contrato marco, onboarding panel iglesia | PROPUESTA_VALOR_CLIENTE_B2B, `crh-lanzamiento-roles` |
| **Marketing Lead** | Meta + offline valla; no miembros sin app lista | SUPUESTO_MARKETING_OFFLINE, BRAND |
| **CS + Community** | Macros devocionales, soporte miembros, onboarding | `crh-member-engagement`, `crh-onboarding-ui` (Front) |
| **Coordinador Alianzas** | Contratos iglesia B2B, activación piloto | `crh-church-partnerships`, PROPUESTA_VALOR_CLIENTE_B2B |
| **Founder/CTO** | Stack, devocionales, seguridad | skills producto `crh-*` |

## Desarrollo producto (no confundir con esta skill)

Para sprints Laravel/Flutter usar skills de código (`crh-members`, `crh-events`, `crh-donations`, `laravel-specialist`, `flutter-expert`) — ver tabla en `crh-lanzamiento-roles`.

## Validación pre-Day-D (four-steps + mom-test)

Añadir o auditar en PLAN_LANZAMIENTO_COMERCIAL como checklist; **no** sustituye Definition of Done del BRIEF.

### Customer Development (four-steps)

| Paso | Pregunta de validación | Evidencia mínima piloto CRH |
|------|------------------------|-------------------------------|
| 1. Customer discovery | ¿Pastor/líder y miembros confirman dolor sin mencionar CRH? | ≥5 entrevistas mom-test documentadas |
| 2. Customer validation | ¿Firma contrato marco + iglesia configurada en panel? | Iglesia en panel con miembros piloto |
| 3. Customer creation | ¿Primer miembro activo (login + evento o devocional)? | Uso real en app post-Day-D |
| 4. Company building | ¿Procesos CS/soporte y SLA onboarding iglesia? | Macros CS + iglesia piloto activa |

### Mom-test (entrevistas iglesia — antes de escalar Sales)

Reglas al redactar guiones en pack o VOLCADO:

- Preguntar **hechos pasados** («¿Cuántos pedidos por WhatsApp la semana pasada?»), no hipótesis («¿Usarías una app?»).
- No mencionar CRH hasta entender flujo actual de comunicación, eventos y devocionales.
- Registrar citas textuales en VOLCADO; la IA **no inventa** respuestas de entrevistas.

## Beachhead y post-piloto (crossing-the-chasm)

Lente [founder-playbook `crossing-the-chasm`](https://github.com/getagentseal/founder-playbook) — **después** de validar piloto, no antes de Day-D.

| Fase | Segmento | Acción | Doc pack |
|------|----------|--------|----------|
| **Beachhead (Day-D → M6)** | San Diego + Av. Bolívar Norte; iglesias independientes | Dominar NPS, devocionales SLA, repeat purchase | BRIEF DoD; PLAN §4–§5 |
| **Early majority (M6+)** | Naguanagua, El Socorro, La Viña, Prebo | Expandir catálogo + Meta solo si M3 retención OK | PLAN §6 T+180→T+360 |
| **Mainstream** | Cadenas medianas / nacional | **No** en año 1; evento Enterprise tier | PROPUESTA B2B §1 |

**Reglas agente:**

1. **No** escalar marketing masivo a miembros «mainstream» sin retención probada **M3+** post-Day-D.
2. **No** prometer expansión geográfica fuera Valencia metro en pitch pre-seed sin actualizar PERFIL_MERCADO.
3. Pragmatists (iglesias) compran cuando ven **referencias** de otras iglesias del beachhead — priorizar casos de éxito locales antes de cold national.

## Reglas

1. No mover fechas Day-D sin actualizar PROYECCION y comunicación inversor.
2. CRH **no** opera infraestructura IT para la iglesia; cada iglesia usa la app SaaS.
3. Cada iglesia aporta **liderazgo pastoral** propio.
4. Marcar bloqueos legales `[PENDIENTE abogado/asesor]` antes de tráfico pagado masivo.

## Skills relacionadas

- `crh-startup-context`
- `crh-empresa-ve`
- `crh-lanzamiento-roles`
- `crh-financial-model` (seguimiento caja vs plan)
