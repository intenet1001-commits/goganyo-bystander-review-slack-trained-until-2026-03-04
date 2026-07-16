---
name: nds-lib-pulldown
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=46-622"
learned_date: 2026-07-16
sections_studied:
  - "46:622 (page '    - Pulldown (Select)  풀다운, 셀렉트박스, 콤보' — 4 numbered guide frames + a usage frame)"
  - "4298:8515 (frame '1. Line select box' — on-canvas heading 'Line Select Box' + '개발명 bottom design'; sections BASIC, TXT)"
  - "161:2964 (frame '2. Dropdown combo' — on-canvas heading 'Dropdown Combo'; section BASIC)"
  - "12259:15166 (frame '3. Filter select box' — on-canvas heading 'Select Box (Sliding Popup)' — layer name and heading DISAGREE)"
  - "8363:12689 (frame '4. Date select box' — on-canvas heading 'Date Select Box'; sections basic, Calendar)"
  - "4298:8969 (frame 'selectbox&combo_usage' — on-canvas heading 'Select box & Combo Usage'; carries the Last update stamp)"
status: "live — internal NDS component library page. Evidence: 8 local COMPONENT_SETs with published keys and a 'Last update 2022.11.14 구자영' stamp; later additions (select_calendar 45783:*, select_box 48488:*, select_date time variants 58352:*) postdate the stamp."
---

# NDS Library — Pulldown (Select / Combo)

The select/combo/dropdown foundation of `NDS_Library`. **The single most important fact on the page: the on-canvas name and the developer's name for the same component are different**, and the page says so out loud — `Line Select Box` is called **`bottom design`** in code.

Components are LOCAL (`remote: false`) — expected; this file is the library. **Keys are `unverified`** (read-only session, no `importComponentSetByKeyAsync` round-trip).

## ⭐ The design-name → dev-name mapping (rare and valuable)

The `1. Line select box` frame heading carries a second text node (`4298:8775`) reading, verbatim:

> **개발명 bottom design**

"**Dev name: bottom design**". So the component design calls **Line Select Box** is called **`bottom design`** by engineering — presumably because it invokes a bottom sheet (슬라이딩 팝업, "sliding popup"), which the section description confirms.

**This is the only design→dev name mapping sighted anywhere in the NDS library so far.** It matters: a search for "line select box" in the codebase will find nothing. **Search for `bottom design` / bottom-sheet select instead.**

## Name reliability: MIXED — the demo copy is designer notes, not product strings

Screenshotted every rule-bearing frame.

- **Variant/axis names are reliable** — they match the on-canvas column headings (NORMAL / SELECTED / DISABLED / COMBO ON) exactly.
- **One frame layer name lies**: `3. Filter select box` (`12259:15166`) has the on-canvas heading **`Select Box (Sliding Popup)`**. Layer says "Filter", canvas says "Sliding Popup". Its *subtitle* says "QV-NM **Filter** Select Box Design Guide" and it *does* contain a `filter` set — so the layer name isn't wrong so much as the frame holds two different things (a `select_box` and a `filter` set) under one heading.
- **🔴 The demo copy on this page is ENTIRELY designer notes-as-filler.** Do NOT record any of it as product strings:
  - `가로값 최대는 492에요` — "max width is 492" (a spec, rendered as field content)
  - `최대 492 단독사용해요.` / `최대 492 단독사용합니다.` — "max 492, used standalone"
  - `한줄이 넘어가면 말줄임 하거나 폰트 자동줄임을 설정할수있어요` — "if it exceeds one line you can ellipsis or auto-shrink the font" (a **rule**, rendered as demo content)
  - `섹터를 선택해주세용` — note **`선택해주세용`**, a deliberately cutesy misspelling of `선택해주세요`. Unambiguously filler.
  - `텍스트를 입력하세요`, `텍스트입력`, `디폴트`, `선택됨` — lorem.

  **This page is the clearest example in the library of the "layer names lie / demo copy is filler" hazard.** Every visible string in the mockup is the designer talking to themselves. Transcribe them as *rules* (below), never as copy.
- **Rules are in TEXT nodes, not pasted images.** Everything extracted cleanly. **No screenshot-embedded rules found on this page.**

