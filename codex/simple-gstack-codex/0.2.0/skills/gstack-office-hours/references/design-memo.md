# Design Memo

Write the final memo to `.context/office-hours-output.md`. Create `.context/` if needed.

## Startup Mode Template

```markdown
# Office Hours Design Memo

Date: YYYY-MM-DD
Mode: Startup
Status: Draft

## Problem Statement

...

## Demand Evidence

...

## Status Quo

...

## Target User And Narrowest Wedge

...

## Premises

...

## Language And Domain Notes

Resolved terminology, context boundaries, and any `CONTEXT.md` or ADR updates made during the session.

## Landscape

...

## Approaches Considered

### Approach A: ...

### Approach B: ...

## Recommended Approach

...

## What Not To Build

...

## Success Criteria

...

## Distribution Plan

...

## The Assignment

One concrete real-world action that does not require writing code.

## What I Noticed

- Quote or paraphrase a specific thing the user said, then explain the implication.
```

## Builder Mode Template

```markdown
# Office Hours Design Memo

Date: YYYY-MM-DD
Mode: Builder
Status: Draft

## Problem Statement

...

## What Makes This Cool

...

## Premises

...

## Language And Domain Notes

Resolved terminology, context boundaries, and any `CONTEXT.md` or ADR updates made during the session.

## Landscape

...

## Approaches Considered

### Approach A: ...

### Approach B: ...

## Recommended Approach

...

## Success Criteria

...

## Distribution Plan

...

## Next Build Steps

1. ...
2. ...
3. ...

## What I Noticed

- Quote or paraphrase a specific thing the user said, then explain the implication.
```

## Milestone Update

Append to `MILESTONES.md`:

```markdown
| YYYY-MM-DD | /office-hours | One-line outcome | .context/office-hours-output.md |
```

If `MILESTONES.md` does not exist, create it with:

```markdown
# Milestones

| Date | Activity | Summary | Artifact |
| --- | --- | --- | --- |
| YYYY-MM-DD | /office-hours | One-line outcome | .context/office-hours-output.md |
```

## Downstream Contract

The memo should be useful to:

- `$gstack-ceo`: scope pressure, demand evidence, what not to build.
- `$gstack-plan`: recommended approach, constraints, success criteria, distribution plan.
- Design skills: target user, positioning, delight or trust requirements.
- Domain docs: resolved language should agree with `CONTEXT.md`; hard-to-reverse trade-offs should be discoverable in ADRs when recorded.
