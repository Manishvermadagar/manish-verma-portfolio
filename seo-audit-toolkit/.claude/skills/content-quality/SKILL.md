---
name: content-quality
description: Score a content draft or landing-page copy across ten weighted SEO dimensions before it is delivered — authenticity, intent alignment, depth, on-page hygiene, E-E-A-T, internal linking, snippet optimization, competitor gap, CTA alignment, and factual accuracy — plus a keyword-cannibalization check against the published content inventory. Run on every draft before delivery.
---

# Content Quality Self-Check

Evaluate a piece of content you are about to deliver for SEO quality **before it goes out**.
Score it across ten dimensions, produce a prioritized fix list, and check for keyword
cannibalization against the site's published inventory.

This is a self-check. The point is to find and fix the problems in your own draft rather than
have them come back as revision requests. A draft below the Publish-Ready threshold gets
revised and re-scored before it is submitted.

## Inputs

Content can arrive as pasted text, a file path (`.html`, `.md`, `.txt`), or a request for a
standalone cannibalization audit. For HTML, extract the visible text — `<title>`,
`<meta name="description">`, `<h1>`–`<h3>`, `<p>`, `<li>`. Ignore nav, footer, sidebar and
cookie boilerplate.

Two reference files this skill reads:

- **`reference/content-inventory.md`** — every published URL with title, slug, meta title,
  publish date and tags. Built in Part 3 of `AUDIT_FRAMEWORK.md`. Required for the
  cannibalization check and for inbound-link suggestions.
- **`reference/cms-export.json`** (optional) — a fuller or more current CMS export. Cross-check
  against it when the inventory looks stale for a topic area.

Drafts live in `work/02_Drafts/`. Keep the draft and its review together there.

After any evaluation:

1. Save the write-up as `work/02_Drafts/<slug>_REVIEW.md`.
2. Act on the Priority Action List — revise, then re-score.
3. **Re-reviews append**, as a dated `## REVISION CHECK — <date>` section inside the *same*
   review file. Never create a second review file for one draft.
4. On delivery, use `/write-client-mail` for the covering mail and `/pdf-report` if the review
   goes as an attachment.

---

## Scoring weights

| # | Dimension | Weight |
|---|---|---|
| 1 | Search Intent Alignment | 15% |
| 2 | Authenticity vs Generic | 15% |
| 3 | Content Depth & Completeness | 15% |
| 4 | On-Page SEO Hygiene | 10% |
| 5 | E-E-A-T Signals | 10% |
| 6 | Internal Linking | 10% |
| 7 | Featured Snippet & Readability | 10% |
| 8 | Competitor Content Gap | 10% |
| 9 | CTA & Conversion Alignment | 5% |
| 10 | Factual Accuracy | 10% |

Weighted score = sum of (score × weight), out of 10.

---

### 1 — Search Intent Alignment (15%)

Detect the intent type first: **informational** (explain), **navigational** (direct, don't
pitch), **commercial investigation** (compare and justify), **transactional** (convert, reduce
friction).

- 9–10: format, depth and angle exactly match the intent; nothing a searcher would expect is missing
- 7–8: mostly aligned; minor mismatch (too salesy for informational, too shallow for commercial)
- 5–6: partially aligned; a searcher gets some value and leaves unsatisfied
- 3–4: wrong angle for the intent
- 1–2: completely misaligned; immediate bounce

Ask: if I searched the target keyword and landed here, would I feel my question was answered?

### 2 — Authenticity vs Generic (15%)

