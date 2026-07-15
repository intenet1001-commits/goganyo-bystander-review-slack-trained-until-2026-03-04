---
name: nds-mweb-illusts
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=1196-461"
learned_date: 2026-07-15
sections_studied:
  - "1196:461 (page canvas '    - Illusts' — a single SECTION, no sticky note anywhere on the page)"
  - "1604:23 (SECTION 'Illust_guideline', 5400×17865 — by far the largest page in the Graphic asset group)"
  - "1604:27 (export-rule frame; internal layer name is a single blank space ' ')"
  - "1604:32 (the grid frame, 5200×17000, also named ' ' — holds 137 numbered pair-frames, 5 per row)"
  - "1604:4502 (pair-frame '1' — ndsw_illust01_nm + ndsw_illust01_qv, the NM/QV style comparison)"
  - "1604:9980 (pair-frame '21' — snow globe, second NM/QV style confirmation)"
  - "2812:4493 (pair-frame '137' — binoculars/candlestick, the highest index; third NM/QV confirmation)"
  - "1606:15063 / 1606:15062 (ndsw_illust01_nm / ndsw_illust01_qv — sampled COMPONENTs, confirmed keys)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen)
---

# NDS M.web — Illusts (Illustration Asset Library)

Part of the NDS_M.web file's "🌈 Graphic asset" page group. An **asset library page**, same template as its siblings (dark header → export rule → grid), but this is the big one: the section is **5400×17865**, roughly 4× the height of Infographics. It's also the **only** asset set in this group that is channel-differentiated (NM vs QV).

Header: **"M.web Illust"** / subtitle **"Illustration Asset & & Guideline"** (doubled `&` verbatim — the shared template artifact).

## Export rule (verbatim) — and it differs materially from the other three pages

> **Export → ndsw_illust00_nm/qv.PNG**  (400×400)
> - **tinypng.com 파일크기 압축 필수**
> - **ndsww 공통처리**

Three things here are **different from Nmoji / Emoji / Infographics**, and each one matters:

1. **Format is PNG, not SVG.** Every other asset set on these pages exports SVG. These are raster. That follows from the artwork — they're soft-gradient/3D-rendered pieces that don't vectorise cleanly.
2. **The bullet is `tinypng.com 파일크기 압축 필수` — not `Size 전달 필수`.** The other three pages all say "hand the size to development". This page replaces that bullet entirely with a **mandatory compression step through tinypng.com**. That's a hard, tool-named process requirement, and it exists precisely because these are 400×400 PNGs (the only heavyweight assets in the group). **Do not carry "Size 전달 필수" over to Illusts — it isn't stated here.** Conversely, don't apply the tinypng rule to the SVG sets.
3. **Filename embeds the channel**: `ndsw_illust00_nm/qv.PNG` — i.e. `ndsw_illust<NN>_nm.PNG` and `ndsw_illust<NN>_qv.PNG` are two separate files per index.

Note the artboard is **400×400** — 5× the Infographic (80×80) and 10× the Nmoji (40×40). These are hero-scale artwork.

The `ndsww 공통처리` bullet has the same doubled-`w` typo as the Infographics page (and the export filename on this very page says `ndsw_illust…`, single `w`). **The prefix is `ndsw`.** Two pages carrying the identical typo confirms copy-paste propagation, not a distinct namespace.

## Contents & structure

The grid frame (`1604:32`) holds **137 pair-frames**, 5 per row, each frame simply named by its index (`1`, `2`, … `137`). Each pair-frame is 800×400 and contains exactly two 400×400 components side by side:

- **left = `ndsw_illust<NN>_nm`** (x=0)
- **right = `ndsw_illust<NN>_qv`** (x=400)

So: **137 subjects × 2 channels = 274 illustration components.** Numbering is gapless 1–137.

### The NM vs QV style split (confirmed on three separate pairs)

This is the substantive design fact on this page. Screenshotting pairs 1, 21, and 137 shows a **consistent, deliberate style difference** — the two are the *same subject in the same pose*, redrawn in two different rendering styles:

- **`_nm` (NM / 나무 channel)** — flatter, **line-art with soft pastel fill**: visible outline strokes, cel-shaded flat color, a slightly illustrated/hand-drawn feel. Pair 1 (open hand): cream/peach outlined hand. Pair 21 (snow globe): purple/orange flat gift box with clear linework. Pair 137 (binoculars): lavender, outlined, flat-shaded.
- **`_qv` (QV channel)** — **soft 3D render**: no outlines, smooth gradient volume, glossy highlights, ambient shadow — a claymorphic/3D-icon look. Pair 1: rendered 3D hand with a blue sleeve cuff. Pair 21: pink volumetric snow globe with rendered glass. Pair 137: pale blue 3D binoculars with specular highlights.

Also consistent: **the two channels use different palettes for the same subject** — pair 1 is peach/cream (nm) vs blue (qv); pair 21 is purple/orange (nm) vs pink (qv); pair 137 is lavender (nm) vs pale blue (qv). So `_nm`↔`_qv` is **not** a recolour of one file — they are independently drawn artworks. **Never swap one for the other, and never render both channels from a single asset.**

Subject matter is emotive/scenario-oriented rather than iconographic: hands, gift/snow globes, binoculars-over-candlestick-chart, etc. — the vocabulary of empty states, onboarding, celebration, and result screens.

## Verified component keys

