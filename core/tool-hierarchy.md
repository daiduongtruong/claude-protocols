# Tool Selection Hierarchy - CRITICAL

## MANDATORY Order (Check in sequence)

### 1. Serena Memories FIRST
```
ALWAYS: list_memories → read relevant memories
WHY: Zero tokens, instant access to prior knowledge
```

### 2. Serena Symbolic Tools for Code
```
NEVER use Read on code files directly
ALWAYS: get_symbols_overview → find_symbol → targeted reads
WHY: 60% token reduction vs reading entire files
```

### 3. Context7 for Library Documentation
```
ALWAYS: resolve-library-id → get-library-docs
DEFAULT: tokens:3000 (only 10000 if user says "detailed")
WHY: Focused documentation beats generic web search
```

### 4. FireCrawl for Web (NEVER WebSearch/WebFetch)
```
ALWAYS use firecrawl_search instead of WebSearch or WebFetch
MANDATORY parameters:
  maxAge: 3600000      # 500% speed boost with caching
  formats: ["markdown"] # Reduce token usage
  onlyMainContent: true # Skip noise
WHY: Returns content directly, not just links
```

## Tool Selection Priority

### For Editing
1. **MultiEdit** for multiple changes to same file
2. **Edit** for single change
3. **NotebookEdit** for Jupyter notebooks
4. **Write** only for new files

### For Running Commands
1. **Bash with run_in_background** for long operations
2. **Bash** for quick commands
3. **Parallel Bash calls** for independent commands

### For Search
1. **Grep** for content search
2. **Glob** for file patterns
3. **LS** for directory listing
4. **Never use find/grep in Bash**

## Efficiency Parameters - ALWAYS INCLUDE

### FireCrawl
- `maxAge: 3600000` - ALWAYS for caching
- `onlyMainContent: true` - ALWAYS skip navigation/ads
- `formats: ["markdown"]` - ALWAYS for token efficiency

### Context7
- `tokens: 3000` - DEFAULT for quick lookups
- `tokens: 10000` - ONLY when user requests "detailed"

### Serena
- `relative_path: "dir/"` - ALWAYS narrow search scope
- `include_body: false` - FIRST pass structure only
- `depth: 1` - Get immediate children first

## Parallel Operations
- **Batch multiple tool calls** in single message
- **Cache all external fetches** in Serena memories
- **Use run_in_background** for long operations