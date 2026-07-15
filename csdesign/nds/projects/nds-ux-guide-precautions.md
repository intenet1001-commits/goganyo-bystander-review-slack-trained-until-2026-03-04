---
name: nds-ux-guide-precautions
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=0-1"
learned_date: 2026-07-15
sections_studied:
  - "55:2810 (frame 'contents01' → on-canvas '01 유의사항 케이스 정의' — the Case 01 vs Case 02 top-level split)"
  - "8:2878 (frame 'index' → on-canvas '02 Case별 상세 정의' — Case 01 variants 일반/심사필/버튼 추가 + the 4 numbered content rules)"
  - "8:2916 (frame 'index' → on-canvas '02 Case별 상세 정의' — Case 01 Do/Don't pair: styling + background color)"
  - "8:2954 (frame 'index' → on-canvas '02 Case별 상세 정의' — Case 01 Do/Don't pair: '더보기' vs bare arrow)"
  - "8:2992 (frame 'index' → on-canvas '02 Case별 상세 정의' — Case 02 variants 유의사항만/한줄/두줄 + the 3 numbered content rules)"
  - "74:3318 (frame 'index' → on-canvas '02 Case별 상세 정의' — Case 02 Do/Don't set: 4 Don'ts + 2 Dos)"
  - "74:3573 (frame 'index' → on-canvas '03 유의사항 팝업' — Case 03 슬라이딩 팝업 vs 풀 팝업 + the 2 numbered rules)"
  - "74:3739 (frame 'index' → on-canvas '03 유의사항 팝업' — popup Do/Don't pairs)"
  - "34:2798 (instance 'index01' — cover/index instance at page origin)"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as design-rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — 유의사항 (Precautions / Disclaimers)

Part of the NDS_UX Guide file's "유의사항" canvas (page group "Patterns"). The design team's rulebook for how regulatory/disclaimer text is surfaced on MTS screens — the persistent bar, the floating bar, and the popup.

**Directly related to the Core reference component `유의사항_하단노출`** (key `6ab304902264c6101f4a0a62927f79d08c1d5827`, variant axes `Type(1줄/2줄)` + `더보기(on/off)`). This guide is the *why* behind that component's variant axes: `Type=1줄/2줄` is the guide's **Case 02_한줄 / Case 02_두줄**, and `더보기=on/off` is the arrow-affordance rule below. See "Component keys worth promoting" at the bottom.

**Frame-numbering gotcha — worst instance seen in this file so far**: every single content frame on this page is literally named **`index`** (plus one named `contents01`), regardless of what it shows. The layer names carry *zero* information: `55:2810` ("contents01") is on-canvas "01", while seven distinct frames all named "index" span on-canvas sections "02" and "03". Screenshot every frame; the layer name here is worse than useless.

## 01. 유의사항 케이스 정의 (Case definition)

Two top-level cases, defined verbatim on canvas:

| Case | Verbatim definition | Anatomy |
|---|---|---|
| **Case 01** | *"스크롤 맨 하단에 위치한 유의사항 항목"* | A titled block ("유의사항" + bulleted `・` lines) that lives at the very bottom of the scrolling content — it scrolls away with the page |
| **Case 02** | *"하단 버튼 위에 고정되어있는 플로팅 유의사항"* | A single-line ⓘ bar pinned directly above the bottom CTA — always visible. This is `유의사항_하단노출`. |

The Case 02 sample bar on canvas reads: "ⓘ 한 줄만 사용합니다. 우측에 '더보기' X, 화살표 O" — i.e. the guide states the rule inside the sample copy itself.

## 02. Case별 상세 정의 — Case 01

Three variants, labeled verbatim: **Case 01_일반**, **Case 01_심사필**, **Case 01_버튼 추가**.
- **일반**: title + `・` bullets only.
- **심사필**: adds a bolded 심사필 line as the **first** bullet, plus a `>` arrow on the title row (popup entry). Shows 2-depth nesting via `-`.
- **버튼 추가**: same as 심사필 plus a small secondary button (e.g. "해지하기", component `Basic_btn`) beneath the bullets.

