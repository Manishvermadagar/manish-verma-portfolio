# Workflow

How an engagement runs end to end, and how the recurring work runs once it is going.

The shared principle: **nothing reaches a stakeholder without passing a review gate first**, and
every gate writes to a single running log rather than scattering per-task files.

---

## Phase 0 — Standing up the project

```
/setup  →  fill in CLAUDE.md  →  build the content inventory  →  BACKLOG.md
```

1. Copy this folder into a new project directory for the site you are auditing.
2. Copy `CLAUDE.md.template` to `CLAUDE.md` and fill in every placeholder: the site, its markets,
   the data sources you have, and the facts already known.
3. Copy `.mcp.json.template` to `.mcp.json`, read it, restart Claude Code.
4. **Run `/setup`.** Do not start analysis until it verifies with live queries that return rows.
   A session that skips this produces confident analysis built on no data, silently.
5. Create `BACKLOG.md` — a priority-ordered list of outstanding work with explicit blockers.
   `/next-step` reads it every session.

---

## Phase 1 — The audit

Work `AUDIT_FRAMEWORK.md` parts 1 to 9 in order. The ordering is the point: parts 1–3 establish
what is happening, parts 4–6 assess the work already done, parts 7–9 find what is structurally
blocking growth. Optimising a page before you know whether it can be crawled is wasted effort.

- Start with `checklists/audit-kickoff.md`.
- Write each part as its own document under `work/04_Analysis/`, with every number dated and
  sourced.
- Part 3 produces `reference/content-inventory.md`. Keep it. Almost every later part and every
  content skill reads it.
- Part 7 uses `checklists/technical-seo-crawl.md`.
- Finish with the **Reconciliation** practice at the end of the framework: check every finding
  against live production, not against your notes. Expect to find items marked fixed that were
  never deployed, and expect to withdraw one or two of your own findings in writing.

Everything that leaves your hands passes `/delivery-review` first.

---

## Cycle 1 — Topic proposals (per batch)

```
Draft topic list  →  /blog-topic-analysis  →  rework below-bar topics  →  /write-client-mail  →  approval
```

1. Build the proposed topic and keyword list.
2. **Run `/blog-topic-analysis`.** Eight weighted dimensions: intent fit, demand and ranking
   feasibility, business relevance, cannibalization risk, SERP landscape, differentiation,
   E-E-A-T and regulatory risk, title quality.
3. Cannibalization is checked against `reference/content-inventory.md` **and within the proposed
   batch itself** — two topics in one sheet can compete with each other just as easily as with a
   published page.
4. Rework or drop anything below the bar **before** it goes out. A sheet where most items score
   poorly costs a full approval round-trip.
5. Scoring lands in `work/01_Topic_Proposals/Topic_Scoring_Log.md`, one dated section per batch,
   newest first.
6. Send with `/write-client-mail` in batch mode.

Where the site sits in a regulated category, flag it at this stage. Topics implying guaranteed
outcomes, specific financial returns, or professional advice carry real risk, and the E-E-A-T
dimension exists to catch them before anything is commissioned.

---

## Cycle 2 — Content drafts (per draft)

```
Draft  →  /content-quality  →  revise  →  /delivery-review  →  /write-client-mail (single-item)
```

1. Place the draft in `work/02_Drafts/`.
2. **Run `/content-quality`.** Ten weighted dimensions plus a cannibalization check.
3. Output is `work/02_Drafts/<slug>_REVIEW.md`.
4. Fix what it found, then re-run.
5. **On a revision, append to the same review file** as a dated `## REVISION CHECK` section.
   Never create a second review file — how a draft evolved is part of its record.
6. **One mail per draft, never batched.** Reply on the thread the draft was submitted on, with
   the review attached as a PDF via `/pdf-report`.
7. Use `checklists/content-brief.md` when commissioning, not only when reviewing. A finished
   draft is the most expensive point at which to discover the topic was wrong.

---

## Cycle 3 — Periodic report

```
Build  →  /report-qa  →  fix  →  /delivery-review  →  /write-client-mail  →  send  →  verify delivery
```

1. Build from live data: `gsc` for search performance, `analytics-mcp` for traffic and
   conversions, your backlink tool for authority, the CMS export for content activity.
2. **Run `/report-qa`.** Verifies every figure against its live source, checks internal
   consistency (summary against detail, totals against rows, one reporting period throughout),
   and scores against a completeness checklist.
3. Fix what it finds. Log the pass in `work/03_Reports/Report_QA_Log.md`.
4. **Run `/delivery-review`** as the final gate against `DELIVERY_QUALITY_LEDGER.md`.
5. Send via `/write-client-mail`, then **read the delivered copy back** to confirm attachments
   and signature actually landed. A send tool's success response is not the delivered artifact.
6. `checklists/monthly-report.md` and `checklists/pre-delivery-review.md` are the paper versions
   of steps 2 and 4.

### Reporting standards worth internalizing

These come up every cycle, and getting them right the first time avoids the round-trip.

- **State the source and date range for every number.** Never a bare figure.
- **Name the rank-tracking tool** and attach its raw export.
- **Never report rank alone.** Include impressions, clicks and CTR beside it. Rank on its own
  cannot distinguish a keyword with no visibility from one with heavy visibility converting
  badly, and those need opposite fixes.
- **Report net-new backlinks, not gross totals**, with page-level authority per placement rather
  than the root-domain score of a shared hosting platform.
- **Give every claimed activity a count and a citation.** No "several" without a number.
- **Break out branded versus non-branded.** Where branded queries dominate, a headline click
  figure mostly reflects existing brand awareness rather than new discovery.
- **Reconcile summary figures against detail tables before sending.** `/report-qa` checks this,
  but it is cheaper to get right while writing.

---

## Ad-hoc analysis

Goes in `work/04_Analysis/`. If it produces an outbound claim, it still passes `/delivery-review`
first. Mail is logged in `work/04_Analysis/Correspondence.md`.

---

## End of session

Run `/update-context` to record decisions and status changes, then `/session-handoff` to write
the summary. The next session starts with `/session-handoff` in READ mode, then `/next-step`.

---

## Where the ledger fits

Every gate above feeds `DELIVERY_QUALITY_LEDGER.md`. When a review catches a mistake, the
mistake is written into the ledger **before** it is fixed, and the entry carries a runnable check
that would have caught it. That is what makes the next cycle cheaper than this one.

The same discipline, generalized beyond SEO work, is in
[`../evidence-discipline/`](../evidence-discipline/).
