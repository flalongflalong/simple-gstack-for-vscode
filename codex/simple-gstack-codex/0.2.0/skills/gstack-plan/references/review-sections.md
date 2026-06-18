# Gstack Plan Review Sections

Read this file after Step 0 scope is settled. Evaluate every section. If a section has no issues, say so and continue; do not skip it because the task looks small.

## Finding Discipline

- Promote only findings grounded in repository files or clearly stated user constraints.
- Include confidence `1-10` for significant findings.
- Before reporting a code-specific finding, quote or cite the file/line or construct that supports it. If evidence is missing, lower confidence and mark it as a verification gap.
- For generated or framework-owned symbols, cite the schema, migration, decorator, config, or meta construct that creates them.
- Ask about one unresolved decision at a time. Do not dump findings into the plan without resolving the architectural choice.

## 1. Architecture Review

Evaluate:

- System design, component boundaries, dependency direction, coupling, and cyclic risks.
- Data flow, state machines, queues, persistence, cache boundaries, and bottlenecks.
- API contracts: inputs, outputs, validation, side effects, and error surfaces.
- Security architecture: auth, authorization, trust boundaries, input handling, data exposure, and secrets.
- Distribution architecture when new artifacts are added: build, publish, install, update, and rollback.
- Realistic production failure scenarios for every new integration point.
- ASCII diagrams needed in `eng-plan.md` or code comments to prevent future drift.
- "Design it twice" for core module interfaces: compare at least two materially different designs, then recommend the deeper module with the smaller public interface when appropriate.
- Test seams: prefer the highest stable public seam that proves behavior. Avoid creating lower-level seams only because they are easier to test.
- Prototype need: flag state models, lifecycle transitions, or UI choices that should be validated with a throwaway prototype before implementation.
- Domain modeling: entities, value objects, DTOs, ViewModels, conversion boundaries, aggregate roots, and lifecycle ownership.
- Reusable abstractions: hooks, shared components, services, utilities, or adapters only when there are at least two concrete consumers or a strong established local pattern.
- Module dependency rules: allowed imports, forbidden direct dependencies, and public interface boundaries.

Run a self-review before presenting:

| Check | Pass condition |
| --- | --- |
| Entity completeness | Every important data item in the flow belongs to an entity/value object/DTO/ViewModel. |
| Relationship closure | Referenced entities are defined or marked external. |
| Abstraction necessity | Reusable abstractions have 2+ consumers or a justified local pattern. |
| Interface feasibility | Proposed signatures are implementable in the repo's language/framework. |
| Acyclic dependencies | Module graph is a DAG or cycles are explicitly resolved. |
| Boundary alignment | Domain boundaries match module boundaries. |

## 2. Code Quality And Defenses

Evaluate:

- DRY risks and duplicated validation, mapping, data fetching, rendering, or error handling.
- Hidden assumptions: network never times out, APIs always return valid data, caches never stale, users submit once, data fits in memory.
- Graceful degradation when dependencies fail.
- Error handling specificity; catch-all handling must add context and avoid silent continuation.
- ASCII diagrams in touched areas; stale diagrams are worse than none.
- Over-engineering and under-engineering relative to the goal.
- Deep module quality: small public interface hiding non-trivial implementation. Shallow modules are a smell.

## 3. Test Review

Read `test-matrix.md` before doing this section. The goal is behavior coverage across code paths and user flows, not just line coverage.

Evaluate:

- Existing test framework and commands.
- Unit tests for pure logic, validators, converters, and error branches.
- Integration tests for cross-module contracts.
- E2E tests for user flows crossing 3+ components/services, auth, payments, destructive actions, or cases where mocks hide likely failures.
- Eval tests for LLM prompts, tool schemas, parsers, or structured model outputs.
- Regression tests for any behavior likely to break.
- Empty, zero, max, malformed, stale, timeout, retry, concurrency, and cancellation paths.

Mark gaps with specific test file, test name/intent, input, expected behavior, and priority.

## 4. Performance Review

Evaluate:

- N+1 queries and repeated API calls.
- Memory growth, unbounded collections, large payloads, and streaming needs.
- Cache opportunities, invalidation, TTL, and stale data UX.
- Slow paths under high concurrency or large data.
- Locking, contention, retries, and idempotency.
- Work that should move off the critical request/render path.

## Required Plan Content

Ensure the final `eng-plan.md` includes:

- `NOT in scope` with explicit deferred items and reasons.
- `Existing code reuse` mapping sub-problems to current code or patterns.
- Failure modes with test status, error handling status, user-visible result, and critical-blind-spot markers.
- Completion summary with counts for architecture issues, domain entities/value objects, abstractions, dependency status, test gaps, performance issues, and critical blind spots.
