# Final Report Template

Use this at the end of a document-release run.

```markdown
## Documentation Health

README.md       [current|updated|needs decision] [detail]
ARCHITECTURE.md [current|updated|needs decision] [detail]
CONTRIBUTING.md [current|updated|needs decision] [detail]
CHANGELOG.md    [skipped|polished|needs decision] [detail]
TODOS.md        [skipped|updated|needs decision] [detail]
VERSION         [missing|current|needs decision|updated] [detail]

## Coverage

Surface | Reference | How-to | Tutorial | Explanation | Gap
--- | --- | --- | --- | --- | ---

Coverage summary:
- Critical gaps:
- Common gaps:
- Diagram drift:

## Changes Made

- [file]: [specific change]

## Decisions Needed

- [decision, recommendation, tradeoff]

## Verification

- Commands run:
- Files read:
- Confidence:

Status: DONE | DONE_WITH_CONCERNS
```

If docs were changed and `MILESTONES.md` exists, append:

```markdown
| YYYY-MM-DD | /document-release | Completed release documentation sync: updated [N] file(s), polished CHANGELOG [M] item(s), flagged [K] documentation gap(s) | [files] |
```
