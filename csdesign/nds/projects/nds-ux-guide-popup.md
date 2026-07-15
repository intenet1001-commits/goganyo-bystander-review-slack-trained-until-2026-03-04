---
name: nds-ux-guide-popup
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=1-880"
learned_date: 2026-07-15
sections_studied:
  - "247:4853 (index/cover — '공통 팝업 가이드', UX GUIDE, 'Last update 22.11.21'. Lists 4 sections: 01 슬라이딩 팝업, 02 레이어 팝업, 03 스크린 / 풀팝업, 04 팝업 하단 버튼)"
  - "1:4228 (frame 'Slide 16:9 - 9' → on-canvas '01 슬라이딩 팝업 - 언제 쓰나요?' — the default-popup rule + anatomy + a pointer to NDS_Templates)"
  - "1:4568 (frame 'Slide 16:9 - 10' → on-canvas '01 슬라이딩 팝업 - Do&Don't', 원칙 1 — header rules)"
  - "1:4634 (frame 'Slide 16:9 - 11' → on-canvas '01 슬라이딩 팝업 - Do&Don't', 원칙 2 — no extra controls in the header, + 2 Exceptions)"
  - "1:4723 (frame 'Slide 16:9 - 12' → on-canvas '01 슬라이딩 팝업 - Do&Don't', 원칙 3 — no scrolling sliding popups; use 풀팝업)"
  - "1:4946 (frame 'Slide 16:9 - 13' → on-canvas '02 레이어 팝업 - 언제 쓰나요?' — 1줄 / 2줄 / 타이틀+설명 variants)"
  - "1:5030 (frame 'Slide 16:9 - 14' → on-canvas '02 레이어 팝업 - Do&Don't', 원칙 1 + 원칙 2)"
  - "1:5150 (frame 'Slide 16:9 - 18' → on-canvas '02 레이어 팝업 - Do&Don't', 원칙 3 — the 492px width spec)"
  - "1:5243 (frame 'Slide 16:9 - 25' → on-canvas '02 슬라이딩 팝업 / 레이어 팝업 헷갈려요 🧐' — the disambiguation cheat-sheet)"
  - "1:4398 (frame 'Slide 16:9 - 17' → on-canvas '03 스크린 / 풀팝업 구분' — definitions of 스크린 vs 풀팝업)"
  - "1:4422 (frame 'Slide 16:9 - 19' → on-canvas '03 스크린 / 풀팝업 구분' — header icon semantics: history back / dropdown / close)"
  - "1:4445 (frame 'Slide 16:9 - 20' → on-canvas '03 풀팝업 - Do/Don't' — close-vs-back placement)"
  - "1:4480 (frame 'Slide 16:9 - 22' → on-canvas '03 풀팝업 - Do/Don't' — no bottom exit buttons, + the 완료 팝업 exception)"
  - "1:5354 (frame 'Slide 16:9 - 16' → on-canvas '04 팝업 하단 버튼' — 닫기/확인 wording, ambiguous labels)"
  - "1:5385 (frame 'Slide 16:9 - 23' → on-canvas '04 팝업 하단 버튼' — two-choice prohibition + button size ratios)"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as design-rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — 공통 팝업 가이드 (Popup Usage)

Part of the NDS_UX Guide file's "Popup 팝업" canvas (page node `1:880`), inside the guide's "Usage Guidelines" group. The design team's internal rulebook for **which of the four popup/overlay types to use**, and what each one may and may not contain. Cover slide is stamped `Last update 22.11.21`.

This is a **rules document**, not a product screen: use it to pick and validate an overlay type, not as a layout or flow reference (that's `csdesign/asset`'s job).

