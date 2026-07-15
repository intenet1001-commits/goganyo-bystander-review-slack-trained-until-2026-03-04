---
name: nds-ux-guide-empty-state
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=4050-64272"
learned_date: 2026-07-15
sections_studied:
  - "4106:1313 (frame '02' — the INDEX slide, child frame 4106:1314 'index'. Lists: 01 데이터 없음 (Empty State) UX 라이팅, 02 상황 별 작성 가이드, 부록 유형별 디자인가이드)"
  - "4250:815 (frame '03' → on-canvas '01 데이터 없음 (Empty State) UX 라이팅' — 정의 / 목적 / 메시지 라이팅 가이드)"
  - "4258:716 (frame '04' → on-canvas '02 상황 별 작성 가이드', Case 01 검색 결과 없음)"
  - "4258:748 (frame '05' → on-canvas '02 상황 별 작성 가이드', Case 02 내역·리스트 없음)"
  - "4258:765 (frame '06' → on-canvas '02 상황 별 작성 가이드', Case 03 필터 적용 결과 없음)"
  - "4106:1309 ('👍 thumbnail' cover slide — title '데이터 없음')"
  - "4122:80 (Update_History_01 — version table, rows still placeholder 'v0.1 최초작성 / 백채원 / 2021.12.28')"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as UX-writing rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — 데이터 없음 (Empty State)

Part of the NDS_UX Guide file's "데이터 없음" canvas ("NHI UX Writing Guide" corner tag). Governs the copy shown when a screen has nothing to display. The guide's core stance is that an empty state is a **merchandising opportunity, not an error message**.

**Frame-numbering gotcha confirmed again**: internal frame layer names are offset — layer **"02" is the INDEX**, layer "03" is on-canvas section **01**, and layers "04"/"05"/"06" all belong to the single on-canvas section **02** (one Case each). Same class of mismatch as `nds-ux-guide-color-contrast`, `nds-ux-guide-touch-area`, and the sibling UX-writing pages. Trust the screenshot heading.

**Missing section**: the INDEX lists **"부록 유형별 디자인가이드"**, but no 부록 frame exists on this canvas — the only frames present are the thumbnail, the index, sections 01/02 (4 slides), and the Update History. The design-guide appendix is indexed but never authored. Same defect class as the 완료팝업 page's missing section 03. Don't assume per-type visual specs exist here.

**Stale hidden text**: every content frame on this canvas carries a hidden text node reading *"명확한 전달을 위해 '완료'를 써야 합니다."* (`4250:818`, `4258:718`, `4258:752`, `4258:767`) — leftover boilerplate copied from the **완료팝업** canvas, unrelated to empty states. Ignore it; it is not an empty-state rule.

## 01. 데이터 없음 (Empty State) UX 라이팅

Three definition cards, each with an emoji-style `nds_infographic` illustration.

**정의** (`nds_infographic113`), verbatim:
> "검색결과 없음 / 거래내역 없음 / 알림 없음 등
> 표시할 데이터가 존재하지 않는 모든 화면의 텍스트."

**목적** (`nds_infographic91`), verbatim:
> "데이터가 없는 상태에서 사용자가 당황하지 않고,
> 다음 행동으로 자연스럽게 이어지도록 유도."

**메시지 라이팅 가이드** (`nds_infographic41`), verbatim:
> "데이터가 없는 화면은 '빈 공간'이 아닌, '새로운 제안을 할 수 있는 기회'에요.
> '내역이 없습니다'라고 끝내는 대신, **'지금 바로 투자를 시작해 보세요'**라고 제안해주세요."

That last line is the page's thesis: **never terminate on the absence — always propose the next action.**

## 02. 상황 별 작성 가이드

Three cases, each formatted identically: a situational rule, then a **권장 문구** block with `Headline:` / `Body:` / `CTA:` slots. All copy below is verbatim.

### Case 01 — 검색 결과 없음

Rule:
> "사용자의 실수를 바로잡아주거나,
> 검색 범위를 넓히도록 유도해주세요."

권장 문구:
> **Headline:** '{검색어}'에 대한 결과가 없어요.
> **Body:** 검색어의 단어 수를 줄이거나, 다른 검색어로 검색해 보세요.
> **CTA:** (필요 시) 인기 종목 보러가기, 이런 검색어는 어때요? 등

The mockups (해외뉴스 검색, 통합검색) show the current production copy — *"검색결과가 없습니다."* — highlighted in **red/pink as the before state**, i.e. the deprecated `-습니다` phrasing that the 권장 문구 replaces. The 통합검색 mockup also shows the CTA realized as a suggested-keyword chip block: *"이 검색어를 찾고계신가요?"* with 삼성전자 / LG에너지솔루션 / 카카오 / 레인보우로보틱스 / 환전 chips.

Note the CTA is **optional here** ("(필요 시)") — the only case of the three where it is.

### Case 02 — 내역·리스트 없음

