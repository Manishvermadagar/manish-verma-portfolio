---
name: setup
description: Set up or repair this project's working environment on a machine — Python dependencies, the gsc / analytics-mcp / gmail MCP servers, Google authentication, and a live verification that each one actually returns data for your site. Use on a new machine, when a skill reports missing data, or when any MCP server stops working.
---

# Setup

Walk the user through making this project functional, **verifying each step with a real call
rather than trusting a success message.** The reference document is `docs/SETUP.md` — this
skill executes it interactively.

## The rule that governs this whole skill

**A connected server is not a working server.**

The failure this exists to prevent: a server that starts fine, authenticates fine, and returns
zero rows, because the Google account that authenticated has no access to the property. There
is no error. `claude mcp list` says Connected. Every query comes back empty, and a session
that does not notice will produce confident analysis built on no data at all.

So: never report setup as complete on the basis of a connection status. Always finish with a
query that returns real rows for the user's own site.

## Step 1 — Diagnose before changing anything

Find out what is already in place, so you fix only what is broken:

```bash
python3 -c "import reportlab; print('reportlab OK')" 2>&1
python3 -c "import pdfplumber; print('pdfplumber OK')" 2>&1
uvx --version 2>&1
pipx --version 2>&1
gcloud --version 2>&1 | head -1
echo "GSC_OAUTH_CLIENT_SECRETS_FILE=${GSC_OAUTH_CLIENT_SECRETS_FILE:-(unset)}"
ls .mcp.json 2>&1
claude mcp list 2>&1
```

Report a short status table of what is present and what is missing, then work only the gaps.

If `.mcp.json` is absent but `.mcp.json.template` exists, the first fix is to copy the
template across, read it with the user, and restart Claude Code so it picks the servers up.

## Step 2 — Access grants come first

Before any technical step, confirm the user's Google account actually has:

- **Search Console** — verified user access on the property for their site
- **Google Analytics 4** — `Viewer` (or higher) on the corresponding GA4 property

Ask them to confirm they can see both **in the browser** while signed in as the account they
intend to use. If they cannot, stop. Everything downstream will complete successfully and
return nothing. This is not a step to work around — on a site someone else owns it needs a
real grant from them, and that request should go out now rather than after a wasted hour.

Emphasize using **one** Google account consistently across every step. Mixing a personal
account for one server and a work account for another is the single most common cause of a
setup that "succeeded" and returns no data.

## Step 3 — Install what's missing

Follow `docs/SETUP.md` Step 1. Install only what Step 1's diagnosis showed absent.

After any PATH-affecting install (`uv`, `pipx`, `gcloud`), tell the user a **new terminal** is
required, and that Claude Code itself may need restarting to inherit the change.

## Step 4 — Credentials

Guide them through creating their own Google Cloud project, enabling the APIs, and downloading
a Desktop-app OAuth client JSON (`docs/SETUP.md` Step 2).

**These steps are interactive and browser-based — the user does them, not you.** Give clear
instructions, then wait. Do not attempt to automate a consent flow.

Confirm they exported `GSC_OAUTH_CLIENT_SECRETS_FILE` **in their shell profile**, not just the
current shell, and that the path exists.

Never suggest committing the credentials file. Never read its contents into the transcript.

## Step 5 — Authenticate each server

Per `docs/SETUP.md` Step 3, in order: `gsc`, then `analytics-mcp`, then `gmail` (skip `gmail`
if the project is not sending mail). For each, tell the user exactly what to expect in the
browser, then verify before moving on to the next one.

## Step 6 — Verify with live calls (the step that must not be skipped)

Run each of these and show the user the **actual returned values**, not a verdict:

| Check | Passes when |
|---|---|
| List Search Console properties | The user's own site appears in the list |
| Clicks + impressions, last 28 days | Non-zero numbers come back |
| List GA4 properties | The user's own property appears |
| Gmail connectivity | The mailbox is reachable |

If a check returns empty, diagnose against `docs/SETUP.md` Troubleshooting. Do not retry the
same command hoping for a different result, and do not describe a partially working setup as
complete. An empty property list after a successful sign-in is Step 2, every time.

## Step 7 — Hand off to real work

Once verification passes, confirm setup is complete, then run `/next-step` to orient the user
on what to do first. Don't leave them at a finished setup with no next action.
