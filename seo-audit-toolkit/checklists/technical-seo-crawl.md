# Technical SEO Crawl

Work top to bottom. Crawlability first; nothing below it matters on a page that cannot be
indexed.

## Robots and directives

- [ ] `robots.txt` fetched from the live site and read line by line
- [ ] Every rule syntactically valid — a malformed rule is ignored silently, so the pages
      it was meant to block are not blocked
- [ ] Nothing blocked in `robots.txt` that needs a `noindex` tag read. The crawler cannot
      enter a page it has been forbidden to fetch
- [ ] `noindex` present where intended, and absent where not
- [ ] No blanket disallow left over from a staging environment

## Sitemaps

- [ ] Every sitemap listed in `robots.txt` returns 200
- [ ] Sitemap generation date is recent
- [ ] No 404s, redirects, or `noindex` pages listed in a sitemap
- [ ] Important pages that exist are actually present in a sitemap
- [ ] Sitemap rebuild is sequenced after any `noindex` rollout, not before

## Indexing

- [ ] Index coverage pulled and the indexed-versus-known ratio recorded
- [ ] "Crawled, currently not indexed" bucket sized. A large one is a quality signal, not
      a crawl-budget one
- [ ] "Discovered, currently not indexed" checked separately
- [ ] Excluded-by-canonical and duplicate verdicts reviewed page by page for anything that
      should be indexed independently

## Canonicals and duplicates

- [ ] Self-referencing canonical on every page that should stand alone
- [ ] No canonical pointing at a redirect or a 404
- [ ] Regional or near-duplicate pages have distinct titles, headings, and body content
- [ ] Parameter and filter URLs are handled deliberately, one way or the other

## International

- [ ] `hreflang` present, bidirectional, and including a default
- [ ] Language and region codes valid
- [ ] Regional page titles name the correct region

## Structure and health

- [ ] Redirect chains reduced to a single hop
- [ ] No internal links pointing at redirects or 404s
- [ ] HTTPS enforced, mixed content absent
- [ ] Structured data present and validating
- [ ] Core Web Vitals pulled for mobile and desktop separately

## After any fix

- [ ] Change confirmed in the rendered source of the live page
- [ ] Re-indexing requested where relevant
- [ ] Result re-checked after the crawler has had time to revisit, not on the same day
