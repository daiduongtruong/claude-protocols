# Setup Command

---
description: Configure Claude Code automation features (hooks, commands, subagents)
argument-hint: [--check | --reset | --update]
---

Configure Claude Code with automation features including hooks, commands, and subagents.

## Executing Setup

$IF_ARGUMENTS
Running setup with option: $ARGUMENTS
$ELSE
Running default setup configuration
$END_IF

### Step 1: Check Environment
First, verify that we're in the correct directory and have necessary permissions.

```bash
cd ~/.claude
pwd
ls -la setup.sh
```

### Step 2: Run Setup Script
Execute the setup script with the appropriate option:

$IF_ARGUMENTS
```bash
~/.claude/setup.sh $ARGUMENTS
```
$ELSE
```bash
~/.claude/setup.sh
```
$END_IF

### Step 3: Verify Configuration
After setup completes, verify the configuration was applied:

```bash
# Check if settings.json was updated
if [ -f ~/.claude/settings.json ]; then
    echo "✓ Settings file exists"
    jq '.hooks, .commands, .subagents' ~/.claude/settings.json
else
    echo "✗ Settings file not found"
fi

# Check component directories
echo -e "\nAutomation components:"
echo "Hooks: $(ls -1 ~/.claude/hooks/*.json 2>/dev/null | wc -l) configuration files"
echo "Commands: $(ls -1 ~/.claude/commands/*.md 2>/dev/null | wc -l) commands available"
echo "Subagents: $(ls -1 ~/.claude/subagents/*.md 2>/dev/null | wc -l) specialized agents"
```

## Setup Options

### Default Setup (no arguments)
- Backs up existing settings
- Merges automation configuration
- Preserves personal settings
- Verifies all paths

### --check
- Shows current configuration
- Verifies component paths
- No changes made

### --reset  
- Backs up existing settings
- Resets to default configuration
- Removes all customizations

### --update
- Updates existing configuration
- Preserves customizations
- Adds new features

## What Gets Configured

1. **Hooks Configuration**
   - Path: `~/.claude/hooks/hooks-config.json`
   - PreToolUse validations
   - PostToolUse automation
   - SessionStart context loading

2. **Commands Directory**
   - Path: `~/.claude/commands/`
   - Custom slash commands
   - Workflow automation

3. **Subagents Directory**
   - Path: `~/.claude/subagents/`
   - Specialized AI behaviors
   - Domain expertise

## Post-Setup

After successful setup:

1. **Restart Claude Code** to apply changes
2. **Test a command**: Try `/review` or `/tdd`
3. **Check logs** if issues occur: `~/.claude/logs/`

## Troubleshooting

If setup fails:
- Check for backup in `~/.claude/backups/`
- Ensure jq is installed: `brew install jq`
- Verify Claude directory exists: `ls -la ~/.claude`
- Run with check flag: `/setup --check`

## Success Indicators

You'll know setup succeeded when:
- ✓ Settings.json contains hooks, commands, subagents sections
- ✓ No error messages during execution
- ✓ Backup was created in backups directory
- ✓ Component paths verified successfully