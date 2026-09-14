# Learning Pattern Ledger

Named learning patterns from real evidence-based analysis work, generalized. One section per
pattern: what it looks like, why it happens, and a check you can actually run.

This is the generic version. In a live project the ledger carries dated instances underneath
each pattern — the real cases that produced it. More instances under a pattern means more
authority, which is how the next reviewer knows where to look hardest.

## The two rules

**1. Check every pattern before delivering a work product.** Not "keep them in mind". Walk them
one at a time, in writing, and answer two questions for each:

> Is this deliverable an instance of this pattern?
> Is the revision I am about to make about to commit it?

The second question catches the most. Correcting one item in a list is precisely when a second,
related item in the same list slips through unchecked.

**2. Add to the ledger whenever a new learning pattern appears.** A new instance that fits an
existing pattern becomes an instance under it. One that fits none becomes a new pattern, written
as the learning it produced, with a concrete runnable check. If an existing check did not prevent
the pattern from recurring, sharpen it — a check that does not stop recurrence is not a check, it
is a wish.

The file is append-only. An entry later found to be inaccurate gets a correcting entry underneath
it, never a rewrite.

---

## P1 — A field used as evidence before establishing what it means

**What it looks like.** A field name matches what you are looking for. Its values look plausible.
You quote it, and several findings get built on top of it. It turns out to be *derived* from
something else rather than *configured* — a summary statistic wearing the name of a setting — so
every finding on top of it is wrong in the same direction at once.

**Why it happens.** The name is a strong signal and reading it costs nothing, while establishing
what it means costs a few minutes. Under time pressure the name wins. It is worse when the
plausible reading and the true reading agree on most records, so spot-checking one or two appears
to confirm the interpretation.

**The check.**
- Sort every record by the field and look at what it actually tracks. A field that is really a
  derived statistic will correlate with the thing it is derived from, across the whole set.
- Look at its sibling values. A configured setting takes one of a small closed list. A field
  whose values include a phrase with a number in it is computed, not chosen.
- If a field *could* be derived, prove which before citing it. Never infer meaning from a name.
- The same reasoning error applies to anything that looks like a stable identifier but is really
  a position in a list — style indices, internal ids, row numbers. Any save can reorder them.

---

## P2 — Evidence attributed to a record it may not belong to

**What it looks like.** A figure is quoted for item A, taken from an artifact that the tracker
links from both item A and item B. The two rows carry contradictory verdicts drawn from that same
artifact, which proves at least one is mis-linked — so the numbers belong to neither until you
work out which.

