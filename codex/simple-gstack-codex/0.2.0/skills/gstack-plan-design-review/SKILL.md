---
name: gstack-plan-design-review
description: Review and improve UI or UX plans before implementation. Use when a feature plan, eng-plan.md, design-plan.md, or task list includes new screens, visible UI changes, user interaction, responsive behavior, accessibility requirements, design-system changes, or when the user asks for plan-design-review, UI plan critique, anti-AI-slop review, or design state coverage before coding.
---

# Gstack Plan Design Review

Use this skill to turn a vague UI implementation plan into an implementation-ready design plan. The output is an improved plan, not a passive critique.

## Operating Contract

Read `../../references/engineering-os-contract.md` before acting. This skill is the UI plan review mode and must follow the shared mode-selection, source-of-truth, artifact, stop, and verification rules.

## Context Intake

Read available source-of-truth files before reviewing:

1. `.context/README.md` to locate the active iteration directory.
2. Active `eng-plan.md`, `design-plan.md`, `tasks.md`, and prior design plans under `.context/`.
3. `.context/office-hours-output.md`, `.context/ceo-review.md`, and `.context/review-findings.md` when present.
4. `DESIGN.md`, `MILESTONES.md`, `.github/copilot-instructions.md`, and recent `git log --oneline -10`.
5. Relevant frontend components, routes, styles, and existing UI patterns.

If `.context/README.md` points to an iteration directory, read and write the matching artifacts there.

## Scope Gate

Proceed only if the plan changes user-visible UI, interaction, frontend architecture, responsive behavior, accessibility, content hierarchy, or the design system.

If there is no UI scope, say so clearly and stop. Do not force a design review onto backend-only work.

## Workflow

1. Report the UI scope, existing design leverage, and whether `DESIGN.md` exists.
2. Score current design completeness from 0-10. State what 10/10 would require for this exact plan.
3. If the plan lacks a concrete visual direction, use `$priv-skill-design-ui` to add a compact style brief before reviewing implementation details.
4. Read `references/plan-review-passes.md` and run only the passes relevant to the UI surface.
5. When a missing decision is clear, write it into the active `design-plan.md` or the UI section of `eng-plan.md`.
6. When a real product/design fork remains, ask one focused question with a recommendation and tradeoff. Otherwise choose the conservative path that aligns with `DESIGN.md` and existing UI patterns.
7. Finish with a concise delta: what plan sections changed, unresolved decisions, and implementation risks.

## Hard Rules

- Treat empty, loading, error, partial, permission, and overflow states as product behavior, not polish.
- Specify what users see, not only what data or APIs do.
- Reuse existing components and interaction patterns unless the plan explains why not.
- Avoid generic "modern clean UI" language. Use concrete hierarchy, spacing, type, state, and interaction decisions.
- Flag AI-template patterns before implementation: decorative card grids, identical section rhythm, purple-blue gradients, icon circles, centered everything, and vague hero copy.
- Do not write production code from this skill. Hand the hardened plan to `gstack-implement`.

## References

- Read `references/plan-review-passes.md` before the main review.
- Use `references/design-plan-template.md` when creating or refreshing a `design-plan.md`.
- Use `$priv-skill-design-ui` when the plan needs a concrete page-style brief before implementation can be reviewed.
