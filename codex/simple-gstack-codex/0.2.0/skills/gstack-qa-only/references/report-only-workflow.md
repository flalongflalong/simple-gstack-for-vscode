# Report-Only QA Workflow

This workflow finds issues without modifying product files.

## Scope From Diff

Map changed files to affected surfaces:

- UI component or page: render state, layout, responsive behavior, interaction, accessibility, console.
- API or backend route: request validation, auth, response shape, errors, logging, data effects.
- Domain logic: invariants, edge inputs, state transitions, persistence.
- Configuration or build: local command behavior, CI assumptions, environment defaults.
- Documentation or prompt changes: instructions, examples, command names, consistency with generated artifacts.

## Non-Destructive Checks

Prefer existing checks:

- Focused tests for changed modules.
- Typecheck or build when relevant.
- Lint only when it is a normal repo check.
- Browser or CLI smoke test when the changed surface is user-facing.
- Read-only database queries only when needed and safe.

Do not create fixtures, mutate production-like data, rewrite snapshots, or change configs.

## Happy Paths

For product behavior, test three representative successful paths when practical:

- Default path: the most common user or system flow.
- Variant path: a common option, role, state, or data shape.
- Boundary-valid path: largest/smallest valid input, empty optional data, or slow-but-successful response.

## Edge And Chaos Dimensions

Use the relevant subset:

- Visual: overflow, long labels, empty states, loading states, mobile and desktop viewports.
- Interaction: rapid clicks, double submit, cancel/back/refresh, keyboard operation.
- Forms and input: required fields, invalid formats, special characters, copy/paste, large values.
- State: stale data, optimistic update failure, permissions, login/session changes.
- Network/API: 400, 401/403, 404, 409, 500, timeout, duplicate response.
- Console/logs: errors, warnings, noisy diagnostics, missing useful error context.
- Data: nulls, missing optional fields, duplicate records, ordering, pagination.
- Security: unauthorized access, leaked secrets, unsafe rendering, trust boundary confusion.

## Evidence

Record enough evidence that another engineer can reproduce the issue:

- Command, URL, route, or user flow.
- Input data and environment details.
- Screenshots or log excerpts when available.
- Exact expected and actual behavior.
- Confidence level if the issue is inferred rather than directly reproduced.
