# MCP Server Optimization

## Efficiency Parameters (MANDATORY)
See @~/.claude/core/tool-hierarchy.md for standard parameters

## Parallel Operations
- **Batch tool calls** - Send multiple tool calls in single message for parallel execution
- **Cache all external fetches** in Serena memories for reuse

## Anti-Patterns to AVOID
- ❌ Using Read on code files without trying symbolic tools first
- ❌ Using WebSearch when firecrawl_search is available  
- ❌ Calling FireCrawl without maxAge parameter
- ❌ Fetching same Context7 docs multiple times
- ❌ Reading entire files when only specific symbols are needed
- ❌ Not checking Serena memories before external searches