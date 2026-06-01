---
name: crh-fundraising-narrative
description: Narrativa fundraising Iglesia CRH — pitch bullets, email/WhatsApp inversor, Q&A SAFE pre-seed VE. Basado en MENSAJE_ENVIO y CONTEXTO_PITCH. Invocar crh-startup-context primero.
---

# crh-fundraising-narrative

Combina ideas de [pitch-deck](https://github.com/shawnpang/startup-founder-skills/tree/main/skills/pitch-deck), [fundraising-email](https://github.com/shawnpang/startup-founder-skills/tree/main/skills/fundraising-email) y lente CFO ([c-level-advisor](https://github.com/alirezarezvani/claude-skills/tree/main/c-level-advisor)). **Siempre** `crh-startup-context` primero.

## Cuándo aplicar

- Redactar o pulir [MENSAJE_ENVIO_Y_BULLETS_INVERSIONISTA.md](../../docs/Lanzamiento/MENSAJE_ENVIO_Y_BULLETS_INVERSIONISTA.md).
- Preparar guion reunión 30 min (orden README pack).
- Q&A inversor: capital, SAFE, regulación, competencia, equipo.

## Fuentes canónicas (no contradecir)

| Documento | Contenido narrativo |
|-----------|---------------------|
| MENSAJE_ENVIO_Y_BULLETS_INVERSIONISTA | Texto corto listo para enviar |
| CONTEXTO_PITCH_Y_DECISIONES | Diferenciación, decisiones, earned secret |
| BRIEF_UNA_PAGINA | One-pager |
| CHECKLIST_PRE_INVERSOR | FAQ y objeciones |
| ESTRUCTURA_LEGAL_Y_EQUITY | SAFE, cap, vehículo VE |

## Estructura pitch (10–12 slides outline)

1. **Problema** — acceso iglesia Valencia, devocionales, última milla
2. **Solución** — Iglesia CRH marketplace + validación pastoral colegiado
3. **Por qué ahora** — stack listo, regulación datos VE 2025, competencia digital
4. **Producto** — demo / capturas (no inventar features fuera de código)
5. **Modelo negocio** — ARPU + % GMV; pagos manuales
6. **Tracción / piloto** — Fase 0 T+90, iglesias objetivo SAM
7. **Mercado** — TAM/SAM citados PERFIL_MERCADO (con fuente)
8. **Unit economics** — CAC, LTV, payback (UNIT_ECONOMICS)
9. **Finanzas** — Lean [PENDIENTE], M11 equilibrio, caja M12 ~42k
10. **Equipo** — piloto lean + externos
11. **Legal** — SAFE cap 600k, C.A. VE [PENDIENTE abogado]
12. **Ask** — wire [PENDIENTE] (o 118k recomendado) + uso de fondos

## Mensaje corto (WhatsApp / email)

Plantilla — rellenar solo desde pack:

```
Iglesia CRH — app congregacional Valencia (miembros, eventos, donaciones).
Pedimos USD [101|118|135]k pre-seed vía SAFE cap [600|650|720]k.
Stack en producción; piloto Day-D T+90. Data room: [enlace carpeta].
¿30 min esta semana?
```

Personalizar tono founder; **no** cambiar cifras sin actualizar README.

## Variantes email (adaptado fundraising-email / made-to-stick)

Usar al editar MENSAJE_ENVIO; **misma cifra** en las tres variantes.

### Corto (~80 palabras)

Asunto: `Iglesia CRH — pre-seed Valencia (SAFE)`

Cuerpo: problema en 1 frase → solución marketplace devocionales/OTC → ask wire tier + cap → CTA 30 min + enlace carpeta `docs/Lanzamiento/README.md`.

### Medio (~150 palabras)

Añadir: earned secret (CONTEXTO_PITCH), 1 bullet tracción técnica (stack listo, ALINEACION), 1 bullet piloto (Day-D T+90, iglesias SAM).

### Largo (para data room previo)

Añadir: tabla use of funds en 3 líneas (Fase 0 / nómina / marketing desde PRESUPUESTO §2), link CHECKLIST_PRE_INVERSOR, disclaimer legal VE `[PENDIENTE abogado]`.

**SUCCES (made-to-stick)** para 1 bullet memorable en pitch: **Simple** — «marketplace iglesia con pastoral de cada local»; **Unexpected** — pagos manuales VE, sin ser banco; **Concrete** — USD [PENDIENTE], 90 días a Day-D; **Credible** — tests/backend en ALINEACION; **Emotional** — acceso medicamentos Valencia; **Story** — founder con stack en producción.

## Posicionamiento (obviously-awesome — CONTEXTO_PITCH)

Plantilla de 1 párrafo al auditar CONTEXTO_PITCH:

1. **Competitive alternatives:** Tithe.ly digital, Rappi, WhatsApp informal.
2. **Unique attributes:** devocionales con validación por pastoral de la iglesia; uni-pharmacy; VE payments manuales.
3. **Value:** pedido confiable OTC/devocionales + tracking sin flota CRH.
4. **Target customer:** iglesias independientes Valencia metro + paciente urbano.
5. **Market category:** app congregacional digital (no «delivery de comida»).

## Cialdini — cierre inversor (influence)

Lente [founder-playbook `influence`](https://github.com/getagentseal/founder-playbook). Aplicar en MENSAJE_ENVIO, reunión y CHECKLIST §8 — **sin** manipulación ni cifras inventadas.

| Principio | Aplicación CRH | Dónde en pack |
|-----------|------------------|---------------|
| **Reciprocity** | Compartir BRIEF + índice data room antes de pedir reunión; demo preparada | MENSAJE §2; README pack |
| **Social proof** | **399 tests** backend; comparable Planning Center LatAm financiable | MENSAJE §1; PERFIL_MERCADO |
| **Scarcity** | Ronda Lean **[PENDIENTE]** acotada; waiver **10 iglesias** piloto (no ilimitado) | README cifras; PROPUESTA B2B §11 |
| **Authority** | Founder stack ~4 años; LinkedIn; track record Corral X si aplica | VOLCADO §1; CONTEXTO_PITCH §1 |
| **Consistency** | SAFE estándar YC adaptado VE; decisiones documentadas en CONTEXTO | ESTRUCTURA_LEGAL |
| **Liking** | Español claro; explicar SAFE/cap; sin arrogancia técnica | Tono § abajo |

**En reunión (CHECKLIST §8):** cerrar con próximo paso concreto (SAFE en 14–21 días) y pedir feedback si rechaza (mantener relación).

## Q&A frecuente (respuestas ancladas)

| Pregunta | Dirección de respuesta | Fuente |
|----------|------------------------|--------|
| ¿Por qué iglesia digital VE? | Fragmentación, devocionales, adopción SaaS multi-iglesia | CONTEXTO_PITCH |
| ¿Regulación? | MPPS, INHRR, pastoral por iglesia | PLAN_REGULATORIO + asesor |
| ¿Pagos? | Manuales; CRH no es banco | PLAN_METODOS_PAGO |
| ¿Competencia? | Farmatodo, Locatel, Planning Center | PERFIL_MERCADO |
| ¿Runway? | 12m post-Day-D + Fase 0 | PROYECCION |
| ¿Dilución? | ~16,8% Lean ref. | ESTRUCTURA_LEGAL |
| ¿Riesgo founder? | Contingencia documentada ANALISIS_FORENSE | pack |

Marcar `[PENDIENTE asesor/abogado]` en temas sin dictamen.

## Tono y restricciones

- Español claro; evitar jerga VC sin explicar (SAFE, cap).
- **No** claims terapéuticos ni promesas de curación (regulatorio).
- **No** prometer ingresos garantizados a inversor.
- Historia = problema real Valencia + equipo ejecutor + números conservadores.

## Skills relacionadas

- `crh-startup-context` (obligatoria)
- `crh-investor-materials` (data room completo)
- `crh-financial-model` (si preguntan tablas)
- `crh-content-moderation` (preguntas MPPS/devocionales)
- `crh-lanzamiento-roles` (declarar lente IR + Legal)
