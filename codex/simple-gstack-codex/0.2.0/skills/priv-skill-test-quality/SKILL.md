---
name: priv-skill-test-quality
description: Focused testing and quality improvement for existing code. Use when the user asks to add tests, improve coverage, create regression tests, stabilize flaky tests, add lint/type/build checks, verify a feature, or apply a red-green-refactor loop without broad implementation planning.
---

# Skill Test Quality

Use this skill to improve confidence, not to chase coverage vanity metrics. Prefer behavior tests through public interfaces.

## Context

Inspect the test framework, existing test style, package scripts, CI hints, fixtures, and the code path under test. Reuse the repo's test vocabulary and helpers.

## Workflow

1. Define the behavior or risk to protect.
2. Pick the highest useful seam: public function, service API, HTTP endpoint, component interaction, browser flow, CLI command, or migration path.
3. For new behavior or bug fixes, prefer red-green-refactor:
   - write one failing test for one behavior
   - make it pass minimally
   - refactor only while green
4. For existing behavior, add characterization tests before refactoring.
5. For flaky tests, first reproduce flakiness or identify nondeterminism; then remove timing, ordering, random, shared-state, or network assumptions.
6. Run the narrow check first, then broaden only when the touched area warrants it.

## Test Quality Rules

- Test observable behavior, not private implementation details.
- Avoid mocking internal collaborators when a real public seam is practical.
- Keep each test name tied to user/domain behavior.
- Do not rewrite large test suites unless the user asks for that refactor.
- If no good seam exists, report the testability gap and suggest the smallest seam-improving change.
- If tests require mocking internal modules you own, treat that as a module-boundary smell. Prefer testing through the public caller path or improving the public seam.
- A useful test should survive a refactor that preserves behavior. If it would fail on harmless internal reshaping, it is too coupled.

## Finish

Report tests added/changed, commands run, failures found or fixed, testability gaps, and remaining untested risk.
