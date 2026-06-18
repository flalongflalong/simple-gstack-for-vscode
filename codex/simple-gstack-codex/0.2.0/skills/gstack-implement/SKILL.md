---
name: gstack-implement
description: Implement code and tests from the active engineering plan and task list with minimal diffs, task status updates, and fresh verification. Use when the user invokes /implement or asks Codex to execute tasks from .context/tasks.md, build the current sprint wave, apply an approved eng-plan.md, or complete one planned vertical slice without making new architecture decisions.
---

# Gstack Implement

Use this skill as the Codex version of `/implement`. Execute the approved blueprint; do not redesign it. The main inputs are active `eng-plan.md`, `tasks.md`, and `sprint.md`.

## Operating Contract

Read `../../references/engineering-os-contract.md` before acting. This skill is the Build mode and must follow the shared mode-selection, source-of-truth, artifact, stop, and verification rules.

## Boundaries

- Write code, tests, docs, and config required by the current task.
- Do not make architecture decisions. If the plan cannot be implemented as written, stop and report the plan conflict.
- Do not expand scope beyond `ceo-review.md`, `eng-plan.md`, `tasks.md`, or the user's current request.
- Do not silently change public interfaces, task acceptance criteria, dependency direction, or NOT-in-scope boundaries.
- Do not auto-commit unless the user, active repo instructions, or task card explicitly requests commits. If committing is requested, use one task per commit.

## Context Collection

Before editing, read when present:

1. `.context/README.md` to locate the active iteration directory.
2. Active `eng-plan.md` for architecture, interfaces, data flow, dependency rules, test matrix, failure modes, and NOT in scope.
3. Active `tasks.md` for task order, status, dependencies, files, acceptance criteria, and verification commands.
4. Active `sprint.md` for the current wave.
5. Active `test-plan.md`, `design-plan.md`, `ceo-review.md`, and `review-findings.md` when relevant.
6. `DESIGN.md`, `ARCHITECTURE.md`, `MILESTONES.md`, `README.md`, and `.github/copilot-instructions.md` when relevant.

If no `eng-plan.md` exists and the work is non-trivial, recommend `$gstack-plan`. If no `tasks.md` exists for multi-step work, recommend `$gstack-tasks`.

## Execution Mode

Prefer task-driven execution when `tasks.md` exists:

1. Select the first unblocked task from `sprint.md` or the earliest P0/P1 dependency chain in `tasks.md`.
2. Read the full task card.
3. Update the task status to `[->] IN PROGRESS` before editing.
4. Execute one vertical slice.
5. Run the task's verification command and any targeted checks needed by the change.
6. Update the task to `[x] DONE` only with verification evidence, or `[!] BLOCKED` with the blocker and attempts.
7. Continue to the next task only when the user requested multi-task execution or when the next task is clearly part of the same approved wave.

If no task list exists but the work is small, execute a single vertical slice and document verification in the final response.

## Implementation Discipline

Read `references/implementation-workflow.md` before substantial edits.
Read `references/quality-discipline.md` before adding new public behavior, test surfaces, shared modules, adapters, or refactors inside the task.

Core rules:

- Build in thin vertical slices. Avoid large unverified code dumps.
- Use test-first or regression-first development for behavior changes whenever practical, one behavior at a time.
- Keep the system buildable after each slice.
- Prefer minimal, boring code over speculative flexibility.
- Add or update tests in the same slice as production code.
- Test through public behavior and stable interfaces, not private implementation details.
- Keep module interfaces small enough that tests and callers do not need to understand the implementation.
- Clean up imports, variables, functions, and files orphaned by your own changes.
- Mention pre-existing dead code or unrelated failures, but do not fix them unless asked.

## Contract And Deviation Rules

Stop and report when:

- The plan's interface cannot be implemented in the current framework.
- A required dependency, file, service, schema, or API does not exist.
- The domain model does not match real code or data shape.
- Implementing the task requires touching NOT-in-scope work.
- The planned dependency direction creates a cycle.
- A reusable abstraction leaks implementation details and becomes a shallow module.
- The same verification fails after two focused fix attempts.

Use this report format:

```text
Plan deviation: [short title]
Location: [file:line or plan section]
Problem: [specific conflict]
Options:
A) [implementation adjustment]
B) [plan simplification]
C) [mark known limitation and continue]
Recommendation: [choice and reason]
```

## Documentation And Public Modules

Read `references/module-docs.md` when creating public hooks, shared components, utilities, services, or EXTRACT tasks. Public reusable modules must include usage-oriented documentation with inputs, outputs, examples, and runtime assumptions.

## Safety Rules

Read `references/hard-rules.md` before destructive operations, dependency changes, environment changes, or commits.

Dangerous actions require explicit user approval: recursive deletes, destructive database changes, force push/reset, dependency installs, environment/CI/deploy changes, and remote shell scripts.

## Done Gate

Read `references/done-gate.md` before claiming completion, marking a task DONE, committing, or moving to the next task.

Completion requires fresh evidence:

- The task verification command ran after the latest relevant edit.
- Exit status and output support the claim.
- Acceptance criteria were checked.
- Diff scope matches the plan/task.
- Simplicity review found no avoidable over-engineering.

Never say a task is complete with "should", "probably", or "looks good" language.

## Output

Final response should include:

- Tasks completed or blocked.
- Files changed.
- Verification commands and results.
- `tasks.md` status updates made.
- Plan deviations or unresolved blockers.
- Recommended next step, usually `$gstack-review` after implementation work.
