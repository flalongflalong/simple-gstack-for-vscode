# Diff And Coverage

Use this before editing any documentation.

## Base Branch

Detect a base branch for diff commands:

1. Prefer the current PR/MR base if available from `gh` or `glab`.
2. Otherwise use `git symbolic-ref refs/remotes/origin/HEAD`.
3. Otherwise use `origin/main`, then `origin/master`, then `main`.

If detection is uncertain, state the assumed base branch.

## Diff Inputs

Gather:

```bash
git diff <base>...HEAD --stat
git log <base>..HEAD --oneline
git diff <base>...HEAD --name-only
```

If the repo has no useful branch diff, use the user's supplied release notes or current working-tree diff and state the lower confidence.

## Documentation Discovery

Find docs without crawling build artifacts:

```bash
find . -maxdepth 3 -name "*.md" \
  -not -path "./.git/*" \
  -not -path "./node_modules/*" \
  -not -path "./.context/*" \
  -not -path "./.gstack/*" \
  -not -path "./dist/*" \
  -not -path "./build/*" | sort
```

Include project instruction docs such as `.github/copilot-instructions.md`, `.codex/AGENTS.md`, and `AGENTS.md` when present.

## Change Classification

Classify changed surfaces:

- New feature or capability
- Behavior change
- Removed feature
- API, CLI, config, environment variable, or workflow change
- Infrastructure, test, CI, packaging, or build change
- Documentation-only change

## Coverage Map

Build a Diataxis-style coverage map for every changed public surface. This is an audit lens, not a demand to generate every missing page.

```markdown
Surface | Reference | How-to | Tutorial | Explanation | Gap
--- | --- | --- | --- | --- | ---
[new command] | README | missing | missing | missing | reference-only
[new API] | missing | missing | missing | missing | critical
```

Definitions:

- Reference: what it is, options, APIs, tables.
- How-to: task-oriented usage.
- Tutorial: newcomer walkthrough.
- Explanation: why the design exists.

Critical gaps have zero coverage. Common gaps have reference-only coverage. Flag gaps and recommend follow-up docs, but do not invent broad new documentation unless the user asks.

## Diagram Drift

If docs contain ASCII diagrams or Mermaid blocks, compare named modules, commands, services, and flows against the diff. Flag renamed, moved, split, or deleted entities. Do not auto-edit diagrams unless the correction is tiny and factually obvious.