**Generic signals, penalize heavily:** sentences that could appear on any site in any industry
("In today's fast-paced world…", "Are you looking for…"); definitions of terms the audience
already knows; numbered lists with no explanation or evidence per item; hedging filler ("it is
important to note"); no specific data, named examples or product references; the keyword
appearing unnaturally in every other sentence; an opening paragraph that restates the title;
all sections the same length regardless of importance, which is the tell for padding.

**Authentic signals, reward:** concrete examples from the actual product; specific sourced
numbers; practitioner perspective; addressing objections a real user would raise; explaining
the *why* behind a recommendation; using domain terminology correctly the way only someone who
does the work does; acknowledging limitations and trade-offs honestly.

- 9–10: clearly written by or with domain experts; could not have come from a generic prompt
- 7–8: mostly authentic; some filler, but core sections have real substance
- 5–6: mixed; several paragraphs could belong to any competitor's blog
- 3–4: mostly generic; templated; publishable on any site with find-and-replace
- 1–2: pure filler; would embarrass the brand in front of a practitioner

### 3 — Content Depth & Completeness (15%)

Does it answer the obvious follow-up questions? Are subtopics covered or only the surface? Is
there a real hierarchy (H2s subdivided by H3s)? For how-to content, are the steps complete
enough to follow without leaving the page? For comparisons, are the differentiators actually
compared with specifics?

- 9–10: a reader could act on this without reading a second article
- 7–8: covers most ground; one or two important angles missing
- 5–6: surface-level; hits the main points, nothing deep enough to be useful
- 3–4: thin; major subtopics skipped
- 1–2: a stub, or 500+ words saying nothing

### 4 — On-Page SEO Hygiene (10%)

| Signal | Check |
|---|---|
| Title tag | Present? Keyword near the front? Under ~60 characters? Not a duplicate? |
| Meta description | Present? 140–160 characters? Keyword natural? Has a hook? |
| H1 | Exactly one? Contains the primary keyword? Not identical to the title tag? |
| H2/H3 structure | Organized logically? Secondary keywords appearing naturally? |
| Keyword in first 100 words | Present in the opening paragraph? |
| Internal links | At least 2–3 relevant internal destinations? |
| Image alt text | Descriptive alt on every referenced image? |
| URL slug | Short, keyword-rich, hyphenated? |

One point per pass. Halve the score if the title or H1 is missing entirely. Max 10.

Note the site baseline from the audit: if a large share of published pages have no custom meta
title, a draft that ships with a properly written one is a real improvement on the baseline.
Do not treat these as optional.

### 5 — E-E-A-T Signals (10%)

Check for an author byline with real credentials, visible publication and last-updated dates,
sources cited for data and statistics, correct references to real regulatory or industry
context, and trust links (privacy policy, terms) where the content is YMYL-adjacent.

Where the site supplies no per-author attribution — for example every post carrying the same
CMS-default author value — a draft cannot inherit credibility from the site. Whatever the draft
supplies itself is the only E-E-A-T it will have. **Never invent a byline or credentials.** If
attribution is undecided, raise it as an open item rather than filling in a placeholder.

- 9–10: author known, dates shown, claims sourced
- 5–6: anonymous, undated, unsourced
- 1–2: actively harmful — wrong or misleading information present

### 6 — Internal Linking (10%)

Two directions, both required.

**Outbound** — does the article link to 2–3 relevant internal pages, with descriptive anchors
rather than "click here", at points where the link genuinely helps the reader?

**Inbound opportunities** — read `reference/content-inventory.md` and name 3–5 published pages
that should link *to* this new article. These are concrete tasks to ship with the delivery, so
list them explicitly.

- 9–10: 3+ outbound links with good anchors, 3+ inbound opportunities named
- 3–4: no internal links in the body; the new page launches as an island

### 7 — Featured Snippet & Readability (10%)

Snippet triggers to check for: a definition paragraph ("X is…", 50–60 words), numbered steps in
an `<ol>` for how-to queries, a comparison table with clear headers, an FAQ block (H3 question
→ 10–50 word answer), and a "best list" of named items each with a brief description.

Readability: flag any paragraph over five sentences with no break; confirm each H2 opens with a
topic sentence; check for a TL;DR or key-takeaways block; run the mobile scan test — reading
only H1, H2s and H3s, does the argument still make sense?

- 9–10: 3+ triggers, headers tell the full story, short paragraphs, takeaways present
- 3–4: no snippet-friendly structure, long unbroken blocks

### 8 — Competitor Content Gap (10%)

Search the target keyword. Look at the top 3–5 results. Identify what they cover that this
draft misses: whole sections, a format the draft lacks (they have a comparison table, the draft
is all prose), a question they answer and it ignores, more specific or benefit-driven titles,
visible structured data.

Do **not** flag "they have more words" — word count alone is not a gap. Do not flag sections
off-topic for the keyword. Where competitors use proprietary data, flag the absence of an
equivalent first-party angle instead.

If web search is unavailable, state "Competitor check skipped — web search unavailable", mark
this dimension N/A and redistribute its 10% proportionally.

### 9 — CTA & Conversion Alignment (5%)

Is there a CTA in the body rather than only in the footer? Is it relevant to the topic and
placed after the problem is established? Does it point somewhere specific rather than the
homepage? Is there a missed opportunity — an article about a feature that never mentions the
feature? Bottom-of-funnel topics get a direct trial or signup CTA; top-of-funnel topics get a
soft CTA to a relevant guide.

### 10 — Factual Accuracy (10%)

Verify every specific claim the draft makes. Wrong facts damage E-E-A-T and, in regulated
categories, create real exposure.

Build the check list from your own domain. In a regulated category it covers at minimum:
regulatory claims (attributed, or flagged), tax treatment, any performance or returns claim
(these need qualification and a risk disclaimer — unqualified return claims are a red flag),
third-party product names and how their features are described, your own product's capabilities
(does it actually do what the draft says), and any time-sensitive operational detail like
trading hours, schedules or pricing.

If a claim cannot be verified from available context, mark it "unverified — requires
confirmation before delivery" and resolve it or raise it explicitly. Do not penalize blindly,
and do not let an unverified claim ship silently.

---

## Output format

```
## Content Quality Report
**Content:** [title or file name]
**Target keyword:** [detected keyword, or "not identifiable"]
**Evaluated:** [date]

| Dimension | Score | Weight | Weighted |
|---|---|---|---|
| ... one row per dimension ... |
| **TOTAL** | | | **X.X / 10** |

**Grade:** Publish-Ready (8.5–10) / Needs Revision (7.0–8.4) / Major Rewrite (5.0–6.9) /
Do Not Publish (below 5.0)

### Dimension-by-dimension findings
[2–4 sentences each; quote the specific text you are calling out]

### Cannibalization risk for this article
[see below]

### Priority action list
Ranked by impact, maximum 8 items, each CRITICAL / HIGH / MEDIUM and each a specific fix.
```

Re-review appends inside the same file:

```
## REVISION CHECK — [date]
**What changed:** [1–2 sentences]
| Dimension | Prev | Now | Δ |
**Resolved:** … **Still open:** … **New findings this round:** …
```

---

## Keyword cannibalization check

Run this on **every** single-article evaluation, and as a standalone audit on request.

Two or more pages targeting the same primary keyword compete with each other. The search engine
splits authority between them and often ranks neither well. On a large inventory with
overlapping topics this is a live risk, and a new draft that duplicates an existing post is
net-negative for the site even when the draft itself is good.

**How to detect it**

1. Identify the draft's primary keyword from the title, H1, meta title or slug.
2. Read `reference/content-inventory.md` in full. Cross-check the CMS export if it looks stale.
3. Scan for overlap, using four signals: **direct keyword overlap** (another title or meta title
   carries the same keyword or a near-synonym); **slug overlap** (two slugs share the core term);
   **tag overlap** (same specific tag *plus* title similarity — broad tags alone mean nothing);
   **topical cluster collision** (same searcher question from marginally different angles with
   no clear differentiation).
4. Classify each pair: **Exact** (identical keyword phrase, critical) / **Near-exact** (same
   topic and intent, different phrasing, high) / **Topical overlap** (same broad topic,
   different angle, medium) / **Tangential** (related, clearly different intent — note only).

**Full-audit mode.** Read the inventory, group everything into topic clusters derived from the
site's own tags and title patterns, find pairs within each cluster, and report per cluster with
a health verdict. For each group, state which page to keep as canonical (usually the deeper,
better-optimized, or older one) and the fix: consolidate and redirect the losers, differentiate
by rewriting the H1 and intro to target a subtopic, or `noindex` the thinner duplicate. Save
full-audit output to `work/04_Analysis/`.

---

## Batch mode

Evaluate each item individually, then output a batch summary table and — the most valuable part
— a **systemic issues** list of every problem appearing in three or more pieces. A fix applied
to the writing process removes that problem from every future draft.

---

## Hard rules

1. **Never inflate scores.** A 7 means genuinely good. An inflated self-score just moves the
   problem to the reviewer.
2. **Quote the specific text** when calling out generic phrasing or an error.
3. **Priority actions must be specific.** "Improve the content" is not an action.
4. **Do not evaluate boilerplate.** Article body only.
5. **State the target keyword explicitly before scoring.** If you cannot identify it, that is
   itself a finding.
6. **Look for real product specifics.** Their absence in a brand's own content is a strong
   authenticity signal to penalize.
7. **Always run the cannibalization check** on a single article, and **read the inventory before
   claiming no conflicts** — never skip it because the keyword seems unique.
8. **Always run the competitor search before scoring dimension 8.** Do not score it from memory.
9. **Flag factual uncertainty explicitly** rather than guessing.
10. **Internal-link suggestions must be real pages** from the inventory. Do not invent URLs.
11. **Never create a second review file for one draft.** Re-reviews append.
12. **Don't submit a draft below Publish-Ready.** If a blocking issue genuinely needs a
    stakeholder decision — author attribution, an unverifiable product claim — raise that one
    item explicitly rather than shipping it unmarked.