**Frame-numbering gotcha — mild on this page.** Unlike the TAB and 터치영역 canvases, this page's on-canvas section numbers **do** match the index (01→01, 02→02, 03→03, 04→04). Only the *layer names* are meaningless: every frame is named `Slide 16:9 - N`, and that N tracks neither the section nor the reading order (e.g. `Slide 16:9 - 25` is the 8th slide, `Slide 16:9 - 16` is the 13th). Reading order is given by the frames' **y position**, not their names or numbers. One inconsistency worth noting: `1:5243` is numbered **02** on-canvas but is a cross-cutting 01-vs-02 comparison slide — arguably it belongs to neither section alone.

## The four types at a glance

| Type | Section | Use when | Header? | Bottom buttons |
|---|---|---|---|---|
| **슬라이딩 팝업** | 01 | **The default.** Anything long, with agree buttons, tables, or select options | **Yes** (max 1 line, mandatory) | Yes, 1:1 or 1:2 |
| **레이어 팝업** | 02 | Short 1~2-sentence notices/confirmations only | **No** (prohibited) | Yes, **1:1 fixed** |
| **풀팝업** | 03 | A single self-contained core process | Yes (close on right) | **No** (exit buttons prohibited) |
| **스크린** | 03 | A normal menu-unit screen | Yes (back on left) | n/a |

## 01. 슬라이딩 팝업 (Sliding popup)

### 언제 쓰나요? (`1:4228`)
> "기본적으로 슬라이딩 팝업을 사용합니다.
> 프로세스 진행, 알림, 안내, 유의사항, 계좌선택 등 다양한 경우에 폭넓게 쓰이는 팝업입니다."

**슬라이딩 팝업 is the default popup type** — this is the single most important sentence on the page. Anatomy shown on the skeleton example: **헤더(최대 한 줄)** / **내용** / a full-width green **닫기** button.

Examples: 나의 이체한도 (table + 닫기 | 이체한도수정), 안내 (body copy + "오늘 하루 보지않기" checkbox + 닫기 | 버튼명), 복수 선택일 때 사용 (a checkbox list + 취소 | 확인).

Pointer to the live components:
> "사용 예시
> Figma → NDS_Templates → Popup 참고"

i.e. the guide explicitly defers real popup construction to the **NDS_Templates** library (libraryKey in `../CORE.md`) — don't hand-build these.

### 원칙 1 — 헤더 (`1:4568`)
> "**원칙 1)** 헤더를 임의로 삭제하지 않으며, 헤더는 문장형으로 사용하지 않습니다."

> **Do** — 옵션 선택 (a short noun-phrase header + checkbox list + 취소 | 확인)
> **Don't** — "헤더를 임의로 삭제하지 않습니다" (a popup opening straight into body copy with no header)
> **Don't** — "헤더에 문장을 사용하지 않습니다" (header reads "조회기간을 설정해주세요" — a sentence)
> **Don't** — "슬라이딩 팝업의 디자인(라운드 값 등)을 임의로 변경하지 않습니다" (계좌 선택 shown with square corners and a full-bleed list)

Two separable rules: the header is **mandatory** (never delete it), and it must be a **noun phrase, not a sentence** ("조회설정" ✓, "조회기간을 설정해주세요" ✗). Plus: **the popup's own visual design — corner radius etc. — is not yours to change.**

### 원칙 2 — 헤더 영역 (`1:4634`)
> "**원칙 2)** 헤더 영역에 다른 기능/버튼을 사용하지 않습니다."

> **Do** — 옵션 선택 (bare header, no controls)
> **Don't** — "헤더 우측에 닫기 버튼을 사용하지 않습니다" (an `X` in the header's right side)
> **Exception** — "팝업 하단에 버튼이 없으며, 선택 시 옵션값이 즉시 적용되는 경우 허용합니다 (계좌 선택 등)" (출금 계좌 선택, `X` in header, no bottom button)
> **Exception** — "펀드 필터 등 특수한 경우 디자인팀 컴펌 후 사용합니다" (탭 메뉴 전체, with a refresh icon + collapse chevron in the header)

