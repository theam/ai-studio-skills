# product-analyst skill

Skill “portable” (Codex + Claude Code) para guiar a ingenieros en producto:
- recopilar contexto
- formular hipótesis y métricas
- definir plan de datos
- priorizar (Top 3)
- crear plan ejecutable y ritual de coordinación

## Estructura
- `SKILL.md` — instrucciones principales
- `references/` — filosofía, frameworks, preguntas, fuentes
- `assets/templates/` — plantillas de artefactos
- `scripts/` — utilidades opcionales

## Instalación (Codex)
- Repo-scoped: copia a `.codex/skills/product-analyst/`
- User-scoped: copia a `~/.codex/skills/product-analyst/`
Invocación explícita: `$product-analyst` (o deja que Codex la elija por descripción).

## Instalación (Claude Code)
- Project: `.claude/skills/product-analyst/`
- Personal: `~/.claude/skills/product-analyst/`
Invocación: `/product-analyst`

## Primer uso recomendado
1. Abre un proyecto/epic.
2. Ejecuta la skill y responde a las 8–12 preguntas iniciales.
3. Pide los 5 artefactos y guárdalos en una carpeta `initiatives/<nombre>/`.
4. (Opcional) crea la carpeta con: `./scripts/new-initiative.sh "<nombre>"`.

## Licencia
Interna (empresa). Ajusta según necesites.
