# Turning an Implicit Hiring Process into an Explicit One

I had been hiring for a client-facing technical support role for a while, and
my process worked. The learning was that the process itself still lived largely
in my head.

I recorded my judgments as free text. That was enough to decide with, and not
enough to examine, delegate, improve or defend. This is what I learned when I
made my own process explicit.

**The most useful thing here is the first section.** The scoring model is fine;
the funnel analysis is the part I would want someone else to steal.

---

## Start by reading your own past decisions

Before designing anything, I went back and coded **every free-text rejection
comment I had ever written** — 87 of them — into categories.

Two findings came out that no individual comment showed.

### A quarter of my rejections were not about the candidate

The single largest category was some version of *"they currently earn more than
this role pays."* Combined with "over-qualified", **about 25% of all rejections
were compensation mismatch, not candidate quality.**

Those candidates were never going to accept the rate on offer. I was putting
them through screening anyway, and spending real effort to reach a conclusion
that one question at the top of the form would have reached for free.

That is a funnel-design problem. It was invisible until the reasons were
counted rather than read.

A further **14%** were process failures rather than judgments — a missing video,
a video without sharing permission, a form link pasted where a recording should
be. That is a seventh of all commentary spent on people who were never actually
evaluated, and most of it disappeared by changing when the recording is asked
for.

### I learned that my most-used criterion needed to be made explicit

The reason I reached for most often was *"reading from a script"* — rehearsed,
inauthentic delivery. It appeared **more often than trading knowledge and
communication quality combined.**

It was also entirely unstructured: a gut read on a video, recorded nowhere,
defined nowhere, calibrated against nothing.

That taught me that a criterion driving hiring decisions needed to be explicit
and measurable. So it became an explicitly scored dimension.

I started by coding the decisions already made rather than designing the process
from scratch. The dominant criterion turned out to be undocumented, and the
second-largest filter belonged earlier in the process.

---

## Separate "can they write a resume" from "can they do the job"

The screening tool produces two numbers, and **deliberately does not add them
together.**

One measures **resume quality** — is the document parseable, does it avoid
filler phrasing, do the bullets carry specifics. That is a real signal about
something. It is not a signal about this job.

The other measures **fit** — overlap with the requirements actually named in the
posting, each weighted.

Summing them would have been one line of code and would have meant **ranking
applicants by how well they write resumes.** I was not hiring a resume writer. So
the quality score is computed, reported, clearly labelled, and excluded from the
ranking.

Most screening scores measure document quality, and most of them get used as if
they measured suitability.

---

## A missing keyword is evidence, not proof

The requirement checks are keyword-based, which means they are weak evidence and
have to be treated that way.

> A miss means "not evidenced on this resume". That is a **prompt to ask on the
> call** — never an automatic rejection.

A keyword miss can reflect how someone described their experience rather than
whether they have the capability. Someone who did the work and described it
differently gets filtered out, and nobody ever finds out.

Reversing it costs almost nothing. A miss generates a question for a human
instead of a decision by a machine.

---

## Check that your scoring artifact does what it says

The scorecard had six assessment dimensions, and the tab was labelled
*auto-calculated from the assessment*.

I opened the workbook. It contained **four formulas**, all on one tab, **none of
which read the assessment data.** The six dimension scores were being entered
by hand.

The scores themselves were real and someone was computing them. The learning
was that the label described a calculation that was not running, while someone
inheriting the sheet could reasonably take the label at face value.

So the documented model records the mapping as **a proposal, not something the
sheet implements**, and says what a future formula should do.

---

## Some answers should override the total

The model scores 150 points across form and interview. Certain single answers
reject regardless of the total:

- Choosing to wait on a ticket during a live, urgent client situation
- Blaming external factors for one's own error
- Choosing to do nothing about a discovered security problem
- Arguing with an angry client rather than handling them
- Open answers that are generic, with no real personal example
- **A self-rating of 4–5 on a trait where the candidate's own supporting
  example contradicts the rating**

A weighted total lets strength in one area compensate for a disqualifying answer
in another. These are the things that must not average out.

That last one is my favourite, because it needs no external evidence. It catches
self-assessment inflation using the candidate's own words against their own
claim.

---

## Score specificity, not sentiment

> A real, named, concrete example scores. A generic statement of values does
> not.

One line, and it is the difference between an assessment that measures what
somebody has done and one that measures how fluently they talk about values.

---

## Use the research, and say what it does not cover

The assessment design is built on published selection psychology rather than
intuition — current meta-analytic work on what actually predicts job
performance, the evidence on structured biodata, and the literature on how
situational judgment tests get gamed by candidates who can spot the desirable
answer.

That is a genuine improvement on guessing.

**And it does not transfer cleanly, which is worth saying out loud:**

> None of those validity figures come from a sample resembling mine — not the
> country, not the industry, not the company size, not the role. They are the
> best available general evidence, which beats intuition. But the pilot matters
> more than any published number. **If the new instrument cannot separate the
> candidates I already have, it has not met the pilot bar I set.**

That is a falsifiable bar, set before the result was known. Research used
honestly narrows your uncertainty; it does not settle the question.

The design also names **a construct deliberately not measured**, on the evidence
that it does not predict what it is popularly believed to predict. Choosing what
not to measure is part of the work.

---

## What this produced

- An implicit process made explicit: a documented scoring model, a coded
  rejection taxonomy, an interview question bank, and a research-backed
  assessment.
- A funnel finding that changes recruiting economics — a quarter of rejections
  were compensation mismatch, fixable with one question.
- A criterion that had been driving decisions invisibly, made explicit and
  scored.
- Tooling across the cycle: form building, recipient and exclusion lists, stage
  emails, call confirmations, and candidate sourcing with duplicate suppression
  and address validation before send.

---

## What I learned while building the methodology

**A documented model should distinguish clearly between what is proposed and what
is already implemented.** The calculation was documented as a proposal rather
than represented as automated, because the workbook did not yet implement it.

**A falsifiable pilot bar should be followed by the evidence needed to assess
it.** The pilot bar was set before the result was known. I am not publishing the
result here, which reinforces the importance of carrying a defined test through
to the evidence that would allow the result to be assessed.

**A control is only as reliable as the cases it actually covers.** The rule
covered the data sources I expected, but not every format that could contain the
same information. I broadened the control to cover the additional cases.
