---
name: nds-ux-guide-tab
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=90-3182"
learned_date: 2026-07-15
sections_studied:
  - "92:4869 (index/cover — '공통 탭 가이드', UX GUIDE, 'Last update 22.11.17'. Lists 3 sections: 01 탭, 02 Case별 탭, 03 탭가이드 - Do&Don't. Four separate `index01` instances exist on this canvas (92:4869, 90:4920, 92:5277, 92:5320) — one per slide row, all rendering the same index; they are duplicates, not four different indexes.)"
  - "90:4981 (frame 'Slide 16:9 - 9' → on-canvas '01 탭(tabs)' — definition of a tab + filing-cabinet analogy)"
  - "90:5120 (frame 'Slide 16:9 - 10' → on-canvas '01 탭의 구성' — anatomy: 컨테이너 / 탭항목 / 텍스트 레이블 / 활성 탭 표시 인디케이터(옵션); includes a 사용금지 callout)"
  - "90:6595 (frame 'Slide 16:9 - 11' → on-canvas '01 탭의 구성' — 고정 탭 vs 스크롤이 가능한 탭, and tab scope/placement)"
  - "90:6688 (frame 'Slide 16:9 - 12' → on-canvas '01 탭의 성격' — the 3 conditions a tab UI must satisfy in NDS + 참고1/2/3 notes)"
  - "90:5760 (frame '06' → no on-canvas section number; the '탭을 써야하는가?' decision tree mapping situations onto tab1–tab5 / 세그멘티드컨트롤 / 단일 선택 chip)"
  - "90:5657 (frame '13' → no on-canvas section number; the 고정형 탭 / 스와이프형 탭 spec sheet — the page's only hard px + item-count numbers)"
  - "92:4889 (frame '18' → on-canvas heading '팝업에서의 탭' (no section number) — 팝업 고정형 탭 / 팝업 스와이프형 탭 and the 2~3 item cap)"
  - "92:4597 (frame 'Slide 16:9 - 13' → on-canvas '01 탭 가이드 - Do&Don't', 원칙 1 — NOTE: the index calls this section 03, but the on-canvas number reads 01. See gotcha below.)"
  - "90:5411 (frame '09' → on-canvas '02 탭 가이드 - Do&Don't', 원칙 2)"
  - "90:5341 (frame '10' → on-canvas '02 탭 가이드 - Do&Don't', 원칙 3)"
  - "90:5551 (frame '16' → on-canvas '02 탭 가이드 - Do&Don't', 원칙 4 — headline only, no examples drawn)"
  - "92:5390 (frame '19' → on-canvas '02 탭 가이드 - Do&Don't', 원칙 5)"
  - "90:5595 (frame '17' → on-canvas '02 탭 가이드' — 환전신청/내역 1안 vs 2안 grouping worked example)"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as design-rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — 공통 탭 가이드 (Tab Usage)

Part of the NDS_UX Guide file's "TAB 탭" canvas (page node `90:3182`), inside the guide's "Usage Guidelines" group. The design team's internal rulebook for **when a tab is a tab**, how many items it may hold, and what must never be modeled as a tab. Cover slide is stamped `Last update 22.11.17`.

This is a **rules document**, not a product screen: use it to validate/generate tab UIs, not as a layout or flow reference (that's `csdesign/asset`'s job).

## Frame-numbering gotchas (two distinct ones on this canvas)

Same family of problem as `nds-ux-guide-color-contrast` and `nds-ux-guide-touch-area`, but this page has **two separate mismatches** — layer names are useless here, and on this page even the on-canvas number can't be fully trusted:

