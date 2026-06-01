---
name: crh-i18n
description: >
  Internacionalización CRH: español-first VE, Flutter ARB + Laravel lang, Accept-Language.
  Trigger: Textos UI, traducción, idioma, copy pastoral en app.
license: UNLICENSED
metadata:
  author: CRH Team
  version: "1.0"
  related-skills: [crh-ui-design, crh-flutter-arch, crh-api-patterns]
  auto_invoke:
    - "Trabajar con textos, traducción o idioma"
---

# CRH i18n — Internacionalización

CRH es **español-first** (Venezuela/LATAM). Idioma por defecto: **`es`**. Inglés (`en`) opcional en fases posteriores.

## Reglas

1. **Nunca** hardcodear strings visibles al usuario en widgets o respuestas API.
2. Claves namespaced: `module.screen.element` (ej. `auth.login.submit`).
3. Copy pastoral (anuncios, devocionales) puede ser contenido dinámico; la **UI** siempre i18n.
4. Alinear tono con `docs/BRAND_CRH.md` y `crh-ui-design`.

## Flutter (Frontend)

| Pieza | Ubicación / paquete |
|-------|---------------------|
| Dependencias | `flutter_localizations`, `intl` en `pubspec.yaml` |
| Catálogo | `lib/l10n/app_es.arb` (primario), `app_en.arb` (opcional) |
| Generación | `flutter gen-l10n` o `l10n.yaml` |
| Uso | `AppLocalizations.of(context)!.authLoginSubmit` |

```yaml
# l10n.yaml (ejemplo)
arb-dir: lib/l10n
template-arb-file: app_es.arb
output-localization-file: app_localizations.dart
```

En `MaterialApp`: `localizationsDelegates`, `supportedLocales: [Locale('es'), Locale('en')]`, `locale: Locale('es')`.

## Laravel (Backend)

| Pieza | Ubicación |
|-------|-----------|
| Strings API/validación | `lang/es/*.php` (mensajes, validation, auth) |
| Fallback | `config/app.php` → `'locale' => 'es'`, `'fallback_locale' => 'es'` |
| Por request | Middleware o `App::setLocale()` según header `Accept-Language` |

Header cliente Flutter:

```
Accept-Language: es
```

Solo activar `en` cuando existan archivos `lang/en/` completos.

## Convención de claves

| Ámbito | Prefijo | Ejemplo |
|--------|---------|---------|
| Auth | `auth.*` | `auth.login.title` |
| Miembros | `members.*` | `members.profile.save` |
| Eventos | `events.*` | `events.register.confirm` |
| Errores API | `errors.*` | `errors.network.timeout` |

## Checklist nueva pantalla

- [ ] Todas las etiquetas en ARB / lang
- [ ] Fechas y números con `intl` (`DateFormat`, `NumberFormat` para locale `es_VE`)
- [ ] Sin strings en tests que dependan de idioma fijo sin override
- [ ] Push/email: idioma del miembro (fase 2; default `es`)

## Skills relacionadas

- `crh-ui-design` — tipografía y tono visual
- `crh-flutter-arch` — estructura `lib/l10n/`
- `crh-api-patterns` — mensajes de error API consistentes
