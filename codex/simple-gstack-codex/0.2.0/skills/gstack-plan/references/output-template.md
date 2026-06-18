# Engineering Plan Output Template

Use this structure for the active `eng-plan.md`. Keep it dense and executable; downstream skills should not need chat history.

````markdown
# [Feature Name] Engineering Plan

> **Goal:** [one sentence]
>
> **Architecture summary:** [2-3 sentences]
>
> **Stack:** [key frameworks/libraries/tools]

**Date:** YYYY-MM-DD
**Branch/task:** [description]
**Completeness score:** X/Y recommendations chose the complete path

---

## 1. File Impact Map

| Operation | Path | Responsibility |
|---|---|---|
| Add/Modify | `path/to/file` | [what changes and why] |

## 2. Architecture

[ASCII system/data-flow/state diagram]

**Key decisions:**
- **[Decision]** [Layer 1/2/3/EUREKA]: [choice] - [reason]

**Design It Twice:**
- **[Module/interface]**: chose [direction] over [alternative] because [reason].

## 3. Modules And Interfaces

### Module: [Name]
- **Responsibility:** ...
- **Public interface:**
  ```text
  Input:
  Output:
  Side effects:
  Errors:
  ```
- **Dependencies:** ...
- **Failure behavior:** ...

## 4. Test Matrix

[coverage diagram from test-matrix.md]

**Key gaps:**
| # | Path/flow | Type | Priority |
|---|---|---|---|

## 4.5 Prototype / Seam Notes

- **Prototype needed:** yes/no
- **Question answered:** [state/data/UI uncertainty]
- **Prototype shape:** logic | UI | none
- **Highest useful test seam:** [user flow / route / command / public module interface]
- **Production carryover:** [what survives, if anything]
- **Delete/absorb rule:** [how throwaway work is removed]

## 5. Failure Modes

| # | Scenario | Tested? | Handled? | User-visible result | Rating |
|---|---|---|---|---|

Use `Critical blind spot` when a failure has no test, no handling, and no user-visible signal.

## 6. Domain Model

### Domain Language And Semantics

| Term / field / status | Canonical meaning | Source of truth | Notes |
|---|---|---|---|
| ... | ... | `CONTEXT.md` / API docs / requirement | ... |

Record customer-facing wording when it constrains implementation. If the work does not change business language, write `No domain-language changes`.

### Entity Relationship Diagram

[ASCII ER diagram]

### Entities And Value Objects

```typescript
interface EntityName {
  id: string;
}

type ValueObjectName = {
};
```

Use the project language when it is not TypeScript.

### DTO / ViewModel Boundaries

| Boundary | Source | Target | Conversion location | Notes |
|---|---|---|---|---|

## 7. Reusable Abstractions

### Hooks
| Hook | Signature | Consumers | Reason |
|---|---|---|---|

### Shared Components
| Component | Props | Consumers | Reason |
|---|---|---|---|

### Utilities / Services
| Name | Signature | Consumers | Reason |
|---|---|---|---|

## 8. Module Dependency Rules

```text
Allowed direction:
UI -> Services -> Repository -> DB/API
```

| Source | May depend on | Must not depend on |
|---|---|---|

## 9. Acceptance Criteria

- [ ] [observable behavior]
- [ ] [contract/test/performance requirement]

## 10. NOT In Scope

| Deferred item | Reason |
|---|---|

## 11. Existing Code Reuse

| Sub-problem | Existing code/pattern | Plan |
|---|---|---|

## Completion Summary

- Scope challenge: [kept/reduced]
- Architecture review: [N] issues
- Domain model: [N] entities, [N] value objects, self-check [N]/6
- Domain language: [changed/unchanged], [N] terms or field/status meanings captured
- Reusable abstractions: [N] hooks / [N] components / [N] utilities
- Module dependencies: [acyclic/fixed cycle]
- Code quality review: [N] issues
- Test review: [N] gaps
- Performance review: [N] issues
- Failure modes: [N] critical blind spots
- Completeness score: X/Y complete recommendations
````

## Additional Artifacts

Append an ADR to `ARCHITECTURE.md` when the plan creates a durable architecture decision:

```markdown
## ADR-N: [Decision Title]
Date: YYYY-MM-DD
Status: Accepted

### Context

### Decision

### Consequences
```

Append a milestone row when the repo uses `MILESTONES.md`:

```markdown
| YYYY-MM-DD | /plan-eng-review | [one-sentence summary] | .context/eng-plan.md, .context/test-plan.md, ARCHITECTURE.md |
```

Append durable lessons to active `learnings.md` only when they are likely to recur:

```markdown
### [Architecture|Pattern|Pitfall]
- **[key]**: [lesson] - Source: /plan-eng-review, YYYY-MM-DD
```
