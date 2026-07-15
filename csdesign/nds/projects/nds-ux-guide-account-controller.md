---
name: nds-ux-guide-account-controller
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=165-4356"
learned_date: 2026-07-15
sections_studied:
  - "165:4673 (frame '1' — cover + INDEX. Lists 3 top-level sections: 01 계좌 컨트롤러 정의, 02 계좌 컨트롤러 가이드, 03 계좌 선택창 가이드. Corner tag 'NDS', 'Last update 22.11.22')"
  - "165:4684 (frame '2' → on-canvas '01 계좌 컨트롤러 정의' — defines 계좌 컨트롤러 and 계좌 선택창)"
  - "165:4694 (frame '3' → on-canvas '01 계좌 컨트롤러_유형' — the three types: 박스형/박스혼합형, 라인형, only 텍스트형)"
  - "165:4725 (frame '4' → on-canvas '01 계좌 컨트롤러_구성' — anatomy diagram: 박스/라인, 드롭다운 아이콘, 텍스트 → 계좌번호/계좌정보/잔고표시)"
  - "165:4751 (frame '5' → on-canvas '01 계좌 컨트롤러_텍스트 구성' — 계좌정보 = 계좌유형 + (계좌명/별명); 3 user-configurable cases; 계좌정보표시 설정화면 + 사용예시)"
  - "165:4939 (frame '6' → on-canvas '02 계좌 컨트롤러 가이드_Do&Don't' — 원칙1: 계좌순서/표시 지정 sync. 1 Do + 2 Exception)"
  - "165:4828 (frame '7' → on-canvas '02 ..._Do&Don't' — 원칙 2: dropdown icon + 계좌번호 mandatory. 2 Do + 1 Don't)"
  - "165:4857 (frame '8' → on-canvas '02 ..._Do&Don't' — 원칙 3: 박스형 when mixed with buttons/inputs, 라인형 when showing balance. 2 Do + 1 Don't)"
  - "165:4881 (frame '9' → on-canvas '02 ..._Do&Don't' — 원칙 4: controller sits directly under header/tab. 1 Do + 1 Don't + 2 Exception)"
  - "165:4760 (frame '10' → on-canvas '02 계좌 컨트롤러 가이드_박스형을 사용하는 경우')"
  - "165:4778 (frame '11' → on-canvas '02 계좌 컨트롤러 가이드_라인형을 사용하는 경우')"
  - "165:4792 (frame '12' → on-canvas '02 계좌 컨트롤러 가이드_텍스트형을 사용하는 경우')"
  - "165:4802 (frame '13' → on-canvas '02 계좌 컨트롤러 가이드' — the box-vs-line decision summary slide)"
  - "165:4907 (frame '14' → on-canvas '03 계좌 선택창 가이드' — 드롭다운 vs 슬라이딩 팝업 decision)"
  - "165:4918 (frame '15' → on-canvas '03 계좌 선택창 가이드_Do&Don't' — controller text must equal selector text)"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as design-rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — 계좌 컨트롤러 (Account Controller)

Part of the NDS_UX Guide file's "Account Contoller 계좌 컨트롤러" canvas (**the page name carries the guide's own typo — "Contoller", not "Controller"**; keep that in mind when searching the file by name). This is the design team's internal rulebook for the account-selector control that appears at the top of virtually every NH MTS transactional screen, plus the account picker it opens.

This is a **rules document**, not a product screen: use it to validate/generate account-controller markup and placement, not as a layout or flow reference.

**Frame-numbering gotcha confirmed again** (same as `nds-ux-guide-color-contrast` and `nds-ux-guide-touch-area`): the internal Figma frame layer names ("1"–"15") do **not** line up with the on-canvas section numbers. Layer "2" is on-canvas section "01"; layers "3", "4", "5" are *all* still on-canvas section "01" (sub-slides `_유형`, `_구성`, `_텍스트 구성`); layers "6"–"13" are all on-canvas section "02"; layers "14"–"15" are on-canvas section "03". Always read the visible heading; never trust the layer name.

**Sequential-page note**: unlike the touch-area/color-contrast guides, the on-canvas section number here appears as a small `01`/`02`/`03` prefix on a per-slide title (e.g. "02 계좌 컨트롤러 가이드_박스형을 사용하는 경우"), so a single section number legitimately spans many slides. Don't treat "02" appearing 8 times as a duplication error.

## 01. 계좌 컨트롤러 정의 (Definitions)

Two terms are defined, and the guide keeps them distinct throughout — **계좌 컨트롤러** (the control) vs **계좌 선택창** (the picker it opens):

