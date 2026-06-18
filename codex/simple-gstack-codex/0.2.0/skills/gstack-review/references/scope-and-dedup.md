# Scope And Dedup

## Scope Drift

Review what was supposed to change versus what changed.

Sources, strongest first:

- Active `eng-plan.md`: in-scope features, out-of-scope items, architecture decisions, test matrix.
- Active `tasks.md` and `sprint.md`: task descriptions, acceptance criteria, planned files, verification commands.
- `ceo-review.md`: product scope and explicit non-goals.
- Recent commit messages.
- `TODOS.md`, `MILESTONES.md`, and planning artifacts.

Classify:

- CLEAN: diff matches intended scope.
- DRIFT DETECTED: unrelated files, unplanned features, broad refactors, or opportunistic cleanup.
- REQUIREMENTS MISSING: planned behavior, tests, docs, migrations, or validation are absent.

When a plan exists, include a completion audit:

```text
Plan Completion Audit
=====================
[done] Feature A - implemented in src/a.ts
[partial] Feature B - model exists, controller validation missing
[missing] Feature C - no matching diff

Completion: 1/3 done, 1 partial, 1 missing
```

For partial or missing items, identify likely cause when evidence supports it:

- Scope cut: intentional removal or deferral is visible.
- Context exhaustion: half-finished code or stopped sequence.
- Misunderstood: code exists but does not satisfy the plan.
- Blocked: dependency is missing.
- Forgotten: no attempt found.

## Cross-Review Dedup

When `review-findings.md` exists:

1. Build a fingerprint from `file:line + category + summary keywords`.
2. Suppress exact duplicates.
3. Mark same issue with line drift within 10 lines as `KNOWN-SHIFTED` in an appendix.
4. Reopen skipped ASK items only when they are still relevant and risky.

Dedup affects presentation only. A known unresolved CRITICAL issue should still be visible enough that the user cannot miss it.

## Scope Summary Format

```text
Scope Check: CLEAN | DRIFT DETECTED | REQUIREMENTS MISSING
Original intent: ...
Actual diff: ...
Scope drift: ...
Missing requirements: ...
Dedup: N known findings suppressed, M new findings.
```
