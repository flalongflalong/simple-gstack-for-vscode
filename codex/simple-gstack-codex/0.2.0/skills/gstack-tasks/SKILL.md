---
name: gstack-tasks
description: Break an approved engineering plan into atomic execution tasks, sprint board, deferred TODOs, and task status rules. Use when the user invokes /tasks or asks Codex to turn .context/eng-plan.md into trackable work for implementation, refresh an existing tasks.md, plan a sprint wave, or keep deferred follow-ups visible.
---

# Gstack Tasks

Use this skill as the Codex version of `/tasks`. Convert the active engineering plan into executable, dependency-ordered artifacts. Do not implement code and do not redesign architecture; if the plan is not actionable, stop and route back to `$gstack-plan`.

## Operating Contract

Read `../../references/engineering-os-contract.md` before acting. This skill is the Tasking mode and must follow the shared mode-selection, source-of-truth, artifact, stop, and verification rules.

## Context Collection

Read, when present:

1. `.context/README.md` to locate the active iteration directory.
2. Active `eng-plan.md` as the primary input.
3. Active `ceo-review.md` for scope boundaries.
4. Active `design-plan.md`, `test-plan.md`, `review-findings.md`, and `sprint.md` when relevant.
5. Active `tasks.md` when present; preserve completed work and update incrementally.
6. `MILESTONES.md`, `TODOS.md`, `README.md`, and `.github/copilot-instructions.md`.

If `.context/README.md` points to an active iteration, read and write there. Otherwise use flat `.context/*.md`.

Summarize only what affects task boundaries, dependencies, sprint scope, or deferred work.

## Missing Plan Fast Path

If no `eng-plan.md` exists:

- Recommend `$gstack-plan` for non-trivial or multi-file work.
- Continue only when the request is a quick fix or the user provides enough detail to identify goal, affected files, acceptance criteria, and verification.
- Mark generated `tasks.md` source as `Fast path: no eng-plan.md`.

## Mode Selection

Choose the narrowest mode that fits:

- `Full breakdown`: convert the entire plan into tasks.
- `Incremental update`: update existing `tasks.md` without discarding valid DONE tasks.
- `Sprint planning`: select the current wave and write or refresh `sprint.md`.
- `Status maintenance`: update task states, blockers, fixes, or deferred items.

State the mode before writing artifacts.

## Phase 0: Parse The Plan

Start with a file change map. Every planned file should have one category:

- `[DOMAIN]`: domain entities, value objects, enums, schemas.
- `[SHARED]`: reusable hooks, components, utilities, services.
- `[CORE]`: core business logic, commands, handlers, middleware.
- `[PAGE]`: pages, views, UI screens.
- `[CONFIG]`: configuration, build, CI, environment.
- `[TEST]`: tests, fixtures, evals, QA scripts.
- `[DOCS]`: docs or examples required by the plan.

Rules:

- Each task should touch a coherent local change set.
- Do not add files outside the plan unless task analysis exposes a concrete gap.
- If a file needs two unrelated responsibilities, split it or flag the plan gap.
- Extract shared abstractions before consumer implementation tasks.

Then extract work from architecture decisions, interfaces, domain model, reusable abstractions, dependency rules, test gaps, failure modes, acceptance criteria, existing-code reuse, and NOT in scope.

Run a modeling gate:

- Every domain entity maps to a concrete file path.
- Every reusable abstraction has a specific interface and at least two consumers, unless the plan justifies otherwise.
- Dependency order in tasks respects module dependency rules.
- Testing and failure-mode tasks map to specific planned behavior.

If two or more checks fail, stop and recommend returning to `$gstack-plan` unless the user explicitly accepts the rework risk.

## Phase 1: Generate Atomic Tasks

Read `references/task-format.md` before writing task cards.

Atomic task standards:

- 30 minutes to 4 hours of Codex-assisted work.
- One independently verifiable vertical output.
- No dependency on another task's in-progress intermediate state.
- Self-contained description; the implementer should not need chat history.
- Direct verification command or manual check.
- Prefer tracer-bullet tasks: a narrow complete path across the necessary layers, not a horizontal layer-only slice.
- Mark tasks as AFK when an agent can complete them without new human judgment; mark HITL when a human decision, design review, or external access is required.

Split tasks that contain multiple subfeatures, multiple unrelated files, or "and/also". Merge tasks that change adjacent code and remain under 30 minutes together.

Before saving, self-check:

- Every eng-plan section maps to at least one task or an explicit deferred/out-of-scope note.
- No placeholders such as `TBD`, `TODO`, `related files`, `run tests`, or undefined task IDs.
- Names, paths, function names, and types are consistent across tasks.
- EXTRACT tasks precede all consumers.
- CRITICAL regression tests and RISK failure-mode tasks are not deferred.
- Horizontal tasks such as "add schema", "add API", and "add UI" are split or tied into a complete demonstrable path unless the plan explicitly requires a foundation task.

## Phase 2: Sprint Board

Create `sprint.md` as a focused view of `tasks.md`, not a competing plan.

If the user gives no timebox, choose the next coherent wave: blockers first, P0/P1 tasks, and the shortest vertical path that proves the plan works.

Include:

- In-scope tasks for this wave.
- Backlog tasks with defer reason.
- Explicit out-of-scope tasks from plan NOT in scope.
- Wave plan showing tasks that can run in parallel and their dependencies.

## Phase 3: TODO Sync

Append valuable deferred work to `TODOS.md` when it should survive beyond the active context. Do not record vague ideas or explicitly rejected work.

Merge duplicates. If an item already exists, update status only when the change is clear.

## Phase 4: Status Closure

Maintain task states:

```text
[ ] TODO -> [->] IN PROGRESS -> [x] DONE
                 |
                 v
            [!] BLOCKED
                 |
                 v
            [~] CANCELLED
```

Do not mark DONE without verification evidence. A DONE task must cite the command or manual check performed and the observed result.

When QA or investigation fixes an issue, append a fix record to the relevant task and close matching TODOs when appropriate.

## Output Artifacts

Read `references/output-template.md` before writing final artifacts.

Write or refresh:

- Active `tasks.md`: complete task pool, grouped by module, with stats and deferred items.
- Active `sprint.md`: current execution wave and backlog.
- `TODOS.md`: deferred but valuable follow-ups.
- `MILESTONES.md`: append a `/tasks` row when the repository uses milestones.

## Completion Gate

Before finishing, verify:

- `tasks.md` exists and has atomic tasks with statuses, types, priorities, estimates, dependencies, files, acceptance criteria, verification, and source.
- `sprint.md` exists unless the user requested task-pool-only output.
- Deferred items are represented in `tasks.md` and `TODOS.md` when they need to persist.
- Existing DONE tasks were preserved unless explicitly invalidated.
- The final response names written files, first wave, blockers, and any plan gaps.
