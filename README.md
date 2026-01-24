# AI Studio Skills

A shared library of reusable skills for AI coding assistants (Claude Code, Cursor, Copilot, etc.). Skills are prompt-based instructions that extend what your AI assistant can do.

## What Are Skills?

Skills are markdown files that teach AI assistants how to perform specific tasks. When you invoke a skill (e.g., `/ai-data-report`), the AI reads the instructions and executes the workflow described in the file.

**Why use skills?**
- **Consistency**: Everyone on the team uses the same workflows
- **Reusability**: Write once, use across all projects
- **Knowledge sharing**: Document best practices as executable instructions

---

## Available Skills

| Skill | Command | Description |
|-------|---------|-------------|
| [AI Data Report](#ai-data-report) | `/ai-data-report` | Generates data-driven reports tracking AI tool usage, response times, and session patterns |
| [Dataset Builder](#dataset-builder) | `/aifindr-dataset-builder` | Creates test questions with expected answers from a knowledge base for evaluation |
| [Evaluator](#evaluator) | `/aifindr-evaluator` | Runs queries against an AI agent and scores responses against ground truth |
| [E2E Testing](#e2e-testing) | `/e2e-testing-knowledge-base` | Records and tests features like real user sessions with visual verification |

---

## Quick Start

### Option 1: Clone the Repo 

```bash
# Clone to a shared location
git clone https://github.com/theam/ai-studio-skills.git ~/ai-studio-skills

# Symlink to your project
ln -s ~/ai-studio-skills/skills /path/to/your-project/.claude/skills
```

### Option 2: Copy Individual Skills

```bash
# Create skills directory in your project
mkdir -p .claude/skills

# Copy the skill you need
curl -o .claude/skills/ai-data-report.md \
  https://raw.githubusercontent.com/theam/ai-studio-skills/main/skills/ai-data-report.md
```

---

---

## Skill Details

### AI Data Report

**Command:** `/ai-data-report`

Generates transparency reports about AI coding sessions. Two modes:

| Mode | When to Use | What It Generates |
|------|-------------|-------------------|
| **Initial Report** | First time on a project | Project overview, tech stack, services, deployment info |
| **Session Report** | After a work session | Changes made, commits, time breakdown (AI vs human), next steps |

**Output location:** `.claude/reports/YYYY-MM-DD-[type].md`

**Example usage:**
```
/ai-data-report
> Generate a session summary of what we accomplished
```

---

### Dataset Builder

**Command:** `/aifindr-dataset-builder`

Creates evaluation datasets by extracting questions and expected answers from your knowledge base. Uploads to Weights & Biases (W&B) Weave.

**Prerequisites:**
- W&B API key (`WEAVE_API_KEY`)
- OpenAI API key for variant generation (`OPENAI_API_KEY`)

**Workflow:**
1. Provide a query (e.g., "What does the insurance cover?")
2. AI searches your knowledge base for the answer
3. Extracts factual expected response
4. Uploads to W&B dataset with variants

**Example usage:**
```
/aifindr-dataset-builder
> Add query: "What is the deductible for health insurance?"
> Knowledge base: ./docs/policies/
> Dataset: my_eval_dataset
> Project: my-org/my-project
```

---

### Evaluator

**Command:** `/aifindr-evaluator`

Runs queries against an AI agent and evaluates responses against ground truth from your knowledge base.

**Input options:**
- Single query
- Multiple queries
- W&B Weave dataset reference

**Output:** Creates a timestamped folder with:
```
evals/{project}/runs/{YYYY-MM-DD}_{HH-MM-SS}/
├── responses.jsonl  # Raw agent responses (for auditing)
├── report.md        # Markdown evaluation report
└── results.xlsx     # Spreadsheet with color-coded verdicts
```

**Verdicts:**
| Verdict | Meaning | Color |
|---------|---------|-------|
| PASS | Accurate and complete | Green |
| PARTIAL | Correct but incomplete | Yellow |
| FAIL | Contains errors | Red |
| NO_RETRIEVAL | Sources don't contain answer | Gray |

**Example usage:**
```
/aifindr-evaluator
> Project: prj_abc123
> Knowledge base: ./docs/
> Dataset: weave:///my-org/my-project/dataset:latest
```

---

### E2E Testing

**Command:** `/e2e-testing-knowledge-base`

Comprehensive end-to-end testing using `agent-browser` CLI. Records sessions like real users for visual verification.

**What it tests:**
- Navigation (all pages load)
- CRUD operations (create, read, update, delete)
- Image uploads display correctly
- Cascade deletes work properly
- Data syncs to backend (Weaviate)

**Test flow:**
1. Create test project for isolation
2. Load test data from XLSX
3. Execute CRUD operations with screenshots
4. Verify data in backend
5. Generate test report

**Output:**
```
e2e/reports/
├── e2e-trace-{timestamp}.zip   # Browser recording
├── e2e-report-{timestamp}.md   # Test results
└── screenshots/                 # Visual verification
```

---

## Adding New Skills

### 1. Create the Skill File

Create a new file in `skills/`:

```bash
touch skills/my-new-skill.md
# OR for complex skills with scripts:
mkdir -p skills/my-new-skill
touch skills/my-new-skill/SKILL.md
```

### 2. Use the Skill Template

```markdown
---
name: my-skill-name
description: "Brief description of what the skill does. Use when asked to [trigger phrases]. Requires [prerequisites]."
---

# Skill Name

Brief overview of what this skill accomplishes.

## Prerequisites

| Requirement | Description |
|-------------|-------------|
| Tool X | Why it's needed |
| API Key Y | How to get it |

## Workflow

### Step 1: [Action]

Detailed instructions for the AI to follow.

```bash
# Example commands
```

### Step 2: [Action]

Continue with workflow steps...

## Output

Describe what the skill produces:
- Files created
- Reports generated
- Data modified

## Examples

Show example invocations and expected results.

## Troubleshooting

Common issues and how to resolve them.
```

### 3. Add Scripts (Optional)

For skills that need helper scripts:

```
skills/my-skill/
├── SKILL.md              # Main skill instructions
├── scripts/
│   ├── helper.py         # Python helper
│   └── utils.sh          # Shell utilities
└── templates/            # Output templates
```

### 4. Test Your Skill

1. Copy to a test project's `.claude/skills/`
2. Invoke with `/my-skill-name`
3. Verify the AI follows the workflow correctly
4. Iterate on instructions as needed

### 5. Submit a Pull Request

```bash
git checkout -b add-my-skill
git add skills/my-skill/
git commit -m "Add my-skill: brief description"
git push origin add-my-skill
# Open PR on GitHub
```


---

## Updating Skills

When updating existing skills:

1. Test changes locally first
2. Update version/date in skill metadata if applicable
3. Document breaking changes in PR description
4. Consider backwards compatibility

---


Made with love by [The AI Monkeys](https://theagilemonkeys.com)
