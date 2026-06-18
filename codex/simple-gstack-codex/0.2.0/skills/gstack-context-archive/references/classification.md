# Artifact Classification

Classify every file in the active iteration directory before editing.

## Categories

### Permanent Root Artifacts

Do not move, delete, or condense:

- `ARCHITECTURE.md`
- `DESIGN.md`
- `MILESTONES.md`

### Condense And Keep

Copy original to archive with `.original`, then replace active file with a short durable summary:

- `eng-plan.md`: architecture decisions, interfaces, data model, constraints, NOT in scope.
- `ceo-review.md`: final scope, what to build, what not to build, risks.
- `design-plan.md`: merge durable design rules into `DESIGN.md`; optionally keep a condensed active summary.

### Merge Knowledge

- `learnings.md`: append to root `learnings.md` with an iteration/date heading. Preserve the original in archive.

### Move Whole

Move these process artifacts to `.context-archive/<iteration>/`:

- `tasks.md`
- `sprint.md`
- `qa-findings.md`
- `review-findings.md`
- `cso-findings.md`
- `investigation-report.md`
- `office-hours-output.md`
- `design-review-findings.md`
- Other temporary checklists, QA notes, logs, or reports whose durable decisions are already represented elsewhere.

## Archive Plan Output

```text
Archive Plan
============
Condense and keep:
- eng-plan.md -> summary, original archived
- ceo-review.md -> summary, original archived

Merge knowledge:
- learnings.md -> root learnings.md, original archived

Move whole:
- tasks.md
- sprint.md
- qa-findings.md

Leave untouched:
- ARCHITECTURE.md
- DESIGN.md
- MILESTONES.md

Archive target: .context-archive/<iteration>/
```

Stop after this plan and ask for confirmation before executing.
