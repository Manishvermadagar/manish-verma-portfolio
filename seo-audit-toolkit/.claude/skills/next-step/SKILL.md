---
name: next-step
description: Orient on the current state of the project and propose the next concrete actions. Use at the start of a session, when the user asks "what should I do", "where were we", "what's pending", or whenever a session would otherwise stall waiting for direction.
---

# Next Step

Work out what should happen next and **propose it** — do not ask an open-ended "what would you
like to do?". The information needed to answer that question is in the repo. Go and read it.

## 1. Is the environment actually working?

```bash
python3 -c "import reportlab" 2>/dev/null && echo "deps OK" || echo "deps MISSING"
claude mcp list 2>&1 | grep -E "gsc|analytics-mcp|gmail"
```

If dependencies are missing or any server is not connected, **that is the next step** — run
`/setup`. Say so plainly and stop here. Everything else produces weaker output on a broken
environment, and analysis built on no data is worse than no analysis.

## 2. What is half-finished?

Unfinished work outranks new work. It is already paid for and closest to delivering value.
Look for:

- A draft in `work/02_Drafts/` with no matching `_REVIEW.md`, or a review with no verdict
- A topic batch in `work/01_Topic_Proposals/Topic_Scoring_Log.md` scored but never sent
- A report in `work/03_Reports/` with no entry in `Report_QA_Log.md`
- Anything logged as drafted but not sent in `work/04_Analysis/Correspondence.md`
- An item marked `IN PROGRESS` in `BACKLOG.md`

## 3. What does the backlog say?

Read `BACKLOG.md`. Respect the priority ordering and the stated blockers. Do not propose an
item whose dependency is still open — proposing a sitemap rebuild before the `noindex` rollout
is the classic version of this mistake, and it actively makes indexing worse rather than just
wasting time.

Note any item blocked on a **stakeholder decision**. If several have piled up, batching them
into one `/write-client-mail` is often the highest-value single action available.

## 4. Where are we in the recurring cycle?

Check `docs/WORKFLOW.md` against today's date. Reporting, topic proposals, and draft reviews
all have a natural cadence; something is usually due.

## 5. Propose

Give the user **1–3 concrete options**, each with:

- What it is, in one line
- Why it is worth doing now — the blocker it clears, the deadline it meets, the value it adds
- **The exact skill or command that does it**

**Recommend one**, and say why. Then ask which to start.

Keep it short — a scannable list, not a status essay. If genuinely nothing is outstanding, say
so directly and suggest the highest-value P1 item from `BACKLOG.md`.

## What not to do

- Don't list the whole backlog back at the user; they can read it. Curate.
- Don't propose work whose dependency is unmet — check the blockers.
- Don't claim something is done or pending without checking the actual file or system. If you
  are unsure of a status, say you are unsure and name what you would check.
- Don't start executing a proposed action before the user picks one.
