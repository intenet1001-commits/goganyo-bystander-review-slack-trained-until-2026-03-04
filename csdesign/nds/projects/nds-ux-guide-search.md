---
name: nds-ux-guide-search
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=4051-66242"
learned_date: 2026-07-15
sections_studied:
  - "4051:66342 (frame '01' — INDEX, lists 3 on-canvas sections: 01 검색 UX 정의, 02 서치바 가이드, 03 검색화면 케이스 별 정의)"
  - "4051:66354 (frame '02' → on-canvas '01 검색 UX 정의' — 목적/범위/진입경로 + entry-point screenshot strip)"
  - "4051:66690 (frame '22' → also on-canvas '01 검색 UX 정의' — the 검색 프로세스 5-step flow diagram; note the layer name '22' is wildly out of sequence and sits between frames '02' and '03' on canvas)"
  - "4051:66383 (frame '03' → on-canvas '02 서치바 가이드' — 기본형 vs 탐색형 definition + 4 search-bar states)"
  - "4051:66481 (frame '04' → on-canvas '03 케이스 별 정의', step ❶ 검색진입 (최근검색어 없을 때))"
  - "4051:66512 (frame '05' → on-canvas '03 케이스 별 정의', step ❶ 검색진입 (최근검색어 있을 때))"
  - "4051:66547 (frame '06' → on-canvas '03 케이스 별 정의', step ❷ 검색어 입력)"
  - "4051:66572 (frame '08' → on-canvas '03 케이스 별 정의', step ❸ 검색 결과 (결과 있을 때) — note: no frame named '07' exists on this page)"
  - "4051:66598 (frame '09' → on-canvas '03 케이스 별 정의', step ❸ 검색 결과 (결과 없을 때))"
  - "4052:848, 4052:868, 4052:877, 4052:896, 4052:905, 4052:914, 4052:919, 4053:23605, 4053:23609, 4053:23615, 4053:23619, 4053:23623, 4053:23627 (free-floating annotation callout groups parented to the page, not to the frames — each is a spec note pointing at a specific screen region)"
  - "4201:54062 (Update_History_01 — version table; v0.1 최초작성, 백채원, 2021.12.28)"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as design-rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — 검색 (Search)

Part of the NDS_UX Guide file's "검색" canvas (page group "Patterns"). This is the design team's internal rulebook for the whole search journey — entry → input → results → empty state. It is a **rules document**, not a product screen.

**Frame-numbering gotcha confirmed again**: as in `nds-ux-guide-color-contrast` and `nds-ux-guide-touch-area`, this page's internal Figma frame layer names do **not** match the on-canvas section numbers. Concretely here:
- layer `02` → on-canvas heading **"01 검색 UX 정의"**
- layer `22` → *also* on-canvas **"01 검색 UX 정의"** (a second page of the same section; the layer name "22" is a leftover and sits between "02" and "03" on canvas)
- layer `03` → on-canvas **"02 서치바 가이드"**
- layers `04`, `05`, `06`, `08`, `09` → all on-canvas **"03 케이스 별 정의"** (there is **no** frame named `07`)

Always trust the screenshot heading, never the layer name.

**Annotation gotcha specific to this page**: the spec callouts (the boxed notes with leader lines) are **not children of the section frames** — they're parented directly to the page canvas at coordinates far outside the frames. A `get_metadata` on a single frame will silently miss them. They carry some of the highest-value rules on the page (see 03 below).

## 01. 검색 UX 정의 (Search UX definition)

### 목적 (Purpose)
> "검색 진입부터 검색결과 도달까지의 사용자 여정에서 일관된 경험 제공. 사용자 검색 의도를 파악하고, 최적의 결과를 빠르게 제공하여 이탈 방지."

### 범위 (Scope)
> "검색 진입 → 입력 → 결과 → 예외(Empty)"

### 진입경로 (Entry paths)
> "서치바 또는 아이콘을 통해 진입합니다."

Two entry classes, each illustrated with real MTS screenshots:
- **서치바** (a search bar embedded in the screen): `[전체메뉴]`, `[뉴스]`, `[투자현미경]`
- **아이콘** (a magnifier icon in the header): `[통합검색]`, `[뉴스인사이트]`

