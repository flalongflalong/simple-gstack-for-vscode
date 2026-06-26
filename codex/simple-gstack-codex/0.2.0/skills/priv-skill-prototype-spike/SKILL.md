---
name: priv-skill-prototype-spike
description: Throwaway prototype work for uncertain UI, state machines, business rules, data models, API flows, or interaction options. Use when the user wants to sanity-check an idea, compare UI variants, make a quick runnable spike, explore a state model, or learn before committing production code.
---

# Skill Prototype Spike

Use this skill to answer a question quickly with disposable code. The output is learning, not production.

## Pick The Question

Choose one branch:

- Logic/state question: build a tiny runnable script, CLI, test harness, or in-memory simulation that exposes state after each action.
- UI/interaction question: build a temporary route, story, or local component variant switcher that lets the user compare materially different directions.
- Integration question: build a minimal request/response or data-flow harness using local fixtures or mocks.

## Rules

- Mark all prototype files clearly as throwaway.
- Keep persistence in memory unless the question is specifically about persistence; use scratch data only.
- Reuse the repo's runner and routing conventions.
- Avoid polish, broad error handling, abstractions, or production dependencies.
- Do not merge prototype code into production paths without a separate implementation step.

## Finish

Report the question answered, how to run the prototype, what was learned, and whether to delete it, absorb the decision into production code, or write an ADR/plan.
