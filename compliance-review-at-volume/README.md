# Reviewing a Compliance Backlog at Volume

I was asked to clear a regulated review queue of user-submitted content.
Every item needed a judgment call before it could reach buyers, and the
judgment was not one a keyword filter could make.

This is how I did it — and, more usefully, how I made the judgment consistent
enough to hand to a machine without handing over the decision.

---

## The problem, stated properly

User-submitted product descriptions on a marketplace have to clear regulatory
review before they publish. A description promising returns, advertising an
advisory service, or carrying a pricing table is an exposure the moment it goes
live.

I designed a review process that combined explicit rules, machine assistance
and human escalation, so the judgment stayed human while the throughput
stopped depending on how many hours were available.

**The part that makes it interesting is why it could not simply be automated.**
Consider two sentences:

> "Maximum intended drawdown: 2–3% of deployed capital."

> "Maximum intended stoploss: 2–3% of deployed capital."

These are the same regulatory claim wearing different nouns. One creator had
both variants in circulation. A keyword list catches neither reliably, and a
list long enough to catch both starts rejecting legitimate descriptions.

So the work was not to replace the judgment. It was to make the judgment
**consistent, fast, and auditable** — and to be explicit about where it still
had to stop and ask a human.

---

## The decision that settled everything else

**Rejections are cheap. Incorrect approvals carry the greater consequence.**

A rejected description can be resubmitted. An incorrectly approved one can
publish a regulatory violation to buyers and cannot be recalled.

That asymmetry became the decision rule. Wherever a judgment was genuinely
ambiguous, the resolution favoured **the reading that cannot publish
a violation.** Most of the individual rules fell out of that one principle
without needing to be argued separately.

**Before building the process, work out which of your two possible outcomes
carries the greater consequence.** Almost every downstream design choice
follows from the answer.

---

## Ambiguity is escalated, never resolved by the reviewer

The standing instruction was blunt: *do not approve anything ambiguous — ask,
rather than taking a call.*

So every batch runs a **doubt pass** over the items that would publish. Anything
flagged is held for a human.

On one batch this held **more than half** the publishing items. That looks like
the automation failing. It was the opposite — and the reason is the number that
matters:

> **Every single item that got escalated changed either a verdict or the
> ruleset.**

None of them were noise. The escalations exposed where the rules needed to be
refined and led to changes in the ruleset. The learning was that a pipeline that
never escalates ambiguous items can lose the evidence needed to improve how
those cases are handled.

---

## Consistency you can check, rather than consistency you hope for

Two deliberate choices:

**Reviewers are split by rule family.** No single reviewer holds the whole
ruleset at once — that is where drift and fatigue enter.

**Identical inputs are hashed and compared after review.** If the same text
appears twice and comes back with two different verdicts, that surfaces as a
detectable inconsistency.

This is a guarantee manual review genuinely cannot offer. Different people on
different days will not reliably reach the same answer on the same text, and
nobody finds out. Here, an inconsistency becomes an observable condition that
can be investigated.

---

## Rules derived from real cases, not from the regulation

The ruleset went through four rounds of adversarial review, plus two full passes
over live cases. **Several rules exist because of one specific thing somebody
actually submitted.**

Some shapes worth stealing:

**Close the loophole, not the instance.** When adversarial review finds a way
to satisfy a rule's letter while defeating its purpose, write the rule against
the pattern, not the one example that exposed it.

**If a rule cannot read it, it does not pass.** Content that no rule can inspect
cannot be shown to be compliant, so it cannot be approved by default.

**The fine distinctions are where the work is.** Two items can look almost
identical and need opposite actions. For each of those pairs, write down which
action applies, and what the default is when you genuinely cannot tell.

**Readable is not the same as informative.** Text can be perfectly readable and
still tell the reader nothing. A rule aimed at unintelligible text will not
catch it, so it needs its own test.

---

## Check the result, not the operation

> If removing the offending line would leave the description empty, reject
> instead.

A deletion that technically succeeds but leaves nothing behind has not produced
an approvable description. It has produced an empty one that happened to pass
through an approve path.

**The learning was that an operation can report success without producing the
result the workflow actually requires.** This principle recurred throughout the
work.

---

## Edits remove; they never rewrite

I constrained automated edits to a deliberately narrow set of permitted changes.

**Why this constraint matters:** any rewriting puts the platform's words in the
author's mouth. Removing a violation leaves the description theirs. Rephrasing
it makes the platform the author of a claim it then publishes.

**This was enforced in code, not by instruction.** I directed and reviewed AI-generated code that constrained the model's output and applied only the permitted changes. The system was designed so that an instruction could not silently expand into an unauthorised edit.

---

## Two kinds of nothing, treated oppositely

Roughly half the queue contained submissions with no substantive content. I separated those cases from submissions that contained content but could not support a useful published result.

Different operating conditions can require different actions even when their
visible output looks similar.

Both look the same to a buyer and are handled differently. An empty submission
is a non-event; someone who tried and produced nothing usable needs telling, or
they will do it again.

Where an action required follow-up, the process recorded the outcome and the reason for it so that the next step was clear.

---

## Verify by value, because a successful-looking action is not proof

The risk I designed hardest against: **an automated action that appears to
succeed while operating on something other than what you intended.** Anything
working from a list of identifiers has this exposure — the list ages, the
underlying state moves, and the interface still returns success.

The countermeasure is not cleverness, it is checking. **Re-verify the target
against the record you actually asked for, immediately before every write.**
Afterwards, confirm the item genuinely left the queue rather than trusting that
the action reported success.

Every action in the audit log carries that confirmation — which is why I can
say 3,268 were verified rather than 3,268 were attempted.

---

## Counting a list that changes while you read it

I learned that a paginated read can look complete while silently omitting items,
if the underlying list is being changed at the same time it is being read.

Measured on one sweep of a 2,400-row list: it returned a full-looking 2,400
rows — but only about **2,030 distinct items.** Roughly 400 served twice, and
roughly 400 were never seen at all.

The result looked complete while covering only about 84% of the distinct items.
Sorting did not help. My fix unions repeated sweeps until coverage stops
growing, and **refuses to write a partial file** rather than producing a
plausible one.

---

## What it produced

- An accumulated review queue cleared across **two working days**, at a
  **median of 3.6 seconds** per item.
- Every action verified against the source system, and **73 items deliberately
  skipped or aborted rather than acted on uncertainly.**
- Two guarantees the manual process never had: identical submissions provably
  receive identical verdicts, and every item is answerable from a single
  append-only log entry — **including the deliberate skips and their reasons.**
- Converted into a standing weekly run, replacing periodic catch-up work with a repeatable operating cadence.

---

## The limits I designed in, and stated

A process description with no limits in it is usually one nobody has examined.
These are mine.

**Confirming the action.** I can prove an action happened and that the item
left the queue.

**The scope is deliberately narrow.** I built this to review one field well
rather than several fields approximately. Extending the same discipline to
adjacent fields is a scoping decision for whoever owns the process, not a
change I would make unilaterally to something already running.

**Some questions a ruleset cannot answer.** Whether a given item belongs in a
buyer-facing queue at all is a product decision. I kept it out of the ruleset
rather than encoding a judgment that was not mine to make.

---

## The general lesson

Automating judgment work is not about encoding the judgment. It is about:

1. Working out which of your two possible outcomes carries the greater
   consequence, and letting that decide the ambiguous cases.
2. Escalating rather than guessing — and treating each escalation as evidence
   that can refine the rules.
3. Making consistency **checkable**, not assumed.
4. Verifying by value against the source system, because the most consequential
   conditions may not raise an error.
5. Being explicit about what your process cannot see.
