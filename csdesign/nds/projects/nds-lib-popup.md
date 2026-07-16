---
name: nds-lib-popup
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=5913-10937"
learned_date: 2026-07-16
sections_studied:
  - "5913:10937 (page '    - Popup  팝업' — get_metadata overflowed at 115,220 chars; auto-saved dump parsed in chunks with a python indent parser, all 1,382 lines read)"
  - "5913:10938 (section '1. sliding_popup' — 3411×10841, the page's bulk: basic / table / control(check, radio, confirm, button) / select / date+time picker)"
  - "5913:11338 (section '2. layer_popup', nested inside 'Group 10067' 71888:1113)"
  - "5913:11365 + 21193:10306 (two sections BOTH named '3. full_popup' — 1depth/2depth/step/약관 step, and kebab/FaB/sHARE)"
  - "5913:11387 (section 'popup_usage' — on-canvas heading 'Popup Usage' / 'QV-NM Typography Font Usage'; the 사용방법 + 사용 시 유의사항 rules + MAX Case)"
  - "5913:11448 (the 유의사항 text node — strikethrough verified via getStyledTextSegments)"
status: "live — 'Last update  2024.06.20  구자영' (5913:11392), rendered and legible in the screenshot of 5913:11387"
---

# NDS Library — Popup (sliding / layer / full)

The popup page is enormous (the sliding section alone is 10,841px tall) but — **this is the headline finding — it is almost entirely NOT a component library.** Across the whole page there is exactly **one** COMPONENT_SET and **zero** loose components. Everything else is plain frames: page-local documentation re-creations, tier (b).

**BUILD consequence: you cannot `importComponentByKeyAsync` a popup.** There is no `popup_sliding_basic` component to instance. The page documents *layouts and measurements* that a builder must reproduce from primitives. Any plan that assumes "import the popup component" will fail at the first step.

## Page conventions (determined by screenshotting)

- **Layer names: RELIABLE but non-unique, with systematic typos.** `popup_silding_*` — **"silding"**, a misspelling of "sliding", is used consistently across ~30 frames. Search for `silding`, not `sliding`, or you will find nothing. (The *section* is correctly spelled `1. sliding_popup`; only the child frames carry the typo.)
- **Two different sections are both named `3. full_popup`** (`5913:11365` and `21193:10306`), and several frames share the name `popup_silding_control_check02` / `popup_silding_control_radio02` / `popup_full_1dep`. **Names are not unique keys on this page** — address by node ID.
- **Demo copy: placeholder.** `타이틀 영역`, `여기에 콘텐츠가 들어가고요...`, `버튼명`, `항목 타이틀을 입력하세요.` Do not lift.
- **Rules embedded in screenshot images: PARTLY.** The MAX Case measurements (`842px`, `661px 스크롤 영역`) are rendered annotation graphics, and one pasted bitmap exists (`54627:1689`, `Screenshot_20241211_170407 1`, the AOS date picker) from which **no text is extractable** — the Android calendar spec is a screenshot only.
- **`hidden="true"` frames: none** at the structural level I examined.

## ⭐ The strikethrough trap — a retired rule that text extraction reports as live

The 유의사항 text node (`5913:11448`) reads, in plain extraction:

> `레이어 팝업은 [최대 높이 850/ 최소 높이 230] 입니다. (*987화면 기준)`

**But `최대 높이 850` is struck through.** I confirmed this programmatically rather than trusting the pixels — `getStyledTextSegments(['textDecoration'])` returns:

```
{ text: "기본 마진은 좌우 30입니다.\n레이어 팝업은 [", decoration: "NONE" }
{ text: "최대 높이 850",                                decoration: "STRIKETHROUGH" }
{ text: "/ 최소 높이 230] 입니다. …",                   decoration: "NONE" }
```

**Any text-only read of this file will report "layer popup max height = 850" as a live rule. It is retired.** This is a new failure mode for the domain's warning list, distinct from "rules live inside images": here the rule *is* live text, but its **styling** carries the negation. Neither `get_metadata` nor a layer-name walk surfaces it.

**No replacement value is given.** The layer popup's max height is therefore **unresolved at source** — 850 is withdrawn, nothing supersedes it. Escalate; do not measure a mockup and call it the spec.

## The usage rules (verbatim, `5913:11387`)

**사용방법**:
1. `슬라이딩 팝업을 기본적으로 사용합니다.`
2. `중요한 안내/공지 등 사용자에게 꼭 알려야 하는 사항은 레이어 팝업을 사용합니다.`
3. `슬라이딩 팝업 내용이 최대높이 이상으로 너무 많아지면 풀팝업 사용을 권장합니다.`

A clean decision tree — **sliding is the default; layer is for must-see notices; full is the overflow escape hatch.**

**사용 시 유의사항** (`5913:11448`, verbatim, strikethrough marked):
```
기본 마진은 좌우 30입니다.
레이어 팝업은 [최대 높이 850̶(struck)/ 최소 높이 230] 입니다. (*987화면 기준)
슬라이딩 팝업은 [최대 높이 842/최소 높이 400]입니다. (*987화면 기준)
제공된 라이브러리 이외의 탭은 사용을 지양합니다.
library 수정은 디자이너와 협의가 필요합니다.
(for designer) 예외케이스는 해당하는 templates에 추가하도록 합시다.
```

Live measurements:

| Rule | Value |
|---|---|
| Base margin | **좌우 30** (left/right 30) |
| Layer popup min height | **230** (*987-height screen basis) |
| Layer popup max height | ~~850~~ **retired, no replacement** |
| Sliding popup max height | **842** (*987 screen basis) |
| Sliding popup min height | **400** (*987 screen basis) |

