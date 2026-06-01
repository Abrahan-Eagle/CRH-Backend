---
name: crh-lanzamiento-docs
description: Mejorar y auditar documentos en docs/Lanzamiento con marcos founder-playbook/shawnpang adaptados a Iglesia CRH VE. Router por archivo; cifras solo desde pack. Invocar crh-startup-context primero.
---

# crh-lanzamiento-docs

Skill **orquestadora** para editar el pack `docs/Lanzamiento/` con IA. Integra el informe [ANALISIS_FORENSE_BUSQUEDA_GITHUB_LANZAMIENTO_2026-05.md](../../docs/crh/ANALISIS_FORENSE_BUSQUEDA_GITHUB_LANZAMIENTO_2026-05.md) **sin** instalar repos externos (`shawnpang`, `founder-playbook`, VoltAgent). Los marcos Tier A viven en skills `crh-*` locales.

## Cuándo aplicar

- El usuario pide **mejorar**, **auditar**, **ampliar una sección** o **alinear** un `.md` del pack Lanzamiento.
- Sesión de mejora continua post-[INCOHERENCIAS_LANZAMIENTO_2026-05.md](../../docs/Lanzamiento/INCOHERENCIAS_LANZAMIENTO_2026-05.md).
- Dudas de qué skill `crh-*` usar para un documento concreto.

## Obligatorio antes (siempre)

1. **`crh-startup-context`** — cifras solo desde pack aprobado o `[PENDIENTE]`.
2. Leer el **documento objetivo** completo (o la sección indicada).
3. Si hay cruce con producto: [ALINEACION_LANZAMIENTO_VS_PRODUCTO.md](../../docs/Lanzamiento/ALINEACION_LANZAMIENTO_VS_PRODUCTO.md).

## Router — documento → skill + marco adaptado

| Documento Lanzamiento | Skill principal | Marco adaptado (origen externo) | Sección típica a enriquecer |
|----------------------|-----------------|----------------------------------|----------------------------|
| PROPUESTA_VALOR_IGLESIA_B2B | `crh-church-partnerships` | SPIN selling | Discovery call, matriz objeciones |
| PROPUESTA_VALOR_USUARIO_FINAL | `crh-lanzamiento-docs` + `crh-content-moderation` | StoryBrand (BrandScript) | Hero, problema, guía, plan, CTA |
| SUPUESTO_MARKETING_OFFLINE | `crh-lanzamiento-docs` | Traction Bullseye | Canal → métrica → costo |
| CHECKLIST_PRE_INVERSOR | `crh-investor-materials` | data-room + due diligence | FAQ técnica |
| MENSAJE_ENVIO_Y_BULLETS_INVERSIONISTA | `crh-fundraising-narrative` | fundraising-email | Variantes corto/largo |
| PLAN_LANZAMIENTO_COMERCIAL | `crh-launch-piloto` | four-steps (Customer Development) | Checklist pre-Day-D |
| UNIT_ECONOMICS | `crh-financial-model` | monetizing-innovation (WTP) | Nota WTP vs ARPU placeholder |
| CONTEXTO_PITCH_Y_DECISIONES | `crh-fundraising-narrative` | obviously-awesome | Posicionamiento vs competencia |
| BRIEF_UNA_PAGINA | `crh-fundraising-narrative` + `crh-startup-context` | obviously-awesome (1 pág) | Resumen ejecutivo sin duplicar cifras |
| PERFIL_MERCADO_PILOTO | `crh-startup-context` + `crh-investor-materials` | competitor-matrix (lente) | Planning Center / Tithe.ly / WhatsApp |
| PROYECCION / PRESUPUESTO | `crh-financial-model` | — (no marco externo de pricing) | Solo coherencia numérica |
| VOLCADO_RESPUESTAS_CUESTIONARIO | — | mom-test | **Solo humano** rellena datos reales |
| REGISTRO_PENDIENTES_PACK | `crh-investor-materials` | — | Cerrar `[PENDIENTE]` |

## Diagnóstico rápido (estilo founder-playbook `diagnose`)

Si el usuario no especifica archivo, clasificar la tarea:

| Síntoma | Enfocar en |
|---------|------------|
| «El pitch no convence» | MENSAJE, BRIEF, CONTEXTO → `crh-fundraising-narrative` |
| «Las iglesias no cierran» | PROPUESTA B2B → `crh-church-partnerships` |
| «Los números no cuadran» | PROYECCION, UNIT, PRESUPUESTO → `crh-financial-model` |
| «¿Qué falta para reunión inversor?» | CHECKLIST, README → `crh-investor-materials` |
| «Calendario / Day-D» | PLAN_LANZAMIENTO → `crh-launch-piloto` |
| «Copy paciente / ads» | PROPUESTA_USUARIO_FINAL + BRAND → StoryBrand abajo |
| «Varios problemas a la vez» | Una sesión = **un documento**; ordenar por P0 en REGISTRO_PENDIENTES |

## StoryBrand — plantilla paciente (PROPUESTA_USUARIO_FINAL)

