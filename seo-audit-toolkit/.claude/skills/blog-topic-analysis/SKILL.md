---
name: blog-topic-analysis
description: Pre-submission self-check of proposed content topics and keywords — scores each proposed topic across eight weighted dimensions (intent, demand and feasibility, business relevance, cannibalization, SERP landscape, differentiation, E-E-A-T and regulatory risk, title quality) so weak topics are fixed or dropped before the batch is submitted for approval. Run on every topics-and-keywords batch.
---

# Topic & Keyword Selection Analyzer

Evaluate a **proposed** topic, or a batch of them, before any content is written and before the
batch goes for approval.

This is a gate *before* content creation, distinct from `/content-quality`, which grades a
*finished draft*. Getting it right prevents writing hours spent on topics that were never going
to rank, cannibalize an existing page, or serve the business. It also means the batch that
reaches the approver is one where every topic already has demand evidence, a differentiated
angle, and a clean cannibalization check behind it.

Batch mode is the default. For a single topic, run all eight dimensions and skip the batch
balance check.

## Log file — one source of truth for topic batches

`work/01_Topic_Proposals/Topic_Scoring_Log.md` holds every batch ever scored, **one dated `##`
section per batch, newest first**. Do not create per-batch files. Each section records the date,
the batch name, the topics table (title, target keyword, score, recommendation, notes) and a
Status line that moves `PENDING SCORING → SCORED / REWORKED → SUBMITTED → APPROVED / PARTIALLY
APPROVED`. When the approver responds, record which topics were approved, and the date, in the
same section.

## Data sources — read before scoring

| Source | Used for |
|---|---|
| `work/01_Topic_Proposals/Topic_Scoring_Log.md` | The batch being scored, plus what was approved or rejected in prior batches |
| `reference/content-inventory.md` (+ CMS export) | Cannibalization against everything already published (D4) |
| `reference/keyword-data/` | Keyword-gap classification against named competitors, branded vs non-branded splits (D1, D2, D5) |
| The `gsc` MCP server | Live query-level pull — current impressions, clicks, CTR, average position. Prefer this over a stale export (D2) |
| Web search | Live SERP check: who ranks now, what format wins, what is missing (D5) |

If a keyword appears in no export and cannot be pulled live, say so explicitly rather than
guessing volume. Use web search to sanity-check that it is a real query pattern and flag
"volume unverified — no local or Search Console data".

## Site baseline context

Fill this in from your own audit before the first run — it is what stops the scoring being
generic. The version that matters most:

- **How branded is organic discovery?** Where branded queries dominate, topics that expand
  *non-branded* reach are worth more than ones that re-capture people already searching the
  brand.
- **What is the authority position versus the competitor field?** Ranking feasibility is judged
  against the site you actually have, not an ideal one.
- **Which markets are high-impression and low-CTR?** Topics that can carry a genuine angle for
  that market are worth flagging as such.
- **What E-E-A-T can a new page inherit?** If the site has no per-author attribution and no
  structured data, credibility has to come from the page itself.
- **How large and how overlapping is the published inventory?** On a large one, cannibalization
  risk is genuinely high and must be checked rather than assumed away.

---

## The eight dimensions

| # | Dimension | Weight |
|---|---|---|
| 1 | Search Intent Fit | 15% |
| 2 | Keyword Demand & Ranking Feasibility | 15% |
| 3 | Business & Audience Relevance | 15% |
| 4 | Cannibalization Risk | 15% |
| 5 | Competitive SERP Landscape | 10% |
| 6 | Differentiation & First-Party Angle | 10% |
| 7 | E-E-A-T Feasibility & Regulatory Risk | 10% |
| 8 | Title & Keyword Fit Quality | 10% |

### 1 — Search Intent Fit (15%)

Is this a real, clear intent that an article is the right format for? Informational and genuine
commercial-investigation queries are correct for an article. **Navigational** queries (brand +
"login", brand + "pricing") are not topics — route them to the existing page. **Transactional**
queries are usually a landing-page task. Check the branded query data too: a "topic" that is
really branded traffic misclassified as an opportunity gets caught here.

- 9–10: clear intent, article is the natural format, no better-suited page already exists
- 5–6: intent mixed or vague; the keyword could mean several things
- 3–4: largely navigational or transactional — wrong format
- 1–2: not a real search pattern

### 2 — Keyword Demand & Ranking Feasibility (15%)

Check, in order:

1. **Does it already surface in Search Console?** Pull it live. Note impressions, clicks,
   position. **High impressions with low clicks or a poor position is a strong opportunity** —
   often better than a brand-new keyword, because demand is already proven and only position
   needs work.
2. **Does it appear in the keyword-gap data?** Classify: **Untapped** (nobody ranks; you could
   own it) / **Missing** (competitors rank, you don't — a real gap) / **Weak** (you rank poorly
   — a refresh opportunity, not necessarily a new page) / **Strong** (you already rank well — a
   new page here cannibalizes rather than grows) / **Unique** (only you could target it; verify
   it is not just a branded variant).
3. **If absent from both**, use web search to confirm it is a real query pattern, and flag the
   volume as unverified.

- 9–10: confirmed demand, realistic to rank, classified Missing or Untapped
- 5–6: low or unclear demand; Weak — better served by refreshing an existing page
- 3–4: Strong (cannibalizes) or negligible demand
- 1–2: no evidence of real demand anywhere

### 3 — Business & Audience Relevance (15%)

