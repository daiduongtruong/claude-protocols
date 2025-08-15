# Claude Protocols 🤖

Advanced behavioral protocols, automation hooks, and workflow optimization for Claude Code - Anthropic's AI coding assistant.

## 🚀 Quick Start

Install with one command:

```bash
curl -sSL https://raw.githubusercontent.com/daiduongtruong/claude-protocols/main/setup.sh | bash
```

Or clone and run locally:

```bash
git clone https://github.com/daiduongtruong/claude-protocols.git
cd claude-protocols
./setup.sh
```

## 📋 What's Included

### Core Protocols
- **Response Optimization** - Concise, direct responses without fluff
- **Tool Hierarchy** - Intelligent tool selection (Serena → Read, FireCrawl → WebSearch)
- **Quality Standards** - Never use mocks, fix root causes, maintain feature parity
- **Error Handling** - Systematic problem-solving and debugging
- **Git Workflows** - Proper commit messages, PR creation, atomic commits

### Specialized Subagents
- **code-reviewer** - Proactive security and quality analysis
- **test-automator** - TDD-focused test generation

### Custom Commands
- `/setup` - Configure Claude automation
- `/review` - Comprehensive code review
- `/tdd [feature]` - Test-driven development workflow

### Automation Hooks
- **PreToolUse** - Validates commands (grep→rg, find→glob)
- **PostToolUse** - Auto-format and test after edits
- **SessionStart** - Load project context
- **Stop** - Cleanup and session summary

## 🎯 Benefits

- **10x Productivity** - Automated workflows eliminate repetitive tasks
- **Zero-Defect Code** - Quality gates run automatically
- **Consistent Behavior** - Standardized responses across all projects
- **Smart Tool Usage** - Optimized parameters for 5x faster operations

## 📦 Installation Details

The setup script will:
1. Download latest protocols from this repository
2. Backup your existing configuration
3. Configure settings.json for hooks and commands
4. Create local customization directories
5. Preserve your personal settings

### Directory Structure After Installation

```
~/.claude/
├── core/                  # Core behavioral protocols
├── workflows/             # Task-specific strategies
├── integrations/          # Tool optimizations
├── subagents/            # Specialized AI behaviors
├── commands/             # Custom slash commands
├── hooks/                # Automation hooks
├── local/                # Your custom protocols (preserved)
│   ├── protocols/
│   ├── commands/
│   └── subagents/
├── CLAUDE.md             # Main configuration
├── CLAUDE.local.md       # Your customizations (preserved)
└── setup.sh              # Update script
```

## 🔄 Updating

Check for updates:
```bash
~/.claude/setup.sh --check
```

Update to latest version:
```bash
~/.claude/setup.sh --update
```

Rollback if needed:
```bash
~/.claude/setup.sh --rollback
```

## 🛠️ Customization

Your customizations are preserved in:
- `~/.claude/CLAUDE.local.md` - Personal preferences and overrides
- `~/.claude/local/` - Custom protocols, commands, and subagents

These files are never overwritten during updates.

### Adding Custom Protocols

1. Create your protocol in `~/.claude/local/protocols/my-protocol.md`
2. Import it in `CLAUDE.local.md`:
   ```markdown
   @~/.claude/local/protocols/my-protocol.md
   ```

## 📚 Protocol Categories

### Core Protocols
Essential behaviors that define how Claude operates:
- Response formatting and conciseness
- Tool selection hierarchy
- Quality standards and anti-patterns
- Error handling and debugging

### Workflows
Task-specific strategies:
- Memory management
- Code exploration patterns
- Research hierarchies
- Adaptive behaviors

### Integrations
Tool-specific optimizations:
- MCP server configurations
- FireCrawl caching parameters
- Context7 token limits

## 🤝 Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

### Areas for Contribution
- New subagents for specialized domains
- Additional workflow commands
- Protocol optimizations
- Documentation improvements
- Bug fixes and enhancements

## 📄 License

MIT License - See [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Anthropic for creating Claude and Claude Code
- The MCP (Model Context Protocol) community
- Early adopters and contributors

## 🔗 Links

- [Claude Code Documentation](https://docs.anthropic.com/en/docs/claude-code)
- [Model Context Protocol](https://modelcontextprotocol.io)
- [Report Issues](https://github.com/daiduongtruong/claude-protocols/issues)

## 💡 Philosophy

This project treats natural language as code:
- **Programming Language**: English instructions
- **Source Files**: Markdown protocols
- **Compilation**: `@import` statements compose behaviors
- **Runtime**: Claude interprets instructions
- **Output**: Optimized AI behavior

---

*Transform your Claude Code experience with battle-tested protocols and automation.*