# Design Review Lite

Run this only when the diff touches frontend files: `.tsx`, `.jsx`, `.vue`, `.svelte`, `.html`, `.css`, `.scss`, `.less`, styled files, or paths such as `components/`, `pages/`, `views/`, `layouts/`, or `styles/`.

Read `DESIGN.md` first when present. Patterns explicitly approved there are not findings.

## Findings

Use these labels:

- AUTO-FIX: mechanical CSS/accessibility issue if the user asks for Fix-First.
- ASK: requires design judgment.
- LOW: possible issue; recommend visual verification or `/design-review`.

## Checklist

- Accessibility: missing labels, broken focus order, missing keyboard access, `outline: none` without replacement, low-confidence contrast issues.
- Responsiveness: fixed widths, missing max-width, overflow on mobile, no wrap behavior for long text.
- Interaction states: hover, active, focus-visible, disabled, loading, empty, and error states.
- Design system consistency: colors, fonts, spacing, radii, shadows, and components diverge from `DESIGN.md`.
- Visual quality: overused purple/blue gradients, uniform large rounded corners, icon-in-circle feature grids, centered-everything layouts, generic hero copy.
- UI performance: unnecessary rerenders, fetch waterfalls, layout thrash, missing lazy loading for below-fold images.

## Confidence

- HIGH: directly visible in source, such as `outline: none`, `!important`, body text below 16px, missing label.
- MEDIUM: pattern aggregation, such as too many arbitrary spacing values or inconsistent radius.
- LOW: visual-intent judgment from code alone; present as possible and recommend visual verification.

## Output

```text
[INFORMATIONAL] (confidence: 7/10) src/Button.tsx:31 - Focus state removed via outline: none, which makes keyboard navigation invisible.
Fix: add a visible focus-visible style matching DESIGN.md.
```
