# Feedback Loop

Build a fast, trustworthy signal before fixing. The loop is more important than staring at code.

## Loop Options

Try the smallest loop that reproduces the user's symptom:

1. Focused failing test at the highest useful seam.
2. Existing command with a fixture input.
3. Curl or HTTP script against a local server.
4. Browser automation or manual browser path with console/network checks.
5. Replay captured request, event, payload, trace, or log.
6. Throwaway harness around the smallest real code path.
7. Repeated stress loop for flaky or timing-sensitive behavior.
8. Bisection or differential loop for regressions between versions/configs.

Improve the loop:

- Faster: avoid unrelated setup.
- Sharper: assert the specific symptom, not just "no crash".
- More deterministic: pin time, randomness, filesystem, and network.

If no loop can be built, stop and report what was tried and what artifact is needed.

## Hypotheses

Before editing, list 3-5 ranked hypotheses when the root cause is not obvious.

Each hypothesis must predict an observable result:

```text
If X is the cause, then changing or probing Y will make Z happen.
```

Test one hypothesis at a time.

## Instrumentation

Use instrumentation only to distinguish hypotheses.

- Prefer debugger, REPL, or narrow probes when available.
- If adding temporary logs, tag every line with a unique prefix such as `[DEBUG-a4f2]`.
- Remove temporary instrumentation before completion.
- For performance issues, measure first: baseline timing, profiler, query plan, or repeated benchmark.

## Cleanup

Before declaring success:

- Original loop no longer reproduces the issue.
- Regression guard passes, or missing seam is documented.
- Temporary `[DEBUG-...]` logs are removed.
- Throwaway harnesses are deleted or clearly marked as debug-only.
