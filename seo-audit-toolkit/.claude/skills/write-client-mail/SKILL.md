---
name: write-client-mail
description: Draft a to-the-point stakeholder email from a completed internal analysis — a performance report, a topic-proposal sheet, a content draft submission, or an ad-hoc finding. States what was done, what was found, and what decision is needed, with the detailed write-up attached rather than duplicated in the body. Batch mode for multi-item mails, single-item mode for one deliverable per mail. Never auto-sends.
---

# Stakeholder Mail Writer

Turn a completed piece of internal work into a concise, scannable email. The recipient reads the
body as the primary source; the attachment is the backing detail, not the deliverable. The body
carries enough substance to be acted on without opening the attachment, while staying short
enough to read in under a minute per item.

Every mail answers three questions, in this order:

1. **What was done** — the work completed in the period or on the item.
2. **What was found** — the result, with concrete evidence: numbers, dates, page or keyword names.
3. **What is needed from the recipient** — an explicit decision or action, per item.

Two modes:

- **Batch mode** — many items in one run (a periodic report, a topic sheet, a multi-page finding
  set). One mail, one numbered section per item.
- **Single-item mode** — one deliverable per mail (one content draft, one standalone finding).
  One item, one mail, always. Never bundle several drafts into one message, even if they were
  finished the same day.

## Inputs needed before drafting

1. **The source analysis.** A completed report, draft, or analysis with per-item findings and a
   verdict, under `work/`. Read it in full before drafting. **If no completed analysis exists,
   stop and ask what the mail should summarize.** Never invent findings, numbers or statuses to
   fill the template.
2. **The recipient and thread.** Check `work/04_Analysis/Correspondence.md` and the mailbox for
   the live thread this belongs to — subject convention, To/Cc list. A reply belongs on the
   thread the item was originally raised on, not a fresh one.
3. **The identifying fields for each item.** Topics: target keyword *and* proposed title.
   Drafts: title *and* slug. Technical findings: URL *and* the specific issue. Metrics: metric
   name *and* the exact date range. Label **both** explicitly — a keyword and a title are not
   interchangeable, and a number without its window is not verifiable.
4. **Source and date range for every number.** If the source analysis does not state one, get it
   before drafting rather than quoting the figure bare.

## Batch mode

```
Subject: [Report/batch name] — [the shape of the news, e.g. "June Performance Summary" or
          "10 Topics Proposed — 4 Need a Decision"]

Hi [name],

[2–3 sentences: what this covers, the period or scope, and the headline result. No preamble
beyond this.]

[Anything blocking the rest of the work — an open approval, missing access, a decision owed —
goes here, ABOVE the per-item breakdown:]

FLAG — [label]. [1–2 sentences: what is blocking, and what unblocks it.]

---

### 1. [Item name] — [STATUS]
**[Field 1]:** [value] · **[Field 2]:** [value]
- [What was done or found — one bullet, one sentence, evidence inline: the figure, the window,
  the page or keyword.]
- [Max 3 bullets total]
- **Ask:** [the exact decision needed — approve / confirm X / provide Y / choose A or B]

### 2. [Item name] — [STATUS]
… same shape every time, no exceptions

---

**Net:** [one sentence: what moves forward, what is on hold, what waits on the recipient.]

Full detail and methodology: attached ([Filename].pdf).

Thanks,
[signature]
```

## Single-item mode

One item, one mail, always. **Process one item fully before starting the next** — finish, draft,
get approval, send, log — rather than queuing several mails to send in a batch afterwards. This
keeps each item independently reviewable and repliable.

```
Subject: [Item title] — Draft for Review

Hi [name],

[1–2 sentences: what this is and the one thing most worth knowing.]

[FLAG here if something must be confirmed before this can be finalized.]

---

**Target keyword:** [keyword] · **Proposed slug:** [slug]

**Summary** (4–5 bullets, highest impact first):
- [Specific: word count, sections covered, internal links added, the demand figure with its
  source and window.]

**Ask:** [the exact action needed.]

---

Full detail: attached ([Filename].pdf).

Thanks,
[signature]
```

