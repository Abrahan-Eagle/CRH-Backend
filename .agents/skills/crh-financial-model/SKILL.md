---
name: crh-financial-model
description: Modelo financiero Iglesia CRH (SaaS congregacional VE). Coherencia PROYECCION, UNIT_ECONOMICS; escenarios Lean/Base/Growth. No sustituye contador.
---

# crh-financial-model

Adaptación de [startup-financial-modeling](https://github.com/sickn33/antigravity-awesome-skills/blob/main/skills/startup-financial-modeling/SKILL.md) (community) al app congregacional CRH. **Siempre** invocar `crh-startup-context` primero.

## Cuándo aplicar

- Auditar o actualizar [PROYECCION_FINANCIERA_12M.md](../../docs/Lanzamiento/PROYECCION_FINANCIERA_12M.md), [UNIT_ECONOMICS.md](../../docs/Lanzamiento/UNIT_ECONOMICS.md), [PRESUPUESTO_12_MESES_REFERENCIA.md](../../docs/Lanzamiento/PRESUPUESTO_12_MESES_REFERENCIA.md).
- Responder preguntas de inversor sobre runway, burn, break-even, dilución SAFE.
- Comparar escenarios Lean / Base / Growth.

## Modelo de negocio (no SaaS)

**Tipo:** marketplace B2B2C iglesias + pacientes.

### Revenue (lado iglesia — planning actual)

```
Revenue_mes ≈ Farmacias_activas × ARPU_mes
```

- **ARPU referencia:** USD **~50/mes** (placeholder; recalibrar con GMV piloto).
- **Cobro vigente:** cuota fija **USD 25 / 40 / 55** + **% GMV** por banda — ver PROPUESTA_VALOR_CLIENTE_B2B §5.
- **Futuro:** `Net_revenue = GMV × take_rate` cuando haya GMV real; hasta entonces usar ARPU documentado.

### Revenue (GMV — año 2+)

Documentar en proyección larga; no inventar take rate sin dato en pack:

```
GMV = pedidos × ticket_promedio
Net_revenue_marketplace = GMV × take_rate  // % en B2B §5
```

### Costos

| Categoría | Componentes CRH piloto |
|-----------|-------------------------|
| COGS / variable | Hosting, Firebase, fees mínimos por transacción manual |
| S&M | Meta Ads, vallas, **4× Sales**, CAC iglesia **139** |
| R&D / producto | Founder tech, stack IA ~425/mes, sin equipo eng grande |
| G&A | HQ casa, Co-CEO, contador/abogado honorarios, buffer inflación VE **20–25%** |

## Fase 0 (obligatorio en todo modelo Lean)

**Antes de M1 (post-Day-D):**

| Sub-fase | Outflow ref. Lean |
|----------|-------------------|
| 0a T+0–30 | ~13.133 (one-shots ~9.808 + burn parcial) |
| 0b T+30–60 | 7.462 |
| 0c T+60–90 | 7.462 |
| **Total Fase 0** | **~28.057** |
| **Caja Day-D** | **101.000 − 28.057 ≈ 72.943** |

M1 = primer mes operación comercial en app (no repetir one-shots en M1–M12).

## Escenarios (P10 / P50 / P90)

| Escenario | Uso CRH | Supuestos típicos |
|-----------|-----------|-------------------|
| **P10 conservador** | Gestión de caja | +2–4 semanas a hitos iglesias; churn +20% vs base |
| **P50 base** | Planning + board | Tabla PROYECCION §1.1 (Lean) |
| **P90 optimista** | Upside deck | Growth tier + marketing buffer 25% |

**Base/Growth:** misma curva revenue Lean; delta = burn mayor + reserva — [PRESUPUESTO §3–4](../../docs/Lanzamiento/PRESUPUESTO_12_MESES_REFERENCIA.md).

## Sensibilidad (lente awesome-quant)

Referencia proceso: [wilsonfreitas/awesome-quant](https://github.com/wilsonfreitas/awesome-quant) — **no** integrar zipline/backtrader ni libs quant en el repo.

Post-piloto (cuando exista GMV real), el agente puede proponer tablas what-if **solo** re-leyendo el pack:

| Variable | Rango sugerido (lente) | Fuente |
|----------|------------------------|--------|
| Farmacias activas M12 | ±10–20% vs ~151 Lean | PROYECCION §1.1 / §7 |
| ARPU | ±15% vs ~50 USD placeholder | UNIT_ECONOMICS + GMV piloto |
| CAC iglesia | ±20% vs 139 | SUPUESTO marketing |
| Churn mensual iglesia | 4%–6% (base 5%) | UNIT_ECONOMICS |

Macro externo (FRED/World Bank): [awesome-economics](https://github.com/awesomelistsio/awesome-economics) — contexto narrativo inversor; **no** sustituye cifras de PROYECCION.

Salida: tabla «si X entonces runway / M11 break-even» con cita a línea del pack; marcar `[Requiere FP&A/contador]` en ajustes fiscales.

## Checklist de coherencia (ejecutar en cada edición)

- [ ] Tiers nombrados: Lean **[PENDIENTE]**, Base **118k**, Growth **135k**
- [ ] SAFE caps: 600k / 650k / 720k alineados con ESTRUCTURA_LEGAL
- [ ] Suma burn mensual §1.1 = total año 1 declarado (**90.702** Lean vigente)
- [ ] Fase 0 + caja Day-D + cierre M12 consistentes con README pack
- [ ] ARPU y iglesias activas M11 equilibrio (~151) coherentes con burn tramo C (**7.431**)
- [ ] CAC/LTV/payback cruzados con UNIT_ECONOMICS
- [ ] Waiver promocional B2B §11 documentado aparte (fila «con waiver» en PROYECCION)

## Métricas inversor (marketplace iglesia)

| Métrica | Fórmula / target piloto |
|---------|-------------------------|
| Burn mensual | Revenue − expenses (negativo hasta M11 Lean) |
| Runway | Caja / burn neto |
| LTV/CAC | **~7,2x** (UNIT_ECONOMICS) |
| Payback CAC | **~2,8 meses** |
| Farmacias activas break-even | **~151** (Lean M11) |

**No priorizar** en piloto: NDR, Rule of 40 SaaS, burn multiple ARR (sin ARR).

## Fundraising en el modelo

```
Dilución_ref ≈ Inversión / Cap_post_money
```

Ej. Lean: [PENDIENTE] / 600k ≈ 16,8% — ver ESTRUCTURA_LEGAL para redondeo y pro-rata.

**Use of funds:** desglosar según PRESUPUESTO §2 (Fase 0, nómina, marketing, reserva); no inventar % sin ancla.

## WTP y pricing (monetizing-innovation — UNIT_ECONOMICS)

Al editar UNIT_ECONOMICS o PROPUESTA B2B §5; **no** cambiar bandas 25/40/55 ni % GMV sin decisión founder.

| Concepto | Aplicación CRH | Regla pack |
|----------|------------------|------------|
| **Economic value** | Visibilidad digital + pedidos + menos fricción devocionales | Cualitativo hasta GMV real |
| **WTP** | Techo que iglesia acepta vs cuota+GMV | Comparar con ARPU ~50 placeholder |
| **Price fence** | Bandas por tamaño iglesia / GMV | Ya en PROPUESTA B2B §5 |
| **Pilot waiver** | Descuento Fase 0 | Solo si documentado en PROPUESTA; marcar temporal |

Nota estándar para UNIT_ECONOMICS: «ARPU ~50 es **placeholder** hasta recalibrar con GMV piloto post-Day-D».

## Packaging waiver — primeras 10 iglesias (100m-offers)

Lente [founder-playbook `100m-offers`](https://github.com/getagentseal/founder-playbook) — oferta irresistible **acotada**; no ampliar sin recalcular PROYECCION.

| Elemento | Regla CRH | Fuente pack |
|----------|-------------|-------------|
| **Oferta** | USD **0 cuota fija** meses 1–2 para **máx. 10** iglesias piloto | PROPUESTA B2B §11 |
| **Escasez** | Techo 10 firmas; no extender a cadena premium (Tithe.ly) | PROPUESTA B2B §1 |
| **Urgencia** | Ventana Fase 0 / pre-Day-D; fecha cierre en contrato | PLAN_LANZAMIENTO §3 |
| **Valor** | Panel + demanda digital vs costo app propia / comisión Rappi 25–35% | PROPUESTA B2B §2–§3 |
| **Riesgo revertido** | Salida sin penalidad meses 1–2 según contrato marco | PROPUESTA B2B §11 |

**Impacto caja (no regenerar):** PROYECCION §1.1 fila «con waiver» — ingreso acumulado año 1 **~−USD 453** vs sin waiver; caja M12 **~USD 41.756** (planning principal sigue **sin** waiver).

Al redactar copy comercial: prometer waiver **solo** si contrato marco lo refleja; tras mes 3 aplica modelo híbrido §5 B2B.

## Pitfalls (evitar)

- Proyectar MRR de suscripción SaaS para iglesias.
- Omitir Fase 0 al calcular runway desde wire.
- Usar churn US enterprise en lugar de 5% documentado.
- Inventar tasas IVA/ISLR — remitir a **contador externo**.

## Salida esperada

1. Tabla de inconsistencias (archivo, línea, severidad).
2. Propuesta de corrección con cita a fuente pack.
3. Nota explícita: «Requiere validación contador» en temas fiscales VE.

## Skills relacionadas

- `crh-startup-context` (obligatoria antes)
- `crh-lanzamiento-roles` (lente CFO + FP&A)
- `crh-investor-materials` (data room)
