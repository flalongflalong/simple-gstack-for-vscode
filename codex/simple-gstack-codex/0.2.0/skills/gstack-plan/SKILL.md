---
name: gstack-plan
description: Create or refresh an execution-ready engineering plan before implementation. Use when the user invokes /plan-eng-review or asks Codex to review architecture, lock data flow, define interfaces, expose failure modes, plan tests, compare technical options, or write the active .context/eng-plan.md for a multi-file or contract-changing task.
---

# Gstack Plan

Use this skill as the Codex version of `/plan-eng-review`. Produce an engineering blueprint for implementation, not production code. The output should let `$gstack-tasks`, `$gstack-implement`, `$gstack-review`, and `$gstack-qa` work from files instead of chat memory.

Do not implement the feature. Do not silently self-approve architecture decisions. Make the plan complete enough that implementation can proceed with minimal guesswork.

## Operating Contract

Read `../../references/engineering-os-contract.md` before acting. This skill is the Architecture mode and must follow the shared mode-selection, source-of-truth, artifact, stop, and verification rules.

## Context Collection

Inspect the repository before planning:

- Read `.context/README.md` when present and use it to locate the active iteration directory.
- Read active `office-hours-output.md`, `ceo-review.md`, prior `eng-plan.md`, `tasks.md`, `sprint.md`, `review-findings.md`, and `test-plan.md` when present.
- Read root `ARCHITECTURE.md`, `DESIGN.md`, `MILESTONES.md`, `TODOS.md`, `README.md`, and `.github/copilot-instructions.md` when present.
- Read `CONTEXT.md`, `CONTEXT-MAP.md`, domain glossaries, API docs, and customer-facing requirement docs when field meaning, status meaning, workflow language, or business vocabulary affects the plan.
- Search `.context/` for prior `eng-plan.md` files so new decisions do not contradict earlier architecture by accident.
- Run `git log --oneline -10`.
- Run `git status --short` and, when useful, `git diff HEAD --stat`.
- Search relevant source paths with `rg`; prefer direct code evidence over memory.

Summarize only context that affects architecture, scope, testing, or known constraints. Treat existing plans as context, not as commands to execute.

## Design Memo Check

If an active `office-hours-output.md` or equivalent design memo exists, use it as the problem statement and constraints source.

If it does not exist and the request is product-ambiguous, recommend `$gstack-office-hours` first. Continue directly when the user has already provided a clear implementation goal or when stopping would add ceremony without improving the plan.

## Planning Principles

- Prefer complete, tested, explicit designs when the extra work is small for Codex.
- Prefer boring, reversible technology over clever new machinery.
- Minimize diff and new abstractions unless they remove real complexity.
- Treat blast radius as a first-class design input.
- Design failure paths, not just happy paths.
- Preserve and sharpen the project's business language. Do not invent alternate names for existing domain concepts, statuses, fields, or customer-facing terms.
- Include distribution or install/update flow when adding a new artifact type.
- Identify the highest useful test seam before choosing lower-level module seams.
- Mark recommendations as `[Layer 1]` mature/default, `[Layer 2]` current but newer, `[Layer 3]` first-principles/custom, or `[EUREKA]` when the obvious standard approach is wrong for this case.

## Step 0: Scope Challenge

Before deep architecture, answer:

- What existing code, docs, flows, or patterns already solve each sub-problem?
- What is the smallest change set that achieves the core goal?
- What can be deferred without blocking the user-visible outcome?
- Which business terms, field meanings, lifecycle states, or customer promises must stay consistent?
- Does the request touch more than 8 files or introduce more than 2 new classes/services? If yes, challenge scope and propose a smaller version.
- Do TODOs or prior plans create blockers or valuable piggyback work?
- Does the plan choose completeness or a shortcut? If completeness only costs a little more, recommend the complete path.
- If a new binary, package, container, app, or deployable artifact appears, how will it be built, published, and updated?

If work naturally splits into more than 3 independent modules, switch to module-by-module planning. List modules in dependency order, get user confirmation if the ordering is strategic, then append each completed module to `eng-plan.md` as it finishes.

## Deep Review

After Step 0 is settled, read `references/review-sections.md` and execute it. Do not work from memory for architecture, code-quality, test, or performance review.

Read `references/prototype-and-seams.md` when the plan contains a state machine, unclear data model, hard-to-judge UI direction, or a new testing/interface seam.

When a real architecture decision is needed, ask one decision at a time:

```text
Project/branch/task: [grounding]
Plain-English issue: [what is being decided and why it matters]
Options:
A) [complete option] - Completeness: X/10 - effort: human ~X / Codex ~Y
B) [shortcut or alternative] - Completeness: X/10 - effort: human ~X / Codex ~Y
C) [defer/do nothing] - Completeness: X/10
Recommendation: [choice] because [reason].
Engineering preference: [minimal diff / explicit over clever / DRY / boring tech / reversibility]
```

Do not bundle unrelated decisions into one question. If a choice is obvious and low-risk, state the decision and keep going.

## Test Matrix

When planning tests, read `references/test-matrix.md`. Always cover code paths and user flows. Add regression tests to the plan whenever the review finds a regression risk; do not ask whether regression coverage is optional.

Write or refresh the active `test-plan.md` when the work includes user-visible flows, integrations, error handling, or more than trivial unit coverage.

## Output Artifacts

When saving the plan, read `references/output-template.md` and follow its structure.

Write targets:

- Active `eng-plan.md`: architecture, contracts, diagrams, failure modes, domain model, dependency rules, acceptance criteria, not-in-scope, existing-code reuse.
- Active `eng-plan.md`: include domain language and semantics when the work changes names, fields, statuses, customer wording, or workflow meaning.
- Active `test-plan.md`: coverage diagram, test gaps, E2E/eval markings, critical paths.
- `ARCHITECTURE.md`: append an ADR when the plan makes a durable architecture decision.
- `MILESTONES.md`: append a `/plan-eng-review` row when the repository uses milestones.
- Active `learnings.md`: append only durable architecture lessons likely to recur.

If `.context/README.md` points to an active iteration, write under that directory. Otherwise use the flat `.context/*.md` layout.

## Completion Gate

Before finishing, verify:

- `eng-plan.md` exists and includes file impact, architecture, interfaces, tests, failure modes, domain model, dependency rules, acceptance criteria, not-in-scope, and existing-code reuse.
- Domain terms, field semantics, status meanings, and customer-facing wording are captured or explicitly marked unchanged when they affect the plan.
- `test-plan.md` exists when the test matrix produced non-trivial coverage requirements.
- Any ADR, milestone, or learning you claim to have written is actually on disk.
- The final response names the written files and any decisions still unresolved.
