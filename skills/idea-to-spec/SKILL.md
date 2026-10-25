---
name: idea-to-spec
description: Guides the user from a rough project idea to an implementation-ready design doc via short interview, vision-checked expert council and small decision rounds. Use when asked to design or spec an idea together.
---

# Idea to spec

Takes a rough project idea to a design document someone can build from. The user brings the vision and the opinions. You bring structure, expert perspectives and options. The user decides.

Use it when the user says things like "design X with me", "let's spec this idea", "idea-to-spec", or shares an existing idea-to-spec decision list. Do not start it on every passing project mention.

## Files in this skill

Read these when the step says so. Paths are relative to this folder.

| File | Read when |
|---|---|
| `references/examples.md` | Before your first message. Match the feel of these turns. |
| `references/writing-rules.md` | Before your first message, and again before writing the doc. |
| `templates/decision-list.md` | Step 3, when you create the decision list. |
| `council/rules.md` | Before any council run. Goes into every member prompt. |
| `council/prompts.md` | Before any council run. |
| `council/<member>.md` | Before running that member. The whole file goes into its prompt. |
| `templates/design-doc.md` | Step 6. |

## Core rules

1. **Understand before you suggest.** No ideas, directions or solutions until the user has confirmed your summary of their problem (step 3).
2. **Small rounds.** One decision per question. At most 3 questions per message.
3. **Silence is not agreement.** Anything the user did not answer stays open and comes back as "still open" in the next round. Only explicit answers move an item to agreed. "rest ✓" or "all accepted" accepts your recommendations for the questions in that message.
4. **The user's vision wins.** Experts find problems. Solutions must fit the brief. Never propose anything on the don't-want list. If an expert point conflicts with the vision, ask the user. Never recommend overriding the vision.
5. **Show your guesses.** Whenever you rely on an assumption, say it and ask. Never fold a guess into a decision.
6. **Facts are your job, decisions are the user's.** Look up what you can (web, files, code). Never ask the user for a fact you could find yourself.
7. **Own misreads in one line.** When the user corrects you, name what you got wrong in one sentence, fix it and move on. The correction is information about the vision, so update the brief.
8. **Plain words.** Follow `references/writing-rules.md` in chat and doc. Don't use internal terms like "frontier" or "design tree" with the user.
9. **Keep chat light.** Full detail lives in the decision list. Chat carries the questions and a one-line status.

## Setup

- **Resuming:** if the user shares a link or file to an existing decision list, read it, show the status line and the "Next" questions, and continue from there.
- **Council:** if you can launch subagents, run each council member as a separate general-purpose subagent, in parallel. If not, play the members yourself in one pass, keep each voice separate, and tell the user once that the perspectives are less independent this way.
- **Where things live:** decision list and design doc as Docs artifacts where available, so they open on mobile. In a code repo use `docs/<project>/decisions.md` and `docs/<project>/design.md`. Otherwise markdown files.

## The flow

At the start, tell the user in two lines: the steps (brain dump, a few questions, summary, directions, decisions in small rounds, doc, check), and that messy dumps, strong opinions and "don't care" are all welcome.

### 1. Brain dump

Ask the user to write down everything in their head about the idea: what, why, opinions, likes, hates. Messy is fine. If their first message already is a dump, skip this.

Reply with no ideas. Go straight to step 2.

### 2. Gap interview

Ask only about topics the dump left unclear, one question per message.

- **Builder:** who builds from the doc (an AI coding agent, the user, a team) and what they need from it. Ask this first. It sets the doc's level of detail.
- **Goal:** what success looks like, and why it matters to the user.
- **Starting point:** what exists already: skills, material, code, earlier attempts.
- **Context:** who it is for, constraints, time, budget, platform.
- **Existing options:** what is good and bad about what is out there.
- **Don't want:** things never to propose.
- **Your call:** things the user has no opinion on. You pick sensible defaults later and say so in one line.

Keep "don't want" and "your call" apart. "I don't care" means your call. "I don't want that" means don't want. Ask when unclear.

Anchor every question in the project ("For the shared shopping list, who adds items: everyone or one owner?"), never generic ("What's your vision?"). The user may hold strong opinions but find them hard to put into words. Invite opinions openly, and if an answer is thin, switch format:

- Either/or: "Simple and focused, or flexible and powerful?"
- Negative: "What would make you hate using this?"
- Examples: "Anything similar you love or find annoying?"

### 3. Confirmed summary

Write the brief:

- The problem as one "How might we …?" line.
- Each point marked **You said** or **My guess**.
- The don't-want list and the your-call list.
- Tensions or gaps in the user's own answers, as questions: "You want it offline and shared in real time. Those pull against each other. Which matters more?" This is where you are proactive.
- At most 3 questions on unclear points.

Create the decision list from `templates/decision-list.md` with the brief at the top. Do not move on until the user confirms the brief. Confirmed guesses become "You said".

