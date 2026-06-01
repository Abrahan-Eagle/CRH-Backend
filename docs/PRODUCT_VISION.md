# Visión de Producto — Iglesia CRH

**Última actualización:** Junio 2026

## Qué es

App móvil y web para la congregación **Iglesia CRH**: conectar miembros, líderes y pastores en un solo ecosistema digital.

## Problema

La comunicación congregacional fragmentada (WhatsApp, hojas impresas, grupos dispersos) dificulta:

- Saber qué eventos vienen y inscribirse
- Recibir avisos oficiales de la iglesia
- Registrar diezmos/ofrendas con trazabilidad
- Coordinar ministerios y grupos
- Acceder a devocionales y transmisiones en vivo

## Actores

| Actor | Necesidad principal |
|-------|---------------------|
| **Miembro** | Eventos, avisos, devocional, donar, ver live |
| **Líder de ministerio** | Gestionar grupo, asistencia, comunicar a su equipo |
| **Pastor / Admin** | Comunicación global, reportes, streaming, contenido |

## Módulos

Ver [MODULES.md](MODULES.md) para mapa técnico y dependencias.

### MVP (fase 1)

1. Auth + perfiles miembros
2. Anuncios (feed)
3. Eventos (calendario + inscripción)
4. Devocional del día
5. Streaming embed (YouTube/Vimeo) + estado en vivo

### Fase 2

1. Donaciones con comprobante
2. Ministerios/grupos + asistencia
3. Directorio familias
4. Push notifications avanzadas
5. Chat grupal por ministerio

## Stack

- **Backend:** Laravel 10+, MySQL, Sanctum
- **Frontend:** Flutter (Android, iOS, Web)

## Métricas de éxito (piloto)

- % miembros activos mensuales
- Inscripciones a eventos vs asistencia
- Apertura de anuncios push
- Completitud devocional diario
- Sesiones live concurrentes

## Fuera de alcance inicial

- ERP contable completo
- Pasarela de pago automática internacional
- Red social abierta tipo feed infinito
