# QA Health Score

Use this score for broader QA passes, release readiness, or multiple findings. For a single bug fix, a short verified/unverified status is enough.

## Categories

Score each category from 0 to 10, then compute the average.

- Core flow correctness.
- Error handling and recovery.
- Data integrity and persistence.
- Security and permission boundaries.
- UI behavior and responsiveness.
- Accessibility basics.
- Performance and loading behavior.
- Test coverage and regression protection.

## Thresholds

- 9.0 to 10.0: Ship-ready in tested scope.
- 7.0 to 8.9: Mostly ready, with documented follow-up risk.
- 5.0 to 6.9: Needs fixes before release.
- Below 5.0: Not ready for release.

## Report Format

```markdown
## QA Health Score

Score: X.X / 10

Summary:
- Strongest area:
- Weakest area:
- Release recommendation:

Category scores:
- Core flow correctness: X/10
- Error handling and recovery: X/10
- Data integrity and persistence: X/10
- Security and permission boundaries: X/10
- UI behavior and responsiveness: X/10
- Accessibility basics: X/10
- Performance and loading behavior: X/10
- Test coverage and regression protection: X/10
```
