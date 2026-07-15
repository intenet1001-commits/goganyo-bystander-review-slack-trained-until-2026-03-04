---
name: nds-mweb-layout
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=102-480"
learned_date: 2026-07-15
sections_studied:
  - "102:480 (page '    - Layout (진행중)' — WIP page, see WIP finding below)"
  - "105:56 (frame 'M.WEB Blank Usage' — on-canvas heading 'Blank Usage' / 'QV-NM M.WEB Blank Usage'; APP-vs-M.WEB height/size conversion table)"
  - "2343:3022 (frame 'Screens' — base scaffold: 24px side margins, 492px content width, statusbar+Topbar_Dropdown@50%25 opacity)"
  - "2343:3046 (frame 'Screens' — single card_grid_fund, 24px internal padding, on-canvas label '데이터가 많을 때')"
  - "2343:3083 (frame 'Screens' — single card_grid_fund, 30px internal padding, 16px stack gap, on-canvas label '기본')"
  - "2343:3133 (frame 'Screens' — 2-column card_grid_fund grid, 240px columns, 12px gutter)"
  - "2343:3163 (frame 'Screens' — 3-column card_grid_fund grid, 158px columns, 9px gutter)"
  - "2343:3205 (frame 'Screens' > 'Guide' — vertical rhythm scaffold: 60pt/60px/60px spacing bands + highlighted 60px footer band)"
  - "2343:3717 ('[NM] Screens' — full-screen composition: statusbar + header_basic + content + btn_bottom_page + quickmenu_basic, NM channel)"
  - "2343:3722 ('[QV] Screens' — same composition, QV channel — statusbar/CTA recolor confirmed)"
  - "2343:4053 ('상단안내영역01' — Subpage_top banner, height 200, no-button variant, real Korean copy example)"
  - "2343:4062 ('상단안내영역02' — Subpage_top banner, height 268, with-button variant, filler-text example)"
  - "2343:4066, 2343:4070 ('상단안내영역03/04' — same Subpage_top instance at height 268 per metadata; not independently screenshotted, see gaps)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen) — page is explicitly marked work-in-progress by the file itself
---

# NDS M.web — Layout (page marked 진행중 / work-in-progress)

Layout/spacing scaffolding for the **NDS_M.web** library (`uVcmG6GgOl2J8EOlc22wob`). This page's own name is `    - Layout (진행중)` — **진행중 means "in progress."** This is a load-bearing finding, not a gap to quietly fill: everything below is what the page currently shows, not a finished, ratified spec. Treat any measurement here as "current draft," and re-verify before treating it as frozen truth, especially anything not cross-confirmed by a second source.

**On-canvas evidence of WIP state**: no single "not done yet" banner exists on the page, but the content itself reads as scaffolding-in-progress — every "Screens" measurement frame uses the literal placeholder header text **"타이틀"** (= "Title") rather than a real screen name, every CTA reads the placeholder **"버튼명"** (= "button name"), and the 상단안내영역02 variant uses **repeating Korean numeral filler text** (`일이삼사오육칠팔구십일이삼사...`, i.e. "1234567891123..." spelled out) standing in for real copy — the design-system equivalent of lorem ipsum. Only 상단안내영역01 carries an actual finished-looking copy example. The page mixes finished component swatches (statusbar, keyboard, date picker — all off to the side at large x-offsets) with unfinished layout-rule scaffolds (the "Screens" grid frames) — consistent with a page still being assembled.

## The APP-vs-M.web size conversion table (`105:56`)

On-canvas heading: **"Blank Usage"** / subheading **"QV-NM M.WEB Blank Usage"**. Two columns, **APP** and **M.WEB**, giving a direct numeric mapping — read as "this APP value becomes this M.WEB value":

| APP | M.WEB |
|---|---|
| 100 | 68 |
| 80 | 56 |
| 75 (btn h75) | 50 |
| 70 | 48 |
| 60 | 40 |
| 50 | 32 |
| 40 | 28 |
| 30 | 20 |
| 24 | 16 |
| 20 | 12 |
| 16 | 10 |
| 12 | 8 |
| 10 | 6 |
| 6, 8 | 4 |
| 4 | 2 |
| 2 | 1 |

