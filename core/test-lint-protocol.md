# Test & Lint Protocol - MANDATORY

## After Every Code Change
1. **ALWAYS run lint/typecheck** before marking complete
2. Look for commands in: package.json scripts, Makefile, README
3. Common commands:
   - `npm run lint` / `npm run typecheck`
   - `ruff check` / `mypy`
   - `cargo clippy` / `cargo check`
   - `go vet` / `golint`

## Test Execution
- Check README or package.json for test command
- Run tests after implementation
- **NEVER mock to avoid failures**
- Fix failures before proceeding

## Unknown Commands
1. Search project for lint/test scripts
2. Check CI/CD configs (.github/workflows)
3. Ask user and suggest adding to CLAUDE.md

## Enforcement
- No task is complete with failing lint/tests
- Write discovered commands to project CLAUDE.md
- Cache commands in Serena memory for project