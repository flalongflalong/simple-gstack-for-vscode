---
name: skill-fullstack-dev
description: Lightweight full-stack implementation for small to medium changes across frontend React/Vue, backend Python/Java, API wiring, Docker/service config, and documentation touched by the change. Use when the user asks to add or adjust a concrete feature without needing a full gstack plan, or when one vertical slice can be implemented and verified in one pass.
---

# Skill Fullstack Dev

Use this skill for a bounded implementation slice. It is smaller than `$gstack-implement`: inspect, patch, test, and report without creating heavy planning artifacts unless the work grows.

## Scope Gate

- Proceed when the request has a clear user-visible outcome and likely touches a small set of files.
- Escalate to `$gstack-plan` or `$skill-eng-planning` when the change alters architecture, auth, persistence contracts, migrations, release topology, or more than one vertical slice.
- Escalate to `$skill-bug-fix` when the request is primarily a defect with unknown cause.

## Context

Inspect the smallest useful set:

- repo instructions: `AGENTS.md`, `.github/copilot-instructions.md`, `README.md`
- package/build files, framework config, Docker files, route/API registration, and tests near the touched area
- existing patterns for React/Vue components, Python/Java service code, validation, errors, logging, and deployment config

## Workflow

1. Identify the vertical slice: UI, API, service logic, data access, config, and tests that must change together.
2. Reuse local patterns before adding dependencies or abstractions.
3. Check ownership before editing: where should validation, mapping, status transitions, and error behavior live so callers do not duplicate business rules?
4. Implement the smallest coherent diff.
5. Add or update tests at the highest useful seam: component, route/API, service, integration, or smoke check.
6. Run targeted verification. For frontend changes, include a browser/build/type/lint check when available. For backend changes, include unit/integration/API checks. For Docker/config changes, include syntax/build validation when practical.

## Stop Rules

- Stop before broad refactors, new frameworks, schema migrations, security-sensitive behavior, or release automation unless explicitly requested.
- Stop if no reliable verification path exists and the change could affect production data, auth, payments, or deployability.

## Finish

Report files changed, behavior implemented, verification run, and any follow-up that should become a real plan or TODO.
