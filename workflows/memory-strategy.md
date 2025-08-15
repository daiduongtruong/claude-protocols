# Memory Usage Strategy

## Hierarchy of Instructions
- Personal preferences → User CLAUDE.md (global)
- Project overrides → Project CLAUDE.md (local)
- Code architecture → Write to Serena memories after understanding
- External data (docs/web) → Cache in Serena memories after fetching

## When to Write Memories
- After understanding a new codebase architecture
- After fetching expensive external documentation (< 10KB)
- After complex research or analysis
- When patterns or conventions are discovered
- When test/lint/build commands are identified

## When to Read Memories
- ALWAYS check `list_memories` before starting research
- Read relevant memories based on task context
- Avoid re-reading same memory in single conversation

## What NOT to Store
- Code that's already in repository
- Large responses (> 10KB) - summarize instead
- Temporary debugging information
- User-specific preferences (use CLAUDE.md)

## Memory Naming Convention
- `architecture_[component]` - System design
- `api_[service]` - External API docs
- `commands_[type]` - Build/test/lint commands
- `config_[tool]` - Tool configurations
- `research_[topic]` - Research findings

## Memory Lifecycle
- Update when information changes
- Delete when explicitly requested by user
- Prefer updating over creating duplicates