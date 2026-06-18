---
name: gstack-ship
description: Validate and package a branch for merge or release. Use when implementation is done and the user invokes ship, asks for release readiness, PR preparation, final verification, version/changelog preparation, plan completion audit, test coverage gate, or a go/no-go decision before merge.
---

# Gstack Ship

Use this skill at the end of the engineering loop. It turns the current branch into a verified release candidate or clearly explains why it is not ready.

## Operating Contract

Read `../../references/engineering-os-contract.md` before acting. This skill is the Ship mode and must follow the shared mode-selection, source-of-truth, artifact, stop, and verification rules.

## Safety Boundary

- Do not force push.
- Do not merge base, push, create PRs, publish releases, or edit remote PR/MR state unless the user explicitly asks and approvals allow it.
- Do not modify business logic. If a blocker requires code changes, stop with a clear handoff to `gstack-implement`, `gstack-qa`, or an explicit fix request.
- Never claim "ready" without fresh verification evidence.
- Keep version and changelog edits append-only or exact-update safe. Never clobber existing `CHANGELOG.md` history.

## Context Intake

Read available inputs:

1. `.context/README.md` and active iteration artifacts it names.
2. Active `eng-plan.md`, `tasks.md`, `sprint.md`, `review-findings.md`, `qa-findings.md`, and `ceo-review.md`.
3. `MILESTONES.md`, `CHANGELOG.md`, `VERSION`, `TODOS.md`, `.github/copilot-instructions.md`, `README.md`, `ARCHITECTURE.md`, and `DESIGN.md`.
4. Current branch, base branch, recent commits, changed files, and current worktree status.

Missing context lowers certainty; it does not permit inventing release facts.

## Workflow

1. Preflight:
   - Read `references/preflight.md`.
   - Detect branch, base branch, dirty state, untracked files, recent commits, changed files, and distribution pipeline implications.
2. Verification:
   - Run targeted checks from repo instructions and project config.
   - Read `references/test-and-coverage.md` for coverage audit and gate logic.
3. Plan completion:
   - Read `references/plan-completion.md` when plan/task artifacts exist.
4. Pre-landing review:
   - Use existing `review-findings.md` if current enough.
   - Otherwise run a compact critical review using `gstack-review` principles.
5. Version and changelog:
   - Read `references/version-and-changelog.md`.
   - Ask before MINOR/MAJOR bumps or any ambiguous release note.
6. TODO and documentation impact:
   - Mark completed TODOs only with clear evidence.
   - Recommend `gstack-document-release` when docs are stale or coverage gaps exist.
7. PR preparation:
   - Read `references/pr-template.md`.
   - Generate a PR title/body and optional `.context/ship-checklist.md`.
   - Only push/create/update PR if explicitly requested.
8. Final go/no-go:
   - Use `references/final-gate.md`.

## Idempotency

Re-running ship should rerun verification and regenerate the readiness report. Safe action steps must detect existing version entries, changelog entries, pushed branches, PRs, and checklist artifacts instead of duplicating them.

## References

- `references/preflight.md`
- `references/test-and-coverage.md`
- `references/plan-completion.md`
- `references/version-and-changelog.md`
- `references/pr-template.md`
- `references/final-gate.md`
