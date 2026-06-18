# Archive Execution

Use safe filesystem operations. Preserve user changes and avoid deletion.

## Order

1. Create `.context-archive/<iteration>/`.
2. Copy originals for all condensed files into the archive with `.original`.
3. Copy `learnings.md` into archive before merging it upward.
4. Write condensed active files.
5. Move whole-archive process files into `.context-archive/<iteration>/`.
6. Append iteration learnings to root `learnings.md`.
7. Update `.context/README.md`.
8. Append a `MILESTONES.md` archive row.
9. Inspect final file list and line counts.

## Learnings Merge

Append to root `learnings.md`:

```markdown
---
## From iteration <iteration> (archived YYYY-MM-DD)

<original iteration learnings>
```

If root `learnings.md` does not exist, create it.

## `.context/README.md`

Update the active iteration status:

```markdown
# Current Active Iteration

**Directory:** none
**Previous iteration:** `.context/<iteration>/` - archived YYYY-MM-DD

## Archive Records

| Iteration | Archive date | Archive directory |
| --- | --- | --- |
| <iteration> | YYYY-MM-DD | `.context-archive/<iteration>/` |
```

Preserve existing archive rows when present.

## `MILESTONES.md`

Append:

```markdown
| YYYY-MM-DD | /context-archive | Archived iteration <iteration>, condensed N decision files, archived M process artifacts, reduced context by X% | .context-archive/<iteration>/ |
```

If `MILESTONES.md` is missing, create a basic milestones table only after user confirmation.

## Gitignore Recommendation

Do not edit `.gitignore` automatically unless the user requests it. Report the tradeoff:

- Version `.context-archive/` for traceability in team/open-source projects.
- Ignore `.context-archive/` for personal projects with large archives.