Quoted verbatim from the table's own row labels, including the one annotated row: **`75 (btn h75)` → `50`** — i.e. the APP-side 75pt button height token maps to a 50px M.web equivalent. Every other row is a bare number with no unit marked on the frame; treat APP values as the native-app point scale and M.WEB values as this file's own web-pixel scale. **This is the only place in the file (so far) that gives a systematic APP→M.web conversion ratio** — worth cross-referencing against the Core reference's "build at 540px, not 375px" canvas-width finding, since neither ratio is a clean 1:1 or fixed multiplier (100→68 is ×0.68, but 2→1 is ×0.5) — **the mapping is non-linear, don't infer a single scale factor**.

## Content-card padding scaffolds (the `card_grid_fund` "Screens" frames)

Six sibling frames named "Screens" hold spacing scaffolds for a `card_grid_fund` card component, at different column counts. All share the same base chrome: `statusbar` instance + a `Topbar_Dropdown` instance (shown at 50% opacity in the base scaffold, `2343:3022`) with placeholder title text **"타이틀"** ("Title") and a chevron.

**Base scaffold (`2343:3022`)**: page-level margins are **24px** on both left and right, giving a **492px** content width inside the 540px canvas (540 − 24 − 24 = 492). This 492px content width recurs as the reference width in every other "Screens" frame below.

**Single-card padding, "데이터가 많을 때" variant (`2343:3046`)**, on-canvas label **"데이터가 많을 때"** ("when there's a lot of data"): the `card_grid_fund` card takes the full 492px content width, with **24px internal padding on all four sides** (top/bottom/left/right all labeled `24px`), leaving 444px of inner content width for the dense-data layout.

**Single-card padding, "기본" (default) variant (`2343:3083`)**, on-canvas label **"기본"** ("basic/default"): padding is **30px on all four sides** instead of 24px, and there's a **16px** gap called out between this card and an adjacent stacked card. So the card component has (at least) two padding presets on this page — 24px for dense/"많을 때" content, 30px for the "기본" default case — don't assume one universal padding value.

**2-column grid (`2343:3133`)**: two `card_grid_fund` cards side by side, each **240px** wide, with a **12px** gutter between them (240 + 12 + 240 = 492, matching the content width above).

**3-column grid (`2343:3163`)**: three `card_grid_fund` cards, each **158px** wide, with **9px** gutters between each pair (158 + 9 + 158 + 9 + 158 = 492, again matching).

**Vertical rhythm scaffold, "Guide" (`2343:3205`)**: a different kind of spacing guide — not card padding but page-level vertical spacing between stacked full-width blocks. Labeled spacing values read top to bottom: **60pt** (from header down to the first block), **60px**, **60px** (between subsequent blocks), and a distinctly **highlighted light-green 60px band** at the very bottom of the frame (the metadata shows this corresponds to an 80px-tall spacing group further down in the same "Guide" frame per `2343:3242`/`3246`, labeled `80px` — **not independently screenshotted**, so the 80px value is metadata-only and unverified against canvas; the 60pt/60px values above are confirmed by screenshot). The mix of `pt` (first gap) and `px` (later gaps) on the same scaffold is the guide's own notation, not a transcription error — quoted as shown.

## Full-screen composition, NM vs QV (`2343:3717` / `2343:3722`)

Two sibling frames, `[NM] Screens` and `[QV] Screens`, each composing: `statusbar` → `header_basic` → content area → `btn_bottom_page` (bottom CTA) → `quickmenu_basic` (bottom nav). Both placeholder-labeled: title **"화면 타이틀명"** ("screen title name"), CTA button **"버튼명"** ("button name").

**Channel divergence, confirmed by screenshot — a NEW finding beyond `nds-mweb-colors`:**
- **NM (`2343:3717`)**: statusbar renders **white/transparent** (no visible colored bar), bottom CTA bar is **green**, `quickmenu_basic`'s active/accent icon (the layered-squares icon, rightmost slot) renders **green**.
- **QV (`2343:3722`)**: statusbar renders as a **solid dark navy bar** (not just a color-shift of NM's white — a structurally different statusbar treatment), bottom CTA bar is **orange/amber** (consistent with `nds-mweb-colors`' documented QV brand hex `#FFAA1A`), and the same `quickmenu_basic` accent icon renders **orange**.

