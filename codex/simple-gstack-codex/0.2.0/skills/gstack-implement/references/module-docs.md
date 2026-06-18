# Module Documentation

Use when creating a public hook, shared component, utility, service, adapter, or EXTRACT task output.

## Where To Document

- Prefer source-level doc comments for single-file modules.
- Use a module `README.md` when the module is a directory or has multiple public entry points.
- Follow the project's existing documentation style when present.

## Required Content

- Purpose: what the module does and why it exists.
- Inputs: parameter names, types, meaning, defaults, required/optional status.
- Outputs: return type and semantic meaning.
- Errors or failure behavior.
- Runtime assumptions: providers, environment variables, external services, permissions.
- Minimal runnable or directly adaptable example.
- Related modules when useful.

## Quality Bar

- A caller should be able to use the module without reading its implementation.
- Examples must not use ellipses or pseudocode.
- Parameter docs must explain meaning, not just repeat type.
- Documentation lands with implementation, not in a later task.

## Example Shape

```typescript
/**
 * Creates a typed retry wrapper for idempotent async operations.
 *
 * @param operation - Idempotent async function to execute.
 * @param maxAttempts - Maximum attempts before rethrowing the last error.
 * @returns The operation result when any attempt succeeds.
 * @throws The final operation error when every attempt fails.
 *
 * @example
 * const result = await retryIdempotent(() => fetchUser(userId), 3);
 */
```
