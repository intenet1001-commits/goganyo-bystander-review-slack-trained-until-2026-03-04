---
name: nds-ux-guide-date-picker
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=2214-6290"
learned_date: 2026-07-15
sections_studied:
  - "2922:27924 (frame '1' — cover + INDEX. Title '날짜/기간 설정'. Lists 5 sections: 01 날짜 컨트롤러, 02 년/월/일 설정 팝업, 03 년/월 설정 팝업, 04 주기 설정 팝업, 05 시간 설정 팝업. 'Last update 25.10.16'.)"
  - "3539:1322 (frame '2' → on-canvas '01 날짜 컨트롤러' — the 3 base rules: underline = selectable, alignment, what tapping opens)"
  - "3539:1566 (frame '3' → on-canvas '01 날짜 컨트롤러', 선택 가능할때 case 1 — '데이트 피커 팝업 호출 예시' (안드로이드))"
  - "3539:2063 (frame '4' → on-canvas '01 날짜 컨트롤러', 선택 가능할때 case 2 — '조회설정 팝업 호출 예시'; 4-step flow; cross-ref note '설정팝업 관련 자세한 내용은 7pg')"
  - "3539:3027 (frame '5.' → on-canvas '01 날짜 컨트롤러' — the not-selectable rules: no underline, prev/next only, 일자/월/년도 all valid)"
  - "3539:3346 (frame '6' → on-canvas '01 날짜 컨트롤러' — only the lower data region updates on date change)"
  - "3539:3658 (frame '13' → on-canvas '01 날짜 컨트롤러 - 선택이 불가능할때' — 4 real-screen examples of alignment/period display. NOTE: layer name '13' collides with 3885:57100, also named '13')"
  - "2924:29704 (frame '7' → on-canvas '02 년/월/일 설정' — 조회기간 button options drive the YYYY.MM.DD fields)"
  - "2902:29531 (frame '8' → on-canvas '02 년/월/일 설정', case 01 AOS 캘린더)"
  - "2902:29027 (frame '9' → on-canvas '02 년/월/일 설정', case 02 iOS 캘린더)"
  - "2908:31053 (frame '10' → on-canvas '03 년/월 설정' — 휠박스 팝업)"
  - "2922:20945 (frame '11' → on-canvas '04 주기 설정', case 01 요일로 설정)"
  - "2922:21560 (frame '12' → on-canvas '04 주기 설정', case 02 일자로 설정)"
  - "3885:57100 (frame '13' → on-canvas '05 시간 설정' — 휠박스 시/분 picker. Second frame named '13'.)"
  - "4402:2216 / 4402:2320 (frames '표기규칙' / '표기규칙 02' — HIDDEN (hidden=\"true\"); render blank. Text-node names suggest label-notation rules; see 'Unverified' section below.)"
  - "2922:27943 (Update_History_01 — version history; includes a '📌 v0.2 가이드 발행' marker)"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as design-rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — 데이트피커 / 날짜·기간 설정 (Date Picker)

Part of the NDS_UX Guide file's "Date Picker 데이트피커" canvas. The cover titles it **날짜/기간 설정** — broader than "date picker": it covers the inline date *controller*, the 조회설정 (query-settings) popup, OS calendar popups, and wheel-box pickers for 년/월, 주기 (recurrence), and 시간. Corner tag: "NHI Design Principle". Last update **25.10.16** — the most recently maintained of the guides learned so far.

This is a **rules document**, not a product screen.

**Frame-numbering gotcha confirmed again**, and it's worse on this page than on the others:
- Layer "2" → on-canvas "01"; layers "3", "4", "5.", "6" and "13" (3539:3658) are **all** still on-canvas section "01".
- Layers "7", "8", "9" → on-canvas "02". Layer "10" → "03". Layers "11", "12" → "04". Layer "13" (3885:57100) → "05".
- **Two different frames are both named "13"** (`3539:3658` = on-canvas 01, `3885:57100` = on-canvas 05). Node ID is the only reliable handle here.
- Layer "5." carries a trailing period; layer "5" does not exist.

Always read the visible heading; never trust the layer name.

## 01. 날짜 컨트롤러 (Date controller)

The inline `‹ 2024.10.13 ›` control. Three base rules (frame 3539:1322), verbatim:

> "1. **선택 가능한 날짜컨트롤** 은 날짜 하단에 밑줄 추가"

