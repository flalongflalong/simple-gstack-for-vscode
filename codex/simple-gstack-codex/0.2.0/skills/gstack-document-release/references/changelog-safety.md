# CHANGELOG Safety

Read this before any `CHANGELOG.md` edit.

## Non-Negotiable Rules

- Read the entire `CHANGELOG.md` first.
- Never use whole-file overwrite behavior on `CHANGELOG.md`.
- Never delete, reorder, replace, or regenerate existing entries.
- Never synthesize a new entry over an existing one from commits.
- Use exact minimal replacements only.
- If content seems wrong, incomplete, or ambiguous, ask the user.

## When To Skip

Skip voice polish when:

- `CHANGELOG.md` does not exist.
- No CHANGELOG entry was added or changed in the current release scope.
- The only changes are historical or unrelated to the release.

## Sell Test

Score each touched entry 0-3:

- 1 point: says what changed.
- 1 point: says why users should care.
- 1 point: says how to use it, where to find it, or what workflow changed.

Entries under 2 need polish. Entries at 3 are usually good enough.

## Voice Principles

- Lead with what the user can now do.
- Translate implementation details into user value without inventing metrics.
- Put internal/contributor changes under a contributor-oriented heading when an existing structure supports it.
- Keep bug fixes professional: describe the broken user path and the improvement.
- Avoid hype, vague business language, and claims not supported by the diff.

## Safe Examples

```markdown
Before: Refactored auth cache.
After: Sign-in is more reliable under repeated requests because the auth cache now handles concurrent refreshes.
```

```markdown
Before: Added gstack-document-release skill.
After: You can now run `gstack-document-release` to sync release docs, check coverage gaps, and polish CHANGELOG entries without rewriting history.
```

If the `After` changes meaning, ask before applying it.
