# Engineering Plan: Codex Engineering OS Skills

## Goal

Reposition the Codex skills under `codex/simple-gstack-codex/0.2.0/skills/` as an engineering operating system for Codex, not a prompt translation layer, with a second layer of lightweight standalone skills for daily full-stack work.

## Problem

The skills already encode useful roles, but each skill independently defines intake, boundaries, output, and verification. That makes the system harder to maintain and weakens the repeated behaviors Codex needs most:

- choosing the correct work mode
- reading file-backed sources of truth
- writing only the right artifacts
- stopping at role boundaries
- verifying with fresh evidence

## Scope

In scope:

- Add one shared contract for mode selection, source-of-truth order, artifact rules, stop rules, and verification.
- Wire all 15 existing skills to that contract.
- Keep each skill focused on its role-specific workflow.
- Preserve existing per-skill references and detailed checklists.
- Add small `skill-*` standalone skills for full-stack development, bug fixing, database/API work, testing/quality, lightweight planning, documentation/requirement changes, code review, release/devops, and exploration.

Out of scope:

- Adding missing roles such as `gstack-cso`, `gstack-investigate`, or `gstack-upgrade`.
- Creating the plugin manifest or release packaging.
- Rewriting the VS Code `.github/prompts` files.
- Changing skill runtime behavior outside documentation/instruction files.
- Creating framework-specific micro-skills for every stack variant before real usage shows the need.

## Design

Add `codex/simple-gstack-codex/0.2.0/references/engineering-os-contract.md` as the shared operating contract. Each `SKILL.md` gets a short `Operating Contract` section near the top:

```md
## Operating Contract

Read `../../references/engineering-os-contract.md` before acting. This skill is the [mode] mode and must follow the shared mode-selection, source-of-truth, artifact, stop, and verification rules.
```

The shared contract defines:

- mode map for all 15 skills
- source-of-truth order
- artifact ownership
- stop conditions
- verification standard
- final report requirements

The standalone `skill-*` layer stays independent of the shared gstack contract so it can remain fast and single-purpose. Each standalone skill must still state trigger, scope gate, context, workflow, stop rules, and finish/verification expectations. Broad entrance skills may route to narrower standalone skills when a task is more specific.

## Verification

- Run the skill creator quick validator against each skill folder.
- Inspect all `SKILL.md` files for the operating contract link.
- Inspect the diff for accidental broad rewrites.
- Validate standalone skill frontmatter, names, and absence of template TODOs.
