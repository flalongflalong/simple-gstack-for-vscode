---
name: gstack-design-consultation
description: Create or refresh the repository's DESIGN.md with a concrete product design system. Use when the user asks for design consultation, brand guidelines, design system, visual direction, product aesthetic, typography, color, spacing, motion, DESIGN.md, or when UI planning needs a design source of truth before implementation.
---

# Gstack Design Consultation

Use this skill to define the product's durable design source of truth. The main artifact is root `DESIGN.md`, unless the active context says to write a proposed design system into a plan first.

## Operating Contract

Read `../../references/engineering-os-contract.md` before acting. This skill is the Design system mode and must follow the shared mode-selection, source-of-truth, artifact, stop, and verification rules.

## Context Intake

Read available context before proposing visuals:

1. Existing `DESIGN.md` or similar design-system file.
2. `.context/README.md`, active `office-hours-output.md`, `ceo-review.md`, `design-plan.md`, and design explorations.
3. `README.md`, `package.json`, app routes, frontend components, and styles.
4. Product screenshots or existing UI if present.

If the repository has no clear product context, recommend `gstack-office-hours` before creating a design system.

## Workflow

1. If `DESIGN.md` exists, read it and ask whether to update, start fresh, or cancel. If the answer is clear from the user's request, proceed with that interpretation and state it.
2. Confirm product context in one compact question only when local files cannot answer it: product, audience, category, UI type, and whether current category research is desired.
3. If the user asks for page style inspiration, "make it feel like X", or DESIGN.md examples, use `$priv-skill-design-ui` first to select reference archetypes and extract style grammar. Treat those references as inspiration, not brand skins.
4. If current market/category research is requested or materially needed, browse current sources and cite them. If not, use local context and design judgment.
5. Build one coherent proposal with:
   - aesthetic direction
   - layout strategy
   - typography roles with specific font names
   - color palette with hex values and semantic roles
   - spacing density and grid
   - component surfaces and states
   - motion personality
   - accessibility and responsive constraints
   - safe choices users expect and risk choices that give the product a face
6. Read `references/design-system-template.md` and write or update `DESIGN.md`.
7. Report the decisions made, any user-overridden tradeoffs, and what downstream skills should read next.

## Design Discipline

- Start with product, user, and task context. Visual choices without context are random.
- Be specific enough that `gstack-plan-design-review` and `gstack-implement` can use the file directly.
- Prefer fewer stronger rules over a long grab bag. A design system should constrain future work.
- Accept the user's final taste choice, but warn when choices reduce coherence, contrast, accessibility, or category legibility.
- Avoid AI-template defaults: purple-blue gradients, three-column feature grids with icon circles, generic hero copy, all-centered layouts, decorative bubbles, and one-note palettes.
- Do not implement production UI from this skill. Write the design system and hand off to planning or implementation.

## References

- Use `references/design-system-template.md` for `DESIGN.md`.
- Use `references/proposal-checklist.md` before writing the final proposal.
- Use `$priv-skill-design-ui` when a reference-backed page style direction is needed before committing to a durable design system.
