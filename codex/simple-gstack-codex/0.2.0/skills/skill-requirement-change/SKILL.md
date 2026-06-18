---
name: skill-requirement-change
description: Requirement-change impact analysis for changed business rules, fields, flows, customer wording, edge cases, permissions, data semantics, acceptance criteria, or implementation plans. Use when the user says requirements changed, scope shifted, a customer added conditions, or an existing plan/spec must be re-evaluated.
---

# Skill Requirement Change

Use this skill to prevent a small wording change from silently breaking design, data, tests, and delivery.

## Context

Compare the old requirement, new requirement, current code, active plan/tasks, docs, API contracts, database schema, tests, and known TODOs.

## Workflow

1. State the delta: what changed, what stayed the same, and who/what triggered it.
2. Classify the change:
   - compatible
   - breaking
   - data migration needed
   - UI-only
   - API/contract
   - config/deploy
   - permission/auth
3. Map impact across UI, API, backend logic, database, permissions, tests, docs, existing data, rollout, and support/training.
4. Identify decisions that need user confirmation. Ask only for blocking product or data-safety choices.
5. Recommend an implementation path and test scope. Update docs/plans only when requested or when the repo workflow expects it.

## Output

Finish with change summary, impact matrix, implementation adjustment, test/regression scope, risks, and open questions.
