---
name: priv-skill-update
description: Review updated external skill libraries and selectively strengthen the Simple Gstack for Codex 0.2.0 skills. Use when the user asks to absorb, compare, migrate, sync, or learn from updates in .tmp/gstack, .tmp/superpowers, .tmp/skills, .tmp/awesome-design-md, or other third-party skill collections; when maintaining the 0.2.0 skill set; or when deciding whether an upstream skill update should enhance an existing gstack-* or priv-skill-* skill or become a new standalone skill.
---

# Skill Update

Use this skill to keep the 0.2.0 Codex engineering OS fresh as upstream skill collections evolve. The job is to extract durable operating improvements, not to copy external skills wholesale.

## Scope Gate

- Proceed when the user asks to review new or updated skills, compare upstream collections, port useful patterns, or strengthen the local 0.2.0 skills.
- Default to local source directories such as `.tmp/gstack`, `.tmp/superpowers`, `.tmp/skills`, and `.tmp/awesome-design-md`.
- If the user asks to fetch the latest upstream repositories and network access is unavailable, request approval through the normal command escalation path.
- Do not rewrite the whole skill set unless the user explicitly asks for a broad version refresh.
- Do not change installed Codex cache paths directly; edit the repository source under `codex/simple-gstack-codex/0.2.0`.

## Source Intake

Read the smallest useful set:

- current plugin inventory: `codex/simple-gstack-codex/0.2.0/README.md` and relevant `skills/*/SKILL.md`
- active context: `.context/README.md`, active `eng-plan.md`, and active `tasks.md`
- upstream overview files: `.tmp/*/README.md`, release notes, plans, or changed `SKILL.md` files
- source-specific routing in `references/source-routing.md`

When a source is large, list files first and read only the relevant `SKILL.md` and directly linked references.

## Workflow

1. Establish the update question:
   - source collection
   - changed area
   - target skill family
   - desired depth: scan, recommendation, or apply changes
2. Build an inventory of candidate upstream changes:
   - new skills
   - materially changed workflows
   - reusable checks, stop rules, validation rules, or artifact formats
   - patterns already covered locally
3. Classify each candidate:
   - `ADOPT`: directly improves an existing 0.2.0 skill
   - `ADAPT`: useful idea, but needs Codex-specific wording or smaller scope
   - `NEW`: deserves a new `priv-skill-*` or `gstack-*` skill
   - `WATCH`: promising but not ready
   - `REJECT`: duplicates local behavior, overfits another tool, or adds unsafe complexity
4. Map candidates to local targets:
   - update existing `gstack-*` for full workflow mode behavior
   - update existing `priv-skill-*` for lightweight point capability
   - add a new `priv-skill-*` only when a user-recognizable trigger and reusable workflow exist
   - add shared references only when multiple skills should use the same guidance
5. Patch the smallest useful change:
   - preserve current local naming, operating contracts, and Chinese README style
   - keep SKILL.md concise and move detailed routing or templates into `references/`
   - avoid importing upstream tool assumptions that do not exist in Codex
6. Update `.context` artifacts when the work is non-trivial:
   - add or refresh task entries
   - record which upstream source informed the change
   - note rejected candidates when they are likely to be revisited
7. Validate:
   - parse all skill frontmatter
   - run `quick_validate.py` when Python dependencies are available
   - confirm plugin inventory still resolves
   - report any validation blocked by local environment

## Output Shape

For recommendation-only work, use:

```markdown
## Skill Update Review

- Sources checked:
- Strong candidates:
- Adopt/adapt/new/watch/reject:
- Recommended local targets:
- Risks:
- Next patch:
```

For applied work, finish with:

```markdown
## Skill Update Applied

- Sources used:
- Skills changed:
- New skills:
- Context artifacts:
- Validation:
- Deferred candidates:
```

## Decision Rules

- Prefer strengthening an existing skill over adding a new one.
- Add a new skill only when it has a clear trigger, independent workflow, and likely repeated use.
- Import procedures, not branding or command syntax tied to a different agent runtime.
- Favor facts, stop conditions, validation gates, and artifact shapes over motivational language.
- Reject updates that increase context cost without changing behavior.
- Keep local 0.2.0 as the source of truth even when upstream is newer.

## References

- Read `references/source-routing.md` before comparing external skill collections.
- Use `references/update-report-template.md` when writing a durable update review into `.context`.
