---
name: nds-mweb-infographics
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=1196-462"
learned_date: 2026-07-15
sections_studied:
  - "1196:462 (page canvas '    - Infographics' — one SECTION plus one page-level sticky note)"
  - "1598:1124 (SECTION 'Infographic_guideline', 1740×3899 — header + export rule + the full 80×80 grid)"
  - "1598:1128 (export-rule frame; internal layer name is a single blank space ' ')"
  - "1598:1133 (the grid frame, 1540×3080, also named ' ' — holds all 205 infographic components, 10 per row)"
  - "1598:1863 (ndsw_infographic01 — sampled COMPONENT, confirmed key)"
  - "3138:263 (instance 'sia' — designer sticky note, delivery status, with a struck-through superseded line)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen)
---

# NDS M.web — Infographics (Graphic Asset Library)

Part of the NDS_M.web file's "🌈 Graphic asset" page group. An **asset library page**, not a rules document — its job is to let a designer find an infographic icon and hand its export filename to development. Structurally it is the same template as `nds-mweb-nmoji-emoji`: dark header band → export-rule block → one big grid of standalone components.

Header: **"M.web Infographic"** / subtitle **"Infographic Asset & & Guideline"** (the doubled `&` is verbatim — a template artifact shared across all four Graphic-asset pages).

## Export rule (verbatim)

> **Export → ndsw_infographic_00.SVG**  (80×80)
> - Size 전달 필수
> - **ndsww 공통처리**

SVG format, **80×80** artboard, filename pattern `ndsw_infographic_00.SVG` where `00` is the index. "Size 전달 필수" — the intended display size must be handed to development explicitly; 80×80 is the artboard, not a render-size promise.

**Typo worth knowing about**: the third bullet reads **`ndsww 공통처리`** — a doubled `w`. Every other Graphic-asset page says `ndsw 공통처리` (single `w`), and the export filename on this very page is `ndsw_infographic_00.SVG` (single `w`). So `ndsww` is a **typo in the guide text, not a different namespace** — the prefix is `ndsw`. The Illusts page carries the identical `ndsww` typo, which confirms it propagated by copy-paste rather than meaning anything. Do **not** generate a filename with `ndsww`.

## Contents

One grid frame (`1598:1133`), 10 icons per row, layer-named **`ndsw_infographic01` … `ndsw_infographic205`** — **205 assets, numbering complete with no gaps** (unlike the Nmoji set, which is missing index 42).