### 검색 프로세스 (Search process — the 5-step flow)
A left-to-right flow diagram over one real screen (`[이벤트]`), with each step tagged by a colored chip:
**검색진입** (green) → **검색어 입력** (green) → **검색 결과** (green) → **결과 없음** (orange/amber). The amber chip visually marks the exception branch; the happy path is green. Empty state shown as an ⓘ icon + "검색결과가 없습니다."

## 02. 서치바 가이드 (Search-bar guide)

Two mutually exclusive search-bar types. This is the single most reusable decision rule on the page:

| Type | Verbatim definition | Placement |
|---|---|---|
| **기본형** (Basic) | *"리스트 검색·콘텐츠 필터링에 사용되며, 보통 헤더 아래에 들어갑니다."* | Below the header, as a row in the page body |
| **탐색형** (Exploratory) | *"검색이 주된 목적인 화면(통합검색·메뉴검색·종목검색 등) 헤더 위치에 사용합니다."* | **In** the header — the search bar *replaces* the header title |

Both types are documented across the same **four states**, labeled verbatim on canvas:
1. **Normal** — placeholder only, no cursor
2. **Focused Empty** — cursor visible, placeholder still shown, clear (✕) button present
3. **Focused Filled** — text entered + cursor + clear button
4. **Filled** — text entered, no cursor, clear button retained

Placeholder copy differs by type: 기본형 uses *"검색어를 입력하세요"*; 탐색형 uses *"종목 또는 검색어를 입력하세요"*.

**Voice-search rule** (annotation, appears twice — once per 탐색형 state group):
> "※ 음성검색 기능 있는 경우 아이콘으로 대체"

i.e. the mic icon **replaces** the trailing icon slot; it is not added alongside it. Components involved: `nds_icon_mic`, `nds_icon_search03_h30`, `nds_icon_delet`, `searchbar_basic`, `header_basic`, `nds_icon_header`, `header_title_txt`.

**Scroll behavior** (annotation `4053:23608`):
> "검색창은 필요에 따라 콘텐츠와 함께 스크롤하거나 화면 상단에 고정할 수 있습니다."

## 03. 케이스 별 정의 (Case-by-case definition)

The section is a matrix: **5 screen archetypes** × **3 journey steps**. The archetypes are labeled on every frame and grouped under the 기본형/탐색형 split from section 02:
- 기본형: `[공지, 이벤트]`, `[상품리스트]`
- 탐색형: `[통합검색]`, `[종목검색]`, `[전체메뉴]`

The three steps are shown as a numbered stepper at the top of each frame: **① 검색진입 → ② 검색어 입력 → ③ 검색결과**.

### Step ① 검색진입 (Entry)

Split into two frames — 최근검색어 **없을 때** (layer `04`) and **있을 때** (layer `05`).

Both frames carry the same red-boxed universal rule:
> "공통 : 진입 시 서치바 활성화 & 키보드 호출"

Annotations on the entry frames:
> "검색 방식을 안내하는 힌트메시지 작성" (`4053:23612`)

> "최근 검색어 Empty State메시지 노출" (`4052:864`) — rendered on canvas as "최근 검색 내역이 없습니다."

> "인기검색어(추천검색어)노출" (`4052:880`)

> "최근 검색어 최신순 정렬 (최대 노출 개수 정의, 보통 10개) 저장 정책(엔터, 리스트 클릭 시 히스토리 저장, 중복 시 최신만) 텍스트박스 넘어갈경우 처리 정의 최근 검색어 삭제 기능 제공 (개별삭제 & 전체삭제)" (`4052:851`)

The 최근검색어-있을 때 frame also shows a `[전체메뉴]`-specific extra block: **자주 쓰는 메뉴** chips (계좌개설 / 일반 환전 / 국내주식 현재가 / 국내주식 잔고…) sitting *above* the 최근 검색 메뉴 list — i.e. 전체메뉴 gets a shortcut rail that other archetypes don't.

### Step ② 검색어 입력 (Query input)

