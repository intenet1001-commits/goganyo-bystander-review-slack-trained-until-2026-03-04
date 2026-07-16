---
name: nds-lib-thumbnail
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=2283-15426"
learned_date: 2026-07-16
sections_studied:
  - "2283:15426 (page '    - 썸네일' — canvas root; 10 top-level nodes only, the smallest page in this batch. get_metadata returned the ENTIRE page inline, unabridged, without overflowing)"
  - "8354:13946 / 8354:13948 / 8354:13958 (frames thumnail01 / thumnail02 / thumnail03 [sic — 'thumnail', misspelt on canvas] — 500×500 cover candidates reading 'NDS' / 'NHI' / 'NHI')"
  - "8354:13956 / 8354:13950 / 8354:13952 / 8354:13954 (frames thumnail04 / 05 / 06 / 07 — 500×500 circular cover candidates reading '트' / '상' / '신' / '디' in x-order)"
  - "8354:13960 (frame 'arrow', 100×100 — a directional pointer sitting BETWEEN the NDS/NHI group and the 트/상/신/디 group)"
  - "8354:13962 (frame 'thumnail', 2764×1077 — a raster 'image 1' + text node '나눔바른고딕'; a typeface specimen, not a cover)"
status: "unknown — judged on its OWN evidence, not on page position. This page's name says nothing about being archived; its 'archive' classification is INHERITED FROM PAGE POSITION ONLY (it sits under the 👀 Archive header, after the four *-Archive pages). Nothing on the canvas marks it deprecated: no 구버전/이전/미사용/deprecated/백업/폐기/중단 text, no strikethrough, no dimming, no Last update stamp. Its ONE piece of positive evidence — a 나눔바른고딕 specimen — CORROBORATES the live library (see verdict). Subject matter is Figma file-cover art, not component spec, so live-vs-deprecated is arguably the wrong axis for it entirely."
---

# NDS_Library — "    - 썸네일" page

## ✅ Invisible-signal sweep — EXHAUSTIVE and fully negative (verified via `use_figma`)

**This is the one page in my batch where the `unknown` verdict is verified to completion rather than merely
unrefuted.** All three invisibility mechanisms checked programmatically over **every one of the page's 20 nodes**
(not a sample — that is the whole page):

| Mechanism | Result |
|---|---|
| `opacity < 1` | **0 nodes** |
| `STRIKETHROUGH` segments | **0 nodes** |
| `visible === false` | **0 nodes** |
| `characters` ≠ layer name | **0 nodes** — every TEXT's content equals its name |

**Real `characters`, read directly (not layer names):** `NDS` · `NHI` · `NHI` · `트` · `상` · `신` · `디` ·
`나눔바른고딕`. **Confirms the glyphs verbatim and confirms nothing is hiding in an override.**

**Node inventory, complete:** 8 `FRAME`, 8 `TEXT`, 3 `RECTANGLE`, 1 `VECTOR`. **Zero `INSTANCE`, zero `COMPONENT`,
zero `COMPONENT_SET`** — confirming there is nothing here to key, as the original note argued.

**So: no dated stamp, no `구버전`/`이전`/`미사용`/`deprecated`/`old`/`백업`/`폐기`/`중단` text, no strikethrough, no
dimming, no hidden node, no `→ 이동` pointer. Found none ⇒ `unknown`.** The page name is not evidence and the
page's position under the `👀 Archive` header is not evidence.

---

## Status verdict — `unknown`, and the classification is inherited, not earned

**Start with what this page is not: it is not named "Archive".** `썸네일` means "thumbnail". It sits under the
`👀 Archive________________` header (`1867:19979`) as page #50 of 51, immediately after the four genuine
`- * Archive` pages — **and page position is the ONLY thing that classifies it as archival.** The task brief was
explicit that this page must be judged on its own evidence, and on its own evidence **there is no archival
signal whatsoever**.

**What I searched for and did not find:** `구버전`, `이전`, `미사용`, `deprecated`, `old`, `백업`, `폐기`, `중단`,
`사용금지`, `임시`, `보류`, `제외`, `해당없음`, `👿`, strikethrough, greyed-out / low-opacity overlays, and
`→ 이동` pointers to a replacement. **Zero hits — not even a false positive.** The page is small enough that
`get_metadata` returned **all 10 top-level nodes inline, unabridged** — so unlike the larger pages in this batch,
**this search was exhaustive over the complete node tree, not a sample.** There is also **no `Last update`
stamp**, so it cannot be dated at all.

### The one piece of positive evidence points toward *current*, not stale — and I nearly misread it

The `thumnail` frame (`8354:13962`) contains a text node reading verbatim **`나눔바른고딕`** (NanumBarunGothic).

