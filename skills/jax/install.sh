#!/bin/bash

# Jax Skill Installer
# Installs the Jax product thinking skill for Claude Code

set -e

SKILL_NAME="jax"
SKILL_REPO="https://raw.githubusercontent.com/AISuiteStudio/skills/main/jax"
SKILL_DIR=".claude/skills/$SKILL_NAME"
CLAUDE_MD="CLAUDE.md"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo ""
echo "=========================================="
echo "  Jax - Product Thinking Skill Installer"
echo "=========================================="
echo ""

# Check if we're in a project directory (has git, package.json, etc.)
if [[ ! -d ".git" && ! -f "package.json" && ! -f "pyproject.toml" && ! -f "Cargo.toml" ]]; then
    echo -e "${YELLOW}Warning: This doesn't look like a project root.${NC}"
    read -p "Continue anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 1
    fi
fi

# Create skill directory
echo "Creating skill directory..."
mkdir -p "$SKILL_DIR/references"

# Download skill files
echo "Downloading skill files..."

FILES=(
    "SKILL.md"
    "README.md"
    "references/00-skill-map.md"
    "references/ceo-philosophy.md"
    "references/frameworks.md"
    "references/question-bank.md"
    "references/research-sources.md"
)

for file in "${FILES[@]}"; do
    echo "  - $file"
    curl -fsSL "$SKILL_REPO/$file" -o "$SKILL_DIR/$file" 2>/dev/null || {
        echo -e "${RED}Failed to download $file${NC}"
        exit 1
    }
done

echo -e "${GREEN}Skill files installed successfully!${NC}"
echo ""

# CLAUDE.md snippet
SNIPPET='## Product Thinking (Always Active)

Before implementing any feature or task, **always invoke `/jax`** to apply product thinking.

This ensures you:
1. **Question the work**: Is this solving a real user problem? What happens if we don'\''t build it?
2. **Find the smallest version**: What'\''s the cheapest way to test if this matters?
3. **Define success**: How will we know if this worked? What metric moves?
4. **Surface assumptions**: What are we assuming that we haven'\''t validated?

When you spot opportunities to skip, simplify, or defer work — say so immediately with the impact.'

# Check if CLAUDE.md exists and already has the snippet
if [[ -f "$CLAUDE_MD" ]]; then
    if grep -q "Product Thinking (Always Active)" "$CLAUDE_MD"; then
        echo -e "${YELLOW}CLAUDE.md already has the product thinking snippet. Skipping.${NC}"
    else
        echo ""
        echo "Found existing CLAUDE.md. Would you like to add the always-on snippet?"
        echo "(This makes Jax proactive without needing to invoke /jax)"
        echo ""
        read -p "Add snippet to CLAUDE.md? (Y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Nn]$ ]]; then
            echo "" >> "$CLAUDE_MD"
            echo "$SNIPPET" >> "$CLAUDE_MD"
            echo -e "${GREEN}Added product thinking snippet to CLAUDE.md${NC}"
        else
            echo "Skipped. You can add it manually later (see README)."
        fi
    fi
else
    echo ""
    echo "No CLAUDE.md found. Would you like to create one with the always-on snippet?"
    echo "(This makes Jax proactive without needing to invoke /jax)"
    echo ""
    read -p "Create CLAUDE.md? (Y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Nn]$ ]]; then
        echo "# Project Instructions for Claude" > "$CLAUDE_MD"
        echo "" >> "$CLAUDE_MD"
        echo "$SNIPPET" >> "$CLAUDE_MD"
        echo -e "${GREEN}Created CLAUDE.md with product thinking snippet${NC}"
    else
        echo "Skipped. You can create it manually later (see README)."
    fi
fi

echo ""
echo "=========================================="
echo -e "${GREEN}  Installation complete!${NC}"
echo "=========================================="
echo ""
echo "Usage:"
echo "  - Jax is now always-on (if you added the snippet)"
echo "  - For deeper analysis, type: /jax"
echo ""
echo "Optional: Install Notion MCP for even smarter advice"
echo "  See: https://github.com/makenotion/notion-mcp-server"
echo ""
