# jax

A skill that helps engineers become **10,000X engineers** — not by writing more code, but by writing the *right* code.

## What This Skill Does

This skill acts as your **product thinking co-pilot**. It:

1. **Delivers immediate value** — No interrogation, no 12 questions. You get a quick win right away.
2. **Removes work** — Identifies things you can skip, simplify, or defer
3. **Quantifies impact** — Every insight connects to time saved, cost reduced, or metrics moved
4. **Asks at most 1-2 questions** — Open-ended, only when needed for deeper value

## When It Activates

The skill engages when you:

- Start a new task
- Define a feature
- Feel stuck on prioritization
- Question whether something is worth building
- Are about to write significant code

## How It Responds

**The first response is always a gift, not an interview.**

Example:

```
You: "I need to add caching to improve API performance"

Jax: Before adding caching, check if the bottleneck is actually
the API. If 80% of latency is in the frontend render, caching
won't help — and you'll add complexity for nothing.

**Impact:** If the bottleneck is elsewhere, you just saved
yourself a week of cache invalidation headaches.

What does the latency breakdown look like right now?
```

## The 10,000X Mindset

> The best engineers aren't the ones who write the most code. They're the ones who figure out what NOT to build, validate assumptions fast, and ship the smallest thing that creates real value.

Every feature you don't build is:
- Bugs you don't fix
- Code you don't maintain
- Complexity you don't explain
- Time you invest in what actually matters

## Requirements

### Required
- Claude Code or Codex

### Recommended: Notion MCP

The skill is **much more powerful** when connected to your team's Notion workspace. With Notion, Jax can:

- Pull real business objectives and OKRs for your project
- Reference actual user personas and target audience
- Ground advice in your specific KPIs and success metrics
- Align suggestions with your current roadmap and priorities

**Setup:**
0. You probably don't need to actively do anything. First time Jax tries to use Notion it will ask you to install it and
   guide you through the installation. If not, then follow the (usual) steps for MCP:
1. Install the [Notion MCP](https://github.com/makenotion/notion-mcp-server) in Claude Code
2. Connect it to the workspace where your project documentation lives
3. Jax will automatically detect your project and fetch relevant context

**Without Notion:** The skill still works great — it just asks you for context instead of pulling it automatically.

## Installation

### Quick Install (Recommended)

Run this from your project root:

```bash
curl -fsSL https://raw.githubusercontent.com/AISuiteStudio/skills/main/jax/install.sh | bash
```

This will:
1. Copy the skill to `.claude/skills/jax/`
2. Add the "always-on" snippet to your `CLAUDE.md`

### Manual Install

**Step 1:** Copy the skill folder to your project:

**Claude Code:**
- Project: `.claude/skills/jax/`
- Personal: `~/.claude/skills/jax/`

**Codex:**
- Repo-scoped: `.codex/skills/jax/`
- User-scoped: `~/.codex/skills/jax/`

**Step 2:** Add this to your project's `CLAUDE.md` to make Jax proactive (always-on):

```markdown
## Product Thinking (Always Active)

Before implementing any feature or task, apply product thinking automatically:

1. **Question the work**: Is this solving a real user problem? What happens if we don't build it?
2. **Find the smallest version**: What's the cheapest way to test if this matters?
3. **Define success**: How will we know if this worked? What metric moves?
4. **Surface assumptions**: What are we assuming that we haven't validated?

When you spot opportunities to skip, simplify, or defer work — say so immediately with the impact.

For deeper product thinking, invoke `/jax`.
```

### Invoke Manually

Even without the always-on snippet, you can invoke Jax anytime:
- Claude Code: `/jax`
- Codex: `$jax`

## Structure

```
jax/
├── skill.md              # Main skill instructions
├── README.md             # This file
└── references/           # Supporting knowledge (loaded when needed)
    ├── ceo-philosophy.md
    ├── frameworks.md
    ├── question-bank.md
    └── research-sources.md
```

## Example Use Cases

- "I've been asked to build X but I don't understand why"
- "Our product has low engagement and I don't know why"
- "Everything feels urgent, what should I work on?"
- "We shipped the feature but I don't know if it's working"
- "Help me write a one-pager for this initiative"

## Key Principles

From the best operators in the industry:

1. **"Make something people want"** — Paul Graham
2. **"Empowered engineers figure out how to solve problems, not just how to code"** — Marty Cagan
3. **"Great PMs don't spend their time on solutions"** — Intercom
4. **"How much time is this worth?"** — Shape Up
5. **"Done is not merged — done is delivered, measured, and adopted"** — SVPG

## Resources Referenced

- [YC Startup Library](https://www.ycombinator.com/library)
- [SVPG (Marty Cagan)](https://www.svpg.com/)
- [Teresa Torres / Product Talk](https://www.producttalk.org/)
- [Shape Up (Basecamp)](https://basecamp.com/shapeup)
- [Lenny's Newsletter](https://www.lennysnewsletter.com/)
- [First Round Review](https://review.firstround.com/)

## License

Internal use.
