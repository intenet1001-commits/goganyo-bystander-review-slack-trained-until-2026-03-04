---
name: nds-tpl-search-bar
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=12374-4326"
learned_date: 2026-07-15
sections_studied:
  - "16543:2498 ('1. Search Bar' — component-state spec sheet, on-canvas 'Search Bar' / 'QV-NM Search Bar Design Guide': BASIC (searchbar_basic) + FILTER (searchbar_filter) rows, each × Normal/Pressed/Filled columns)"
  - "16543:2639 ('2. Search bar_legacy' — deprecated design, on-canvas badge 'NDS 추가 개발 해당없음', text: '종목검색, 메뉴검색 등에서 쓰였던 기존의 디자인입니다. 사용을 지양합니다.')"
  - "16543:2719 ('Control_usage' — on-canvas '사용방법' 3-step + '사용 시 유의사항' 4-bullet + Update History 2023.08.07 구자영)"
  - "12388:5744 / 12388:8212 / 12388:8264 (검색창_기본01/02/03 — composed screens, searchbar_basic in a row BELOW Topbar_Dropdown+header)"
  - "12388:32315 / 12388:32499 / 12388:32600 / 12388:33194 (검색창_기본04-07 — searchbar_basic/searchbar_filter + filter_example chip row + list_product03 result rows)"
  - "12388:5749 / 12388:32744 / 12388:33098 / 12388:33312 / 12388:34670 (검색창_검색필터01-04 — searchbar_filter compositions, one with alarm list results, one with tab_1depth_line + list_stock results)"
  - "12394:36343 ('04_검색_결과_null' — header_basic RETAINED with title '알림' + tab row + searchbar_filter below + empty-state text '검색결과가 없습니다.')"
status: internal NDS component-library guide (Templates file — component-state spec sheet + composed usage examples, not a rules document)
---

# NDS Templates — Search Bar 검색, 검색창

Two-part page: a component-state spec sheet (`searchbar_basic`/`searchbar_filter` × Normal/Pressed/Filled, plus a deprecated `_legacy` variant) at the top-left cluster, and ~13 composed full-screen usage examples (검색창_기본01-07, 검색창_검색필터01-04, 04_검색_결과_null) spread across the canvas. `get_metadata` on the page nodeId returned the full tree without overflow — no python parser needed.

## Layer-name convention — reliable

Frame names (`검색창_기본01`, `검색창_검색필터02`, `1. Search Bar`, `Control_usage`) match on-canvas headings exactly, confirmed via screenshot. Instance names (`searchbar_basic`, `searchbar_filter`, `header_basic`, `Topbar_Dropdown`, `list_product03`) also read directly as their component name, confirmed via `getMainComponentAsync()`. **Reliable on this page.**

## Component keys — all genuine COMPONENT_SETs, `remote: true`

Sampled via 5 explicit node IDs (per read-only risk; all 5 succeeded, no throws this pass):

| Instance | node | variant COMPONENT | key | remote | parent SET name | parent SET key |
|---|---|---|---|---|---|---|
| `searchbar_basic` | `12388:5748` | `Type=left-solid, Status=normal` | `65b9cd256a3bb66aa4738b5626bf8a934e502927` | true | `searchbar_basic` | `755deb62dc296ad41135fb0147e814de64cb7e08` |
| `searchbar_filter` | `12388:5753` | `Type=line, Status=normal` | `585addbfa5dc0fd2f00304ead205dd50bb27be32` | true | `searchbar_filter` | `0ca00d45253ed2384c2cce8e681af9eda793c502` |
| `header_basic` | `12394:37067` | `Channel=NM, Left Icon=on, Right Icon=on` | `f3856f3362229d169e328d4d6639599672e83348` | true | `header_basic` | `c95043e94317fde7230298017f42dd8099e1cbdc` |
| `Topbar_Dropdown` | `12388:5746` | `Channel=NM, Type=basic, Combo=off` | `69e7ffd43cdf9888ae6fc9bbedff3627fe504e6d` | true | `Topbar_Dropdown` | `ce701f7c5eda23073d17bd862838e75f191b0a96` |
| `list_product03` | `12388:34901` | `in Card=off` | `dac7bea55af02c9922efc2725eb8d5a8e3759d68` | true | `list_product03` | `6eb8cdb388e2ffdf8be7688c9f040597c289db80` |

`header_basic` SET key matches Core exactly — a further corroboration (adds to the running tally from `nds-tpl-header`/`nds-tpl-layout`/`nds-tpl-padding`). `Topbar_Dropdown` and `list_product03` SET keys also match prior sightings exactly (`nds-tpl-layout` and `nds-tpl-list` respectively). **`searchbar_basic` and `searchbar_filter` are NEW — Core has no searchbar entry at all**, so these two keys are the first record of them in the domain reference.

