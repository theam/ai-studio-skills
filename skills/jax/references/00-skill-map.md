# Skill Map

Quick reference for what's where in this skill.

## Main File
- `SKILL.md` — Core instructions for the AI. This is what gets loaded.

## Reference Files (in `references/`)

| File | Purpose | When to Load |
|------|---------|--------------|
| `ceo-philosophy.md` | Core principles from leadership | When grounding in company values |
| `frameworks.md` | Lightweight frameworks (OST, JTBD, RICE, Shape Up, etc.) | When explaining a specific framework |
| `question-bank.md` | Power questions organized by situation | When needing targeted questions |
| `research-sources.md` | Curated learning resources (YC, podcasts, blogs, etc.) | When engineer wants to learn more |

## External Integrations

### Notion MCP (Optional but Recommended)

The skill can connect to Notion to fetch real project context (objectives, KPIs, user personas, roadmaps). This makes advice much more specific and valuable.

**Setup required by the user:**
You probably don't need to actively do anything. First time Jax tries to use Notion it will ask you to install it and 
guide you through the installation. If not, then do as with others MCPs:
1. Install and configure the Notion MCP in Claude Code
2. Connect it to the workspace containing project documentation

**What the skill does automatically:**
1. Detects project name from current folder/files
2. Searches Notion for relevant project context
3. Uses that context to ground all advice in real business objectives

**Without Notion:** The skill still works — it just asks the engineer for context or gives more general advice.

## Design Principles

1. **The skill should work without loading references** for most conversations
2. **Value first** — Don't interrogate before helping
3. **Conversational** — Think out loud with the engineer
4. **Lean artifacts** — One-pagers, not 20-page docs
5. **Context-aware** — Use Notion to ground advice in real objectives when available

## Legacy Files (Can Be Removed)

The following were part of the old rigid framework and are no longer needed:
- `assets/templates/` — Old templates (skill now generates lean artifacts inline)
- `scripts/` — Automation for old workflow
- `assets/examples/` — Examples for old templates