Rule:
> "'비어 있음'이 시스템 오류가 아닌 '**아직** 활동 전'임을 인지시키고,
> 첫 활동을 독려해 주세요."

권장 문구:
> **Headline:** 아직 [거래/관심] 내역이 없어요.
> **Body:** 지금 첫 거래를 시작하고 자산을 관리해 보세요.
> (또는 "관심 있는 종목을 추가하면 여기서 바로 확인할 수 있어요.")
> **CTA:** 주식 사러 가기 / 종목 추가하기

The word **"아직"** is doing the load-bearing work — it converts "you have nothing" into "you haven't started yet". Mockups: 자주 쓰는 계좌 관리 (before-state copy *"자주 쓰는 계좌가 아직 없습니다."* redlined, with a green `등록하기` CTA bar at the bottom) and a dark-mode 월간나무 screen showing a distinct **loading/preparing** state — *"과거 리스트를 준비하고 있어요. 잠시 후 다시 찾아주세요!"* — which is **not** an empty state and should not be written like one.

### Case 03 — 필터 적용 결과 없음

Rule:
> "선택한 조건이 조합된 결과가 없음을 알리고,
> 다시 탐색을 시작할 수 있는 가장 빠른 방법을 제안해 주세요."

권장 문구:
> **Headline:** 선택하신 조건에 맞는 상품이 없어요.
> **Body:** 조건을 변경해서 다시 검색해 볼까요?

**No CTA slot** — this is the only case with just Headline + Body. The "fastest way back" is the filter control already on screen, so no extra CTA is prescribed.

Mockups: 해외주식 양도세 증명서 발급 (before-state *"조회된 발급 내역이 없어요."* + *"조회기간을 확인해주세요."*) and 채권 투자하기 (before-state *"고객님 투자성향에 적합한 상품이 없습니다."* + *"투자성향 적합 상품 체크를 해제하면 전체 상품이 조회됩니다."* — a good example of naming the exact toggle to flip).

## Observed components in the mockups

Instance names seen inside the guide's empty-state mockups (names only — `get_metadata` exposes no componentKeys):

- `nds_icon_info` / `nds_icon_info05_h30` — the small ⓘ circle that sits **above** the empty-state headline (20–21px in a 360-wide mockup). Present in every empty-state block across all three cases.
- `nds_infographic113` / `nds_infographic91` / `nds_infographic41` — the 110×110 illustration set used on the section-01 definition cards (folder / signpost / compass). These are guide-slide decoration, **not** part of the empty-state UI itself.
- `header_basic`, `statusbar`, `searchbar_basic`, `tab_1depth_line`, `tab_1.5depth_line`, `Table_header`, `nds_icon_arrow`, `quickmenu_basic`
- Recurring structure: a frame literally named **`empty`** / **`empty message`** containing `nds_icon_info` + headline TEXT + body TEXT.

Note the mockups here are built on a **360px-wide** canvas (`statusbar width="360"`, `header_basic width="360"`), not the 540px width documented in `nds/LEADER.md` → "Canvas width: build at 540px". These are guide illustrations, not production frames — the 540 rule still governs real screen construction; this is just a note that guide mockups don't follow it.

## How this feeds BUILD mode

When generating or reviewing any NH MTS **empty state** (via `csdesign` → `nds/LEADER.md` Mode 2):

1. **Never end on the absence.** `내역이 없습니다.` alone is the flagged anti-pattern. Every empty state = Headline (what's absent) + Body (what to do) + CTA where applicable.
2. **Ending style is `-어요`, not `-습니다`.** Every before-state redlined in this guide uses `-습니다` (`검색결과가 없습니다.` / `자주 쓰는 계좌가 아직 없습니다.` / `적합한 상품이 없습니다.`) and every 권장 문구 uses `-어요` (`…결과가 없어요.` / `…내역이 없어요.` / `…상품이 없어요.`). This is the single most mechanical check on the page.
3. **Match the case to the rule:**
   - **검색 결과 없음** → echo the query back (`'{검색어}'에 대한 결과가 없어요.`), tell them how to broaden, CTA optional (popular items / suggested keywords).
   - **내역·리스트 없음** → include **"아직"**, frame as pre-activity not error, CTA **required** (`주식 사러 가기` / `종목 추가하기`).
   - **필터 적용 결과 없음** → name the condition mismatch, invite a filter change (`조건을 변경해서 다시 검색해 볼까요?`), **no extra CTA**.
4. **Echo the user's own input when you have it** — `'{검색어}'` in Case 01, the specific toggle name in Case 03's 채권 example. Generic "결과가 없습니다" wastes information you already hold.
5. **Every empty-state block gets the `nds_icon_info` ⓘ above the headline**, centered, with headline (~22px) over a lighter body line.
6. **Don't write a loading state as an empty state.** "준비하고 있어요 / 잠시 후 다시 찾아주세요" is a different state with a different message; conflating them is a defect.
7. **No 부록 유형별 디자인가이드 exists** despite the index listing it — per-type visual specs are not available in this file; don't invent them.
