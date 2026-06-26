---
name: priv-skill-api-contract
description: Frontend/backend API contract alignment for REST, GraphQL, RPC, mocks, generated clients, DTOs, schemas, OpenAPI docs, request/response fields, pagination, errors, permissions, and integration tests. Use when interfaces disagree, fields change, integration fails, mocks drift from real APIs, or an endpoint contract must be added or reviewed.
---

# Skill API Contract

Use this skill when the main risk is contract drift between callers and providers.

## Context

Inspect the endpoint route, frontend caller, backend DTO/schema/VO/entity, serializers, validation, mocks, API docs, generated clients, tests, and database fields that feed the response.

## Workflow

1. Identify method, path, auth/permission requirement, request shape, response shape, status codes, and error format.
2. Trace every changed field through frontend types, form/table/detail/import/export usage, backend DTO/schema, service mapping, persistence, mock data, and docs.
3. Classify the change as compatible, additive, breaking, deprecated, or internal-only.
4. Preserve compatibility when possible. For breaking changes, propose a transition path before editing.
5. Update contract source and consumers together; avoid fixing only one side.
6. Verify with API/integration tests, generated-client checks, or a concrete request/response smoke test.

## Output

Finish with a field-impact checklist: added/removed/renamed fields, affected callers, compatibility notes, tests run, and docs updated.

## Escalate

Use `$priv-skill-database-change` for DDL/backfill/index work and `$priv-skill-fullstack-dev` when the contract change is part of a broader feature slice.
