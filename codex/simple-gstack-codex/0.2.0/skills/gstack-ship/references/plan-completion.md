# Plan Completion

Use this when an `eng-plan.md`, `tasks.md`, `sprint.md`, or plan-like artifact exists.

## Extract Items

Extract actionable items:

- checkboxes
- numbered implementation steps
- imperative statements
- file-level specs
- tests and verification requirements
- migrations and config changes

Ignore background, questions, future/out-of-scope items, and review report sections.

## Classify Verification

- `DIFF-VERIFIABLE`: should appear in this repo's diff.
- `CROSS-REPO`: requires checking a sibling repo path.
- `EXTERNAL-STATE`: requires an external system.
- `CONTENT-SHAPE`: requires a file to match a convention.

Concrete filesystem paths must be checked when reachable. Do not mark them unverifiable just because they are outside the diff.

## Status

- `DONE`: clear evidence shipped.
- `CHANGED`: same goal achieved differently.
- `PARTIAL`: some work exists but incomplete.
- `NOT DONE`: negative evidence.
- `UNVERIFIABLE`: cannot be proven from reachable files or current tools.

Be conservative with `DONE`. A touched file is not enough.

## Gate

- Any `NOT DONE`: block by default. User may choose to defer or intentionally drop.
- Any `UNVERIFIABLE`: require explicit per-item confirmation before calling the branch ready.
- `PARTIAL` only: allowed with PR note if low risk.
- All `DONE` or `CHANGED`: pass.

## Output

```markdown
Plan Completion:
- DONE:
- CHANGED:
- PARTIAL:
- NOT DONE:
- UNVERIFIABLE:
- Gate:
```
