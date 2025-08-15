# Subagent Protocol - BEHAVIORAL RULES

## Automatic Subagent Creation
When encountering these patterns, **IMMEDIATELY create subagents**:
- Exploring >3 directories or files
- Researching multiple independent topics
- Verifying implementations across codebase
- Any breadth-first exploration task

## Subagent Creation Rules
- **DEFAULT**: Create subagents WITHOUT specifying parallelism
- **ALWAYS**: Launch all subagents in single Task call
- **NEVER**: Create subagents serially (waiting for each)
- **MAXIMUM**: 10 parallel subagents (system limit)

## Delegation Behavior
When creating subagents, **ALWAYS provide**:
```
Task 1: [SPECIFIC OBJECTIVE]
- Output: [EXACT FORMAT NEEDED]
- Tools: [WHICH TOOLS TO USE]
- Scope: [CLEAR BOUNDARIES]
- Limit: [MAX TOOL CALLS]
```

## Automatic Patterns

### File Exploration
When user asks to explore/understand codebase:
```
IMMEDIATELY create 4-5 subagents:
- Backend structure analysis
- Frontend structure analysis
- Configuration/build analysis
- Tests/documentation analysis
- Dependencies/integrations analysis
```

### Research Tasks
When user asks for research/comparison:
```
IMMEDIATELY create parallel subagents for:
- Each distinct source type
- Each comparison dimension
- Each time period requested
```

### Verification Tasks
When checking implementation completeness:
```
IMMEDIATELY create subagents to verify:
- Each component separately
- Test coverage per module
- Documentation per feature
```

## Efficiency Behaviors
- **Start subagents IMMEDIATELY** - no planning delays
- **Use maximum parallelization** up to 10
- **Compress subagent outputs** when synthesizing
- **Track token usage** (expect 15× normal)

## Decision Heuristics

### USE Subagents When:
- Task naturally divides into 3+ parallel parts
- Total expected tokens >100k
- Multiple file/directory exploration needed
- Independent research streams exist

### AVOID Subagents When:
- Single file analysis
- Sequential dependencies exist
- <5 total tool calls expected
- Shared context critical

## Subagent Instructions Template
When I create subagents, I MUST:
1. Give ultra-specific objectives
2. Define exact output structure
3. Specify tool usage patterns
4. Set effort limits (tool calls)
5. Prevent scope creep

## Token Budget Allocation
- Simple: 1 agent, 3-10 calls
- Medium: 2-4 agents, 10-15 calls each
- Complex: 5-10 agents, 15-20 calls each
- Massive: Queue beyond 10 (system handles)

## Anti-Patterns I MUST AVOID
- ❌ Asking user if they want subagents
- ❌ Creating subagents one at a time
- ❌ Vague instructions like "research this"
- ❌ Not setting tool call limits
- ❌ Specifying parallelism level (unless throttling)

## Behavioral Triggers
**AUTOMATICALLY use subagents when I see**:
- "explore the codebase"
- "research multiple"
- "compare across"
- "verify all"
- "check entire"
- "analyze different"
- "find all instances"

## Result Synthesis
After subagents return:
1. **Compress findings** to key insights
2. **Deduplicate** overlapping information
3. **Structure output** clearly
4. **Preserve citations** from subagents
5. **Highlight gaps** if any found