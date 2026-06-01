# BRAND · Iglesia CRH

> App congregacional — gestión de miembros, comunicación pastoral y vida de iglesia.

## 1. Naming canónico

| Contexto | Cómo escribirlo |
| -------- | --------------- |
| UI / copy | **Iglesia CRH** o **CRH App** |
| package id Android / bundle iOS | `com.crh.church` [PENDIENTE confirmar] |
| nombre Flutter (`pubspec.yaml`) | `crh_app` [PENDIENTE scaffold] |
| dominio web | [PENDIENTE] |
| canal FCM | `crh_fcm` |
| deep link | `crh://` [PENDIENTE paths] |

NO usar: tono comercial agresivo, lenguaje de marketplace, claims no verificados.

## 2. Paleta (placeholders — confirmar con diseño)

| Token | HEX | Uso |
| ----- | --- | --- |
| `brandPrimary` | `#2C5282` | AppBar, navegación, confianza pastoral |
| `brandSecondary` | `#4A5568` | Texto secundario |
| `brandAccent` | `#D69E2E` | CTAs cálidos, highlights |
| `brandSurfaceLight` | `#F7FAFC` | Fondo claro |
| `brandSurfaceDark` | `#1A202C` | Dark mode canvas |
| `brandSuccess` | `#38A169` | Confirmaciones |
| `brandError` | `#E53E3E` | Errores |

Variables Dart: `lib/config/theme/` (post-scaffold).

## 3. Tipografía

- **Primaria:** sistema sans legible (Inter / Source Sans 3) [PENDIENTE]
- Jerarquía clara para títulos pastorales y lectura de devocionales

## 4. Tono de voz

- Cercano, respetuoso, inclusivo
- Segunda persona donde aplique («tu congregación», «tu evento»)
- Evitar jerga startup en pantallas de miembro

## 5. Do / Don't

| Do | Don't |
|----|-------|
| Iconografía clara (calendario, corazón, libro) | Iconos médicos/comerciales |
| Contraste WCAG AA en textos | Texto gris ilegible sobre fondos claros |
| Fotos reales de comunidad (con permiso) | Stock genérico corporativo |

## 6. Referencias

- UI skill: `crh-ui-design`
- Marketing: `docs/product-marketing-context.md`
