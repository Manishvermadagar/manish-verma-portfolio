# The Retest Loop

The tracked verification loop that sits under the [pattern ledger](PATTERN_LEDGER.md). It answers
one question repeatedly: *has this actually been fixed, and who established that?*

Without it, a review turns into a list of things somebody said were handled.

---

## An item is only retestable when a fix is claimed **and** deployed

Two separate conditions, and keeping them distinct is one of the central learnings in the whole
loop.

| State | What it is | Where it lives |
|---|---|---|
| **Open item awaiting release** | Reproduced, accepted, no fix shipped | Held. **Owner unassigned.** Not work handed to anyone. |
| **Retest** | A fix is claimed *and* there is evidence it is deployed | Assigned, with a named owner and a pass condition |
| **Confirmed** | A named person re-ran it and reported the outcome | Closed |

Rules that follow from this:

- **Merged is not deployed, and deployed is not fixed.** Ask for the deploy timestamp. Where a
  system serves from multiple nodes, ask whether they all pull the same build.
- Before a retest row exists, name the fix it verifies and the evidence it is live. If you cannot
  name both, it is an open item, not a retest.
- **Never route a retest to the person who reported it.** They have already spent the effort
  proving it once and waited for a reply; asking them to prove it again is the worst use of the
  only person who definitely understands it, and it reads as disbelief.
- Check the inverse as often as the forward case. An item marked blocked on the other party may
  need nothing from them at all. Ask what it is *actually* waiting for, not what it is nominally
  waiting for.
- An item is closed only at **Confirmed** — a named person re-ran it and reported the outcome. A
  claim of a fix is not a confirmation, and neither is the absence of a complaint.

---

## Every verification has a named owner

Not a team, not a queue, not "whoever picks it up". A person, on the row, before the row is
handed out.

Each row carries, at minimum:

- **What to run** — written for the person who will run it, not for the person who wrote it (see
  ledger pattern P11)
- **Pass condition** — what counts as done, stated so two people would agree on the verdict
- **Owner** — named
- **Origin** — which finding this verifies, and what it was previously reported as, so a
  superseded verdict stays visible instead of vanishing

When superseding a value, preserve the old one inline — `SUPERSEDED (was X)` — rather than
overwriting. The history of how a verdict changed is part of the evidence.

A held row says so on its face, in three places if that is what it takes: what it is waiting on,
that it must not be run yet, and who is expected to release it. Ambiguity here produces work
nobody asked for.

---

## An independent fact-check pass before anything goes outward

A different agent, or a different person, from whoever wrote it. Not the author re-reading.

The pass has to be scoped to **interpretation, not arithmetic**. Left unscoped, a fact-check is
naturally heard as "confirm the numbers match the source" — which will pass a claim built on a
misread field every time, because the misreading is in the source extract too (ledger pattern
P8).

So the reviewer is asked, explicitly:

1. **Does each field mean what the claim assumes?** Prove it, do not infer it from the name.
2. **Does each piece of evidence belong to the record it is cited against?** Is the source
   artifact unique to that record?
3. **Is this the live state?** Re-fetch. A conclusion from earlier in the same session is not a
   source.
4. **Is this observed, or is it reported?** Both are valid evidence. They are not interchangeable,
   and the second must say so.
5. **Does the claim survive its own logic?** Read it as a sceptical domain expert. Name the
   denominator behind every aggregate.

Output is a claim-by-claim PASS/FAIL with corrected wording for each item that does not pass.
**If nothing fails, say so plainly.** Do not manufacture problems to justify the pass.

For a large artifact, run several reviewers in parallel with adversarial instructions — but give
at least one of them check 1 by name, or they will all verify arithmetic against the same misread
field and all pass it.

---

## Unknowns become assigned tasks, never questions handed back

When the analysis hits something it cannot resolve, the temptation is to write the question into
the summary and send it up. That hands the reader an obligation to reconstruct the whole context
before they can answer, and it usually comes back as another question.

Instead: **write it as an assigned, actionable task.** Name what would settle it, who can settle
it, and what the answer changes. A question that cannot be turned into a task is usually a
question you were engaged to answer yourself (ledger pattern P5).

The same applies at the boundary of scope. If the unknown is about internal mechanism you were
not engaged to arbitrate, either it changes what a test should expect — in which case write the
test — or it is out of scope and says so.

---

## Where this connects

- The gate that runs these checks before delivery, in an SEO context, is
  [`/delivery-review`](../seo-audit-toolkit/.claude/skills/delivery-review/SKILL.md) against the
  [delivery quality ledger](../seo-audit-toolkit/DELIVERY_QUALITY_LEDGER.md).
- The setup-time version of the same principle is
  [`docs/SETUP.md`](../seo-audit-toolkit/docs/SETUP.md), which refuses to call a data connection
  working until a live query returns rows.

One rule underneath all three: **verify against the system of record, never against the tool's
own success message.**
