---
name: nds-mweb-nmoji-emoji
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=1196-460"
learned_date: 2026-07-15
sections_studied:
  - "1196:460 (page canvas '    - Nmoji & Emoji' — holds two independent SECTIONs side by side, not one guide)"
  - "1593:1998 (SECTION 'Nmoji_guideline', 1400×1830 — M.web Nmoji header + export rule + the full 40×40 Nmoji grid)"
  - "1593:2059 (the export-rule frame; internal layer name is a single blank space ' ', not a descriptive name)"
  - "1594:308 (ndsw_nmoji01 — sampled COMPONENT, confirmed key)"
  - "1598:146 (SECTION 'Emoji_guideline', 1400×1370 — M.web Emoji header + export rule + the 50×50 Emoji row)"
  - "1598:155 (the Emoji grid frame, also named ' ' — holds all 8 emoji components)"
  - "1127:481 (ndsw_emoji_1f9d0 — sampled COMPONENT, confirmed key)"
  - "2277:6 (instance 'loopy' — designer sticky note, delivery status, on the Nmoji section)"
  - "2793:7 (instance 'sia' — second designer sticky note, newer delivery status, page-level next to Nmoji)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen)
---

# NDS M.web — Nmoji & Emoji (Graphic Asset Library)

Part of the NDS_M.web file's "🌈 Graphic asset" page group. This is an **asset library page**, not a rules document: it exists so a designer can find the right pictographic asset and hand its export filename to development. Two structurally identical but separate libraries live on this one canvas — **Nmoji** (NH's own in-house icon set) and **Emoji** (a small set of standard Unicode emoji re-drawn in NH style). They have different sizes, different naming schemes, and different delivery states; do not treat them as one set.

## Nmoji (`Nmoji_guideline`, section 1593:1998)

