# Task Artifacts Output Template

Use these structures for task artifacts. Keep them concrete and directly executable.

## `tasks.md`

````markdown
# Task List

Source: .context/eng-plan.md
Generated: YYYY-MM-DD
Updated: YYYY-MM-DD
Mode: Full breakdown | Incremental update | Sprint planning | Status maintenance

## Summary

- Total tasks: N
- TODO: N
- IN PROGRESS: N
- DONE: N
- BLOCKED: N
- CANCELLED: N
- DEFERRED: N

## File Change Map

| Category | Path | Responsibility | Tasks |
|---|---|---|---|
| [DOMAIN] | `path` | ... | TASK-001 |

## Module: [Name]

### TASK-001: [imperative title]

**Status**: [ ] TODO
**Type**: DOMAIN
**Execution**: AFK
**Priority**: P0
**Estimate**: ~30 minutes (Codex-assisted)
**Dependencies**: None
**Files**: `src/domain/example.ts`

**Description**: ...

**Slice**: ...

**Acceptance Criteria**:
- [ ] ...

**Verification**: `npm test -- example`

**Source**: `eng-plan.md` section 6 Domain Model

## [DEFERRED] Out Of Current Scope

### TASK-099: [imperative title]

**Status**: [DEFERRED]
...
````

## `sprint.md`

````markdown
# Sprint Board

Generated: YYYY-MM-DD
Goal: [current wave goal]

## In Scope

| Task | Title | Status | Estimate | Priority | Dependencies |
|---|---|---|---|---|---|
| TASK-001 | ... | [ ] TODO | ~30m | P0 | None |

## Backlog

| Task | Title | Reason |
|---|---|---|

## Explicitly Out Of Scope

| Task | Title | Source |
|---|---|---|

## Wave Plan

```text
Wave 1:
  TASK-001 ... ~30m
  TASK-002 ... ~20m

Wave 2:
  TASK-003 ... ~45m (depends on TASK-001)

Serial estimate: ~Nm
Shortest parallel path: ~Nm
```
````

## `TODOS.md`

Append valuable deferred work:

```markdown
## [Module]

### [Task title]

**What:** [1-2 sentences]

**Why:** [value]

**Context:** [constraints/dependencies]

**Effort:** S / M / L / XL
**Priority:** P1 / P2 / P3
**Depends on:** [task or None]
```

When closing an item:

```markdown
~~### [Task title]~~ Completed (YYYY-MM-DD)
```

## `MILESTONES.md`

Append when milestones are used:

```markdown
| YYYY-MM-DD | /tasks | Broke plan into N atomic tasks; sprint includes M tasks | .context/tasks.md, .context/sprint.md |
```

## Completion Summary

```text
Task breakdown complete
=======================
Total atomic tasks: N
Implementation: N
Tests: N (critical regression: N)
Fixes / defenses: N
Docs / config: N
AFK-ready: N
HITL: N

Sprint: M tasks, ~H hours Codex-assisted
Deferred to TODOS.md: N
Explicitly out of scope: N

First wave:
- TASK-001 ...

Blockers:
- None / [list]

Next:
- Use $gstack-implement to start with P0/BLOCKER tasks.
```
