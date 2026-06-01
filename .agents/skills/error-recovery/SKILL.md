---
name: error-recovery
description: >
  Heurística RETRY/REPLAN/SKIP/ABORT ante errores en desarrollo y CI. Complementa systematic-debugging.
  Trigger: Rate limit, timeout, 404, credenciales, fallos CI intermitentes.
license: UNLICENSED
metadata:
  author: CRH Team
  version: "1.0"
  adapted-from: clawvis-openclaw/jarvis-ecosystem/skills/error-recovery
  related-skills: [systematic-debugging, verification-before-completion]
  auto_invoke:
    - "Error CI intermitente o rate limit"
---

# Error Recovery — CRH

Heurística rápida para clasificar errores **antes** de aplicar fixes. Complementa `systematic-debugging` (root cause) con una decisión de acción inmediata.

## Decisiones

| Decisión | Cuándo | Acción |
|----------|--------|--------|
| **RETRY** | Rate limit (429), timeout (ETIMEDOUT), error de red intermitente | Reintentar con backoff exponencial + jitter; máx. 3 intentos (ver sección abajo) |
| **REPLAN** | Credenciales inválidas (401/403), permisos, config faltante (.env) | No reintentar ciego; revisar config, Sanctum, API keys |
| **SKIP** | 404 recurso inexistente, test de feature no implementada aún | Documentar y continuar pipeline; no bloquear scaffold |
| **ABORT** | Error desconocido, corrupción de datos, fallo persistente tras 3 retries | Escalar; invocar `systematic-debugging`; no declarar "listo" |

## Patrones comunes (CRH)

| Error | Decisión |
|-------|----------|
| `HTTP 429` / rate limit Laravel | RETRY |
| `SQLSTATE connection refused` | REPLAN (MySQL no corre) |
| `401 Unauthorized` Sanctum | REPLAN (token expirado o header) |
| `404` endpoint pre-scaffold | SKIP (spec existe, código pendiente) |
| `flutter analyze` warning nuevo | REPLAN (fix antes de merge) |
| `php artisan test` fallo intermitente | RETRY una vez, luego ABORT + debug |

## Backoff y Retry-After

Parámetros recomendados para RETRY (API externa, LLM, FCM, Zep-like):

| Parámetro | Valor | Notas |
|-----------|-------|-------|
| `max_retries` | 3 | Tras el 3.º fallo → ABORT |
| `initial_delay` | 1.0 s | Primer reintento |
| `backoff_factor` | 2.0 | 1s → 2s → 4s |
| `max_delay` | 30.0 s | Tope por intento |
| `jitter` | sí | `delay * (0.5 + random())` evita thundering herd |

### HTTP 429 (rate limit)

1. Leer header **`Retry-After`** (segundos o fecha HTTP).
2. Si existe → esperar **max(Retry-After, initial_delay)** antes del siguiente intento.
3. Si no existe → backoff exponencial con jitter.
4. Loguear intento N/3; no reintentar en bucle infinito.

### Pseudocódigo (referencia)

```
delay = initial_delay
for attempt in 0..max_retries:
  try: return call()
  catch retryable:
    if attempt == max_retries: ABORT
    wait = Retry-After ?? min(delay, max_delay) * jitter
    sleep(wait)
    delay *= backoff_factor
```

Aplica en: llamadas LLM moderación, webhooks, jobs Laravel con `ShouldBeUnique`, tests E2E flaky.

## Flujo recomendado

1. Clasificar con esta heurística.
2. Si RETRY falla 3 veces → ABORT → `systematic-debugging`.
3. Si REPLAN → verificar `.env`, `AppConfig.apiUrl`, migraciones.
4. Antes de declarar éxito → `verification-before-completion`.

## Nota

v1 es heurística local (sin LLM). Para errores complejos, usar siempre `systematic-debugging` después de ABORT.