Adaptación VE; **no** claims médicos ni terapéuticos en copy pastoral.

1. **Héroe:** paciente en Valencia que necesita medicamentos OTC/devocionales con entrega o pickup.
2. **Problema externo:** colas, stock opaco, receta rechazada sin guía.
3. **Problema interno:** estrés, tiempo perdido.
4. **Villano (metafórico):** fragmentación — no atacar iglesias físicas.
5. **Guía:** Iglesia CRH (claro, empático, con pastoral de la iglesia despachadora).
6. **Plan:** buscar iglesia → carrito → receta si devocionales → pago manual → seguimiento.
7. **Éxito:** pedido entregado o retiro; receta validada.
8. **Fracaso a evitar:** pedido bloqueado sin explicación (alinear con estados app).
9. **CTA:** descargar app / pedir en iglesia aliada piloto.

## Traction Bullseye — plantilla marketing (SUPUESTO_MARKETING_OFFLINE)

Un **anillo** a la vez; métricas desde pack, no inventar presupuesto nuevo.

| Anillo | Canal piloto CRH | Métrica leading | Fuente costo |
|--------|-------------------|-----------------|--------------|
| Interior | WhatsApp / referidos iglesia | Pedidos con `pastor_id` piloto | CAC en UNIT_ECONOMICS |
| Medio | Meta Ads (paciente) | CPI / primer pedido pagado | PRESUPUESTO marketing |
| Exterior | Valla Av. Bolívar / radio local | Código o UTM offline | SUPUESTO_MARKETING_OFFLINE |

Regla: **no** escalar anillo exterior hasta catálogo Day-D en ≥ N iglesias (meta PLAN §1.1).

## Anti-patrones (marcos a NO aplicar)

| Marco externo | Por qué evitar en CRH | Usar en su lugar |
|---------------|-------------------------|------------------|
| `blue-ocean-strategy` | CRH compite en categoría **existente** (apps iglesia) | `crh-startup-context` Market Type |
| `100m-leads` | Paid agresivo multi-canal no aplica a piloto Valencia acotado | Traction Bullseye + PRESUPUESTO marketing |
| `lean-startup` como dogma | Solapa con four-steps; riesgo de pivot narrativo sin dato | four-steps + mom-test en `crh-launch-piloto` |
| `founder-os` / VoltAgent hubs | PRDs US y miles de skills; divergen del pack | Skills `crh-*` locales |
| HIPAA / fintech US | No dictamen VE congregacional | `crh-content-moderation`, `crh-donations` |

## Tensiones entre marcos (resolver explícitamente)

1. **mom-test vs four-steps:** entrevistas sin sesgar (mom-test) **antes** de escalar Customer Validation (four-steps §4.0 PLAN). No saltar a «validación» con solo entusiasmo social.
2. **obviously-awesome vs blue-ocean:** posicionar en mercado existente con atributos únicos — **no** «océano azul» sin competencia.
3. **100m-offers vs monetizing-innovation:** waiver y urgencia comercial (offers) deben respetar bandas de precio y fila waiver en PROYECCION (pricing).
4. **crossing-the-chasm vs four-steps:** four-steps = pre-Day-D; chasm = expansión **post** M6 solo con retención probada.

## Reglas de edición (no negociables)

1. **Cifras:** solo PROYECCION, PRESUPUESTO, UNIT_ECONOMICS, README pack — nunca regenerar tier/cap/ARPU sin fuente.
2. **Legal/regulatorio:** MPPS, INHRR, devocionales → `crh-content-moderation`; marcar `[PENDIENTE abogado/asesor]`.
3. **Producto:** features citadas deben existir en ALINEACION o código; si no, «[roadmap]».
4. **Una sesión = una sección** por documento (misma disciplina que INCOHERENCIAS).
5. **VOLCADO / REGISTRO:** la IA propone texto; el founder valida datos personales y pendientes.
6. Tras cambio material: proponer entrada en INCOHERENCIAS o REGISTRO_PENDIENTES; `documentar-avances` si cierra hito.

## Prompt sugerido al usuario (copiar)

**Pack completo A–F:** [docs/Lanzamiento/PROMPT_PACK_LANZAMIENTO.md](../../docs/Lanzamiento/PROMPT_PACK_LANZAMIENTO.md).

```
Mejora [ARCHIVO.md] en docs/Lanzamiento usando crh-lanzamiento-docs.
Sección: [nombre]. Cifras solo del pack. Una sección por respuesta.
```

## Skills relacionadas

- `crh-startup-context` (obligatoria)
- `crh-lanzamiento-roles` (qué rol humano declara)
- `crh-investor-materials` (índice data room)
- Skills por fila de la tabla router arriba
- `documentar-avances` al cerrar sesión relevante

## Referencia externa (solo lectura humana o fetch puntual)

- [research_links.md](../../docs/crh/research_links.md) — URLs GitHub; **no** `npx skills add` masivo en CI del repo.
- Repos Tier A: `getagentseal/founder-playbook`, `shawnpang/startup-founder-skills` — lente ya destilada aquí y en skills hijas.
