# Prototype Variant Notes

Use only when the user explicitly asks for coded prototypes as part of design exploration.

## Rules

- Keep prototype work disposable and isolated.
- Do not replace production UI unless the user explicitly asks.
- Prefer one route with a `?variant=` switcher or equivalent state rather than scattered prototype branches.
- Add a visible floating variant switcher when practical.
- Make variants structurally different. Do not create palette-only variants.
- After selection, either delete prototype-only code or clearly mark what should be absorbed into production work.

## Variant Quality

Each prototype variant should differ in at least two of:

- layout structure
- navigation model
- density
- typography role
- interaction model
- media treatment
- information hierarchy