### 계좌 컨트롤러
> "사용자로 하여금 원하는 계좌번호 및 계좌정보를 선택, 또는 입력하게 하여 화면 내의 정보를 조회,변경 및 그에 따른 업무를 처리하는 UI"

> "이체, 매수매도 등의 화면에서 계좌를 선택할 수 있는 컨트롤러로, 기본적으로 박스 및 텍스트/라인을 사용하며, 화면의 성격에 따라 버튼이 혼합되기도 합니다."

### 계좌 선택창
> "계좌 컨트롤러를 선택할 시 나타나는 사용자의 계좌정보들이 나열된 화면"

> "계좌 컨트롤러 클릭시 나타나며 팝업/드롭다운의 형태로 나타납니다."

### 01_유형 (The three types)

> "크게 박스형(+박스혼합형), 라인형 및 텍스트만 사용한 유형이 존재합니다."

Three phone mockups labeled, left to right: **박스형/박스혼합형** (boxed field, optionally with adjacent buttons like 예수금 / 이체 / 거래 비밀번호), **라인형** (borderless rows separated by hairlines, balance shown in color), **only 텍스트형** (bare text + a small ▼, no box, no line).

### 01_구성 (Anatomy)

> "계좌 컨트롤러는 기본적으로 **박스/라인, 드롭다운 아이콘, 텍스트**로 구성되며, **아이콘과 텍스트는 필수요소**입니다."

> "텍스트는 **계좌번호, 계좌정보, 잔고표시**로 이루어지며, 대부분의 경우 **계좌번호는 필수값**입니다."

> "텍스트 배치는 화면의 성격에 따라 바뀔 수 있습니다."

Annotated diagram maps each label onto a real control: `박스/라인` (the container), `드롭다운 아이콘` (the ▼), `텍스트` → decomposed into `계좌번호` (e.g. `201-02-123456`), `계좌정보` (e.g. `[종합매매] 미국반도체주`), `잔고표시` (e.g. `출금 가능 금액  123,456원`).

### 01_텍스트 구성 (Text composition)

> "계좌정보는 **계좌유형 + (계좌명 / 별명)** 을 지칭합니다"

> "경우의 수는 **(계좌유형 + 계좌명) / 계좌별명 / (계좌유형 + 계좌별명)** 3가지가 존재하며, 사용자 설정에 따라 결정됩니다."

> "배치는 '**[계좌유형] + 계좌명 / 별명**' 으로 입력합니다"

The 계좌정보표시 설정화면 (screen `계좌순서/표시 지정` → tab `계좌명 표시 설정`) shows the three user-selectable radio options verbatim:
- `계좌번호 + 계좌 유형 + 계좌명` (selected in the example)
- `계좌번호 + 계좌 별명`
- `계좌번호 + 계좌 유형 + 계좌 별명`

Note the 계좌유형 renders in square brackets on-canvas (`[종합매매] 김나무`), matching the `[계좌유형]` notation in the rule.

## 02. 계좌 컨트롤러 가이드 (Do & Don't — four numbered 원칙)

### 원칙 1 — user display settings win, and sync everywhere
> "원칙1 ) 모든 계좌정보 표시 데이터는 '계좌순서/표시 지정' 사용자 선택정보를 우선하며, 이는 모든 계좌 컨트롤러 및 선택창에 동기화됩니다."

Two **Exception** callouts (green), verbatim:
> Exception: "텍스트형 컨트롤러의 경우 컨트롤러에 표시되는 정보를 생략 가능합니다."

> Exception: "박스형의 경우 평생우대, 라인형의 경우 잔고표시는 예외로 설정합니다"

### 원칙 2 — dropdown icon + account number are mandatory
> "원칙 2) 드롭다운 아이콘과 계좌번호는 필수로 들어가야 하며, 값이 없을 시 해당계좌가 존재하지 않음을 나타내야 합니다."

**Don't** (red), verbatim:
> "표시할 계좌가 없더라도 값을 비워두지 않습니다"

The paired Do screenshot shows the empty state rendered as a **disabled/grayed control carrying the literal text `선택할 수 있는 계좌가 없습니다.`** rather than a blank field — that's the concrete "indicate the account doesn't exist" treatment. The Don't screenshot shows a genuinely blank white box.

### 원칙 3 — type selection is driven by content, not taste
> "원칙 3) 버튼 및 입력칸과 혼합하여 사용하는 경우엔 박스형, 잔고를 표시해야 하는 경우에는 라인형을 사용합니다."

**Don't** (red), verbatim:
> "임의로 다른 유형끼리 혼합하여 사용하지 않습니다"

