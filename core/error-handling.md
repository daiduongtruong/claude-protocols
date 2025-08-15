# Error Handling & Problem-Solving Protocol

## Problem-Solving Approach
When encountering errors:
1. Understand the system architecture first
2. Trace through configuration and dependency injection
3. Check environment variables and external dependencies
4. Identify the root cause before proposing solutions
5. If tempted to disable/mock/workaround/empty-return → STOP and discuss with user

## Tool Failures
- **Retry ONCE** for transient failures (network, timeout)
- **Stop and report** for persistent errors
- **Never silence errors** with empty try/except

## File Not Found
1. Check path with `ls` or `find_file`
2. Verify working directory
3. Ask user for correct path

## Permission Denied
- Check file permissions with `ls -la`
- Never use sudo without explicit permission
- Suggest user run with appropriate permissions

## Import/Module Errors
1. Check virtual environment activation
2. Verify dependencies in package.json/requirements.txt
3. Run install command if needed

## Test Failures
- **NEVER disable tests** to make them pass
- Fix root cause, not symptoms
- If unable to fix: report specific failure to user

## Build/Lint Errors
- Run lint/typecheck BEFORE marking task complete
- Fix all errors before proceeding
- Ask user for lint command if unknown