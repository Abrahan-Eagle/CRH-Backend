---
name: requesting-code-review
description: >
  Solicitar revisión estructurada antes de merge a dev/main. Usar code-review-playbook.
  Trigger: Feature grande completa, antes de PR.
license: UNLICENSED
metadata:
  version: "1.0.0"
  upstream: superpowers:requesting-code-review
  related-skills: [code-review-playbook, code-review-excellence, github-code-review]
---

# Requesting code review — CRH Backend

Adaptado desde [superpowers](https://github.com/obra/superpowers).

## Cuándo

- Tras módulo API significativo
- Antes de merge `feature/*` → `dev`
- Antes de `dev` → `main` (producción)

## Proceso

1. **Diff acotado:**
   ```bash
   git log dev..HEAD --oneline
   git diff dev...HEAD --stat
   ```

2. **Invocar** `code-review-playbook` + checklist AppSec si auth/uploads.

3. **Contexto para revisor (humano o agente):**
   - Qué se implementó
   - Plan: `.agents/plans/implementation_plan.md`
   - Tests: salida `php artisan test`

4. **Clasificar feedback:** Crítico / Importante / Menor — arreglar Crítico antes de merge.

## CRH específico

- Sanctum, rate limits, validación uploads
- Migraciones y política AGENTS
- No secretos en diff

No requiere subagente Superpowers; usar `github-code-review` o revisión manual del usuario.
