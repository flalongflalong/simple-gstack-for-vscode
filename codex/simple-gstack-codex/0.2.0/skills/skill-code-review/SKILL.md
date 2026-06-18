---
name: skill-code-review
description: Lightweight code review for a diff, branch, selected files, or work-in-progress changes. Use when the user asks for review, PR review, review since a commit/branch, standards/spec compliance, regression risk, missing tests, API/database contract risk, or frontend/backend correctness feedback without the full gstack-review workflow.
---

# Skill Code Review

Use this skill for a focused review. Findings first, no rubber-stamping.

## Context

Read the diff, changed files, nearby code, tests, repo instructions, style/config files, and any spec/issue/plan the change claims to implement.

## Workflow

1. Establish review base: user-supplied commit/branch/path, or current diff if unspecified.
2. Check two axes:
   - Standards: does the diff follow documented repo conventions and local patterns?
   - Spec: does the diff implement the requested behavior without scope drift?
3. Prioritize correctness, data integrity, auth/permission, concurrency, API/database contract drift, error handling, deployability, missing tests, module-boundary leaks, and duplicated domain rules.
4. Verify each finding against concrete lines or observable behavior. Suppress speculative style comments.
5. Include test gaps, testability issues, unclear field/status semantics, and suggested verification, but do not patch code unless the user asks.

## Output

Report findings ordered by severity with file/line evidence, impact, and confidence. If clean, say no findings and list residual risk.

## Escalate

Use `$gstack-review` for pre-merge production review of a larger branch or `$skill-test-quality` when the next step is only adding tests.
