---
name: report-qa
description: Verify a draft performance report against live Search Console, analytics, backlink-tool and CMS data before it is sent. Checks every number against its real source, catches internal inconsistencies (summary cards vs trend tables, mixed reporting periods, arithmetic), scores the report against a completeness checklist, and applies reporting-methodology standards so every figure is sourced, dated and independently reproducible.
---

# Report QA — Self-Verification Before Sending

The quality gate a periodic performance report passes through **before** it leaves your hands.
The standard is simple: every number in the report is traceable to a live source, and anyone
who re-pulls that source gets the same number.

A report that meets this standard defends itself. When a figure is sourced, dated and
reproducible, a challenge is answered with a link instead of a discussion. When it is not, the
whole document's credibility rides on trust nobody should have to extend to a spreadsheet.

Run this on the draft, fix what it finds, then send.

## When to invoke

- A draft report is complete and about to go out.
- Numbers in a report have been updated, re-pulled, or carried over from a prior period.
- Before regenerating a report PDF for redistribution.

---

## Data sources — pull live data, don't re-quote the draft

| Source | How to reach it | Verifies |
|---|---|---|
| The draft report | The file being QA'd | The claims under test |
| Google Search Console | the `gsc` MCP server | Clicks, impressions, CTR, average position, query and page tables, indexing coverage |
| Google Analytics 4 | the `analytics-mcp` server | Sessions, users, channel splits, engagement, landing-page performance, conversions/key events, referral traffic including AI-assistant referrals, which Search Console has no visibility into |
| Backlink / authority tool | A fresh export from whichever crawler you use | Backlink counts and quality, authority score and its trend, competitor keyword footprint |
| CMS | The CMS export, or the live URLs themselves | Content-activity claims — what was drafted versus what is actually published and live |
| Rank-tracking tool | The tool's own raw CSV export | Tracked-keyword positions, always paired with Search Console as a second reading |
| `work/03_Reports/Report_QA_Log.md` | The running QA log this skill writes to | Prior QA findings, so this pass builds on the last one rather than repeating it |

If a claim cannot be checked against any of these, mark it **Unverifiable** and say what source
*would* settle it. "Unverifiable" is an honest and useful QA result; a guessed pass is not.
Anything still Unverifiable at send time is either removed or explicitly labelled in the report
as an estimate, with its method stated.

---

## Part 0 — Proportionality: does the report show the period's work?

Accurately reported traffic numbers are not evidence of work performed. Search Console and
analytics figures describe the site's state regardless of what anyone did to it, so a report
can be numerically flawless and still leave the reader unable to see what the period bought.

Before the detail passes, build a short honesty table:

| Category | Claimed in the report | Independently traceable to this specific period |
|---|---|---|
| Content | | |
| Backlinks | | |
| Technical SEO | | |
| Keyword rankings | | |
| Regional / market-specific work | | |

Sort each claim into: (a) analytics reporting — real data, but not work done; (b) carried over
from an earlier period; (c) claimed but too vague to check (no count, no URL, no name); (d)
genuinely new and independently checkable this period.

Anything in (c) gets rewritten with specifics before send. If a category is mostly (a) and (b),
the report needs a section showing what was actually delivered. That is a content gap to fill,
not a QA failure to hide.

**Trend-table robustness check.** If the report carries a multi-period historical table,
re-pull the whole window and recompute every row in it, not just the current one.
Carried-forward rows drift silently, and one wrong historical cell undermines every row around
it.

---

## Part 1 — Claim-accuracy register

Extract every checkable quantitative or factual claim into a register, one row per claim.
Categorize each by its required source *before* checking it, because the category determines
the tool:

1. **Search-Console-sourced** — clicks, impressions, CTR, average position, queries, pages, indexing
2. **Analytics-sourced** — sessions, users, channels, conversions, landing pages, referral traffic
3. **Backlink / authority** — placements, referring domains, authority score
4. **Content activity** — posts drafted, published, meta tags updated → CMS export and the live URLs. *Drafted is not published.* Check which one actually happened and report that word accurately.
5. **Rank-tracker keyword tables** — the tracking tool's raw export, **plus** a Search Console cross-read of the same exact query (Part 4)
6. **Cross-document claims** — any figure that also appears in a shared work tracker must match the report. A number in one place and not the other is itself a finding.

Verdicts: **PASS** (source matches — state the source, the call, the date range and the actual
number), **FAIL** (source disagrees — state both numbers; fix the draft), **PARTIAL**
(directionally right, magnitude off, or only part of a compound claim holds), **UNVERIFIABLE**
(no independent source exists — state why, and what would be needed).

