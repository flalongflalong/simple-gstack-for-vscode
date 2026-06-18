# Codex Repository Instructions

This file adapts `.github/copilot-instructions.md` for Codex use in this
repository. Treat it as the Codex-facing companion to the Copilot rules, with
Copilot UI mechanics removed.

## Operating Stance

- Prefer correctness over agreeableness. If a requested approach is unsafe,
  incorrect, or an obvious engineering anti-pattern, say so plainly and give
  the reason.
- Distinguish preference from correctness. Style, naming, and framework taste
  can follow the user; security, data integrity, logic errors, and correctness
  issues must be challenged directly.
- When disagreeing, provide concrete evidence or reasoning, not vague refusal.
- If the user explicitly accepts a risky path after being warned, call out the
  risk clearly and add a short `RISK:` comment only where future maintainers
  would otherwise miss it.
- Do not pad responses with broadly true but irrelevant material. Keep answers
  focused on the work at hand.
- State uncertainty explicitly when evidence is incomplete.

## Source Of Truth

Read these files first when they exist:

1. `.context/README.md`
2. The active iteration files pointed to by `.context/README.md`, especially
   `eng-plan.md`, `tasks.md`, and `ceo-review.md`
3. `.github/copilot-instructions.md`
4. `.context/BACKEND_GUIDE.md`
5. `ARCHITECTURE.md`
6. `DESIGN.md`
7. `MILESTONES.md`
8. `README.md`

Notes:

- `.context/README.md` identifies the current active iteration directory, using
  the convention `.context/{version-or-feature}/`.
- Permanent project artifacts live at the repository root and must not be
  deleted as part of iteration cleanup: `ARCHITECTURE.md`, `DESIGN.md`, and
  `MILESTONES.md`.
- `MILESTONES.md` is append-only. Add a new line when a role completes a core
  output.
- `learnings.md`, when present, is append-only. Add new learnings without
  rewriting existing entries.
- Missing context files reduce certainty; they do not justify inventing facts.
- Files are the contract. Chat history is context, not authority.

## Execution Rules

- Use tools to inspect files, run commands, edit code, and verify outcomes.
  Report what actually happened.
- Prefer direct repository inspection over asking the user for information that
  is already present on disk.
- Use the smallest command that resolves the next uncertainty.
- Prefer the smallest safe diff. Do not drift into unrelated refactors.
- For non-trivial work, create or refresh planning artifacts before broad
  implementation.
- If the work naturally breaks into three or more independent files, documents,
  or modules, create or refresh `tasks.md` and execute in batches.
- When batch mode applies, list the batches with their expected outputs and
  dependency order, then ask for confirmation before starting broad execution.
  Complete and write one batch at a time.
- Do not simulate progress. If you say you will inspect, test, or edit
  something, perform the corresponding tool action.
- If a tool or verification step fails, diagnose the failure and try a suitable
  alternative before handing the problem back to the user.

## Verification

- Run targeted verification for the code or documents changed whenever
  practical.
- Start narrow, then broaden only as confidence grows.
- If the repository has no usable automated check for the changed area,
  document the manual verification actually performed.
- Do not fix unrelated failing tests as part of a scoped task unless the user
  asks.

## gstack Role Invocations

Treat these as explicit role invocations when the user writes them with or
without a leading slash:

- `/ceo`
- `/cso`
- `/office-hours`
- `/implement`
- `/review`
- `/qa`
- `/qa-only`
- `/tasks`
- `/investigate`
- `/plan-eng-review`
- `/plan-design-review`
- `/design-consultation`
- `/design-review`
- `/document-release`
- `/context-archive`
- `/ship`
- `/design-shotgun`
- `/upgrade`

Role execution rules:

- Do not apply a gstack role workflow unless the user explicitly invokes a role
  command.
- For a role invocation, first read `.github/skills/g-{role}/SKILL.md` when it
  exists.
- Then read and follow `.github/prompts/g-{role}.prompt.md` when it exists.
- If a role has a prompt but no matching skill file, state that gap briefly and
  continue with the prompt as the source of role-specific instructions.
- Respect each role's documented read/write contract and predecessor
  dependencies.
- Keep role boundaries intact: planning roles should not silently implement
  production code, implementation roles should not self-approve their own code,
  and review/security/QA roles should report or fix only within their stated
  scope.

## Context Artifacts

- Active iteration files belong under the current `.context/{iteration}/`
  directory.
- Archived iteration files belong under `.context-archive/{iteration}/`.
- Architecture decisions should be appended to `ARCHITECTURE.md` when a role or
  task makes a durable architectural choice.
- Visual system decisions should be captured in `DESIGN.md` when relevant.
- Release-facing notes should be written by the appropriate release/document
  workflow, not mixed into unrelated implementation work.

## Collaboration Principles

- Reject blind edits. For bugs, prefer the `/investigate` and `/qa` pattern:
  reproduce or gather evidence, identify root cause, make the smallest fix, and
  verify the regression path.
- Pair implementation with tests when practical, whether writing new behavior or
  fixing defects.
- Keep decisions grounded in repository files and observable command output.
- If evidence is missing, say what is missing and proceed only when a reasonable
  assumption is safe.
