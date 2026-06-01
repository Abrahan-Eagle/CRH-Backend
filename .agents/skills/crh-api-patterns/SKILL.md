---
name: crh-api-patterns
description: >
    Patrones de API REST de CRH. Sanctum, roles iglesia, formato de respuesta, validación y convenciones.
    Trigger: Endpoints API, controladores, middleware, autenticación, validación.
license: UNLICENSED
metadata:
    author: CRH Team
    version: "1.0"
    scope: [routes/, app/Http/]
    auto_invoke:
        - "Trabajar con endpoints o controladores"
    triggers: api, endpoint, sanctum, controller, middleware, rest
    related-skills: [laravel-specialist, security, crh-members]
allowed-tools: [Read, Edit, Write, Glob, Grep, Bash]
---

# CRH API Patterns

## Formato de respuesta

```php
// Éxito
return response()->json([
    'success' => true,
    'data' => $data,
    'message' => 'Operación exitosa',
], 200);

// Error
return response()->json([
    'success' => false,
    'message' => 'Mensaje de error',
    'errors' => $errors,
], 422);
```

## Roles

| Rol | Descripción |
|-----|-------------|
| `admin` | Configuración global, usuarios, reportes |
| `pastor` | Visión pastoral, anuncios prioritarios, eventos principales |
| `leader` | Líder de ministerio/grupo |
| `member` | Miembro de la congregación |

## Autenticación

- Laravel Sanctum para tokens móvil/web
- Rate limiting en auth y endpoints sensibles (donaciones)
- Policies por recurso (miembro solo ve su familia; líder ve su ministerio)

## Convenciones

- Prefijo API: `/api/v1/`
- Recursos en plural: `/members`, `/events`, `/announcements`
- Form Requests para validación
- API Resources para serialización consistente
- Nunca exponer datos sensibles de otros miembros sin policy

## Status codes

`200`, `201`, `400`, `401`, `403`, `404`, `422`, `429`, `500`
