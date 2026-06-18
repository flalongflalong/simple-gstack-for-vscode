# Review Lens

Use this as the main checklist. Only flag concrete issues that matter.

## CRITICAL Pass

Report issues that can plausibly cause production outage, data loss, security exposure, or silent corruption.

- SQL and data safety: string-built SQL, raw query interpolation, unsafe direct DB writes, missing transaction boundaries.
- Broken access control: missing auth middleware, object ownership bypass, role escalation, public/private boundary drift.
- Race conditions: read-check-write, find-or-create without unique index, non-atomic status transitions, double-submit hazards.
- LLM trust boundary: LLM output written to DB, rendered as HTML, fetched as URL, or used as tool input without validation.
- Shell and code injection: `shell=True`, `os.system`, eval/exec, template injection, path traversal, SSRF.
- State machine safety: partial failure leaves impossible status, skipped side effects, missing rollback.
- Enum and value completeness: new enum/status/type added without tracing all consumers, allowlists, switch/case, filters, serializers, UI displays, and persistence paths.
- Unsafe rendering: React `dangerouslySetInnerHTML`, Vue `v-html`, Rails/Django safe escape hatches with user-controlled content.

## INFORMATIONAL Pass

Report lower-severity issues when they create real risk or maintenance cost.

- Error handling gaps: null/undefined, timeout, invalid JSON, external service failure, empty collection.
- Conditional side effects: one branch updates state, logs, emits events, or persists records while another equivalent branch does not.
- API contract drift: removed response fields, type changes, new required params, status code changes, auth changes, inconsistent error shape.
- Migration safety: irreversible migration, data truncation, missing backfill, lock risk, missing index, unsafe deploy order.
- Performance: N+1 queries, unbounded queries, O(n^2) loops, blocking sync calls in async handlers, large frontend dependencies.
- Maintainability: dead code, unused imports, stale comments, copied 3+ line blocks, magic constants, module boundary violations.
- Public module documentation: new shared hook/component/service/util lacks useful docs when reused or placed in shared/common/utils/hooks/components.
- CI/CD distribution: release workflow paths, artifact names, secret usage, tag format, platform matrix, idempotency.
- Prompt or agent workflow drift: prompt lists tools or limits that no longer match wired implementation.

## Conditional Specialist Views

Use the relevant subset based on the diff:

- Testing: always inspect missing negative paths, edge cases, isolation, flakiness, and security enforcement tests.
- Security: auth, backend, file upload, webhook, crypto, secrets, XSS, deserialization.
- API contract: routes, controllers, schema, OpenAPI, SDK/client contracts, webhooks.
- Data migration: migrations, schema, seed data, backfills, index changes.
- Performance: backend queries, frontend rendering, bundle size, pagination, async blocking.
- Red team: for large diffs or any CRITICAL finding, ask how the happy path fails under load, partial failure, bad data, and trust-boundary abuse.

## Suppressions

Do not flag:

- Formatting or lint concerns unless they hide a real issue.
- Harmless redundancy that improves readability.
- Tighter assertion suggestions when the current test already catches the behavior.
- Edge cases impossible under validated input constraints.
- Issues already fixed in the diff.
- Pure preference when the repo has an established different convention.
