# Setup Runbook

Everything needed to make this project functional on a new machine, against **your own** site.
Budget 30–45 minutes the first time, most of it waiting on Google consent screens.

You can run `/setup` in Claude Code and it will walk these steps with you, running the checks
and telling you which one failed. This document is the reference behind it, and the place to
look when a step misbehaves.

---

## The failure this runbook exists to prevent

Every step below can appear to succeed while the whole thing is broken.

If your Google account does not have access to the Search Console property and the GA4 property,
the servers still start, the consent flow still completes, `claude mcp list` still says
**Connected**, and every query returns **nothing**. There is no error message. A session that
does not notice will happily produce a confident-sounding analysis built on no data at all, and
you will not find out until someone who knows the site reads it.

So the rule throughout: **verify against the system of record, never against the tool's own
success message.** Every step ends with a query that returns real rows, not a status line.

---

## What you are setting up, and why

Three MCP servers connect Claude to live data. Without them the analysis skills still run, and
their output is worth much less.

| Server | Gives you | Used by |
|---|---|---|
| `gsc` | Google Search Console — queries, clicks, impressions, CTR, average position, indexing status | `/report-qa`, `/blog-topic-analysis`, `/content-quality` |
| `analytics-mcp` | Google Analytics 4 — sessions, users, channels, landing pages, key events | `/report-qa` |
| `gmail` | Drafting outbound mail and reading the delivered copy back to confirm it rendered | `/write-client-mail` |

The Gmail server is optional. Delete its block from `.mcp.json` if the project is not sending
mail.

---

## Step 0 — Access grants (do this first; nothing else works without it)

If the site is yours, you already have these. If it belongs to someone else, **these are granted
by them, not by you, and everything below is inert until they are in place.** Request both, for
every person who will run the project:

1. **Search Console** — `Restricted` or `Full` user access on the property for the site
2. **Google Analytics 4** — `Viewer` on the corresponding GA4 property

Use the **same Google account** for both, and for every step below. A personal account for one
and a work account for another is the most common reason a setup that "completed successfully"
returns zero rows.

**Verification:** sign in at `search.google.com/search-console` and `analytics.google.com` and
see the site's data with your own eyes. If you cannot see it in the browser, no amount of MCP
configuration will surface it.

**Troubleshooting.** "I was added yesterday and still see nothing" — check which account the
invitation went to; Search Console grants are per-account, not per-person. "I can see Search
Console but not Analytics" — they are separate products with separate permission systems, and
being granted one tells you nothing about the other.

---

## Step 1 — Base tooling

```bash
# Python dependencies (PDF generation + PDF text extraction)
pip install -r requirements.txt

# uv / uvx — runs the Search Console server
curl -LsSf https://astral.sh/uv/install.sh | sh        # macOS / Linux
# Windows (PowerShell):  irm https://astral.sh/uv/install.ps1 | iex

# pipx — installs the Analytics server as an isolated CLI
python3 -m pip install --user pipx && python3 -m pipx ensurepath

# Google Cloud CLI — needed for GA4 authentication
#   https://cloud.google.com/sdk/docs/install

# jq — required by the destructive-command hook in .claude/settings.json
#   macOS: brew install jq   ·   Debian/Ubuntu: apt install jq
```

Open a **new terminal** afterwards so PATH changes take effect, then confirm:

```bash
uvx --version && pipx --version && gcloud --version && jq --version \
  && python3 -c "import reportlab; print('reportlab ok')"
```

**Troubleshooting.** `gcloud` installed but not found: its install directory was not added to
PATH — add it manually rather than reinstalling. Any of these working in your terminal but not
inside Claude Code: Claude Code inherited the PATH it was launched with, so restart it.

---

## Step 2 — Google Cloud project + OAuth client

You create your **own** Google Cloud project and your **own** OAuth client. Credentials are never
shared between people or organizations.

1. `console.cloud.google.com` → **New Project** (any name).
2. **APIs & Services → Library**, enable all three:
   - Google Search Console API
   - Google Analytics Admin API
   - Google Analytics Data API
3. **APIs & Services → OAuth consent screen** → External → fill the required fields → add your
   own Google account under **Test users**.
