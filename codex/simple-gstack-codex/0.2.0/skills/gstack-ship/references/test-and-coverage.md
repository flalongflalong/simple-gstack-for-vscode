# Test And Coverage

Run verification before calling a branch shippable.

## Test Command Detection

Prefer explicit repo instructions:

1. `.github/copilot-instructions.md`
2. `README.md`, `CONTRIBUTING.md`, or project-specific docs
3. Package files and test configs:
   - `package.json`, `vitest.config.*`, `jest.config.*`, `playwright.config.*`, `cypress.config.*`
   - `pyproject.toml`, `pytest.ini`
   - `Gemfile`
   - `go.mod`
   - `Cargo.toml`

Run the narrowest meaningful checks first, then broaden when the release surface warrants it.

## Failure Triage

If tests fail:

- If failing tests or code paths changed in this branch, block ship.
- If failures are demonstrably pre-existing on base, report them as known risk and do not pretend they passed.
- If the command cannot run because dependencies are missing, say what prevented verification.

## Coverage Audit

For each changed function, component, route, job, migration, prompt, or public surface, trace:

- input source
- transformations and branches
- output or side effect
- failure cases: null, empty, invalid, timeout, unauthorized, duplicate, concurrent, max size
- user flow and visible error or empty states

Use this diagram shape:

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

Mark `[E2E]` for flows crossing multiple components/services, auth, payment, destructive actions, or integrations where mocks hide risk.

Mark `[EVAL]` for LLM prompt, tool, ranking, extraction, or scoring behavior.

## Gate

- 80% or higher assessed path coverage: pass.
- 60-79%: ship only if gaps are low risk or user accepts the risk.
- Below 60%: block by default and recommend tests before shipping.
- Unknown coverage: do not block solely on the percentage; list what was and was not verified.

Regression tests are mandatory when the diff fixes or risks breaking existing behavior.
