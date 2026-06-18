# Specialist Checks

Use this when the diff is large, touches sensitive areas, or the main review lens needs more focus. These checks are run by the main Codex instance unless the user explicitly requests subagents.

## Selection

- Testing: any behavior change.
- Maintainability: medium or large diffs, shared modules, refactors.
- Security: auth, backend, file upload, webhooks, secrets, crypto, LLM/tool trust boundaries.
- Performance: backend queries, frontend rendering, bundle changes, background jobs.
- Data migration: schema, migration, seed, backfill, index changes.
- API contract: routes, controllers, schemas, OpenAPI, SDK/client contracts, webhooks.
- Red team: diff over roughly 200 lines, any CRITICAL finding, or high-risk release.

## Pre-Emit Verification Gate

Before reporting a finding:

1. Read the full relevant file, not only the diff hunk.
2. Verify the referenced field, method, route, state, or invariant actually exists.
3. Search for nearby or upstream guards that already prevent the issue.
4. If the claim depends on runtime behavior you did not verify, lower confidence to 5 or below.
5. Suppress speculative findings unless the impact is CRITICAL and the uncertainty is clearly stated.

This gate prevents confident false positives such as claiming a field or path is missing when it is handled elsewhere.

## Testing

- Missing negative-path tests.
- Missing edge-case coverage.
- Test isolation leaks.
- Flaky timing, sleeps, shared state, order dependency.
- Missing security enforcement tests.
- New public methods/functions with no tests.

## Maintainability

- Dead code and unused imports.
- Magic numbers and string coupling.
- Stale comments and docstrings.
- Repeated 3+ line blocks.
- Conditional side effects.
- Module boundary violations.

## Security

- Input validation at trust boundaries.
- Auth and authorization bypass.
- Injection beyond SQL.
- Cryptographic misuse.
- Secrets exposure.
- XSS escape hatches.
- Unsafe deserialization.

## Performance

- N+1 queries.
- Missing indexes.
- Algorithmic complexity regressions.
- Frontend bundle or rendering cost.
- Missing pagination.
- Blocking calls in async contexts.

## Data Migration

- Irreversible destructive changes.
- Lock duration risk.
- Missing backfill.
- Index creation without online/concurrent strategy where needed.
- Multi-phase deploy hazards.

## API Contract

- Removed fields or type changes.
- New required parameters.
- Status code or auth changes.
- Error response inconsistency.
- Rate limiting and pagination drift.
- Documentation/client compatibility gaps.

## Red Team

Ask:

- How can the happy path fail under load?
- Where can partial failure create silent corruption?
- What trust assumption did this diff add?
- What happens with duplicate, stale, malformed, or adversarial input?
- What did the other checks not cover?
