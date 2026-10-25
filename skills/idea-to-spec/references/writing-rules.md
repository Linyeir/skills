# Writing rules

These apply to chat messages and to the design doc. Implementation starts from the doc, so slop in the doc becomes slop in the build.

## In the doc

- Every sentence is a decision, a fact, a constraint or an open question. Delete anything else.
- No generic best practice ("ensure scalability", "follow security best practices", "intuitive UI"). Write the concrete decision or nothing.
- No hedging. If it is decided, state it ("Uses SQLite"). If it is not, mark it open. Never "consider using".
- Guesses never appear as decisions. They go under assumptions to validate.
- Numbers and names over adjectives: "loads in under 1 s on 4G", not "fast".
- One term per thing, the same names as in the decision list. No synonym switching.
- No announcing ("This section describes…"). Start with the content.
- Few dashes, little bold, no emoji.

## Everywhere

- Use the real count, not forced groups of three.
- No "not only X but also Y".
- Write "is" instead of "serves as", "acts as" or "plays a key role in".
- No filler openers ("Great question", "It's worth noting", "In today's world").
- Banned words: ledger, leverage, robust, seamless, delve, tapestry, landscape, holistic, synergy, streamline, cutting-edge, empower, unlock, elevate, game-changer, comprehensive, utilize, and abstract uses of journey, ecosystem, navigate and framework.

## Self-check before sending

Read the text once as the user would. Does any sentence sound like generic AI text, or could it appear unchanged in any other project? Rewrite it with something specific to this project, or delete it.