### 원칙 4 — position: directly under the header/tab
> "원칙 4) 계좌 컨트롤러는 원칙적으로 화면의 헤더 및 탭 바로 아래에 위치하며, 그 사이에 다른 컴포넌트가 존재해서는 안됩니다."

**Don't** (red), verbatim:
> "다른 컴포넌트가 컨트롤러와 헤더 및 탭 사이에 존재해선 안됩니다."

Two **Exception** callouts (green), verbatim:
> Exception: "계좌변경으로 화면전체의 정보를 바꾸지 않는 경우 및 계좌를 입력하는 화면의 경우 다른 위치에 자리할 수 있습니다."

> Exception: "텍스트형 컨트롤러의 경우 다른 위치에 자리할 수 있습니다."

### 02_박스형을 사용하는 경우 (When to use 박스형)
> "**주식, 채권 등 호가창이 있는 주문 화면에서** 사용합니다"

> "주문 화면이 아니더라도, **비밀번호 입력칸 및 버튼과 혼합하여 사용하는 경우에는 필수적으로 박스형을 사용합니다**"

> "**맨 좌측 중앙에 계좌번호를 배치**하고 **계좌정보를 추가할 경우 맨 우측 중앙에 배치**합니다"

> "**버튼이 혼합된 경우 맨 좌측 상단에 계좌번호를 배치**하고 **계좌 이름을 추가할 경우 좌측 계좌번호 아래에 배치**합니다"

Caption under the button-mixed example: *"버튼이 혼합된 경우 계좌번호 하단에 계좌이름을 배치합니다"* — i.e. adding buttons flips the layout from horizontal (number left / info right, both vertically centered) to stacked (number top-left, name beneath it).

### 02_라인형을 사용하는 경우 (When to use 라인형)
> "**상품주문, 서비스를 신청하는 등의 업무화면 및 정보를 조회하는 화면**에서 사용합니다"

> "계좌번호와 계좌정보 외에 **계좌잔고를 표시**하는 경우는 필수적으로 라인형을 사용합니다"

> "**맨 좌측 상단에 계좌번호를 배치**하고 **계좌정보를 추가할 경우 맨 우측 상단에 배치**합니다"

> "**잔고표시의 경우 계좌번호와 계좌이름 아래에 배치**합니다"

Note the alignment difference vs 박스형: 박스형 centers (좌측 **중앙** / 우측 **중앙**), 라인형 top-aligns (좌측 **상단** / 우측 **상단**) — because 라인형 has to leave room for the balance row underneath.

### 02_텍스트형을 사용하는 경우 (When to use 텍스트형)
> "**같은 위치에 다른 컴포넌트가 들어가 있는 경우**에서 사용합니다"

> "**계좌번호 및 정보를 강조하지 않아도 되는 경우** 사용합니다."

> "**계좌정보를 추가할 공간이 부족한 경우** 사용하며, 사용자가 설정한 계좌정보 외의 다른 정보는 추가하지 않습니다."

Example labeled `사용예시_홈화면` — the home screen, where the account controller is a small `202-01-024517 ▼` chip sitting beside the 나무자산 / 통합자산 toggle pills, i.e. sharing its row with other components. That's exactly the "같은 위치에 다른 컴포넌트가 들어가 있는 경우" it describes.

### 02 decision summary slide (frame 165:4802)

The guide's own two-column cheat sheet:

| Trigger | Type | Verbatim sub-caption |
|---|---|---|
| 버튼혼합, 주문화면 → | **박스형** | "주문화면 – 기본" / "버튼과 혼합하여 사용한다 – 필수" |
| 잔고표시, 상품, MY, 신청, 조회 → | **라인형** | "상품, MY, 신청, 조회 – 기본" / "잔고표시 – 필수" |

Read the 기본 vs 필수 distinction literally: 주문화면 and 상품/MY/신청/조회 are *defaults* (기본) for their type, but **버튼 혼합 → 박스형** and **잔고표시 → 라인형** are *mandatory* (필수) and override the default. This is the same content as 원칙 3, restated as a lookup table.

## 03. 계좌 선택창 가이드 (The account picker)

### Picker form is decided by controller type (frame 165:4907)

| Trigger | Picker form |
|---|---|
| 박스형 → | **드롭다운** (inline dropdown expanding under the control) |
| 라인, 텍스트형 + 계좌 여러개 선택 → | **슬라이딩 팝업** (bottom sheet titled `계좌 선택`) |

Note the second row's trigger is a compound: 라인/텍스트형 **plus** multi-account selection. The 슬라이딩 팝업 example shows checkmark-badged rows (selected/unselected states) with a green full-width CTA at the bottom — i.e. multi-select with an explicit confirm, whereas the 드롭다운 commits on tap.

