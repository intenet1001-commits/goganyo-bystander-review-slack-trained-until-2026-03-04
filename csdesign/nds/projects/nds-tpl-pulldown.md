---
name: nds-tpl-pulldown
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=1636-23684"
learned_date: 2026-07-15
sections_studied:
  - "4523:41390 (title frame — on-canvas 'Pulldown' / 'QV-NM Template Guide', matches page name)"
  - "4524:35737 / 4524:36853 / 4524:36918 (Basic 기본 group — 3x pulldown_기본01 frame using select_line, no popup)"
  - "4524:37297 (Basic group's 4th frame — popup_바텀시트_선택01: full sliding bottom-sheet mock with 5 popup_silding_select_asset rows)"
  - "4524:37380 / 4524:37386 / 4524:37392 / 4537:36336 (Stock 주문/관심 group — 4x pulldown_기본01 frame using combo_box, one showing expanded/open state inline, h=191)"
  - "4524:37373 / 4537:36404 (caption text nodes) + 4524:37569 (usage-scope rule text)"
status: internal NDS component-library guide (Templates file — usage-example gallery, not an asset-swatch sheet)
---

# NDS Templates — Pulldown (Select) 풀다운, 셀렉트박스, 콤보

Single-page usage gallery (title on-canvas: **"Pulldown" / "QV-NM Template Guide"**), organized as two labeled rows: **"Basic 기본"** (4 frames, `select_line` component) and **"Stock 주문/관심"** (4 frames, `combo_box` component). Two connector vectors (`Screens_1Level --> Screens_2Level`) link each row's 3rd frame to its 4th, matching the caption-to-mock pairing below.

## Layer-name convention — confirmed reliable

Screenshot of title frame (`4523:41390`) reads "Pulldown" / "QV-NM Template Guide" — matches page name. Instance names (`select_line`, `combo_box`, `Topbar_Dropdown`, `statusbar`, `popup_silding_select_asset`) read directly as their component name, confirmed via `getMainComponentAsync()` (needed 3 attempts — 2 threw `read-only mode`, 3rd succeeded on identical script, consistent with the task's documented intermittent-throw behavior).

## Component keys — all genuine COMPONENT_SETs, `remote: true`

Sampled via 5 explicit node IDs (page-wide sweep not attempted, per read-only risk):

| Instance | variant | main COMPONENT key | remote | parent SET name | parent SET key |
|---|---|---|---|---|---|
| `4524:35802` select_line | `Status=normal, Type=with label` | `e5862cbb3214d6f5ad24bb04f5f1ab05d590398c` | true | `select_line` | `0842644285356f35387441ac1cb0812f872c3c10` |
| `4537:36135` combo_box | `Status=normal, Combo=off, Height=h64` | `6eb9a7d78f5131f3d352830f686b3c510e9f28d0` | true | `combo_box` | `e47693a48af0a713a785ee9f074c1ed2a083f8bf` |
| `4524:37310` popup_silding_select_asset | `Active=on` | `a7f0fb801b87c34f28f4831e9bdd47940dbf7bfd` | true | `popup_silding_select_asset` | `774810d98b93da7f6ae2264319400559d0ead811` |
| `4524:35739` Topbar_Dropdown | `Channel=NM, Type=basic, Combo=off` | `69e7ffd43cdf9888ae6fc9bbedff3627fe504e6d` | true | `Topbar_Dropdown` | `ce701f7c5eda23073d17bd862838e75f191b0a96` |
| `4524:35738` statusbar | `Type=NM, Dark mode=false` | `169d23c202bd4e85398ceafdf264d6fa19eb1cbf` | true | `statusbar` | `fe57c685f5a27a53c49fc56c9999456340140c2f` |

`Topbar_Dropdown` reproduces the exact COMPONENT/SET pair from Gotcha 5a (`69e7ffd4…`/`ce701f7c…`) — a 3rd sighting, confirming the "reporting artefact, not a conflict" reading. `statusbar` SET `fe57c685…` matches the "further distinct key" already logged from `nds-tpl-layout` — a repeat sighting of the `statusbar` name-collision family, not a new one.

## ANSWER — real published select/combo components, and they fill a Core gap

Two genuinely separate NDS_Library-published families exist: **`select_line`** (line-style, closed single-line control) and **`combo_box`** (box-style, with an `Combo=on/off` + `Height` axis and a visible expanded/open state). Core has **no pulldown/select entry at all**, so both keys above are new additions, not corroboration of an existing Core row.

**Sliding popup vs inline dropdown — settled, and it splits by component, not by contradiction.** The "Basic" row's 4th frame (`4524:37297`) is a genuine, fully-built **bottom-sheet mock**: dim overlay + `popup_silding_select01` sliding panel with a close icon, title row, and 5 `popup_silding_select_asset` rows — caption **"바텀시트 선택 팝업이 호출됩니다."** matches exactly. The "Stock" row's corresponding frame (`4537:36336`) shows `combo_box` **expanded inline** (height 191, no separate popup frame, no dim overlay) — caption **"드롭다운(콤보)가 호출됩니다."** also matches exactly. **No self-contradiction on this page** — captions and mocks agree in both cases.

This **settles M.web's self-contradiction as a M.web-specific defect**, not evidence that NDS's pattern is inherently inconsistent: here, line-type `select_line` → sliding bottom sheet, box-type `combo_box` → inline dropdown. This maps cleanly onto `nds-ux-guide-account-controller`'s rule (박스형 → inline dropdown; 라인/텍스트형 → bottom sheet) — **agreement across three independent NDS sources** (this page, account-controller guide, date-picker guide's 셀렉트박스 bottom sheet).

## Inline rule text (from within the mocked components, not captions)

- `select_line` closed-state label reads: **"최대 492 단독으로 사용해요."** ("use standalone, max 492") — a width-cap rule embedded as sample content.
- `combo_box` shows placeholder "텍스트를 입력하세요" plus a second row reading: **"가로값 최대는 늘 492에요."** ("horizontal value max is always 492") — same 492px cap as `nds-tpl-layout`'s 492px content width, corroborating that figure again from a 3rd angle.
- Usage-scope rule (`4524:37569`, verbatim): **"주문관련 화면에서만 사용합니다. 업무성 화면에서의 사용을 지양합니다."** ("use only on order-related screens; avoid use on business/task screens") — attached to the Stock/주문관심 (`combo_box`) group.

## Blanks / gaps

- Page-wide instance sweep not attempted (read-only risk) — only 5 explicit-ID instances sampled; `nds_icon_close` (in the bottom-sheet header) not resolved to a key.
- No isolated component-swatch sheet — every instance is live inside a composed screen mock, consistent with `nds-tpl-list`/`nds-tpl-data-table` pattern for this file.

## CORE proposal

Add a Pulldown/Select row to Core: `select_line` `0842644285356f35387441ac1cb0812f872c3c10` (line-type → triggers sliding bottom sheet) and `combo_box` `e47693a48af0a713a785ee9f074c1ed2a083f8bf` (box-type → inline expand), both SET/`remote: true`. This is a genuine Core gap fill, not a correction.
