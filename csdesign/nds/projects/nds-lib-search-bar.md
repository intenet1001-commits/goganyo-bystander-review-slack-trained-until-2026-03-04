---
name: nds-lib-search-bar
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=19644-2695"
learned_date: 2026-07-16
sections_studied:
  - "19644:2695 (page '    - Search bar (Filter, Sort)  검색, 검색창' — 4 top-level frames + loose reference mockups)"
  - "19644:2696 (frame '1. Search Bar' — on-canvas heading 'Search Bar' / 'QV-NM Search Bar Design Guide'; sections BASIC, FILTER)"
  - "19681:19774 (COMPONENT_SET 'searchbar_basic' — 9 variants, the tiebreaker for the states question)"
  - "19666:812 (COMPONENT_SET 'searchbar_filter' — 9 variants)"
  - "19791:20045 (frame '2. Search bar_legacy' — on-canvas heading 'Search Bar_legacy'; explicitly deprecated)"
  - "45992:24913 (frame '3. Sort' — on-canvas heading 'Sort'; section heading is literally '작업중' = WORK IN PROGRESS)"
  - "19791:20190 (frame 'Control_usage' — on-canvas heading 'Search Bar Usage'; carries the Last update stamp)"
status: "live — internal NDS component library page. Evidence: 4 local COMPONENT_SETs with published keys, a 'Last update 2023.08.07 구자영' stamp, and a still-unfinished Sort section (added 2025-era node ids, 45992:*)."
---

# NDS Library — Search Bar (Filter, Sort)

The **tiebreaker page** for the domain's Search Bar states contradiction. Also the deprecation record for the legacy search bar, and the evidence that **Sort is unfinished at source**.

Components here are LOCAL (`remote: false`) — expected; this file is the library itself. All four sets carry stable 40-hex keys and are structured as published library components (**tier (a)**). **Keys are `unverified`** — read-only session, no `importComponentSetByKeyAsync` round-trip.

## ⭐ VERDICT: the Search Bar defines **3 states**, not 4

**The library defines exactly THREE states.** Verbatim, read off `variantGroupProperties` and independently confirmed by screenshot (three on-canvas column headings):

> **`normal`** · **`pressed`** · **`filled`**

This holds for **both** live sets:

- `searchbar_basic` (`19681:19774`) → `Status=[normal|pressed|filled]`
- `searchbar_filter` (`19666:812`) → `Status=[normal|pressed|filled]`