### 4. Directions

If the brief already fixes the direction, ask: "Your dump already sets the direction. Skip to decisions?" Skip only on yes.

Otherwise:

1. Pick 3 to 5 relevant council members. Each pitches one direction (directions prompt).
2. Merge the pitches into 3 distinct directions. For each: name, one-line pitch, what it optimizes, what it gives up, which goals it serves. All must respect the don't-want list. Drop near-duplicates.
3. The user reacts: like, dislike, combine. Repeat until one direction or a combination is chosen.
4. Write a short walk-through of the chosen direction (5 to 8 lines: someone using it from start to finish) so the user can check it feels right.
5. Record the direction. Record rejected directions with the reason, so they don't come back.

### 5. Decision rounds

The main phase.

**Collect issues.** Run the council (issues prompt) with the brief, the direction and the agreed decisions. Pick members from the roster below. Run the council again only when the direction shifts or a new area opens, not every round.

**Sort, don't dump.** Keep all findings in a backlog the user doesn't see:

- Merge duplicates. Drop anything that conflicts with the don't-want list.
- Items on the your-call list: decide them yourself and record them under "Your call" with a one-line reason. List them in one line at the end of the round so the user can veto.
- Order by dependency. Questions whose answers shape other questions (direction, scope, core structure) come first, then by impact.
- A question that depends on another open question waits for a later round.

**Ask a round.** At most 3 questions, the most direction-setting first, in the question format below.

**After the answers:**

- Move answered items to agreed, rejected or parked. Unanswered items stay open and lead the next round as "still open".
- If an answer reveals something new about the vision ("I don't care about scale"), update the brief, say so in one line, and filter the backlog again. Many items disappear this way.
- Update the decision list and end the message with the status line: `Agreed 7 · Open 3 · Parked 1 · about 2 rounds left`
- The user can say skip, park or stop at any time.

Rounds should get easier. By the third round most recommendations should be accepted. If they keep getting corrected, you misunderstand the vision: stop and check the brief with the user.

The phase is done when the backlog is empty or the user calls it, and the user confirms.

### 6. Design doc

1. Propose the section list from `templates/design-doc.md`: core sections plus the domain sections this project needs. The user approves it.
2. Write section by section. After each section, or two short ones, show it and ask for corrections before going on.
3. Write only from agreed decisions and confirmed brief items. Anything undecided goes under open questions, marked plainly. Never smooth over a gap.
4. Apply `references/writing-rules.md` while writing, not afterwards.

### 7. Readiness check

1. **Fresh reader:** a subagent that has not seen the conversation gets only the doc (readiness prompt). It lists every place it would have to guess and every vague or generic line.
2. **Red team:** Skeptic reviews the doc. For software, Craftsman and Operator review it too, here and not earlier.
3. Turn blocking findings into questions in the question format and run more rounds (step 5). Fix wording findings directly.
4. Add "Assumptions to validate": things the council only simulated, which real users or real tests have to confirm.
5. Done when the fresh reader has no blocking guesses and the user confirms.

Without subagents, do the fresh-reader pass yourself, reading the doc as a builder would, and tell the user it is a self-review.

## Question format

```
**Q1 · <short title>**
**Context:** <why this question exists and what it decides, 1 to 2 lines>
**Perspectives:**
- *<Member>:* <one line>
- *<Member>:* <one line>
**Options:**
- **A) <name>.** <what it means and its trade-off>
- **B) <name>.** <what it means and its trade-off>
- **C) <name> (bold).** <only if a member has a genuine bold option>
➡️ **<letter>:** <recommendation and why, tied to something the user said>
```

At most 3 perspectives, only from members with something relevant, each naming a different concern. 2 to 4 options, each with its trade-off. The user can always answer with an option of their own.

## Council

You, the main conversation, are the facilitator. You run the process, keep the decision list and check every proposal against the brief. You don't take sides in the debate.

| Member | File | Include |
|---|---|---|
| Advocate (user experience) | `council/advocate.md` | Always |
| Architect (system structure) | `council/architect.md` | Always |
| Skeptic (threats, failure, scope risk) | `council/skeptic.md` | Always |
| Strategist (scope and value) | `council/strategist.md` | Always |
| Scout (prior art) | `council/scout.md` | Existing options matter, or build vs buy comes up |
| Artisan (look and feel) | `council/artisan.md` | UI-heavy, visual or brand work |
| Guardian (privacy, compliance, safety) | `council/guardian.md` | Personal data, payments, health, children, regulated areas, physical safety |
| Oracle (AI features) | `council/oracle.md` | The project uses an LLM or machine learning |
| Craftsman (buildability) | `council/craftsman.md` | Readiness check only, software |
| Operator (running it) | `council/operator.md` | Readiness check only, software |

For games, physical builds and other non-software projects, each member file lists how its role changes. Tell the user the adjusted roster in one line.
