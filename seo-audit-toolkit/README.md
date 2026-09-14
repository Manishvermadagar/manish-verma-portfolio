# SEO Audit Toolkit

A runnable Claude Code project for auditing a website's organic search performance, and for
keeping the resulting work honest once other people are doing it.

Clone it, point it at a site you have Search Console access to, run `/setup`, and work the audit.
Nothing here is site-specific. There is no data in this repo and there never should be — see
[`.gitignore`](../.gitignore).

---

## Quick start

```bash
cp -r seo-audit-toolkit ~/projects/my-site-audit
cd ~/projects/my-site-audit

cp CLAUDE.md.template CLAUDE.md      # fill in every [PLACEHOLDER]
cp .mcp.json.template .mcp.json      # read it first; it lists the servers Claude will start
pip install -r requirements.txt

claude
```

Then, in Claude Code:

```
/setup
```

**What `/setup` actually does.** It diagnoses what is already installed, walks you through
creating your own Google Cloud OAuth client, authenticates Search Console, Analytics and Gmail,
and then — the part that matters — runs a **live query against each one and shows you the rows**.

It does that because of a specific learning: a connection can report success even when the account
does not have access to the underlying properties. The servers start. The connection reports
success. Every query can still return nothing, leaving the session to produce confident analysis
built on no data at all. The whole runbook in
[`docs/SETUP.md`](docs/SETUP.md) is organized around checking for that condition.

Once setup verifies, run `/next-step` and it will read the backlog and propose what to do first.

---

## What happens next

[`docs/WORKFLOW.md`](docs/WORKFLOW.md) has the full engagement flow. The short version:

1. **Audit.** Work [`AUDIT_FRAMEWORK.md`](AUDIT_FRAMEWORK.md) parts 1 to 9 in order. Part 3
   produces the content inventory that almost everything downstream reads.
2. **Propose topics.** `/blog-topic-analysis` scores each proposed topic on eight weighted
   dimensions, including cannibalization against the inventory *and* against the rest of the same
   batch, before anything is commissioned.
3. **Review drafts.** `/content-quality` scores a finished draft on ten dimensions and runs the
   cannibalization check again.
4. **Report.** `/report-qa` verifies every figure in a report against its live source.
5. **Gate.** `/delivery-review` checks the deliverable against
   [`DELIVERY_QUALITY_LEDGER.md`](DELIVERY_QUALITY_LEDGER.md), in writing, pattern by pattern.
6. **Send.** `/write-client-mail` drafts it, presents it in full, and never sends without an
   explicit yes on that specific message.

Every learning from a condition found anywhere in that loop goes into the ledger **before** the
work is corrected, with a runnable check attached. That is what makes the next cycle cheaper.

---

## What's in it

| Path | Purpose |
|---|---|
| [`AUDIT_FRAMEWORK.md`](AUDIT_FRAMEWORK.md) | The nine-part audit. Per part: the question it answers, the data you need, what to look for, and what to do about it. |
| [`DELIVERY_QUALITY_LEDGER.md`](DELIVERY_QUALITY_LEDGER.md) | Append-only log of delivery learning patterns, checked in writing before anything ships. The mechanism matters more than the starter patterns. |
| [`CLAUDE.md.template`](CLAUDE.md.template) | Fill-in-the-blanks project context. Carries the first-run setup gate and the working-style rules. |
| [`checklists/`](checklists/) | Short paper checklists for the recurring work — kickoff, crawl, content brief, report, pre-delivery. |
| [`docs/SETUP.md`](docs/SETUP.md) | The setup runbook, with troubleshooting per step. |
| [`docs/WORKFLOW.md`](docs/WORKFLOW.md) | How an engagement runs end to end through the skills. |
| `.claude/skills/` | Ten skills. See below. |
| `.claude/commands/` | A slash command per skill. |
| `.claude/hooks/` | `destructive-bash-guard.sh` — forces manual approval for destructive shell commands even in bypass-permissions mode. Needs `jq`. |
| `.claude/settings.json` | Hook wiring: the destructive-command guard, plus an outbound-mail gate that requires manual approval for any mail-sending tool. |
| `.mcp.json.template` | Search Console, GA4 and Gmail server definitions with placeholder env vars. Shipped as `.template` on purpose — copy it to `.mcp.json` after reading it, rather than having a client auto-start servers you have not looked at. |
| `scripts/md_to_pdf.py` | Markdown to PDF via reportlab's Platypus API, so table cells wrap without misaligning the row. |

### The skills

| Skill | What it does |
|---|---|
| `/setup` | Installs and authenticates everything, then proves each connection with a live query |
| `/next-step` | Reads the backlog and half-finished work, proposes 1–3 concrete actions, recommends one |
| `/blog-topic-analysis` | Scores proposed topics on eight weighted dimensions before they are commissioned |
| `/content-quality` | Scores a finished draft on ten dimensions plus a cannibalization check |
| `/report-qa` | Verifies every number in a draft report against its live source; checks internal consistency and completeness |
| `/delivery-review` | The pre-delivery gate against the quality ledger, in four passes |
| `/write-client-mail` | Drafts the covering mail. Never auto-sends. Verifies the delivered copy afterwards |
| `/pdf-report` | Generates the attachment, and requires you to actually look at a rendered page before sending it |
| `/session-handoff` | Writes or resumes the session handoff, without silently dropping unfinished items |
| `/update-context` | Records durable decisions into the right file, one source of truth per fact |

---

## Where this came from

SEO was not part of my job. I noticed that a lot of money was going into it with very little
visibility into whether it was producing anything, and that the only reporting available came
from the people being paid to do the work. So I learned technical SEO and ran an independent
audit of the company site myself.

That audit ran to nine parts and turned up a long list of real problems. But the useful output
was not the report. It was realising that the audit only had value if it could be run again, by
someone else, to the same standard — including by an external agency I needed to hold to a
defined bar. This toolkit is that: the structure, the working skills, the quality discipline and
the checklists, with everything specific to one site stripped out.

## Using it without a website of your own

Run it against any site you have Search Console access to, including a small personal one. The
framework's value is the ordering: it stops you optimising a page nobody can crawl.

## A note on scope

This toolkit covers auditing and reporting. It does not deploy changes. Anything that touches a
live site — robots directives, redirects, canonicals, structured markup — gets specified here and
implemented by whoever owns the deployment, with verification afterwards.

## Related

The general-purpose version of the quality discipline, beyond SEO work, is in
[`../evidence-discipline/`](../evidence-discipline/).
