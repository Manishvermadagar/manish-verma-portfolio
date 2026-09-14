---
name: session-handoff
description: Write a structured end-of-session summary to docs/sessions/HANDOFF.md, or resume from the last one at the start of a new session. Use when the user says "session handoff", "wrap up", "hand off", "resume", "catch me up", or "pick up where we left off". Manual only — never run automatically.
---

# Session Handoff

Two modes. Work out which from context; ask if genuinely ambiguous.

---

## WRITE mode — end of a session

Produces `docs/sessions/HANDOFF.md`.

### The rule that governs this mode

**Never blind-overwrite the existing handoff.** Read it first and reconcile every carried-forward
item. An item is dropped only when you have **verified** it is complete — either explicit
evidence from this session, or an actual check against the repo. When uncertain, **keep it**.

Silently dropping an unfinished item is the failure this rule exists to prevent: the next session
inherits a handoff that looks complete, and the work is simply lost.

### Structure

```markdown
# Session Handoff — <date>

## What happened this session
Concrete outcomes. What changed, what was decided, what shipped.

## Current state
Where things actually stand right now. Anything mid-flight, and exactly how far it got.

## Deferred / open
Carried forward from the previous handoff plus anything new. Each item says what it is blocked
on. Only remove an item when verified done — note how it was verified.

## Pick up here
The single most sensible next action, with the skill that does it.
```

### Before writing

- Read the existing `docs/sessions/HANDOFF.md` if present.
- Cross-check `BACKLOG.md`. If the session changed an item's status, update the backlog too. The
  two must not disagree.
- Check `work/` for anything left half-finished and name it explicitly.

---

## READ mode — start of a session

1. Read `docs/sessions/HANDOFF.md`.
2. **Verify its claims rather than trusting them.** A handoff is a point-in-time snapshot and may
   be stale. Spot-check anything it says is done.
3. Summarize briefly: where things stand, what is open, what it suggests doing next.
4. Then hand off to `/next-step` for the actual proposal, so the recommendation reflects current
   repo state rather than what the last session believed.

---

## Notes

`docs/sessions/HANDOFF.md` holds the **latest** snapshot only. It is machine- and
session-specific by nature — treat anything in it about local paths or tooling as true of
whichever machine wrote it, not universally.
