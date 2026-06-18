# Task Format

Use this format for every task in `tasks.md`.

```markdown
### TASK-NNN: [imperative title]

**Status**: [ ] TODO | [->] IN PROGRESS | [x] DONE | [!] BLOCKED | [~] CANCELLED
**Type**: DOMAIN | EXTRACT | IMPL | TEST | FIX | DOCS | CONFIG
**Execution**: AFK | HITL
**Priority**: P0 | P1 | P2 | P3
**Estimate**: ~N minutes (Codex-assisted)
**Dependencies**: TASK-NNN, or None
**Files**: `path/a`, `path/b`

**Description**: [one sentence]

**Slice**: [what end-to-end behavior this proves, or why this is a required foundation task]

**Acceptance Criteria**:
- [ ] [specific observable result]
- [ ] [specific edge/error/test result]

**Verification**: `[exact command]` or `Manual: [specific check]`

**Source**: `eng-plan.md` section [name]
```

## Field Rules

- Title: imperative, action-oriented, unique.
- Status: preserve existing DONE/IN PROGRESS/BLOCKED unless the plan invalidates them.
- Type ordering: DOMAIN before EXTRACT before IMPL before TEST, unless dependencies require otherwise.
- Execution: AFK when an agent can complete the task from files alone; HITL when it requires product judgment, design choice, credentials, external access, or user testing.
- Priority: P0 blocks the plan, P1 core, P2 useful follow-up, P3 deferable.
- Files: concrete paths only. Do not write `related files`.
- Verification: concrete command or manual check. Do not write `run tests`.
- Source: point to the plan section, test gap, failure mode, or fast-path input.
- Slice: describe the tracer bullet. A task that only changes one layer must explain why it is a foundation task.

## Invalid Placeholders

Reject and fix tasks containing:

- `TBD`, `TODO`, `later`, `similar to TASK-N`, `related files`, `run tests`.
- "Add appropriate error handling" without naming the error or trigger.
- "Handle edge cases" without naming the edge cases.
- Undefined task IDs, paths, functions, or types.

## Special Markers

| Marker | Meaning | Rule |
|---|---|---|
| `[CRITICAL]` | Regression or release-blocking test | Must not be deferred. |
| `[BLOCKER]` | Other tasks depend on it | Usually P0 and early. |
| `[DEFERRED]` | Explicitly out of current scope | Put in deferred section. |
| `[RISK]` | Critical blind spot or failure mode | Include handling and tests. |
| `[HITL]` | Requires human decision or external access | Do not mark ready for unattended implementation. |
| `[AFK]` | Agent-ready without new judgment | Must include enough context, files, criteria, and verification. |

## EXTRACT Tasks

For EXTRACT tasks, automatically add documentation acceptance criteria:

```markdown
- [ ] Module documentation describes purpose, inputs, outputs, usage example, and runtime assumptions.
- [ ] Usage example can be copied and run or adapted directly.
```

Include documentation time in the estimate, usually +5-10 minutes for Codex-assisted work.

If there are 3 or more EXTRACT tasks in the sprint, call that out in the summary so implementation can batch docs and examples efficiently.

## Sorting Rules

1. Dependency chain.
2. DOMAIN definitions.
3. EXTRACT before consumers.
4. P0, then P1, then P2, then P3.
5. IMPL before TEST for the same behavior.
6. Group by module when it does not violate dependencies.

## Vertical Slice Rules

- Each non-foundation task should deliver a narrow complete path through every needed layer.
- A completed task should be demoable, testable, or manually verifiable on its own.
- Prefer many thin vertical slices over a few thick tasks.
- Avoid layer-only tasks unless they unblock multiple later slices and have their own verification.
