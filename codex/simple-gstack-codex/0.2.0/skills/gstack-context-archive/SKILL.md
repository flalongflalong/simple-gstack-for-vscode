---
name: gstack-context-archive
description: Safely archive a completed .context iteration after a milestone is done, preserving originals, condensing durable decisions, moving process artifacts into .context-archive, merging learnings, and updating context status. Use when the user invokes /context-archive or asks Codex to clean up completed iteration artifacts without losing project memory.
---

# Gstack Context Archive

Use this skill after a feature, milestone, or iteration is complete. The goal is to leave durable decisions easy to find and move process noise out of the next iteration's context window.

## Operating Contract

Read `../../references/engineering-os-contract.md` before acting. This skill is the Archive mode and must follow the shared mode-selection, source-of-truth, artifact, stop, and verification rules.

## Safety Boundary

- Archive means copy or move first, never blind deletion.
- Do not archive, delete, or condense root permanent artifacts: `ARCHITECTURE.md`, `DESIGN.md`, and `MILESTONES.md`.
- Treat `learnings.md` as append-only. Merge useful iteration learnings upward; do not delete them.
- Before condensing any file, copy the original into `.context-archive/<iteration>/` with a `.original` suffix.
- Do not execute archive moves until the user confirms the precheck and archive plan.
- If milestone readiness is unclear, report uncertainty and ask before proceeding.

## Context Intake

Read, when present:

1. `.context/README.md` to identify the active iteration directory.
2. `MILESTONES.md` to confirm release, completion, or archive readiness.
3. Active `.context/<iteration>/` file list and line counts.
4. Root `ARCHITECTURE.md`, `DESIGN.md`, and existing root `learnings.md` for merge targets.
5. `.gitignore` to see whether `.context-archive/` is already tracked or ignored.

If there is no active `.context/` iteration, report that no archive target was found.

## Workflow

1. Run the precheck from `references/precheck.md`.
   - Show milestone status, document-release status, active iteration path, and files.
   - Stop for user confirmation if any gate is missing.
2. Classify files using `references/classification.md`.
   - Present the archive plan before editing.
   - Stop for user confirmation or adjustments.
3. Condense durable files using `references/condense-rules.md`.
   - Copy originals to archive first with `.original` suffix.
   - Rewrite active condensed files only after the original is preserved.
4. Execute safe moves and merges using `references/execution.md`.
   - Create `.context-archive/<iteration>/`.
   - Move process artifacts.
   - Merge learnings upward.
   - Update `.context/README.md`.
   - Append a `MILESTONES.md` row.
5. Produce the final health report using `references/report-template.md`.

## Completion Standard

Finish with:

- Archive directory path.
- Files condensed with before/after line counts.
- Files moved whole.
- Learnings merged.
- Remaining active context files and line counts.
- Context size reduction estimate.
- `.gitignore` recommendation for `.context-archive/`.
