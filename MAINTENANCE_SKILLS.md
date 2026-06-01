# Guía de Mantenimiento de Skills — CRH

> Reglas y procedimientos para crear, editar y mantener AI skills en CRH (Iglesia CRH).

## Agentes IA soportados (CRH)

Solo **Cursor** y **Gemini**. No instalar carpetas `.claude/` ni `.codex/`.

| Agente | Rutas | Rol |
|--------|-------|-----|
| **Cursor** | `.cursorrules`, `.cursor/skills/speckit-*`, `.agents/skills/` | SDD + JARVIS (primario) |
| **Gemini** | `.gemini/skills` → symlink a `.agents/skills/` | Skills dominio (espejo) |
| **Canónico** | `.agents/skills/` | Fuente única — editar skills aquí |

## Estructura de un Skill

```
.agents/skills/
├── nombre-del-skill/
│   └── SKILL.md          # Archivo principal (obligatorio)
├── setup.sh              # Symlink .gemini/skills → .agents/skills
└── sync.sh               # Sincronizar skills con AGENTS.md
```

## Formato YAML Obligatorio (Prowler Standard)

```yaml
---
name: nombre-del-skill
description: >
    Descripción del skill en una línea.
    Trigger: Cuándo debe invocarse este skill automáticamente.
license: UNLICENSED
metadata:
    author: CRH Team
    version: "1.0"
    scope: [ruta/archivo1, ruta/directorio/]
    auto_invoke:
        - "Frase corta para la tabla auto-invoke"
    triggers: keyword1, keyword2, keyword3
    related-skills: skill-a, skill-b
allowed-tools: [Read, Edit, Write, Glob, Grep, Bash, WebFetch, WebSearch, Task]
---
```

## Reglas de Coherencia

1. **Todo skill de dominio CRH** debe tener prefijo `crh-` (backend) o `crh-*-ui` (frontend)
2. **AGENTS.md** debe actualizarse al crear/eliminar skills (tabla Available Skills + tabla Auto-invoke)
3. **Nunca** modificar `.cursorrules` o `README.md` al editar skills
4. **scope** debe coincidir con rutas reales del proyecto
5. **triggers** debe usar keywords que el agente pueda matchear

## Cómo Crear un Nuevo Skill

1. Crear directorio: `.agents/skills/crh-nombre/`
2. Crear `SKILL.md` con el YAML obligatorio arriba
3. Escribir el contenido del skill (patrones, ejemplos, reglas)
4. Agregar a la tabla "Skills CRH" en `AGENTS.md` (o correr sync)
5. Correr `bash .agents/skills/sync.sh` para validar

## Scripts

| Script     | Uso                                               | Comando                        |
| ---------- | ------------------------------------------------- | ------------------------------ |
| `sync.sh`  | Regenera tablas SKILLS y AUTO-INVOKE en AGENTS.md | `python3 .agents/skills/sync.sh`  |
| `setup.sh` | Symlink Gemini → `.agents/skills` (Cursor + Gemini) | `bash .agents/skills/setup.sh` |