4. **APIs & Services → Credentials → Create Credentials → OAuth client ID** → application type
   **Desktop app** → **Download JSON**.
5. Save that file **outside this repo**, e.g. `~/.config/seo-audit/client_secret.json`.

> **Never commit this file.** `.gitignore` blocks `client_secret*.json`, but keeping it outside
> the repo entirely is safer.

Point the toolkit at it by exporting the path. Put this in your shell profile (`~/.zshrc`,
`~/.bashrc`) so it persists:

```bash
export GSC_OAUTH_CLIENT_SECRETS_FILE="$HOME/.config/seo-audit/client_secret.json"
```

`.mcp.json` reads this variable. If it is unset, the `gsc` server will not start.

> The credentials file is read **once**, to run the initial browser consent flow. After that the
> resulting token is cached separately and refreshed automatically. Keep a backup of the JSON in
> case you ever need to re-authenticate from scratch.

**Troubleshooting.** Consent screen rejects you with "app not verified": your account is not
listed under **Test users** (step 3). "Access blocked: this app's request is invalid": the client
was created as a Web application rather than a Desktop app — create a new Desktop-app client.

---

## Step 3 — Copy the MCP config and authenticate each server

```bash
cp .mcp.json.template .mcp.json
```

Read it before you use it. Restart Claude Code so it picks up the file; it will ask you to
approve the servers on first open.

### `gsc` — Search Console

Run `/mcp`, select `gsc`, follow the browser sign-in, grant Search Console read access.

Verify with a real call, not a connection status:

```
List my Search Console properties
```

Your site should appear. **If the server connects but the list is empty, Step 0 was not
completed for the account you just signed in with.** That is the whole failure mode in one
sentence.

### `analytics-mcp` — GA4

```bash
pipx install analytics-mcp

gcloud auth application-default login \
  --scopes="https://www.googleapis.com/auth/analytics.readonly,https://www.googleapis.com/auth/cloud-platform"
```

Sign in with the same Google account. Then verify:

```
List the GA4 properties I have access to
```

**Troubleshooting.** `analytics-mcp: command not found` — pipx installed it outside your PATH;
run `pipx ensurepath` and open a new terminal. An empty property list means the ADC login used a
different account than the one holding the Viewer grant; re-run the login.

### `gmail`

```bash
npx -y @gongrzhe/server-gmail-autoauth-mcp auth
```

This opens a consent flow for your own mailbox.

> If that package name has changed, or you prefer a different Gmail MCP distribution, install
> whichever you like and update the `gmail` entry in `.mcp.json` to match its command. The only
> requirement is that `claude mcp list` shows it **Connected** — and that the outbound-mail hook
> in `.claude/settings.json` still matches its send-tool names. Check that. A hook whose matcher
> no longer matches anything fails silently, in the direction of sending mail without asking.

---

## Step 4 — Verify everything together

```bash
claude mcp list
```

All servers must show **Connected**. Then confirm each one actually returns *your* data — a
connected server with no data access is exactly what this step exists to catch:

| Ask Claude | Expected |
|---|---|
| "List my Search Console properties" | Your site appears |
| "Show total clicks and impressions for `<YOUR_SITE>` over the last 28 days" | Real numbers, not zero |
| "List the GA4 properties I have access to" | Your property appears |

Once all three pass, you are set up. Run `/next-step` to pick up work.

---

## Troubleshooting index

**Server shows Connected but every query returns empty.** Almost always Step 0: the account you
authenticated with has no access to the property. Confirm in the browser first, then re-run the
consent flow with the right account.

**`gsc` fails to start.** `GSC_OAUTH_CLIENT_SECRETS_FILE` is unset, or points at a path that
does not exist. Echo it in a fresh terminal — a variable exported only in the old shell is not
visible to Claude Code.

**Claude Code does not offer to start any servers.** You have `.mcp.json.template` and no
`.mcp.json`. Copy it across (Step 3) and restart.

**A server was working and stopped.** Cached tokens expire when a password changes or access is
revoked. Re-run that server's consent flow. You do not need to recreate the Cloud project.

**Numbers look plausible but wrong.** Check that the property you are querying is the one you
think it is. A domain property and a URL-prefix property for the same site return different
totals, and both will answer without complaint.