The CTA-button and quickmenu-accent color swap matches the already-documented NM(green)/QV(orange) `Channel` variant axis exactly. **The dark-navy QV statusbar is the new information this page adds**: it implies QV screens don't just recolor accents, they use a visually distinct (dark) status-bar/top-of-screen treatment vs NM's plain white — worth flagging to whoever owns the Core reference's `Channel` note, since the Core reference currently only documents the accent-color swap, not a statusbar-chrome difference. **Not yet cross-checked against a second QV-channel source** — record as a single-observation finding, not yet promoted to Core.

## Top guide-area banners, "상단안내영역01–04" (`2343:4053/4062/4066/4070`)

Four sibling frames, each an `Subpage_top` instance (informational banner slotted directly under `header_basic`, above the rest of the screen content) at two heights: 01 uses `Subpage_top` at height 200, 02/03/04 use it at height 268 (per metadata `y`/`height` values — 03 and 04 not independently screenshotted, see Gaps).

**상단안내영역01 (`2343:4053`, screenshotted)** — the one variant on this page carrying **real, finished-looking copy**, not placeholder text:
> **"1주 단위 자동전환을 신청하면?"**
> "소수점 잔고가 1주 단위로 자동전환되어 빠른 일반 거래가 가능합니다."

(= "If you apply for weekly auto-conversion? / Fractional-share balances auto-convert weekly, enabling faster regular trading.") Paired with a 140×140 illustration (`기본/모바일_illust23`) at the right, no button. **No card/box background** is used for this banner — it sits directly on white with a thin bottom rule.

**상단안내영역02 (`2343:4062`, screenshotted)** — structurally the "with button" variant: same headline+body+illustration layout, but adds a **"버튼명"** CTA button below the body text, and uses filler text instead of real copy: headline **"일이삼사오육칠팔구십일이삼사"** and two lines of the same repeating-numeral filler as body — confirming this specific variant instance is still a placeholder, not a shipped example (reinforces the page's overall WIP status). This variant also shows a light-gray card/box background behind the whole banner block (distinct from 01's plain-white treatment) — an unexplained visual difference between 01 and 02 that the page doesn't caption; don't assume one is "more correct" than the other without asking the design owner.

## How this feeds BUILD mode

- **Everything on this page is provisional** — it's the one page in the file explicitly labeled 진행중. Prefer a page from `NDS_UX Guide` or a confirmed component key from the Core reference when a rule conflicts; use this page's numbers as a starting point, not a final spec, and re-verify before shipping against them.
- **492px is the recurring content width** inside the 540px canvas (24px margins each side) — consistent with the Core reference's "build at 540px" canvas-width rule; this page supplies the margin math behind that number.
- **Card padding is not universal**: 24px for dense/"많을 때" content, 30px for "기본" default — pick based on content density, not a single hardcoded padding.
- **Grid gutters scale down as columns increase**: 12px gutter at 2 columns, 9px gutter at 3 columns — don't reuse one gutter value across column counts.
- **QV screens may need a dark statusbar treatment**, not just accent recoloring — flag this to whoever builds a QV full-screen mockup; it's unverified beyond this one screenshot pair.
- **The APP→M.web size table is non-linear** — look up the specific value needed, don't compute from a ratio.

## Gaps found at source

- **상단안내영역03/04 (`2343:4066`, `2343:4070`) not independently screenshotted.** Metadata shows the same `Subpage_top` instance at height 268 as 02, but nothing confirms whether 03/04 carry real copy, filler copy, a button, or a background box — unverified, don't assume they match 02.
- **The "Guide" vertical-rhythm scaffold's `80px` spacing group (`2343:3242`/`3246`) is metadata-only** — not confirmed by screenshot in this pass.
- **Component/variant "symbol" swatches on this page** (`keyboard` types kor/eng/number/keypad/password/date-picker at `1707:1027`; `statusbar` NM/QV/Clear × dark/light at `1707:1095`; `sectionbar` at `1707:1109`; `date picker calendar` states at `1707:1114`) sit off to the side at large x-offsets (x=2725–6820) and were **not screenshotted this pass** — they read as a components reference dump rather than layout rules, but their content is unverified beyond node names.
- **Six stray text nodes named `토스트/체결알림 정의`** ("toast/fill-alert definition") scattered across the canvas (e.g. `319:5079`, `1707:1024`, `2343:3716`) were **not screenshotted** — per this skill's own warning, a TEXT node's name is not reliable evidence of its content; these are unverified annotations, not confirmed rules.
- **No explicit "Last update" date stamp found on this page** (unlike several NDS_UX Guide pages) — can't date-check this page's freshness against other sources.