My first instinct was to flag this as a legacy signal — the NDS **M.web** file's foundation is **Pretendard**
(`nds-mweb-archive.md`, `nds-mweb-typography.md`), so a Nanum specimen looks like an older generation.
**That instinct was wrong, and checking it is the point.** `nds-lib-typography.md` — status **`live`**, evidence
`Last update 2022.10.12 구자영`, 36 local text styles resolved — establishes that **NanumBarunGothic is the live
typeface of THIS file**, `NDS_Library`. The two files simply have different foundations:

| File | Typefaces | Source |
|---|---|---|
| **NDS_Library** (this file) | **NanumBarunGothic** + Roboto | `nds-lib-typography.md` (live) |
| NDS M.web | Pretendard + Roboto | `nds-mweb-typography.md`, `nds-mweb-archive.md` |

**So the specimen corroborates the live library rather than contradicting it.** That is weak positive evidence —
a font specimen matching the current foundation is consistent with the page being current, but it is not a
currency stamp, and a specimen could equally survive untouched from an era when Nanum was newly adopted.

**Honest verdict: `unknown`.** No deprecation evidence, no currency stamp, one weakly-corroborating detail.
Per the method's rule, **absence of a marker is `unknown`, not `deprecated`** — and page position is not a
marker.

### A caveat worth more than the verdict: live-vs-deprecated may be the wrong axis here

Every other page in this batch is a **component/asset spec** — things a BUILD pass could consume, where
"is this current?" is the decisive question. **This page is Figma file-cover art**: candidate thumbnails for how
`NDS_Library` appears in a Figma project browser. It contains **no components, no usage rules, no specs, and
nothing a BUILD pass could ever consume.** Asking whether cover art is "deprecated" is close to a category
error — the meaningful question is "which candidate was chosen?", and **the page does not say.**

**Consequence for BUILD: nothing here may be promoted to `CORE.md` or used in a build** — both because the
status is `unknown` (the rule applies unchanged) and, more simply, **because there is nothing here to build
with.** This is the lowest-value page in the batch and should not consume VERIFY effort ahead of the real
open questions on its siblings.

## Layer-name convention on THIS page — reliable, and it preserves a misspelling

**The convention is per-page. This page's is simple and reliable — but do not silently correct it.**

- **`thumnail01` … `thumnail07`** — sequential 500×500 cover candidates. **The layer name is misspelt on canvas:
  `thumnail`, not `thumbnail`** (missing the `b`). **All eight nodes carry the same misspelling**, including the
  large frame simply named `thumnail` (`8354:13962`). **Quoted verbatim throughout this note.** A future pass
  searching this file for `thumbnail` will find **nothing** — the string does not exist. The page *name* (`썸네일`)
  is the Korean transliteration and is spelt correctly; only the Latin layer names are wrong.
- **Text-node names equal their rendered content** — the text node inside `thumnail01` is named `NDS` and renders
  "NDS"; `thumnail05`'s is named `상` and renders "상". **Reliable on this page** (confirmed by screenshot).
- **`arrow`** (`8354:13960`) and **`image 1`** (`8354:13963`) are generic but accurate.
- **`Frame 9401`** (`8354:13964`) is the one non-descriptive name — a wrapper around the `나눔바른고딕` text.

## What's actually on the page (inventory only — 10 nodes, complete)

In on-canvas x-order (left → right). **This is the entire page — nothing is omitted.**

