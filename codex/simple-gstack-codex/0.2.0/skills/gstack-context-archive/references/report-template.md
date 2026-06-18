# Final Report Template

Use this after archive execution.

```text
Context archive complete
========================
Iteration: <iteration>
Archive date: YYYY-MM-DD
Archive directory: .context-archive/<iteration>/

Processed:
- Condensed files: N
- Process artifacts moved: M
- Learnings merged: yes/no
- Permanent root artifacts changed: ARCHITECTURE.md no, DESIGN.md yes/no, MILESTONES.md yes

Condensed:
- eng-plan.md: A lines -> B lines, original: .context-archive/<iteration>/eng-plan.md.original
- ceo-review.md: A lines -> B lines, original: .context-archive/<iteration>/ceo-review.md.original

Moved whole:
- tasks.md -> .context-archive/<iteration>/tasks.md
- sprint.md -> .context-archive/<iteration>/sprint.md

Remaining active context:
- .context/<iteration>/eng-plan.md (N lines)
- .context/<iteration>/ceo-review.md (N lines)

Context budget:
- Before: N total lines
- After active context: M total lines
- Reduction: X%

Follow-up:
- Decide whether .context-archive/ should be committed or added to .gitignore.

Status: ARCHIVED
```

If archive was not executed because gates failed or the user did not confirm, report:

```text
Context archive not executed
============================
Reason:
Next step:
```
