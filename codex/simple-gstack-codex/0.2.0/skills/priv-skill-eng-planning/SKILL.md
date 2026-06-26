---
name: priv-skill-eng-planning
description: Lightweight engineering planning for ordinary changes. Use when the user wants a practical implementation plan, technical option comparison, task breakdown, risk scan, or change strategy but the work does not need the full gstack-plan/gstack-tasks workflow.
---

# Skill Eng Planning

Use this skill to get just enough plan to code safely. It is intentionally lighter than `$gstack-plan`.

## Context

Read the request, repo instructions, relevant docs, current code paths, package/build files, and recent local changes. If the plan depends on domain language or previous decisions, look for `CONTEXT.md`, `CONTEXT-MAP.md`, `ARCHITECTURE.md`, `DESIGN.md`, ADRs, API docs, customer-facing requirement docs, and `.context/` artifacts.

## Workflow

1. Restate the goal and the smallest useful outcome.
2. Map affected surfaces: frontend, backend, database, API, jobs, config, Docker/deploy, docs, and tests.
3. Capture domain terms, field meanings, lifecycle states, and customer wording that constrain the change.
4. Compare 2-3 options only when there is a real tradeoff.
5. Choose a path that is reversible, local to existing patterns, and easy to verify.
6. Check module boundaries: public interface size, dependency direction, owner of invariants/errors, and the highest useful test seam.
7. Break work into vertical slices that can be independently tested or demoed.
8. Define verification before implementation starts.

## Output Shape

Keep the plan compact:

- Goal
- Files/surfaces likely touched
- Chosen approach and rejected alternatives
- Domain terms / field semantics affected
- Module boundaries and test seam
- Task slices
- Verification
- Risks and stop conditions

Write a `.context/.../eng-plan.md` only when the user asks or when the plan needs to survive beyond this turn.

## Escalate

Use `$gstack-ceo` for product scope decisions, `$gstack-plan` for multi-module architecture/contracts, or `$gstack-tasks` when the plan needs durable task tracking.

## Finish

End with the recommended next action: implement now, split into tasks, ask one blocking question, or defer.
