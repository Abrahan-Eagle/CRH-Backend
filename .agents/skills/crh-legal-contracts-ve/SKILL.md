---
name: crh-legal-contracts-ve
description: Revisión checklist de contratos VE (marco iglesia B2B, SAFE, laboral). Salida [PENDIENTE abogado]. Invocar crh-empresa-ve y crh-content-moderation primero.
---

# crh-legal-contracts-ve

Skill para **preparar revisión** de documentos legales de Iglesia CRH en Venezuela. Patrones inspirados en [lawvable/awesome-legal-skills](https://github.com/lawvable/awesome-legal-skills) (Corporate, Commercial, Employment, Compliance) — **no sustituye** abogado ni asesor pastoral.

## Cuándo aplicar

- Borrador o revisión de **contrato marco** con iglesia afiliada.
- Checklist pre-firma SAFE o anexos laborales del piloto.
- Comparar versiones de T&C / privacidad (lente; abogado valida texto final).

## Obligatorio antes

1. `crh-startup-context` — tiers SAFE/cap.
2. [ESTRUCTURA_LEGAL_Y_EQUITY.md](../../docs/Lanzamiento/ESTRUCTURA_LEGAL_Y_EQUITY.md)
3. [PROPUESTA_VALOR_CLIENTE_B2B.md](../../docs/Lanzamiento/PROPUESTA_VALOR_CLIENTE_B2B.md)
4. [PLAN_MODULO_OPERATIVO_CLAVE.md](../../docs/Lanzamiento/PLAN_MODULO_OPERATIVO_CLAVE.md) §14 (datos salud)

## Checklist contrato marco iglesia (B2B)

| Ítem | Pregunta para abogado | Agente marca |
|------|----------------------|--------------|
| Partes | RIF, representación, domicilio VE correctos | `[PENDIENTE abogado]` |
| Objeto | Marketplace digital; iglesia aporta pastoral colegiado | OK pack |
| Datos / recetas | Quién es responsable de tratamiento; retención; MPPS | `[PENDIENTE abogado]` + `crh-content-moderation` |
| Pagos | Paciente paga a iglesia; CRH no custodia fondos | `crh-payments` / PLAN_METODOS_PAGO |
| Comisiones | Cuota + fee GMV alineado a PROPUESTA_VALOR | `crh-financial-model` |
| Responsabilidad | Límites; productos devocionales; cadena frío si aplica | `[PENDIENTE abogado]` |
| Terminación | Causas, preaviso, datos post-baja | `[PENDIENTE abogado]` |
| Propiedad intelectual | Panel, marca CRH, contenidos | `[PENDIENTE abogado]` |

## Checklist SAFE (revisión con abogado)

Desde `crh-startup-context` — no regenerar caps:

- Cap post-money coherente con tier (600k / 650k / 720k).
- Conversión, pro-rata, M&A — redacción no engañosa (ver ESTRUCTURA § FAQ).
- Jurisdicción y ley aplicable VE.

## Checklist laboral piloto

Roles: Co-CEO, Sales ×4, CS, Marketing, Coordinador logística (ver BRIEF).

- Tipo contrato (laboral vs honorarios).
- Confidencialidad y datos personales empleados.
- `[PENDIENTE abogado]` política local VE.

## Salida del agente

```markdown
## Revisión legal [tipo documento]
- Documento: ...
- Checklist: X/Y ítems con borrador interno OK
- Bloqueos: [PENDIENTE abogado] ...
- Bloqueos regulatorios: [PENDIENTE asesor RA] ...
```

## Reglas

1. **No redactar** cláusulas vinculantes ni plazos legales inventados.
2. **No citar** MPPS/INHRR como dictamen; usar `crh-content-moderation`.
3. Comparación de versiones: marcar cambios; no asumir que el agente «aprueba» legalmente.

## Skills relacionadas

- `crh-empresa-ve`
- `crh-content-moderation`
- `crh-church-partnerships`
- `crh-investor-materials` (SAFE en data room)
