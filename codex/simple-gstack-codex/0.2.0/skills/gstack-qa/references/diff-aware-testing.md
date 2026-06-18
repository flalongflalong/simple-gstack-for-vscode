# Diff-Aware Testing

Use the current diff to choose what to test. Do not test randomly.

## Map Changed Files To Surfaces

- UI component or page: render path, props/state, loading state, empty state, error state, keyboard/pointer behavior, responsive layout, console output.
- API route or controller: request validation, auth/permission checks, success response, error response, status codes, idempotency, logging.
- Service or domain logic: input boundaries, invariants, persistence side effects, concurrency assumptions, error propagation.
- Database or migration: schema compatibility, seed/test data, rollback or deploy order, nullability, indexes, data integrity.
- Configuration or environment: local dev, CI, production defaults, missing env vars, secrets handling, build/runtime parity.
- Dependency or build tooling: lockfile impact, transitive compatibility, bundling, type generation, command availability.
- Tests only: whether the test change matches real behavior or hides a bug.

## Minimum Scope Statement

Before editing, know:

- What user-visible or system-visible behavior is under test.
- Which files or modules are in scope.
- Which adjacent modules could plausibly regress.
- Which commands or manual paths will prove the result.

## Test Selection

- Start with the specific failing command or reproduction.
- Add a focused regression test near the code that owns the behavior.
- Run adjacent tests when the fix changes shared helpers, contracts, schemas, or build configuration.
- Run broader checks for auth, data migration, dependency, or release-critical changes.

## UI Chaos Checks

For UI changes, include the relevant subset:

- Long text, empty data, many rows, missing optional fields.
- Rapid repeated clicks or submits.
- Back/forward navigation and refresh.
- Small mobile viewport and a wide desktop viewport.
- Slow, failed, or duplicated network responses.
- Focus visibility and reachable controls.
