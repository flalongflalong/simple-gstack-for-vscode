# Test Matrix

Use this reference during the test review section.

## 1. Detect Test Framework

Read repo instructions first, then auto-detect:

- `package.json`: Jest, Vitest, Playwright, Cypress, npm scripts.
- `Gemfile`: RSpec, Minitest.
- `pyproject.toml`, `pytest.ini`, `requirements.txt`: pytest/unittest.
- `go.mod`: `go test`.
- `Cargo.toml`: `cargo test`.
- Existing `test/`, `tests/`, `spec/`, `__tests__/`, `e2e/`, `cypress/`, or `playwright` directories.

If no framework is detected, still produce the coverage diagram and test intentions.

## 2. Trace Code Paths

For each planned feature, service, endpoint, component, command, or job:

- Entry point: route, CLI command, exported function, event listener, component render, scheduled job.
- Inputs: request params, props, files, database rows, API responses, environment variables.
- Transformations: validation, parsing, mapping, filtering, computation, authorization.
- Outputs: response, render, persistence, events, logs, metrics, side effects.
- Branches: guards, `if/else`, `switch`, early returns, retries, fallbacks.
- Error paths: thrown errors, caught errors, timeouts, cancellation, partial failure.

Every branch in the diagram needs a test or an explicit reason it is out of scope.

## 3. Trace User Flows

For user-visible work, cover:

- Core happy path.
- Double submit or rapid repeated action.
- Navigation away during async work.
- Slow network or timeout.
- Stale page/session/cache.
- Two tabs or concurrent mutation.
- Empty state, zero results, one result, large result set.
- Invalid, maximum-length, and unexpected input.
- User-visible recovery from server or network failure.

## 4. Choose Test Type

Use:

- Unit test: pure logic, validation, mapping, small state transitions.
- Integration test: module boundaries, database/API adapters, serialization contracts.
- E2E test `[->E2E]`: flows crossing 3+ components/services, auth, payment, destructive actions, install/update flows, or cases where mocks hide real breakage.
- Eval `[->EVAL]`: LLM prompts, tool definitions, structured output parsing, refusal/malformed/empty/hallucinated responses.

Regression rule: if the review finds a likely regression, add a regression test requirement. Do not ask whether to skip it.

## 5. Coverage Diagram Format

```text
Code Path Coverage
==================
[+] src/services/example.ts
    |
    +-- processData()
    |   +-- [*** tested] main path + invalid input - example.test.ts:42
    |   +-- [GAP] network timeout - add unit/integration test
    |   +-- [GAP] invalid currency - add unit test
    +-- handleEdge()
        +-- [** tested] basic case - example.test.ts:89

User Flow Coverage
==================
[+] Core submit flow
    +-- [*** tested] full happy path - example.e2e.ts:15
    +-- [GAP] [->E2E] double submit
    +-- [GAP] navigate away during request

Coverage: 3/7 paths tested (43%)
Code paths: 2/4 (50%)
User flows: 1/3 (33%)
Quality: ***: 2  **: 1  *: 0
Gaps: 4 paths need tests (1 needs E2E)
```

## 6. Test Plan Artifact

Write active `test-plan.md` when there are non-trivial gaps or user flows:

```markdown
# Test Plan

Source: eng-plan.md
Date: YYYY-MM-DD

## Affected Routes Or Surfaces
- ...

## Critical User Flows
- ...

## Edge Case Matrix
| # | Scenario | Type | Expected behavior | Coverage |
|---|---|---|---|---|

## Required Tests
| # | Test | File | Type | Priority |
|---|---|---|---|---|

## Release-Blocking Paths
- [command/path and expected result]
```