Header reads **"M.web Nmoji"** / subtitle **"Nmoji Graphic Asset & & Guideline"** (the doubled `&` is verbatim in the file — the same typo repeats on all four Graphic-asset pages, so it's a template artifact, not a one-off).

Export rule, stated verbatim on canvas:

> **Export → ndsw_nmoji_00.SVG**  (40×40)
> - Size 전달 필수
> - ndsw 공통처리

So: SVG format, **40×40** canvas, filename pattern `ndsw_nmoji_00.SVG` where `00` is the asset's index. "Size 전달 필수" = the intended display size must be handed to development explicitly (the 40×40 is the artboard, not a promise about render size). "ndsw 공통처리" = these are handled as a common/shared `ndsw` resource, not per-screen assets.

**Contents**: a dense flat-color pictogram grid, 14 per row, layer-named `ndsw_nmoji01` … `ndsw_nmoji152`. Subject matter is heavily finance/MTS-oriented — graduation cap, candlestick charts, money bags, ₩/$ coins, NH-branded badges, bank buildings, piggy bank, gold bars, bell, lock, shield, umbrella, cart, globe, rocket, medals (1/2/3), Korean and US flags, plus generic UI metaphors (folder, gear, search, clipboard, speech bubble, hourglass).

**Numbering gotcha — `ndsw_nmoji42` does not exist.** The layer sequence jumps `ndsw_nmoji41` (`1594:269`) → `ndsw_nmoji43` (`1594:268`). So the set runs to index **152** but contains **151** assets. Never assume index N is present just because N-1 and N+1 are; resolve the actual layer name.

### Delivery status (designer sticky notes — read these before using a high index)

Two notes sit next to the Nmoji grid, and **they disagree because one is newer**:

- Note 1 (instance `loopy`, `2277:6`): *"142번까지 전체 전달 완료 (25.11.24)"*
- Note 2 (instance `sia`, `2793:7`): *"147번까지 전체 전달 완료 (26.02.25)"* / *"(146,147은 대체 예정)"*

Read together: as of **2026-02-25**, Nmoji **1–147 are delivered to development**, superseding the older 2025-11-24 "through 142" note. But **146 and 147 are marked 대체 예정 (scheduled to be replaced)** — treat those two as unstable, don't build anything durable on them. And since the grid runs to 152, **`ndsw_nmoji148`–`ndsw_nmoji152` exist in Figma but are NOT yet delivered** — they are design-side only. This is exactly the kind of fact that silently breaks a BUILD pass: the asset is visible in Figma, so it looks available, but development has no file for it.

## Emoji (`Emoji_guideline`, section 1598:146)

Header reads **"M.web Emoji"** / subtitle **"Emoji Graphic Asset & & Guideline"**.

Export rule, verbatim:

> **Export → ndsw_emoji_(이모지 유니코드).SVG**  (50×50)
> - Size 전달 필수
> - ndsw 공통처리

The key difference from Nmoji: **Emoji are named by Unicode codepoint, not by a sequential index** — `ndsw_emoji_(이모지 유니코드).SVG`. The size is also different: **50×50**, not Nmoji's 40×40.

**Contents** — only **8 assets** currently, all in one row (frame `1598:155`):

| Layer name | Codepoint | Emoji |
|---|---|---|
| `ndsw_emoji_1f9d0` | U+1F9D0 | 🧐 face with monocle |
| `ndsw_emoji_1f914` | U+1F914 | 🤔 thinking face |
| `ndsw_emoji_1f60d` | U+1F60D | 😍 smiling face with heart-eyes |
| `ndsw_emoji_1f621` | U+1F621 | 😡 pouting/enraged face |
| `ndsw_emoji_1f973` | U+1F973 | 🥳 partying face |
| `ndsw_emoji_1f44b` | U+1F44B | 👋 waving hand |
| `ndsw_emoji_1f642` | U+1F642 | 🙂 slightly smiling face |
| `ndsw_emoji_1f610` | U+1F610 | 😐 neutral face |

The codepoint in the layer name is lowercase hex with no `U+` prefix — `1f9d0`, not `1F9D0` or `U+1F9D0`. Match that casing when generating filenames.

No delivery sticky note is attached to the Emoji section — unlike Nmoji, its status is unstated. Don't infer that means "all delivered"; it means unknown.

## Verified component keys

Both sets are published COMPONENTs (not variant sets — each asset is its own standalone component, no variant axes at all). Sampled and confirmed 2026-07-15:

| Component | key | Size | Notes |
|---|---|---|---|
| `ndsw_nmoji01` | `72a3253603c42146a454016b890a7552df7a6495` | 40×40 | Representative Nmoji; parent is the SECTION directly, no wrapping component set |
| `ndsw_emoji_1f9d0` | `70fe91b018a6180d6bedc9bcbde35ed0fcd8219b` | 50×50 | Representative Emoji |

**No variant axes** on either — `variantProperties` is `null`, and there is no `Channel` (NM/QV) split here, unlike most NDS_Library components and unlike the Illust set (which *does* split NM/QV). One Nmoji is one component; pick the right index rather than switching a variant.

## Gotchas

1. **Frame layer names are meaningless here.** Both export-rule frames (`1593:2059`, `1598:150`) and the Emoji grid frame (`1598:155`) are literally named `" "` (a single space). The Nmoji/Emoji header frames are named `Frame 123818` / `Frame 123819` — Figma auto-names. All the real information is in the TEXT nodes and the on-canvas render, so **read the screenshot, not the layer tree**. (This is the same layer-name-vs-on-canvas mismatch documented in `nds-ux-guide-color-contrast` and `nds-ux-guide-touch-area`, presenting differently: there the names were wrong numbers, here they're absent entirely.)
2. **The two sets are not interchangeable.** Different size (40 vs 50), different naming scheme (index vs codepoint), different subject matter (finance pictograms vs facial expressions/reactions). Reaching for an Emoji where a Nmoji belongs will ship a wrong-sized asset.
3. **Delivery ≠ existence.** Nmoji 148–152 render in Figma but aren't delivered; 146–147 are delivered but slated for replacement. Check the sticky notes before committing to an index.
4. The subtitle typo **"& &"** appears on every Graphic-asset page header — don't "fix" it when transcribing, and don't treat it as a signal of anything.

## How this feeds BUILD mode

When generating or reviewing NH MTS M.web screens (via `csdesign` → `nds/LEADER.md` Mode 2) that need a pictographic asset:

- **Finance/product/status pictogram at small size** → Nmoji. Export as `ndsw_nmoji_<NN>.SVG`, 40×40 artboard, and pass the intended display size to development explicitly ("Size 전달 필수").
- **Facial expression / reaction / greeting** → Emoji. Export as `ndsw_emoji_<lowercase-hex-codepoint>.SVG`, 50×50 artboard. Only the 8 codepoints listed above exist — do **not** invent a codepoint for an emoji that isn't in the set; there is no fallback rule stated for a missing one.
- **Before specifying any Nmoji index ≥ 143**: check it against the delivery notes. 1–145 are safe; 146–147 are delivered but 대체 예정; 148–152 are undelivered. And index 42 does not exist at all.
- Both are `ndsw 공통처리` — reference them as shared common assets, don't duplicate them into a screen's own asset folder.
- Neither set has a `Channel` (NM/QV) variant — the same asset serves both channels. If a design calls for channel-differentiated artwork, that's the Illust set's job (see `nds-mweb-illusts`), not this one.
