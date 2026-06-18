---
name: gstack-document-release
description: Synchronize release documentation with shipped code while protecting existing CHANGELOG history. Use when the user asks for document-release, post-ship docs, update docs after ship, sync README/ARCHITECTURE/CONTRIBUTING/CHANGELOG/TODOS/VERSION, polish release notes, check documentation coverage, or verify docs before merge/release.
---

# Gstack Document Release

Use this skill after implementation and review, before merge or release. The goal is accurate, discoverable, user-forward documentation that matches what actually shipped.

## Operating Contract

Read `../../references/engineering-os-contract.md` before acting. This skill is the Release docs mode and must follow the shared mode-selection, source-of-truth, artifact, stop, and verification rules.

## Core Stance

- Read before editing. Never infer document state from filenames alone.
- Make factual, diff-proven documentation fixes directly.
- Ask before narrative rewrites, security-model wording, section deletion, large rewrites, VERSION bumps, and new TODO additions.
- Do not commit, push, or edit PR/MR bodies unless the user explicitly asks for release automation.
- Preserve user-authored docs. Prefer small exact edits over whole-file rewrites.

## Source Intake

Read available inputs:

1. `MILESTONES.md` for release-cycle accomplishments.
2. `CHANGELOG.md` for existing release entries.
3. `VERSION` when present.
4. `README.md`, `ARCHITECTURE.md`, `CONTRIBUTING.md`, `DESIGN.md`, `TODOS.md`, project instruction files, and other root docs.
5. `.context/README.md`, active `eng-plan.md`, `tasks.md`, `review-findings.md`, and `ceo-review.md` when present.
6. Package/build files and project instructions that define real commands.
7. Git diff, recent commits, and changed file list.

If no diff or release scope is available, ask for the release scope or use the current branch diff against the detected base branch.

## Workflow

1. Read `references/diff-and-coverage.md`; detect base branch, summarize changed files/commits, discover docs, and build the coverage map.
2. Read `references/document-audit.md`; audit each doc and apply only clear factual updates.
3. Read `references/changelog-safety.md` before touching `CHANGELOG.md`.
4. Read `references/version-and-todos.md` when `VERSION` or `TODOS.md` exists, or when new deferred-work comments appear.
5. Read `references/final-report-template.md` and produce the documentation health report.
6. Append a `MILESTONES.md` entry only if this repository uses that file and documentation files were actually changed.

## CHANGELOG Hard Rule

Never overwrite, replace, reorder, delete, or regenerate existing `CHANGELOG.md` entries. Polish wording only with exact, minimal replacements after reading the whole file. If an entry appears wrong or incomplete, ask the user instead of silently fixing it.

## Automation Boundary

This Codex skill defaults to local documentation edits only. Commit creation, branch pushes, PR/MR body edits, labels, and release publication are outside the default scope. If the user explicitly asks for those steps, perform them narrowly and report every command.

## References

- `references/diff-and-coverage.md` for preflight and Diataxis-style coverage mapping.
- `references/document-audit.md` for per-file audit and safe auto-update rules.
- `references/changelog-safety.md` before editing `CHANGELOG.md`.
- `references/version-and-todos.md` for release version and backlog cleanup.
- `references/final-report-template.md` for final output.
