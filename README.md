# Operations Work That Produces Measurable Results

I build systems and processes when an operation cannot reliably see what is
happening, tell whether work is producing results, or catch mistakes before
they reach customers.

The work collected here has avoided **$3,480–$27,600 a year** in software
costs, increased positive customer ratings by **479% in one month**, and found
**21 severity-1 defects** before flawed outputs could reach clients making
real-money decisions.

The projects are different; the work is consistent. Take an important process
that depends on memory, manual effort or unverified assumptions. Make it
explicit. Build the checks around where it can fail. Leave the operation with
something it can measure and run without me.

I work in operations, not software engineering. AI wrote most of the
implementation code behind several of these systems. My work is deciding what
is worth building, designing how the process should work, testing where it
breaks, and deciding what is safe to ship.

---

| | | |
|---|---|---|
| **$3,480–$27,600/yr** | **+479%** | **21** |
| software cost avoided by building in-house | increase in positive customer ratings in one month | severity-1 defects found before release |

Three kinds of outcome: money saved, service improved, and harmful failures
caught before customers saw them. Negative ratings fell 67% over the same
period.

I lead operations and customer-facing work at a software company.

---

## What I changed

**Built an operations platform instead of buying one.**
Consolidated operational tooling into a production platform that created
auditable records and measurable workflows, while avoiding an
estimated $3,480–$27,600 a year in software costs.
→ [The case study](operations-hub/)

**Found serious defects before clients acted on bad results.**
Audited a pilot system used to generate trading results, finding 21
severity-1 defects and eight mis-detected strategy templates that were
subsequently marked fixed. These are outputs clients rely on to make
decisions.
→ [The method](evidence-discipline/)

**Made a review process fast enough to keep up, without removing the
judgment.** Cleared an accumulated review backlog across two working days at a
median of 3.6 seconds an item, escalating every ambiguous case to a human
rather than deciding it, and refusing 73 items outright rather than acting on
them uncertainly.
→ [How it was done](compliance-review-at-volume/)

**Turned customer feedback into operating data.** Built the quality and
feedback loop that increased positive ratings by 479% and reduced negative
ratings by 67% in a month, with 111 chat audits completed at an average quality
score of 85.1%.
→ [The platform behind it](operations-hub/)

**Turned my own hiring judgment into an explicit process, then hired with it.**
Made my screening criteria explicit and repeatable, and used the result to
complete a hire. It also surfaced a compensation-screening
pattern I then moved earlier in the process, removing avoidable screening
effort.
→ [The method](hiring-methodology/)

**Checked a vendor's reporting instead of accepting it.** Built a verification
process that tested an agency's monthly claims against source data, and
defined the reporting format they then had to meet.
→ [The method](seo-audit-toolkit/VERIFYING_AGENCY_REPORTS.md)

---

## How I work

AI wrote most of the implementation code behind several of these systems. I do
not present myself as a software engineer. My contribution is defining the
problem, deciding what to build, designing the workflow and controls, testing
failure cases, and deciding what is safe to ship.

I know basic Python and basic SQL. I can read code and understand what it
does. That is the ceiling, and it is the useful thing to state plainly.

Several of these projects carry a written ledger of lessons from building the
work, with each lesson generalised into a check that now prevents the same
pattern from recurring. Across all of them the recurring lesson is the same: an
operation is not under control merely because its tools say everything worked.

→ [How I work with AI, in full](how-i-work-with-ai/)

---

## Everything here

| Folder | What it is |
|---|---|
| [`operations-hub/`](operations-hub/) | Case study of the internal operations platform — the problem, the architecture decisions and their rejected alternatives, and what I learned while building it. No code; the system belongs to my employer. |
| [`compliance-review-at-volume/`](compliance-review-at-volume/) | Clearing a review backlog without removing the judgment from the process. |
| [`hiring-methodology/`](hiring-methodology/) | Making my own hiring judgment explicit, starting by coding every rejection comment I had written. |
| [`browser-automation-engine/`](browser-automation-engine/) | Designing safety into a tool that performs irreversible actions without a human watching. |
| [`seo-audit-toolkit/`](seo-audit-toolkit/) | A runnable Claude Code project: ten skills, ten slash commands, a permission hook, MCP server config, a setup runbook, the nine-part audit framework, and the [agency-report verification method](seo-audit-toolkit/VERIFYING_AGENCY_REPORTS.md). |
| [`evidence-discipline/`](evidence-discipline/) | The quality system underneath the analysis work: a 17-pattern ledger, a tracked verification loop, and the rules for writing findings someone will act on. |
| [`how-i-work-with-ai/`](how-i-work-with-ai/) | A short essay on the working method. |
| [`BY_THE_NUMBERS.md`](BY_THE_NUMBERS.md) | The figures behind all of it, with charts. |

---

## Contact

[linkedin.com/in/vermamanish111](https://www.linkedin.com/in/vermamanish111)

Licensed MIT. See [`LICENSE`](LICENSE).