> "2. 단독으로 쓸 때 **중앙 정렬**, 필터와 동시에 쓸때 **좌측 정렬** 권장, 이동 불가시 화살표 Disable 처리"

> "3. 선택시 **데이트 피커 팝업** or **조회설정 팝업** 호출"

**The underline is the affordance.** It is the single signal that the date itself is tappable (as opposed to only the ‹ › arrows being usable). Rule 3's examples show the two things a tap can open: a date-picker calendar strip, or a 조회설정 popup with `1주 / 1개월 / 3개월 / 기간설정` buttons.

### 선택 불가능한 경우 (Not selectable — frame 3539:3027)

> "1. **선택 불가능한 날짜컨트롤** 은 날짜 하단에 밑줄 삭제"

> "2. 선택 불가능한 경우 **날짜 전후 이동** 만 가능"
> (caption: "더 이상 이동할 수 없을시 화살표 색 변경")

> "3. **일자, 월, 년도** 사용 가능"

The 일자/월/년도 examples show all three granularities in the same control shape: `‹ 2024.10.13 ›` or `‹ 11월 ›` or `‹ 2024년 ›`. So the controller is granularity-agnostic; only the label format changes.

### Real-screen rules (frame 3539:3658 — "01 날짜 컨트롤러 - 선택이 불가능할때")

Four annotated production screenshots, each with a verbatim caption:

> "• 디폴트: 가운데 정렬
> • 날짜 컨트롤러 선택 시,
>  - 년/월/일 설정 팝업  또는
>  - 년/월 설정 팝업  또는
>  - OS 캘린더 팝업 활성화"

> "밑줄 없는 경우 날짜 전후 이동만 가능"

> "우측에 필터 있는 경우: 왼쪽 정렬"

> "기간 설정한 경우 기간 노출"

The last one is important and easy to miss: once a range is set, the controller stops showing a single date and **shows the range instead** — the screenshot renders `2023.12.01 ~ 2024.09.30` (still underlined) in place of `2024.09`.

Note this frame's heading says "선택이 불가능할때" but its first bullet describes what happens **on selection** (년/월/일 팝업 등 활성화) — i.e. the selectable case. The heading appears to be mislabeled relative to its own content; the four examples cover both selectable and non-selectable states.

### 데이터 변경 범위 (frame 3539:3346)
> "하단 데이터만 해당 조회일에 맞춰 수정됨"

Illustrated on the AI 시황 screen: moving the date changes only the content *below* the controller — the header, tabs and the 속보 banner above it stay put. This is the concrete basis for the account-controller guide's related exception ("계좌변경으로 화면전체의 정보를 바꾸지 않는 경우").

### 조회설정 팝업 호출 예시 (frame 3539:2063, "선택 가능할때 case 2")

A 4-step flow (badges 1, 2, 3, 5 — **badge 4 is skipped on-canvas**), captions verbatim:

> "1주 / 1개월 / 3개월 옵션은 날짜 선택 비활성화"

> "기간설정 선택 시 날짜 선택 활성화됨
> 이전 선택한 버튼의 데이터를 유지
> ex) 1주 → 기간설정 선택 시"

> "기간 설정한 경우 기간 노출"

Cross-reference note at bottom-right, verbatim: *"설정팝업 관련 자세한 내용은 7pg"* — pointing at what is on-canvas section 02 (frame `2924:29704`). Note "7pg" is a **layer-name/page-number reference, not the on-canvas section number** — another instance of the numbering confusion; the target is the frame *named* "7".

## 02. 년/월/일 설정 (Y/M/D popup)

### The 조회기간 button row (frame 2924:29704)
Heading caption, verbatim:
> "기간 버튼 옵션에 따라 YYYY.MM.DD 데이터가 변경되는 구조"

Same two captions as above, verbatim:
> "1주 / 1개월 / 3개월 옵션은 날짜 선택 비활성화"

> "기간설정 선택 시 날짜 선택 활성화됨 / 이전 선택한 버튼의 데이터를 유지 / ex) 1주 → 기간설정 선택 시"

The four mockups show a `조회설정` bottom sheet: label `조회기간`, a 4-button row `1주 | 1개월 | 3개월 | 기간설정`, and a `2025.06.22 ~ 2025.06.28` date-field pair. With 1주/1개월/3개월 selected, the date fields are **grayed with red-underlined values** (auto-computed, not editable); with 기간설정 selected they turn **black and editable**. Bottom CTA row: gray `취소` + green `조회`.

