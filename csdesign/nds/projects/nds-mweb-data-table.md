---
name: nds-mweb-data-table
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=616-427"
learned_date: 2026-07-15
sections_studied:
  - "616:427 (page '    - Data Table  (진행중)' — single content page, no sub-sections)"
  - "616:867 (Title_table frame — on-canvas heading 'Data Table' / 'QV-NM Table Design Guide', section label 'TABLE BASIC')"
  - "616:874 (Table — 4-column compact example: header row + 3 data rows with up/down/flat rate cells)"
  - "616:959 (Table — 2-column header+cell example, 3 rows, plain text cells)"
  - "616:898 (99. Table_assets — component swatch sheet: Table_cell, Table_control, Table_header symbols)"
  - "616:899 (Table_cell symbols: Type=rate/with button/button/multi/2line/global/basic)"
  - "616:921 (Table_control symbols: check/radio)"
  - "616:926 (Table_header symbols: switch/sorting/2Line/basic)"
  - "616:1020 ([NM] Screens — full mobile screen mock using the compact table + app shell)"
  - "616:955/616:956 (text — 'more usage examples' link-out, not traversed further)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen). Page is explicitly marked (진행중) — in progress — by the file's own page name; see WIP findings below.
---

# NDS M.web — Data Table (진행중)

Single-content-page guide for the `Table_header` / `Table_cell` / `Table_control` component family in the **NDS_M.web** library (`uVcmG6GgOl2J8EOlc22wob`). The page name itself carries **`(진행중)`** — in progress — and the canvas content corroborates that: it is essentially an asset dump (component swatches + two composed examples + one screen mock) with **no written usage rules** anywhere, unlike the fuller NDS_UX Guide pages already learned in this domain.

## On-canvas copy (verbatim)

- Page title block: **"Data Table"** / **"QV-NM Table Design Guide"**
- Section header: **"TABLE BASIC"** — **"Data Table 최상단에 쓰이는 테이블 필터입니다."** ("This is the table filter used at the top of Data Table.")
- Asset-sheet group labels: **"TABLE HEADER"**, **"TABLE CELL"**, **"START LINE"**, **"SWIPE (SHADOW)"**
- Column labels under TABLE HEADER: **"BASIC"**, **"2 LINE"**, **"SORTING"**, **"SWITCH"**
- Column labels under TABLE CELL: **"BASIC"**, **"2 LINE"**, **"MULTI"**, **"BTN"**, **"RATE"**
- Link-out at bottom of page: **"더 많은 사용 예시는"** / **"Go Template →"** (points to more examples elsewhere — not traversed, out of scope for this single-page assignment)

**Copy/content mismatch (on-canvas evidence, not filled in):** the "TABLE BASIC" section description literally says this is "the table filter used at the top of Data Table" (테이블 필터), but the content shown directly beneath it is plain data rows (헤더/텍스트/100,000/0.00 with up/down/flat indicators) — not a filter control. Reads like leftover/copy-pasted description text that was never corrected to describe what's actually shown.

## Component swatch sheet (`99. Table_assets`, node `616:898`)

Three component families are laid out as a symbol sheet, each **Type** value as a *separate standalone `COMPONENT` node* (not combined into one `COMPONENT_SET` with a `Type` variant property — confirmed via `findAllWithCriteria({types:["COMPONENT_SET"]})` returning empty for all three parent frames).

### `Table_cell` — Type values confirmed verbatim: rate / with button / button / multi / 2line / global / basic

