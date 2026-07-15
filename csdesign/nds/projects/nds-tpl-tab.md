---
name: nds-tpl-tab
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=1886-24994"
learned_date: 2026-07-15
sections_studied:
  - "1886:24994 (page '    - Tab 탭' — full metadata returned inline, no overflow/auto-save; complete tree, not a lazy-loaded partial)"
  - "1887:25994 (frame 'title' — on-canvas 'Tab' / 'QV-NM Template Guide', verbatim)"
  - "1886:25073 / 9658:17167 / 3930:31225 (frames 'Tab_1depth_01/03/02' — quickmenu_basic + Topbar_Dropdown + statusbar + tab_1depth_line, empty content body)"
  - "1887:25461 / 9658:17406 / 1887:25629 (frames 'Tab_1.5depth_01/03/02' — same shell + r_squre_2btn (2-button row) + tab_1.5depth_line)"
  - "1887:26256 / 9658:17497 (frames 'Tab_2depth_01' ×2 — same shell + tab_1depth_line + tab_2depth_switch)"
  - "1887:26905 (frame 'Tab_2depth_02' — hand-drawn spec diagram: bare 'Tab' frame with two 'Tab명' placeholder cells, Subpage_top card, and a hand-built 2-pill 'Tab' group labeled 진행중/종료)"
  - "1886:25015 / 1890:25894 / 3823:30801 (frames 'tab_popup_01/02/03' — tabs inside sliding popups: tab_1depth_line, tab_2depth_button (country pills), tab_2depth_switch (fund pills) respectively)"
  - "29578:2535 (section '예외 케이스 컬러' — NM<->QV 컬러코드 동기화 exception case, two '[NM] 거래내역' screens)"
status: NDS_Templates full-page composition guide — subscribes to NDS_Library (per LEADER.md pre-loaded verdict); component instances used here are real components, not page-local re-creations, though remote status could not be independently confirmed (read-only session)
---

# NDS_Templates — Tab 탭

Page `1886:24994` in **NDS_Templates** (`1xE0qvn2yv3ZkQ9BwhKT1y`), title-block-stamped **"Tab" / "QV-NM Template Guide"** (verbatim, `1887:25995`/`1887:25996`). This is a **third, distinct kind of tab documentation** alongside the two already-registered sibling notes — do not conflate:

- `nds-ux-guide-tab.md` (NDS_UX Guide) = the **rules**: is-it-even-a-tab test (no navigate on select / single horizontal row / single-select).
- `nds-mweb-tab.md` (NDS_M.web) = a **specimen sheet**: bare component variants (`tab_1depth_line`, `tab_2depth_button`, `tab_btn`), zero usage rules, explicitly `(진행중)`.
- **This page (`nds-tpl-tab`) = full-screen compositions**: shows where each tab depth sits inside a real screen (header position, popup context) using instances of the M.web components, with **zero "is it a tab?" rule copy of its own** — it assumes that judgment was already made and shows only placement.

## What this page adds: a depth taxonomy the other two files don't have

On-canvas annotation labels (verbatim, next to each row of example frames) name three placement tiers plus a popup variant:

