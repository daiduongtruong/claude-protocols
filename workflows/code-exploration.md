# Code Exploration Workflow - CRITICAL

## Serena-First Approach
- **ALWAYS** prefer Serena's symbolic tools over Read for code files
- Use Read only for non-code files (md, txt, json, yaml, etc.)

## Code Navigation Sequence
**ALWAYS** follow this sequence for code exploration:
1. `get_symbols_overview` - Understand file structure first
2. `find_symbol` with `include_body=False` - Locate specific symbols
3. `find_symbol` with `include_body=True` - Read only what's needed

## Before Modifications
- **ALWAYS** use `find_referencing_symbols` before modifying any function/class
- This ensures you understand all impacts of your changes

## Serena Optimization Parameters
```
relative_path: "dir/"  # Always narrow search scope
include_body: false    # First pass structure only
depth: 1               # Get immediate children
```