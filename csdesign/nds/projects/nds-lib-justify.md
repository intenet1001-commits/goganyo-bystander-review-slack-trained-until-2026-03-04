---
name: nds-lib-justify
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=1867-20156"
learned_date: 2026-07-16
sections_studied:
  - "1867:20249 (frame '03' — on-canvas heading '개요'; sub-heads 'Background', 'UI Pattern의 범위와 정의')"
  - "1867:20178 (frame '04' — on-canvas heading '정보 : 유형과 정의'; columns '정보의 유형' / '유형에 따른 Component')"
  - "1867:20157 (frame '06' — on-canvas heading 'Combined : 적용원칙'; principles Consistency / Optimization / Proactive)"
  - "1966:17692 / 1966:17677 / 1966:17668 / 1966:17715 (wireframes 'Main_typeA', 'Main_typeB', 'Popup_typeA', 'Popup_typeB' — on-canvas annotation blocks '메인화면' and '풀팝업', both layer-named '풀팝업 정의')"
  - "1966:16055 / 1966:23220 + 1966:16067 / 1966:16068 / 1966:16069 (screen-taxonomy matrix — on-canvas axes 'type1.보는거'(단건/다건) × 'type1.하는거'(입력) vs '스크린' / '풀 팝업' / '부분 팝업 (프레임,슬라이딩)')"
status: "unknown — content is authored, sanctioned-looking guide copy, but the page carries NO 'Last update' stamp, and the deck it belongs to is present only as a 3-slide fragment (see 'Deck is a fragment'). Not marked deprecated either. Judged on evidence, not on the page name."
---

# NDS Library — " 📖 \bJustify_____________________" page

> **Page-name note:** the page's real name contains a literal **backspace character (U+0008)** between `📖 ` and `Justify` — `" 📖 \bJustify_____________________"`. `get_metadata` renders it as ` 📖 Justify_____________________`. Harmless, but it means exact-string page lookups by name will fail unless the `\b` is included.

## Headline: what `📖 Justify` actually is

**It is the NH Design System's UI Pattern guide — the "why" layer that sits underneath the component library.** Despite an underscore-padded name that reads like a cover/divider, this page is the only place in the file that answers *how do you decide what to put on a screen* rather than *what does this component look like*. It does three things. First (frame `03`) it defines the system's **unit of design**: not the component, but the **information (정보/Data)** — and it declares that all information reduces to a small set of types, from which UI Patterns are composed. Second (frame `04`) it defines each information type (**조회 / 요약 / 결과·상세**) and maps each one to the concrete components licensed to express it (Search, Filter, Sorter → 조회; Summary → 요약; Data Grid, Chart, Main 정보, Sub 정보 → 결과/상세). Third (frame `06`) it states the three **적용원칙 (application principles)** — **Consistency, Optimization, Proactive** — that govern how those types get combined. Below the deck sits a large working canvas that applies the theory to real NAMU app screens: a **screen-taxonomy matrix** (스크린 / 풀 팝업 / 부분 팝업 × 보는거(단건·다건) / 하는거(입력)) and an explicit **메인화면 vs 풀팝업 decision rule** with measured wireframes. In short: **this page is the design system's rationale and information architecture — the reasoning that the rest of the file silently obeys.** Nothing else in the domain learned so far carries it.

## Name reliability — MIXED, and mixed *within the page*

This page defeats a single per-page verdict. Of 531 TEXT nodes, a programmatic `name === characters` comparison plus screenshots of every deck frame gives **two distinct regions with opposite conventions**:

| Region | Convention | Verdict |
|---|---|---|
| Deck frames `03`/`04`/`06`, taxonomy axis labels, definition annotations | Layer name **is** the on-canvas copy (differs only by line breaks / `\r`) | **Names reliable** — but line breaks are lost in metadata, so `\n` must be recovered from `characters` |
| Pasted NAMU app mockups (instances) filling the taxonomy matrix | Layer names are **stale leftovers from the source component** and are frequently unrelated to the rendered text | **Names lie — do not read** |

Verified examples of names lying (name → actual rendered `characters`):

- `거래량` → `#중국`, `#홍콩`, `#일본`, `#한국`
- `실시간 국내 종목 순위` → `국가(거래소) 선택`, `통화 선택`, `계좌 선택`, `목표환율/거래금액`
- `3월 1주 ELS 1961~1963호` → `최근 로그인 시간`, `1,382.40원 적용`
- `53,945,000` → `$52,187`
- `타이틀 노출` → `해외주식 소수점 거래`
- `텍스트를 입력하세요` → `NH포인트 사용하기`, `매수 예상수량`
- `일이삼사오육` → `실시간 환전`, `환전 내역`, `목표환율 거래신청`

