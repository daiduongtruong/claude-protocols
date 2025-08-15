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