The screenshot of `19644:2696` shows exactly three columns, labelled on canvas **`normal`**, **`Pressed`**, **`filled`** (note the guide's own inconsistent capitalisation — the *layer* text nodes are `normal` / `Pressed` / `filled` while the *variant values* are all lowercase `normal` / `pressed` / `filled`; **use the lowercase variant values in `setProperties`**).

### Why the other file probably said 4 — the two most likely explanations

1. **A `disabled` state was counted.** The sibling **Text Field** page (`2283:9979`, same library) defines `Status=[normal|pressed|filled|disabled]` — **4 states**. Text fields and search bars look nearly identical and are easy to conflate. **The search bar genuinely has no `disabled` state in this library.**
2. **The legacy set was counted separately.** `2. Search bar_legacy` has only `Status=[normal|pressed]` — **2 states**. Someone summing "legacy + basic" or reading the wrong frame could land on 4.

**Neither is a reason to record 4.** This library file — the source of truth for the component definition — defines 3, and does so twice, consistently, with a screenshot to match. **Resolve the ledger entry to 3: `normal`, `pressed`, `filled`.**

## Name reliability: RELIABLE

Screenshotted and compared. Variant names match on-canvas column headings exactly. The frame layer names (`1. Search Bar`, `2. Search bar_legacy`, `3. Sort`, `Control_usage`) all agree with their on-canvas headings (`Search Bar`, `Search Bar_legacy`, `Sort`, `Search Bar Usage`).

**No copy-paste subtitle rot on this page** — every frame's subtitle correctly reads "QV-NM Search Bar Design Guide" (contrast the Controls page, where two frames carry the wrong subtitle).

**Rules are in TEXT nodes, not pasted images.** Everything extracted cleanly. **No screenshot-embedded rules found on this page.**

**Demo copy is a MIX — flag carefully:**
- **Placeholder filler (do NOT record as product strings)**: `텍스트를 입력하세요`, `버튼명`.
- **Plausibly real product strings** seen in the render: `펀드명/펀드코드를 입력하세요` (fund search), `알림 내역을 검색하세요.` (notification search), `찾는 주식이 있나요?` (stock search), `상품코드`, `1주 · 최신순`, `삼성` (a filled-state sample value). These read as genuine per-surface placeholder copy, not lorem — but they are **demo content inside a variant preview**, so treat them as *examples of the pattern*, not as a copy spec. The library does not state which surface gets which string.

## Last update (verbatim)

`Control_usage` (`19791:20190`) → **`Last update 2023.08.07 구자영`**

The Sort frame's nodes are in the `45992:*` range — substantially later than 2023. **The Last update stamp does not cover the Sort section.**

## Component keys

| Set | node | **SET** key (40-hex) | Axes (verbatim) | Variants | Tier |
|---|---|---|---|---|---|
| `searchbar_basic` | 19681:19774 | `755deb62dc296ad41135fb0147e814de64cb7e08` | `Type=[left-line\|left-solid\|right-solid]` × `Status=[normal\|pressed\|filled]` | 9 | (a) published — **use this** |
| `searchbar_filter` | 19666:812 | `0ca00d45253ed2384c2cce8e681af9eda793c502` | `Type=[line\|no line\|round]` × `Status=[normal\|pressed\|filled]` | 9 | (a) published — **use this** |
| `R-Square` | 19644:2767 | `24ceacff247cb02d0f7c811455b54140d76ccd75` | `Type=[btn\|icon\|icon2형\|basic]` × `Status=[normal\|pressed]` × `Height=[h74\|h60]` | 8 | (a) published but **DEPRECATED** |
| `Complex` | 19644:2697 | `b6a7ae4c76afa84b4a1667cc47e82f1ea7b4a3d0` | `Type=[basic\|icon]` × `Status=[normal\|pressed]` × `Height=[h60]` | 4 | (a) published but **DEPRECATED** |

All four are **KIND: COMPONENT_SET** — these are the keys `importComponentSetByKeyAsync` needs. Variant COMPONENT keys were not individually enumerated for this page (the SET key + `setProperties` is the correct access path here); they are recoverable by re-running the read-only script against the set node ids.

### The two `Type` axes are disjoint — a real trap

`searchbar_basic.Type` = `left-line | left-solid | right-solid`.
`searchbar_filter.Type` = `line | no line | round`.

**No overlapping values.** `left-solid` is meaningless to `searchbar_filter`; `round` is meaningless to `searchbar_basic`. Pick the set first, then the Type — the names are close enough (`line` vs `left-line`) to invite a silent mistake.

Also note **`searchbar_basic` has no `right-line`** — the left/right axis and the solid/line axis are not orthogonal. Only three of the four conceptual combinations exist.

## Rules transcribed verbatim from canvas

Section descriptions:

> **basic** — 화면의 전체적인 레이아웃을 고려하여 아이콘의 위치를 설정해요.

> **filter** — 검색 진입 시(키보드 호출 시) 리스트 필터/검색필터 사용 가능합니다.

> **legacy** — 종목검색, 메뉴검색 등에서 쓰였던 기존의 디자인입니다. 사용을 지양합니다.

> **작업중** — 컨텐츠 정보들을 재정렬 할때 사용하는 컨트롤러 입니다.

From `Control_usage` (`19791:20190`):

> 사용방법
> 1. 화면에 맞는 search bar 디자인을 확인합니다.
> 2. 케이스별 properties를 확인합니다.
> 3. 화면의 밸런스를 고려하여 아이콘의 컬러(03/04)를 선택합니다.
>
> 사용 시 유의사항
> 제공된 라이브러리 이외의 탭은 사용을 지양합니다. 하단의 legecy는 사용을 지양합니다. 수정은 디자이너와 협의가 필요합니다. (for designer) 예외케이스는 해당하는 templates에 추가하도록 합시다.

Two things worth pulling out:

1. **The icon colour rule is `아이콘의 컬러(03/04)`** — a bare "03/04" with no channel and no token path. This page does not say what 03 or 04 resolve to. **Blank at source** — the colour numbers here are *not* the ColorNumbers from the `nds-mweb-colors` scheme (those are 3-digit, e.g. `022`, `074`). Do not guess; ask the design team or find the icon-colour table.
2. **`legecy` is misspelled in the guide's own usage text** (should be `legacy`). The frame name is spelled correctly. Cosmetic, but it tells you the usage text is hand-typed and unreviewed.

## Blanks at source — report, don't infer

- **NO `disabled` state on either live search bar set.** This is the crux of the states question. It is a genuine absence, not an oversight I should fill in. If a screen needs a disabled search bar, the library does not define one.
- **NO time/interaction rules.** No debounce interval, no "search fires after N ms", no keyboard-appearance timing, no clear-button behaviour spec. The `filter` description mentions 키보드 호출 (keyboard invocation) but specifies nothing about it. **Systematically blank — do not infer from the mockup.**
- **NO `Channel` axis on any search bar set.** Unlike checkboxes/radios/toggles, the search bar is channel-neutral. There is no NM/QV split here despite every frame's subtitle saying "QV-NM".
- **The `아이콘의 컬러(03/04)` values are undefined on this page** (see above).
- **Sort is unbuilt.** See below.

## 🔴 Sort is WORK IN PROGRESS at source

Frame `3. Sort` (`45992:24913`) exists, but its section heading is literally the Korean word **`작업중`** ("in progress") where every other frame on this page has a real section name (`basic`, `filter`, `legacy`).

**It contains no COMPONENT_SET at all.** Its contents are:
- a loose `Frame 482426` (`45992:27486`) with a text node `최신순` and an `ndsw_icon_sort` instance,
- a `date_ctrl` frame (`45992:28025`) assembled from `nds_img_toggle_sum` and two `nds_img_zoom` instances,
- a `moana` instance (`45992:28055`) — a designer's comment/sticky widget, not a component.

**There is no importable Sort component.** The page name promises "(Filter, Sort)" but Sort is a sketch. **Do not build against it.** If a Sort control is needed, this library does not yet define one — escalate to design.

Note also `ndsw_icon_sort` — the **`ndsw_`** prefix (vs the `nds_` used everywhere else on this page). Possibly a web-specific icon namespace, possibly a typo. Unresolved.

## Legacy — deprecated, but know it exists

`2. Search bar_legacy` (`19791:20045`) holds `R-Square` and `Complex`. The guide says twice to avoid them (`사용을 지양합니다` in both the section description and the usage frame).

They are still **live published component sets with valid keys** — deprecation here is documentation-only, not enforced. Instances of them may still exist in product files. Recognise them by:
- **2 states only** (`normal`, `pressed` — no `filled`),
- a `Height` axis (`h74`/`h60`) that the modern sets don't have,
- `Type=icon2형` — a Korean-suffixed variant value (형 = "type/form") that appears nowhere in the modern sets.

`Complex.Height` has exactly one value (`h60`) — a single-value axis, same placeholder pattern as `toggle_basic.Height=h32` on the Controls page.

## Conflicts / hazards for the LEDGER

1. **RESOLVES the 3-vs-4 states contradiction → the answer is 3** (`normal`, `pressed`, `filled`). Most likely source of the "4" claim: the sibling **Text Field** page, which genuinely has 4 (`+disabled`). Second candidate: someone counted legacy's 2 alongside something else.
2. **`searchbar_basic.Type` and `searchbar_filter.Type` share no values** despite near-identical names (`line` vs `left-line`). Easy silent mis-set.
3. **On-canvas state labels are capitalised inconsistently** (`normal` / `Pressed` / `filled`) while variant values are uniformly lowercase. **Use the lowercase variant values.**
4. **`Sort` is `작업중` — no component exists.** The page name advertises a Sort control that isn't built.
5. **`아이콘의 컬러(03/04)` is an undefined reference** — blank at source, and the numbering doesn't match the ColorNumber scheme from `nds-mweb-colors`.
6. **`legecy` typo** in the usage text.
7. **`ndsw_icon_sort` uses a `ndsw_` prefix** unlike every other `nds_*` asset on the page.
8. **No `Channel` axis anywhere on this page**, despite "QV-NM" in every subtitle. The subtitle is boilerplate, not a claim about the components.
9. **Last update (2023.08.07) predates the Sort frame** (`45992:*` nodes). The stamp doesn't cover the whole page.
10. Loose `viviana` instances (`19798:20204`, `19798:20207`) and a `moana` instance sit outside the guide frames — designer comment widgets, not components. Ignore.

## How this feeds BUILD mode

- **Standard search field** → import SET `755deb62dc296ad41135fb0147e814de64cb7e08` (`searchbar_basic`), then `setProperties({ Type: 'left-solid'|'left-line'|'right-solid', Status: 'normal'|'pressed'|'filled' })`.
- **Search field with a filter/sort chip on the same line** → SET `0ca00d45253ed2384c2cce8e681af9eda793c502` (`searchbar_filter`), `{ Type: 'line'|'no line'|'round', Status: 'normal'|'pressed'|'filled' }`.
- **There is no disabled search bar.** If the design calls for one, that's a gap — escalate rather than improvising.
- **There is no Sort component.** Same — escalate.
- **Never reach for `R-Square` or `Complex`** unless you're reading an existing legacy screen.
- Icon placement is a judgement call per the guide (`화면의 전체적인 레이아웃을 고려하여`), which is why `left-*` and `right-solid` both exist. Match the surrounding screen.
- Keys are **unverified** (read-only session). Confirm with `importComponentSetByKeyAsync` before relying on them.
