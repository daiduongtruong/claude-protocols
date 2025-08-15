# Contributing to Claude Protocols

Thank you for your interest in contributing to Claude Protocols! This project aims to create the best possible behavioral protocols for Claude Code.

## 🤝 How to Contribute

### 1. Report Issues
- Use the [GitHub Issues](https://github.com/daiduongtruong/claude-protocols/issues) page
- Check if the issue already exists
- Provide clear description and steps to reproduce

### 2. Suggest Enhancements
- Open an issue with `[Enhancement]` prefix
- Explain the use case and benefits
- Provide examples if possible

### 3. Submit Pull Requests

#### Setup Development Environment
```bash
# Fork the repository on GitHub
git clone https://github.com/YOUR_USERNAME/claude-protocols.git
cd claude-protocols
git checkout -b feature/your-feature-name
```

#### Make Your Changes
1. Follow existing protocol structure
2. Test your changes locally
3. Ensure no sensitive information is included
4. Update documentation if needed

#### Commit Guidelines
```bash
# Use conventional commits
git commit -m "feat: Add new subagent for database operations"
git commit -m "fix: Correct FireCrawl parameter in tool-hierarchy"
git commit -m "docs: Update README with new command"
```

Commit types:
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation only
- `style:` Formatting, missing semicolons, etc.
- `refactor:` Code change that neither fixes a bug nor adds a feature
- `test:` Adding missing tests
- `chore:` Changes to build process or auxiliary tools

#### Submit PR
1. Push to your fork
2. Create Pull Request to `main` branch
3. Fill out PR template
4. Wait for review

## 📝 Protocol Guidelines

### Writing New Protocols
```markdown
# Protocol Name

## Purpose
Clear description of what this protocol achieves

## Rules
- **ALWAYS** do X when Y
- **NEVER** do Z
- **PREFER** A over B

## Examples
Concrete examples of the protocol in action

## Anti-patterns
What NOT to do
```

### Writing New Subagents
```markdown
---
name: subagent-name
description: One-line description
tools: Tool1, Tool2, Tool3
---

You are a [role] specialist...

## Core Principles
- Principle 1
- Principle 2

## Workflow
1. Step 1
2. Step 2
```

### Writing New Commands
```markdown
---
description: Command description
argument-hint: [optional-args]
---

Command workflow description...

## Process
1. First action
2. Second action
```

## 🧪 Testing

Before submitting:
1. Test the setup script: `./setup.sh --check`
2. Verify protocols load correctly in Claude
3. Test any new commands or subagents
4. Ensure backward compatibility

## 📋 Code of Conduct

### Our Standards
- Be respectful and inclusive
- Welcome newcomers and help them get started
- Accept constructive criticism
- Focus on what's best for the community
- Show empathy towards others

### Unacceptable Behavior
- Harassment or discrimination
- Publishing others' private information
- Trolling or insulting comments
- Public or private harassment
- Other unprofessional conduct

## 🎯 Areas We Need Help

### High Priority
- [ ] Domain-specific subagents (DevOps, Data Science, Mobile)
- [ ] Language-specific protocols (Python, TypeScript, Go, Rust)
- [ ] Performance optimization strategies
- [ ] Security best practices

### Documentation
- [ ] Video tutorials
- [ ] Example use cases
- [ ] Troubleshooting guides
- [ ] Translation to other languages

### Testing
- [ ] Cross-platform testing (Windows, Linux)
- [ ] Edge case protocols
- [ ] Performance benchmarks

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 🙏 Recognition

Contributors will be recognized in:
- GitHub contributors page
- README acknowledgments (for significant contributions)
- Release notes

## 💬 Questions?

- Open a [Discussion](https://github.com/daiduongtruong/claude-protocols/discussions)
- Ask in Issues with `[Question]` prefix

Thank you for helping make Claude Protocols better for everyone! 🚀