So the header `X` is **only** legal when the popup has **no bottom buttons at all** and selection applies immediately. Anything else needs **디자인팀 컴펌 (design-team sign-off)** — a real process gate, not a style suggestion.

### 원칙 3 — 분량 (`1:4723`)
> "**원칙 3)** 스크롤이 필요할 만큼 분량이 많은 경우 슬라이딩 팝업을 지양합니다."

> **Exception** — "스크롤되는 슬라이딩 팝업 사용을 지양합니다" (포커스펀드 선정기준 with a long Step 01/02/03 body; 환율정보 with a long rate table)
> **Better** — "슬라이딩 대신 풀팝업 사용을 권장합니다" (포커스펀드 선정기준 rendered as a full-screen popup with an `X`)

Note the badge here is **Better** (blue) rather than **Do** — the guide's badge vocabulary across this deck is **Do / Don't / Exception / Better / Not Bad**, not a plain binary.

## 02. 레이어 팝업 (Layer popup / dialog)

### 언제 쓰나요? (`1:4946`)
> "레이어 팝업은 중요한 알림, 확인 등에서만 사용합니다."

Three variants, all centered dialogs over a dimmed screen with a single full-width green 확인:
- **1줄** — "1줄 안내가 나갑니다."
- **2줄** — "2줄 안내가 나갑니다. 2줄 안내가 나갑니다.2줄 안내가 나갑니다."
- **타이틀 + 설명** — "타이틀 영역입니다. (최대 2줄)" + "타이틀에 대한 간략한 설명을 넣는 것이 가능합니다. (최대 2줄)"

Both the title and the description are capped at **최대 2줄** each.

### 원칙 1 + 원칙 2 (`1:5030`)
> "**원칙 1)** 레이어 팝업에 헤더를 사용하지 않습니다."

> **Do** — "최대 5개 계좌까지 등록 가능합니다." + 확인; and 소수점 거래를 할 수 있는 계좌가 없어요! + 닫기 | 서비스 신청
> **Don't** — "헤더를 사용하지 않습니다" (a dialog with a "알림" header bar above "외국환거래법 준수사항을 확인을 체크해주세요")

**Direct inversion of the sliding popup's 원칙 1**: 슬라이딩 팝업 *must* have a header; 레이어 팝업 must *not*. The presence of a header is the primary structural tell between the two types.

> "**원칙 2)** 분량이 많거나
>  하단 버튼 이외에 선택 옵션이 있는 경우
>  슬라이딩 팝업을 사용합니다."

> **Don't** — "다른 선택 옵션을 사용하는 경우 슬라이딩 팝업을 활용합니다" (비교할 지수 선택: chips + radio list inside a layer popup)
> **Don't** — "본문의 내용이 많을 경우 슬라이딩 팝업을 활용합니다." (매도신청금액 1,300 원 with a 4-row 평균체결가/예상수량 table)

**Two hard triggers to switch 레이어 → 슬라이딩**: (a) any interactive option beyond the bottom buttons, (b) a body that's more than a couple of sentences.

### 원칙 3 — 폭 (`1:5150`)
> "**원칙 3)** 레이어 팝업의 폭을 임의로 늘리거나 줄이지 않습니다."

> **Do** — a 2줄 dialog annotated **492px**
> **Don't** — "레이어 팝업의 폭은 492px로 고정합니다 (화면 폭 540 기준)" (a 해외주식 거래신청 확인 dialog annotated **482px**)
> **Don't** — "레이어팝업에서 2개의 버튼 사용 시 버튼의 크기는 1:1을 유지합니다" (a 432px dialog with unequal 닫기 | 오픈뱅킹 등록하기 buttons)

**Hard numbers**: 레이어 팝업 width is **492px fixed, at a 540px screen width**. Two buttons are **1:1 fixed**, never 1:2.

> **This independently confirms the Core reference's "build at 540px, not 375px" rule** — the guide states "화면 폭 540 기준" in its own copy. 492/540 = 91.1%, i.e. 24px side margins.

