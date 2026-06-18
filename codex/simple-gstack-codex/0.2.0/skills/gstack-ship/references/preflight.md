# Preflight

Use this before running tests or release actions.

## Base Branch

Detect the base branch:

1. PR/MR base from `gh` or `glab` when available.
2. `git symbolic-ref refs/remotes/origin/HEAD`.
3. `origin/main`, then `origin/master`, then `main`.

State the base branch and confidence.

## Checks

Collect:

```bash
git branch --show-current
git status --short
git log --oneline -5
git diff <base>...HEAD --stat
git diff <base>...HEAD --name-only
```

Block or ask before continuing when:

- current branch is the base branch
- worktree has mixed unrelated changes
- there are untracked files that may need inclusion
- merge conflicts or unresolved markers are present

## Distribution Pipeline

If the diff adds new shippable artifact types, check whether a build/release path exists:

- CLI/binary: package script, CI artifact, install docs.
- npm/package/library: package metadata, version flow, publish workflow.
- Docker image: Dockerfile and registry workflow.
- VS Code/Codex plugin: manifest, package location, cache/install instructions.

Warn when a new artifact has no distribution path. This is a ship risk, not a code bug.

## Output

```markdown
Preflight:
- Branch: [branch] -> [base]
- Dirty state:
- Recent commits:
- Changed files:
- Distribution pipeline:
- Blocking issues:
```
