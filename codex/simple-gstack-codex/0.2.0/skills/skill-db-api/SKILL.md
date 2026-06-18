---
name: skill-db-api
description: Database and API contract work for MySQL/Postgres-backed services, REST/GraphQL/RPC endpoints, validation, migrations, queries, indexes, DTOs, and integration tests. Use when the user asks to add or change an endpoint, schema, query, migration, persistence behavior, or API/data contract.
---

# Skill DB API

Use this skill as the wide entrance when a change crosses both persistence and API behavior. Treat schemas, migrations, API payloads, validation, and consumers as one surface.

For API-only contract drift, prefer `$skill-api-contract`. For schema, SQL, index, migration, or backfill work, prefer `$skill-database-change`.

## Context

Inspect only the relevant layers:

- schema/migration files, ORM models, query builders, repositories, seed/fixture data
- route/controller/service layers, DTOs, serializers, validators, OpenAPI/GraphQL specs when present
- frontend or job consumers of the endpoint/data shape
- existing integration tests and local database commands

## Workflow

1. Identify the contract: request shape, response shape, persistence changes, compatibility expectations, and failure modes.
2. Check backward compatibility. For existing APIs, preserve old fields/semantics unless the user explicitly asks for a breaking change.
3. For schema changes, make migrations reversible where the stack supports it and safe for existing data. Call out destructive or long-running operations before editing.
4. Implement validation and error behavior at the boundary, not scattered across callers.
5. Add or update integration-style tests that exercise the public API or repository behavior.
6. Verify with targeted tests and, when practical, migration apply/rollback or query-plan checks.

## Database Discipline

- Prefer parameterized queries and framework query APIs.
- Avoid ad hoc SQL string assembly with user-controlled data.
- Consider indexes for new lookup/filter/sort paths; do not add indexes blindly.
- Be explicit about nullability, defaults, uniqueness, foreign keys, and transaction boundaries.
- For Postgres/MySQL differences, follow the database already used by the repo instead of writing generic SQL.

## Stop Rules

Stop before destructive migrations, data backfills, auth/tenant-boundary changes, or public breaking changes unless the user approves the risk.

## Finish

Report contract changes, migration/data impact, tests run, and any rollout or compatibility notes.