Each illustration is its own standalone published COMPONENT — **no component set, no variant axes** (`variantProperties` is `null`). The NM/QV split is **encoded in the component name, not in a Figma variant property.** Sampled and confirmed 2026-07-15:

| Component | key | Size | Notes |
|---|---|---|---|
| `ndsw_illust01_nm` | `3f9c7f99e140ae9d51cbebea44611ebcfd619111` | 400×400 | Left half of pair-frame `1`; line-art/pastel style |
| `ndsw_illust01_qv` | `f2931a087fb312eb299d4c31aa97e41e4f76a3db` | 400×400 | Right half of pair-frame `1`; soft-3D style |

**Important**: because there's no `Channel` variant property, you cannot switch channel by setting a variant — you must **import a different component by a different key**. This is the opposite of how `label_risk` (see `nds-mweb-label-tag`) handles the same NM/QV distinction (there it's a `Type` variant value), and opposite to the `Channel` property the Core reference documents on NDS_Library components. **Three different mechanisms for the same NM/QV concept across this design system** — don't assume one pattern generalises.

## Gotchas

1. **`ndsw_illust809nm` is a malformed layer name.** Node `1606:15239`, inside pair-frame `89` (`1604:12022`), is named **`ndsw_illust809nm`** — it should be `ndsw_illust89_nm`. Two errors at once: a stray `0` and a **missing underscore** before `nm`. Its `_qv` sibling in the same frame is correctly named `ndsw_illust89_qv`, and the frame is `89`, so the intended asset is unambiguously **illust89_nm**. A name-based lookup or a regex expecting `_nm$` / `illust(\d+)_nm` will **silently miss this one asset**. Export it as `ndsw_illust89_nm.PNG`.
2. **Pair-frame `128` has both components stacked at x=400.** In frame `1604:12743`, `ndsw_illust128_nm` (`1606:15317`) and `ndsw_illust128_qv` (`1606:15316`) both sit at **x=400** — every other pair puts `_nm` at x=0 and `_qv` at x=400. The two overlap. So for index 128 you **cannot** rely on the usual "left=nm, right=qv" positional rule; go by layer name. (It also means a screenshot of frame 128 shows only the top one — don't conclude the other is missing.)
3. **`ndsw_illust131_qv` is an INSTANCE, not a COMPONENT.** Node `2812:6696` in pair-frame `131` is type `INSTANCE` while all 273 of its peers are `COMPONENT`. It therefore **has no component key of its own** and can't be imported by key the way the others can. Its `_nm` sibling (`2812:6974`) is a proper COMPONENT. Flag this one if a BUILD pass needs illust131 on the QV channel.
4. **`ndsww 공통처리` is a typo — the prefix is `ndsw`** (single `w`), as the page's own export filename shows.
5. **Frame layer names carry no information** — the export-rule frame (`1604:27`) and grid frame (`1604:32`) are both `" "` (a single space), and the header is `Frame 123818`, the *same* Figma auto-name as the Nmoji and Infographics page headers. **Read the screenshot, not the layer tree** — the same class of layer-name-vs-canvas mismatch documented in `nds-ux-guide-color-contrast` and `nds-ux-guide-touch-area`.
6. **No delivery sticky note on this page.** Nmoji has two and Infographics has one; Illusts has **none**. So the delivery/upload status of these 274 PNGs is **unstated** — not "all delivered". Don't infer availability from the Infographics all-clear; that note governs only its own set. If a BUILD pass depends on an illust being live, that needs confirming outside this file.

## How this feeds BUILD mode

When generating or reviewing NH MTS M.web screens (via `csdesign` → `nds/LEADER.md` Mode 2) that need illustrative artwork:

- **Reach for an Illust when the artwork is the hero of the screen** — empty states, onboarding, completion/celebration, error/result screens. At 400×400 it's the focal point. For a mid-size supporting icon use an **Infographic** (80×80, see `nds-mweb-infographics`); for an inline list-row pictogram use a **Nmoji** (40×40, see `nds-mweb-nmoji-emoji`).
- **The channel choice is mandatory and load-bearing.** Pick `_nm` for 나무 surfaces, `_qv` for QV surfaces — matching the Core reference's `NM`/`QV` convention and its "default to NM unless the target is explicitly a QV surface" rule. Because the styles are genuinely different artwork (line-art vs 3D) in different palettes, **a mismatched channel is immediately visible as an off-brand screen**, not a subtle error.
- **Import by key, not by variant switch.** There is no `Channel` property — `_nm` and `_qv` are separate components with separate keys. Fetch the one you need.
- Export as **`ndsw_illust<NN>_nm.PNG`** / **`ndsw_illust<NN>_qv.PNG`** — PNG (not SVG), `ndsw` single `w`, 400×400.
- **Run every exported PNG through tinypng.com — it's stated as 필수 (mandatory).** This is unique to the Illust set; the SVG sets have no such step. Skipping it ships uncompressed 400×400 PNGs.
- Indices **1–137** exist. Watch the three defects when scripting: **89**'s `_nm` is misnamed `ndsw_illust809nm`; **128**'s two components overlap at the same x (use names, not position); **131**'s `_qv` is an INSTANCE with no key.
- It's `ndsw 공통처리` — a shared common asset; don't duplicate into a screen's own asset folder.
- Delivery status for this set is **unstated** (no sticky note) — verify availability before depending on a specific illust.