### 슬라이딩 팝업 / 레이어 팝업 헷갈려요 🧐 (`1:5243`)
The disambiguation cheat-sheet — the most directly actionable slide on the page.

> "**대부분의 팝업(디폴트)** → **슬라이딩 팝업**
> 할 말이 많다, 동의 버튼이 있다, 테이블이 있다, 선택 옵션이 있다."

> "**일부 짧은 안내 팝업** → **레이어 팝업**
> 고객이 일아야할 **딱 1~2문장 핵심**만 말하고 싶다."

(Typo in the guide's own copy: "일아야할" — reads as 알아야 할.)

레이어 팝업's two legitimate jobs, per this slide's own sub-headings:
- **이동/행동에 대한 안내** — "현금 전환이 완료되었습니다." (확인) / "소수점 거래 신청 화면으로 이동 하시겠습니까?" (취소 | 확인)
- **Warning / 하려던 행동이 안됐을 때 /** — "최대 5개 계좌까지 등록 가능합니다." (확인) / "현금 전환이 처리되지 않았습니다." + "[사용가능포인트] 항목을 확인하세요" (확인) / "해당 노는 돈 계좌를 이체하시려면 오픈뱅킹 등록이 필요합니다." (닫기 | 오픈뱅킹등록)

**Decision heuristic**: default to 슬라이딩. Reach for 레이어 only when the whole payload is 1~2 sentences AND there are no options/tables/agree-buttons.

## 03. 스크린 / 풀팝업 구분

### Definitions (`1:4398`)
> "**스크린**
> - 기본적인 메뉴 단위 화면
> - 메뉴 단위 간 유기적인 이동을 허용합니다
> - 퀵메뉴가 보입니다"

> "**풀팝업**
> - 하나의 핵심 프로세스를 위해 독립적, 폐쇄적으로 구성된 화면
> - 스크린 위에 호출 가능합니다
> - 퀵메뉴가 보이지 않습니다
> - 풀팝업에서 스크린으로의 이동을 지양합니다
>
> ex) 투자 하이라이트, 유의사항, 계좌개설, 서비스 신청 등에 사용"

Diagrammed: 스크린 ⇄ 스크린 (bidirectional, both with the bottom quick-menu bar); 스크린 → 풀팝업 → 풀팝업 (one-way, no quick menu).

> **The quick menu is the visual tell**: 퀵메뉴 visible = 스크린; 퀵메뉴 hidden = 풀팝업. This **refines the Core reference's `quickmenu_basic` note** ("Appears on **every** real screen in the app... unless that screen has its own sticky primary CTA"). Per this guide, there is a **second** exclusion: **풀팝업 screens never show `quickmenu_basic`**, regardless of whether they have a CTA. Worth promoting.

### Header icon semantics (`1:4422`)
Annotated header patterns:
- **스크린**: `< 서비스 명 ⌄` (history back + dropdown) or `< 서비스 명` (history back only)
- **풀팝업**: `서비스 명 ✕` (close only, right side) or `< 서비스 명 ✕` (back left + close right)

> "**history back** : 이전 화면으로 이동"
> "**dropdown** : 동일한 그룹의 메뉴로 이동"
> "**close** : 풀팝업 닫음 (팝업을 호출한 스크린 화면으로 이동)"

**Cross-reference to Core reference**: these four header layouts map onto the `nds_icon_header` variants already recorded there (key `19619c9f1fd2e3c2e6515542d0484e651f3f30c6` — `back`, `close` both confirmed present), and the 스크린 `< 서비스 명 ⌄` dropdown pattern matches the `header_basic` "title-as-dropdown variant" noted in the Core reference's gotcha #1. Consistent; nothing contradicts.

### 풀팝업 Do/Don't — close vs back (`1:4445`)
> **Don't** — "풀팝업 종료는 좌상단 뒤로가기가 아닌 우상단 닫기 버튼을 사용합니다." (토픽 리스트 with a `<` at top-left)
> **Do** — same screen with an `✕` at top-right
> **Don't** — 뉴스상세 (a drilled-in second level) with only `<`
> **Do** — "풀팝업에서 한 단계 진입한 이후 뒤로가기와 닫기를 함께 제공합니다." (뉴스상세 with **both** `<` and `✕`)

**Two-level rule**: 풀팝업 entry level → `✕` only. One level deeper → `<` **and** `✕` together.

### 풀팝업 Do/Don't — bottom buttons (`1:4480`)
> **Don't** — "풀팝업 하단에 '닫기' 또는 '확인' 버튼으로 이탈을 유도하지 않습니다." (월스트리트 브리핑 with a green 닫기 bar)
> **Do** — same screen, no bottom button (content runs to the bottom)
> **Don't** — 이체 한도 수정 완료 screen with **no** bottom button
> **Do** — "완료 팝업시에는 예외적으로 하단 버튼을 허용합니다.
> 완료 팝업의 자세한 규칙은 **NDS_Templates → Sample Page → 완료** 참고" (same screen **with** a green 확인)

Note the polarity **inverts** between the two pairs on this slide: a bottom button is a Don't for a content 풀팝업 but a Do for a **완료 (completion)** 풀팝업. Read the caption, not the layout.

## 04. 팝업 하단 버튼 (Popup bottom buttons)

### Wording (`1:5354`)
> **Don't** — "레이어 팝업에서 버튼을 한 개만 사용하는 경우 **'닫기'** 대신 **'확인'**을 사용합니다." (알림 dialog with 닫기)
> **Not Bad** — "버튼을 두 개만 사용하는 경우, 모호한 표현을 지양합니다. **'확인' → '이동'**" (소수점 거래 신청 화면으로 이동 하시겠습니까? with 취소 | 확인)
> **Do** — "다음 행동에 대한 명확한 안내를 합니다." (소수점 거래를 할 수 있는 계좌가 없어요! with 닫기 | 서비스 신청)

**Single-button dialog → 확인, never 닫기.** Two-button → label the confirm button with the **actual next action** (서비스 신청 / 이동 / 오픈뱅킹 등록), not a generic 확인.

### Two-choice prohibition + sizing (`1:5385`)
> **Don't** — "사용자에게 두 가지 선택지를 제공하는 것은 지양합니다." (OOOO 서비스를 해지하시겠어요? with **해지하기 | 유지하기** — both buttons are actions)
> **Do** — same dialog with **취소 | 해지하기**
> **Don't** — 매수 주문이 접수되었습니다. with **주문 취소 | 주문 내역** (two forward actions)
> **Do** — "좌측 버튼은 팝업을 닫기 위한 명확한 **'닫기'**, **'취소'**만 허용합니다." (same, with **닫기 | 주문 내역**)

> **Do** — "슬라이딩팝업 및 풀팝업에서 버튼의 사이즈는 상황에 따라 **1:1 혹은 1:2** 중에서 선택할 수 있습니다.
> **(레이어팝업은 1:1 고정)**" (조회설정: 취소 | 조회 shown 1:2; 복수 선택일 때 사용: 취소 | 확인)

**The left button is a dismiss, always.** In a two-button popup the left slot is reserved for **닫기** or **취소** — never a second action. This is a structural rule, not a wording preference: it makes the left slot semantically fixed across the whole app.

## Component keys / variants observed

The deck is drawn with flat illustrative mockups, **not** live NDS_Library instances — no componentKeys are cited anywhere on this canvas. Cross-referencing the `../CORE.md`:

- The guide twice points at **NDS_Templates** for the real artifacts: "Figma → NDS_Templates → Popup 참고" (`1:4228`) and "NDS_Templates → Sample Page → 완료 참고" (`1:4480`). The Core reference already records NDS_Templates' libraryKey (`lk-6485b4ef...`) but describes its contents only as "Full page templates (e.g. product order flows)" — **this guide establishes that NDS_Templates also contains the canonical Popup set and a Sample Page → 완료 spec.** Worth promoting.
- **`popup_radio_account`** (key `bca81c36fdb886105179354ec7c1a6b150c0d0e8`, Core reference) matches this guide's 계좌 선택 / 출금 계좌 선택 examples (`1:4568`, `1:4634`) — which are exactly the 원칙 2 Exception case (header `X`, no bottom buttons, immediate apply). The Core reference's existing warning — "Do not shrink below ~330px width; use full-width, stacked vertically" — is consistent with this guide's fixed-width philosophy; nothing contradicts.
- **`btn_bottom_page_assets`** / **`btn_bottom_page_assets_gray`** (Core reference) already document `Type=1-btn` / `1:2-btn` / `2-btn`. **This guide supplies the missing usage rule for those variants**: 1:1 or 1:2 in 슬라이딩/풀팝업, **1:1 fixed in 레이어팝업**, gray always on the left as the dismiss. Worth promoting.

## How this feeds BUILD mode

When generating or reviewing NH MTS screens (via `csdesign` → `nds/LEADER.md` Mode 2):

**Pick the type first** (in this order):
1. Is it one self-contained core process (계좌개설, 서비스 신청, 유의사항, 투자 하이라이트)? → **풀팝업**. Hide `quickmenu_basic`. No bottom exit button.
2. Is the whole payload 1~2 sentences, with no options, no table, no agree-button? → **레이어 팝업**.
3. Everything else → **슬라이딩 팝업** (the default). If it would need to scroll, escalate to **풀팝업** instead.

**슬라이딩 팝업:**
- Header **mandatory**, **max 1 line**, **noun phrase not a sentence** ("조회설정" ✓ / "조회기간을 설정해주세요" ✗).
- **No controls in the header** — an `X` is legal only if there are no bottom buttons and selection applies immediately (계좌 선택 pattern). Anything else needs 디자인팀 컴펌.
- Never alter corner radius or other built-in styling — instance from **NDS_Templates → Popup**, don't hand-build.
- Bottom buttons: 1:1 or 1:2.

**레이어 팝업:**
- **Width 492px fixed** at a 540px canvas (≈24px side margins). Never resize.
- **No header, ever.**
- Title ≤ 2 lines; description ≤ 2 lines.
- Two buttons → **1:1 fixed** (never 1:2).
- One button → label it **확인**, never 닫기.
- The moment it needs an option control or a table → switch to 슬라이딩 팝업.

**풀팝업:**
- **No `quickmenu_basic`** (this is the tell that distinguishes it from a 스크린).
- Entry level: `✕` at top-right only. One level deeper: `<` at left **and** `✕` at right.
- **No bottom 닫기/확인 button** — the sole exception is a **완료 (completion)** popup, per NDS_Templates → Sample Page → 완료.
- Avoid navigating out to a 스크린 from inside a 풀팝업.

**Bottom buttons (all popup types):**
- In a two-button popup the **left slot is always a dismiss** — only **닫기** or **취소**. Never two competing actions (해지하기 | 유지하기 ✗ → 취소 | 해지하기 ✓).
- Label the right/confirm button with the **real next action** (서비스 신청, 이동, 주문 내역, 오픈뱅킹 등록), not a generic 확인.
- Use `btn_bottom_page_assets` (green, right) + `btn_bottom_page_assets_gray` (gray, left) per the Core reference.

**Header icon semantics (스크린 vs 풀팝업):** `<` = history back (previous screen) · `⌄` = dropdown (sibling menu in the same group) · `✕` = close the 풀팝업 (return to the calling 스크린). Don't mix: a `<` as the primary exit on a 풀팝업 entry screen is an explicit Don't.
