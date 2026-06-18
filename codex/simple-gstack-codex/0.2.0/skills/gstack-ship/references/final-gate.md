# Final Gate

End every ship run with a clear decision.

## GO

Use only when:

- relevant tests/checks passed or unavailable checks are explicitly documented
- no blocking review findings remain
- plan completion has no unresolved `NOT DONE` items
- version/changelog state is coherent for the repo
- dirty worktree state is understood
- no remote action was claimed without actually doing it

## NO-GO

Use when:

- tests fail due to this branch
- CRITICAL review findings remain
- plan-critical items are missing
- version/changelog is contradictory
- worktree contains mixed unrelated changes
- verification could not run for a required release surface

## Output

```markdown
Ship Decision: GO | NO-GO | GO WITH RISKS

Verified:
- [command/evidence]

Blockers:
- [blocker]

Risks:
- [risk]

Artifacts:
- [ship checklist, changelog, PR body, if created]

Next step:
- [merge/create PR/run document-release/fix blocker]
```