- **"1depth 최상단(위치고정)"** ("1depth, topmost, fixed position") → `Tab_1depth_0{1,2,3}`: `statusbar` + `Topbar_Dropdown` + `tab_1depth_line`, directly under the header, no other chrome between header and tab.
- **"1.5depth 화면 상단"** ("1.5depth, top of screen") → `Tab_1.5depth_0{1,2,3}`: same shell but with an `r_squre_2btn` (2-button row) inserted **above** `tab_1.5depth_line` — a distinct component (`tab_1.5depth_line`, not `tab_1depth_line`) not previously recorded in either sibling note.
- **"2depth 화면 중간"** ("2depth, mid-screen") → `Tab_2depth_01` ×2: `tab_1depth_line` (top) **plus** `tab_2depth_switch` lower on the screen — two tab controls stacked, confirming `tab_2depth_switch` is a real, distinct component from `tab_2depth_button` (both appear on this page; M.web's note only documented `tab_2depth_button`).
- **"in Popup 팝업"** → `tab_popup_01/02/03`: tabs composed inside `popup_silding_basic_sentence02` / `popup_silding_select02` sliding-popup shells, each ending in a `btn_bottom_page` CTA. Confirms tabs are a legitimate popup-interior pattern, not just full-screen.

`Tab_2depth_02` (`1887:26905`) is a **hand-drawn spec diagram**, not a composed example: a bare `Tab` frame with two placeholder `Tab명` cells (no component instance — built from raw rectangles/text/line), plus a second hand-built 2-pill group literally named `Tab` with cells labeled **"진행중"/"종료"** ("in progress"/"ended"). This reads as an annotator's own mockup of a filter-tab example, not a shipped component.

## Screenshot content confirms

- `Tab_1depth_01`: 3-way `Tab명`/`Tab명`/`Tab명` line tab under a dropdown-title header (`타이틀 ⌄`) and back arrow, first tab active (bold + underline), body empty.
- `tab_popup_02`: `tab_2depth_button` rendered as 6 country pills — **미국/중국/홍콩/일본/베트남/인도** (active pill filled dark) — inside a sliding popup with real disclosure body copy (대차체결증권 배당/의결권 language) and a green `확인` CTA.
- `tab_popup_03`: `tab_2depth_switch` rendered as 4 pills — **주식/펀드1/펀드2/펀드3** — with rows below all reading **"선택되지 않은 항목입니다."** (empty-state placeholder, not real data).
- `예외 케이스 컬러` section: two `[NM] 거래내역` screens shown side by side (one white/light topbar, one dark-navy topbar) with a stated color-sync exception: **NM↔QV 컬러코드 동기화** — 배경색:018, 활성화 Text:061, 비활성화 Text:049, 활성화 라인색상:185, 비활성화 라인색상:017. Unlike `nds-mweb-colors.md`'s pattern (NM/QV normally diverge in hex per same slot), this section explicitly calls out a case where the **same numeric color codes are shared/synced** across channels rather than diverging — a genuinely new fact not in either sibling color/tab note.

## Layer-name convention — screenshot-confirmed: reliable

Frame names (`Tab_1depth_01`, `Tab_1.5depth_01`, `Tab_2depth_01`) match their on-canvas depth-label annotations exactly (1depth/1.5depth/2depth), and the title frame's layer name (`title`) matches its on-canvas heading ("Tab"). No frame-name/on-canvas mismatch found on this page — contrast the NDS_UX Guide, where this was a confirmed, repeated failure mode.

## Tiers — unverified (read-only session)

Per instructions, `getMainComponentAsync()`/`.remote` classification requires a write-capable `use_figma` call. Attempted once (`setCurrentPageAsync` + `getMainComponentAsync` on 9 instance IDs); the call threw `"Operation attempted to modify the file while in read-only mode."` before any read data returned. **No tier classification could be captured for `tab_1depth_line`, `tab_1.5depth_line`, `tab_2depth_button`, `tab_2depth_switch`, `r_squre_2btn`, `header_basic`, `nds_icon_arrow`, or any other instance on this page.** Consistent with LEADER.md's pre-loaded verdict that NDS_Templates subscribes to NDS_Library (so these are plausibly real published components, matching M.web's confirmed `header_basic`/`nds_icon_arrow` keys elsewhere), but that plausibility is not independent confirmation here.

## ANSWER — is `tab_2depth_chip` (Core key `0f20528265a3c598e42e30f6ae422be67e941c10`) sourced on this page?

**No.** The full page metadata (returned inline in one call, not overflowed/truncated) was searched exhaustively for the literal string `tab_2depth_chip` and for the `Property 1` variant-axis name — neither appears anywhere. Every instance/frame name on this page was enumerated: `tab_1depth_line`, `tab_1.5depth_line`, `tab_2depth_button`, `tab_2depth_switch`, `r_squre_2btn`, `popup_silding_select_asset`, `quickmenu_basic`/`quickmenu`, `Topbar_Dropdown`, `statusbar`, `header_basic`, `btn_bottom_page`, `account_trading_withbtn`, `account_combo_assets`, `Basic_btn`, `Basic`, `nds_icon_arrow`, `Subpage_top`, `viviana`. None is named `tab_2depth_chip`, and this page's variant axes are `Colum`/`Type` (inherited from M.web), `Channel`, and none carry a `Property 1` axis at all — the hand-drawn `Tab_2depth_02` pill group (`진행중`/`종료`) is the closest visual analog (a 2-cell pill toggle) but is explicitly not a component instance (no instance node backs it) and not named `tab_2depth_chip`. `tab_2depth_chip`'s real source page remains unidentified after checking all three now-learned tab pages (`nds-ux-guide-tab`, `nds-mweb-tab`, `nds-tpl-tab`).

## Blanks / gaps

- No `tab_2depth_chip` match (see above) — open question still unresolved after this page.
- Component tiers (published/doc-copy/scaffolding) unverified — read-only session blocked `getMainComponentAsync`.
- `Tab_2depth_02`'s hand-drawn `진행중`/`종료` pill group has no stated purpose annotation beyond its own labels — unclear if it's an intended chip-tab pattern or scratch work; not claimed as either.
- No numeric px-height spec or item-count rule anywhere on this page (consistent with M.web's page — those rules live only in the UX Guide).