Audience fit; funnel stage (a healthy batch needs a mix, not all top-of-funnel); whether it maps
to a capability the product actually has; whether it moves non-branded discovery forward.

- 9–10: clear audience fit, identifiable funnel stage, ties to a real capability or priority
- 5–6: generic category topic with only loose relevance
- 3–4: audience mismatch or unclear funnel stage
- 1–2: no discernible business rationale

### 4 — Cannibalization Risk (15%)

Two directions, both required.

1. **Versus the published inventory** — read `reference/content-inventory.md` and compare title,
   keyword, slug and tags using the same four signals as `/content-quality`.
2. **Within the batch** — compare every proposed topic against every *other* proposed topic. It
   is easy to commission two competing pages in the same submission.

Classify Exact / Near-exact / Topical overlap / Tangential.

- 9–10: no conflicts in either direction
- 5–6: one near-exact conflict, or several topical ones — needs an explicit differentiation angle
- 3–4: exact conflict with a published page, or two batch topics on the same keyword
- 1–2: duplicates an existing page with no new angle; should not be proposed

### 5 — Competitive SERP Landscape (10%)

Search the keyword. Look at the top 3–5. Who ranks — direct competitors, generic category sites,
or forums? What format wins? Are there SERP features a well-structured page could win? Is the
field dominated by authority sites you have no near-term shot at, or is it winnable — thin
competitor pages, outdated information, an angle nobody has used?

- 9–10: winnable — thin or outdated competition, clear format opportunity
- 5–6: crowded; would need an exceptional angle
- 3–4: dominated by high-authority generic sites with no realistic near-term path
- 1–2: saturated by exact-match, well-resourced competitors

If web search is unavailable, state so and mark N/A, redistributing the weight.

### 6 — Differentiation & First-Party Angle (10%)

Does the topic carry an angle only this site can credibly deliver — a specific product
capability, first-party data as the hook, a comparison competitors cannot replicate? Penalize a
bare definitional title with no stated angle. These are the easiest to commission and the
hardest to differentiate: flag and add an angle *before* the topic goes in the sheet.

- 9–10: explicitly first-party and hard for competitors to copy
- 5–6: generic angle, no stated differentiator — needs one added before commissioning
- 1–2: reads like content-mill filler

### 7 — E-E-A-T Feasibility & Regulatory Risk (10%)

Can this be credibly and safely written with the expertise and data actually available, or would
it force the writer to invent authority-sounding claims? Remember the site may supply no
author-level credibility of its own.

Does it touch regulated territory — tax treatment, financial or medical claims, performance or
returns? Those need sourcing and disclaimers. **Flag it now, at the topic stage**, so the writer
is briefed correctly, rather than discovering it at draft review after the hours are sunk.

- 9–10: within available expertise; no regulatory sensitivity, or minor and easily disclaimed
- 5–6: needs compliance-safe framing written into the brief
- 3–4: high sensitivity with no stated plan for sourcing or disclaimers
- 1–2: all but requires the writer to fabricate authority

### 8 — Title & Keyword Fit Quality (10%)

Keyword present and near the front; length workable as a meta title (roughly under 60
characters); specific and benefit-driven rather than vague; not a near-duplicate of an existing
meta title.

- 9–10: front-loaded, specific, clearly distinct
- 5–6: generic phrasing, keyword buried
- 1–2: unusable as-is

---

## How to run

1. Parse each proposal into `{title, target keyword}`. Log the batch first if it is not already
   in the scoring log.
2. Read prior batch sections — what was approved, tweaked or rejected before is the best
   available signal for what will land this time.
3. Read the content inventory in full (D4).
4. Pull demand data live, falling back to saved exports (D2).
5. Run a SERP search per topic (D5) *before* scoring, so it informs D2, D5 and D6.
6. Score each dimension, compute the weighted total.
7. Run the batch balance check.
8. Write the output into the log's batch section.
9. **Rework, then re-score.** Anything below "Ready to Propose" gets fixed here — keyword
   swapped, angle added, title rewritten, topic dropped.
10. Send with `/write-client-mail`; attach per-topic detail via `/pdf-report` if needed.

**Thresholds:** 8.5–10 Ready to Propose · 7.0–8.4 Propose with Minor Tweaks (name the tweak and
make it) · 5.0–6.9 Rework (name what to change) · below 5.0 Drop (state why).

**Batch balance check:** funnel mix (flag if lopsided); intra-batch cannibalization pairs;
audience or market split; how many topics genuinely grow non-branded discovery; which topics
carry a regulatory flag needing a compliance-safe brief.

---

## Hard rules

1. **Never inflate scores.** A topic that is "fine" is a 7. Reserve 9–10 for confirmed demand
   *and* a real first-party angle.
2. **Cite the actual data source** for every demand claim. Never assert volume from memory.
3. **Always read the inventory before claiming no cannibalization.**
4. **Always check intra-batch overlap**, not just overlap against published pages.
5. **Flag regulatory risk at the topic stage.** It is the cheapest point to redirect a writer.
6. **Recommendations must be specific and actionable.** "Rework: swap the keyword to X and add a
   comparison-table angle" is a finding. "Improve this" is not.
7. **State when keyword data is missing** rather than guessing. An honest caveat beats a number
   you cannot back up.
8. **This gates topics before writing.** An approved topic's draft still goes through
   `/content-quality` before delivery.
9. **If web search is unavailable**, say so and mark D5 N/A rather than inventing SERP findings.
10. **Score the batch before it is sent, not after.** The scoring is only useful while there is
    still time to swap a keyword, sharpen a title, or drop a topic.
