# The Nine-Part Audit Framework

Work the parts in order. The ordering is deliberate: parts 1 to 3 establish what is
actually happening, parts 4 to 6 assess the work already done, and parts 7 to 9 find what
is structurally blocking growth. Optimising a page before you know whether it can be
crawled is wasted effort.

Each part below gives the question it answers, the data required, what to look for,
and what to do about it.

Two rules that apply to every part:

- **Write each part as its own document, with its numbers dated and sourced.** A finding
  with no date and no source cannot be re-checked in three months, which means it cannot
  be trusted in three months.
- **Verify against live production, not against your notes.** Covered again in
  [Reconciliation](#reconciliation-checking-a-plan-against-reality) at the end, which is
  the single practice from this framework I would keep if I could keep only one.

---

## Part 1 — Performance baseline

**The question:** what is search actually delivering right now, and which direction is it
moving?

**Data needed:** Search Console performance for the last 12 months (clicks, impressions,
average position, CTR), plus analytics sessions and conversions over the same window.

**What to look for:**
- Clicks flat or falling while impressions rise. The site is being shown more and clicked
  less, which points to relevance or presentation rather than ranking.
- A sharp week-over-week drop with no corresponding position change. Look at CTR before
  you look at rankings — a click collapse with stable positions usually points to a change
  in the search results page or in the title or description, not lost rankings.
- No conversion data connected to organic at all, leaving no basis for assessing what the
  traffic is worth.

**What to do:** establish the baseline numbers and write them down with their date window.
Every later claim of improvement gets measured against this. Separate "we lost rankings"
from "we lost clicks at the same rankings" before diagnosing anything, because the fixes
are unrelated.

---

## Part 2 — Branded vs non-branded split

**The question:** how much of this traffic is people who already know the brand?

**Data needed:** Search Console queries for a 3 to 12 month window, split into queries
containing the brand name (and its common misspellings) versus everything else.

**What to look for:** a heavy majority of clicks coming from branded queries. It means
organic search is functioning as a navigation shortcut for existing customers, not as a
discovery channel. Growth in total organic clicks under those conditions is usually just
brand growth from other channels showing up in search, so the learning is to avoid
attributing that growth to SEO without separating the two.

**What to do:** report branded and non-branded separately from now on, permanently. Never
report a single blended organic number again — it hides the only part that represents new
demand. Set the non-branded number as the growth metric.

---

## Part 3 — Content inventory

**The question:** what pages exist, and does anyone know?

**Data needed:** a full export from the CMS (every URL, title, meta description, publish
date, author, and status) reconciled against the pages the search engine has actually
indexed.

**What to look for:**
- A large gap between pages published and pages indexed.
- Missing custom meta titles or descriptions across a large share of the inventory, so
  the search engine is generating them.
- Every page attributed to the same default author value, meaning there are no real
  bylines and no expertise signal anywhere.
- Multiple pages targeting the same query, competing with each other.

**What to do:** build the inventory as a single file and keep it. Almost every later part
of the audit references it. Flag the overlaps for a cannibalization pass and the missing
metadata for a bulk fix, which is usually the cheapest available win.

---

## Part 4 — Content quality

**The question:** is what has been published good enough to rank, independent of technical
issues?

**Data needed:** the inventory from Part 3, plus performance per URL, plus a manual read of
a sample. Take the sample from across the range, not just the top performers.

**What to look for:** pages that answer a question nobody asked, thin pages generated to
hit a volume target, content that restates the top three results without adding anything,
no first-hand experience or original data anywhere, and a publication rate that clearly
outstrips any capacity to research properly.

**What to do:** score a sample on a fixed set of dimensions so the scoring is comparable
across reviewers — search intent match, depth against the top-ranking results,
differentiation, accuracy, structure, internal linking, metadata, and cannibalization risk.
Use the same rubric before commissioning new content, not only after it arrives. Reviewing
a finished draft is the most expensive point at which to learn that the topic does not match
the intended search demand.

---

## Part 5 — On-page and landing pages

**The question:** are the pages that matter most set up correctly?

**Data needed:** the rendered source of the highest-value pages, fetched now, not from a
saved copy. Titles, headings, meta descriptions, canonical tags, hreflang, structured data,
Open Graph tags.

**What to look for:**
- Two pages targeting different markets sharing an identical `<head>`: same title, same
  description, no canonical, no hreflang. A regional page whose title still names the
  original region is the classic version of this.
- No canonical tag on a page that has near-duplicates.
- No structured data anywhere.
- Titles written for internal taxonomy rather than for how people search.

**What to do:** fix the highest-traffic and highest-intent pages first and verify each fix
against the live page after deployment. Regional or duplicate-risk pages need
self-referencing canonicals, bidirectional hreflang including a default, and genuinely
different content — not just a different currency symbol.

---

## Part 6 — Backlink profile

**The question:** who links here, is it doing any good, and is any of it actively harmful?

**Data needed:** a backlink export from a third-party crawler, plus whatever reporting the
people building links have supplied.

**What to look for:** anchor text from obvious link-selling operations, links from sites
with no topical relationship to yours, a domain authority trend going down over a period
you were paying for it to go up, no disavow file despite known toxic links, and outbound
dofollow links passing authority to direct competitors.

**What to do:** deduplicate any supplied link report against itself and against previous
reports before you accept its totals — a reported count and a unique count are different
numbers, and only one of them is the deliverable. Where link building is outsourced, agree
in advance what a link has to be worth to count, in writing, before the next invoice.
Compile toxic links into a disavow file and actually submit it; discussing one is not the
same as having one.

---

## Part 7 — Technical SEO

**The question:** can the search engine reach, read, and index the pages you want it to?

**Data needed:** index coverage from Search Console, a full crawl, the live `robots.txt`,
every sitemap, and a sample of canonical tags.

**What to look for:**
- A small fraction of known URLs indexed, with a large "crawled, not indexed" bucket. This
  is usually the largest single technical issue when it appears, and it is a quality
  signal, not a crawl-budget one.
- Invalid `robots.txt` syntax. A malformed rule is ignored silently, so the pages it was
  meant to block are not blocked unless the configuration is checked directly.
- A sitemap that has not been regenerated since a redesign, listing dead URLs.
- Canonicals pointing at redirects, or absent where duplicates exist.

**Two sequencing rules to keep distinct:**

1. **Never block a page in `robots.txt` when what it needs is a `noindex` tag.** The
   crawler cannot enter the page to read the tag it has been forbidden to fetch. Use
   `noindex` for anything already crawled; use a robots block only for pages that were
   never meant to be reachable at all.
2. **Roll out `noindex` on thin pages before rebuilding the sitemap.** Rebuild first and
   you resubmit every thin URL, reinforcing exactly the signal you were trying to remove.

**What to do:** fix crawlability before anything else in the audit gets implemented. Nothing
downstream matters on a page that cannot be indexed.

---

## Part 8 — Keyword and competitor gap

**The question:** what demand exists that you are not capturing, and who is capturing it?

**Data needed:** your own ranking keyword set, the equivalent for two or three close
competitors, and a gap export showing terms they rank for and you do not.

**What to look for:** a keyword footprint far smaller than comparable competitors, no
coverage of the high-intent commercial terms in your category, and a chase after high
volume head terms while the specific terms that convert go unaddressed.

**What to do:** cut the gap list down to a prioritized batch of 30 to 40 terms rather than
working the full long tail. Filter for intent match and realistic difficulty, not volume.
Assign each term to exactly one page, which is also the fix for the cannibalization found
in Part 3.

---

## Part 9 — Internal linking

**The question:** does the site tell the search engine what its own important pages are?

**Data needed:** a crawl with the internal link graph — inbound internal links per URL,
click depth from the homepage, and anchor text distribution.

**What to look for:** important pages four or more clicks from the homepage, orphan pages
with no internal links at all, generic anchor text everywhere, and all internal link equity
pooling on navigation pages instead of the pages meant to rank.

**What to do:** link new content from existing relevant content as a standing rule, not as
a later cleanup pass. Bring commercially important pages within two or three clicks of the
homepage. Use descriptive anchors.

---

## Reconciliation: checking a plan against reality

This is a practice, not an audit part, and it belongs at the end of every cycle.

When you have an earlier audit and a newer implementation plan that claims to address it,
do not trust the plan's own outline of what it covers. Take every finding from the
original audit, one at a time, and check its current state against live production.

Two learnings commonly come from doing this:

- **An item marked "fixed" in a plan still needs to be verified in the live environment.**
  A plan records what was decided. Production records what happened. The difference is
  invisible unless you go and look.
- **Earlier findings need to be re-checked and, where necessary, updated or withdrawn.**
  Verifying against production can show that something previously reported as a concern no
  longer applies or was based on an incomplete reading. Update the record explicitly and in
  writing. An audit that only ever adds findings is not demonstrating that its earlier
  conclusions have been re-checked.

The check is per finding, against the live source, at the time of writing. Not against your
notes, not against last month's report, not against what you remember deciding.