## Gotcha 5 check

Reported both the variant COMPONENT key and its parent SET key for every sample (per Gotcha 5a) — no name collision observed for `searchbar_basic`/`searchbar_filter` on this page (unlike `header_basic`/`statusbar`/`btn_bottom_page`). Not conclusive across the whole file, only on this page's 5 samples.

## ANSWERS to the cross-file question

**탐색형/기본형 split — NOT corroborated on this page; only 기본형 is shown.** Every one of the ~13 composed screens keeps `header_basic`/`Topbar_Dropdown` intact with its own title, and places `searchbar_basic`/`searchbar_filter` as a **separate row below it** (`검색창_기본01` screenshot: header shows "타이틀" + back + dropdown chevron, search row sits directly under it; `04_검색_결과_null` keeps header title "알림" + tab row + `searchbar_filter` below, matching the 기본형 pattern exactly). **No frame on this page shows a search bar occupying the header slot in place of the title** — the 탐색형 placement (`searchbar_basic` in-header, replacing title) that the UX Guide prescribes for 통합검색/메뉴검색/종목검색 has **zero examples here**. The `_legacy` sheet explicitly names 종목검색/메뉴검색 as its former use case but is marked deprecated (badge: "NDS 추가 개발 해당없음") — so the guide's 탐색형 case is a **documented rule with no current-generation Templates example**, not a contradiction. Gap, not conflict.

**`searchbar_basic` exists as a real published component — confirmed.** SET key `755deb62dc296ad41135fb0147e814de64cb7e08`, COMPONENT `65b9cd25…`, both `remote: true`. `searchbar_filter` likewise: SET `0ca00d45253ed2384c2cce8e681af9eda793c502`, COMPONENT `585addbf…`, `remote: true`. This closes the exact gap the Core reference flagged ("Core has no searchbar entry").

**All four states — NOT present; only three are documented.** The spec sheet (`16543:2498`) labels columns **NORMAL / PRESSED / FILLED** for both `searchbar_basic` and `searchbar_filter` — verbatim on-canvas. PRESSED shows cursor + placeholder + clear(✕) button (≈ guide's "Focused Empty"); FILLED shows entered text ("삼성") + cursor + clear button (≈ guide's "Focused Filled"). **The guide's 4th state — "Filled" (text entered, no cursor, clear button retained) — has no distinct column here.** Templates ships a 3-state matrix; the UX Guide's rule requiring 4 states is **not fully corroborated** — either the guide over-specifies, or Templates under-documents. Flagged, not resolved.

## Legacy / usage notes

- `2. Search bar_legacy` is explicitly deprecated: badge "NDS 추가 개발 해당없음" (not applicable to further NDS development) + red text "사용을 지양합니다." Historically covered 종목검색/메뉴검색 (the exact 탐색형 use cases) and included a mic icon variant + dropdown-scoped ("전체" ▾) variants not present in the current `searchbar_basic`/`searchbar_filter` sets sampled here.
- `Control_usage` states verbatim: 사용방법 — "1. 화면에 맞는 search bar 디자인을 확인합니다. 2. 케이스별 properties를 확인합니다. 3. 화면의 밸런스를 고려하여 아이콘의 컬러(03/04)를 선택합니다." 사용 시 유의사항 — "제공된 라이브러리 이외의 탭은 사용을 지양합니다. 하단의 legecy는 사용을 지양합니다. 수정은 디자이너와 협의가 필요합니다. (for designer) 예외케이스는 해당하는 templates에 추가하도록 합시다." Last update 2023.08.07 구자영.
- `04_검색_결과_null` empty-state copy on canvas: "검색결과가 없습니다." — matches the first half of the UX Guide's two-part empty-state copy exactly; the guide's second sentence ("검색어의 단어 수를 줄이거나...") and recovery-chip rail are **not present** in this frame (single-line message only, no chip rail visible in this screenshot).

## Blanks / gaps

- No 탐색형 (in-header) example anywhere on this page — see ANSWERS above.
- No frame demonstrating the guide's "Focused Typing" vs "Filled" distinction — only 3 states shown.
- Voice-search mic-icon replacement rule (from the UX Guide) not observed on the current (non-legacy) `searchbar_basic`/`searchbar_filter` — only the deprecated legacy sheet shows a mic icon.
- Free-floating text nodes named "토스트/체결알림 정의" (×6, at extreme off-canvas coordinates) not screenshotted — likely mislabeled per the file's known "layer names lie" pattern; out of scope, not quoted as rules.
