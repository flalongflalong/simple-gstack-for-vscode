# Tasks: Codex Engineering OS Skills

## Summary

- Total: 14
- DONE: 14
- TODO: 0

## Tasks

### TASK-001: Add shared engineering OS contract

**Status**: [x] DONE
**Files**: `codex/simple-gstack-codex/0.2.0/references/engineering-os-contract.md`

Define mode map, source-of-truth order, artifact rules, stop rules, verification standard, and final report requirements.

### TASK-002: Wire existing gstack skills to the contract

**Status**: [x] DONE
**Files**: `codex/simple-gstack-codex/0.2.0/skills/gstack-*/SKILL.md`

Add one `Operating Contract` section to each of the 15 existing gstack skills.

### TASK-003: Package 0.2.0 as a repo-linked plugin

**Status**: [x] DONE
**Files**: `codex/simple-gstack-codex/0.2.0/.codex-plugin/plugin.json`, `codex/simple-gstack-codex/0.2.0/README.md`

Add plugin metadata and keep the local Codex installation linked to the repository source.

### TASK-004: Add `skill-fullstack-dev`

**Status**: [x] DONE
**Files**: `codex/simple-gstack-codex/0.2.0/skills/skill-fullstack-dev/SKILL.md`

Create a lightweight full-stack implementation skill for bounded React/Vue, Python/Java, API, Docker/config, and docs changes.

### TASK-005: Add `skill-bug-fix`

**Status**: [x] DONE
**Files**: `codex/simple-gstack-codex/0.2.0/skills/skill-bug-fix/SKILL.md`

Create a single-defect diagnosis and repair skill with reproduce, minimize, hypothesis, fix, regression, and verification steps.

### TASK-006: Add `skill-db-api`

**Status**: [x] DONE
**Files**: `codex/simple-gstack-codex/0.2.0/skills/skill-db-api/SKILL.md`

Create a database/API contract skill for MySQL/Postgres, migrations, queries, validation, DTOs, and endpoint tests.

### TASK-007: Add quality, planning, and docs standalone skills

**Status**: [x] DONE
**Files**: `skill-test-quality/SKILL.md`, `skill-eng-planning/SKILL.md`, `skill-docs-change/SKILL.md`

Create focused skills for test quality, lightweight planning, and documentation/requirement-change work.

### TASK-008: Validate skill metadata

**Status**: [x] DONE
**Files**: `codex/simple-gstack-codex/0.2.0/skills/*/SKILL.md`

Validate all skill frontmatter blocks with Ruby YAML parsing. Official `quick_validate.py` remains blocked by missing Python `yaml` module.

### TASK-009: Add contract and database specialist skills

**Status**: [x] DONE
**Files**: `skill-api-contract/SKILL.md`, `skill-database-change/SKILL.md`, `skill-db-api/SKILL.md`

Split API contract alignment and database safety into focused standalone skills, while keeping `skill-db-api` as the wide entrance for cross-layer API/persistence work.

### TASK-010: Add review, requirement, docs, and release/devops skills

**Status**: [x] DONE
**Files**: `skill-code-review/SKILL.md`, `skill-requirement-change/SKILL.md`, `skill-technical-doc/SKILL.md`, `skill-release-devops/SKILL.md`

Cover lightweight diff review, requirement delta analysis, formal technical documents, Docker/local CI/release readiness, and release notes.

### TASK-011: Add exploration helper skills

**Status**: [x] DONE
**Files**: `skill-codebase-map/SKILL.md`, `skill-prototype-spike/SKILL.md`

Add read-only codebase mapping and throwaway prototype spikes based on the useful `zoom-out` and `prototype` patterns from `.tmp/skills`.

### TASK-012: Strengthen architecture and domain-language guidance

**Status**: [x] DONE
**Files**: `gstack-plan/SKILL.md`, `gstack-plan/references/output-template.md`, `gstack-qa/references/root-cause-and-fix.md`, `skill-eng-planning/SKILL.md`, `skill-codebase-map/SKILL.md`, `skill-bug-fix/SKILL.md`, `skill-test-quality/SKILL.md`, `skill-fullstack-dev/SKILL.md`, `skill-code-review/SKILL.md`, `skill-docs-change/SKILL.md`, `skill-technical-doc/SKILL.md`

Apply lessons from `gstack-implement`, `gstack-qa`, `gstack-plan`, and `.tmp/skills/skills/engineering/improve-codebase-architecture`: module boundaries, public interfaces, test seams, deep/shallow module signals, prevention notes after bugs, and canonical business terms/field/status semantics.

### TASK-013: Add UI style direction skill

**Status**: [x] DONE
**Files**: `skill-design-ui/SKILL.md`, `skill-design-ui/references/style-reference-routing.md`, `gstack-design-consultation/SKILL.md`, `gstack-design-shotgun/SKILL.md`, `gstack-plan-design-review/SKILL.md`, `gstack-design-review/SKILL.md`, `README.md`

Add a lightweight page-style and DESIGN.md reference skill inspired by `.tmp/awesome-design-md`, then route existing gstack design workflows to it when they need reference-backed visual grammar.

### TASK-014: Add upstream skill update maintenance skill

**Status**: [x] DONE
**Files**: `skill-update/SKILL.md`, `skill-update/references/source-routing.md`, `skill-update/references/update-report-template.md`, `README.md`

Add a maintenance skill that compares updated external skill collections such as `.tmp/gstack`, `.tmp/superpowers`, `.tmp/skills`, and `.tmp/awesome-design-md`, classifies reusable ideas, and safely strengthens the 0.2.0 skill set without wholesale copying.
