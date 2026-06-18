---
name: skill-bug-fix
description: Single-bug repair with evidence. Use when the user reports one broken behavior, failing command, exception, regression, flaky path, or performance issue and wants Codex to reproduce, diagnose, patch minimally, add regression coverage when possible, and verify the original symptom is gone.
---

# Skill Bug Fix

Use this skill for one defect at a time. The operating idea is borrowed from disciplined diagnosis: build a feedback loop first, then fix the smallest proven cause.

## Context

Read the bug report, current diff, nearby code, tests, logs, and relevant docs. Prefer a concrete failing signal over speculation:

- failing automated test
- command output
- API request or curl reproduction
- browser route with console/network evidence
- fixture, log excerpt, trace, or minimal harness

## Workflow

1. Reproduce or explain why reproduction is currently impossible.
2. Minimize the trigger until the failure signal is sharp enough to guide a fix.
3. List 2-4 ranked hypotheses internally and test them one variable at a time.
4. Patch only the root cause. Remove temporary instrumentation before finishing.
5. Add a regression test at the closest honest seam. If no good seam exists, say so and document manual verification.
6. After the fix passes, record the prevention note: missing test seam, leaky module boundary, duplicated business rule, unclear field/status meaning, or environment/config gap.
7. Re-run the original reproduction and targeted tests.

## Rules

- Do not refactor broadly while fixing a bug.
- Do not fix neighboring issues unless they block the original bug verification.
- Do not claim success without re-running the original failing path.
- For nondeterministic bugs, raise the reproduction rate with loops, stress, timing, or repeated runs before patching.

## Escalate

Use `$gstack-qa` for multi-finding QA repair, `$gstack-investigate` if added later for deep incidents, or `$skill-eng-planning` when the fix requires architectural change.

## Finish

Report the symptom, root cause, fix, regression coverage, prevention note, verification commands, and residual risk.
