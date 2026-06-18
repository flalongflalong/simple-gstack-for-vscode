# VERSION And TODOS

Use this when `VERSION`, `TODOS.md`, or deferred-work comments are present.

## VERSION

Never bump `VERSION` without user confirmation.

If `VERSION` does not exist, skip.

If `VERSION` was already changed in this release scope:

1. Read the current version.
2. Read the relevant CHANGELOG entry.
3. Check whether the entry covers the full branch diff.
4. If covered, report that the bump is adequate.
5. If significant changes are not covered, ask whether to bump again, expand the existing entry, or leave for later.

If `VERSION` was not changed:

- Recommend Skip for docs-only changes.
- Recommend PATCH for small bug fixes or documentation bundled with a code release.
- Recommend MINOR for new user-facing capabilities.
- Recommend MAJOR only for breaking changes.

Do not apply the bump until the user answers.

## TODOS.md

If `TODOS.md` does not exist, skip.

Mark completed only when the diff clearly proves completion. Include evidence such as file paths or changed behavior.

Ask before:

- adding new TODO items
- changing TODO descriptions
- moving ambiguous work to completed

## Deferred Work Comments

Search changed files for meaningful `TODO`, `FIXME`, `HACK`, and `XXX` comments. Ignore temporary inline notes that do not represent backlog work.

For meaningful deferred work, ask whether to record it in `TODOS.md`.

## Summary Shape

```markdown
VERSION:
- Current:
- Recommended action:
- Reason:

TODOS.md:
- Completed:
- Needs confirmation:
- Unchanged:
```
