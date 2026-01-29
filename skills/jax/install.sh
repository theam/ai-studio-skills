#!/bin/bash

# Jax Skill Installer
# Installs the Jax product thinking skill globally and configures the current project

set -e

SKILL_NAME="jax"
SKILL_REPO="https://raw.githubusercontent.com/theam/ai-studio-skills/main/skills/jax"

# Install locations (user home directory - global for all projects)
CLAUDE_SKILL_DIR="$HOME/.claude/skills/$SKILL_NAME"
CODEX_SKILL_DIR="$HOME/.codex/skills/$SKILL_NAME"

# Project config files (current directory)
CLAUDE_MD="CLAUDE.md"
CODEX_MD="CODEX.md"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo ""
echo "=========================================="
echo "  Jax - Product Thinking Skill Installer"
echo "=========================================="
echo ""

# Check if we're in a project directory
if [[ ! -d ".git" && ! -f "package.json" && ! -f "pyproject.toml" && ! -f "Cargo.toml" ]]; then
    echo -e "${YELLOW}Warning: This doesn't look like a project root.${NC}"
    echo "Run this script from your project's root directory to configure CLAUDE.md/CODEX.md"
    echo ""
    read -p "Continue anyway? (y/N) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 1
    fi
fi

# Files to download
FILES=(
    "SKILL.md"
    "README.md"
)

# Function to install skill to a directory
install_to_dir() {
    local dir="$1"
    local name="$2"

    echo -e "${BLUE}Installing to $name...${NC}"

    # Create directory
    if ! mkdir -p "$dir" 2>/dev/null; then
        echo -e "${RED}  ✗ Failed to create directory $dir${NC}"
        echo -e "${RED}    Check write permissions for $(dirname "$dir")${NC}"
        return 1
    fi

    # Download each file
    for file in "${FILES[@]}"; do
        local url="$SKILL_REPO/$file"
        local output="$dir/$file"
        local error_output

        error_output=$(curl -fsSL "$url" -o "$output" 2>&1)
        local exit_code=$?

        if [[ $exit_code -ne 0 ]]; then
            echo -e "${RED}  ✗ Failed to download $file${NC}"
            echo -e "${RED}    URL: $url${NC}"
            echo -e "${RED}    Error: $error_output${NC}"
            return 1
        fi
    done

    echo -e "${GREEN}  ✓ Installed to $dir${NC}"
    return 0
}

# ============================================
# STEP 1: Install skill files globally
# ============================================

echo "Step 1: Installing skill files globally..."
echo ""

# Install to Claude Code
if install_to_dir "$CLAUDE_SKILL_DIR" "Claude Code (~/.claude/skills/$SKILL_NAME)"; then
    CLAUDE_OK=true
else
    CLAUDE_OK=false
fi

# Install to Codex
if install_to_dir "$CODEX_SKILL_DIR" "Codex (~/.codex/skills/$SKILL_NAME)"; then
    CODEX_OK=true
else
    CODEX_OK=false
fi

echo ""

# ============================================
# STEP 2: Configure project files
# ============================================

echo "Step 2: Configuring project files..."
echo ""

# Snippet to add
SNIPPET_CLAUDE='## Product Thinking (Always Active)

Before implementing any feature or task, **always invoke `/jax`** to apply product thinking.

This ensures you:
1. **Question the work**: Is this solving a real user problem? What happens if we don'\''t build it?
2. **Find the smallest version**: What'\''s the cheapest way to test if this matters?
3. **Define success**: How will we know if this worked? What metric moves?
4. **Surface assumptions**: What are we assuming that we haven'\''t validated?

When you spot opportunities to skip, simplify, or defer work — say so immediately with the impact.'

SNIPPET_CODEX='## Product Thinking (Always Active)

Before implementing any feature or task, **always invoke `$jax`** to apply product thinking.

This ensures you:
1. **Question the work**: Is this solving a real user problem? What happens if we don'\''t build it?
2. **Find the smallest version**: What'\''s the cheapest way to test if this matters?
3. **Define success**: How will we know if this worked? What metric moves?
4. **Surface assumptions**: What are we assuming that we haven'\''t validated?

When you spot opportunities to skip, simplify, or defer work — say so immediately with the impact.'

# Function to update or create config file
update_config_file() {
    local file="$1"
    local snippet="$2"
    local tool_name="$3"

    if [[ -f "$file" ]]; then
        if grep -q "Product Thinking (Always Active)" "$file"; then
            echo -e "${YELLOW}$file already has the product thinking snippet. Skipping.${NC}"
        else
            echo "Found existing $file."
            read -p "Add always-on snippet to $file? (Y/n) " -n 1 -r
            echo
            if [[ ! $REPLY =~ ^[Nn]$ ]]; then
                echo "" >> "$file"
                echo "$snippet" >> "$file"
                echo -e "${GREEN}  ✓ Added snippet to $file${NC}"
            else
                echo "  Skipped $file"
            fi
        fi
    else
        read -p "Create $file with always-on snippet? (Y/n) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Nn]$ ]]; then
            echo "# Project Instructions for $tool_name" > "$file"
            echo "" >> "$file"
            echo "$snippet" >> "$file"
            echo -e "${GREEN}  ✓ Created $file${NC}"
        else
            echo "  Skipped $file"
        fi
    fi
}

# Update CLAUDE.md
update_config_file "$CLAUDE_MD" "$SNIPPET_CLAUDE" "Claude"

echo ""

# Update CODEX.md
update_config_file "$CODEX_MD" "$SNIPPET_CODEX" "Codex"

# ============================================
# DONE
# ============================================

echo ""
echo "=========================================="

if [[ "$CLAUDE_OK" == true && "$CODEX_OK" == true ]]; then
    echo -e "${GREEN}  Installation complete!${NC}"
else
    echo -e "${YELLOW}  Installation completed with warnings${NC}"
fi

echo "=========================================="
echo ""
echo "Skill installed globally (available in all projects):"
echo "  - Claude Code: ~/.claude/skills/$SKILL_NAME/"
echo "  - Codex: ~/.codex/skills/$SKILL_NAME/"
echo ""
echo "Usage:"
echo "  - Claude Code: /jax"
echo "  - Codex: \$jax"
echo ""
echo -e "${BLUE}Optional: Install Notion MCP for smarter advice${NC}"
echo "  See: https://github.com/makenotion/notion-mcp-server"
echo ""
