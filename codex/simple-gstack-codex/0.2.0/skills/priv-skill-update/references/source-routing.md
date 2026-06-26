# Source Routing

Use this file to decide which external references to inspect during a skill update pass.

## `.tmp/gstack`

Best for full workflow ideas:

- mode selection and command-style workflow boundaries
- planning, review, QA, ship, design, context save/restore, upgrade, and release flows
- stop conditions, artifact expectations, and agent operating rules

Local targets usually include `gstack-*` skills or shared references under `references/`.

Avoid copying:

- Claude-specific metadata, allowed-tools blocks, generated comments, or command names
- upgrade mechanics that mutate non-Codex install directories
- broad tool assumptions not available in this plugin

## `.tmp/superpowers`

Best for engineering discipline:

- systematic debugging
- test-driven development
- verification before completion
- plan writing and plan execution
- receiving/requesting code review
- subagent-driven work when the local runtime supports it

Local targets usually include `priv-skill-bug-fix`, `priv-skill-test-quality`, `priv-skill-code-review`, `priv-skill-eng-planning`, `gstack-qa`, `gstack-review`, and `gstack-implement`.

Avoid copying:

- harness-specific activation rituals
- persuasion or training text that does not become an actionable check
- mandatory subagent usage when the local session has no such tools

## `.tmp/skills`

Best for small specialized skills:

- architecture improvement
- diagnosis
- TDD
- prototypes
- triage
- product and issue shaping
- writing and teaching workflows

Local targets usually include standalone `priv-skill-*` entries. Promote a pattern into `gstack-*` only when it changes the full engineering OS.

Avoid copying:

- deprecated skills unless they contain a still-useful warning
- issue tracker flows for tools the repo does not use
- personal workflows that lack a general trigger

## `.tmp/awesome-design-md`

Best for UI style and DESIGN.md inspiration:

- visual grammar extraction
- design token roles
- component styling patterns
- responsive and do/don't rules

Local targets usually include `priv-skill-design-ui`, `gstack-design-consultation`, `gstack-design-shotgun`, `gstack-plan-design-review`, and `gstack-design-review`.

Avoid copying:

- exact brand identity, logos, proprietary illustrations, or whole-page skins
- long design files when a small routing rule is enough

## Candidate Evaluation

Score each candidate from 0-2:

- Trigger clarity: would a future user naturally ask for this?
- Behavioral value: does it change what Codex does, reads, writes, stops on, or verifies?
- Local fit: does it match Codex tools and the 0.2.0 engineering OS?
- Reuse frequency: will it be used more than once?
- Context efficiency: can it stay concise or live in a reference?

Use:

- `0-4`: reject or watch
- `5-7`: adapt into an existing skill
- `8-10`: adopt strongly or consider a new standalone skill
