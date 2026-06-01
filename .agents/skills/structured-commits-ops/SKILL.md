---
name: structured-commits-ops
description: >
  Commits con trailers de decisión (Constraint, Rejected, Confidence) en CRH Backend.
  Usar con git-commit en cambios arquitectónicos. Trigger: commit con trade-offs.
license: UNLICENSED
metadata:
  version: "1.0.0"
  related-skills: [git-commit]
---

# Structured commits ops — CRH Backend

Adaptado desde clawvis-openclaw.

## Cuándo usar

- Migraciones, auth, eventos, anuncios, ministerios
- Cambios en `AGENTS.md` / skills
- **No** en typos o formato solo

## Formato (además de conventional commit)

```
feat(ministerios): descripción

Constraint: ...
Rejected: alternativa | razón
Directive: advertencia futura
Confidence: high|medium|low
Scope-risk: narrow|moderate|broad
Not-tested: escenario no cubierto
```

## Scopes sugeridos

`auth`, `ministerios`, `chat`, `devotionals`, `orders`, `profiles`, `docs`, `agents`

## Ejemplo

```
fix(orders): reservar stock en transacción DB

Constraint: SQLite tests deben seguir pasando en paralelo
Rejected: lock optimista solo | race en prod MySQL
Confidence: high
Scope-risk: moderate
Not-tested: concurrencia >10 req/s mismo producto
```

## Checklist

- [ ] `php artisan test` ejecutado (verification-before-completion)
- [ ] Sin secretos en mensaje
- [ ] Usuario pidió commit explícitamente
