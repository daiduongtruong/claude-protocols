#!/bin/bash

# Claude Protocols - Universal Setup & Update Script
# https://github.com/daiduongtruong/claude-protocols
# 
# Installation:
#   curl -sSL https://raw.githubusercontent.com/daiduongtruong/claude-protocols/main/setup.sh | bash
#
# Update:
#   ~/.claude/setup.sh --update
#
# Check for updates:
#   ~/.claude/setup.sh --check

set -e  # Exit on error

# Configuration
REPO_OWNER="daiduongtruong"
REPO_NAME="claude-protocols"
REPO_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}"
REPO_RAW="https://raw.githubusercontent.com/${REPO_OWNER}/${REPO_NAME}"
CLAUDE_DIR="$HOME/.claude"
BACKUP_DIR="$CLAUDE_DIR/backups"
LOCAL_DIR="$CLAUDE_DIR/local"
VERSION_FILE="$CLAUDE_DIR/.claude-protocols-version"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Logging functions
print_header() {
    echo
    echo -e "${BLUE}${BOLD}═══════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}${BOLD}     Claude Protocols - Setup & Update System${NC}"
    echo -e "${BLUE}${BOLD}═══════════════════════════════════════════════════════${NC}"
    echo
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${CYAN}ℹ${NC} $1"
}

# Version management functions
get_current_version() {
    if [ -f "$VERSION_FILE" ]; then
        cat "$VERSION_FILE"
    else
        echo "none"
    fi
}

get_latest_version() {
    # Try to get latest release tag from GitHub
    local latest_tag=$(curl -s "https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/releases/latest" 2>/dev/null | grep '"tag_name"' | cut -d'"' -f4)
    
    if [ -z "$latest_tag" ]; then
        # Fallback to VERSION file from main branch
        latest_tag=$(curl -s "${REPO_RAW}/main/VERSION" 2>/dev/null)
    fi
    
    if [ -z "$latest_tag" ]; then
        echo "main"  # Fallback to main branch
    else
        echo "$latest_tag"
    fi
}

# Backup functions
backup_existing() {
    echo -e "\n${BOLD}Creating backup...${NC}"
    
    mkdir -p "$BACKUP_DIR"
    BACKUP_PATH="$BACKUP_DIR/backup_${TIMESTAMP}"
    
    # Create backup directory
    mkdir -p "$BACKUP_PATH"
    
    # Backup core files if they exist
    for item in CLAUDE.md CLAUDE.local.md core workflows integrations subagents commands hooks; do
        if [ -e "$CLAUDE_DIR/$item" ]; then
            cp -r "$CLAUDE_DIR/$item" "$BACKUP_PATH/" 2>/dev/null || true
            print_success "Backed up $item"
        fi
    done
    
    # Save backup metadata
    echo "{
  \"timestamp\": \"$TIMESTAMP\",
  \"version\": \"$(get_current_version)\",
  \"date\": \"$(date)\"
}" > "$BACKUP_PATH/metadata.json"
    
    print_success "Backup saved to: $BACKUP_PATH"
}

