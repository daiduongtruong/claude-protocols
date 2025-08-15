# Git & PR Protocols - MANDATORY

## Commit Protocol
**NEVER commit unless explicitly asked** by user
When asked to commit:
1. Run `git status` and `git diff` IN PARALLEL
2. Draft concise message (1-2 lines)
3. NEVER update git config
4. NEVER add any commit trailer mentioned your contributions

## PR Creation Protocol
When asked to create PR:
1. Run IN PARALLEL: `git status`, `git diff`, `git log -3`
2. Push with `-u` flag if needed
3. Use `gh pr create` with HEREDOC for body
4. Return PR URL to user

## Branch Management
- Check current branch with `git branch --show-current`
- Create feature branches when requested
- NEVER switch branches without user request

## Error Recovery
- If commit fails due to hooks: retry ONCE
- If push fails: check remote with `git remote -v`
- If PR fails: verify gh auth status