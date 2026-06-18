# Domain Docs During Office Hours

Use this reference when office-hours reveals project-specific language, bounded contexts, or decisions that future planning work should not have to rediscover.

## Read Existing Domain Docs

Look for:

- `CONTEXT-MAP.md` at the repo root.
- Root `CONTEXT.md`.
- Context-local `CONTEXT.md` files under feature or domain directories.
- Existing ADRs under `docs/adr/` or context-local `docs/adr/`.

If `CONTEXT-MAP.md` exists, use it to identify which context the current idea touches. If multiple contexts could apply, ask the user which boundary owns the concept.

## Challenge Language

During the conversation:

- If the user uses a term that conflicts with `CONTEXT.md`, call it out immediately.
- If the user uses vague or overloaded language, propose a precise canonical term.
- If the user describes behavior that contradicts the code, surface the contradiction with file evidence.
- Stress-test domain relationships with concrete scenarios, especially edge cases that separate similar concepts.

Examples:

```text
Your glossary defines "Customer" as the organization that places orders, but you are using it to mean the logged-in person. Should this be "User" instead?
```

```text
The code cancels whole orders, but your idea assumes partial cancellation. Which behavior is the source of truth?
```

## Lazy CONTEXT.md Updates

Create or update `CONTEXT.md` only when a term has been resolved. Do not create files just because the session started.

If no context file exists, create a root `CONTEXT.md` when the first project-specific term is resolved.

If multiple contexts exist, update the context-local `CONTEXT.md` that owns the term. If ownership is unclear, ask before writing.

Keep `CONTEXT.md` a glossary only:

- No implementation details.
- No acceptance criteria.
- No architecture plan.
- No scratch notes.
- Only project-specific domain concepts, not general programming terms.

Format:

```markdown
# Context Name

One or two sentences describing what this context is.

## Language

**Canonical Term**:
One or two sentences defining what it is.
_Avoid_: Ambiguous synonym, old term
```

## ADRs

Offer an ADR only when all three are true:

1. Hard to reverse.
2. Surprising without context.
3. The result of a real trade-off.

Skip ADRs for obvious choices, easy-to-change decisions, and details that belong in the office-hours memo.

ADRs live in `docs/adr/` unless a context-local ADR directory already exists. Create the directory lazily when the first ADR is needed. Number files sequentially as `0001-short-slug.md`, `0002-short-slug.md`, and so on.

Minimal ADR format:

```markdown
# Short title of the decision

One to three sentences: context, decision, and why.
```

Optional sections such as status, considered options, or consequences are useful only when they preserve meaningful context.
