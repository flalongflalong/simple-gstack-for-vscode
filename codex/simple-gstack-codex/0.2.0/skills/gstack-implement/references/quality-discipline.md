# Quality Discipline

Use this while implementing the approved plan. It strengthens code quality without changing the plan's architecture or scope.

## Plan Remains Authority

- Do not invent a new architecture while implementing.
- If the plan asks for a shallow or leaky shape, report a plan deviation instead of silently redesigning it.
- If a small local improvement fits the task and does not change public behavior, apply it.
- If a refactor would touch unrelated callers or change dependency direction, stop and ask.

## Behavior-First Tests

Good tests verify behavior through the public interface.

- Test what users, callers, routes, commands, or components observe.
- Name tests after behavior, not implementation steps.
- Prefer integration-style tests over mocks of internal code.
- A useful test should survive a refactor that preserves behavior.
- One logical behavior per test is usually enough.

Avoid:

- Testing private methods.
- Mocking internal collaborators you own.
- Asserting incidental call counts, helper ordering, or internal data shapes.
- Verifying by bypassing the interface when the behavior has a public read path.

For bug fixes, the regression test should fail without the fix or directly assert the original symptom.

## Red-Green-Refactor

Use one vertical cycle at a time:

```text
RED: add one behavior test and confirm the expected failure.
GREEN: add the smallest implementation that passes.
REFACTOR: simplify only while tests remain green.
```

Do not write a batch of tests for imagined future behavior before implementing the first slice.

Never refactor while RED.

## Mocking Rule

Mock at system boundaries:

- External APIs.
- Time and randomness.
- File system or database when a real test dependency is impractical.
- Network, email, payment, storage, queues, and other outside services.

Do not mock your own modules just to make tests easier. If the test is hard without mocking internal code, the interface may be the wrong shape.

When external dependencies vary, pass them in instead of constructing them deep inside the behavior. Prefer specific SDK-style functions over a generic fetcher that forces conditional logic in every mock.

## Interface And Module Depth

Use this vocabulary consistently:

- Module: anything with an interface and an implementation.
- Interface: everything callers must know, including types, invariants, ordering, errors, config, and performance expectations.
- Implementation: code hidden behind the interface.
- Depth: how much useful behavior sits behind a small interface.
- Adapter: a concrete implementation used at a variation point.
- Locality: change, bugs, and verification concentrated in one place.
- Leverage: what callers get from the module's depth.

Quality checks:

- Can the number of public methods or parameters be smaller?
- Can invariants and error handling live inside the module instead of every caller?
- If the module were deleted, would complexity reappear across callers? If yes, it is earning its keep. If no, it may be pass-through code.
- One adapter is usually a hypothetical variation point. Two adapters make the variation real.
- Do not introduce an adapter or interface only because a test wants one.

## Refactor After Green

After the behavior passes:

- Remove duplication created by the slice.
- Move logic to where the data or domain concept lives.
- Combine or deepen shallow modules introduced by the task.
- Remove unused imports, variables, and helpers introduced by your changes.
- Keep tests on the public interface while changing implementation details.

If the needed refactor exceeds the task scope, record it as follow-up instead of expanding the diff.
