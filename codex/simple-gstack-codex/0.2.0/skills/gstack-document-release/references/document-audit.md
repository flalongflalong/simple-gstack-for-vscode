# Document Audit

Audit each document against the diff and current repository state.

## Safe Auto-Updates

Apply directly when evidence is clear:

- Add new factual rows/items to tables and lists.
- Update paths, filenames, counts, command names, or version numbers.
- Fix stale cross-links.
- Add references to newly created docs from entry-point docs.
- Mark TODOs completed when diff evidence is conclusive.
- Light CHANGELOG voice polish after reading `changelog-safety.md`.

For every edit, report a specific one-line summary and a compact before/after snippet.

## Ask Before Changing

Ask before:

- README positioning, project mission, or audience.
- Architecture philosophy, design rationale, or security model.
- Removing an entire section.
- Large rewrites over roughly 10 lines in one section.
- Narrative contradictions between docs.
- New TODO items.
- VERSION bumps.

## File Lenses

`README.md`:

- Does it mention shipped user-facing features?
- Are setup, examples, commands, and troubleshooting still true?
- Are important docs discoverable from it?

`ARCHITECTURE.md`:

- Do components and diagrams match current code?
- Are data flows and module names still accurate?
- Update only facts clearly contradicted by the diff.

`CONTRIBUTING.md`:

- Would a new contributor's setup steps work?
- Do commands match package/build files?
- Do test tiers and contribution workflow match reality?

Project instruction docs:

- Do structure, commands, skill lists, and workflow rules match current files?
- Ignore host-specific UI mechanics that do not apply to this repository.

`CHANGELOG.md`:

- Do not touch until `changelog-safety.md` has been read.

Other docs:

- Identify audience and purpose.
- Check whether the diff contradicts examples, paths, concepts, or commands.

## Discoverability

Every important doc should be reachable from `README.md`, `AGENTS.md`, `CLAUDE.md`, or another obvious entry-point doc. Flag unreachable docs and auto-link only when the location is obvious and low risk.

## Output During Work

Use this shape after audit:

```markdown
Document audit:
- README.md: [current | updated | needs user decision] - [specific reason]
- ARCHITECTURE.md: [current | updated | needs user decision] - [specific reason]
- CHANGELOG.md: [skipped | polished | needs user decision] - [specific reason]
```