# Download functions
download_protocols() {
    local version="${1:-main}"
    echo -e "\n${BOLD}Downloading protocols (version: $version)...${NC}"
    
    # Create temp directory for download
    local temp_dir=$(mktemp -d)
    trap "rm -rf $temp_dir" EXIT
    
    # Download repository archive
    local archive_url
    if [ "$version" = "main" ]; then
        archive_url="${REPO_URL}/archive/refs/heads/main.tar.gz"
    else
        archive_url="${REPO_URL}/archive/refs/tags/${version}.tar.gz"
    fi
    
    print_info "Downloading from: $archive_url"
    
    if ! curl -L -s "$archive_url" | tar xz -C "$temp_dir" 2>/dev/null; then
        print_error "Failed to download protocols"
        return 1
    fi
    
    # Find extracted directory (handles both main and tag archives)
    local extracted_dir=$(ls -d "$temp_dir"/*/ | head -n1)
    
    if [ ! -d "$extracted_dir" ]; then
        print_error "Failed to extract protocols"
        return 1
    fi
    
    # Copy protocol directories
    for dir in core workflows integrations subagents commands hooks; do
        if [ -d "$extracted_dir/$dir" ]; then
            mkdir -p "$CLAUDE_DIR"
            cp -r "$extracted_dir/$dir" "$CLAUDE_DIR/"
            print_success "Updated $dir/"
        fi
    done
    
    # Copy setup script
    if [ -f "$extracted_dir/setup.sh" ]; then
        cp "$extracted_dir/setup.sh" "$CLAUDE_DIR/setup.sh"
        chmod +x "$CLAUDE_DIR/setup.sh"
        print_success "Updated setup.sh"
    fi
    
    # Copy VERSION file if exists
    if [ -f "$extracted_dir/VERSION" ]; then
        cp "$extracted_dir/VERSION" "$CLAUDE_DIR/VERSION"
    fi
    
    return 0
}

# User customization handling
setup_local_directory() {
    echo -e "\n${BOLD}Setting up local customization directory...${NC}"
    
    # Create local directory structure
    mkdir -p "$LOCAL_DIR"/{protocols,commands,subagents}
    
    # Create .gitkeep files to preserve empty directories
    touch "$LOCAL_DIR/protocols/.gitkeep"
    touch "$LOCAL_DIR/commands/.gitkeep"
    touch "$LOCAL_DIR/subagents/.gitkeep"
    
    print_success "Created local customization directories"
}

create_local_claude_md() {
    if [ ! -f "$CLAUDE_DIR/CLAUDE.local.md" ]; then
        echo -e "\n${BOLD}Creating CLAUDE.local.md for your customizations...${NC}"
        
        cat > "$CLAUDE_DIR/CLAUDE.local.md" << 'EOF'
# Local Claude Customizations

This file is for your personal customizations and will be preserved during updates.
Add your custom protocols, preferences, and overrides here.

## Personal Preferences
<!-- Add your personal preferences here -->

## Project-Specific Rules
<!-- Add rules specific to your projects -->

## Custom Workflows
<!-- Add your custom workflows here -->

## Override Protocols
<!-- Override any default protocols here -->
EOF
        
        print_success "Created CLAUDE.local.md"
    else
        print_info "CLAUDE.local.md already exists (preserving)"
    fi
}

update_claude_md() {
    echo -e "\n${BOLD}Updating CLAUDE.md...${NC}"
    
    local claude_md="$CLAUDE_DIR/CLAUDE.md"
    local temp_file=$(mktemp)
    
    # Check if CLAUDE.md exists from GitHub
    if [ ! -f "$claude_md" ]; then
        # Create from template if doesn't exist
        cat > "$claude_md" << 'EOF'
# Claude Code Behavioral Instructions

## Core Protocols
@~/.claude/core/response-protocol.md
@~/.claude/core/tool-hierarchy.md
@~/.claude/core/task-management.md
@~/.claude/core/subagent-protocol.md
@~/.claude/core/anti-patterns.md
@~/.claude/core/quality-standards.md
@~/.claude/core/git-protocols.md
@~/.claude/core/error-handling.md
@~/.claude/core/test-lint-protocol.md

## Development Principles
- ALWAYS use python virtual env when developing python projects
- ALWAYS run long-running scripts with `run_in_background` parameter
- NEVER commit unless explicitly asked by user

## Workflow Strategies
@~/.claude/workflows/memory-strategy.md
@~/.claude/workflows/code-exploration.md
@~/.claude/workflows/research.md
@~/.claude/workflows/adaptive-behavior.md

## Tool Optimizations
@~/.claude/integrations/mcp-optimization.md

## Specialized Behaviors
When user requests code review, use: @~/.claude/subagents/code-reviewer.md
When user requests TDD workflow, use: @~/.claude/subagents/test-automator.md

## Command Workflows
When user types /review, execute: @~/.claude/commands/review.md
When user types /tdd, execute: @~/.claude/commands/tdd.md
When user types /setup, execute: @~/.claude/commands/setup.md

## Automation Rules
Hooks are configured and will execute automatically based on tool usage patterns.
Follow hook validations when they appear in system messages.

## User Customizations
@~/.claude/CLAUDE.local.md
EOF
        print_success "Created CLAUDE.md with local import"
    else
        # Check if local import already exists
        if ! grep -q "@~/.claude/CLAUDE.local.md" "$claude_md"; then
            echo -e "\n## User Customizations\n@~/.claude/CLAUDE.local.md" >> "$claude_md"
            print_success "Added local customization import to CLAUDE.md"
        else
            print_info "CLAUDE.md already has local import"
        fi
    fi
}

# Settings configuration
configure_settings() {
    echo -e "\n${BOLD}Configuring settings.json...${NC}"
    
    local settings_file="$CLAUDE_DIR/settings.json"
    
    # Check for jq
    if ! command -v jq &> /dev/null; then
        print_warning "jq not installed - skipping settings.json configuration"
        print_info "Install jq for automatic settings configuration"
        return
    fi
    
    # Create or update settings.json
    if [ -f "$settings_file" ]; then
        # Backup existing settings
        cp "$settings_file" "$BACKUP_DIR/settings_${TIMESTAMP}.json"
        
        # Merge with new settings
        jq -s '.[0] * {
            hooks: {
                configPath: "~/.claude/hooks/hooks-config.json",
                enabled: true,
                logLevel: "info"
            },
            commands: {
                directory: "~/.claude/commands/",
                enabled: true
            },
            subagents: {
                directory: "~/.claude/subagents/",
                defaultAgent: "general-purpose"
            }
        }' "$settings_file" > "${settings_file}.tmp"
        
        mv "${settings_file}.tmp" "$settings_file"
        print_success "Updated settings.json"
    else
        # Create new settings.json
        cat > "$settings_file" << 'EOF'
{
  "max_output_tokens": 32000,
  "hooks": {
    "configPath": "~/.claude/hooks/hooks-config.json",
    "enabled": true,
    "logLevel": "info"
  },
  "commands": {
    "directory": "~/.claude/commands/",
    "enabled": true
  },
  "subagents": {
    "directory": "~/.claude/subagents/",
    "defaultAgent": "general-purpose"
  }
}
EOF
        print_success "Created settings.json"
    fi
}

# Version checking
check_for_updates() {
    local current=$(get_current_version)
    local latest=$(get_latest_version)
    
    echo -e "\n${BOLD}Version Information:${NC}"
    echo -e "  Current: ${CYAN}$current${NC}"
    echo -e "  Latest:  ${CYAN}$latest${NC}"
    
    if [ "$current" = "$latest" ]; then
        print_success "You are up to date!"
        return 0
    elif [ "$current" = "none" ]; then
        print_warning "No version installed - run setup to install"
        return 1
    else
        print_warning "Update available!"
        echo -e "\n  Run ${BOLD}~/.claude/setup.sh --update${NC} to update"
        return 1
    fi
}

# Rollback function
rollback() {
    echo -e "\n${BOLD}Available backups:${NC}"
    
    if [ ! -d "$BACKUP_DIR" ]; then
        print_error "No backups found"
        return 1
    fi
    
    # List backups
    local backups=($(ls -1d "$BACKUP_DIR"/backup_* 2>/dev/null | sort -r))
    
    if [ ${#backups[@]} -eq 0 ]; then
        print_error "No backups found"
        return 1
    fi
    
    for i in "${!backups[@]}"; do
        local backup="${backups[$i]}"
        local metadata="$backup/metadata.json"
        if [ -f "$metadata" ]; then
            local date=$(jq -r '.date' "$metadata" 2>/dev/null || echo "Unknown")
            local version=$(jq -r '.version' "$metadata" 2>/dev/null || echo "Unknown")
            echo "  [$((i+1))] $(basename "$backup") - Version: $version - $date"
        else
            echo "  [$((i+1))] $(basename "$backup")"
        fi
    done
    
    echo
    read -p "Select backup to restore (1-${#backups[@]}) or 0 to cancel: " choice
    
    if [ "$choice" = "0" ]; then
        print_info "Rollback cancelled"
        return 0
    fi
    
    if [ "$choice" -lt 1 ] || [ "$choice" -gt ${#backups[@]} ]; then
        print_error "Invalid selection"
        return 1
    fi
    
    local selected_backup="${backups[$((choice-1))]}"
    
    # Backup current state before rollback
    print_info "Backing up current state..."
    backup_existing
    
    # Restore from backup
    print_info "Restoring from: $(basename "$selected_backup")"
    
    for item in CLAUDE.md CLAUDE.local.md core workflows integrations subagents commands hooks; do
        if [ -e "$selected_backup/$item" ]; then
            rm -rf "$CLAUDE_DIR/$item" 2>/dev/null || true
            cp -r "$selected_backup/$item" "$CLAUDE_DIR/"
            print_success "Restored $item"
        fi
    done
    
    # Restore version file
    local backup_version=$(jq -r '.version' "$selected_backup/metadata.json" 2>/dev/null || echo "unknown")
    echo "$backup_version" > "$VERSION_FILE"
    
    print_success "Rollback complete!"
}

# Main installation/update function
main_setup() {
    local mode="${1:-install}"
    
    print_header
    
    # Check current installation
    local current_version=$(get_current_version)
    local latest_version=$(get_latest_version)
    
    if [ "$current_version" = "none" ]; then
        echo -e "${BOLD}Installing Claude Protocols...${NC}"
        mode="install"
    else
        echo -e "${BOLD}Current version:${NC} $current_version"
        echo -e "${BOLD}Latest version:${NC}  $latest_version"
        
        if [ "$current_version" = "$latest_version" ] && [ "$mode" != "force" ]; then
            print_success "Already up to date!"
            
            # Ask if user wants to reinstall
            echo
            read -p "Reinstall anyway? (y/N): " -n 1 -r
            echo
            if [[ ! $REPLY =~ ^[Yy]$ ]]; then
                exit 0
            fi
            mode="force"
        fi
    fi
    
    # Create Claude directory if it doesn't exist
    mkdir -p "$CLAUDE_DIR"
    
    # Backup existing setup
    if [ "$current_version" != "none" ] || [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
        backup_existing
    fi
    
    # Download latest protocols
    if ! download_protocols "$latest_version"; then
        print_error "Failed to download protocols"
        exit 1
    fi
    
    # Setup local customization
    setup_local_directory
    create_local_claude_md
    
    # Update CLAUDE.md with local import
    update_claude_md
    
    # Configure settings.json
    configure_settings
    
    # Update version file
    echo "$latest_version" > "$VERSION_FILE"
    
    # Display summary
    echo
    echo -e "${BLUE}${BOLD}═══════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}${BOLD}Setup Complete!${NC}"
    echo
    echo -e "${BOLD}Installed components:${NC}"
    echo "  • Core protocols"
    echo "  • Workflow strategies"
    echo "  • Subagents (code-reviewer, test-automator)"
    echo "  • Commands (/review, /tdd, /setup)"
    echo "  • Automation hooks"
    echo "  • Local customization support"
    echo
    echo -e "${BOLD}Your customizations:${NC}"
    echo "  • Personal: ~/.claude/CLAUDE.local.md"
    echo "  • Protocols: ~/.claude/local/protocols/"
    echo "  • Commands: ~/.claude/local/commands/"
    echo "  • Subagents: ~/.claude/local/subagents/"
    echo
    echo -e "${BOLD}Next steps:${NC}"
    echo "  1. Restart Claude Code to apply changes"
    echo "  2. Test with: /setup --check"
    echo "  3. Add customizations to CLAUDE.local.md"
    echo
    echo -e "${BOLD}To update in the future:${NC}"
    echo "  ~/.claude/setup.sh --update"
    echo
    echo -e "${BLUE}${BOLD}═══════════════════════════════════════════════════════${NC}"
}

# Parse command line arguments
case "${1:-}" in
    --check)
        print_header
        check_for_updates
        ;;
    --update)
        main_setup "update"
        ;;
    --force)
        main_setup "force"
        ;;
    --rollback)
        print_header
        rollback
        ;;
    --version)
        echo "Claude Protocols Version: $(get_current_version)"
        ;;
    --help)
        print_header
        echo "Usage: $0 [OPTION]"
        echo
        echo "Options:"
        echo "  --check      Check for updates"
        echo "  --update     Update to latest version"
        echo "  --force      Force reinstall"
        echo "  --rollback   Restore from backup"
        echo "  --version    Show current version"
        echo "  --help       Show this help"
        echo
        echo "Without options, performs installation or update as needed."
        ;;
    *)
        main_setup "install"
        ;;
esac