## Last update (verbatim)

`selectbox&combo_usage` (`4298:8969`) → **`Last update 2022.11.14 구자영`**

**Stale relative to the page.** `select_calendar` (`45783:*`), `select_box` (`48488:*`), the `filter` set's `selected-NM`/`selected-QV` statuses (`14855:*`), and all of `select_date`'s `time` variants (`58352:*`) postdate it and are unmentioned by the usage text.

## Component keys

All **KIND: COMPONENT_SET** — these are the keys `importComponentSetByKeyAsync` needs.

| Set | node | **SET** key (40-hex) | Axes (verbatim) | Variants | Tier |
|---|---|---|---|---|---|
| `select_line` | 4298:8604 | `0842644285356f35387441ac1cb0812f872c3c10` | `Status=[disabled\|normal\|selected]` × `Type=[only select\|with label]` | 6 | (a) published — **the default** |
| `combo_box` | 240:6978 | `e47693a48af0a713a785ee9f074c1ed2a083f8bf` | `Status=[normal\|selected\|disabled]` × `Combo=[off\|on]` × `Height=[h64\|h60\|h54\|h46]` | 16 | (a) published |
| `select_txt` | 4298:8929 | `a993e4ed3051133805c6d441bd181daed3f67be1` | `font=[15pt\|18pt\|21pt]` | 3 | (a) published |
| `select_date` | 5273:9779 | `e03e5b420d386b873175f7281f7ec0cfbcaaaa1d` | `Type=[date\|time]` × `Status=[disabled\|normal\|selected]` | 6 | (a) published |
| `select_date_assets` | 5273:9810 | `fc782958a8ffc316cfe9986d0747d6e418fc79c5` | `Type=[time\|date]` × `Status=[normal\|selected\|disabled]` | 6 | (a) published — asset-only twin |
| `select_calendar` | 45783:24536 | `15b4482a4899c836861ac8ad8c0673733562a0f5` | `status=[disabled\|normal]` | 2 | (a) published — **lowercase `status`** |
| `filter` | 12259:15257 | `b987f08ac3e48fdbb8cb2ed8547d69bba6ff1e26` | `Type=[기본\|강조]` × `Status=[normal\|selected\|disabled\|selected-NM\|selected-QV]` | 7 | (a) published — **irregular, see below** |
| `select_box` | 48488:2881 | `8b760bd444b0c2b74b0b219cf8ab78dc7e8a7958` | `State=[diabled\|normal]` | 2 | (a) published — **`diabled` typo + `State` not `Status`** |

### 🔴 `filter` is a 7-variant irregular grid — and it leaks Channel into Status

`Type=[기본|강조]` × `Status=[normal|selected|disabled|selected-NM|selected-QV]` would be 10 cells, but only **7 exist**:

- `Type=기본` → `normal`, `selected`, `disabled` (3)
- `Type=강조` → `normal`, `disabled`, `selected-NM`, `selected-QV` (4)

**`Type=기본` has no `selected-NM`/`selected-QV`, and `Type=강조` has no plain `selected`.** So the two Types take **disjoint Status vocabularies** — pick the Type first, then a Status that actually exists for it, or `setProperties` will fail.

Worse: **`selected-NM` / `selected-QV` fold the Channel dimension into the Status axis** instead of using a proper `Channel` axis like every other channel-aware set in this library (`radio_basic`, `check_icon_solid`, `toggle_basic`, `account_*`). This is a **modelling inconsistency** — the emphasised filter's selected colour differs per channel (green vs orange, per `nds-mweb-colors`), and rather than add `Channel`, someone bolted two values onto `Status`. Any generic "set Channel on this instance" helper will silently skip this set.

### Other axis-naming hazards

- **`select_calendar` uses lowercase `status`**; every sibling uses `Status`. `setProperties({ Status: ... })` fails on it.
- **`select_box` uses `State`**, not `Status` — and its value is **`diabled`**, missing the `s`. **Pass the typo verbatim: `setProperties({ State: 'diabled' })`.**
- **`select_date` and `select_date_assets` declare their values in different orders** (`[date|time]` vs `[time|date]`; `[disabled|normal|selected]` vs `[normal|selected|disabled]`). Same values, different order. Harmless for `setProperties`; don't rely on index access.

