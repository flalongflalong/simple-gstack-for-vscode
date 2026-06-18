# Design Audit Checklist

Use the checklist as a review lens, not a rigid form. Findings should be concrete and tied to evidence.

## 1. Visual Hierarchy

- One clear focal point per viewport.
- Primary action is visually obvious.
- Eye path matches user intent.
- Section headings explain jobs, not vibes.
- Noise is reduced before decoration is added.

## 2. Typography

- No more than three font families.
- Heading scale is consistent.
- Body text is at least 16px unless there is a strong app-density reason.
- Line length and line height support reading.
- Tabular/data text uses stable numbers where useful.

## 3. Color And Contrast

- Body text meets WCAG AA contrast.
- UI controls have enough contrast.
- Semantic colors are consistent.
- Color is not the only carrier of meaning.
- Dark mode uses surface depth rather than simple inversion.

## 4. Layout And Spacing

- Spacing follows a scale.
- Related elements are grouped.
- Mobile has no horizontal scroll.
- Text does not overflow controls.
- Cards and panels have a real information or interaction reason.

## 5. Interaction States

- Hover, active, focus-visible, disabled, loading, empty, error, success, partial, and permission states are defined.
- Loading skeletons match final content shape.
- Errors include recovery.
- Destructive actions require confirmation or undo.

## 6. Responsive Behavior

- Check mobile, tablet, desktop, and wide desktop when practical.
- Touch targets are at least 44px where touch is likely.
- Mobile density is designed, not merely stacked.
- Primary actions remain reachable.

## 7. Motion

- Motion supports hierarchy, state, or spatial continuity.
- `prefers-reduced-motion` is respected.
- Avoid `transition: all`.
- Long animation needs a reason.

## 8. Content And Microcopy

- Buttons say the action.
- Empty states are contextual.
- Error text is specific.
- No lorem ipsum or placeholder product language remains.
- Truncation is intentional and recoverable.

## 9. AI Slop

Flag strongly:

- purple/blue gradient identity
- three-column feature grid with icon circles
- all-centered content
- decorative blobs/waves
- emoji as visual system
- generic hero copy
- identical rhythm across sections
- app dashboards made from card mosaics

## 10. Performance As Design

- Images declare dimensions and use appropriate loading.
- Layout shift is controlled.
- Font loading does not create distracting jumps.
- Slow loading has useful feedback.

## Surface-Specific Rules

`MARKETING`: first viewport reads as a composed brand moment, not a dashboard. Hero is full-bleed or intentionally media-led, with few elements and a clear CTA.

`APP`: workspace hierarchy is calm, dense, and predictable. Navigation, primary work area, secondary context, and status are distinct.

`HYBRID`: apply marketing rules to brand sections and app rules to functional sections.
