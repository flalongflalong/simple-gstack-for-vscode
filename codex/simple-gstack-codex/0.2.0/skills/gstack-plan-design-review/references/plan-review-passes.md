# Plan Review Passes

Run these passes against the active UI plan. For each pass, give a 0-10 score, explain the gap, and write concrete plan text when the answer is clear.

## 1. Information Architecture

Check whether each screen defines:

- first, second, and third visual priority
- navigation path into and out of the surface
- primary action and secondary actions
- what can be removed without harming the user job

Add ASCII layout sketches when structure is ambiguous.

## 2. Interaction State Coverage

Create or update a state table for each user-facing feature:

```markdown
Feature | Loading | Empty | Error | Success | Partial | Permission/Disabled | Overflow
--- | --- | --- | --- | --- | --- | --- | ---
[feature] | [what the user sees] | [what the user sees] | [message + recovery] | [main state] | [degraded data] | [why unavailable] | [long text, many items, small viewport]
```

Empty states need context, a humane explanation, and a next action. Errors need recovery, not blame.

## 3. User Journey And Emotional Arc

Storyboard the path:

```markdown
Step | User action | User feeling | UI support | Failure mode
--- | --- | --- | --- | ---
1 | [action] | [confidence, uncertainty, urgency] | [copy, layout, feedback] | [what could break]
```

Consider first 5 seconds, first 5 minutes, and repeated use.

## 4. AI Slop And Specificity

Classify the surface:

- `MARKETING`: brand-forward, conversion-focused, hero-driven.
- `APP`: task-focused, data/workspace-driven.
- `HYBRID`: marketing shell plus functional UI.

Flag these as design risks:

- purple-blue gradients as default identity
- three-column feature grids with icon circles
- all-centered text
- decorative blobs, waves, or floating shapes
- generic hero copy
- every section using the same card rhythm
- app UI made from unrelated stacked cards instead of a clear workspace

Replace vague "modern clean" wording with concrete layout, type, spacing, state, and interaction decisions.

## 5. Design System Alignment

If `DESIGN.md` exists, check color, typography, spacing, radius, motion, and component reuse against it. If no `DESIGN.md` exists, recommend `gstack-design-consultation` and proceed with universal principles.

## 6. Responsive And Accessibility Intent

Specify behavior at practical breakpoints such as 375, 768, 1024, and wide desktop. Include:

- keyboard path and visible focus
- touch target size
- contrast expectations
- text wrapping and overflow
- reduced motion behavior
- mobile density and primary action placement

## 7. Unresolved Decisions

End with only real open forks. Each fork should include:

- the decision
- recommended option
- tradeoff
- downstream implementation impact
