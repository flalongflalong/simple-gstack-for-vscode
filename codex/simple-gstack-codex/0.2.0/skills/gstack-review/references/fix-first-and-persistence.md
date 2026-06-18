# Fix-First And Persistence

Use this only when the user asks to fix review findings, or when the active workflow explicitly requires persisted review artifacts.

## Fix-First Classification

AUTO-FIX if the fix is mechanical, local, and low-risk:

- Dead code, unused imports, stale comments.
- Missing simple validation around LLM output.
- Obvious missing null guard with clear expected behavior.
- Version/path mismatch.
- Inline style or focus-state repair with no design judgment.
- Small negative-path or regression test.

ASK if reasonable engineers could disagree or blast radius is larger:

- Security/auth/authz changes.
- Race-condition fixes.
- API behavior, database migration, or user-visible behavior changes.
- Enum completeness that changes product behavior.
- Large fix over about 20 lines.
- Removing functionality.
- E2E tests that require environment decisions.

Critical findings default to ASK unless the fix is truly mechanical.

## Verification

After any fix:

- Run targeted tests for the touched area.
- Re-run the original reproduction or inspection path.
- Broaden only when the changed module is shared.
- If verification fails, report the failing command and stop instead of claiming success.

## Persist Review Findings

Write `.context/review-findings.md` or the active iteration's `review-findings.md` with:

```markdown
# Review Findings

Date: YYYY-MM-DD
Branch/change: ...

## Scope Check

...

## Critical Findings

...

## Informational Findings

...

## Coverage Summary

...

## Unresolved Items

...

## Completion Summary

- CRITICAL findings: N
- INFORMATIONAL findings: N
- Test gaps: N
- Scope check: CLEAN | DRIFT DETECTED | REQUIREMENTS MISSING
```

If `MILESTONES.md` already tracks review events, append:

```markdown
| YYYY-MM-DD | /review | Completed code review: one-line summary | .context/review-findings.md |
```

If a durable pattern, pitfall, or architecture lesson was learned, append to `.context/learnings.md`:

```markdown
### Patterns|Pitfalls|Architecture
- **Keyword**: reusable insight - Source: /review, YYYY-MM-DD
```

Only record reusable insights, not one-off line-level bugs.
