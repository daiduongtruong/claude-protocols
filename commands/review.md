# Code Review Command

---
description: Comprehensive code review with security, performance, and quality checks
argument-hint: [optional-file-path]
---

Perform a comprehensive code review following our standards.

$IF_ARGUMENTS
Focus review on: $ARGUMENTS
$ELSE
Review all recent changes (git diff)
$END_IF

## Review Process

1. **Scope Analysis**
   - Run `git status` to see changed files
   - Run `git diff` to see actual changes
   - Identify critical paths and security-sensitive code

2. **Security Review**
   - Check for hardcoded credentials
   - Validate input sanitization
   - Review authentication/authorization
   - Check for injection vulnerabilities
   - Verify encryption of sensitive data

3. **Code Quality Review**
   - Check adherence to project conventions
   - Verify DRY principle (no duplication)
   - Assess code readability and maintainability
   - Review naming conventions
   - Check for code smells

4. **Performance Review**
   - Identify inefficient algorithms
   - Check database query optimization
   - Review caching strategies
   - Assess memory usage
   - Check for potential bottlenecks

5. **Testing Review**
   - Verify test coverage for new code
   - Check test quality (not just coverage)
   - Ensure no mocks (real implementations only)
   - Validate edge case handling

6. **Documentation Review**
   - Check inline documentation
   - Verify API documentation updates
   - Review README changes if needed
   - Ensure type definitions are complete

## Output Format

Provide structured feedback:

### 🚨 CRITICAL (Must Fix)
- Security vulnerabilities
- Data loss risks
- Breaking changes

### ⚠️ IMPORTANT (Should Fix)
- Performance issues
- Code quality problems
- Missing tests

### 💡 SUGGESTIONS (Consider)
- Refactoring opportunities
- Better patterns
- Optimization ideas

### ✅ EXCELLENT
- Highlight good practices
- Commend security measures
- Praise clean code

After review, ask if I should:
1. Fix critical issues immediately
2. Create GitHub issues for findings
3. Implement suggested improvements