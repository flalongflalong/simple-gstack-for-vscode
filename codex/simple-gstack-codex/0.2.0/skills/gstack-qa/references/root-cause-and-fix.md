# Root Cause And Fix Loop

Do not fix from vibes. Reproduce, localize, reduce, fix, guard, verify.

## Severity

- Critical: data loss, security exposure, payment/auth failure, app cannot start, or core workflow fully blocked.
- High: major workflow broken, wrong persisted data, serious UI break on common viewport, or repeated crash.
- Medium: important edge case, confusing state, recoverable API error, accessibility issue in affected flow.
- Low: polish issue, rare edge case, copy inconsistency, minor visual defect.

## Reproduction Record

Capture:

- Command, URL, route, or user flow.
- Input data and relevant environment.
- Actual behavior with evidence.
- Expected behavior from source files, specs, or existing product patterns.
- Whether the issue reproduces consistently.

## Diagnosis Questions

- What feedback loop proves the symptom?
- Where is the first incorrect value, state, or side effect introduced?
- What contract did the caller and callee expect?
- Is the test wrong, stale, or hiding a real product bug?
- Did a recent diff alter shared state, schema, props, serialization, auth, or config?
- Is the symptom downstream of a deeper data or architecture issue?

## Fix Rules

- Fix the owner of the root cause, not merely the visible symptom.
- Change one hypothesis at a time.
- Keep unrelated cleanups out of the diff.
- Preserve public contracts unless the active plan explicitly changes them.
- Remove temporary diagnostics unless they are appropriate permanent instrumentation.

## Regression Guard

Prefer a test that:

- Fails on the old behavior.
- Uses realistic input from the reproduction.
- Lives near the behavior owner.
- Asserts the user-visible or contract-visible result, not incidental implementation details.

If no automated guard is practical, explain why and provide exact manual verification steps.

## Prevention Note

After the fix is verified, ask what would have prevented the bug:

- A clearer public interface or smaller module surface.
- A higher test seam that exercises the real caller path.
- Moving validation, mapping, or invariants behind the module that owns the data.
- Removing duplicated business rules, field semantics, or status handling across callers.
- Documenting a domain term, status, or customer-facing promise that was ambiguous.

Do not expand the bug-fix diff for this unless it is a small local cleanup inside the touched code. Record larger prevention work as a follow-up or route to planning.

## Stop Conditions

Stop and report instead of continuing to patch when:

- The issue cannot be reproduced and there is not enough evidence to choose a fix.
- No reliable feedback loop can be built and no useful artifact is available.
- Three fix attempts fail.
- The root cause requires a plan-level architecture or product decision.
- The safe fix requires touching unrelated systems outside the requested scope.
