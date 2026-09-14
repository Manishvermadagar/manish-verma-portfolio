# Verifying an Agency's Monthly Report

If you pay an agency and read their monthly report, you are accepting their
account of their own performance. This is the verification method I built so I
did not have to — and, more importantly, what it is actually for.

**It is not for catching anyone out.** It is for establishing which claims you
can rely on. Those are different goals and they produce different
work. If you go in looking for fraud you will find grievances; if you go in
looking for calibration you find out where the reporting is solid and where it
is not, and you can then have a specific conversation instead of a
temperamental one.

That distinction turned out to matter. Most of the figures held up against the
source. That is what made the ones that did not matter. Had I not checked the
ones that were right, the wrong ones would have read as general suspicion
rather than a specific, addressable problem.

---

## Step 1 — Read the report against itself, before touching any data

This costs nothing, needs no access, and finds more than people expect.

Look for:

- **A section dated differently from the rest.** One slide covering a different
  month than the report it sits in.
- **The report disagreeing with itself.** A headline figure on one page and the
  same month in a historical table two pages later, with different numbers.
- **A stated creation date earlier than data the report contains.** A document
  claiming to be written on a date, containing figures captured weeks
  afterwards.
- **Work described in a status that the calendar contradicts** — items reported
  as "still pending" months after they went live.

---

## Step 2 — Re-derive the headline numbers from the source

Pull the same date ranges yourself from the analytics and search platforms and
compare.

**Be precise about the window.** Tools aggregate over rolling windows that may
not match a calendar month. Where you cannot pull the exact range, say so and
report what you *could* pull, rather than comparing two different periods and
calling the difference an error.

**Record what matched.**

---

## Step 3 — Check rank claims against measured position, then corroborate a second way

Reported rankings usually come from a third-party rank tracker. You can check
them against the search platform's own measured average position for the same
queries.

Doing this across a full set of claimed rankings, **most did not hold up.** A
minority were close to the claim. Many were off by a wide margin, including
several claimed first-place rankings that were not on the first page at all.
And a handful showed **no measurable visibility whatsoever** over the period —
the site never appeared for those queries at any position, which is
incompatible with any claimed rank.

**A single check is not enough here, and this is the important part.** A rank
tracker takes one snapshot; a search platform reports a 30-day average. Those
are genuinely different measurements and the difference is a legitimate defence.

So corroborate with something independent: **click-through rate.** A genuine
first-place ranking reliably drives high click-through, and the same dataset
contained real examples of that. Nearly every *claimed* first-place keyword
showed click-through an order of magnitude lower — several of them zero.

Position and click-through are separate signals. When both independently
disagree with the claim, the methodology defence no longer covers the gap.

**State the caveat in your own finding anyway.** Write down that the two
measurements differ and why your conclusion survives it.

---

## Step 4 — Ask the question rankings cannot answer

Rank claims answer *"is the claimed position right?"* They cannot answer *"is
this site visible at all, and does that visibility convert?"*

Run impressions against clicks for the same keyword set. **A keyword can carry
plenty of visibility and still earn few clicks**, and a rank report cannot show
that.

This is where the most useful findings come from. A query with high visibility
and weak click-through, sitting low on the first page, needs a title and snippet
fix, not a campaign.

**This is why both analyses are required.** Rank alone cannot distinguish
between:

- **a page that never ranks at all** — needs to start ranking, and
- **a page that ranks but does not convert** — needs the listing rewritten

Those need opposite work, and a rank report puts them in the same bucket.

---

## Step 5 — Define the reporting format, and let the process surface its own learnings

Rather than arguing report by report, specify what a monthly report must
contain: which sections, which figures, and — the one that matters for
accountability — **every work claim carrying evidence a reader can check.**

The effect was not that the agency became more honest. It was that **their own
internal review started identifying claims that needed correction before the
report shipped.** In one cycle their own review identified four such items
before the report was delivered.

---

## Step 6 — Report the outcome honestly, including the limits of your own work

After all of this, the summary I wrote was:

> **The reporting improved materially. Better reporting is not the same as better results, and I said so.**

Reporting quality improved measurably over the period I ran this. I did not claim
that as a change in the performance it described, because the process does not
create one. The learning was to distinguish clearly between an improvement in
reporting quality and a change in the performance being reported.

---

## The discipline that underpins all of it: re-base your own numbers

What I learned by re-checking my own audit:

- A headline performance figure had **moved substantially** since I established it. Re-based against live data, and because two defensible methods gave materially different answers, the record now carries **both and requires the method to be stated whenever either is quoted.**
- A content-quality finding I had repeated for months no longer described the
  current state. A live sample found the condition had largely been addressed.
  **Do not cite the old figure** is now written into the record.
- A "zero coverage" claim needed to be narrowed twice before it could be
  quantified exactly — with a note that **an overstated version costs
  credibility**, which is the reason to refine the claim.
- A performance figure was flagged as un-rebased and barred from being quoted again without a fresh pull.

Put an expiry on your own findings.

---

## What I learned by checking my own recommendations against current documentation

An independent fact-check against my finished implementation plan identified
**five practices I had treated as current that no longer applied.** All five had
been correct a few years earlier, which is exactly why they survived
unchallenged.

The most consequential learning came from a search feature I had scheduled as
first-phase work and described as "the cheapest win available" that **had been
removed from the search engine months before.**

The correction is worth stating precisely, because precision is what makes it useful: the markup is still valid and worth adding as machine-readability hygiene, but it does not produce the expected visible result. Where a page has a real listing problem, the fix is the page information shown to users, not the markup.

One of the five also showed that a current internal document had the more
accurate position than the claim I had relied on.

**The standing rule:** before shipping any recommendation, verify
time-sensitive claims against current documentation rather than recall.