Variant COMPONENT keys were not individually enumerated for this page (SET key + `setProperties` is the correct access path); they are recoverable by re-running the read-only script against the set node ids.

## Rules transcribed verbatim from canvas

Section descriptions:

> **basic** (Line Select Box) — 보통으로 쓰이는 라인형 콤보입니다. 슬라이딩 팝업이 호출됩니다.

> **txt** — 텍스트형 콤보에요. 슬라이딩 팝업을 호출해요. 제일 작은 형태는 테이블 헤더에만 사용해요.

> **basic** (Dropdown Combo) — 주문, 현재가 등에서 쓰이는 박스형 콤보에요.

> **basic** (Select Box / Sliding Popup) — 게시글 목록 상단 영역에서 주로 사용하는 셀렉트박스입니다. 슬라이딩 팝업이 호출됩니다.

> **filter** — 상품 등 항목에 대한 필터를 강조에 따라 다르게 사용합니다. 슬라이딩 팝업이 호출됩니다.

> **basic** (Date Select Box) — 기간지정 셀렉트 박스입니다. 선택시 oS 팝업을 호출합니다.

> **Calendar** — 이전/다음 날짜를 바로 넘길 수 있으며, 날짜 영역을 탭하면 날짜선택 팝업을 호출합니다.

From `selectbox&combo_usage` (`4298:8969`):

> 사용방법
> 1. 기본적으로 라인 셀렉트 박스를 사용합니다. (셀렉트 슬라이딩 팝업을 호출합니다.)
> 2. 주문, 현재가와 같은 화면에서는 드롭다운 콤보를 사용합니다.
> 2. 모든 status를 고려하고, 그에 따른 properties를 확인합니다.
>
> 사용 시 유의사항
> 제공된 라이브러리 이외의 UI는 사용을 지양합니다. Assets 수정은 디자이너와 협의가 필요합니다. (for designer) 예외케이스는 해당하는 templates에 추가하도록 합시다.

**Note the numbering bug: the usage list reads 1, 2, 2** — there are two items numbered `2.` (`4298:8974` and `4357:8683`) and no `3.`. Cosmetic, but confirms the text is hand-maintained.

### The decision rules, pulled out

1. **Line select box is the DEFAULT.** It invokes a sliding popup (bottom sheet).
2. **Dropdown combo is the EXCEPTION — only for 주문 (order) and 현재가 (current price) screens.** *This is exactly the same line-vs-box rule the Text Field page states for inputs.* **The two pages agree**: line by default, box on order/price screens.
3. **`select_txt`'s smallest size is table-header-only** — `제일 작은 형태는 테이블 헤더에만 사용해요`. That's `font=15pt`. **Don't use 15pt outside a table header.**
4. **Date select invokes an OS popup** (`oS 팝업` — sic, lowercase o), not an in-app sliding popup. Different mechanism from every other select on the page.
5. **Calendar allows direct prev/next stepping**, and tapping the date area opens a date-picker popup.
6. **Ellipsis/auto-shrink is allowed on overflow** — `한줄이 넘어가면 말줄임 하거나 폰트 자동줄임을 설정할수있어요`. Rendered as demo copy inside the h64 combo-on preview, but it's a real rule.

### On-canvas size annotations (verbatim)

From the Dropdown Combo frame's right-hand labels:

- `h64` → **`W492 고정`** ("width 492 fixed")
- `h60` → (no annotation)
- `h54` → (no annotation)
- `h46` → **`국내주식 주문`** ("domestic stock order")

**`combo_box` h64 is width-locked at 492; h46 is scoped to the domestic-stock order screen.** h60 and h54 carry no scope note — **blank at source**, don't invent one.

## Blanks at source — report, don't infer

