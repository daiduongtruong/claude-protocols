# Test-Driven Development Command

---
description: Start TDD workflow for a new feature or bug fix
argument-hint: feature-name or bug-description
---

Initiate Test-Driven Development workflow for: $ARGUMENTS

## TDD Workflow

### Phase 1: Understand Requirements
1. Clarify the feature/bug requirements
2. Identify success criteria
3. Define acceptance tests
4. Plan test scenarios

### Phase 2: Write Failing Tests (RED)
1. Create test file for the feature
2. Write comprehensive test cases:
   - Happy path scenarios
   - Edge cases
   - Error conditions
   - Performance requirements
3. Run tests to ensure they fail (no implementation yet)
4. Commit tests with message: "test: Add failing tests for $ARGUMENTS"

### Phase 3: Implement Minimum Code (GREEN)
1. Write the minimum code to pass tests
2. Focus on making tests green, not perfect code
3. No extra features or optimizations
4. Run tests continuously during implementation
5. Commit when green: "feat: Implement $ARGUMENTS (tests passing)"

### Phase 4: Refactor (REFACTOR)
1. Improve code quality while keeping tests green:
   - Extract functions/methods
   - Remove duplication
   - Improve naming
   - Optimize performance
2. Run tests after each change
3. Commit refactoring: "refactor: Clean up $ARGUMENTS implementation"

### Phase 5: Expand Coverage
1. Add additional test cases discovered during implementation
2. Test integration with existing code
3. Add E2E tests if applicable
4. Ensure minimum 80% coverage
5. Commit: "test: Expand test coverage for $ARGUMENTS"

## Test Principles
- Follow @~/.claude/core/quality-standards.md for testing
- **ALWAYS** test behavior, not implementation
- **ALWAYS** ensure tests are deterministic
- **ALWAYS** write tests first

## Checklist
- [ ] Requirements understood
- [ ] Failing tests written
- [ ] Minimum implementation complete
- [ ] All tests passing
- [ ] Code refactored
- [ ] Coverage > 80%
- [ ] Integration tests added
- [ ] Documentation updated

## Next Steps
After TDD cycle:
1. Run code review command: `/review`
2. Check performance: `/optimize`
3. Update documentation
4. Create PR with full test suite passing