Style: full-color, soft-shaded, semi-dimensional icons — noticeably richer than the flat Nmoji pictograms, and at double the artboard size (80×80 vs Nmoji's 40×40). Several are visibly the *same subject* as a Nmoji (piggy bank, umbrella, gift, bell, rocket, medals 1/2/3, Korean flag, US flag, gold bars, ₩/$ coins, trophy, cart, folder) but drawn larger and with more depth. **They are not substitutes for each other** — different size, different fidelity, different intended context.

Subject range, finance/MTS-oriented as expected:
- **Money & instruments**: banknotes, coins (₩/$/©/Ⓟ), gold bars, piggy bank, wallet, money bags, card, ETF badge, BTC, candlestick charts, 매수/매도/수익률 badges, IPO, TAX
- **Institutions & places**: bank building, storefront, house, factory, ATM/kiosk
- **People & service**: agent/headset figures, faces, hands (👍/✌️/👌/✋), baby, elderly
- **Status & alerts**: warning triangle, siren, alarm clock, lock, shield, checkmark badges, cloud-download / cloud-error
- **Generic UI**: folder (incl. folder-error), search, gear, link, calendar, clipboard, pencil, envelope, speech bubble, WiFi/satellite, QR/scan frames, binoculars, map, robot, graduation cap, rocket, recycle, heart, star, pie chart, gauges (a full set of ~5 gauge states at different fill levels)

## Delivery status (designer sticky note — the highest-value find on this page)

One note (instance `sia`, `3138:263`) sits below the grid, and it carries **its own superseded line struck through**, which tells you the history:

> ~~"(26.04.22) ~205까지 개발에 파일만 우선 전달, 반영 전"~~
> "(26.05.18) ~205까지 개발 서버 업로드 완료"

Reading it:
- **2026-04-22** (struck through, no longer true): files for 1–205 had been handed to development, but **반영 전** — not yet applied/integrated.
- **2026-05-18** (current): **~205까지 개발 서버 업로드 완료** — all 205 are uploaded to the dev server.

So **the entire set, `ndsw_infographic01` through `ndsw_infographic205`, is delivered and live on the dev server as of 2026-05-18.** This is the cleanest delivery state of the three asset pages: no gaps, no 대체 예정 caveats, no undelivered tail. Contrast with Nmoji (`nds-mweb-nmoji-emoji`), where indices 148–152 exist in Figma but are undelivered and 146–147 are slated for replacement — **do not carry Nmoji's caution over to Infographics, and do not carry Infographics' all-clear back to Nmoji.** Each set's sticky note governs only its own set.

The struck-through line is also a useful precedent: **these designers strike through superseded notes rather than deleting them.** When reading any sticky note in this file, check for strikethrough formatting before trusting a line — a Mode 3 VERIFY pass that reads the struck line as current would report the wrong status.

## Verified component keys

Every asset is its own standalone published COMPONENT — **no component set, no variant axes** (`variantProperties` is `null`). Sampled and confirmed 2026-07-15:

| Component | key | Size | Notes |
|---|---|---|---|
| `ndsw_infographic01` | `d56a63cf0b7f00d1744a6a44c405c59608dc1ba4` | 80×80 | Representative sample; parent is the unnamed grid frame `1598:1133` |

No `Channel` (NM/QV) split here — one infographic serves both channels, same as Nmoji/Emoji. Only the Illust set is channel-differentiated (see `nds-mweb-illusts`).

## Gotchas

1. **`ndsww 공통처리` is a typo — the prefix is `ndsw`.** The filename on the same page proves it. Same typo appears on the Illusts page.
2. **Frame layer names carry no information.** The export-rule frame (`1598:1128`) and the grid frame (`1598:1133`) are both named `" "` (a single space); the header is `Frame 123818` (Figma auto-name — and note the Nmoji page's header frame has the *identical* auto-name `Frame 123818`, so the name doesn't even identify the page). All real content is in TEXT nodes and the render. **Read the screenshot, not the layer tree.** Same class of mismatch as documented in `nds-ux-guide-color-contrast` / `nds-ux-guide-touch-area`, manifesting as absent names rather than wrong ones.
3. **Infographic ≠ Nmoji, even for the same subject.** Overlapping icons exist (piggy bank, umbrella, gift, medals, flags…). Choose by required size/fidelity, not by whichever you find first: 80×80 rich → Infographic; 40×40 flat → Nmoji.
4. **Check for strikethrough on sticky notes** before treating a line as current status.

## How this feeds BUILD mode

When generating or reviewing NH MTS M.web screens (via `csdesign` → `nds/LEADER.md` Mode 2) that need a mid-size illustrative icon:

- **Reach for an Infographic when the icon is a focal element** — an empty-state icon, a feature/benefit row, a card header, a result badge. At 80×80 it's meant to be looked at, not scanned past.
- **Reach for a Nmoji instead** (see `nds-mweb-nmoji-emoji`) when it's an inline/list-row pictogram at 40×40. **Reach for an Illust** (see `nds-mweb-illusts`) when it's a full 400×400 hero/empty-state artwork.
- Export as `ndsw_infographic_<NN>.SVG` — `ndsw`, single `w`, regardless of the `ndsww` typo in the guide. Pass the intended display size to development explicitly ("Size 전달 필수").
- **All 205 indices are safe to specify** — the set is gapless and fully uploaded to the dev server as of 2026-05-18. This is the only one of the three asset sets with no index-availability caveat, so it needs no per-index delivery check the way Nmoji does.
- It's `ndsw 공통처리` — reference as a shared common asset, don't duplicate into a screen's own asset folder.
- No `Channel` variant — the same infographic serves both NM and QV surfaces. Don't look for an NM/QV pair here.
