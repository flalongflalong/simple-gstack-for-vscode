# Condense Rules

Before condensing any file, copy the original to `.context-archive/<iteration>/<filename>.original`.

## `eng-plan.md`

Keep:

- Architecture choices and reasons.
- Data model and entity/value object definitions.
- Interface contracts: inputs, outputs, side effects, errors.
- Key constraints, dependency rules, and boundaries.
- NOT in scope.

Remove:

- Review conversation.
- Settled alternative analysis unless the rejected choice matters later.
- Detailed test matrix when tests already exist or `test-plan.md` is archived.
- Verbose implementation steps that are already captured in code or tasks.

Output shape:

```markdown
# Architecture Decision Summary

Source iteration: <iteration>
Archived: YYYY-MM-DD

## Core Choices

- Choice: reason.

## Data Model

...

## Interfaces

...

## Constraints

- ...

## NOT In Scope

- ...
```

## `ceo-review.md`

Keep:

- Final product/scope decision.
- Build/do-not-build list.
- Key risks and assumptions.
- Success criteria that still matter.

Remove:

- Discussion transcript.
- Multiple rounds of interrogation.
- Exploratory alternatives that were rejected and no longer useful.

## `design-plan.md`

Keep durable rules by merging them into `DESIGN.md`:

- Component rules.
- Responsive breakpoints.
- Interaction patterns.
- Accessibility decisions.
- Visual language constraints.

Archive the original first. If the active iteration should keep a summary, replace `design-plan.md` with a short pointer to the `DESIGN.md` sections updated.

## Line Count Evidence

Record before/after line counts for each condensed file:

```text
eng-plan.md: 220 lines -> 32 lines, original archived
```
