---
name: verification-before-completion
description: >
  OBLIGATORIO antes de declarar cualquier tarea completada en CRH Backend.
  Ejecuta verificación fresca (tests, rutas) y solo entonces afirma éxito. Evidencia antes de claims.
  Trigger: Antes de cerrar módulo, commit, o decir "listo/tests OK".
license: UNLICENSED
metadata:
  author: CRH Team
  version: "1.0.0"
  scope: [root]
  auto_invoke:
    - "Terminar módulo"
    - "Crear commit"
  related-skills: [systematic-debugging, jarvis-core, test-driven-development]
---

# Verificación antes de completar — CRH Backend

Adaptado desde clawvis-openclaw / Superpowers. Sin dependencias OpenClaw.

## Ley de hierro

```
NINGÚN CLAIM DE COMPLETADO SIN EVIDENCIA FRESCA DE VERIFICACIÓN EN ESTE TURNO
```

## Puerta de verificación

1. **IDENTIFICAR** qué comando prueba el claim.
2. **EJECUTAR** el comando completo (salida fresca).
3. **LEER** exit code y conteo de fallos.
4. **VERIFICAR** que el output confirma el claim.
5. **SOLO ENTONCES** declarar completado (con evidencia breve).

## Tabla por tipo de tarea (Laravel)

| Claim | Requiere | NO es suficiente |
|-------|----------|------------------|
| Tests pasan | `php artisan test` → exit 0, 0 failures | "Debería pasar", diff sin ejecutar |
| Test de módulo | `php artisan test --filter=NombreTest` | Solo leer el test |
| Endpoint nuevo | Test feature + `php artisan route:list` \| grep ruta | "Ruta en api.php" |
| Migración OK | `php artisan migrate` en entorno acordado | Solo archivo migration |
| Sin regresión suite | Suite completa o subset documentado | Un solo test aislado sin contexto |
| Commit hecho | `git log -1 --oneline` | "Hice commit" |
| Módulo cerrado | Tests + walkthrough en `.agents/plans/walkthrough.md` | Solo código sin tests |

## Comandos de referencia

```bash
cd /path/to/CRH-Backend
php artisan test
php artisan test --filter=ProductTest
php artisan route:list
```

## Banderas rojas

- "Debería", "probablemente", "parece que"
- "Listo" / "Perfecto" antes de ejecutar tests
- Confiar solo en el diff sin correr `php artisan test`

## Integración con jarvis-core

- Fase **Testing** del módulo: obligatorio invocar esta skill.
- Antes de pedir commit al usuario: evidencia de `php artisan test`.

## Regla de frescura

Evidencia de sesiones anteriores no cuenta si hubo cambios después.