**Consequence for future passes:** the lead's standing warning ("layer names lie, and the convention is per-PAGE") needs refining — on this page it is **per-REGION**. The rule that actually predicts it: *authored annotation text is truthfully named; pasted/duplicated instances inherit their source's names and go stale.* Screenshot or read `characters` for anything inside an INSTANCE, always.

A second, subtler failure: **two different texts share the layer name `풀팝업 정의`** (`1966:17728` and `1966:17729`), but only one of them renders as 풀팝업 — the other renders as **메인화면**. A metadata-only read would have recorded both blocks as "풀팝업 정의" and silently lost the 메인화면 half of the rule.

**Rules embedded in screenshot images on this page: no.** The `image 1` raster (`1867:20340`) is a decorative Atomic-Design diagram (ATOMIC/MOLECULES/ORGANISMS/TEMPLATES/PAGES) sitting above the deck; the mockups are Figma frames, not flat images. All rule text on this page is live, selectable text.

## Frame `03` — 개요 (Overview)

Verbatim (line breaks as authored):

> **NH Design System의 UI Pattern은**
> **공통적으로 자주 발생하는 업무화면의 레이아웃 및 화면구성을 유형화하여 제공**하고, 이를 통해 다변화되는 디바이스와 업무유형에 최적화된 화면을 효율적으로 설계할 수 있도록 지원한다.

**Background:**

> 가장 기본적인 형태의 Search + Data Grid에 대한 UI Pattern뿐 아니라, 각기 다른 업무유형 및 데이터의 목적에 따라 Grid 형태를 벗어난
> **다양한 View Type에 대한 UI Pattern을 제공**하고자 한다.

**UI Pattern의 범위와 정의** (three bullets):

> • UI Pattern의 시작점이자 최소단위를 정보(Data)로 정의한다. 정보는 성격에 따라 **조회**, **요약**, **결과/상세** 세 가지 유형으로 구분한다.
>   설계자는 각각의 UI Pattern에 대한 특성을 이해하고, 목적과 정황에 맞는 UI Pattern을 사용하도록 한다.
>
> • 본 가이드에서 정의된 UI Pattern 이외에도 사용자의 업무습관, 업무화면의 특성을 고려하여 변형된 UI Pattern이 발생할 수 있다.
>   이러한 변형 Pattern의 경우 가능한 **UI 담당자와 협의하여 설계/적용**하도록 한다.

The diagram at the foot reads **정보 Data** (three tokens: 조회 / 요약 / 결과·상세, captioned 정보의 유형) → arrow → **UI Pattern** (stacked cards: 조회+결과, 조회+상세, 요약+결과, …). That arrow *is* the thesis of the page: information types compose into patterns.

> **The escape hatch is itself a rule.** The third bullet sanctions deviation but routes it through a named human ("UI 담당자"). A BUILD pass that invents a pattern not in this guide is not violating the system — it is violating the *consultation* requirement. Worth surfacing to anyone using this domain to generate screens.

## Frame `04` — 정보 : 유형과 정의 (Information: types and definitions)

Intro, verbatim:

> 필요 정보에 대한 다양한 방식의 빠른 접근을 지원하는 **조회**, 정보에 대해 집약된 내용을 한눈에 확인할 수 있는 **요약**,
> 조회/요약과 연관되거나 독립된 정보에 대해 다양한 View Type으로 제공하는 **결과/상세** 네 가지의 유형으로 구분하고 각 정보별로 사용가능한 컴포넌트를 제공한다.

⚠️ **Internal contradiction — see LEDGER.** This sentence says **"네 가지의 유형"** (four types) while naming only three (조회 / 요약 / 결과·상세), and frame `03` explicitly says **"세 가지 유형"** (three types). The diagram on both frames shows **three**. Reading: **three is correct**; `04`'s "네 가지" is an editing error, most likely a leftover from a draft that split 결과 and 상세 into two. Recorded as an unresolved source defect, **not** silently normalized.

### 정보의 유형 → definition → 유형에 따른 Component

