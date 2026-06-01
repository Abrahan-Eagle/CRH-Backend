---
name: crh-empresa-ve
description: Constitución y gobierno corporativo Iglesia CRH en Venezuela (C.A., RIF, banco, SAFE, laboral). Checklist T+0–T+30. Invocar crh-startup-context primero. No sustituye abogado ni contador.
---

# crh-empresa-ve

Skill para **crear y operar la empresa** Iglesia CRH en Venezuela: vehículo legal, equity, SAFE y trámites post-wire. Complementa el pack [docs/Lanzamiento/](../../docs/Lanzamiento/) — no reemplaza dictamen profesional.

## Cuándo aplicar

- Constituir **ZONIX PHARMA, C.A.** (o denominación disponible en Registro Mercantil).
- Preparar checklist para abogado + contador tras cierre SAFE (T+0).
- Alinear cap table y SAFE con tier elegido (Lean/Base/Growth).
- Contratos laborales piloto (Co-CEO, Sales, CS, etc.) — borrador de lista, no contrato final.

## Obligatorio antes

1. **`crh-startup-context`** — tiers capital, SAFE caps, Fase 0.
2. Leer [ESTRUCTURA_LEGAL_Y_EQUITY.md](../../docs/Lanzamiento/ESTRUCTURA_LEGAL_Y_EQUITY.md).
3. Leer [PLAN_LANZAMIENTO_COMERCIAL.md](../../docs/Lanzamiento/PLAN_LANZAMIENTO_COMERCIAL.md) §2.1 (hitos legales T+0–T+30).

Referencia amplia: [REQUISITOS_OPERAR_VENEZUELA.md](../../docs/REQUISITOS_OPERAR_VENEZUELA.md).

## Checklist constitución (orden sugerido)

| Paso | Entregable | Responsable humano | Notas agente |
|------|------------|-------------------|--------------|
| 1 | Reserva denominación RM Carabobo | Abogado | `[PENDIENTE]` plazo según abogado |
| 2 | Acta constitutiva + estatutos | Abogado | Capital ref. USD 1.000 — ver ESTRUCTURA §1.3 |
| 3 | Inscripción Registro Mercantil | Abogado | |
| 4 | RIF empresa SENIAT | Contador | Tras RM |
| 5 | Cuenta bancaria empresa | Founder + banco | Tras RIF |
| 6 | Sello digital / factura electrónica SENIAT | Contador | Puede extenderse post-T+30 |
| 7 | Marca SAPI (Iglesia CRH) | Abogado | Inicio T+5 según plan lanzamiento |

**No inventar** fechas ni costos de trámite sin fuente en pack o cotización abogado.

## SAFE y equity (revisión con abogado)

Desde `crh-startup-context` (no regenerar):

| Tier | Inversión | Cap post-money | Equity ref. |
|------|-----------|----------------|-------------|
| Lean | USD 101.000 | USD 600.000 | ~16,8% |
| Base | USD 118.000 | USD 650.000 | ~18,2% |
| Growth | USD 135.000 | USD 720.000 | ~18,8% |

- Documento canónico: ESTRUCTURA_LEGAL §2 (SAFE YC adaptado VE).
- Agente: listar cláusulas a validar (conversión, pro-rata, M&A) — marcar `[PENDIENTE abogado]`.

## Checklist laboral piloto (post-constitución)

Roles con payroll u honorarios según [BRIEF_UNA_PAGINA.md](../../docs/Lanzamiento/BRIEF_UNA_PAGINA.md):

- Founder / CEO / CTO
- Co-CEO / CEO operativo
- Sales B2B (×4)
- Customer Support + Community Manager
- Marketing Lead
- Coordinador Partners Logísticos
- Contador externo · Abogado externo · Asesor regulatorio (Base/Growth)

Salida agente: lista de contratos/políticas a redactar — **sin** texto legal vinculante.

## Privacidad y datos (lente complementaria)

- Invocar `security-requirement-extraction` para DPIA, bases de tratamiento, recetas — ver ESTRUCTURA §4.4 y [PLAN_MODULO_OPERATIVO_CLAVE.md](../../docs/Lanzamiento/PLAN_MODULO_OPERATIVO_CLAVE.md) §14.

## Reglas

1. **No sustituye** abogado, contador ni asesor laboral VE.
2. **No inventar** artículos de ley, plazos MPPS ni tasas SENIAT.
3. Cifras SAFE/cap solo desde `crh-startup-context` o ESTRUCTURA_LEGAL.
4. Co-CEO es **rótulo operativo**; representación legal según acta — ver nota ESTRUCTURA intro.

## Skills relacionadas

- `crh-startup-context` (obligatoria antes)
- `crh-launch-piloto` — calendario T+30 legal en contexto operativo
- `crh-financial-model` — coherencia caja Fase 0 vs wire
- `crh-lanzamiento-roles` — lente Legal + Compliance
- `crh-investor-materials` — data room incluye ESTRUCTURA_LEGAL
