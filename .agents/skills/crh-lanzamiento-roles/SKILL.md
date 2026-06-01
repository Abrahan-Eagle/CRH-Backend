---
name: crh-lanzamiento-roles
description: Panel de roles y competencias del pack Lanzamiento Iglesia CRH. Mapea rol humano → skills → Docs/Empresa/Sistema → skills agente. Usar al redactar pack inversor, constitución VE o priorizar lentes JARVIS.
---

# crh-lanzamiento-roles

Skill de **gobernanza de roles** para Iglesia CRH (piloto + madurez). Fuente canónica: [docs/Lanzamiento/ROLES_SKILLS_ZONIX.md](../../docs/Lanzamiento/ROLES_SKILLS_ZONIX.md).

## Cuándo aplicar

- Redactar, auditar o ampliar documentos en `docs/Lanzamiento/`.
- Decidir qué lente (legal, financiero, regulatorio, producto, ops) aplicar antes de codificar.
- Constitución empresa VE, SAFE, contratos B2B, T&C, privacidad (siempre con abogado/contador humanos).
- Onboarding de agentes IA: declarar roles activos en una línea al inicio de tareas no triviales.

## Cinco metas founder (routing JARVIS)

| Meta | Orden skills agente | Docs pack clave | Roles humanos piloto |
|------|---------------------|-----------------|----------------------|
| **Empresa VE** | `crh-startup-context` → `crh-empresa-ve` → esta skill | ESTRUCTURA_LEGAL, PLAN_LANZAMIENTO §2.1 | Abogado, Contador, Co-CEO |
| **Documentos** | `crh-startup-context` → **`crh-lanzamiento-docs`** (router) → skill por doc → `crh-investor-materials` | README Lanzamiento (22 archivos) | CFO lens, RA, Legal, Marketing |
| **Inversores** | `crh-startup-context` → `crh-fundraising-narrative` → `crh-investor-materials` | MENSAJE_ENVIO, CHECKLIST_PRE_INVERSOR | Founder, IR |
| **Ejecutar lanzamiento** | `crh-launch-piloto` → esta skill | PLAN_LANZAMIENTO, BRIEF | Co-CEO, Sales, CS, Marketing |
| **Desarrollo producto** | Skills módulo (`crh-prescriptions`, `crh-order-lifecycle`, …) | PLAN_RX, PLAN_MODULO, BRAND | Founder/CTO, QA |

## Invocación por tipo de tarea

| Si la tarea es… | Declarar roles (ejemplo) | Skills agente además de esta |
|-----------------|---------------------------|------------------------------|
| Pack / pitch / finanzas | CFO lens + Legal + FP&A | `crh-startup-context`, `crh-financial-model`, `crh-investor-materials`, `documentar-avances` |
| Envío inversor / bullets / Q&A | IR + Founder + Legal | `crh-fundraising-narrative`, `crh-investor-materials` |
| **Crear empresa VE** (C.A., RIF, banco, SAFE) | Legal + Contador + Co-CEO | `crh-startup-context`, **`crh-empresa-ve`**, `security-requirement-extraction` (lente) |
| **Planificar / ejecutar lanzamiento T+90** | Co-CEO + Sales + Marketing + CS | **`crh-launch-piloto`**, `crh-startup-context` (si fechas/caja) |
| Legal VE / SAFE / laboral (solo docs) | Legal + Compliance | `crh-empresa-ve`, `security-requirement-extraction` (lente) |
| Regulatorio / devocionales / copy salud | RA + Medical Affairs | `crh-content-moderation`, `crh-prescriptions`, `docs/PLAN_REGULATORIO_PHARMA_VE.md` |
| **Prospección / cierre iglesias B2B** | Sales (×4) + Co-CEO | **`crh-church-partnerships`**, `crh-launch-piloto` |
| **Desarrollo producto (sprint)** | CTO + QA | `crh-prescriptions`, `crh-order-lifecycle`, `laravel-specialist`, `flutter-expert` |
| Código backend devocionales/orders | CTO | `crh-prescriptions`, `crh-order-lifecycle`, `laravel-specialist` |
| Código eventos / realtime / check-in | COO + CTO | `crh-events`, `crh-realtime-events` |
| UI Flutter paciente/iglesia | CPO + UX Writer | `crh-ui-design`, `flutter-expert`, `crh-onboarding` |
| Seguridad / datos salud | CISO + DPO + Legal | `security` |
| Pagos VE (piloto) | Especialista pagos + Legal | `crh-payments` (modo piloto primero), `docs/Lanzamiento/PLAN_METODOS_PAGO.md` |
| Tests E2E | QA | `qa-testing-playwright`, `test-driven-development` |

## Piloto — roles con payroll o honorarios

- Founder / CEO / CTO
- Co-CEO / CEO operativo
- Sales B2B (×4)
- Customer Support + Community Manager
- Marketing Lead
- Coordinador de Partners Logísticos
- Contador externo · Abogado externo · Asesor regulatorio (Base/Growth)

## Plataforma (no empleados CRH)

- `users` (paciente) · `pastor` (iglesia) · `leader` · `partner` · `volunteer` · `admin`

## Reglas

1. **No inventar** citas MPPS/INHRR ni plazos legales; marcar `[PENDIENTE]` y remitir a asesor/abogado.
2. Skills de código **no** sustituyen dictamen legal ni pastoral.
3. CRH **no** opera flota propia; última milla = partners (`partner` / `volunteer`).
4. Cada iglesia afiliada aporta su **pastoral colegiado**; no hay leader liaison interno en piloto.
5. Tiers vigentes: **Lean [PENDIENTE]** · **Base 118k** · **Growth 135k** — no mezclar con nomenclatura legacy «Base [PENDIENTE]».

## Roles complementarios (añadir al panel si aplica)

UX Writer salud · Technical Writer · FP&A · DevOps/SRE · QA/SDET · Product Designer · Especialista pagos VE · Traductor jurídico ES-EN.

## Documentos

- Matriz completa: [ROLES_SKILLS_ZONIX.md](../../docs/Lanzamiento/ROLES_SKILLS_ZONIX.md)
- Índice pack: [README.md](../../docs/Lanzamiento/README.md)
- Research GitHub: [research_links.md](../../docs/crh/research_links.md)
- Routing JSON: [roles_matrix.json](../../docs/crh/roles_matrix.json)

## Skills inversor (orden típico)

1. `crh-startup-context` — cifras ancla
2. `crh-financial-model` o `crh-investor-materials` o `crh-fundraising-narrative` según tarea
3. Esta skill — lente de rol humano
