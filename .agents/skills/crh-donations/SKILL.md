---
name: crh-donations
description: >
    Diezmos y ofrendas CRH: registro, métodos de pago VE, recibos e historial.
    Trigger: Donaciones, diezmos, ofrendas, pagos, recibos.
license: UNLICENSED
metadata:
    author: CRH Team
    version: "1.0"
    scope: [app/Models/, app/Http/Controllers/]
    auto_invoke:
        - "Trabajar con donaciones o diezmos"
    triggers: donaciones, donations, diezmo, ofrenda, pago, recibo
    related-skills: [crh-api-patterns, security, crh-realtime-events]
allowed-tools: [Read, Edit, Write, Glob, Grep, Bash]
---

# CRH Donations

## Tipos

- Diezmo
- Ofrenda general
- Ofrenda a proyecto/ministerio
- Donación única

## Métodos de pago (Venezuela)

- Transferencia / Pago móvil (referencia manual + comprobante)
- Integración pasarela (fase 2)
- Efectivo registrado por admin/líder (backoffice)

## Reglas

- Miembro ve solo su historial
- Admin/pastor ve reportes agregados (no datos bancarios completos en listados)
- Recibo PDF o email tras confirmación
- Estados: `pending`, `confirmed`, `rejected`

## Máquina de estados

```
pending → confirmed
pending → rejected
(confirmed y rejected son terminales)
```

| Estado | Descripción | Quién activa |
|--------|-------------|--------------|
| `pending` | Donación registrada; comprobante en revisión | Miembro (POST) o admin (efectivo) |
| `confirmed` | Monto validado; recibo emitido | Pastor/admin |
| `rejected` | Comprobante inválido o rechazado | Pastor/admin |

### Transiciones válidas (fail-fast)

Solo estas transiciones; cualquier otra → **HTTP 400** con mensaje claro.

| Desde | Hacia | Rol permitido |
|-------|-------|---------------|
| `pending` | `confirmed` | pastor, admin |
| `pending` | `rejected` | pastor, admin |

**Reglas:**

- Miembro **nunca** confirma su propia donación.
- No hay transición desde `confirmed` o `rejected` (corrección = nueva donación o flujo admin manual documentado).
- Al cambiar estado → broadcast `DonationStatusChanged` (ver `crh-realtime-events`).

### Comprobante en revisión

Equivalente al patrón "esperando validación": la donación permanece en `pending` hasta que pastor/admin confirma o rechaza. UI muestra estado "En revisión".

## Endpoints típicos

- `POST /api/v1/donations` — registrar intención + comprobante → estado `pending`
- `PATCH /api/v1/donations/{id}/confirm` — pastor/admin → `confirmed`
- `PATCH /api/v1/donations/{id}/reject` — pastor/admin → `rejected`
- `GET /api/v1/donations/me` — historial propio
- `GET /api/v1/donations/reports` — admin (agregados por período)

## Integración tiempo real

- Evento Laravel: `DonationStatusChanged`
- Canales: `private-user.{member_id}` + push FCM al miembro
- Payload: `schema_version`, `event_id`, `type: donation.status_changed`

## Seguridad

- AppSec obligatorio: validar uploads comprobante, rate limit, no loguear datos bancarios sensibles
