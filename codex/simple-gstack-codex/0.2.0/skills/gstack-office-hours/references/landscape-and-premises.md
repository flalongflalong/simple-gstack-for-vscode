# Landscape And Premises

Use this after the initial mode questions and before alternatives.

## Related Design Discovery

Search local context first:

- `.context/**/office-hours-output.md`
- `.context/**/*design*.md`
- Any active iteration design memo referenced by `.context/README.md`

If related docs exist, summarize the title, date if present, and overlap. Ask whether to build on the prior design or start fresh when the overlap is material.

## Landscape Awareness

Use three layers:

- Layer 1: known conventional practice in the category.
- Layer 2: current discourse, current tools, or recent alternatives.
- Layer 3: first-principles fit for this user's stated context.

If browsing is useful and allowed, search generalized category terms only. Do not search proprietary product names or stealth details.

For Startup Mode, useful searches include:

- "[problem space] startup approach"
- "[problem space] common mistakes"
- "why [incumbent workaround] fails"

For Builder Mode:

- "[thing being built] existing solutions"
- "[thing being built] open source alternatives"
- "best [thing category]"

If Layer 3 overturns conventional wisdom, mark it:

```text
EUREKA: Everyone does X because they assume Y. But our context suggests Y is false because Z. This means...
```

If not, say the conventional wisdom seems sound and use it as a constraint.

## Premise Challenge

Before proposing solutions, challenge the core premises:

1. Is this the right problem, or would a different framing produce a simpler solution?
2. What happens if nobody builds this?
3. What existing code or workflow already partially solves it?
4. If this is a distributable artifact, how will users get it?
5. Startup Mode only: does the demand evidence support the direction, or is the idea still mostly hypothesis?

Present clear premise statements:

```text
Premises:
1. ...
2. ...
3. ...
```

If the user rejects a premise, revise before alternatives.
