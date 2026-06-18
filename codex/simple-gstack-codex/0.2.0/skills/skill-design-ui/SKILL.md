---
name: skill-design-ui
description: Lightweight UI style direction and DESIGN.md guidance for pages, screens, landing pages, dashboards, docs sites, and prototypes. Use when the user asks for page style, visual direction, "make it look like X", DESIGN.md inspiration, design tokens, UI polish direction before coding, or when a gstack design workflow needs reference-backed style choices without a full design consultation.
---

# Skill Design UI

Use this skill to choose and articulate a concrete page style. It turns product context and optional reference sites into a usable style brief, design-token direction, or DESIGN.md update proposal.

This skill is intentionally smaller than `$gstack-design-consultation`: it can guide style choices by itself, but durable repository-wide design systems should still be written by the gstack design workflow.

## Scope Gate

- Use for visual direction, page style, UI mood, design tokens, component styling, layout rhythm, responsive style rules, or reference-inspired DESIGN.md guidance.
- Use before implementation when a UI task has no clear visual system.
- Escalate to `$gstack-design-consultation` when the user wants to create or replace root `DESIGN.md`.
- Escalate to `$gstack-design-shotgun` when the user wants multiple substantially different directions.
- Escalate to `$gstack-design-review` when UI already exists and the request is an audit.
- Escalate to `$skill-fullstack-dev` or `$gstack-implement` when the user wants production code changes.

## Context Intake

Inspect the smallest useful set:

- existing `DESIGN.md`, design plans, screenshots, routes, components, and style files
- product category, audience, main workflow, content density, and whether the surface is `APP`, `MARKETING`, `DOCS`, `DASHBOARD`, `ECOMMERCE`, `EDITORIAL`, or `PROTOTYPE`
- user-provided reference names, competitors, or taste words
- `.tmp/awesome-design-md/README.md` and relevant `.tmp/awesome-design-md/design-md/*/DESIGN.md` files when available

If no reference library is present, use the routing rules in `references/style-reference-routing.md` and local design judgment.

## Workflow

1. Classify the surface type and desired user impression.
2. Identify existing design constraints from `DESIGN.md` or current UI. Preserve them unless the user asks for a new direction.
3. Choose 1-3 reference archetypes. Prefer category and interaction fit over superficial color matching.
4. Extract reusable style grammar, not brand identity:
   - visual atmosphere
   - color roles and contrast model
   - typography hierarchy
   - component surfaces, radius, borders, and states
   - layout rhythm, density, section structure, and whitespace
   - depth/elevation model
   - responsive behavior
   - do/don't rules for future AI-generated UI
5. Adapt the grammar to the project: product seriousness, domain language, accessibility needs, existing components, and technical constraints.
6. Produce the smallest useful artifact:
   - `UI Style Brief` in chat for a one-off decision
   - `DESIGN.md` patch proposal when the user asks for durable guidance
   - `design-plan.md` style section when inside a gstack planning flow
   - implementation handoff notes when coding follows immediately

## Output Shape

Use this compact structure unless a repo template says otherwise:

```markdown
## UI Style Brief

- Surface:
- Product impression:
- Reference archetypes:
- Adapted direction:
- Palette roles:
- Typography:
- Components:
- Layout:
- Responsive:
- Do:
- Don't:
- Handoff:
```

## Design Discipline

- Do not copy another product's logo, exact brand identity, proprietary illustrations, or trademarked look wholesale.
- Treat `awesome-design-md` examples as grammar references, not skins to paste onto unrelated products.
- For operational apps, prefer calm density, predictable navigation, clear states, and scannable tables/forms over marketing spectacle.
- For landing pages, make the product or offer visible in the first viewport and use real/generative product-relevant imagery when appropriate.
- Avoid one-note purple/blue gradients, generic icon-card grids, decorative blobs, centered-everything pages, unreadable contrast, and oversized hero typography inside compact tools.
- Keep tokens implementable: specific hex roles, font families with fallbacks, spacing/radius scales, and component state rules.

## References

- Read `references/style-reference-routing.md` when selecting or adapting reference styles.
