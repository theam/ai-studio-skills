# product-analyst

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

Skill: Before adding caching, check if the bottleneck is actually
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

## Installation

**Claude Code:**
- Project: `.claude/skills/product-analyst/`
- Personal: `~/.claude/skills/product-analyst/`
- Invoke with: `/product-analyst`

**Codex:**
- Repo-scoped: `.codex/skills/product-analyst/`
- User-scoped: `~/.codex/skills/product-analyst/`
- Invoke with: `$product-analyst`

## Structure

```
product-analyst/
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