- **NO time/interaction rules.** No sliding-popup animation duration, no easing, no dropdown expand/collapse timing, no OS-popup transition. The `Combo=on` variant shows the expanded list as a static frame. **Systematically blank — do not infer from the mockup.**
- **NO `Channel` axis on any set on this page** — despite every subtitle saying "QV-NM". The only channel-awareness is `filter`'s bolted-on `selected-NM`/`selected-QV` Status values.
- **`combo_box` h60 and h54 have no stated scope** (h64 and h46 do).
- **No max-item-count for the dropdown list.** `Combo=on` previews show 2–3 rows; nothing says what happens at 20.
- **No `filled` state** anywhere on this page — selects use `normal`/`selected`/`disabled`. (Contrast Text Field, which has `filled`. A select's "filled" *is* its `selected`.)
- **`oS 팝업`** — the guide never specifies iOS vs Android behaviour, just "OS popup".

## Conflicts / hazards for the LEDGER

1. **⭐ `Line Select Box` = dev name `bottom design`** (`4298:8775`). The only design→dev name mapping sighted in the library. Record it — a codebase search for "select box" will miss it.
2. **`select_box.State=diabled`** — typo baked into the variant value. **Pass `'diabled'`, not `'disabled'`.** Also uses `State` where every sibling uses `Status`.
3. **`select_calendar.status`** — lowercase, unlike every sibling's `Status`.
4. **`filter` folds Channel into Status** (`selected-NM` / `selected-QV`) instead of using a `Channel` axis. Inconsistent with `radio_basic`, `check_icon_solid`, `toggle_basic`, `account_*`. Generic channel-setting helpers will skip it.
5. **`filter` is an irregular 7-of-10 grid** — `Type=기본` and `Type=강조` take **disjoint** Status vocabularies.
6. **Frame `3. Filter select box` has on-canvas heading `Select Box (Sliding Popup)`** — layer name and heading disagree; the frame holds two unrelated sets.
7. **ALL demo copy on this page is designer filler**, including deliberate misspellings (`선택해주세용`) and specs-as-content (`가로값 최대는 492에요`). Record none of it as product strings.
8. **Usage list is numbered 1, 2, 2** — no item 3.
9. **`select_date` vs `select_date_assets`** — near-duplicate sets, same axes, different value order and different keys. Purpose of the `_assets` twin is not stated. **Blank at source.**
10. **Last update (2022.11.14) predates** `select_calendar`, `select_box`, the `filter` NM/QV statuses, and all `select_date` `time` variants.
11. A loose `combo_box` instance (`47008:27731`) sits outside every frame at `x=3240, y=2191` — stray, not part of the guide.
12. **This page's line-vs-box rule duplicates the Text Field page's.** Two pages state the same 주문/현재가 exception independently. **They agree** — no conflict, but the rule lives in two places and could drift.

## How this feeds BUILD mode

- **Default to `select_line`** — SET `0842644285356f35387441ac1cb0812f872c3c10`, `setProperties({ Type: 'only select'|'with label', Status: 'normal'|'selected'|'disabled' })`. It opens a bottom sheet. **In code, look for `bottom design`.**
- **Use `combo_box` (`e47693a4…`) ONLY on 주문 / 현재가 screens.** `{ Status, Combo: 'on'|'off', Height: 'h64'|'h60'|'h54'|'h46' }`. **h64 is width-locked to 492; h46 is for 국내주식 주문.**
- **`select_txt` (`a993e4ed…`)** for text-style combos. **`font=15pt` is table-header-only.**
- **`select_date` (`e03e5b42…`)** for date/time range pickers — invokes an **OS** popup, not a sliding popup. **`select_calendar` (`15b4482a…`)** for prev/next date stepping — **its axis is lowercase `status`**.
- **`filter` (`b987f08a…`)**: choose `Type` first, then a Status that exists for it. For `Type=강조`, the selected state is **`selected-NM` or `selected-QV`** — there is no plain `selected`. This is where Channel hides on this page.
- **`select_box` (`8b760bd4…`)**: `setProperties({ State: 'normal'|'diabled' })` — **`State`, and the typo `diabled`.**
- **Overflow**: ellipsis or font auto-shrink are both sanctioned.
- **Read axis names AND values off the API before `setProperties`** — this page has a typo (`diabled`), a case inconsistency (`status`), and a key-name inconsistency (`State`) across eight sets.
- Keys are **unverified** (read-only session). Confirm with `importComponentSetByKeyAsync` before relying on them.
