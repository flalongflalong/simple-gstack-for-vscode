# Done Gate

Use before claiming work is complete, marking a task DONE, committing, or moving to the next task.

## Evidence Before Claims

No completion claim without fresh verification evidence from this turn after the latest relevant edit.

## Required Sequence

1. Identify the command or manual check that proves the task.
2. Run the full relevant command, not a weaker substitute.
3. Read output and exit code.
4. Check every acceptance criterion.
5. Inspect `git diff --stat` or equivalent to confirm scope.
6. Run a simplicity check: remove avoidable abstraction, cleverness, or unused flexibility.
7. Run a quality check: behavior tests use public interfaces, mocks stay at system boundaries, and new modules are not pass-through wrappers.
8. Record evidence in `tasks.md` and final response.

## Task DONE Evidence

Use this form in `tasks.md`:

```markdown
**Status**: [x] DONE - Verified: `npm test src/auth.test.ts` -> 8/8 passed, YYYY-MM-DD
```

If verification cannot run, do not mark DONE. Mark BLOCKED or explain the unverified state.

## Not Enough

- Previous test run before later edits.
- Linter passing when build or tests are required.
- "Should pass", "looks good", or "I believe".
- Partial checks when task verification requires full command.
- Another agent or tool saying success without local inspection.

## Regression Test Check

For bug fixes and regressions:

- The test must fail without the fix or clearly assert the original symptom.
- The test must pass with the fix.
- If red-green cannot be demonstrated, state why and use the strongest available verification.
