---
name: pdf-report
description: Use whenever generating a PDF in this project — a performance report, a content review write-up, an analysis document, or any markdown that needs to go out as an attachment. Converts markdown to a properly formatted PDF with correctly rendered tables.
---

# PDF Report Generation

```bash
python3 scripts/md_to_pdf.py <input.md> <output.pdf> --title "Document Title"
```

Requires `reportlab` (`pip install -r requirements.txt`).

## Why this script rather than a generic markdown-to-PDF converter

It uses **reportlab's Platypus API**, building every table cell as a `Paragraph` flowable.

This matters. Simpler converters draw table cells at a fixed height, so as soon as a cell's text
wraps it overflows into the space beside it and the whole table misaligns — which looks careless
on a document someone else reads. Here each cell measures its own wrapped height and the row
grows to fit, so that failure mode cannot occur.

## Supported markdown

Headings (`#` through `####`), `**bold**` / `*italic*` / `` `code` ``, pipe tables (header row
plus a `---` separator row — any column count, wraps automatically), `-` / `*` / `1.` list items,
and `---` alone on a line as a section divider. Anything else renders as a wrapped paragraph.

**Unicode is handled for you.** Symbols outside the standard font range are substituted
automatically — see `UNICODE_SUBSTITUTIONS` at the top of the script. You do not need to sanitize
em-dashes, curly quotes or checkmarks beforehand. If a new character renders as a missing-glyph
box, add it to that map rather than editing the source markdown.

## Hard rule: verify the output before treating a PDF as final

A clean script exit does not mean the document looks right. Every time you generate one:

1. `pdftotext -layout <output.pdf> -` and scan for leaked markup (`<b>`, `**`, `&lt;`). A hit is
   an escaping bug, not a cosmetic issue.
2. Render a page containing a table to an image and **actually look at it**:
   `pdftoppm -png -r 150 -f <page> -l <page> <output.pdf> <prefix>`. Alignment and wrapping
   problems are invisible in extracted text and obvious on a rendered page.
3. Only after both pass, attach or send it.

## Styling

Accent colour, fonts and spacing live at the top of `scripts/md_to_pdf.py` (`ACCENT`,
`ACCENT_LIGHT`, `build_styles()`). Change them there so every document stays consistent — never
per-report.
