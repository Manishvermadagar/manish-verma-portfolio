# Pre-Delivery Review

Run before anything leaves your hands. Answer in writing, not in your head.

## Claims

- [ ] Every claim shaped like "X was done / is live / is pending / is blocked" has been
      checked against its system of record today, not from memory
- [ ] Anything reported as fixed has been confirmed in live production, with the URL and
      check date recorded
- [ ] Every absolute — "never", "none", "all", "every" — is either exhaustively verified or
      scoped down to what was actually checked
- [ ] Anything that could not be confirmed either way is written as unverified rather than
      given a verdict

## Numbers

- [ ] Every number carries its source, date window, and filters
- [ ] Any two numbers compared side by side share the same period, segment filter, and
      source system
- [ ] Table totals have been added up and reconcile against their rows
- [ ] Percentages state what they are a percentage of
- [ ] No number appears that you could not re-derive if challenged

## Carried-forward content

- [ ] Every section reused from a previous version has been diffed against that version
- [ ] Every surviving sentence has been re-verified, not assumed
- [ ] Genuinely unchanged items say so explicitly, with the date they were re-verified

## Recommendations

- [ ] Each recommendation names the specific action, not a direction of travel
- [ ] Each states who owns it and what it depends on
- [ ] Sequencing dependencies are explicit where one item must precede another
- [ ] Nothing recommends a change to a live site without a verification step after it

## Framing

- [ ] The document says what it does not cover, as well as what it does
- [ ] Uncertainty is stated as uncertainty
- [ ] No finding is presented more confidently than the evidence behind it supports

## Ledger

- [ ] Every pattern in `DELIVERY_QUALITY_LEDGER.md` was checked against this deliverable
- [ ] Anything the review caught has been added to the ledger before being fixed
- [ ] If the mistake fits no existing pattern, a new pattern has been written with a
      concrete check