| # | Node | Name | Size | x | Renders |
|---|---|---|---|---|---|
| 1 | `8354:13946` | `thumnail01` | 500×500 | -2351 | **`NDS`** — dark square, green→yellow gradient letters |
| 2 | `8354:13948` | `thumnail02` | 500×500 | -1751 | **`NHI`** — dark square, gradient letters |
| 3 | `8354:13958` | `thumnail03` | 500×500 | -1151 | **`NHI`** — **bright yellow-green gradient fill, black letters** (inverted vs #2) |
| 4 | `8354:13960` | `arrow` | 100×100 | -551 | a small **`↳` pointer**, dark on dark |
| 5 | `8354:13956` | `thumnail04` | 500×500 | 49 | **`트`** — dark circle, red letter |
| 6 | `8354:13950` | `thumnail05` | 500×500 | 649 | **`상`** — dark circle, yellow letter |
| 7 | `8354:13952` | `thumnail06` | 500×500 | 1249 | **`신`** — dark circle, blue letter |
| 8 | `8354:13954` | `thumnail07` | 500×500 | 1849 | **`디`** — dark circle, purple/magenta letter |
| 9 | `8354:13962` | `thumnail` | 2764×1077 | -2351 | raster `image 1` + text **`나눔바른고딕`** — a typeface specimen |
| 10 | `8354:13963`/`:13964`/`:13965` | `image 1` / `Frame 9401` / `나눔바른고딕` | — | — | children of #9 |

### On `트` / `상` / `신` / `디` — reported verbatim, deliberately not decoded

In x-order the four circular candidates read **`트`, `상`, `신`, `디`** — "트상신디", which is **not a Korean
word**. Reversed it gives "디신상트", also not a word. **I am not guessing what they spell.** Plausible readings
exist (four separate single-glyph covers for four different files; syllables of a phrase whose order isn't
positional; an abandoned exploration), and **the page contains nothing that would decide between them** — no
caption, no grouping frame, no title. **Blank at source IS the finding.** Recording the glyphs, their order,
their colours, and their node ids so a future pass with more context can decode them without re-reading the page.

### On the `arrow` — a directional pointer, and the closest thing here to a `→ 이동`

The `arrow` frame (`8354:13960`) sits **between** the two candidate groups: after `thumnail03` (the last
NDS/NHI square) and before `thumnail04` (the first 트/상/신/디 circle). Its `↳` glyph points **rightward, from
the square group toward the circle group**.

**This is worth noting precisely because the method asks for `→ 이동` pointers as deprecation evidence — and
this is not one.** It points **within** the page, between two design explorations; it does **not** point at a
replacement *page*, carries **no text**, and names **no destination**. **The most it supports is that the circle
set came after the square set** — an iteration direction, not a status. `thumnail03`'s inverted bright fill
(unique among the eight) hints it was the selected square candidate, **but nothing on canvas says so.**
**Suggestive; not evidence. Not treated as a deprecation marker.**

## Conflicts for LEDGER

**None proposed.** This page contradicts nothing. Its only cross-referenceable fact — the `나눔바른고딕` specimen —
**agrees** with `nds-lib-typography.md`'s live NanumBarunGothic foundation for this file. It holds no components,
no rules, and no rival version of anything documented elsewhere.

One **observation** offered without a proposed entry, since it is a fact about the file rather than a conflict:

> **The `👀 Archive` group in NDS_Library is not homogeneous.** Four of its five pages are named `- * Archive`
> and hold retired-or-unknown component specs; the fifth, `    - 썸네일` (`2283:15426`), is **file-cover art and
> a typeface specimen** — a different *kind* of thing entirely, for which live-vs-deprecated is close to a
> category error. **Anything that reasons over "the Archive pages" as a set should exclude this one, or at least
> not expect a status answer from it.**

## CORE — componentKeys found

**None — and here the reason is stronger than "unknown status" (though that applies too).**

**There are no components on this page to key.** All 10 nodes are `<frame>`, `<text>`, or `<rounded-rectangle>`
in the metadata dump — **zero `<instance>`, zero `<symbol>`, zero `<component>`.** I confirmed this against the
complete, un-truncated node tree (the page returned inline). So there is nothing here that *could* carry a
componentKey, regardless of status. No `get_design_context` / `importComponentSetByKeyAsync` call was made or
warranted.

Per the method's rule the `unknown` verdict would independently bar promotion — **but on this page the point is
moot: there is no key to withhold.**

## Gaps / unverifiable

- **`image 1` (`8354:13963`, 2764×1077) was not transcribed.** It is a **raster** filling the `thumnail` frame,
  and per the method's "rules live inside pasted screenshot images" warning it could hold content my
  page-level screenshot did not resolve. My screenshot (4700×1866 → 1400px, ~3.4× downscale) shows a plain
  off-white field with the `나눔바른고딕` text over it, **consistent with a typeface specimen and nothing more** —
  but at that scale **small text would not be legible.** **This is the one real hole in an otherwise complete
  read of this page.** A zoomed screenshot of `8354:13962` would close it cheaply.
- **The `트/상/신/디` glyphs are undecoded** — see above. Not a gap in my reading; a blank at source.
- **`thumnail03`'s inverted fill is unexplained.** It is the only bright candidate of the eight. Selection
  marker or just a variant — **the page does not say.**
- **No `Last update` stamp** — this page cannot be dated even approximately, and holds no filename-dated pasted
  asset (unlike the Emoji/Nmoji archive's 2026-02/03 screenshots or the Illusts archive's 2024-01-29 one).
  **Its freshness is genuinely unknown, not merely unlabeled** — the method asks for this to be reported, and it
  is the fourth of four pages in my batch with no usable date.
- **No frame was flagged `hidden="true"`** in the dump, so the blank-1×1 caveat did not apply. On this page that
  check **is** conclusive, since the full tree was returned inline.
