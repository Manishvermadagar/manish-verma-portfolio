# Designing Guardrails Into a Tool That Acts Without You

A browser extension that performs repeated admin work at volume — read an item,
judge it against a ruleset, act on the judgment, log it — a few thousand times.

The actions are real, mostly irreversible, and reach real people — approvals,
rejections, emails. That is what shaped the design.

---

## The responsibility transfer

Most AI-assisted development happens inside an assistant's own safety layer.
That layer is conservative about repeated writes to production systems, and it
is right to be — it is a sensible default, and it protects against the class of
condition that scales badly.

A tool that performs its actions outside that loop does not inherit the
protection. It also does not inherit the responsibility — **which is why the
responsibility has to be picked up explicitly.**

So before building it, I went through what that safety layer was actually
protecting against, and built each protection in deliberately:

> Staged rollout. Rate limits. Audit logging. Human review of a sample before
> scaling.

Those are written into the design document as **"required, not configurable
away."** The scope doc says it plainly: *"the classifier isn't there to enforce
this anymore, so it has to be self-enforced."*

The supervisor was carrying a real risk. Once it is out of the loop, that risk
is yours.

---

## The eight guardrails

1. Dry run is the default. A full pass logs every intended action and submits nothing. Live execution begins only after a human reviews a dry-run sample.
2. **Deletion-only edits, enforced in code.** See below — this is the important
   one.
3. Escalation is a real branch, not a prompt instruction. Cases the system cannot verify are skipped and routed for manual review by the engine itself.
4. Resumable, append-only logging. Every processed item and outcome is recorded before the next item is handled. On restart, recorded state is checked before work resumes.
5. **Circuit breaker.** N consecutive error conditions auto-pause the run and
   surface why, rather than allowing the run to continue without intervention
   through the rest of the queue.
6. **Rate limit.** A delay between items, because *"this is a real backend
   serving real users, not a sandbox."*
7. **Visible kill switch.** Start, pause and stop always reachable. **No
   fire-and-forget mode for live runs.**
8. Staged rollout. Run a dry pass, go live on a small sample, review the result, then scale.

---

## Make the dangerous thing structurally impossible

The requirement was to preserve the original text except for permitted removals.

The obvious implementation is to tell the model that. The learning was that a
prompt instruction alone does not provide the required guarantee:

> If the model rewrites anyway, you get back plausible-looking output and **no
> signal at all.** Nothing visibly stops. You may only discover the change when
> it is reviewed later.

So the model never returns edited content. It returns structured instructions
for permitted removals, and the tool applies the edit itself.

> This makes "the model quietly rewrote something else" **structurally
> impossible, not just discouraged by the prompt.**

The difference matters because a request can be ignored and a structure cannot.
A model told not to rewrite can still return rewritten content without an
explicit signal. A model that only returns line numbers has nothing to rewrite
with.

The same reasoning produced guardrail 3: escalation had to be a code branch,
because as a prompt instruction it is *"something the LLM might ignore."*

---

## Two layers, and the separation is real

The engine knows nothing about any particular task. Task-specific rules and actions sit outside the engine, so a new task can be added without changing the engine itself.

The proof that it works is not the claim, it is the fork: the same engine was
later reused for a completely different task on a different site, with no engine
changes.

**What I learned about where the separation is incomplete:** the verdict
vocabulary did find its way into the engine, for counter bucketing, and the same
resolution rule now exists in both the engine and the task config. The
separation is real — no endpoints, no field names, no site knowledge — but it
is not total, and I would remove that duplication in a future iteration.

---

## No model client, no API key, no billing surface

The extension contains no LLM client at all.

Analysis happens in a separate reasoning session via a shared folder: the
extension writes out a batch of harvested items, the session reads it and writes
verdicts back, and **the extension performs the writes itself.**

**The cost of this is stated in the design document, at design time:**

> "This makes the pipeline session-driven, not unattended-autonomous. A batch
> only advances when a session is actively open and asked to process it. That's
> the deliberate trade-off for zero API cost and zero extra credential to
> manage."

What falls out: no API key to leak, no external model calls, no per-item cost.

---

## Credentials used without ever being held

- **The session cookie is never read or stored.** The browser attaches it
  automatically to same-origin requests. The tool uses the authenticated session
  without ever touching the credential.
- **Host permissions are scoped narrowly per task**, not a blanket grant across
  all sites.
- **Never published.** Loaded unpacked, local use only. No store listing, no
  distribution.

---

## What I learned to check behind a clean result

An image-detection check came back clean across an entire **multi-thousand-item
batch.** No images found anywhere. Nothing signalled an issue. A clean result
reads as good news.

I learned that the detector was not actually observing the condition it was
meant to detect.

An edit had written a **real backspace character** into the source, in place of
the two characters that spell the escape sequence. The pattern was therefore
matching nothing at all — and **a terminal renders a backspace invisibly, so the
source code looked correct on inspection.** The source differed on disk while
appearing correct on screen, with no visible signal in the output.

A second learning from the same period had the same shape: paginating through a
queue while other people were modifying it dropped roughly a third of the
items. The visible symptom was duplicate identifiers. **The important learning
was that the missing items were silent.**

The self-test file now opens with the rule both produced:

> A detector that returns "nothing found" is indistinguishable from a detector
> that is not observing the condition it is meant to detect. Nothing may signal
> an issue, and a clean result can read as good news. **Run this before any
> harvest. It stops visibly rather than returning zero.**

Any check that can return "all clear" needs a known-positive case proving it
can still return "found something".

---

## One reader for a field that exists in two forms

The content existed in two forms: raw as stored, and decoded for reading. They
are not interchangeable — writing back the decoded form silently rewrites the
author's stored text.

Three decisions:

- **One reader**, used by both the harvest side and the act side, so the two can
  never drift apart.
- It exposes **raw** and **decoded** as separately named fields and
  **deliberately exposes no ambiguously-named third field** — a caller has to
  say which one it means.
- **A self-test asserts that the ambiguous field is absent.** Not a comment
  asking for it. A test that fails.

Before acting, each edit is validated against the stored source. The write refuses to run if any edit cannot be validated.

---

## The state of this page

**This is the method, not the code.** The engine is written to be generic and it
was reused, but publishing it as a runnable tool needs a worked example task
against a site nobody owns. The existing task configuration is tied to a
non-public environment and cannot ship.

The learning from the portfolio's first version was that publishing a system
without the piece that makes it runnable does not provide a useful demonstration
of the work. So this stays a method write-up until the demo task exists, rather
than presenting it as something readers can run.
