---
name: nds-tpl-layout
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=3760-33077"
learned_date: 2026-07-15
sections_studied:
  - "3760:33077 (page '    - Layout  레이아웃' — title on-canvas: 'Layout' / 'QV-NM Template Guide')"
  - "3781:30149 ('1' — 헤더 기준: history back / dropdown / close semantics diagram)"
  - "3781:30115 ('2' — 헤더 예시: Screen/1Level/2Level/Full-popup naming grid)"
  - "3781:30196 ('3' — 화면 이동 구조: Screens/Full-popup navigation-stack diagram)"
  - "4586:20144 (간격_카드 — card vertical-spacing spec: 40px top, 20px between cards)"
  - "4585:38678 (간격_인풋 — input-field vertical-spacing spec: 40px between fields)"
  - "5158:18555 / 5158:18620 (Screens_headercombo_NM — dropdown mega-menu compositions)"
status: internal NDS component-library guide (Templates file — screen-structure + spacing rules, not a component swatch sheet)
---

# NDS Templates — Layout 레이아웃

Rules-bearing page (title on-canvas: **"Layout" / "QV-NM Template Guide"**) covering screen-structure semantics (header button meanings, screen-navigation stack diagram) and vertical-spacing specs (card/input gaps), plus ~20 composed screen mockups (tab layouts, sub-page top banners, FAB variants, empty-state, header-combo dropdown). Unlike Data Table, this page carries genuine prose/diagram rules, not just a usage gallery.

## Layer-name convention — MIXED, screenshot-confirmed

Container **frame** names are bare numerals (`"1"`, `"2"`, `"3"`) that do **not** match their on-canvas headings — same mismatch pattern documented on the UX Guide (frame `02` displaying heading `01`). But every **text/instance** layer name sampled matched its displayed content verbatim: `헤더 기준` (3781:30166), `화면 이동 구조` (3781:30197), `history back`/`dropdown`/`close`, and the `40px`/`20px` spacing-callout labels all render exactly as named. **Verdict: frame containers unreliable, text/instance leaves reliable** — confirms this file's per-page (not per-file) convention finding.

## ANSWER — canvas width / margins / grids stated on this page

**Canvas width: 540px**, confirmed again (`Screens_1Level`, `간격_카드`, `간격_인풋`, all composed screens = `width="540"`) — agrees with Core's 540px-canvas baseline and every sibling NDS_Templates page.

**Content width/margins — 492px inside 540px canvas, 24px margins, AGREES with `nds-mweb-layout`.** Both `간격_카드` (`card_grid_fund` frames) and `간격_인풋` (`input_line` frames) sit at `x="24"` with `width="492"` inside their `width="540"` parent (24 + 492 + 24 = 540) — an exact, independent confirmation of the M.web file's 492px-content/24px-margin finding, on a **different platform file**. This is now corroborated cross-file.

**New vertical-spacing rule (not in `nds-mweb-layout`)**: screenshot of `간격_카드` shows explicit on-canvas callouts — **40px** gap between the top bar and the first card, **20px** gap between stacked cards. Screenshot of `간격_인풋` shows a flat **40px** gap before every input row (top offset and every inter-field gap all read 40px). These are page-top/inter-element spacing values, distinct from M.web's `card_grid_fund` *internal padding* presets (24 dense / 30 default) — no contradiction, different measurement (gap vs. padding).

**No 2-col/3-col grid table found on this page** — M.web's 2-col(240/12)/3-col(158/9) grid finding is neither confirmed nor contradicted here; this page's cards are single-column, full content-width (492px).

**QV dark-navy statusbar** — not tested; the one `statusbar` instance sampled here resolved to `Type=NM, Dark mode=false`. Silent on QV.

## Screen-navigation semantics (new content, not elsewhere)

Screenshot of frame `1` (헤더 기준, `3781:30149`) states verbatim button meanings for two header families:
- **`history back`** (‹ icon): "이전 화면으로 이동"
- **`dropdown`** (⌄ icon, 스크린 header only): "동일한 그룹의 메뉴로 이동"
- **`close`** (✕ icon, 풀팝업 header only): "풀팝업 닫음 (팝업을 호출한 스크린 화면으로 이동)"

