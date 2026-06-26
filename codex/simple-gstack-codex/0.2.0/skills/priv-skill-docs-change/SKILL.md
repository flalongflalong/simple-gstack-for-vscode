---
name: priv-skill-docs-change
description: Documentation and requirement-change handling. Use when the user asks to update README/API docs/design docs/ADRs/requirements, turn notes into a spec, record a requirement change, sync docs with code, clarify domain terminology, or assess doc impact of a small code change.
---

# Skill Docs Change

Use this skill when the main deliverable is understanding captured in files. Keep docs factual, scoped, and tied to the current repo.

For requirement deltas, prefer `$priv-skill-requirement-change`. For a formal design/API/database/deploy/test document, prefer `$priv-skill-technical-doc`.

## Context

Inspect the docs that govern the area:

- `README.md`, `CHANGELOG.md`, `ARCHITECTURE.md`, `DESIGN.md`, `MILESTONES.md`, `TODOS.md`
- `.context/` artifacts, ADRs, `CONTEXT.md`, API specs, generated docs, and package/build instructions
- code paths needed to verify whether a doc statement is true

## Workflow

1. Identify the document type: requirement note, implementation spec, API docs, ADR, user docs, release note, or backlog/TODO update.
2. Cross-check claims against code or existing authoritative docs before editing.
3. Preserve user-authored structure and history. Prefer exact edits over rewrites.
4. For requirement changes, record:
   - what changed
   - why it changed
   - affected users/systems
   - canonical business terms, field meanings, lifecycle states, and customer-facing wording
   - acceptance criteria
   - out-of-scope items
5. For ADRs, write one only when the decision is hard to reverse, surprising without context, and chosen from real alternatives.
6. For changelog/release docs, append or exact-edit. Never regenerate history wholesale.

## Stop Rules

Stop before deleting sections, changing security/contract wording, rewriting public release history, or inventing behavior not proven by code or source docs.

## Finish

Report docs changed, source evidence used, requirement deltas captured, and any code/doc mismatch that remains unresolved.