⚠ Note `제공된 라이브러리 이외의 **탭**은 사용을 지양합니다` — **"탭" (tab)**, on the popup page. Copy-pasted from a Tab page's usage panel and never updated. Read it as "팝업". (Same species of copy-paste artifact that `nds-mweb-colors` found in the QV colour table.)

Also note the section subtitle is **`QV-NM Typography Font Usage`** (`5913:11390`) on a page about popups — a third copy-paste slip. The `<title>`-level heading `Popup Usage` is correct.

## MAX Case (`47627:1304`) — the sliding popup at its ceiling

An annotated 987-height device mock (`47627:1305`, `Bottom Sheet_scroll`) showing the overflow behaviour, with two rendered measurements:
- **`842px`** — total sliding popup height (matches the 유의사항 rule exactly ✓)
- **`661px 스크롤 영역`** — the scrollable region inside it

So of the 842px max, **661px scrolls** and ~181px is fixed chrome (title area + bottom button). A gradient mask `nds_img_popup_gradation01` (`47627:1357`, 540×16) sits at the scroll boundary — **a 16px gradient fade marks the scroll edge.**

## Spacing anatomy (from the annotated diagrams, `5913:11387`)

Rendered arrow annotations give the internal vertical rhythm:

**Sliding popup** (`Popup_Sliding_basic_one btn_info`, `5913:11407`): left/right **30**; top band **40**; then **30**, **40**; bottom button band **60**.

**Layer popup** (`Popup_Layer_basic_txt(title)`, `5913:11419`): left/right **30**; title band **50**; **30**; **40**; bottom band **40**.

These are annotation graphics, not text nodes — visible only by screenshot.

## Structural inventory

**`1. sliding_popup`** (`5913:10938`) — by far the largest, organised into labelled columns:
- **basic**: `basic` / `items` / `items+title` / `items+title+3depth` / `notice` (`popup_silding_basic_sentence01–05`)
- **table**: `basic` / `basic+filter` / `items` (`popup_silding_basic_table01–04`)
- **control**: check (`popup_silding_control_check01/02`), radio (`radio01/02/03`), confirm (`confirm01/02/03`), button (`button01`)
- **select**: `popup_silding_select01` + the page's only component set
- **date/time picker**: `Date Picker Calendar (iOS)` (`54151:3410`), `Date Picker Calendar (AOS)` (`54627:1691`), `TIME Picker (iOS, AOS)` (`62406:34753`), `Set the period` (`54151:3472`)

Picker rules found on-canvas:
- `24시간 기준 (00-23 : 00-59 값으로 세팅)` (`62424:34877`) — **the time picker is 24-hour**, 00–23 : 00–59.
- `선택값 : 오늘` (`54538:4651`) / `선택값 : 오늘 이외` (`54538:4653`) — the date picker has distinct today / not-today states.
- ⚠ **The AOS date picker is a pasted bitmap** (`54627:1689`), not a design. The iOS one is a real `keyboard` instance (`54151:3304`). **Android's calendar is undesigned in this library** — it documents the platform default by screenshot.

Two frames are named after a **specific product screen** rather than a component: `[NM]애착종목키우기_신청_04.매수제한가격설정` (`21182:8424`, `21182:8438`). These are tier (c) — product mockups parked in the library page, not reusable scaffolding.

**`2. layer_popup`** (`5913:11338`) — wrapped in a redundant `Group 10067` (`71888:1113`) that adds nothing.

**`3. full_popup`** ×2 — `5913:11365`: `1depth` / `2depth+` / `step` / `약관 step`. `21193:10306`: `kebab` / `FaB` / `sHARE`, with the note `웹 공유하기 전용 템플릿입니다.` (`42674:964` — "a template exclusively for web sharing") on the sHARE column.

## componentKeys — Popup page

Read-only session → key `unverified`. Components are LOCAL (`remote: false`) — expected in the library file; not evidence of non-publication.

**The entire page yields exactly one component.** This is the finding, not an omission on my part — I enumerated with `findAllWithCriteria({types:['COMPONENT_SET','COMPONENT']})` across the page and got one set, zero loose components.

| Name | SET key (40-hex) | KIND | Axes | Tier |
|---|---|---|---|---|
| `popup_silding_select_asset` | `7ac713a834a321d1dc67c9c2d6c211dbc49d15db` | **COMPONENT_SET** | `Active: off \| on` | (a) published library component |

Everything else on the page — every sliding/layer/full popup frame — is **tier (b), page-local doc re-creation**. Not importable.

## How this feeds BUILD mode

- **Do not plan to import a popup component — there isn't one.** Build from primitives against the measurements below, and reuse the *button* components from `nds-lib-box-button` for the popup's bottom button (`btn_bottom_layerpopup`, SET key `c2adcc07146493541681ee77243a945154819866`).
- **Choose by the decision tree**: sliding by default → layer for must-see notices → full when content exceeds the sliding max.
- **Measurements to build to**: left/right margin **30**; sliding **max 842 / min 400**, of which **661 scrolls** with a **16px gradient** at the edge; layer **min 230**, **max unresolved (850 is struck)**.
- **Escalate the layer-popup max height.** Do not infer it from a mockup — the file withdrew the number deliberately.
- All heights are **(*987화면 기준)** — relative to a 987px-tall screen. Scale, don't copy, for other viewports.
- Time picker is **24-hour** (00–23 : 00–59).
- **Search the file for `silding`, not `sliding`.**
- **Add `textDecoration` to the read checklist for this whole domain.** This page proves a rule can be negated by styling alone, invisibly to `get_metadata` and to layer-name walks.
