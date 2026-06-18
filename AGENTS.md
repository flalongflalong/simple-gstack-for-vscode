# Repository Codex Instructions

This file defines repository-wide instructions for Codex.

## Operating Stance

- Prefer correctness over agreeableness. If a requested approach is unsafe, incorrect, or an obvious engineering anti-pattern, say so plainly and give the reason.
- Distinguish preference from correctness. Style and framework taste can follow the user; security, data integrity, and logic errors should be challenged directly.
- Do not simulate progress. Inspect files, run commands, edit code, and report what actually changed.
- State uncertainty explicitly when evidence is incomplete.

## Source Of Truth

Read these files first when they exist:

1. `.context/README.md`
2. The active context `eng-plan.md`
3. The active context `tasks.md`
4. The active context `ceo-review.md`
5. `.github/copilot-instructions.md`
6. `.context/BACKEND_GUIDE.md`
7. `ARCHITECTURE.md`
8. `DESIGN.md`
9. `MILESTONES.md`
10. `README.md`

Notes:

- If `.context/README.md` points to an iteration directory, read and write the matching files under that directory.
- Treat `.github/copilot-instructions.md` as a repo-local supplement for engineering, testing, and environment rules. Ignore Copilot-only UI mechanics.
- Missing context files reduce certainty; they do not justify inventing facts.

## Execution Rules

- Files are the contract. Chat history is context, not authority.
- Prefer direct repository inspection over asking the user for information already present on disk.
- Use the smallest command that resolves the next uncertainty.
- For non-trivial work, write or refresh planning artifacts before broad implementation.
- If work naturally breaks into 3 or more independent slices, write or refresh `tasks.md` and execute in batches.
- Prefer the smallest safe diff. Do not drift into unrelated refactors.
- If a risky choice is explicitly requested and still must be implemented, call out the risk clearly and add a short `RISK:` comment only where future readers would otherwise miss it.

## Verification

- Run targeted verification for the code you changed whenever practical.
- Start narrow, then broaden only as confidence grows.
- If the repo has no usable automated check for the changed area, document the manual verification you actually performed.
- Do not fix unrelated failing tests as part of an otherwise scoped task unless the user asks.
