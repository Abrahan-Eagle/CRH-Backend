---
name: receiving-code-review
description: >
  Evaluar feedback de review con rigor técnico; no implementar a ciegas.
  Trigger: Tras PR, comentarios usuario o agente.
license: UNLICENSED
metadata:
  version: "1.0.0"
  upstream: superpowers:receiving-code-review
---

# Receiving code review — CRH Backend

## Patrón

1. Leer todo el feedback sin reaccionar defensivo.
2. Reformular cada punto en términos técnicos.
3. **Verificar** en código Laravel/tests si aplica a este repo.
4. Implementar uno por uno con test.
5. Pushback con evidencia si el comentario no aplica.

## Prohibido

- "Tienes razón" vacío
- Implementar ítems 4–5 sin entender 1–3

## Si algo es ambiguo

Preguntar al usuario antes de cambiar comportamiento de API o migraciones.