**Why it happens.** The duplicate is usually spotted first as a *counting* problem ("our totals
are inflated"), filed as that, and never connected to the second consequence: it also invalidates
the evidence. Two different effects, one cause, and correcting the arithmetic can appear to
resolve the whole pattern.

**The check.**
- Before citing any figure, confirm the source artifact is linked from exactly one record across
  the whole tracker. Search the link, do not assume.
- Where two records share an artifact and disagree about what it shows, neither may be cited
  until the link is resolved.
- When you find a duplicate, immediately ask the second question: what else did this break?

---

## P3 — A claim made against a stale extract rather than the live current state

**What it looks like.** The claim was true when the extract was taken. Between the extract and
the delivery, someone edited the shared record, the thing being described changed, or a fix
shipped. The claim now reads as current reporting and is false.

**Why it happens.** An extract is convenient and a live fetch is slow. Worse, a conclusion
reached earlier in the same working session starts to feel like a source, and gets cited as one.

**The check.**
- Re-fetch the source at the moment of the claim, not at the start of the session. Shared
  trackers are edited continuously by other people.
- A conclusion you reached earlier today is not a source. Only the record is.
- For bulk operations derived from an extract, **assert the expected magnitude**. "This should
  touch about 2,200 cells" fails loudly at 72; without the assertion, 72 looks like success.
- When you compare before and after, compare the dimension you actually changed. A value diff
  reporting "no values altered" is true and irrelevant if what you broke was formatting.

---

## P4 — Freshness beats authority

**What it looks like.** A current statement from the owner of a system is contradicted using
older material: a message from weeks ago, an old help article, a previous version of your own
notes. The older source is treated as a refutation because it is written down and specific.

A sharper version: an unimplemented feature request cited as evidence of how something behaves.
A request that went nowhere describes nothing about what shipped.

**Why it happens.** Usually as an over-correction. Having just learned that a claim was repeated
uncritically, the instinct can be to swing to asserting the opposite claim harder. Both produce
the same learning: do not assert a mechanism from documents rather than from an observation.

**The check.**
- The owner's latest word is the current position. Old messages, old documentation and your own
  earlier notes all go stale at the same rate.
- A dated source that disagrees with a current one is a **question**, never a refutation. Raise
  it as a question.
- Before citing a feature request or a proposal as evidence of behaviour, check whether it
  shipped.
- Before naming two features in one sentence as though they were one, confirm they are one.
- If a disagreement is about internal mechanism and you were not engaged to arbitrate mechanism,
  do not arbitrate it. Either it changes what a test should expect, in which case write the test,
  or it is out of scope.

---

## P5 — Asking the party you are measuring to define what counts as a discrepancy

**What it looks like.** A question goes to the party under review: *"is there a list of known
differences between X and Y?"* — framed as a prerequisite for measuring the difference between X
and Y. It reads as diligence. It is the opposite. The measurement **is** the deliverable, and
requesting the list in advance asks them to pre-declare the result, and lets them define what
size of gap counts as acceptable before anyone has measured one.

**Why it happens.** A partial list usually already exists somewhere public, so asking for a
fuller one feels like thoroughness rather than like outsourcing the finding.

**The check.** Before any question goes outward, ask: **is the answer something we were engaged
to measure?**
- If yes, do not ask it. State the method, the tolerance band, and when the result lands.
- Ask the other party only for what genuinely *bounds* the test and cannot be observed from
  outside: data availability, structural limits, access.
- A question that would let the other party frame what counts as a pass is never a neutral
  question. Sharpening its wording does not fix it.

---

## P6 — A retest raised before a fix exists

**What it looks like.** The other side replies about an issue — reproducing it, explaining it,
filing it — and a verification task is raised on the strength of the reply. But the reply said
plainly that the fix has not shipped. The retest will spend real effort reproducing something
already reproduced, and prove nothing.

The compounding version: the retest is assigned back to **the person who reported the issue**,
who now has to prove their own finding a second time after waiting days for an answer.

**Why it happens.** "They have responded on X" gets translated straight into "raise a retest for
X", skipping the one question that separates the two: **has anything actually changed to test?**
Recording an issue and implementing a change are different events, and a careful reply
distinguishes them clearly.

**The check.** Before a retest item exists, name the fix it verifies **and** the evidence that
fix is deployed.
- No fix → it is an **open item awaiting a release**, held, owner unassigned. Not work handed to
  anyone.
- Merged is not deployed, and deployed is not fixed. Ask for the deploy timestamp.
- **Never assign an unfixed item back to the person who reported it.**
- Check the inverse too: an item marked blocked on the other party may need nothing from them.
  Ask what it is *actually* waiting for, not what it is nominally waiting for.

---

## P7 — An outward claim with no state stamp

**What it looks like.** "Field X is absent from the form" goes out to a senior reader. The field
exists; it is conditional, and was not visible in the one screenshot being worked from. Or it
shipped that morning. The claim was defensible when written and is embarrassing when read.

**Why it happens.** Absence is inferred from a single observation of something that changes, and
the observation is not dated, so the reader has no way to tell that it was a snapshot.

**The check.**
- Every outward claim about how something behaves carries a state stamp: *"State as at
  &lt;date, time&gt;."* A later mismatch can then be interpreted in the context of its timestamp,
  rather than as a contradiction in the claim itself.
- Never infer absence from one observation of a conditional interface. Reach the state where it
  would appear, and look there.
- Where the thing under description is changing during the work, say so once, in the document,
  rather than hoping it holds.

---

## P8 — A verification pass that checks arithmetic but not interpretation

**What it looks like.** Several independent fact-check passes run over a document. All of them
pass. The document still contains a finding built on a misread field, because every checker was
asked to confirm that numbers, ids and quotes matched the source — and the source was the same
extract that contained the misreading.

**Why it happens.** "Fact-check this" is naturally heard as "recompute the values". Recomputation
is objective, fast, and feels like the job. Interpretation is slower and adversarial, so it does
not get scoped unless it is scoped explicitly.

**The check.**
- At least one reviewer is tasked explicitly with challenging **what each field means** and
  **whether the evidence belongs to the thing it is cited against** — not with recomputing.
- Run the interpretation pass against the primary source, not against the extract the claim was
  written from.
- Where several reviewers run in parallel, give at least one of them P1 by name, or they will
  verify arithmetic against a misread field and pass it.

---

## P9 — A claim that does not survive its own logic

**What it looks like.** A summary sentence that sounds reasonable and cannot be true. Two
properties combined that are mutually exclusive. A percentage asserted over a population that the
supporting evidence does not cover. A count of completed items that includes several described by
their own owner as not yet shipped.

**Why it happens.** Each is a plausible-sounding summary that was not read back adversarially with
domain knowledge in hand. Fluency is not a signal of correctness, and a well-formed sentence is
easy to generate.

**The check.** Read every claim as a sceptical domain expert would. Ask what would have to be
true for it to hold, and whether that is actually true. For any aggregate — a percentage, a
count, a "most of" — name the denominator out loud and check the evidence actually covers it.

---

## P10 — Language drift in outward communication

**What it looks like.** A predicted effect is reported as an observed demand. One person's view
is reported as a population's. A single tester's opinion becomes "users are asking for". The
underlying observation is real; the sentence overstates its scope, and the reader acts on the
sentence.

**Why it happens.** The stronger framing is shorter, reads better, and is often what the reporter
believes. Without an explicit check, nothing in the drafting process forces the distinction.

**The check.**
- Predicted impact is stated as prediction, in future tense. Observed behaviour is stated as
  observation, with its state stamp.
- The subject of the sentence is the user, not the reporter. "This will cost users X" rather than
  "I found X" — the finding is not the news, the effect is.
- Any plural claim names its denominator. "Two of nine testers" is a finding; "testers are
  saying" is not.
- Never let an individual's view become a population's between the analysis and the summary.
  Check the summary against the analysis on exactly this axis before sending.

---

## P11 — Writing for the wrong reader

**What it looks like.** A cell that a non-specialist is meant to act on has become an internal
notebook: task codes, internal rule names, build numbers, cross-reference shorthand, corrections
appended below the superseded text so the wrong instruction is the first thing read. The tell is
statistical — the instructions written by the people who own the tracker are many times longer
than the ones written by the people who use it.

**Why it happens.** Each edit was written in the middle of an argument the author was having with
themselves, and **appended** rather than rewritten. The audience silently became "someone who has
read this whole thread", which nobody outside the room has. Appending also puts the newest and
most important instruction last.

**The check.**
- Instruction fields belong to the person performing the task. No build numbers, no internal
  codes, no cross-task shorthand. Explain a term in a clause — *"the setting your provider
  resets each evening"* — or leave it out.
- **Rewrite the cell; never append a correction to the end of it.** If the top of the cell is
  wrong, the reader acts on the wrong thing.
- Every number in a reader-facing field must be reproducible from what that reader can see.
- Read it back as someone who has seen none of this. Does it say what to do, and what counts as
  done?
- Tracking fields are yours and may stay technical. Instruction fields are not.

---

## P12 — A task written for someone who cannot perform it

**What it looks like.** A task is assignable, plausible, and impossible. It points at a file path
that exists on one person's machine. Or performing it requires access the assignee does not have.
It sits in the queue looking like work.

**Why it happens.** The task is written from the ask, not from the assignee's position. Nobody
checks that the person receiving it can obtain the input.

**The check.** Before writing any task row, answer two questions concretely: *where does the
assignee get the input*, and *can they actually open it*. A path that exists on one machine is
never a task input; a shared link is. Where access is the blocker, the row is a request to
whoever holds the access, not a task — and it must say so on its face.

---

## P13 — A repair that changed more than was broken

**What it looks like.** A small requested change also removes something that was not in scope. A
live metric disappears from a summary view as a side effect of an unrelated edit, and it takes
someone noticing to find it — because in a summary view, a *deleted* item is invisible in exactly
the way a *changed* number is not.

**Why it happens.** The change needed room, and the room was taken from whatever was adjacent
rather than from what had been agreed as expendable.

**The check.** List what the change is allowed to remove **before** editing. Diff the finished
artifact against that list. Anything removed that is not on it is scope creep, however small.

---

## P14 — A correction recorded but not yet applied to the artifact that gets read

**What it looks like.** The issue is identified and written down accurately in the working notes.
The notes are not what anyone loads. Weeks later the same value is still being used because the
correction has not yet reached the artifact that actually gets read.

**Why it happens.** Identifying the issue can feel like resolving it. The cognitive work is done,
and the mechanical step of propagating the correction to the file that actually gets read can be
left as an afterthought — often because that file is somewhere else, owned by a different process,
or requires a different tool to edit.

**What I learned.** Identifying and recording a correction is only one part of completing it. The
record also needs to show whether the correction has reached the artifact that readers actually
use, otherwise the notes cannot distinguish completed corrections from work still pending.

**The check.** A correction is not complete until it is in the artifact that gets loaded. Where the
notes and the artifact are separate objects, the note must name the file it still has to reach, and
that becomes an open item rather than a closed one. **Knowing about an issue is not the same as
correcting the artifact that readers use.**

---

## P15 — Adjudicating internals from documents instead of testing the output

**What it looks like.** A reviewer with less depth in the system than the people who built it starts
arguing about *mechanism* — reading design documents, inferring how something must work internally,
and forming a position on whether the internals are correct.

**Why it happens.** It feels more rigorous than measuring outputs, and documents are easier to
obtain than test runs.

**Why it costs you.** You will usually lose the mechanism argument, because the builders know the
internals better. And losing it discredits the findings that *were* soundly measured, because the
reader now has a reason to discount the whole report.

**The check.** Take the builder's explanation of mechanism as given, and measure the result. If an
internals claim changes what a test should *expect*, write that test. Otherwise it is out of scope.
The boundary is not humility — it is protecting the credibility of the measurements you can defend.

---

## P16 — A stored index reused against an artifact that changed underneath it

**What it looks like.** A position, row number, offset or handle is captured once, the underlying
file is re-saved or regenerated, and the stored index is then used against the new version. It
resolves to *something*, so nothing errors — it is simply the wrong something.

**Why it happens.** The index was correct when captured, and nothing about holding it signals that
it has an expiry.

**The check.** An index is only valid against the exact artifact it was derived from. Either
re-derive it after any regeneration, or store a fingerprint of the source alongside it and refuse to
use the index when the fingerprint no longer matches. **Prefer anchoring to content that can be
matched over positions that can silently shift.**

---

## P17 — A repair that preserves the content and loses its properties

**What it looks like.** A value is corrected and written back. The value is right. The formatting,
type, precision, or structure it carried is gone — a date becomes text, a currency loses its format,
a structured cell becomes a flat string.

**Why it happens.** The repair was scoped to the thing being corrected. Everything else about the
object was assumed to travel with it, because the mental model was "change this value" rather than
"replace this object".

**The check.** After any write-back, verify the properties as well as the content. And prefer an
edit that modifies in place over one that reconstructs and replaces, since reconstruction only
carries what you remembered to carry. This is the same family as
[P13](#p13--a-repair-that-changed-more-than-was-broken): a repair is a change with its own blast
radius, and the blast radius is not limited to what was broken.
