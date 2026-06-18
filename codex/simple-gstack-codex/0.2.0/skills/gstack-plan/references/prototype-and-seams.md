# Prototype And Seams

Use this during planning when paper design is not enough. The plan should decide whether a throwaway prototype or a higher test seam would reduce implementation risk.

## Highest Useful Test Seam

Before proposing new modules, identify where behavior can be verified:

- User flow, route, command, or public API.
- Existing module interface.
- New module interface only if the plan truly needs one.
- Internal helper only as a last resort.

Prefer the highest seam that still gives a deterministic signal. Tests at too-low seams often lock in implementation details and miss the real bug path.

## Prototype Decision

Recommend a prototype only when it answers a real planning question:

- Logic/state prototype: state machines, lifecycle transitions, reducers, permission matrices, or data shapes that are hard to reason about statically.
- UI prototype: multiple meaningfully different layouts or interaction models where code review would not reveal the best direction.

Do not prototype just to postpone a decision.

## Throwaway Rules

If a prototype is recommended:

- Mark it explicitly as throwaway.
- Keep it local to the relevant area and easy to delete.
- Use one existing command or task runner entry to start it.
- Keep state in memory unless persistence is the question being tested.
- Capture the question it answers and the decision learned.
- Delete it or absorb the validated part before production implementation is marked complete.

## Planning Output

When relevant, include in `eng-plan.md`:

```markdown
## Prototype / Seam Notes

- Question:
- Prototype needed: yes/no
- Shape: logic | UI | none
- One command:
- Production carryover:
- Delete/absorb rule:
- Highest test seam:
```

If no prototype is needed, briefly state why the plan is already testable through existing seams.
