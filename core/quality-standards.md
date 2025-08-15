# Code Quality Standards - CRITICAL

## NEVER (Anti-Patterns):
- **NEVER** use mocks - use real data and functionality instead
- **NEVER** disable features to avoid/hide errors
- **NEVER** return empty data without proper fallback logic
- **NEVER** add try/except blocks just to silence errors
- **NEVER** comment out tests to make them pass
- **NEVER** hardcode credentials or API endpoints
- **NEVER** patch symptoms without understanding root causes

## ALWAYS (Best Practices):
- **ALWAYS** trace errors to their root causes before fixing
- **ALWAYS** maintain feature parity when refactoring
- **ALWAYS** use dependency injection over hardcoding
- **ALWAYS** test with actual implementations, not mocks
- **ALWAYS** fix the cause, not the symptom
- **ALWAYS** preserve existing functionality when fixing bugs