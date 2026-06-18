---
name: skill-codebase-map
description: Read-only codebase mapping for unfamiliar modules, features, call paths, data flows, dependencies, ownership boundaries, and existing patterns. Use when the user asks how an area works, where to make a change, what calls what, or wants Codex to zoom out before planning or editing.
---

# Skill Codebase Map

Use this skill before editing unfamiliar code. It is read-only unless the user explicitly asks for a follow-up artifact.

## Context

Inspect repo instructions, domain docs, ADRs, active `.context` files, module docs, routes, entry points, tests, and call sites. Prefer `rg` and focused file reads over broad summaries.

## Workflow

1. Identify the feature, module, or behavior being mapped.
2. Trace entry points, core modules, data flow, external dependencies, and tests.
3. Name the local vocabulary used by the repo; call out mismatches with the user's wording.
4. Highlight the safest change points and seams.
5. Note architecture health signals: shallow modules, duplicated invariants, leaky interfaces, cyclic dependencies, unclear ownership, or hard-to-test paths.
6. List unknowns that would require running the app, tests, database, or asking the user.

## Output

Provide a compact map:

- purpose of the area
- key files and responsibilities
- call/data flow
- existing patterns to follow
- likely change points
- module-boundary and testability notes
- risks and open questions

Do not propose a broad refactor unless the user asks; use `$skill-eng-planning` or `$gstack-plan` for that next step.
