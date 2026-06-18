# Codex Engineering OS Contract

This plugin is an engineering operating system for Codex. Each skill is a work mode with a bounded job, owned artifacts, stop conditions, and verification duties.

## Mode Map

Use the narrowest mode that matches the user's request:

| Mode | Skill | Owns | Must not own |
| --- | --- | --- | --- |
| Discover | `gstack-office-hours` | idea pressure-test, user pain, alternatives | architecture, implementation |
| Scope | `gstack-ceo` | MVP boundary, product leverage, out-of-scope calls | technical design, code review |
| Design system | `gstack-design-consultation` | `DESIGN.md`, durable visual rules | production UI implementation |
| Design options | `gstack-design-shotgun` | divergent UI directions | final design system, production code |
| Architecture | `gstack-plan` | `eng-plan.md`, contracts, failure modes, test scope | task execution |
| UI plan review | `gstack-plan-design-review` | pre-implementation UX/state audit | code fixes |
| Tasking | `gstack-tasks` | `tasks.md`, `sprint.md`, deferred TODOs | architecture redesign, code |
| Build | `gstack-implement` | code, tests, docs required by approved tasks | architecture changes, self-review |
| Review | `gstack-review` | findings, scope drift, coverage gaps | silent fixes unless requested |
| QA repair | `gstack-qa` | reproduction, minimal fix, regression proof | broad redesign |
| QA report | `gstack-qa-only` | non-mutating QA evidence and findings | source/test/config edits |
| Visual audit | `gstack-design-review` | implemented UI findings and optional requested polish fixes | design-system rewrite |
| Ship | `gstack-ship` | release readiness, final gate, PR/release notes draft | business logic changes |
| Release docs | `gstack-document-release` | factual docs/changelog/TODO sync | release automation unless requested |
| Archive | `gstack-context-archive` | safe context condensation and archival | deleting durable project memory |

If two modes could apply, choose the earliest mode in the delivery loop that resolves the real uncertainty. Do not jump to build when the blocker is scope, architecture, or evidence.

## Source Of Truth

Inspect files before acting. Prefer the smallest read set that proves the next decision.

1. `.context/README.md`, then the active iteration files it names.
2. Active role artifacts: `office-hours-output.md`, `ceo-review.md`, `design-plan.md`, `eng-plan.md`, `tasks.md`, `sprint.md`, `review-findings.md`, `qa-findings.md`, `cso-findings.md`, and `ship-checklist.md` when present.
3. Durable repo docs: `AGENTS.md`, `.github/copilot-instructions.md`, `ARCHITECTURE.md`, `DESIGN.md`, `MILESTONES.md`, `TODOS.md`, `CHANGELOG.md`, `README.md`, and `VERSION` when relevant.
4. Current code, tests, package/build files, config, migrations, routes, styles, and recent git history needed to prove the claim.

Treat chat history as context, not authority. If files and chat conflict, name the conflict and follow files unless the user explicitly changes the requirement.

## Artifact Rules

- Write artifacts only when the skill owns them or the user explicitly requests them.
- If `.context/README.md` names an active iteration, write artifacts under that directory. Otherwise use `.context/<artifact>.md` or the existing root artifact path already used by the repo.
- Preserve completed task state and prior findings unless new evidence invalidates them.
- Append or exact-edit durable history files; never regenerate `CHANGELOG.md`, `MILESTONES.md`, `ARCHITECTURE.md`, or `learnings.md` wholesale.
- Mark deferred work in `TODOS.md` only when it is concrete, valuable, and intentionally out of current scope.

## Stop Rules

Stop and report instead of improvising when:

- the selected mode would need to perform work owned by another mode
- required source files contradict each other on a product, contract, or data-integrity decision
- the plan cannot be implemented without changing architecture or scope
- verification cannot run and the risk cannot be bounded with inspection
- a safety boundary would be crossed, such as destructive git/file operations, release publication, force push, or broad generated rewrites

Ask the user only for decisions that cannot be discovered from the repo and materially change product scope, architecture, data safety, or release behavior.

## Verification Standard

Use fresh evidence. Do not claim success from stale output or assumptions.

- Planning modes verify by naming the files inspected, unresolved decisions, and test scope.
- Build and QA modes run the narrowest command or manual flow that exercises the changed path, then broaden only when blast radius warrants it.
- Review modes verify every finding against concrete file lines, diffs, commands, screenshots, or observed behavior.
- Ship and document-release modes verify branch state, changed files, release docs, and checks before saying ready.
- If no automated check exists, document the manual verification actually performed and the residual risk.

## Final Report

Finish every mode with:

- selected mode and why it matched the request
- files or artifacts changed, if any
- verification performed, including commands or manual evidence
- remaining blockers, risks, or intentionally deferred work