| # | Claim as written | Category | Source checked (tool + date range) | Verdict | Actual value | Action |
|---|---|---|---|---|---|---|

Every FAIL and PARTIAL gets an explicit action: correct the number, add the missing qualifier,
or cut the claim.

---

## Part 2 — Internal consistency

Self-contradiction is the cheapest kind of error to catch and the most expensive to have caught
for you.

- **Summary cards vs detail tables.** Every headline figure must equal the same metric where it
  appears in a trend or detail table later. Reconcile them number for number.
- **Arithmetic in totals rows.** Channel splits sum to the stated total within rounding.
  Percentages sum to 100%. Period-over-period deltas equal the difference between the two
  periods shown.
- **One reporting period, everywhere.** State it once, and confirm every section — including
  screenshots, dashboards and carried-over text — falls inside it. A section labelled with a
  different month than the rest is a hard blocker.
- **No data dated after the report's stated creation date.** If a capture is newer, either
  update the creation date or re-capture within the period.
- **Screenshots must show their own date filter.** A screenshot with no visible period cannot
  be reproduced by anyone, including the person who took it.
- **Consistent metric definitions.** The same metric name means the same thing everywhere —
  "users" is either total users or new users throughout, never both.

---

## Part 3 — Completeness checklist

Score each dimension **Present / Partial / Absent**. These are what make a report show growth
rather than activity:

1. **Indexing coverage trend** — indexed versus crawled-not-indexed, as a trend, not a single number
2. **Branded vs non-branded split, with trend** — clicks and impressions separated. Total clicks alone conceal whether new non-branded discovery is happening at all; this is the single most useful line in the report for judging progress
3. **Site authority score and its trend** — stated explicitly, over a rolling window
4. **Competitor benchmarking** — named competitors with authority score and keyword footprint alongside your own, not the site in isolation
5. **Net-new backlink count, not gross** — new referring domains for the period, with live placement URLs, plus **page-level authority per placement** rather than the root-domain score of a shared hosting platform. A high root-domain score on a free-subdomain host says nothing about the page carrying the link
6. **Toxic backlink and disavow status** — a standing line item every period, even when the answer is "no change"
7. **Conversion attribution by channel** — a named, defined conversion event attributed across channels, not raw sessions
8. **Content production versus commitment** — promised, drafted, published, each linked to the CMS record or the live URL
9. **Tracked-keyword tables carrying impressions, clicks and CTR alongside rank** (Part 4)
10. **Explicit source and date range per number**, labelled on the figure itself
11. **Core Web Vitals and technical health status**
12. **Structured-data rollout status**
13. **Regional / market breakdown with equal depth across markets** — each market gets the same metrics, not a full treatment for one and a snapshot for another
14. **Trend, not snapshot, in every section** — a rolling 6–12 period view for each core metric, including sections that usually get single-period treatment (backlinks, content activity, regional)

An **Absent** is not automatically a defect — some dimensions depend on work scoped elsewhere
or deferred. Where a dimension is absent for a known reason, say so in one line in the report
rather than leaving a silent gap.

**This checklist is living.** If a QA pass surfaces a genuinely new dimension a strong report
should carry, add it as item 15+ before finishing the write-up.

---

## Part 4 — Keyword reporting standard: never rank alone

A tracked-keyword table showing position and nothing else cannot be acted on, because two
opposite situations produce the same-looking row:

- **Zero visibility** — the site records no impressions at all for that query. Whatever the rank
  tool reports, the page is not being served to real searchers. The work is to get it indexed
  and ranking in the first place.
- **High visibility converting badly** — many impressions, a real position, low CTR. The demand
  is already won; the work is position, title and snippet improvement on a page that exists.

Rank alone cannot tell these apart and they call for opposite responses. So:

- Every tracked-keyword table carries **rank, impressions, clicks and CTR** for the same query
  and the same date range.
- **Name the rank-tracking tool** in the report and attach its raw CSV export.
- **Cross-read every claimed position against Search Console** for the same exact query, using
  an equals filter rather than contains. Search Console's average position is a 30-day average
  and a rank tool's is a point-in-time snapshot, so they will differ somewhat; say so. What
  matters is catching where they disagree by a wide margin, or where CTR contradicts the
  position outright. A top-of-page-one position with near-zero CTR on a query with real demand
  is a signal to re-check the number before it ships.