Only 탐색형 (`[통합검색]`, `[전체메뉴]`) is designed at this step — the 기본형 columns are deliberately **empty** in the guide. Annotations:

> "한글자 이상 입력 시 검색 입력어 전체삭제 버튼 노출" (`4053:23618`)

> "검색어 입력 글자수 제한 (선택)" (`4053:23622`)

> "검색어 일치하는 부분 하이라이트 방식 정의 (선택)" (`4053:23630`) — shown on canvas as the matched substring rendered in green

> "스크롤 시 키패드 닫힘" (`4053:23626`)

> "검색어 실시간 조회 여부 (선택) - 초성 일치 ('ㅅㅅ' 입력 시 '삼성' 등 매칭) - 부분 일치 (단어 중간에 포함된 키워드 노출)" (`4052:899`)

Note the `(선택)` suffix: char-limit, highlight style, and realtime/초성 matching are explicitly **optional** per-project decisions, not mandatory NDS rules. Do not treat them as required.

### Step ③ 검색 결과 — 결과 있을 때 (Results present)

Annotation (`4052:908`):
> "카테고리별 섹션 구성 - 결과 정렬(필터) 옵션 종목 정보 요약 정책 (가격, 등락률 등)"

On canvas, `[통합검색]` shows a category tab rail (통합 / 종목 / 뉴스·공시 / 금융상품 / 편입종목 / 연…) with a per-section "더보기 1250 >" affordance; `[전체메뉴]` shows filter chips (전체 / 한국 / 미국 / ETF / NXT) plus a star (관심등록) per row. Matched substrings are highlighted green in the ticker column.

### Step ③ 검색 결과 — 결과 없을 때 (Empty results)

Annotations:
> "재검색 도움 메시지, 검색 정확도 개선 팁 제시" (`4052:917`)

> "대안 제시 (연관 또는 인기 검색어 리스트 노출하여 클릭 유도)" (`4052:922`)

On-canvas copy for `[통합검색]`: "검색결과가 없습니다." + "검색어의 단어 수를 줄이거나, 다른 검색어로 검색해 보세요." followed by a "이 검색어를 찾고계신가요?" chip rail (삼성전자 / LG에너지솔루션 / 카카오 / 레인보우로보틱스 / 환전). `[전체메뉴]` instead offers a "외견 넘기기" button. So the empty state is **not** one shared component — the recovery affordance is archetype-specific.

## How this feeds BUILD mode

When generating or reviewing any NH MTS screen that has a search surface:

1. **Pick the search-bar type first, from the screen's purpose — not from its layout.** If search is the screen's main job (통합검색/메뉴검색/종목검색), use **탐색형**: put `searchbar_basic` *in the header slot*, replacing the title (pair with `nds_icon_header Type=back` + `nds_icon_delet`). If search merely filters a list already on screen, use **기본형**: put the search bar in a row *below* `header_basic`.
2. **Design all four states, not just Normal**: Normal / Focused Empty / Focused Filled / Filled. The clear (`nds_icon_delet`) button must be present in every state except Normal, and only appears once ≥1 character is entered.
3. **On entry, the search bar is focused and the keyboard is up** — "공통 : 진입 시 서치바 활성화 & 키보드 호출". A search screen mocked with a dormant, unfocused search bar is wrong.
4. **Always design the 최근검색어 block with both states**: populated (최신순, ~10 items, individual ✕ + 전체삭제) and empty ("최근 검색 내역이 없습니다."). Add 인기/추천검색어 above it.
5. **Never ship a bare "결과 없음" screen.** The empty state needs a reason message *plus* a recovery path (related/popular keyword chips, or an alternative action). Copy pattern: "검색결과가 없습니다." + "검색어의 단어 수를 줄이거나, 다른 검색어로 검색해 보세요."
6. **Placeholder copy is type-specific**: 기본형 → "검색어를 입력하세요"; 탐색형 → "종목 또는 검색어를 입력하세요".
7. **If the screen has voice search, the mic icon replaces the search/clear trailing icon — don't stack both.**
8. Treat 글자수 제한 / 하이라이트 방식 / 실시간·초성 매칭 as **optional** — flag them as open product decisions rather than asserting them as NDS rules.
