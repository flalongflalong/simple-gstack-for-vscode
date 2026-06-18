---
name: gstack-office-hours
description: Pressure-test a new product, feature, startup, internal initiative, hackathon idea, open-source project, or side project before planning or coding. Use when the user invokes /office-hours, says they have an idea, asks whether something is worth building, wants brainstorming before implementation, or needs a design memo for downstream gstack-ceo and gstack-plan work.
---

# Gstack Office Hours

Use this skill before engineering planning. It produces a sharper product/design memo, not code. The job is to challenge the idea, choose a mode, force useful specificity, generate alternatives, and save `.context/office-hours-output.md` for later skills.

## Operating Contract

Read `../../references/engineering-os-contract.md` before acting. This skill is the Discover mode and must follow the shared mode-selection, source-of-truth, artifact, stop, and verification rules.

## Hard Boundary

- Do not implement, scaffold, or edit product code.
- Do not turn the session into an architecture plan. That belongs to `$gstack-plan`.
- Ask one question at a time during discovery.
- Take a position. Avoid vague encouragement.
- If the user already provides a complete plan, still run premise challenge and alternatives before writing the memo.

## Context Intake

Inspect the repo before asking questions:

1. `.context/README.md`, then any active iteration files it names.
2. Existing `.context/office-hours-output.md` and older office-hours/design docs under `.context/`.
3. `TODOS.md`, `MILESTONES.md`, `README.md`, `ARCHITECTURE.md`, `DESIGN.md`, and `.github/copilot-instructions.md` when present.
4. `CONTEXT-MAP.md`, root `CONTEXT.md`, and context-local `CONTEXT.md` files when present.
5. Recent history with `git log --oneline -15`.
6. Code areas that already resemble or partially solve the user's idea.

Start by summarizing what the repo appears to be doing and any prior design docs found. Then ask the mode question.

## Mode Selection

Ask:

```text
Before we dig in, what is your goal with this?
- Startup or internal incubation: find real demand, MVP wedge, and business value.
- Hackathon or demo: make something impressive under time pressure.
- Open source, research, or learning: explore for a community or to learn.
- Fun, side project, or creative outlet: make the coolest version worth sharing.
```

Map startup/internal incubation to Startup Mode. Map the others to Builder Mode. If the user shifts toward customers, revenue, or fundraising during Builder Mode, move to Startup Mode.

## Workflow

1. Run context intake and mode selection.
2. Use `references/startup-mode.md` or `references/builder-mode.md` based on the mode.
3. After the first substantive problem statement, search prior local design docs for overlap.
4. Use `references/domain-docs.md` when project terminology, domain boundaries, or irreversible decisions start to matter.
5. Run `references/landscape-and-premises.md` when the idea is not already obvious from local context.
   - If web search would expose a stealth idea or the user asked to stay private, use local and general knowledge only.
   - If browsing is needed, search generalized category terms, not proprietary product names.
6. Run premise challenge from `references/landscape-and-premises.md`.
7. Generate 2-3 alternatives using `references/alternatives.md`.
   - Stop for user choice before finalizing the recommended approach when the session is interactive.
8. Write the design memo using `references/design-memo.md`.
9. Save the memo to `.context/office-hours-output.md`.
10. Update `MILESTONES.md` after saving the memo, creating a simple table header if the file is missing.

## Completion Standard

Finish with:

- The chosen mode.
- The sharpened problem statement.
- The selected approach and why.
- The design memo location.
- One concrete next action.
- Any assumptions or unresolved questions.
