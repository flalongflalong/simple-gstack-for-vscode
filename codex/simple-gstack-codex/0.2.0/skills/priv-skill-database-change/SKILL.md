---
name: priv-skill-database-change
description: Safe MySQL/PostgreSQL schema, migration, SQL, index, query optimization, pagination, data repair, and backfill work. Use when adding or changing tables/columns, writing DDL/DML, diagnosing slow or wrong queries, designing indexes, handling rollback, or preparing production-safe data changes.
---

# Skill Database Change

Use this skill when data integrity, migration safety, or query behavior is the central concern.

## Context

Inspect migrations, schema definitions, ORM/entity mappings, repository/query code, indexes, constraints, seed data, fixtures, and the database engine actually used by the repo.

## Workflow

1. Identify engine: MySQL, PostgreSQL, or both. Do not write generic SQL when engine-specific syntax matters.
2. Classify the work: DDL, DML, query optimization, data repair, backfill, constraint/index, or migration sequencing.
3. For schema changes, decide nullability, default, uniqueness, foreign keys, index impact, existing data handling, and rollback.
4. For query changes, inspect filters, joins, sort, pagination, limits, cardinality assumptions, and index usage.
5. Prefer idempotent and reversible scripts when practical. Call out destructive or long-running operations before editing.
6. Verify with migration apply/rollback, targeted repository/API tests, sample SQL, or query-plan checks when available.

## Rules

- Never hide production data risk.
- Use parameterized queries or framework query APIs for user-controlled input.
- Do not add indexes blindly; name the query path they support.
- Keep data repair scripts auditable and scoped.

## Finish

Report DDL/DML or migration steps, rollback path, data-risk notes, verification SQL/commands, and affected APIs or jobs.