| Type | componentKey (this page's symbol) | On-canvas sample content |
|---|---|---|
| `rate` | `16b5ababba5efd5a43541a0506b12ae1a55c7d68` | ▲ `100,000` (red triangle + number) |
| `with button` | `759e8ce1c2c6ee12616393645d93b90253084bbe` | "기본셀영역" + nested "상세" button pill |
| `button` | `f093f14ba5975d7d1f5605bd2f28e4c33be51218` | "버튼명" pill on gray fill (`#ebedf1`) |
| `multi` | `9f525e19fab8703674e01b6b57cb7d7c21084e6d` | "하나면하나지둘이겠냐둘이면둘이지셋이겠느냐" — a single wrapped placeholder sentence, not label/value pairs |
| `2line` | `e5ed8941fed05225bf08b7ba3f104f549450b956` | "기본셀영역" stacked twice |
| `global` | `92f66ab97ddf8a414a73d8d81143000caf5f321c` | "Treasure Global Inc" title + "HMBL | Financial" meta line |
| `basic` | `77255e34f7d9c06f3040d3393841cb331c2e59e0` | "기본셀영역" single line |

### `Table_header` — Type values confirmed verbatim: switch / sorting / 2Line / basic

| Type | componentKey | Notes |
|---|---|---|
| `switch` | `7b5f17070280f3e99b0629f4f177ad051064bc26` | "헤더영역" + small `nds_icon_table_modify` glyph, bottom-right corner |
| `sorting` | `b0af24d5c05268a379ca3bed1b5907844d393d3a` | Two stacked "헤더영역" labels + a pair of `nds_icon_table_sort` (up/down chevron) glyphs |
| `2Line` | `9614d5ced475ef72611c7c6e812628ee70c03373` | "헤더영역" stacked twice, centered, `#666` |
| `basic` | `3e1c812872caadfab7a376d1275d3bbd19c64996` | "헤더영역" single line, `#f7f7f7` fill |

### `Table_control` — NOT in the Core reference (new find)

| Type/control | componentKey | Notes |
|---|---|---|
| `Type=basic, control=check` | `7c39b44c4f56498dcc52f3d77f5ec802f47dcb43` | Green filled checkmark badge (reuses `check_icon_solid` glyph, NM channel, h26, selected) |
| `Type=basic, control=radio` | `03c84a74ae52be252a161c569210a93dd66d4a66` | Radio circle (reuses `radio_basic`, NM channel, disabled-selected) |

This component is **not referenced anywhere else in the Core reference or previously-learned NDS files**. It is shown on the asset sheet but is **not used in either composed example** on this page (616:874, 616:959) — undemonstrated in context. Likely a row-selection affordance for tables (bulk-select checkbox / single-select radio column), but no usage rule accompanies it.

## Composed examples

**Example 1** (`616:874`, 320×140, 4 columns × header+3 rows): `Table_header` type=`basic` × 4 columns, then 3 rows of `Table_cell` type=`basic` (×3 columns) + type=`rate` in the last column, with the rate cell showing 상승 (▲ red), 하락 (▼ blue), 보합 (– teal) across the three rows — i.e. this is the up/down/flat convention from `nds-ux-guide-updown-notation` applied directly inside a `rate` table cell.

**Example 2** (`616:959`, 360×112, 2 columns × 3 rows): `Table_header` type=`basic` (narrow, 93.3px) + `Table_cell` type=`basic` (wide, 266.7px) repeated 3 times — a label/value list layout, not a grid.

**Full screen mock** (`616:1020`, "[NM] Screens", 360×658): a real app screen — `statusbar` + `header_basic` ("화면 타이틀명" with chevron) + Example-1's 4-column table (헤더×4, then 3 rows: 텍스트/100,000/0.00/▲0.00 red, ▼0.00 blue, –0.00 teal) + full-width green `btn_bottom_page` ("버튼명") + `quickmenu_basic` app-shell bottom nav. This confirms the domain's existing note that `quickmenu_basic` appears on "every real screen" — it's present here too, directly under the CTA button.

Both real-usage instances trace (via `get_design_context`'s nested `I<instanceId>;<childId>` node-id convention) to the **`basic`** Type child specifically (e.g. `I616:877;616:941` → child `616:941` lives inside the `Type=basic` header symbol `616:940`) — `basic` is the only Type actually demonstrated in a composed layout on this page; every other Type (`rate` excepted) only appears in the isolated swatch sheet.

## Color-token inconsistency (on-canvas, unresolved)

`get_design_context` on the composed examples reports **two different named styles bound to what is visually the same semantic role**, with slightly different hex values:

| Role | Style A | Style B | Match? |
|---|---|---|---|
| 상승/up (red) | `NAMUH/Others/129.001` = `#EF2D26` | `NM/ESS/others/1.238` = `#D73838` | ❌ different hex |
| 하락/down (blue) | `NAMUH/Others/130.002` = `#277FFF` | `NM/ESS/others/2.239` = `#247EF2` | ❌ different hex |
| 보합/flat (teal) | `NAMUH/Others/136.012` = `#009F83` | `NM/ESS/others/3.003` = `#009F83` | ✅ identical |

Both `NAMUH/*` and `NM/*` style families exist on this page for the same rate-cell content, resolving to visibly-close-but-not-identical reds/blues. This reads as an un-reconciled duplicate token pair (`NAMUH` vs `NM` prefix, both apparently the same "Namuh" channel) rather than a deliberate Channel distinction — worth treating as a real inconsistency, not a documented variant. Cross-reference: `nds-mweb-colors.md` documents `NM/ESS/others/1.238`=`#D73838`, `NM/ESS/others/2.239`=`#247EF2`, `NM/ESS/others/3.003`=`#009F83` as the canonical set — that file's values match "Style B" here, so treat `NAMUH/Others/12x.xxx` as the stale/duplicate side of this pair, not the source of truth.

## Fonts observed

- Table_header text: `Roboto Regular`, 18px (basic/switch), `#666666`
- Table_cell body text: `NanumBarunGothic Regular` 21px for Korean placeholder strings (basic/2line/multi), `Roboto Regular` 21px for numeric values, `Roboto Medium` 21px for the `global` type's title line, all `#333333`; rate value in `Roboto Regular` 22px colored per direction
- Borders: `#e0e0e0` throughout (table cell/header borders), header fill `#f7f7f7`, cell fill white

## Core reference cross-check

The Core reference (`../LEADER.md`) lists:
- `Table_cell` (key `fc81ad075240f81283ab0769426639ff87b6e542`, Type: `rate`/`with button`/`button`/`multi`/`2line`/`global`/`basic`)
- `Table_header` (key `8074b6b4ab30e8d392bfb6aec6857386f10e5006`, Type: `switch`/`sorting`/`2Line`/`basic`)

**Type-value lists: fully CONFIRMED verbatim** — both components' Type enumerations exactly match what's on this source page, in the same order.

**componentKeys: CONTRADICTED / cannot confirm.** None of the 7 `Table_cell` keys or 4 `Table_header` keys found on this page match the Core reference's single key for each. More importantly, **the structural claim implicit in the Core reference (one component with a `Type` variant property) does not hold on this page** — here each Type is a separate standalone `COMPONENT` node, not variants of one `COMPONENT_SET`. Two explanations are consistent with the evidence and neither can be ruled out from this page alone: (a) this page's "99. Table_assets" sheet is a page-local documentation re-creation (symbols built to *look like* the variants for illustration, disconnected from the real published library component), while the Core reference's key points at the actual importable library component elsewhere; or (b) the library was refactored since the Core reference was recorded and the real component now has different structure/key. Given the domain's own workaround note for `header_basic` ("import succeeded once, failed once, don't assume"), option (a) — a local documentation copy — is the more likely read, but this is unverified.

**New, not previously documented:** `Table_control` (check/radio row-selection glyphs paired with a `Type=basic` white cell background) — add to Core reference as a new component under the table family.

**Not addressed by this page:** the Core reference's specific claim that `Table_cell` is "not a good fit for multi-field cards" (e.g. a stock card with 4+ label/value pairs + a status chip). This page's `multi` example is a single wrapped sentence, not label/value pairs — it neither demonstrates nor contradicts that claim; there's no multi-field-card example on this page to test it against.

## Findings summary (progress status)

**This page is genuinely incomplete, not just nominally tagged.** On-canvas evidence for `(진행중)`:
1. Title claims **"QV-NM Table Design Guide"** (dual-channel), but **zero QV-channel examples exist anywhere on canvas** — every color, button, and screen mock uses NM (green CTA `#84C13D`-family, NM up/down/flat colors). The QV half of the guide is simply absent, not just under-documented.
2. The "TABLE BASIC" section's own description text doesn't match its content (says "table filter", shows data rows) — apparent leftover/uncorrected copy.
3. **No usage rules or do/don't guidance of any kind** — unlike every previously-learned NDS_UX Guide page in this domain, this page is pure asset-sheet + two composed examples, with no written criteria for choosing between Type values, no accessibility notes, no do/don't pairs.
4. An unreconciled duplicate color-token pair (`NAMUH/Others/*` vs `NM/ESS/others/*`) sits unresolved in the up/down rate-cell colors.
5. `Table_control` exists as an asset but is never actually used in a composed example on the page.

## Gaps / could not verify

- **Could not resolve real componentKeys via instance traversal.** Every `use_figma` script that called `getMainComponentAsync()`, the deprecated sync `mainComponent` property, or `findAllWithCriteria({types:["INSTANCE"]})` on this page — even isolated, even after a clean `setCurrentPageAsync` — threw `"Operation attempted to modify the file while in read-only mode"`. Plain node/property reads (`get_metadata`, `get_design_context`, root-level `figma.root.children`, `getNodeByIdAsync` immediately after page switch in isolation) worked fine; the failure was specific to resolving/traversing `INSTANCE` nodes' component bindings. Confirmed indirectly instead via `get_design_context`'s embedded `I<instanceId>;<childId>` node-id naming convention, which shows real-usage instances point at the `Type=basic` symbol's children — but the actual bound library componentKey (as opposed to this page's local documentation symbol key) remains unconfirmed.
- The "더 많은 사용 예시는 / Go Template →" link-out points to more examples living elsewhere (a template page) — out of scope for this single-page assignment, not traversed.
- No written usage rules exist on this page to report as blank-at-source beyond "absent" — there is nothing to escalate because there is nothing there.
- QV channel content: genuinely absent, not merely unread — see WIP finding #1 above.