Critically: **the preset buttons still populate the date fields** (1주 → `06.22~06.28`, 1개월 → `06.22~07.22`, 3개월 → `06.22~09.22`), and switching to 기간설정 **keeps** whatever the last preset produced. Don't reset the fields on switch.

### case 01 — AOS 캘린더 (frame 2902:29531)
> "1 • YYYY.MM.DD 선택 시"
> "2 • Android OS 제공되는 캘린더 센터 팝업 활성화"
> "• 날짜 선택 후 '확인' 버튼을 눌러 설정"

A **center popup** (not a bottom sheet), OS-native, with the Android blue header (`2024년 / 12월 11일 (수)`), selected day as a filled blue circle, and `취소 | 확인` text buttons.

### case 02 — iOS 캘린더 (frame 2902:29027)
> "1 • YYYY.MM.DD 선택 시"
> "2 • 캘린더 바텀 슬라이딩 팝업 활성화 (iOS 라이브러리 활용하여 구현)"
> "3 • 날짜 선택 시, Press 효과 변경됨"
> "• 날짜 선택 후 '선택' 버튼 눌러 설정"

A **bottom sliding popup**, iOS-library-based, with `취소 | 선택` (green) buttons. Two selection states are shown side by side with captions:
> "선택값 : 오늘"  → the day renders as a **filled black circle**
> "선택값 : 오늘 이외" → the day renders as a **filled gray circle**

**So the platforms genuinely diverge here**: AOS = center popup + `확인`; iOS = bottom sheet + `선택`. The button *label* differs too, not just the position. Don't unify them.

## 03. 년/월 설정 — 휠박스 팝업 (frame 2908:31053)

> "1 • YYYY.MM 선택 시"
> "2 • 휠박스 바텀 슬라이딩 팝업 활성화 (AOS는 커스텀, iOS는 라이브러리 활용하여 구현)"
> "• 휠 제스쳐를 통해 년/월 선택"
> "• '선택' 버튼을 눌러 설정"

Popup title: `기간 선택`. Two wheels (년 / 월), selected row highlighted with a gray band and bold text, neighbours faded. `취소 | 선택` (green) footer.

Note the implementation split is **inverted vs the Y/M/D calendar**: here AOS is the custom build and iOS uses a library; for Y/M/D, AOS uses the OS-provided calendar. Don't assume "AOS = native" as a general rule.

## 04. 주기 설정 (Recurrence popup)

Popup title: `주기 설정`, with a two-tab segmented control `매주 | 매월`.

### case 01 — 요일로 설정 (frame 2922:20945)
> "1 • 셀렉트박스 선택 시"
> "2 • 주기 설정 바텀 슬라이딩 팝업 활성화"
> "• 매주 탭 활성화"
> "• 요일 선택 시 팝업 닫히고 선택한 값으로 설정됨"

List: `월요일 / 화요일 / 수요일 / 목요일 / 금요일 / 토요일 / 일요일`, selected row bold with a light-green background. Trigger field reads `매주 목요일`.

### case 02 — 일자로 설정 (frame 2922:21560)
> "1 • 셀렉트박스 선택 시"
> "• 매월 탭 활성화"
> "• 날짜 선택 시 팝업 닫히고 선택한 값으로 설정됨"

List: `26일 / 27일 / 28일 / 29일 / 30일 / **마지막 일**`. Trigger field reads `매월 29일`.

**`마지막 일` ("last day") is a real, named option** — the guide's answer to the 29/30/31 month-length problem. Use it; don't offer `31일`.

**Both cases: no confirm button.** The popup closes on selection ("선택 시 팝업 닫히고"), unlike every other picker on this page. This is a deliberate divergence — the 주기 설정 popup has no `취소 | 선택` footer at all in either mockup.

## 05. 시간 설정 (frame 3885:57100)

> "1 • HH:MM 선택 시"
> "2 • 휠박스 바텀 슬라이딩 팝업 활성화 (AOS는 커스텀, iOS는 시스템 Picker 호출)"
> "• 휠 제스쳐를 통해 시/분 선택
>  - 휠은 24시간 기준 세팅)
>  - 00-23 : 00-59  (10분 간격 기본)"
> "• '선택' 버튼을 눌러 설정"

