---
name: priv-skill-technical-doc
description: Create or update technical documents such as design docs, API docs, database design, deployment guides, test plans, troubleshooting guides, implementation notes, ADRs, and handoff docs. Use when the main deliverable is a clear engineering document for developers, QA, operators, stakeholders, or future agents.
---

# Skill Technical Doc

Use this skill when the output is a durable technical document, not code.

## Document Types

Choose the shape that matches the audience:

- technical design: background, goal, scope, options, chosen approach, data flow, risks, verification
- API documentation: endpoint, auth, request, response, errors, examples, compatibility
- database design: schema, constraints, indexes, migration, rollback, data notes
- domain glossary: canonical terms, field meanings, statuses, workflows, customer wording, and ambiguity notes
- test plan: scope, layers, happy paths, edge cases, regression, manual checks
- deployment guide: environment, config, build, release, rollback, smoke tests
- troubleshooting guide: symptoms, diagnosis steps, logs, known fixes
- handoff: current state, decisions, next actions, suggested skills

## Workflow

1. Identify audience and purpose before writing.
2. Read existing docs and code evidence; do not invent behavior.
3. Preserve structure when updating existing docs.
4. Include constraints and reasons, not only conclusions.
5. Use canonical project vocabulary. If a field/status/customer term is ambiguous, record the ambiguity and the chosen meaning.
6. For customer/manager-facing docs, reduce code detail and emphasize impact, risk, and decisions.
7. For developer-facing docs, include contracts, fields, flows, failure modes, commands, and verification.

## Stop Rules

Ask before deleting sections, rewriting public history, changing security/contract language, or publishing externally.

## Finish

Report document path, source evidence, audience, and unresolved assumptions.