| 유형 | Definition (verbatim) | Components | Component definition (verbatim) |
|---|---|---|---|
| **조회** | 정보를 조회하거나 분류, 정렬하기<br>위한 조건을 선택하거나 입력할 수 있는 유형 | `Search` | 사용자가 입력한 키워드 중심의 데이터 조회 방식 |
| | | `Filter` | 제공되는 검색 조건(필터)으로 걸러내며 데이터를 추리는 조회 방식 |
| | | `Sorter` | 제공되는 정렬 기준 조건 내에서 선택된 우선 순위 중심의 데이터 조회 방식 |
| **요약** | 정보에 대한 요점을 간추려서 한눈에<br>확인할 수 있도록 제공하는 유형 | `Summary` | 사용자에게 데이터를 요약하여 전해주기 위한 정보 방식 |
| **결과/상세** | 조회나 요약정보와 연계된 결과 및<br>상세정보 혹은 독립적으로 존재하는<br>일련의 정보 | `Data Grid` | 전체적인 데이터를 항목에 따라 보기위해 목록형으로 나열한 화면 |
| | | `Chart` | 데이터의 수치 정보를 기하학적으로 시각화한 화면 |
| | | `Main 정보` | 조회한 결과 또는 화면의 핵심정보 |
| | | `Sub 정보` | **상세정보** : 선택된 1건에 대한 상세정보<br>**종속정보** : Main 정보 1건에 종속된 정보<br>**연관정보** : Main 정보와 독립된 정보지만, 밀접한 연관성이 있는 정보 |

The left-hand wireframe stacks **조회조건 → 요약 → 상세** top-to-bottom in a single phone frame — i.e. the canonical vertical order of the three information types on one screen.

> **`Sub 정보`'s three-way split (상세/종속/연관) is the sharpest thing on this page.** It is a genuine taxonomy — "detail of the selected one" vs "dependent on the Main" vs "independent but closely related" — and it has no counterpart in any component page learned so far. It is the vocabulary a designer needs to argue about *what belongs on this screen*, and it exists only here.

## Frame `06` — Combined : 적용원칙 (Application principles)

Left nav reads `Overview` (bold/active) / `Structure` / `Type A. 조회/요약+ Data Grid`.

Intro, verbatim:

> 복잡할 수 밖에 없는 증권 앱을 사용자가 잘 인지하고, 편리하게 사용할 수 있도록 아래의 적용원칙에 따라 설계하도록 한다.
> 이를 통해, 각기 다른 특성을 가진 정보유형을 다양하게 결합하여 일관된 사용자경험과 효율적인 업무처리를 가능하게 한다.

| Principle | Rules (verbatim) |
|---|---|
| **Consistency** | • 전체 사이트에서 조회/요약 정보와 상세/결과 정보의 배치와 레이아웃은 가능한 일관성을 유지한다. |
| **Optimization** | • 업무 Flow는 획일적인 일관성보다는 각 업무 맥락에 맞는 흐름을 우선으로 한다.<br>• 상→하, 좌→우 흐름의 자연스러운 동선을 고려한다. |
| **Proactive** | • 사용자가 CRUD액션에 대해 확인 후 처리할 수 있도록 하여, 오류를 방지하도록 구성한다.<br>• CRUD결과에 대해서 확인할 수 있는 화면을 제공한다.<br>• 기능을 추가할 때 보이지 않는 Interaction에 대해서도 고려한다. |

> **Consistency and Optimization are deliberately in tension, and the guide picks a winner.** Consistency governs **layout** ("배치와 레이아웃"); Optimization explicitly *overrides* consistency for **flow** ("획일적인 일관성보다는 각 업무 맥락에 맞는 흐름을 우선"). So: *look the same, don't necessarily behave the same.* This is a real, quotable adjudication rule and is the single most useful sentence on the page for resolving future design arguments.

### Deck is a fragment — do not treat as complete

The frames present are named **`03`, `04`, `06`** only. There is no `01`, `02`, or `05`, and frame `06`'s own left-hand nav advertises **`Structure`** and **`Type A. 조회/요약+ Data Grid`** sections that **do not exist on this page or anywhere in this file's 51 pages**. Two readings, unresolved: (a) this is an excerpt pasted from a larger UI Pattern deck living outside NDS_Library, or (b) the deck was abandoned mid-authoring. Either way, **the `적용원칙` are stated but the `Structure`/`Type A` slides that would show them applied are missing.** This — not the page name — is why `status` is `unknown`.

## The working canvas (below the deck)

### 메인화면 vs 풀팝업 — the registration rule

Two annotation blocks, both mis-named `풀팝업 정의`. Verbatim `characters`:

`1966:17728` (above `Main_typeA`/`Main_typeB`):
> **메인화면**
> 메뉴 등록 **O**

`1966:17729` (above `Popup_typeA`/`Popup_typeB`):
> **풀팝업**
> 메뉴 등록 **X**
> 다른 메인 화면에서 호출이 필요한 경우 메뉴로 등록

