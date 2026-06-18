# Review Output Template

Lead with findings. Keep summary secondary.

## Findings

```markdown
**Findings**

[CRITICAL] (confidence: 9/10) src/file.ts:42 - User-controlled `id` is interpolated into raw SQL.
Impact: crafted input can read or modify unrelated rows.
Fix: use parameterized query binding and add a regression test for malicious input.

[INFORMATIONAL] (confidence: 6/10) src/page.tsx:88 - Medium confidence: the new empty state has no keyboard-reachable retry path.
Impact: users who cannot use a pointer may be stuck after a load failure.
Fix: add a button with accessible name and focus-visible state.
```

If there are no findings:

```markdown
**Findings**

No findings in the reviewed diff.
```

## Supporting Sections

```markdown
**Scope**

Scope Check: CLEAN | DRIFT DETECTED | REQUIREMENTS MISSING
Original intent:
Actual diff:
Dedup:

**Coverage**

Code Path Coverage
==================
...

User Flow Coverage
==================
...

**Verification**

- Inspected:
- Commands run:
- Not run:

**Residual Risk**

- ...
```

## Rules

- Sort by severity first, then confidence.
- Include file and line whenever possible.
- Explain why existing code does not already prevent the issue.
- Do not include long generic praise.
- Put low-confidence findings in an appendix or residual risk section.
