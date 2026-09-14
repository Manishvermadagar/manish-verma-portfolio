---
name: update-context
description: Capture decisions, findings, and changes from the current session into CLAUDE.md, BACKLOG.md, and DELIVERY_QUALITY_LEDGER.md. Use when the user says "update context", "sync context", "update CLAUDE.md", or wants the session's outcomes recorded so they survive into future sessions.
---

# Update Context

Review the session and record anything durable that is not already written down. The test for
durable: **would a future session be worse off for not knowing this?** If it only mattered to the
conversation just had, leave it out.

## Where each kind of thing goes

| What you learned | Where it goes |
|---|---|
| A new site fact, or one that contradicts an existing one | `CLAUDE.md` → "Standing facts" |
| Work started, finished, blocked, or newly identified | `BACKLOG.md` — update status **in place** |
| A decision the stakeholder made, or one still needed | `BACKLOG.md` → "Open decisions" |
| A mistake pattern in a deliverable | `DELIVERY_QUALITY_LEDGER.md` — new instance, or a new pattern |
| A change to how the work runs | `CLAUDE.md` → "Working style" |
| A setup step that was wrong or incomplete | `docs/SETUP.md` |
| A change to the recurring cadence | `docs/WORKFLOW.md` |

## Rules

1. **One source of truth per fact.** If something is already documented, **update it in place**.
   Never add a second copy elsewhere. Two copies drift, and then nobody knows which is current.
2. **Correct, don't append, when something turns out wrong.** A superseded fact gets fixed where
   it lives, not contradicted in a new paragraph further down.
3. **Verify before recording a status.** Don't write "X is done" because the session discussed
   it. Check the file, the live page, or the data.
4. **Date-stamp every standing fact.** A fact with no date cannot be aged out, and standing
   context files are the usual carrier for a claim that quietly stopped being true.
5. **Don't record what the repo already shows.** File structure, git history, and data readable
   directly do not need restating in `CLAUDE.md`.
6. **Keep site facts factual.** They are working context for analysis — state them neutrally with
   the evidence behind them, not as commentary.

## Process

1. Re-read the session for decisions, findings, corrections, and status changes.
2. For each, check whether it is already documented, and whether the existing version is now
   wrong.
3. Make the edits.
4. Report back a short list of exactly what you changed and where, so the user can check it.
