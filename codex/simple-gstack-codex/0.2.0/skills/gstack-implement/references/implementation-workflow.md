# Implementation Workflow

Use this for any non-trivial implementation task.

## Task Loop

For each task:

1. Read the task card and source plan section.
2. Confirm dependencies are DONE or not required.
3. Mark task `[->] IN PROGRESS` in active `tasks.md`.
4. Implement one vertical slice.
5. Add or update tests in the same slice.
6. Run the task verification command.
7. Mark `[x] DONE` only with verification evidence, or `[!] BLOCKED` with blocker details.

## Vertical Slicing

Prefer one complete path through the stack over horizontal layers:

- Contract/types first only when consumers need the contract.
- Then one usable behavior path with test coverage.
- Then edge paths, failure handling, and integration.

Avoid writing more than about 100 lines of production code without running targeted verification.

## Test-First Discipline

For behavior changes:

- Write the smallest test that proves the required behavior.
- Run it and confirm it fails for the expected reason.
- Write the minimal code to pass.
- Run it again and confirm it passes.
- Refactor only while tests stay green.

If a "new" regression test passes before the fix, revise the test or re-check the symptom; it may not be testing the intended behavior.

## Vertical TDD Loop

Do not write all tests first and then all implementation. That creates tests for imagined behavior and locks in the wrong shape too early.

Use tracer bullets:

1. Pick one behavior from the task acceptance criteria.
2. Add one focused test through the public interface.
3. Confirm it fails for the expected reason.
4. Implement only enough code to pass that test.
5. Confirm it passes.
6. Repeat for the next behavior.

Each cycle should leave the repo in a buildable, explainable state.

## Abstraction Gate

Before writing business code:

- Implement domain types and value objects required by the current task.
- Implement planned EXTRACT/shared modules before consumers.
- Check whether this slice repeats an existing data-fetch, UI, validation, conversion, or error-handling pattern.
- Extract shared code when the plan requires it, or when repetition would otherwise create meaningful maintenance cost.
- Check whether a new module is deep enough to justify its interface. If deleting it would make the complexity vanish rather than concentrate it, it is probably a pass-through.
- Treat the public interface as the test surface: callers and tests should not need private helpers, incidental ordering, or implementation knowledge.

Do not create a new abstraction for one local use unless the plan explicitly calls for it.

Read `quality-discipline.md` when the slice introduces a module, adapter, or new test surface.

## Defensive Coding

Cover:

- Null, undefined, empty, zero, maximum, malformed, stale, and unauthorized inputs.
- Timeout, retry, cancellation, and partial failure for I/O.
- User-visible error or recovery path for failures.
- Idempotency for retryable side effects.

No empty catch blocks. Catch-all handlers must add context and either recover explicitly or rethrow.

## Framework And Library Patterns

- Detect exact framework/library versions from dependency files before using version-sensitive APIs.
- Prefer established local project patterns when they are safe and current enough.
- For new framework-specific patterns, verify against official documentation when available.
- If official docs cannot be checked in the current environment, state the uncertainty and keep the implementation close to existing repo patterns.
- Do not introduce deprecated APIs knowingly.

## Diff Discipline

- Touch only task files and directly required adjacent files.
- Keep structure changes separate from behavior changes when possible.
- Remove imports and dead code orphaned by your own edits.
- Do not clean up unrelated code.
- Use the repo's existing patterns before inventing new ones.

## Commit Discipline

Only commit when requested by the user, task card, or repo workflow. If committing:

- One task per commit.
- Include task ID in the commit message when available.
- Verify before commit.
- Do not include unrelated dirty files.
