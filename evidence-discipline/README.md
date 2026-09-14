# Evidence Discipline

A working system for analysis that other people act on.

## The problem it solves

When analysis work is done fast, with AI assistance, the central risk is not slow work. It is
confident, incorrect work that reaches a decision-maker.

The output arrives fluent, structured and internally consistent whether or not it is correct.
Nothing in it flags which one you got. An incorrect finding in a document a senior person reads
does not announce itself — it looks like every other finding around it, and it can be acted on.
The lesson is that the cost of correcting an unsupported finding grows once it has entered a
decision.

Speed makes this more important rather than less. Producing ten findings in an afternoon means
ten opportunities to attribute a number to the wrong record, read a derived field as a
configured one, or quote a state that changed while you were writing about it.

## The fix

Two mechanisms, both boring, both written down.

**A pattern ledger, checked before anything ships.** Every real learning from outward-bound
work gets logged as a named pattern with a runnable check. Not a principle to keep in mind — an
action to take. Before a deliverable goes out, the patterns are walked one at a time, in writing.

**A verification gate.** Nothing goes outward until a separate pass — a different agent, or a
different person — has challenged not just the arithmetic but the *interpretation*. A fact-check
that only confirms numbers match their source will pass a claim built on a misread field, because
the misreading is in the source extract too.

## How it was arrived at

Not designed up front. It accumulated.

The method was to record what was learned from corrections in outward-bound work products rather
than quietly making the correction and moving on. Each entry recorded what the pattern looked
like, why it happened, and the specific check that would have caught it. Once there were enough
entries, the shapes became visible: the same handful of patterns kept recurring in different
costumes, and most of them were forms of one thing — treating derived or stale data as primary
evidence.

Writing the learning down before correcting the work is the part that does the work. A correction
made and not recorded leaves the lesson only in the session where it was learned, making the same
pattern easy to repeat with complete confidence. A recorded learning becomes a check, and a check
runs on every future deliverable whether or not you remember the incident.

The ledger is append-only. If an entry turns out to be wrong, a correcting entry goes underneath
it. Editing the record destroys the property that makes it useful, which is that it preserves an
accurate account of how the learning was reached.

## What's here

| File | What it is |
|---|---|
| [`PATTERN_LEDGER.md`](PATTERN_LEDGER.md) | The taxonomy. Each pattern: what it looks like, why it happens, and the check that catches it. |
| [`RETEST_LOOP.md`](RETEST_LOOP.md) | The tracked verification loop. When an item is retestable, who owns each verification, and what happens before anything goes outward. |
| [`WRITING_RULES.md`](WRITING_RULES.md) | The outward-communication discipline. How claims are phrased so they stay true after the thing they describe changes. |

## The through-line

**Verify against the system of record, never against the tool's own success message.**

That single rule turned up independently in three separate systems, through repeated work that
produced the same learning in each:

- In the [SEO audit toolkit](../seo-audit-toolkit/), it is the setup gate. A data connection
  reports success and returns zero rows, so `/setup` is not finished until a live query returns
  real data — see [`docs/SETUP.md`](../seo-audit-toolkit/docs/SETUP.md).
- In the same toolkit, it is the
  [delivery quality ledger](../seo-audit-toolkit/DELIVERY_QUALITY_LEDGER.md): never report an
  item as fixed without opening the live page, and never carry a status line forward without
  re-checking it.
- Here, it is the whole ledger. Almost every pattern below is a version of it.

A tool telling you it succeeded is a statement about the tool. It is not evidence about the
world.
