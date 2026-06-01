---
name: crh-investor-materials
description: Materiales inversor Iglesia CRH — data room ligero, checklist due diligence, gaps pack Lanzamiento. Alineado a docs/Lanzamiento y CHECKLIST_PRE_INVERSOR. No sustituye abogado ni contador.
---

# crh-investor-materials

Adaptación de [data-room](https://github.com/shawnpang/startup-founder-skills/tree/main/skills/data-room) y business-case patterns (antigravity-awesome-skills). Invocar `crh-startup-context` primero.

## Cuándo aplicar

- Preparar o auditar envío a inversionista (pre-seed).
- Organizar data room ligero (22 archivos `.md` en `docs/Lanzamiento/`).
- Gap analysis antes de reunión — cruzar con [CHECKLIST_PRE_INVERSOR.md](../../docs/Lanzamiento/CHECKLIST_PRE_INVERSOR.md).

## Skill principal por documento pack

Evita usar solo `crh-lanzamiento-roles` para todo el pack.

| Documento pack | Skill principal |
|----------------|-----------------|
| ESTRUCTURA_LEGAL_Y_EQUITY | `crh-empresa-ve` |
| PLAN_LANZAMIENTO_COMERCIAL | `crh-launch-piloto` |
| PROYECCION_FINANCIERA_12M / PRESUPUESTO / UNIT_ECONOMICS | `crh-financial-model` |
| MENSAJE_ENVIO / pitch / CHECKLIST_PRE_INVERSOR | `crh-fundraising-narrative` + `crh-investor-materials` |
| PLAN_MODULO_OPERATIVO / PLAN_RX (regulatorio) | `crh-content-moderation` + `crh-prescriptions` (código) |
| PROPUESTA_VALOR_CLIENTE_B2B | `crh-church-partnerships` |
| PROPUESTA_VALOR_USUARIO_FINAL / SUPUESTO_MARKETING | **`crh-lanzamiento-docs`** (StoryBrand / Bullseye) |
| PROPUESTA_VALOR_TERCER_LADO | `crh-lanzamiento-roles` + doc específico |
| Cualquier mejora pack (router) | **`crh-lanzamiento-docs`** + skill de la fila |
| PLAN_METODOS_PAGO | `crh-payments` (modo piloto) + doc |
| ROLES_SKILLS_ZONIX | `crh-lanzamiento-roles` |
| README / BRIEF | `crh-startup-context` + `crh-investor-materials` |

## Índice data room (canónico)

| # | Documento | Categoría |
|---|-----------|-----------|
| 0 | README.md | Índice + cifras ancla |
| 1 | BRIEF_UNA_PAGINA.md | Ejecutivo |
| 2 | CONTEXTO_PITCH_Y_DECISIONES.md | Estrategia |
| 3 | PERFIL_MERCADO_PILOTO.md | Mercado TAM/SAM/SOM |
| 4 | UNIT_ECONOMICS.md | Unit economics |
| 5 | PROYECCION_FINANCIERA_12M.md | Finanzas 12m |
| 6 | ESTRUCTURA_LEGAL_Y_EQUITY.md | Legal / SAFE |
| 7 | CHECKLIST_PRE_INVERSOR.md | Reunión / FAQ |
| 8 | PLAN_LANZAMIENTO_COMERCIAL.md | GTM / Fase 0 |
| 9 | PROPUESTA_VALOR_CLIENTE_B2B.md | B2B iglesia |
| 10 | PROPUESTA_VALOR_USUARIO_FINAL.md | B2C paciente |
| 11 | PROPUESTA_VALOR_TERCER_LADO.md | Delivery + leader |
| 12 | PRESUPUESTO_12_MESES_REFERENCIA.md | Presupuesto tiers |
| 13 | MONTOS_REFERENCIA_INTERNET.md | Fuentes precios |
| 14 | SUPUESTO_MARKETING_OFFLINE.md | Offline |
| 15 | PLAN_METODOS_PAGO.md | Pagos VE |
| 16 | PLAN_MODULO_OPERATIVO_CLAVE.md | Ops / devocionales / seguridad |
| 17 | CUESTIONARIO_EQUIPO_PILOTO.md | Equipo |
| 18 | VOLCADO_RESPUESTAS_CUESTIONARIO.md | Captura respuestas |
| 19 | MENSAJE_ENVIO_Y_BULLETS_INVERSIONISTA.md | Outreach |
| 20 | ANALISIS_FORENSE.md | Auditoría multi-rol |
| 21 | ROLES_SKILLS_ZONIX.md | Roles / skills |

Referencias técnicas fuera de Lanzamiento (due diligence profunda):

- [docs/PLAN_REGULATORIO_PHARMA_VE.md](../../docs/PLAN_REGULATORIO_PHARMA_VE.md)
- [docs/PLAN_RX_VALIDATION.md](../../docs/PLAN_RX_VALIDATION.md)
- [docs/BRAND_ZONIX_PHARMA.md](../../docs/BRAND_ZONIX_PHARMA.md)

## Checklist due diligence (agente)

### Finanzas

- [ ] Cifras README = BRIEF = MENSAJE (capital, cap, burn, M11)
- [ ] PROYECCION §1.1 suma burn coherente
- [ ] UNIT_ECONOMICS alineado ARPU/CAC/LTV
- [ ] Tres tiers documentados (101 / 118 / 135)

### Legal / empresa VE

- [ ] SAFE y cap table en ESTRUCTURA_LEGAL
- [ ] Vehículo C.A. y pasos constitución descritos
- [ ] Privacidad / datos salud referenciados (no inventar plazos retención)

### Producto / técnico

- [ ] Stack construido (tests backend citados en ANALISIS_FORENSE)
- [ ] Flujo devocionales y roles app documentados
- [ ] Seguridad recetas: PLAN_MODULO §14

### Regulatorio

- [ ] MPPS/INHRR mencionados con [PENDIENTE] donde falte dictamen
- [ ] Farmacéutico colegiado por iglesia (no liaison interno piloto)

### Equipo

- [ ] Headcount piloto en BRIEF = PRESUPUESTO
- [ ] Externos contador/abogado/asesor antes Day-D público

## Formato de informe de gaps

Patrón checklist (lente [awesome-econ-ai-stuff](https://github.com/meleantonio/awesome-econ-ai-stuff) — revisión pack, no modelos econométricos):

```markdown
## Gap [ID]
- Severidad: CRÍTICA | ALTA | MEDIA
- Documento: ...
- Hallazgo: ...
- Acción sugerida: ...
- Responsable humano: Contador | Abogado | Asesor RA | Founder
- Evidencia pack: enlace § o archivo Lanzamiento
- Estado: ABIERTO | CERRADO | [PENDIENTE humano]
```

Cruzar hallazgos con [ANALISIS_FORENSE.md](../../docs/Lanzamiento/ANALISIS_FORENSE.md) §11 — no duplicar sin verificar estado (✓ cerrado).

## Lo que el agente NO debe generar

- Contratos legales vinculantes
- Dictamen fiscal SENIAT
- PDF pitch deck final (solo outline → `crh-fundraising-narrative`)
- Números nuevos sin fuente pack

## Skills relacionadas

- `crh-startup-context`
- `crh-financial-model` — auditoría numérica
- `crh-fundraising-narrative` — mensaje y bullets
- `crh-empresa-ve` — legal / SAFE / constitución
- `crh-launch-piloto` — GTM y calendario piloto
- `crh-lanzamiento-roles`
- `crh-legal-contracts-ve` — gaps en contratos B2B/SAFE
- `crh-content-moderation` — copy salud / devocionales