### The four content rules (verbatim, numbered on canvas)
> 1. **배경색은 따로 두지 않고** 해당 화면의 배경색을 따릅니다.
> 2. 유의사항의 내용은 세 단락(・)을 넘지 않습니다.
>    - 내용의 길이가 네 단락 이상이면 팝업을 활용합니다.
> 3. 단락 구분은 1depth 가운데 점(・), 2depth 하이픈(-)을 활용합니다.
> 4. 문장의 강조는 **본문 강조 폰트(블랙, 레드)**을 사용합니다.

(Bold in rules 1 and 4 is the guide's own emphasis.)

### Case 01 Do / Don't
Illustrated on real 펌뱅킹(구.채우기) / 해외송금 screens:
- **Don't** — *"임의로 다른 스타일을 적용하지 않습니다."* (the bad example colors the "유의사항" title green and re-styles bullets)
- **Don't** — *"유의사항만 별도로 배경 색상을 지정하지 않습니다."* (the bad example gives the block its own grey card background — violates rule 1)
- **Do** — the disclaimer block inherits the screen background, plain title, standard bullets.
- **Don't** — *"유의사항 팝업 호출이 필요하더라도 화살표 옆에'더보기' 를 쓰지 않습니다."*
- **Do** — *"'더보기' 없이 화살표( > )만 사용합니다."*

## 02. Case별 상세 정의 — Case 02

Three variants, labeled verbatim: **Case 02_유의사항만**, **Case 02_한줄**, **Case 02_두줄**.
- **유의사항만**: bar reads only "ⓘ 유의사항" + `>`.
- **한줄**: one line of emphasis copy + `>`.
- **두줄**: two lines + `>`. The 두줄 sample carries an inline spec: *"할 말이 많을 경우 최대 두 줄로 제한합니다. 텍스트박스 가로길이 최대 428px"*.

### The three content rules (verbatim, numbered on canvas)
> 1. **최소한의 정보만 강조하고 싶을 때 사용합니다.**
> 2. 강조내용이 없이 더보기로 넘어갈 땐 '유의사항'만 사용합니다
>    - 확인해주세요(X), 여기보세요(X) 등의 구어체를 사용하지 않습니다.
> 3. 최대 두 문장까지 사용합니다.

### Case 02 Do / Don't
- **Don't** — *"유의사항이 한 문장일 경우 Case 01을 사용하지 않습니다"* / **Do** — *"Case 02를 사용합니다."*
  (i.e. one-sentence disclaimer ⇒ floating bar, **not** the bottom block. This is the Case 01 vs Case 02 selection rule.)
- **Don't** — *"더보기 버튼을 임의로 변경하지 않습니다"* (bad example uses a `더보기 ⧉` external-link glyph) / **Do** — *"'더보기' 없이 화살표( > )만 사용합니다."*
- **Don't** — *"과도한 강조 표현을 사용하지 않습니다."* (bad example red-bolds most of the bar)
- **Don't** — *"3줄 이상일 경우 Case02를 사용하지 않습니다."* (bad example crams 3 lines into the floating bar)

**Note the pincer rule**: 1 sentence → must be Case 02; 3+ lines → must not be Case 02; 4+ 단락 → must be a popup (Case 03). Case 01 therefore owns roughly the 2–3 단락 middle band.

## 03. 유의사항 팝업 (Case 03)

Two popup forms, labeled verbatim: **Case 03_슬라이딩 팝업** and **Case 03_풀 팝업**.

### The two rules (verbatim, numbered on canvas)
> 1. 항목이 4개 이하 → 슬라이딩 팝업
>    항목이 5개 이상 → 풀 팝업
> 2. 심사필이 들어가는 경우 제일 상단에 위치합니다.

- **슬라이딩 팝업**: dim overlay + bottom sheet (`Popup_Sliding_basic_guide`), title "유의사항" + divider, `유의사항_Content_popup` bullets, green `btn_bottom_page` ("확인") at the bottom.
- **풀 팝업**: full-screen (`statusbar` + `Topbar_Fullpop`), title "유의사항" + `✕`, long bullet list. Supports a **소제목** — the canvas labels a mid-list heading node verbatim *"소제목으로 활용가능"*, so a full popup may be split into titled subsections.

Real 심사필 copy on canvas confirms rule 2 (first bullet): "NH투자증권 준법감시인 심사필 제2022-0585호(2022-03-28 ~ 2023-03-27)". Emphasis inside popup bullets follows the Case 01 rule 4 pattern (red/black bold on the risk clause, e.g. "자산가격 변동, 환율변동, 신용등급 하락 등에 따라 투자원금의 손실(0~100%)이 발생").

### Popup Do / Don't
- **Don't** — a fund-disclaimer popup dumping ~12 unstructured bullets with no subsections / **Do** — the same content organized with a 소제목 splitting it into two labeled groups.
- **Don't** — a popup where nearly every bullet is red/bold (over-emphasis, and the CTA is buried under the app shell) / **Do** — emphasis restricted to the single key risk clause, clean "확인" CTA.

## Component keys worth promoting to Core reference

Observed on this page (reported, not yet added to the Core reference — see the flag in the return summary):
- `유의사항_하단노출` — **already in Core reference**; this guide confirms and explains its variant axes: `Type=1줄/2줄` ↔ Case 02_한줄/두줄, `더보기=on/off` ↔ the arrow-only rule. Confirms it sits above `btn_bottom_page`. Case 02_유의사항만 (bar text = literally "유의사항") appears to be `더보기=on` with minimal text rather than a separate variant.
- `유의사항_Title`, `유의사항_Content`, `유의사항_Content_popup` — the Case 01 / Case 03 building blocks (nested instances; content overridden per screen). Keys not resolved in this pass.
- `Popup_Sliding_basic_guide`, `Topbar_Fullpop`, `btn_popup_botton`, `btn_bottom_page`, `Basic_btn` — popup chrome. Keys not resolved in this pass.

## How this feeds BUILD mode

When generating or reviewing an NH MTS screen with a disclaimer:

1. **Pick the case by length, mechanically:**
   - 1 sentence / minimal emphasis → **Case 02** floating bar (`유의사항_하단노출`, `Type=1줄`). Never Case 01.
   - 2 lines → Case 02 `Type=2줄`, text box ≤ **428px** wide.
   - 2–3 단락 → **Case 01** block at the bottom of the scroll.
   - 4+ 단락 / 5+ 항목 → **Case 03 popup**. 4 이하 항목 → 슬라이딩 팝업; 5 이상 → 풀 팝업.
   - 3+ lines in a floating bar → wrong, escalate to Case 01 or a popup.
2. **Never give the disclaimer its own background color.** It inherits the screen's background. A grey/tinted disclaimer card is an explicit Don't.
3. **The "more" affordance is a bare `>` chevron.** Never "더보기 >", never a `⧉` external-link glyph. (Use `nds_icon_arrow Type=right`.)
4. **Bullet syntax is fixed**: 1depth = `・`, 2depth = `-`. Don't substitute `•`, `*`, or numbers.
5. **Emphasis is rationed** — only the key risk clause gets 본문 강조 폰트 (black or red bold). Red-bolding the whole block is an explicit Don't.
6. **No 구어체 in the bar** — "확인해주세요", "여기보세요" are explicitly banned. Bare "유의사항" is the correct minimal label.
7. **심사필 line always goes first** in a popup, and appears as the first bullet in Case 01_심사필.
8. **Long popups get 소제목 subsections** rather than one flat bullet dump.
9. Layout order at the bottom of a screen: content → `유의사항_하단노출` → `btn_bottom_page` (CTA) → (`quickmenu_basic` only if the screen has no sticky CTA, per the Core reference note). Build at **540px**.
