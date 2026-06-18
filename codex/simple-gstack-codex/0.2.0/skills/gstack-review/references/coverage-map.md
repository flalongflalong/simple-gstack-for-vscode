# Coverage Map

Use this after findings to show what the diff proves and what it leaves untested.

## Detect Framework

Prefer repository instructions first:

- `.github/copilot-instructions.md` testing section.
- `package.json`: jest, vitest, playwright, cypress.
- `pyproject.toml`, `pytest.ini`: pytest.
- `Gemfile`: rspec, minitest.
- Language-specific build or test scripts already present in the repo.

Do not invent a new test framework during review.

## Trace Paths

For each changed function, component, route, job, migration, or prompt:

- Input: params, props, DB rows, environment, file contents, external API, LLM output.
- Transform: validation, mapping, filtering, branching, persistence, rendering.
- Output: API response, UI state, DB write, emitted event, file write, background job, tool call.
- Failure cases: null, empty, invalid, timeout, unauthorized, duplicate, concurrent, boundary size.

## E2E And Eval Decision

- Mark `[E2E]` for common user flows crossing three or more components/services, auth/payment/data-destroying flows, or integrations where mocks hide the risk.
- Mark `[EVAL]` for prompt templates, LLM tool definitions, LLM routing, ranking, extraction, or scoring behavior.
- Unit tests are enough for pure functions, local validation, and simple edge cases.
- Regression tests are required when the diff fixes or risks breaking existing behavior.

## ASCII Format

```text
Code Path Coverage
==================
[+] src/services/billing.ts
    processPayment()
    - [tested] happy path and card decline - billing.test.ts:42
    - [GAP] network timeout
    - [GAP] invalid currency

User Flow Coverage
==================
[+] Checkout flow
    - [tested] successful checkout - checkout.e2e.ts:15
    - [GAP] [E2E] double submit
    - [GAP] navigation away during pending request

Summary
=======
Tested paths: 3/6
Gaps: 3
E2E needed: 1
Eval needed: 0
```
