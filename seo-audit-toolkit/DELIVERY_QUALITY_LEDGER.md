# Delivery Learning Ledger

**Purpose: get better at applying what you learn, not just at correcting the item in front of
you.**

This is a template. It ships with the mechanism and a set of starter patterns that are
generic to analytical and reporting work. The instance lists are empty on purpose — they
fill in with learning instances as they arise.

Scope: everything that leaves your hands. Reports, drafts, analysis documents, data
write-ups, and the emails that carry them. An unsupported claim in a report that reaches
leadership can affect a decision, which is why this kind of work needs explicit checks.

---

## The two rules

### Rule 1 — Check every pattern below BEFORE delivering anything

Not "keep them in mind." Check, in writing, when the deliverable is non-trivial. Go through
the patterns one at a time and answer two questions:

> Is this deliverable an instance of this pattern?
> Is the revision I am about to make about to commit it?

The second question catches the most. Correcting one item in a list is precisely when a
second, related item in the same list slips through unchecked.

### Rule 2 — Update this file whenever the work produces a new learning

| When | What to do |
|---|---|
| A condition is identified before the deliverable ships | Note it against the matching pattern, or write a new pattern if none fits |
| A condition fits an existing pattern | Add it as an instance under that pattern. More instances means more evidence, which tells the next reviewer how hard to look here |
| A condition fits no existing pattern | Write a new pattern around what was learned, with a concrete runnable check |
| A pattern's check did not prevent the pattern from recurring | Sharpen the check. A check that does not prevent recurrence is not a check, it is a wish |

**This file is append-only. Never rewrite history.** If an entry later needs correction, add
a correcting entry beneath it and say so. Editing the record destroys the property that makes
it useful, which is that it preserves an accurate account of how the learning was reached.

**One ledger per project.** Do not start a second list. A rival list that drifts from this
one is exactly the kind of untracked duplication this file exists to prevent. Other
documents may point at this one; they must never restate the pattern list, because the two
will disagree and nobody will know which is current.

---

## Open — found, not yet resolved

*(empty)*

| # | Issue | Pattern | Deliverable |
|---|---|---|---|

---

## The patterns

Each pattern ends with **THE CHECK** — an action to take, not a principle to admire. Reorder
them over time so the ones that have actually caught the most sit at the top.

### P1 — "I learned to verify whether something is done or pending before stating its current state"

A status can be asserted from memory, from a plan, or from what was intended rather than from
the system of record. The work may have been finished after the note was written, not yet
started, or completed by someone else. Both directions require the same check and are
avoidable in under a minute.

**Instances:** *(none yet)*

**THE CHECK:** before writing any claim shaped like "X was done", "X is live", "X is
complete", "X is pending", or "X is still blocked", open the actual system of record and
look. Published content goes to the CMS. A page change, tag, or redirect goes to the live
page source, fetched now. Rankings and impressions go to Search Console for the exact
window reported. Traffic and conversions go to analytics for the exact window reported.
Task status goes to the shared tracker in its current state. If it cannot be confirmed
either way, write it as unverified rather than picking a verdict.

---

### P2 — "I learned to re-check a carried-forward status line before treating it as current"

Wording carried forward from the previous month's report or email can have been accurate when
written and later stopped describing the current state. A document can then describe work as
pending after it has finished, or describe a blocker after it has cleared. It reads as fresh
reporting because nothing in the sentence signals its age.

**Instances:** *(none yet)*

**THE CHECK:** diff every carried-forward section against the previous version. For each
sentence that survived unchanged, run P1's check against it before it ships again.
Carried-forward text gets the same verification burden as new text, not less. If a line is
genuinely unchanged because the situation is unchanged, say so — "unchanged since [period],
re-verified [date]" — rather than restating it as if new.

---

### P3 — "I learned to verify a reported fix in the live environment"

The change can be specified, agreed, handed over, and recorded as done without the live
environment reflecting the intended result. The deployment may be partial, reverted, or
limited to a non-live environment. A reported status therefore needs direct verification
before it is carried into a report.

**Instances:** *(none yet)*

**THE CHECK:** for every item you are about to report as fixed, open the live production
URL and confirm the change is present in the rendered source. Record the URL and the date
you checked next to the claim. "The developer confirmed it" is not a verification.

---

### P4 — "I learned to scope claims to the evidence that supports them"

"The report never…", "no page has…", "this is missing throughout…". A claim can be mostly
true while still being too broad for the evidence behind it. One section, one page or one row
can show an exception to what the claim says never occurs. The consequence is not only the
sentence itself: a single counter-example can rebut the broader item, including the part that
was supported.

**Instances:** *(none yet)*

**THE CHECK:** for every "never", "no", "none", "all", or "every", either verify it
exhaustively across the full set, or scope it down to what you actually checked — "in the
12 reports reviewed", "across the sample of 40 pages". Scoped and true beats sweeping and
rebuttable.

---

### P5 — "I learned to keep every reported number traceable to its source"

A figure can be correct when pulled and later lose the context needed to reproduce it when
the date window shifts, the filter changes, or the number is copied into a summary. The number
can then sit in a document without the source information needed for anyone, including the
original reviewer, to re-derive it later.

**Instances:** *(none yet)*

**THE CHECK:** every number in a deliverable carries its source, its date window, and its
filters. If you cannot state where a number came from and re-derive it, remove it. A number
you cannot defend is worse than no number, because it invites a challenge you will lose.

---

### P6 — "I learned to reconcile totals against the rows they are made of"

The summary can say one thing while the table underneath says another. This can result from a
filter applied to one and not the other, a deduplication step run at a different stage, or a
row added late.

**Instances:** *(none yet)*

**THE CHECK:** add up the rows. Compare to the stated total. Do this for every table with a
total, every time, including tables you did not change this cycle. Where a total genuinely
should not match the visible rows — because rows are filtered or truncated — say so in the
table, not in your head.

---

### P7 — "I learned to compare metrics at the same granularity"

A monthly figure can be compared against a weekly one, a three-month average presented next
to a single week, or a per-page number summed as if it were a site total. The comparison can
then look like a trend while reflecting differences in granularity instead.

**Instances:** *(none yet)*

**THE CHECK:** state the period next to every metric, and confirm any two numbers being
compared share the same period, the same market or segment filter, and the same source
system before you put them side by side.

---

### P8 — "I learned to re-verify older facts before restating them as current"

Distinct from P2 in that nothing was copied. A statement can be written fresh from a fact
learned in an earlier period without revisiting the current state. Standing context files are
a common carrier because they can be read as ground truth long after one of their entries has
stopped describing the current state.

**Instances:** *(none yet)*

**THE CHECK:** date-stamp every fact in any standing context document. On each cycle,
re-verify any fact older than one cycle before relying on it, and update the date stamp
when you do.

---

## History — learnings applied

One row per review cycle that produced a learning. Point at the deliverable rather than
repeating the detail here.

| Date | Deliverable | Pattern | What was learned |
|---|---|---|---|
