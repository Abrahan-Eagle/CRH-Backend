---
name: crh-llm-judge
description: >
  Auditoría LLM-as-judge antes de publicar contenido pastoral masivo. Salida JSON score + must_fix.
  Complementa crh-content-moderation. Trigger: Moderación pre-publicación, anuncios, devocionales, push.
license: UNLICENSED
metadata:
  author: CRH Team
  version: "1.0"
  related-skills: [crh-content-moderation, crh-announcements, crh-devotionals]
  auto_invoke:
    - "Auditoría LLM pre-publicación"
---

# CRH LLM-as-Judge

**Propósito:** segunda opinión automática sobre calidad/riesgo **antes** de publicar anuncios, devocionales o push masivos. Complementa `crh-content-moderation` (que define el flujo); esta skill define el **formato JSON** y las rúbricas.

**No reemplaza** revisión humana del pastor. Si `must_fix` ≠ [], **no publicar** hasta corrección.

## Cuándo invocar

- Antes de publicar anuncio masivo (`crh-announcements`).
- Antes de publicar devocional del día (`crh-devotionals`).
- Antes de enviar push FCM a toda la congregación.
- Tras generar copy con IA para contenido pastoral.

## Salida JSON estándar

```json
{
  "score": 0.0,
  "threshold_pass": 0.75,
  "category": "anuncio_pastoral|devocional|evento_copy|push_notification|other",
  "riesgos": [],
  "must_fix": [],
  "sugerencias": [],
  "requiere_revision_pastor": false
}
```

- **`score`:** 0–1 (calidad global para publicación).
- **`must_fix`:** si no está vacía → **no** publicar hasta resolver.
- **`requiere_revision_pastor`:** true si hay duda teológica, sensibilidad pastoral o PII.

## Rúbricas

### anuncio_pastoral

| Criterio | Peso |
|----------|------|
| Tono pastoral respetuoso (no comercial agresivo) | 25% |
| Claridad del mensaje y CTA único | 20% |
| Alineación con `docs/BRAND_CRH.md` | 20% |
| Sin promesas falsas ni claims médicos/financieros | 25% |
| Privacidad (no exponer datos sensibles de miembros) | 10% |

### devocional

| Criterio | Peso |
|----------|------|
| Fidelidad bíblica / citas correctas | 35% |
| Tono accesible para congregación mixta | 25% |
| Longitud apropiada (lectura móvil) | 15% |
| Sin doctrina controvertida sin contexto | 25% |

### evento_copy

| Criterio | Peso |
|----------|------|
| Fecha, lugar y hora claros | 30% |
| CTA de inscripción evidente | 20% |
| Tono invitacional (no presión) | 25% |
| Información práctica completa | 25% |

### push_notification

| Criterio | Peso |
|----------|------|
| Título ≤ 50 caracteres, cuerpo ≤ 120 | 20% |
| Un solo propósito por push | 30% |
| No spam / no urgencia falsa | 30% |
| Deep link válido si aplica | 20% |

## Robustez de parseo JSON (respuesta LLM)

Los modelos a veces devuelven prosa, markdown o JSON truncado. Antes de evaluar `score`/`must_fix`:

1. **Limpiar fences:** quitar bloques ` ```json ... ``` ` del texto crudo.
2. **Parseo directo:** `json.loads(texto_limpio)`.
3. **Extracción:** si falla, buscar el primer `{` y parsear el primer objeto JSON válido (`raw_decode`).
4. **Fallback `reasoning`:** si `content` viene vacío pero el proveedor envía texto en campo alternativo (`reasoning`, `model_extra`), usar ese texto como entrada al paso 1–3.
5. **Fallo final:** si no hay JSON válido → `requiere_revision_pastor: true`, no publicar, log sin PII.

Orden de confianza: JSON puro > JSON en markdown > subcadena extraída > revisión humana.

## Integración

1. Invocar `crh-content-moderation` para el flujo completo.
2. Usar esta skill para el **formato de salida**, rúbricas CRH y parseo robusto.
3. Registrar score en notas internas; no loguear PII.

## Skills relacionadas

- `crh-content-moderation`
- `crh-announcements`
- `crh-devotionals`
