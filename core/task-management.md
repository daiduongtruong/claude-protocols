# Task Management Protocol - MANDATORY

## TodoWrite Usage - ALWAYS
For ANY non-trivial task:
1. **IMMEDIATELY** use TodoWrite to break down steps
2. **Mark completed AS SOON AS done** (never batch)
3. **Update status to in_progress** when starting
4. **Keep todos concise** - Task names only, no explanations

## When to Use Task Subagents

### MANDATORY Task Agent Usage (Thresholds):
- **File exploration** involving >3 files
- **Pattern search** across entire codebase
- **Research** requiring >5 tool calls
- **Analysis** before major refactoring
- **Verification** of implementation completeness

### ALWAYS Use Task for:
- **Research requiring file exploration** (>3 files)
- **Complex analysis** before implementation
- **Independent verification** of solutions
- **Parallel investigations** of approaches
- **When searching without knowing exact location**

### Task Agent Templates
```
# For Research
"Use Task to research how [FEATURE] works across the codebase"

# For Verification
"Use Task to verify this implementation handles edge cases"

# For Exploration
"Use Task to find all usages of [PATTERN] in the project"
```

## Multi-Agent Patterns

### Research Before Implementation
1. Spawn Task agent for exploration
2. Review findings
3. Implement based on research
4. Verify with another Task agent

### Parallel Processing
- Multiple Task agents for different aspects
- Don't wait sequentially - launch in parallel
- Synthesize results after all complete

## Checklist Pattern for Complex Tasks
When task has >5 steps:
```
Create TASKS.md with:
- [ ] Step 1
- [ ] Step 2
Check off as completed
```

## Anti-Patterns to AVOID
- ❌ Linear task execution without parallelization
- ❌ Explaining task breakdown verbosely
- ❌ Waiting to mark todos complete
- ❌ Not using Task agents for exploration