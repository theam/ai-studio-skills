# Lightweight Frameworks for Engineers

Use these when they help. Don't force them. The goal is better thinking, not checkbox compliance.

---

## Core Loop: Build → Measure → Learn

From Eric Ries (Lean Startup):

```
Idea → Build MVP → Measure → Learn → [Iterate or Pivot]
```

- **Build**: Deliver the minimum that produces signal
- **Measure**: Define events, metrics, cohorts
- **Learn**: Decide — iterate, expand, pivot, or stop

**Key insight:** "Remove any feature, process, or effort that does not contribute directly to the learning you seek."

---

## MVP (Minimum Viable Product)

**Guiding question:** "What's the smallest version that validates or invalidates the hypothesis?"

Not "what's the smallest thing we can build" — but "what's the smallest thing that teaches us something."

---

## Opportunity Solution Tree (Teresa Torres)

```
Outcome (business goal)
    |
    |__ Opportunity (user need/pain)
            |
            |__ Solution (what we might build)
                    |
                    |__ Experiment (how we test it)
```

**When to use:**
- When there are many possible things to build
- When you need to stay focused on outcomes, not features
- When coordinating a team to avoid "feature list" thinking

**Key insight:** Start with a tiny opportunity. That leads to smaller solutions, which allow faster testing.

---

## Jobs To Be Done (JTBD)

```
"When I'm [situation], I want to [motivation], so I can [outcome]."
```

**Example:**
"When I'm rushing to work in the morning, I want to grab something quick at the drive-through, so I can eat while commuting."

**When to use:**
- When you need to understand *why* users do what they do, not just *what*
- When you're tempted to build features instead of solving problems

---

## Appetite vs. Estimates (Shape Up)

Instead of asking "How long will this take?" ask **"How much time is this worth to us?"**

- **Appetite:** A constraint we set based on value, not a prediction
- **Shape the solution to fit the time**, not the other way around

**When to use:**
- When scoping work
- When deciding if something is worth doing at all

---

## RICE Prioritization

| Factor | Question |
|--------|----------|
| **R**each | How many users will this affect? |
| **I**mpact | How much will it affect each user? (Scale: 3=massive, 2=high, 1=medium, 0.5=low, 0.25=minimal) |
| **C**onfidence | How sure are we about reach and impact? (100%, 80%, 50%) |
| **E**ffort | How many person-weeks? |

**Score:** (Reach × Impact × Confidence) / Effort

**When to use:**
- When comparing multiple options
- As a conversation starter, not a formula to follow blindly

---

## ICE Prioritization (Simpler)

| Factor | Question |
|--------|----------|
| **I**mpact | How much will this move the needle? |
| **C**onfidence | How sure are we? |
| **E**ase | How easy is this to do? |

Score each 1-10, multiply. Simpler than RICE for quick decisions.

---

## One-Pager / PRD (Minimum Viable)

```markdown
## Problem
[One paragraph: What's broken and for whom]

## Evidence
[What signals tell us this matters]

## Proposed Approach
[What we'll do, in plain language]

## Success Criteria
[How we'll know it worked]

## What We're NOT Doing
[Explicit scope cuts]

## Open Questions
[What we still need to figure out]
```

**Key insight:** If you can't fill this out in 30 minutes, you don't understand the problem well enough yet.

---

## North Star + Leading Indicators

**North Star:** One metric that captures ongoing value to users and business.
- Example: "Weekly active searchers who complete a purchase"

**Leading Indicators:** Early signals that predict the North Star.
- Example: "Users who search at least 3 times in first session"

**When to use:**
- When defining success for a product or feature
- When you need early feedback before the main metric moves

---

## Definition of Done (Product-Oriented)

**Not:** "Code is merged"

**Yes:**
- Delivered to users
- Measurable (we can see if it's working)
- Adopted (users are actually using it)

**Key insight:** Shipping is not success. User value is success.

---

## Reversible vs. Irreversible Decisions

| Type | How to Handle |
|------|---------------|
| **Reversible** (two-way door) | Decide fast, iterate |
| **Irreversible** (one-way door) | Take time, get more data |

Most decisions are reversible. Don't treat them like they're not.

---

## Pre-Mortem

Before starting: "Imagine it's 6 months from now and this project failed. What went wrong?"

- Surfaces risks before they happen
- Makes it safe to voice concerns
- Better than post-mortems (which come too late)
