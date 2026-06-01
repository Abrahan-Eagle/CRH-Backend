---
name: crh-content-moderation
description: >
    Moderación LLM-as-judge antes de publicar anuncios, devocionales o contenido pastoral masivo.
    Salida JSON score + must_fix. No sustituye revisión humana.
    Trigger: Moderación contenido, anuncios, devocionales publicados.
license: UNLICENSED
metadata:
    author: CRH Team
    version: "1.0"
    scope: [app/Services/]
    auto_invoke:
        - "Moderar contenido pastoral o anuncios"
    triggers: moderación, contenido, anuncio, devocional, llm judge
    related-skills: [crh-announcements, crh-devotionals, security]
allowed-tools: [Read, Edit, Write, Glob, Grep]
---

# CRH Content Moderation

## Propósito

Segunda opinión automática **antes** de:

- Publicar anuncio global (pastor/admin)
- Publicar devocional del día
- Enviar notificación push masiva

Si `score < threshold` o `must_fix` no vacío → **bloquear** hasta corrección o revisión humana.

## Salida JSON

```json
{
  "score": 0.0,
  "threshold_pass": 0.75,
  "category": "announcement|devotional|push_mass|other",
  "riesgos": [],
  "must_fix": [],
  "sugerencias": [],
  "requires_human": true
}
```

## Rúbricas CRH

### announcement

- Tono pastoral apropiado, sin lenguaje divisivo
- Sin datos personales de terceros
- CTA claro y verificable

### devotional

- Alineación con pasaje citado
- Sin doctrina controvertida no acordada con liderazgo (flag `requires_human`)

### push_mass

- Frecuencia razonable; no spam
- Opt-in respetado

## Parseo JSON de la respuesta LLM

Antes de aplicar `threshold_pass` o `must_fix`, normalizar la salida del modelo (detalle en `crh-llm-judge`):

- Limpiar fences markdown ` ```json `.
- Extraer primer objeto `{...}` si el modelo mezcló prosa y JSON.
- Si `content` vacío, intentar campo alternativo del proveedor (`reasoning`).
- Sin JSON válido → bloquear publicación y marcar `requires_human: true`.

## Seguridad

- No enviar PII a modelos externos sin política explícita
- Logs sin contenido completo del mensaje en producción
