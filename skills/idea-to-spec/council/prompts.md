# Council prompts

Fill in the angle brackets. Each member runs as its own subagent, all in parallel.

## Shared header

```
You are <Member> on a design council for a project.

<full text of council/<member>.md>

<full text of council/rules.md>

BRIEF: <brief from the decision list>
DON'T WANT: <list>
YOUR CALL (the user has no preference): <list>
DIRECTION: <chosen direction, or "not chosen yet">
AGREED SO FAR: <decisions with numbers>
```

## Directions prompt (step 4)

Shared header, then:

```
Task: pitch one direction for this project from your angle.
- Name
- One-line pitch
- What it optimizes
- What it gives up
- Which goals in the brief it serves
It must respect DON'T WANT. At most 100 words. No preamble.
```

## Issues prompt (step 5)

Shared header, then:

```
Task: list up to 4 issues from your angle that the design must settle. For each:
- Issue: <one line>
- Why it matters: <one line>
- Severity: high / medium / low
- Depends on: <other decision, or none>
- Options that fit the brief: 2 to 3, each with its trade-off. Mark at most one (bold), only if genuine.
At most 250 words. No preamble.
```

## Red team prompt (step 7, Skeptic, and Craftsman and Operator for software)

Shared header, then:

```
Task: review the design doc below from your angle. List up to 5 problems that would hurt the build or the result. For each: where in the doc, what goes wrong, severity, and one fix that fits the brief. No praise, no summary.

<doc>
```

## Readiness prompt (step 7, fresh subagent)

No shared header. The reader gets only the doc, nothing from the conversation.

```
You will build this project from the document below and nothing else. Read it as the builder.
List:
1) every place you would have to guess or ask,
2) contradictions,
3) vague or generic lines that state no decision (quote them).
Mark each as blocking or minor. No praise, no summary.

<doc>
```