1. **Layer name ≠ on-canvas section number** (the familiar one). Frames named `Slide 16:9 - 9/10/11/12` all render on-canvas section "01"; frames named `06`, `13`, `18` render slides with *no* section number at all; frames named `09`, `10`, `16`, `19`, `17` all render on-canvas "02".
2. **On-canvas section number ≠ the index's own numbering** (new — not seen in the earlier two projects). The index lists `03 탭가이드 - Do&Don't`, but the Do&Don't slides are numbered **01** (`92:4597`) and **02** (`90:5411`, `90:5341`, `90:5551`, `92:5390`, `90:5595`) on-canvas. The on-canvas digit here is behaving as a *counter within the Do&Don't run* (and is itself inconsistent — the first slide got 01, the remaining five all got 02), **not** as the guide's section number. So on this page, neither the layer name nor the on-canvas number reliably identifies the section — only the **index** does. Always reconcile against the index slide.

Below, sections are organized by the **index's** numbering (01/02/03), which is the only self-consistent scheme.

## 01. 탭 (Tabs)

### 탭(tabs) — definition (`90:4981`)
> "탭은 유저의 탐색을 돕는 도구로, 연관된 화면 그룹이나 병렬형 콘텐츠를 제공할 때 사용하는 UI 입니다.
> 페이지 이동이 아니기 때문에 길을 잃을 염려가 없어, 사용자의 불안감을 해소할 수 있습니다."

Illustrated with a photo of a physical filing cabinet full of colored index tabs, equated (`=`) to a wireframe of a tabbed content panel.

### 탭의 구성 — anatomy (`90:5120`)
> "탭을 구성하는 요소는 컨테이너, 탭 항목, 텍스트 레이블이 있습니다.
> 선택된 탭 항목은 활성화되고, 비활성화 상태인 탭 항목과 명확한 시각적인 구분을 제공합니다."

Callout labels on a 국내주식/해외주식 two-tab example: **컨테이너**, **탭항목**, **텍스트 레이블**, and **활성 탭 표시 인디케이터(옵션)** — note the indicator (the underline bar) is explicitly marked **옵션 (optional)**, not mandatory.

Second example — the 현재가탭 (뉴스/공시 · NH데이터 · 종목상세 · 업종시…) with a trailing `<` chevron button marked **사용금지 (prohibited)**:
> "현재가 탭과 관심그룹 화면에서 탭에 탭항목 탐색을 보조하는 버튼이 존재합니다.
> 탭 항목이 많아지지 않도록 탭항목을 그룹화하거나 사용자의 동선 기획을 권장합니다."

i.e. the tab-scroll helper chevron seen on 현재가/관심그룹 is **legacy and must not be reproduced** — fix the information architecture instead.

### 탭의 구성 — 고정 탭 vs 스크롤 탭 (`90:6595`)
> "탭은 수평으로 [스크롤이 가능한 탭]과 모든 탭을 한 화면에 표시하는[고정 탭] 이 존재합니다.
> 탭의 위치는 최상단이나 특정 UI 영역의 상단에 존재해당 영역에 표시되는 콘텐츠를 제어할 수 있습니다."

(Typo in the guide's own copy: "존재해당" — reads as 존재[하며,] 해당.) Examples labeled **[고정 탭]** (주식종목검색 국내주식/해외주식), **[스크롤이 가능한 탭]** (트렌딩 토픽 종합/경제/기술/정치/사회/문화/세…), and **전체화면이 아닌 특정 UI 영역을 컨트롤하는 탭** (NAVER / 마이크로소프트 order screens, where 매수·매도·정정/취소·체결/미체결·잔고 controls only the panel below it).

### 탭의 성격 — the 3 qualifying conditions (`90:6688`)
> "NDS에서 탭 UI는 다음과 같은 조건을 만족해야 합니다.
> 다음 조건을 만족한다면 chip, segmented control UI도 탭으로 사용할 수도 있습니다."

> - "탭 항목을 선택했을 때, 페이지를 이탈하거나 팝업을 띄우지 않습니다."
> - "탭은 자신이 컨트롤하는 영역 상단에 한줄로 수평으로 나열된 UI 입니다"
> - "같은 탭 내의 여러 탭항목을 동시에 선택할 수 없습니다."

Three annotated 참고 notes:
> "[참고1] 페이지가 이동한다면, 네비게이션 혹은 페이지 이동 버튼입니다." (illustrated with the global `quickmenu_basic`-style bottom nav — HOME/관심 그룹/계좌 잔고/주식 현재가/국내주식 주문)
> "[참고2] 단일선택의 필터 UI를 탭으로 사용할 수 있습니다." (1개월/3개월/6개월 pills; 미국/중국/일본/홍콩)
> "[참고3] 수직 탭 형태의 UI는 NDS에서 탭으로 분류되지 않습니다." (the vertical left-rail menu on 전체메뉴/트레이딩 screens)

**This is the operative definition**: a control is a tab iff (no page exit / no popup) AND (single horizontal row atop the region it controls) AND (single-select). Chips and segmented controls that pass all three *are* tabs; a vertical rail never is, and a control that navigates away is a nav button.

## 02. Case별 탭

### The decision tree (`90:5760`)
Root: **"탭을 써야하는가?"**
- **No** → **"팝업, 드롭다운, 페이지 이동 등 고려"**
- **Yes** → **"전체화면을 컨트롤 하는가? (= Top bar 바로 아래 있는가?)"**
  - **Yes** → `tab 1` (EX) 종목검색, 나의자산현황) / `tab 2` (EX) — see the tab2 warning below
  - **No** → **"탭 항목이 스크롤 되는가?"**
    - **No** → `tab 3` (EX) 국내주식잔고/손익, 국내주식체결내역) / `tab 4` (EX) 투자전략) / `tab 5` (EX) 전체메뉴) / 세그멘티드컨트롤 (EX) 국내주식잔고/손익_매매손익) / 단일 선택 chip (EX) 홈화면_지수)
    - **Yes** → `tab 4` (EX) 금현물 현재가, ELW 현재가) / 단일 선택 chip (EX) 홈화면_국내종목순위)

**The tab2 warning, verbatim** (attached to the tab1/tab2 branch):
> "전체화면을 컨트롤하는 탭의 항목이 생략된다면,
> 사용자에게 큰 불편함을 줄 수 있습니다.
> 특히, 배타적인 서비스(화면)의 나열을 위해 사용하면 안됩니다.
>
> 대부분의 경우 tab2는 사용하지 마시길 바라고,
> 사용자가 생략된 탭항목을 유추할 수 있는 경우에만 사용가능합니다."

Worked 예시 화면 (투자숙려 청약(매수)의사 신청 — 전체/ELS/DLS/펀드/신탁/Wrap/채권):
> "이 경우에는 나열된 탭항목이 투자상품들이기 때문에,
> 사용자가 생략된 탭항목을 유추할 수 있습니다.
> 하지만, 경우에 따라서 탭 ui 대신 드롭다운을 고려할 수도 있습니다."

### The spec sheet — 고정형 탭 / 스와이프형 탭 (`90:5657`)

**This is the page's authoritative size + item-count table.** Two columns: **고정형 탭** (fixed, all items visible) and **스와이프형 탭** (swipeable/scrolling).

| Type | Column | Height | 탭 항목의 수 |
|---|---|---|---|
| `tab 1` | 고정형 탭 | **72px** | **(필수) 2개~4개** |
| `tab 2` | 스와이프형 탭 | **72px** | **(권장) 2개~7개** |
| `tab 3` | 고정형 탭 | **72px** | **(권장) 2개~7개** |
| `tab 4` | 스와이프형 탭 | **72px** | **(권장) 2개~7개** |
| `tab 5` | 고정형 탭 | **70px** | **(권장) 2개~4개** |
| 세그먼트 컨트롤 | (fixed) | **58px** | **(필수) 2개~4개** |
| 단일선택 chip | (swipeable) | **50px** | **(권장) 2개~7개** |

Note the heading on this slide reads **"세그먼트 컨트롤"** while the decision-tree slide (`90:5760`) writes **"세그멘티드컨트롤"** and slide `90:6688` writes **"segmented control"** — three spellings for the same control in one deck; don't treat them as different components.

**필수 vs 권장 matters**: `tab 1` (2~4개) and 세그먼트 컨트롤 (2~4개) are **필수 (mandatory)**; everything else is **권장 (recommended)**. Cross-check against 원칙 3 below, which independently recommends 3~5개 and caps at 7개.

### 팝업에서의 탭 (`92:4889`)
> "팝업에서 탭을 사용하는 경우, 2~3개로 탭 항목의 수를 제한합니다.
> 4개 이상의 탭이 필요한 경우 팝업보다는 스크린의 사용을 권장합니다.
>
> 예외적으로, 병렬형 콘텐츠의 나열을 탭에서 하는게 효과적이라 판단한 경우에 한하여
> 팝업 스와이프형 탭의 사용이 가능합니다."

Two examples: **팝업 고정형 탭** (Tab1/Tab2/Tab3 + green 확인 CTA) and **팝업 스와이프형 탭** (타이틀 + 미국/중국/홍콩/일본 chips + green 확인 CTA). This is the tightest cap in the deck — **2~3 items inside a popup**, vs 2~7 on a screen.

## 03. 탭 가이드 - Do&Don't

Five numbered 원칙. (Reminder: these render as on-canvas "01"/"02" but are the index's section 03.)

### 원칙 1 (`92:4597`)
> "**원칙 1)** 탭은 사용자가 사용할 때 기준으로, 이해와 예측이 쉬운 논리적인 콘텐츠 덩어리로 묶어서 제공해야 합니다."

Six 매매동향 / 종목순위 examples in a Do / Don't / Can Do grid:
> **Do** — "연관 화면 그룹을 보여줄 때 탭을 사용합니다." (종합/투자자별/프로그램/자금동향)
> **Don't** — "함께 봐야하는 콘텐츠가 있다면 탭으로 구분하지 않습니다." (종합/외인/기관/개인)
> **Don't** — "탭을 구성할 때는 화면전환이 같은 맥락 안에서 이뤄져야 합니다." (오늘/투자자별/금액/외인 — mixing a time axis, an actor axis and a metric axis in one tab row)
> **Can Do** — "단일 옵션을 선택해야 하는 UI에서도 탭을 사용할 수 있습니다. (필터, 정렬, 관련된 데이터의 서브뷰 보기 등)"
> **Can Do** — "병렬형 콘텐츠를 제공할 때에도 탭을 사용할 수 있습니다."

### 원칙 2 (`90:5411`)
> "**원칙 2)** 언제나 하나의 선택된 탭이 존재해야 합니다."

> **Don't** — "유저가 탭을 볼 수 있는데 선택된 탭이 없으면 안됩니다." (투자컨텐츠 국내주식/해외주식/채권/원자재 with nothing selected and a blank body)
> **Do** — "탭 선택 시 제공할 콘텐츠가 없으면 공백상태임을 알려줘야합니다." (same tabs, 국내주식 selected, body reads "아직 작성 중이에요 / 금방 멋진 컨텐츠를 가져올게요!")
> **Not** — "다중 혹은 0개 선택 가능한 필터는 탭으로 보지 않습니다." (맞춤 종목 뉴스 관심종목/보유종목/오늘뉴스/많이 본 뉴스 chips, shown both multi-selected and zero-selected)

The **Do** example doubles as the empty-state pattern: never leave the body blank — ship an explicit empty-state message.

### 원칙 3 (`90:5341`)
> "**원칙 3)** 탭 항목은 사용자가 인지, 탐색하기 쉬워야합니다."

> **Do** — "짧고 이해하기 쉬운 텍스트 레이블을 사용합니다." (거래내역 전체/입출금/환전/매매)
> **Don't** — "탭 항목에서 불필요하게 긴 텍스트, 다른 폰트 크기, 줄바꿈은 불가합니다." (전체내역/매매내역/입출금 및 입출고 내역/외화 환전… — note the two-line wrapped item and the truncated one)
> **Do** — "탭 항목의 개수는 3~5개를 권장합니다." (국내 종목순위 실시간조회수/상승률/거래량)
> **Don't** — "탭 항목의 수가 많아지면, 사용자는 탭을 탐색할 수 없게 됩니다. 불가피한 경우가 아니라면 7개 이하로 사용하시길 바랍니다." (a 10-chip row: 실시간조회수/상승률/거래량/기관 순매수/외국인 순매수/공매도순/자사주매입순/시가총액순/배당률순/종목점수순)

**Three explicit constraints on the label itself**: no unnecessarily long text, **no differing font sizes across items**, **no line breaks**. Combined item-count guidance across this deck: 3~5 권장 → 7 hard-ish ceiling → 2~3 inside a popup → 2~4 필수 for tab1/세그먼트 컨트롤.

### 원칙 4 (`90:5551`)
> "**원칙 4)** 프로그레스 상태를 표시하기위해 탭을 사용할 수 없습니다."

**This slide is headline-only** — the frame contains the 원칙 text and nothing else (no Do/Don't examples were ever drawn). Not a rendering failure; the slide is genuinely unfinished. The rule still stands as stated: a multi-step progress/stepper indicator must not be built as a tab.

### 원칙 5 (`92:5390`)
> "**원칙 5)** 스크롤되는 탭의 숨겨진 탭항목을 사용자가 인지 혹은 추측할 수 있어야합니다."

> **Don't** — "스크롤 뒤에 온라인환전처리결과가 존재할 것이라고 사용자가 짐작하기 어렵습니다." (환전신청/내역: 실시간환전/환전내역/목표환율 거래신청/목표환율 거래신청조회/온라인환전처리결과)
> **Exception** — "탭 항목이 연속적이거나, 카테고리의 나열인 경우 사용자가 탭 항목을 추측할 수 있습니다." (계좌잔고: 전체/국내주식/해외주식/펀드/ELS/DLS/채권/RP/발행어음/MMW/선물옵션)

Note the **Exception** badge is rendered in teal/green here, distinct from the blue **Do** and red **Don't** badges — a third badge color used across this deck (also seen as **Not**, red, in 원칙 2, and **Better**, blue, in the popup guide). Badge vocabulary in this file is **Do / Don't / Can Do / Not / Exception / Better / Not Bad** — richer than a plain do-vs-don't binary.

### 탭 그룹화 worked example (`90:5595`)
On-canvas heading is just "02 탭 가이드" (no 원칙 number) — a full worked comparison rather than a rule.

> "하나의 탭에 서비스를 나열하지 않고,
> 의도와 목적에 따라 그룹화해서 화면을 구성할 수 있습니다"

Starting point: 환전신청/내역 with a single overloaded scrolling tab row (실시간환전/환전내역/목표환율 거래신청/목표…). Two proposed restructurings, each a 3-tab top row + a 2-chip sub-row:
- **1안)** top tabs 실시간 / 목표환율 환전 / 처리결과, sub-chips 신청하기 / 신청내역
- **2안)** top tabs 환전신청 / 신청내역 / 처리결과, sub-chips 실시간 / 목표환율

> "실시간환전과 목표환율환전이라는 서비스 별로 그룹화한 1안
> 환전신청과 신청내역 확인이라는 사용자 행동으로 그룹화한 2안"

The guide presents both as valid and does **not** declare a winner — it's illustrating the *axis choice* (group by service vs. group by user action), not prescribing one. Both collapse one long scrolling row into a short fixed row + a sub-level, which is the actionable takeaway.

## Component keys / variants observed

The deck is drawn with flat illustrative mockups, **not** live NDS_Library instances — no componentKeys are cited anywhere on this canvas. Cross-referencing the `LEADER.md` Core reference:

- **`tab_2depth_chip`** (key `0f20528265a3c598e42e30f6ae422be67e941c10`, Core reference) is the closest library component to this guide's **단일선택 chip** (50px, 2~7 items). The Core reference's existing note — that its `Default` variant ships pre-populated with several `tab_btn`+`TXT` pairs — is consistent with this guide's 2~7 item range; nothing here contradicts it.
- This guide names **seven** distinct tab-ish controls (`tab 1`–`tab 5`, 세그먼트 컨트롤, 단일선택 chip), but the Core reference only records one tab component. **Nothing in this guide resolves how `tab 1`–`tab 5` map onto NDS_Library components** — the names look like guide-internal labels, not library component names. Do not assume a `tab_1`…`tab_5` component exists; search the library before building.

## How this feeds BUILD mode

When generating or reviewing NH MTS screens (via `csdesign` → `nds/LEADER.md` Mode 2), apply before shipping any tab-like row:

**Is it even a tab?** All three must hold, else it's not a tab and must not be styled as one:
1. Selecting an item does **not** navigate away or open a popup (if it navigates → it's a nav button; see `quickmenu_basic`).
2. It's a **single horizontal row** at the top of the region it controls (a vertical rail is never a tab in NDS).
3. **Single-select only** (multi-select or zero-select → it's a filter, not a tab).
Chips and segmented controls that pass all three *are* tabs; treat them under these rules.

**Sizing (from `90:5657` — px, at the 540 canvas):**
- `tab 1`–`tab 4`: **72px** high. `tab 5`: **70px**. 세그먼트 컨트롤: **58px**. 단일선택 chip: **50px**.

**Item counts (tightest applicable rule wins):**
- Inside a **popup**: **2~3** items. Need 4+? Use a screen instead, not a popup.
- `tab 1` (full-screen fixed) and 세그먼트 컨트롤: **2~4 (필수)**.
- `tab 5`: 2~4 (권장). `tab 2`/`tab 3`/`tab 4`/chip: 2~7 (권장).
- General target: **3~5**; never exceed **7** without a stated unavoidable reason.

**Labels:** short, plain-language, **uniform font size across all items**, **never wrapped to two lines**, never truncated.

**Always-on states:**
- Exactly **one item selected at all times** — never render a tab row with nothing selected.
- If the selected tab has no content, render an **explicit empty state** (guide's own copy: "아직 작성 중이에요 / 금방 멋진 컨텐츠를 가져올게요!"), never a blank body.

**Hard prohibitions:**
- Never build a **progress/stepper** as a tab (원칙 4).
- Never reproduce the **tab-scroll helper chevron** from 현재가/관심그룹 — it is marked 사용금지; regroup the items instead.
- Never use `tab 2` for a row of **배타적인 서비스(화면)** — and default to not using `tab 2` at all unless users can infer the off-screen items.
- Don't mix axes in one row (time + actor + metric); one coherent context per tab row.
- If items scroll off-screen, they must be **inferable** — a continuous series or a category list is fine (Exception); an arbitrary trailing item like 온라인환전처리결과 is not.

**When a row is too long:** don't scroll it — restructure into a short fixed top row + a sub-level (chips/segmented control), grouping either by service or by user action (`90:5595`, both axes valid).

**The 활성 탭 인디케이터 (underline bar) is optional**, not required — its absence is not a bug, but the active/inactive visual distinction itself **is** mandatory.