Flanking annotations:
- `네비게이션 화면 간 이동 O ` (on the 메인화면 row) / `네비게이션 화면 간 이동 X ` (on the 풀팝업 row)
- `하단 퀵메뉴` (메인화면 row only)
- `고정영역 유무`, `고정영역 사용 여부`, `스크롤 여부` (both rows)
- `최소 125 ~ 최대 450` (appears on **both** rows — the 고정영역 height range)
- `Tab` / `Notice` (×2 — the components allowed in the 고정영역)
- `SearchBar / Form / Button / Toggle / Popup / Cards / Dialog / Notice / Table` (the scrollable body inventory)

**So the decision rule is:** a **메인화면** is menu-registered, participates in inter-screen navigation, and carries the 하단 퀵메뉴. A **풀팝업** is *not* menu-registered and has no inter-screen navigation — **unless another main screen needs to call it, in which case it must be registered as a menu after all.** Both may have a 고정영역 of **125–450px** holding Tab/Notice, over a scrollable body.

Structural measurements read off the wireframes (all four are 540×1170, i.e. **540pt wide @ mobile**), which corroborate the annotations:

| Element | Measured | Matches annotation |
|---|---|---|
| `header` frame | **540×125** (= `statusbar` 65 + `Topbar_*` 60) | `최소 125` — the minimum 고정영역 *is* the bare header |
| `quickmenu_basic` instance | **540×74** | the `74` callout, next to the `하단 퀵메뉴` label ✓ |
| `Frame 9275` (home indicator) | 540×50 | — |
| 고정영역 max | — | `최대 450` (not independently measurable on-canvas) |

- `Main_typeA` / `Main_typeB` use `Topbar_Dropdown`; `Popup_typeA` / `Popup_typeB` use `Topbar_Basic`. **Header variant is the visual tell for main-vs-popup.**
- `Main_typeA`/`Popup_typeA` bodies are `single type A` (one 상세 block); `Main_typeB`/`Popup_typeB` are `multi type A` (요약 300px + 상세). So **typeA = single, typeB = 요약+상세** — which is exactly frame `04`'s stacking rule, drawn.
- The `70` callout (`1966:17704`, over `Main_typeB`'s header area) is **unresolved** — no NDS element on this page measures 70 (Topbar=60, statusbar=65, header=125, quickmenu=74). Not guessed at.

### Screen taxonomy matrix

A 3×3 grid of real NAMU app screens, axis labels verbatim:

- **Columns:** `type1.보는거` → `(단건)`, `(다건)` · `type1.하는거` → `(입력)`
- **Rows:** `스크린` · `풀 팝업` · `부분 팝업\n(프레임,슬라이딩)`

The `type1.` prefix on both column groups implies a **`type2.`** that is not on this page — another fragment marker.

Cells are populated with real product screens (펀드주문내역/취소, 환전신청/내역, 01_판매중인ELS/DLS, 01_트레이딩_미국IPO_이용등록완료, 유의사항_슬라이딩팝업, 유의사항_풀팝업, 해외주식 소수점 거래, …). **Several cells are empty** (notably 풀 팝업 × 다건, and 부분 팝업 × 다건) — **blank at source; this is the finding, not an omission by this pass.** Whether the blanks mean "combination is disallowed" or "not yet catalogued" is **not stated on the page** and must not be inferred.

## CORE — componentKeys found

**None from this page.** No COMPONENT or COMPONENT_SET is *defined* here; the wireframes contain INSTANCES (`Topbar_Basic`, `Topbar_Dropdown`, `statusbar`, `quickmenu_basic`) whose main components live on their own pages and should be keyed there, not from this working canvas. Nothing to promote.

## Gaps / unverifiable

- **No `Last update` stamp anywhere on this page** — unlike the Welcome page, which carries a dated `Library Update` changelog running to 2024.06.07. This page's freshness is genuinely unknown.
- The missing deck slides (`01`, `02`, `05`, `Structure`, `Type A. 조회/요약+ Data Grid`) may exist in another file. The Welcome page links out to **`NDS_Templates`** (fileKey `1xE0qvn2yv3ZkQ9BwhKT1y`) — an unexplored file and the most likely home for the full deck. **Recommend a future pass check there before concluding the deck was abandoned.**
- The `70` callout is unattributed (above).
- `04`'s "네 가지 유형" vs `03`'s "세 가지 유형" is recorded as a source defect; three is judged correct on diagram evidence, but this was not confirmed against any external spec.
- Empty matrix cells: meaning unknown (above).
- One node was skipped: `58426:30453` (`Slice 1`, 100×100) — a Figma export slice, carries no content.
- `1966:16087` (`faq` → `KOSPI | 005930`) is `visible: false`; a handful of `·` separator texts are likewise hidden. Per method, hidden-node text is **not** quoted as a rule anywhere above.
