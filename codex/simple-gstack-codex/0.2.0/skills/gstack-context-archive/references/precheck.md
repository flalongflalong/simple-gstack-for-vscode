# Archive Precheck

Run this before changing files.

## Gates

All gates should be satisfied before archive execution:

1. `MILESTONES.md` contains a release, completion, or milestone row for the iteration.
2. Documentation has been synchronized, usually by `/document-release`, or the user explicitly confirms docs are current.
3. The user confirms the iteration is publishable or complete enough to archive.

If any gate is missing, show the warning and ask whether to continue. Do not move files without confirmation.

## Active Iteration Discovery

Prefer `.context/README.md`. Look for:

- Active iteration directory.
- Previous iteration pointer.
- Status words such as active, in progress, done, archived.

If `.context/README.md` is missing, inspect `.context/` for likely iteration directories. If ambiguous, ask the user to choose.

## Precheck Output

```text
Archive Precheck
================
Active iteration: .context/<iteration>/
Iteration files:
- file.md (N lines)

Milestone record: found | missing
Evidence: <line or reason>

Documentation sync: confirmed | not confirmed
Archive gates: ready | needs confirmation
Archive target: .context-archive/<iteration>/
```

When gates are not all ready:

```text
Archive is not fully gated yet:
- Missing milestone record
- Documentation sync not confirmed

Continue anyway? I will not move files until you confirm.
```
