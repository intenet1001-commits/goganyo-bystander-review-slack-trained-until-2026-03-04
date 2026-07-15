---
name: nds-mweb-typography
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=0-1"
learned_date: 2026-07-15
sections_studied:
  - "0:1 (page '    - Typography : Pretendard' — contains exactly one section, 1289:703)"
  - "1289:703 (section 'Typo_styleguide' — on-canvas heading 'M.web Typography' / subtitle 'Typography Scale & Hierarchy'; the whole page's content)"
  - "1589:2123 (frame 'Group 1' — the font-family + weight declaration line)"
  - "1291:745 (frame 'table' — the 9-row Scale/Size/Line Height type ramp)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen)
---

# NDS M.web — Typography (Pretendard)

The type foundation for the **NDS_M.web** component library (`uVcmG6GgOl2J8EOlc22wob`) — a different, larger file than the `NDS_UX Guide` (`nEINCcmC7AVkWSqRkq60y1`) that the other `projects/` notes cover. This page is a **token declaration**, not a rules essay: it states the font families, the four weights, and a 9-step size/line-height ramp. There is no prose commentary and no do/don't examples on this page.

The page is unusually clean — a single section (`1289:703`), no numbered sub-frames, so **the frame-name-vs-on-canvas-number mismatch documented in `nds-ux-guide-touch-area` / `nds-ux-guide-color-contrast` does not occur here**. Layer names on this page also matched their rendered text exactly (verified against a screenshot of `1289:703`), so the metadata was directly trustworthy for once — but that is a property of this page, not of this file (see `nds-mweb-icons` for a confirmed mismatch elsewhere in the same file).

## Font families

Verbatim from the guide (`1589:2123`):

> "문자  Pretendard  /  숫자  Roboto  (SCSS에서 자동으로 변환됨)"

> "Regular 400 / Medium 500 / SemiBold 600 / Bold 700"

Read carefully — this is a **two-family split by character class, not by role**:

| Character class | Family |
|---|---|
| 문자 (letters — Korean + Latin) | `Pretendard` |
| 숫자 (numerals) | `Roboto` |

The parenthetical **"(SCSS에서 자동으로 변환됨)"** is the important operational detail: the numeral→Roboto swap is applied **automatically by the SCSS layer**, not hand-applied by the designer per text node. So in Figma you generally set `Pretendard` on a text node and the build pipeline substitutes Roboto for the digits. Don't split a single string into two text nodes to force this — that's the pipeline's job.

Weights available, with their numeric CSS values stated by the guide: **Regular 400 / Medium 500 / SemiBold 600 / Bold 700**. Only these four — no Light, no ExtraBold, no Thin.

## Type ramp (Scale / Size / Line Height)

Verbatim table from `1291:745`. Units are unstated in the guide (bare numbers); given this is the M.web (mobile web) file and the sibling touch-area guide mixes `px`/`pt`, treat these as **px** but note the guide itself does not say so explicitly.

| Scale | Size | Line Height | Ratio (derived, not in guide) |
|---|---|---|---|
| Large | 40 | 54 | 1.35 |
| Point1 | 32 | 44 | 1.375 |
| Point2 | 30 | 38 | 1.267 |
| Headline | 26 | 36 | 1.385 |
| Title | 24 | 34 | 1.417 |
| Body | 21 | 30 | 1.429 |
| Notice | 19 | 26 | 1.368 |
| Info | 18 | 24 | 1.333 |
| label | 15 | 18 | 1.2 |

Observations worth carrying into BUILD:

- **The ramp is named by role, not by t-shirt size** — `Body` (21) is the paragraph default, `label` (15) the smallest. There is no `caption`/`small`; `label` is the floor.
- **`label` is cased inconsistently** — every other scale name is Capitalized (`Large`, `Point1`, `Headline`…), but `label` is lowercase in the guide. Cosmetic, but if you're generating token names from this table, normalize deliberately rather than assuming a typo.
- **Line-height ratios are not a constant multiple** — they drift from 1.2 (label) up to ~1.43 (Body) and back down. So you **cannot** derive line-height from size with a single multiplier; look the pair up in this table. The tightest ratio is at the smallest size, which is the opposite of the usual convention (small text normally gets *more* relative leading).
- **`Point1` (32) and `Point2` (30) are only 2px apart** but their line heights differ by 6 (44 vs 38, ratios 1.375 vs 1.267). These are two deliberately distinct styles, not a rounding artifact — don't collapse them.
- The two "Point" scales sit between `Large` and `Headline`; the naming suggests emphasis/number-callout use (a "포인트" figure, e.g. a price or a rate) rather than headings, consistent with a securities app. The guide does **not** state this — it's an inference, so confirm against a real screen before relying on it.

## How this feeds BUILD mode

When generating M.web screens or components from this file (`uVcmG6GgOl2J8EOlc22wob`):

- **Set `Pretendard` as the font family on text nodes**, with style ∈ {`Regular`, `Medium`, `SemiBold`, `Bold`} (400/500/600/700). Verify the exact style string with `figma.listAvailableFontsAsync()` before `loadFontAsync` — `"SemiBold"` vs `"Semi Bold"` is a known footgun (see `figma-use` gotchas), and this guide writes it as one word.
- **Do not hand-set Roboto on numerals.** The guide says SCSS converts them automatically. Only use Roboto directly if you're reproducing an already-rendered artifact where the swap has already happened (note: NDS's own `showcase/color` component renders its labels in `Roboto Regular 14 / 1.43 / +0.15 tracking` — that's the component's own internal style, not a ramp entry).
- **Pick size+line-height as a pair from the table above** — never compute line-height from a ratio. Set `lineHeight` as `{unit: 'PIXELS', value: N}`, not a bare number.
- Default body copy → `Body 21/30`. Screen/section titles → `Title 24/34` or `Headline 26/36`. Micro-labels, chips, badge text → `label 15/18`. Big numeric callouts → `Large 40/54` or `Point1 32/44`.
- **This ramp is M.web-specific.** The existing Core reference records `NanumBarunGothic` for headers/buttons and `Pretendard` for labels/body — those were sampled from `NDS_Library` instances in a *different* file. This file declares Pretendard as the family for **all** 문자 with no NanumBarunGothic mention anywhere. Don't merge the two blindly; scope the font choice to which library/file you're actually building against, and see the flag in the report about reconciling this against Core reference.
