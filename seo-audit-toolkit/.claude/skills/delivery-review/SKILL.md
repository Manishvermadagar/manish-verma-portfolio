---
name: delivery-review
description: Reviews any outbound deliverable (report, content draft, topic sheet, analysis document, email) against the known quality patterns in DELIVERY_QUALITY_LEDGER.md before it is sent. Use before marking any deliverable final — anything asserting that work was done, quoting a number, attributing a finding to a source, or reporting a metric.
---

# Delivery Review

A deliverable can be well written and still be wrong: a status line carried over from last
month, a number without its date range, a sweeping claim one screenshot disproves. Those
mistakes are cheap to catch here and expensive to catch after the reader has them.

This skill is that catch, run deliberately rather than left to chance. It is the pre-delivery
equivalent of a code review. It does not improve prose or restructure sections. It establishes
that every claim in the deliverable is true, sourced, and correctly scoped.

## The two rules — both mandatory

> **RULE 1 — Check every pattern in `DELIVERY_QUALITY_LEDGER.md` before anything goes out.**
> Not "keep them in mind." Check, in writing, pattern by pattern.
>
> **RULE 2 — Update the ledger every time a new mistake is found.** A mistake that fits an
> existing pattern is added as an instance under it. A mistake that fits none becomes a new
> pattern, with its own runnable check.
>
> **The deliverable is not finished until the ledger is current.** Correcting a mistake,
> learning something from it, and leaving the ledger unchanged is the one outcome this process
> exists to prevent.

## When to invoke

Before presenting any of the following as final or ready to send:

- A periodic or ad-hoc performance report
- A content draft or written deliverable
- A topic / keyword proposal sheet
- An analysis document or data write-up
- Any outbound email that asserts a status, quotes a number, or reports a finding

Also invoke proactively whenever a deliverable is being revised for the second or later time
in one sitting. Correcting one item is exactly when a second, related item in the same list
tends to slip through unchecked.

## The review — four passes, in order

### Pass 1 — Ledger pattern check

Read `DELIVERY_QUALITY_LEDGER.md` in full. For **every** pattern listed, answer both halves in
writing:

> *"Is this deliverable an instance of this pattern?"*
> *"Is the revision I am about to make about to commit it?"*

The second half is the one that earns its keep. Do not skim, and do not answer only for the
patterns that feel relevant — the pattern you skip is the one you are inside.

Record the answers. For a short deliverable a one-line verdict per pattern is enough; for a
full report, note what you checked and what you found.

### Pass 2 — Grounding check

Extract every claim in the deliverable shaped like:

- "X was done" / "X is complete" / "X has been published"
- "X is pending" / "X is blocked" / "X is still in progress"
- "X is missing" / "zero X" / "no X exists"
- Any status, count, or fact carried forward from a previous period

For each one, verify against **actual current evidence** before letting it stand:

| Claim about | Check against |
|---|---|
| Content published / drafted / scheduled | The CMS itself — filter by publish date and status, not by memory |
| A page change, tag, redirect, or markup | The live page source, fetched now |
| Rankings, impressions, clicks, coverage | Search Console, for the exact window being reported |
| Traffic, sessions, users, conversions | Analytics, for the exact window being reported |
| Task status, delivery counts, work log | The shared tracker, in its current state |

Two hard prohibitions:

1. **Never assert a status from memory.** "I believe that shipped" is not evidence.
2. **Never carry a status line over from a previous period's document without re-verifying
   it.** Reused wording that was true in month N and false in month N+1 is the single most
   common way a report goes stale without anyone noticing.

If a claim cannot be confirmed either way after checking, say so explicitly in the deliverable
— mark it unverified rather than picking a verdict. An honest "not confirmed" costs nothing; a
confident wrong status costs the credibility of everything around it.

### Pass 3 — Source attribution and scope

Two separate checks, both required.

**3a — Attribution.** Every finding names the specific source it came from: the file, the tab,
the page number, the section, the property, the date pulled. When several similar documents
are read in one pass (competitor exports, multi-month pulls, near-identical report formats),
record the source inline at the moment of extraction, never reconstructed afterwards. Then
re-open and re-confirm the source of the single most quotable or most consequential finding in
the deliverable, even if nothing else gets a second look. That is the one most likely to have
been extracted under pressure.

**3b — Scope.** Attribution is about *scope*, not just about *which document*. Before writing
any of:

- "the report never does X"
- "no page has Y"
- "this is missing throughout"
- "they never provide Z"

…name the specific section, table, or page set the claim is actually true of, and confirm no
other part of the same document or site already does X. If the accurate version is narrower —
"the tracked-keyword tables omit impressions, though the top-queries table includes them" —
write the narrower version. A sweeping claim that is 90% right is worth less than a precise
one that is 100% right, because the 10% is what gets quoted back at you.

### Pass 4 — Data-query sanity

For every number in the deliverable that came from a query or export:

- **Recompute independently.** Re-derive totals, averages, percentages and CTRs from the raw
  export a second time rather than trusting the first pass. Do not copy a figure forward from
  a working note without recomputing it.
- **Reconcile totals against detail rows.** A summary figure and the rows beneath it must
  agree. If they disagree, resolve which is correct before delivery — never ship both.
- **Confirm the date range is the one you think it is.** State it explicitly next to the
  number. Where two figures are compared, confirm both cover the same window and the same
  number of served days, or the comparison is not valid.
- **Confirm the filter is the one you think it is.** Default to exact matching when isolating a
  single page, query or entity. Prefix and contains matches quietly pull in unrelated rows.
- **Treat a surprising result as a signal, not a finding.** An unexpectedly large, small, or
  contradictory number means re-verify the query first. A second, differently-constructed query
  that agrees is far stronger evidence than one query taken at face value.
- **Check the granularity is right.** A domain-level figure must not stand in for a page-level
  one; a gross count must not stand in for a net-new one.

## Output

Report findings as a short list — pattern matched, what was wrong, what changed. If nothing is
found, say so plainly. Do not manufacture a finding to justify the pass.

**Before closing the review:** if a genuine new mistake was found that does not fit an existing
ledger pattern, add it to `DELIVERY_QUALITY_LEDGER.md` as a new pattern with its own check. If
it fits an existing pattern, add it as an instance there. If an existing pattern's check failed
to prevent a repeat, sharpen that check — a check that did not stop the repeat is not a check,
it is a wish.

## What this is not

This is not a rewrite pass. Its job is to catch claims that are wrong, ungrounded, unsourced or
over-scoped — not to polish prose, restructure sections, or revisit editorial decisions that
were made deliberately. Stay scoped to *"is this true and properly grounded"*, not *"could this
be written better"*.