- Where a keyword genuinely has no impressions, report that plainly. It is a real finding and a
  clear piece of work to scope next period.

---

## Part 5 — Methodology standards every report must meet

1. **Source and date range on every number** — "Search Console, 1–30 Jun" / "GA4, 1–30 Jun" /
   "[rank tool], pulled 2 Jul". No unlabelled numbers.
2. **Name every tool** — rank tracker, crawler, backlink index — with raw exports attached so
   the reader can reproduce the figure.
3. **One reporting period enforced across the whole document**, with nothing dated after the
   stated creation date.
4. **Backlinks reported as net-new referring domains**, with live URLs, page-level authority per
   placement, and toxicity/disavow status. Note the share of a period's placements coming from
   any single hosting-platform family — heavy concentration on one platform is worth flagging
   yourself rather than leaving it to be noticed.
5. **Every claimed activity carries a concrete count and a citation.** No "several posts"
   without a number and links. No "initiated forum commenting" without naming the forums and
   listing URLs. No "optimized meta tags" without which pages. If it cannot be counted and
   linked, it does not go in as a deliverable.
6. **Content claims tied to verifiable CMS state.** "Drafted" links the CMS record; "published"
   links the live URL. Anything pending on an approval or platform issue carries a resolution
   ETA that is updated each period, not restated verbatim.
7. **Trend over snapshot** for every core metric in every section.
8. **Pre-send reconciliation pass** (Part 6) before the file is exported.

**This part is living too** — a QA pass that finds a new class of format problem adds a
numbered standard here.

---

## Part 6 — Pre-send reconciliation pass

The last thing done before export. Walk the finished draft front to back:

- [ ] Every summary figure equals the same metric in its detail/trend table
- [ ] Every totals row and percentage split adds up
- [ ] Every section states the same reporting period
- [ ] No screenshot, export or data point is dated after the stated creation date
- [ ] Every screenshot shows its own visible date filter
- [ ] Every number carries a source label and a date range
- [ ] Every tracked-keyword table shows impressions, clicks and CTR next to rank
- [ ] Every activity claim has a count and a link
- [ ] Every backlink figure is net-new, with URLs and page-level authority
- [ ] Every register FAIL and PARTIAL from Part 1 has been corrected in the draft
- [ ] Nothing remains Unverifiable without being labelled as an estimate in the report itself
- [ ] Raw exports backing headline figures are saved alongside the report

Any unchecked box means the report is not ready to send.

---

## How to run

1. Read `work/03_Reports/Report_QA_Log.md` (create it if absent) for prior findings.
2. Read the draft in full.
3. Build the claim register (Part 1) and verify each claim against live data.
4. Run the internal-consistency check (Part 2).
5. Score the completeness checklist (Part 3).
6. Apply the keyword reporting standard (Part 4) to every tracked-keyword table.
7. Check the draft against the methodology standards (Part 5).
8. Build the proportionality table (Part 0) from what the register and checklist showed.
9. Fix the draft — correct every FAIL, add every missing label, rewrite every vague claim.
10. Run the pre-send reconciliation pass (Part 6) against the corrected draft.
11. Write the QA record as a new dated `##` section at the **top** of
    `work/03_Reports/Report_QA_Log.md` (newest first).
12. Save the raw exports backing headline figures alongside the report so any number can be
    re-proved later.

---

## Hard rules

1. **No number ships unverified.** If it cannot be checked, it is marked Unverifiable and either
   removed or labelled as an estimate with its method stated — never quietly passed.
2. **State the exact source for every verdict** — "Search Console `get_search_analytics`, 1–30
   Jun", not "checked".
3. **Drafted is not published.** Verify against the CMS and the live URL before using either word.
4. **Backlinks are net-new**, with live URLs and page-level authority per placement.
5. **Never report rank without impressions, clicks and CTR** alongside it, and always cross-read
   against Search Console.
6. **Every activity claim carries a count and a citation.** No "several", no unnamed forums, no
   unlisted pages.
7. **The reporting period is stated once and holds throughout**, and nothing is dated after the
   stated creation date.
8. **Fix the draft, don't just log the finding.** The output is a corrected report plus a QA
   record. A log entry describing an error that is still in the document is a failed QA pass.
9. **One running log**, newest section at the top. Never a new file per report.
10. **Save the raw exports.** Any figure that might need proving later points at a saved CSV,
    not a tool call that has scrolled away.
11. **This skill does not draft the covering email.** Once the report is corrected, hand off to
    `/write-client-mail`.