Popup title: `시간 선택`. Two wheels (시 / 분), selected row banded. `취소 | 선택` (green) footer. The example screen is `방해금지 시간 설정` with fields `22:00 ~ 07:00` and a note `※ 설정한 시간엔 알림이 울리지 않고, 종료시간에 한 번에 받아요`.

Concrete specs to honor: **24-hour clock** (00–23, never AM/PM), minutes **00–59** but stepped at **10-minute intervals by default**.

Note the AOS/iOS split differs *again*: here iOS calls the **system Picker** (not a library), AOS is custom. Three sections, three different platform-implementation splits — treat each picker's split as its own fact.

## Component/instance names observed

Instance names on this canvas (not verified componentKeys): `Table_header`, `Table_cell` (in the 참고 table on the Nudge page, not here), `statusbar`, `Topbar_Dropdown`, `quickmenu_basic`, `nds_icon_header`. The date controller itself and the 조회설정/휠박스 popups appear to be **drawn as local frames on this canvas rather than instanced from a library** — no library component name was found for them. Worth confirming before a BUILD pass assumes a `datepicker_*` component exists.

## Unverified: two hidden frames

`4402:2216` ("표기규칙") and `4402:2320` ("표기규칙 02") are marked `hidden="true"` in the metadata and **render as a blank 1×1 image** via `get_screenshot` — their content could not be visually confirmed. Their text-node *names* suggest they carry label-notation rules (e.g. a node named "타이틀을 임의로 변경하지 않습니다. - 기간설정(X), 조회기간(X)" and one named "조회기간 버튼 레이블 표기 규칙을 따릅니다. - 오늘(당일X), 1주, 이번주, 이번달, 1개월, 3개월, 6개월, 1년, 올해 기간설정(직접설정X)").

**These are NOT quoted as guide rules above**, for two reasons: (1) per this file's known gotcha, text-node names frequently don't match displayed copy; (2) the frames are hidden, which usually means deprecated or work-in-progress. If the 조회설정 popup's exact button labels matter for a BUILD pass, **unhide these frames in Figma and re-verify** rather than trusting the node names — the strings above are plausible and specific enough to be worth chasing, but they are unconfirmed.

## How this feeds BUILD mode

When generating or reviewing an NH MTS screen with a date/period/time control (via `csdesign` → `nds/LEADER.md` Mode 2):

1. **Underline = tappable.** Selectable date controller → underline the date. Not selectable → **no underline**, and only the ‹ › arrows work. Never ship an underlined date that doesn't open a picker, or a tappable date without an underline.
2. **Alignment: centered by default; left-aligned when a filter sits to its right.** Disable (recolor) an arrow when it can't move further.
3. **Any granularity is legal** in the same control shape: `2024.10.13`, `11월`, `2024년`. Match the label to the data.
4. **Once a range is set, show the range** in the controller (`2023.12.01 ~ 2024.09.30`), not a single date.
5. **Only the region below the controller re-renders** on date change — keep header/tabs/banners static.
6. **조회설정 popup**: `1주 | 1개월 | 3개월 | 기간설정` row. Presets auto-fill and **disable** the date fields; 기간설정 enables them and **preserves the preset's values** — never blank them on switch. Footer: `취소` (gray) + `조회` (green).
7. **Respect the per-picker platform split — it is different every time:**
   - Y/M/D calendar: **AOS = OS-provided center popup, `확인`** / **iOS = bottom sheet via iOS library, `선택`**.
   - Y/M wheel: **AOS = custom**, **iOS = library**. Bottom sheet, `선택`.
   - Time wheel: **AOS = custom**, **iOS = system Picker**. Bottom sheet, `선택`.
8. **Time picker: 24-hour, 00–23 : 00–59, 10-minute steps by default.** No AM/PM.
9. **주기 설정 has no confirm button** — it commits and closes on tap, unlike every other picker here. Tabs `매주 | 매월`; the 매월 list ends with **`마지막 일`**, not `31일`.
10. **Don't invent 조회설정 button labels or the popup title.** The hidden 표기규칙 frames appear to constrain both, but are unverified — check them before deviating from the labels actually shown on-canvas (`조회설정` title; `1주 / 1개월 / 3개월 / 기간설정`).
