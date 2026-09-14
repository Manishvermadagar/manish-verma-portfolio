# Writing Rules for Outward Communication

How a finding is phrased decides how it is acted on. These rules exist because each of them was
broken once, in something someone senior read.

---

## 1. Predicted impact is stated as prediction

Where the thing being described has not reached its audience yet, everything written outward is
**predicted** impact, in future tense. Never observed demand.

> "Users who set this will see the default applied silently" — prediction, correct.
> "Users are asking for this" — a claim about the world, and unsupported.

The distinction matters because the two produce different decisions. A prediction invites a
judgment call about likelihood. An observation invites resourcing. Presenting the first as the
second is how a team ends up building for demand that was never measured.

Where a real observation exists, it names its denominator: "two of nine testers", not "testers
are saying". An individual's view must not become a population's between the analysis and the
summary. Check the summary against the analysis on exactly this axis before it goes.

---

## 2. The subject of the sentence is the user, not the reporter

Not "my feedback", not "I found", not "we noticed".

> "Setting the value to X and saving produces Y, which costs the user a full re-run."

The finding is not the news. The effect is. Writing yourself into the sentence makes the
deliverable about the reviewer's activity rather than about the thing under review, and it
invites a discussion of your process instead of a decision about the problem.

This is not modesty. It is the difference between a document that gets acted on and a document
that gets replied to.

---

## 3. Every behavioural claim carries a state stamp

> *State as at 14 March, 16:00.*

Anything you assert about how a system behaves is a claim about a moment. Where the system is
changing during the work — and in any active project it is — a claim without a timestamp will
eventually be read after it stopped being true, without the context needed to understand when the
observation was made.

With the stamp, a later mismatch can be understood in the context of its timestamp. Without it,
the reader has less information to distinguish current state from historical observation.

Say once, in the document, that the thing under description is changing. Then stamp the claims.

Never infer absence from a single observation of a conditional interface. Reach the state where
the thing would appear, and look there.

---

## 4. Drafts are reviewed individually, never batched

One item, one message, reviewed and approved on its own, sent, logged — all the way through —
before the next one starts.

Not because batching is untidy, but because of what it does to attention. Approving five drafts
in one pass means the fifth gets a fraction of the scrutiny the first did, making it more likely
that important distinctions receive less review. It also tangles five independent decisions into
one reply thread, so the reader cannot approve one and query another without unpicking the
message.

The corollary at tool level: **never auto-send.** Every outbound message is presented in full and
approved individually. A general go-ahead, a standing approval, or a prior yes on a different
message never counts. In the [SEO toolkit](../seo-audit-toolkit/) this is enforced mechanically
by a PreToolUse hook in
[`.claude/settings.json`](../seo-audit-toolkit/.claude/settings.json) that requires manual
approval for any mail-sending tool, even when the session is otherwise running with permission
prompts bypassed.

---

## 5. Write for the person who has to act, not for yourself

Instruction fields belong to their reader. No internal codes, no build numbers, no cross-task
shorthand, no jargon that a clause could replace. Every number in a reader-facing field must be
reproducible from what that reader can see.

**Rewrite the field; never append a correction to the end of it.** Appending puts the newest and
most important instruction last, and leaves the superseded text where it will be read first.

Read it back as somebody who has seen none of the work behind it. Does it say what to do, and
what counts as done?

---

## 6. Verify the delivered artifact, not the send

A send tool returns success. That tells you the request was accepted. It does not tell you what
the recipient sees.

Read the sent copy back and confirm it rendered — the attachment is attached, the signature is
present, the formatting held. A message can be drafted correctly and still fail to render for the
recipient, and inspecting the delivered artifact is the only way to know.

Which is the same rule as everything else here: **verify against the system of record, never
against the tool's own success message.**
