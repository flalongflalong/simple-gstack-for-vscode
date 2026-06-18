# PR Template

Generate this locally by default. Push/create/update PR only when the user explicitly asks.

## Title

Use:

```text
<type>: <short user-facing summary>
```

If the repository convention requires a version prefix, use:

```text
v<VERSION> <type>: <short user-facing summary>
```

## Body

```markdown
## Summary

- [Grouped release change.]
- [Grouped release change.]

## Test Coverage

- Commands run:
- Result:
- Coverage audit:

## Pre-Landing Review

- Review source:
- Critical findings:
- Residual risks:

## Plan Completion

- Plan:
- Completion:
- Deferred:
- Manual confirmations:

## Version And Changelog

- VERSION:
- CHANGELOG:

## Documentation

- Docs updated:
- Recommended follow-up:

## Known Issues / Deferred

- [None | list]

## Test Plan

- [How a reviewer can verify the PR]
```

## Redaction

Before sending a PR body to a remote service, scan for secrets, credentials, tokens, private URLs, internal hostnames, and user emails. If a likely credential is found, block the remote update and ask the user to rotate/redact.