The 슬라이딩 팝업 mockups show rows structured as: bank badge icon + 통장명 (`자유일출금통장`) + a small green tag (`노는 돈 계좌`) + 계좌번호 (`카카오뱅크 3333-16-1234567`) + 금액 (`12,123 원`) + a right-side check badge. One sheet variant shows the literal placeholder `최대 24글자 표기 이상은 말줄임` under an account row — **24-character max on the picker's secondary line, ellipsis beyond it**.

### Do & Don't — controller text and picker text must match
> "원칙 ) 컨트롤러에 있는 텍스트 정보와 계좌 선택창에 있는 텍스트 정보는 같아야 합니다"

**Don't** (red), verbatim:
> "컨트롤러에 있는 텍스트 정보 외에 추가로 다른 정보를 선택창에 배치하지 않습니다"

**Exception** (green), verbatim:
> "잔고표시의 경우 슬라이딩 팝업에 표시하지 않아도 되는 예외로 둡니다"

## Cross-reference against the domain Core reference (`popup_radio_account`)

The Core reference in `nds/CORE.md` lists `popup_radio_account` (key `bca81c36fdb886105179354ec7c1a6b150c0d0e8`, variants `Type(계좌만/통장이름/잔액표시)`, `Status(normal/selected)`) as the account-row selector card. This guide is that component's **rule source**, and the two line up cleanly — worth noting explicitly since it resolves what the variant names mean:

- `popup_radio_account`'s `Type` axis (`계좌만` / `통장이름` / `잔액표시`) maps onto this guide's text-composition rules: `계좌만` = 계좌번호 only, `통장이름` = 계좌번호 + 계좌정보, `잔액표시` = 계좌번호 + 계좌정보 + 잔고표시. So **picking a `Type` variant is a rule decision, not a styling one** — per 원칙 3, `잔액표시` implies the controller feeding it must be 라인형.
- `popup_radio_account` is a **계좌 선택창** row (the picker), not the **계좌 컨트롤러** itself. The guide keeps these strictly separate and the Core reference's "account-row selector card" description is consistent with the picker role. The controller itself has **no** Core-reference component key yet — see "worth promoting" below.
- The Core reference's "do not shrink below ~330px width — internal text doesn't reflow and clips" gotcha is consistent with this guide's `최대 24글자 표기 이상은 말줄임` placeholder: the component expects a full-width row with a defined truncation budget.

**No contradictions found** with the existing Core reference.

## How this feeds BUILD mode

When generating or reviewing any NH MTS screen that carries an account selector (via `csdesign` → `nds/LEADER.md` Mode 2):

1. **Pick the type by content, not by looks** (원칙 3 / summary table):
   - Mixed with buttons or a password input → **박스형** (mandatory).
   - Must show a balance (잔고) → **라인형** (mandatory).
   - Order screen with a 호가창 → 박스형 (default). 상품/MY/신청/조회 screen → 라인형 (default).
   - Sharing its row with other components, or account not worth emphasizing / no space → **텍스트형**.
   - Never mix types arbitrarily on one screen.
2. **Always render the ▼ dropdown icon and the 계좌번호.** Both are mandatory. If there is no account to show, render the disabled control with `선택할 수 있는 계좌가 없습니다.` — never a blank field.
3. **Place it directly under the header/tab**, with nothing between. Only relax this if (a) changing the account doesn't reload the whole screen, (b) it's an account-*input* screen, or (c) it's a 텍스트형 controller.
4. **Text layout follows the type**:
   - 박스형, no buttons: 계좌번호 left-center, 계좌정보 right-center.
   - 박스형, with buttons: 계좌번호 top-left, 계좌명 stacked beneath it.
   - 라인형: 계좌번호 top-left, 계좌정보 top-right, 잔고표시 on the row below both.
5. **Compose 계좌정보 as `[계좌유형] 계좌명/별명`** — square brackets around the type, e.g. `[종합매매] 김나무`. Never invent a fourth composition; only the three configured cases exist.
6. **Match the picker to the controller**: 박스형 → inline 드롭다운; 라인형/텍스트형 with multi-select → 슬라이딩 팝업 bottom sheet (use `popup_radio_account` rows, full-width, stacked). Choose its `Type` variant to match the controller's text composition.
7. **Picker text must equal controller text.** Don't enrich the picker with extra fields. Only exception: 잔고표시 may be omitted from the 슬라이딩 팝업.
8. Assume account display strings are **user-configured and globally synced** — don't hard-code one composition into a single screen as if it were a per-screen choice.
