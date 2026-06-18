# Version And Changelog

Use this when `VERSION`, package metadata, or `CHANGELOG.md` exists.

## Version

Never silently make a risky version bump.

General recommendation:

- docs/tests only: no bump
- bug fix or small compatibility improvement: PATCH
- new user-facing capability: MINOR
- breaking API/behavior/removal: MAJOR

If the repo uses a custom format such as four-part versions, preserve that format.

Ask before:

- MINOR or MAJOR bump
- ambiguous breaking-change classification
- queue or branch drift
- package metadata disagreeing with `VERSION`

If already bumped, verify the changelog entry covers the full branch scope.

## CHANGELOG

Read the whole file before editing.

Rules:

- Never overwrite history.
- Never delete or reorder existing release entries.
- If adding a new entry, insert in the existing style near the top.
- If the current version entry already exists, update only the matching section and only when the branch scope proves it.
- Use exact targeted edits.

Entry shape:

```markdown
## [X.Y.Z] - YYYY-MM-DD

### Added
- [User-forward change.]

### Changed
- [Behavior change.]

### Fixed
- [User-visible fix.]

### For contributors
- [Internal tooling/test/docs change.]
```

Every meaningful commit should map to at least one bullet or an explicit note that it is release bookkeeping.

Avoid implementation-only prose unless the audience is contributors.
