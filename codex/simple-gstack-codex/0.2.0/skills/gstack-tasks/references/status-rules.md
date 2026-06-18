# Task Status Rules

Use this reference when updating existing task artifacts.

## Status Flow

```text
[ ] TODO -> [->] IN PROGRESS -> [x] DONE
                 |
                 v
            [!] BLOCKED
                 |
                 v
            [~] CANCELLED
```

## Update Triggers

| Trigger | Update |
|---|---|
| Starting implementation | Mark `[->] IN PROGRESS`. |
| Acceptance criteria complete and verified | Mark `[x] DONE` and add evidence. |
| Missing dependency | Mark `[!] BLOCKED` with reason. |
| QA finds a defect | Move back to `[->] IN PROGRESS` and reference finding. |
| Scope change removes work | Mark `[~] CANCELLED` with reason. |
| Bug fixed | Add `[FIX #id]` record or fix note. |

## DONE Evidence

Do not mark DONE without evidence:

```markdown
**Status**: [x] DONE - Verified: `npm test src/auth.test.ts` -> 8/8 passed, YYYY-MM-DD
```

Invalid evidence:

- "should pass"
- "looks good"
- "tests later"
- no command or manual check

## Fix Records

When QA or investigation fixes a task-related issue, append:

```markdown
**Fix Records**:
- [FIXED] YYYY-MM-DD - [problem and fix] - Source: `qa-findings.md` #[id]
```
