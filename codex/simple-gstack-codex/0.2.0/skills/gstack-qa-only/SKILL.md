---
name: gstack-qa-only
description: Report-only QA testing with no source, test, or configuration changes. Use when the user invokes /qa-only or asks Codex to test a change, find bugs, produce a reproducible QA report, score readiness, or identify destructive and edge-case scenarios without fixing anything.
---

# Gstack QA Only

Use this skill to inspect, run, and report. It is intentionally read-heavy and evidence-heavy. It may write QA report artifacts, but it must not modify product code, test code, configuration, migrations, package files, snapshots, or generated assets.

## Operating Contract

Read `../../references/engineering-os-contract.md` before acting. This skill is the QA report mode and must follow the shared mode-selection, source-of-truth, artifact, stop, and verification rules.

## Hard Boundary

- Do not fix bugs.
- Do not edit source files, test files, config, lockfiles, snapshots, or generated output.
- Do not reformat files.
- Do not install dependencies unless the user explicitly approves and the report cannot be produced otherwise.
- Do not commit.
- Allowed writes: `qa-findings.md` or another report artifact requested by the user.

If the user asks to fix the findings, switch to or recommend `$gstack-qa`.

## Context Intake

Read the relevant repository context before testing:

1. `.context/README.md`, then the active iteration files it names.
2. Active `eng-plan.md`, `tasks.md`, `sprint.md`, and `test-plan.md` when present.
3. Existing `qa-findings.md`, `review-findings.md`, `cso-findings.md`, or `ceo-review.md` when they define acceptance risks.
4. `.github/copilot-instructions.md`, `ARCHITECTURE.md`, `DESIGN.md`, and `README.md` when they define expected behavior.
5. The current diff and changed files.

Missing files lower confidence; they do not justify inventing expected behavior.

## Workflow

1. Define report scope.
   - Use `references/report-only-workflow.md` to map changed files to affected user flows and system surfaces.
   - State what is in scope and out of scope before reporting findings.
2. Run non-destructive checks.
   - Prefer existing tests, build/type checks, lint, browser smoke tests, and manual flows already supported by the repo.
   - Do not create or edit tests to make the report easier.
   - Use the feedback-loop guidance in `../gstack-qa/references/feedback-loop.md` as read-only testing discipline: build the fastest evidence loop, but do not add tests, logs, harnesses, or fixes.
3. Test happy paths.
   - For product-facing changes, cover three representative successful flows when practical: default use, common variant, and boundary-but-valid input.
4. Test edge and chaos paths.
   - Exercise the relevant dimensions in `references/report-only-workflow.md`: visual, interaction, forms, state, network, console/logs, responsive, permissions, and data boundaries.
5. Classify findings.
   - Use `references/qa-only-template.md` for severity, evidence, reproduction, expected/actual behavior, and suggested fix direction.
6. Score readiness.
   - Use `references/health-score.md` when the scope is more than one isolated bug.
7. Save the report.
   - Write or refresh the active `qa-findings.md` report when an active context exists.
   - Update milestone/status files only if the repository already uses them for QA reporting and the update is report-only.

## Finding Quality Bar

Each finding should include:

- Severity and user impact.
- Exact reproduction path or command.
- Expected behavior with source of truth.
- Actual behavior with evidence.
- Suspected cause or affected layer when known.
- Suggested fix direction, without editing files.
- Verification attempted and confidence.

## Completion Standard

Finish with:

- Report location, if written.
- Tests or manual paths executed.
- Top findings ordered by severity.
- QA health score or readiness statement.
- Areas not tested and why.
