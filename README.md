# AI Studio Skills

Shared skills for AI coding assistants (Claude Code, Cursor, Copilot, etc.)

## Available Skills

| Skill | Description | Command |
|-------|-------------|---------|
| [AI Data Report](skills/ai-data-report.md) | Generates data-driven reports of AI coding sessions | `/ai-data-report` |

## How to Use

### 1. Copy to your project
```bash
# Create skills directory in your repo
mkdir -p .claude/skills .claude/reports

# Copy the skill(s) you want
curl -o .claude/skills/ai-data-report.md https://raw.githubusercontent.com/theam/ai-studio-skills/main/skills/ai-data-report.md
```

### 2. Invoke in your AI assistant
```
/ai-data-report
```

### 3. Reports are saved to
```
.claude/reports/YYYY-MM-DD-[type].md
```

## Contributing

1. Create a new skill in `skills/`
2. Follow the template format
3. Submit a PR

## Skills Roadmap

- [ ] Auto-sync reports to Notion
- [ ] Cost tracking per session
- [ ] Learnings/takeaways section
- [ ] Compare AI time vs estimated manual time

---

Made with 🤖 by [The Agile Monkeys](https://theagilemonkeys.com)
