---
name: gstack-design-shotgun
description: Explore multiple distinct UI design directions before committing to one. Use when the user asks for design variants, visual directions, compare UI concepts, shotgun design, alternatives before DESIGN.md, alternatives before implementation, or when a surface feels generic and needs structured design exploration.
---

# Gstack Design Shotgun

Use this skill to compare directions before choosing one. It does not create the final design system, audit finished UI, or implement production code.

## Operating Contract

Read `../../references/engineering-os-contract.md` before acting. This skill is the Design options mode and must follow the shared mode-selection, source-of-truth, artifact, stop, and verification rules.

## Context Intake

Read available context:

1. `DESIGN.md`; treat it as the default constraint unless the user asks to depart from it.
2. `.context/README.md`, active `office-hours-output.md`, `ceo-review.md`, `eng-plan.md`, and `design-plan.md`.
3. Prior explorations under `.context/designs/`.
4. Existing UI code or screenshots if the request is to improve a current surface.

Ask at most two context questions. If the files answer enough, proceed with stated assumptions.

## Workflow

1. Summarize the brief in five dimensions: who, job, current state, user flow, and edge states.
2. Infer taste signals from prior design explorations or `DESIGN.md`. If none exist, offer a compact preference prompt or include a broad spread.
3. If the user mentions reference sites, DESIGN.md examples, or visual style archetypes, use `$priv-skill-design-ui` to extract 1-3 style grammars before generating options.
4. Generate 3 directions by default:
   - one safe/category-legible direction
   - one opinionated differentiated direction
   - one lateral or high-risk direction
5. Read `references/direction-template.md` and expand each direction with layout, visual system, interactions, states, risks, and relationship to `DESIGN.md`.
6. Collect structured feedback: score, preferred direction, keep, drop, and mix.
7. Save the result using `references/exploration-template.md` at `.context/designs/design-exploration-YYYY-MM-DD.md`.
8. Append a short milestone entry when `MILESTONES.md` exists.

## Direction Quality Bar

- Directions must differ structurally, not just by color or font.
- Each direction needs a named concept, visual anchor, interaction posture, state coverage, and risk.
- Avoid fake choice. If two concepts could swap copy and still feel the same, regenerate one.
- Make one direction deliberately conservative enough to ship and one bold enough to teach the user something.
- Do not write production code. If the user wants prototype variants, read `references/prototype-variant-notes.md` and keep them disposable.

## References

- Use `references/direction-template.md` when expanding directions.
- Use `references/exploration-template.md` when saving the decision.
- Use `references/prototype-variant-notes.md` only if the user explicitly asks for coded prototype variants.
- Use `$priv-skill-design-ui` when reference-backed style archetypes should inform the direction set.