## Signature — required on every mail, mechanically verified

The sender's HTML signature lives at `Email_Signature.html` in the project root. This is a hard
gate with two checkpoints, not a style preference to remember. "I included it in the draft I
wrote" is not sufficient.

- **`htmlBody`:** inline the full contents of `Email_Signature.html` after the closing line.
  Read the file fresh every time; never paraphrase it from memory, in case it changed.
- **`body`** (plain-text fallback): a plain-text rendering of the same signature, derived from
  the same file, not invented.
- If the file is missing or unreadable, **stop and tell the user before sending.** Do not
  substitute a bare sign-off.

**Checkpoint 1 — before calling the send tool.** Re-read the exact `body` and `htmlBody` strings
about to be submitted and confirm both literally contain the sender's name and company line.
Actually re-read the final strings, not your recollection of writing them. Never proceed on the
assumption it carried over from an earlier draft or a previous mail in the same session.

**Checkpoint 2 — after the send tool returns.** Send tools do not echo the final rendered
message. Read the sent copy back from the mailbox (search `in:sent` on the subject, or read by
the returned message ID) and confirm the signature appears in the delivered message. If it does
not, something broke in rendering or transit rather than in drafting — say so immediately. A
signature can be drafted correctly and still fail to render for the recipient, and inspecting
the delivered artifact is the only way to know.

Mandatory for every mail, both modes, with no exception for "the last one worked".

## Style rules

1. **Bullets, not paragraphs.** One point, one bullet, one sentence. A point needing two
   sentences is either two bullets or belongs in the attachment.
2. **Exactly one `Ask:` per item.** "Let us know your thoughts" is not an ask. "Approve for
   publishing, or tell us which of the two titles to use" is.
3. **Cite evidence inline, briefly.** "1,240 impressions, 0.8% CTR, Search Console, 1–30 June",
   not "impressions improved".
4. **Both identifying fields, always**, with bold field names. Never fold one into the other.
5. **Flags before items.** Anything that blocks or reframes the whole batch goes above the
   breakdown, not buried in one item's bullets.
6. **No invented data.** Everything traces to the source analysis. Estimates say so.
7. **Consistent, skimmable status labels** matching the source analysis's own scale. Do not
   invent a new label per item.
8. **The subject states the shape of the news** — the period, the counts, or the stage.
9. **Length discipline.** Past ~4 lines per item, the detail belongs in the attachment. Trim the
   mail; do not lengthen it to fit everything.
10. **Signature is mandatory.**
11. **What was done, what was found, what decision is needed — nothing else.** No filler, no
    restating the brief back, no speculative commentary.
12. **The attachment is referenced, never duplicated.** Copying report sections into the body
    defeats both: the mail stops being skimmable and the attachment stops being the single
    source of detail.

## After drafting

1. **Do not send.** Present the full mail in the chat — subject, recipients, body, attachments,
   signature — not a pointer to a saved file. Append the same draft to
   `work/04_Analysis/Correspondence.md`. **Wait for explicit approval on this specific mail.** A
   general go-ahead, a standing approval, or a prior yes on a different mail never counts.
   Sending is one-way and has a real recipient. The project's PreToolUse hook enforces this at
   the tool level; do not treat the prompt as a formality.
2. **Log every mail as one dated section in one running file**, newest first, tagged DRAFT /
   SENT / RECEIVED and by workstream. Never a file per mail.
3. **Match the existing thread when replying.**
4. **Check the attachment is safe to send.** If the backing document contains internal-only
   material — working notes, unrelated clients, internal cost or resourcing detail, half-finished
   sections — say so and get it cleaned before it goes out. Never assume an internal working file
   is fine as-is.
5. **Generate attachments via `/pdf-report`**, attaching the specific item's write-up rather than
   the whole master tracker.
6. **Verify every generated PDF before treating it as attach-ready**, per `/pdf-report`'s verify
   step. A clean script exit is not a clean document.
