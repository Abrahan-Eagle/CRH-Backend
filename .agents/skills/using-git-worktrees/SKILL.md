---
name: using-git-worktrees
description: >
  Crear worktree aislado antes de features grandes en CRH Backend. Ramas dev/main.
  Trigger: Módulo nuevo, plan de implementación aprobado, evitar mezclar con WIP.
license: UNLICENSED
metadata:
  version: "1.0.0"
  upstream: superpowers:using-git-worktrees
  related-skills: [writing-plans, executing-plans, jarvis-core]
---

# Using git worktrees — CRH Backend

Adaptado desde [superpowers](https://github.com/obra/superpowers).

## Cuándo usar

- Módulo API que toca migraciones + varios controladores
- Mientras hay cambios sin commitear en el worktree principal
- Tras aprobar `implementation_plan.md`

**No obligatorio** para fixes de una línea con permiso del usuario.

## Reglas CRH

- Rama base habitual: **`dev`** (pruebas test.crh.com). **`main`** solo con orden explícita (producción).
- **Nunca** implementar features en `main` sin consentimiento.
- Worktrees en `.worktrees/` (debe estar en `.gitignore`).

## Verificación seguridad

```bash
git check-ignore -q .worktrees || echo "AÑADIR .worktrees/ a .gitignore antes de continuar"
```

## Creación (plantilla)

```bash
project=$(basename "$(git rev-parse --show-toplevel)")
branch="feature/nombre-modulo"
path=".worktrees/$branch"
git worktree add "$path" -b "$branch" dev
cd "$path"
composer install
cp .env.example .env  # si aplica entorno local
php artisan test       # baseline verde
```

## Cierre

Al terminar: `finishing-a-development-branch` — merge a `dev` o PR; eliminar worktree.

```bash
git worktree remove .worktrees/feature/nombre-modulo
```