Screenshot of frame `3` (화면 이동 구조, `3781:30196`) states the screen-stack model verbatim: **"Screens : 화면의 본판"**, **"Full popup : Screen 위로 화면이 뜹니다."**, **"Full popup→Full popup : 헤더에 뒤로가기가 생성됩니다."** — i.e. a full-popup stacked on another full-popup gains a back-arrow (history-back) in its header, distinct from the single-level popup's plain close button.

## TIERS — all 6 sampled instances published, 0 doc-copy, 0 scaffolding

Explicit-node-ID resolution succeeded on every attempt (page-wide `getMainComponentAsync` looping over an array threw `"Operation attempted to modify the file while in read-only mode"` on the first try — confirms this file's known intermittent read-only degradation; single-ID calls, one per script, worked every time).

## KEYS — max 5 shown (6 sampled total, all remote: true, COMPONENT + COMPONENT_SET parent)

| Instance | variant (`main.name`) | `main.key` | parent SET key | vs Core |
|---|---|---|---|---|
| `header_basic` (6202:17680) | `Channel=NM, Left Icon=on, Right Icon=off` | `c7706f72a1…` | `c95043e94317fde…` | **= Core exactly** |
| `quickmenu_basic` (3781:30422) | `Channel=NM, Type=normal` | `0b75c3c90e…` | `9c5dd3cd3e714255…` | **= Core exactly** |
| `btn_bottom_page` (3781:31012) | `Channel=btn_bottom_layerpopup, Type=btn_bottom_page, Status=NM` | `3ef42b8dfd…` | `accfb243ce752fd8…` | **≠ Core's `btn_bottom_page_assets`** (confirms the distinct-component finding) |
| `Topbar_Dropdown` (3781:30128) | `Channel=NM, Type=basic, Combo=off` | `69e7ffd43c…` | `ce701f7c5eda2307…` | new, not in Core table |
| `Topbar_Fullpop` (3781:30130) | `Channel=NM, Title=on, L-icon=on` | `fec292daa5…` | `15a9d9b9e38248d3…` | new, not in Core table |
| `statusbar` (4586:20145) | `Type=NM, Dark mode=false` | `169d23c202…` | `fe57c685f5a27a53…` | **yet another distinct `statusbar` key** — adds to the ≥4-key collision LEADER.md already flagged |

## Findings summary

- **Cross-file corroboration**: 492px content width / 24px margins inside a 540px canvas, independently confirmed on both NDS_Templates (this page) and NDS_M.web's Layout page — a genuinely cross-platform, cross-file convention, not a one-off.
- **`header_basic` and `quickmenu_basic` both match Core exactly** — two more data points for Core over M.web's rival keys on `header_basic`.
- **`statusbar` name-collision problem gets worse**: a new, distinct key (`fe57c685…`) joins the ≥4 already logged in `LEDGER.md` — same name, different real published components, unresolved.
- Screen-navigation and header-button semantics are genuinely new content (verbatim rule copy), not duplicated anywhere else learned so far.
- `btn_bottom_page`'s variant name literally embeds `Channel=btn_bottom_layerpopup` — a stray/garbled Channel value (should be `NM`/`QV`), a minor data defect worth flagging alongside the file's other `\b`/`\x08` naming glitches.

## Blanks / gaps

- **No page-wide instance sweep possible** — `getMainComponentAsync()` looped over 8 explicit IDs in one script threw `"Operation attempted to modify the file while in read-only mode"`; switching to one-ID-per-script succeeded 6/6. Coverage of this page's full instance set (FAB variants, empty-state, header-combo dropdown internals) is **not exhaustive** — only the 6 keys above are directly observed.
- 2-col/3-col grid rule (present in `nds-mweb-layout`) **not found anywhere on this page** — absence noted, not proof it doesn't apply to this platform; this page simply doesn't show a multi-column card grid.
- QV-channel statusbar chrome (dark-navy, per `nds-mweb-layout`'s single observation) not re-tested here — the one statusbar sampled was NM/light.
- `importComponentSetByKeyAsync` not attempted (read-only session) — all keys above are `unverified — read-only session` per the file-wide caveat, read via live-instance `getMainComponentAsync()` rather than import.
