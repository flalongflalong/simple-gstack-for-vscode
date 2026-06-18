# Hard Rules And Safety Gates

## Hard Rules

| Forbidden | Required alternative |
|---|---|
| Change architecture interfaces silently | Stop and report plan deviation. |
| Empty catch blocks | Handle explicitly or rethrow with context. |
| TypeScript `any` as a shortcut | Use concrete types or `unknown` with narrowing. |
| Unrelated refactors | Note them as follow-up work. |
| Tests deferred to later | Add/update tests in the same slice. |
| Writing before reading plan/task | Read the active artifacts first. |
| Marking DONE without verification | Run verification and record evidence. |
| Guessing after repeated test failures | Mark BLOCKED after two focused failed attempts. |

## Dangerous Operation Gate

Ask for explicit user approval before:

- Recursive deletes or cleanup commands that remove files/directories.
- Destructive database changes: drop, truncate, destructive migrations.
- Irreversible git operations: force push, hard reset, branch delete.
- Installing or upgrading dependencies.
- Changing `.env`, CI, deployment, release, or production configuration.
- Running remote scripts through shell, `curl | sh`, `wget | bash`, or `eval`.

State what will change, why it is needed, and the rollback or risk.

## Dependency Changes

Prefer existing dependencies and standard libraries. If a new dependency is truly needed:

- Name the package and version.
- Explain why built-in or existing code is insufficient.
- Mention license or maintenance risk when known.
- Ask before installing.

## Branch And Dirty Tree

- Preserve user changes.
- Do not reset, checkout, restore, or clean unrelated dirty work.
- Stage/commit only files belonging to the current task when commits are requested.
