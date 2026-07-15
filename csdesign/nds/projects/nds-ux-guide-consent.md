---
name: nds-ux-guide-consent
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=1168-5972"
learned_date: 2026-07-15
sections_studied:
  - "1313:18228 (frame '👍 thumbnail' — page cover, '이용동의')"
  - "1222:7902 (frame 'Slide 16:9 - 21' → INDEX: 01 필수 단일 동의 / 02 필수, 선택 혼합 동의 / 03 예외) 상품설명서 및 약관동의 / 04 예외) 마이데이터 스크롤 동의 / 05 예외) 개인(신용)정보처리 동의)"
  - "1303:10126 (frame 'Slide 16:9 - 28' → 'case 01 필수 단일 동의' — the base checkbox rule)"
  - "1168:6695 (frame 'Slide 16:9 - 1' → 'case 01 필수 단일 동의' — 모두동의 + 하위 체크, scroll-at-max rule)"
  - "1168:6719 (frame 'Slide 16:9 - 2' → 'case 01 필수 단일 동의 - 상세' — arrow → full popup, STEP UI)"
  - "1168:6727 (frame 'Slide 16:9 - 3' → '보고싶은 사람만 보는 상세의 FLOW')"
  - "1309:13640 (frame 'Slide 16:9 - 30' → '상세를 무조건 띄워야할 경우의 FLOW')"
  - "1270:8301 (frame 'Slide 16:9 - 24' → 'case 02 [필수][선택] 혼합 동의')"
  - "1168:6759 (frame 'Slide 16:9 - 4' → 'case 03 상품설명서 및 약관동의', 상품에서만 쓰는 예외케이스)"
  - "1289:8334 (frame 'Slide 16:9 - 26' → 'case 03 상품설명서 및 약관동의' — 포트폴리오 다중동의)"
  - "1306:13320 (frame 'Slide 16:9 - 29' → labeled 'case 03' on canvas but titled '상품 위험도 안내' — a topic absent from the INDEX; see gotcha)"
  - "1168:6707 (frame 'Slide 16:9 - 12' → 'case 04 스크롤 동의', 마이데이터에서만 쓰는 예외케이스)"
  - "1168:13752 (frame 'Slide 16:9 - 13' → 'case 05 개인(신용)정보처리 동의', 정보보호부 의견 반영 예외케이스)"
  - "1296:13569 (frame 'Slide 16:9 - 27' → 'case 05' — 모두 동의합니다 → 버튼 활성화)"
  - "1177:8884 (frame 'Slide 16:9 - 14' → 'case 05' — arrow → 상세 풀팝업)"
  - "1168:6883 (page-level TEXT: '📌 v0.1 가이드 발행')"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as design-rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — 이용동의 (Terms / Consent)

Part of the NDS_UX Guide file's "이용동의" canvas (page group "Patterns"). Every content frame carries the running header **"NDS 이용동의 가이드"**. Covers all five consent patterns, two of which are compliance-driven exceptions rather than design choices.

**Frame-numbering gotcha, this page's variant**: frames are named `Slide 16:9 - N` (Figma Slides leftovers), and **N does not track the case number or the canvas order** — e.g. `Slide 16:9 - 28` is case 01, `Slide 16:9 - 1` is also case 01, `Slide 16:9 - 12` is case 04, `Slide 16:9 - 13` is case 05. The layer name is pure noise here; read the on-canvas `case 0N` eyebrow.

**Index-vs-heading mismatch (content-level, not just layer names)**: frame `1306:13320` is labeled **"case 03"** with the exception tag "상품에서만 쓰는 예외케이스", but its title is **"상품 위험도 안내"** — a topic that does **not** appear in the INDEX (which lists case 03 as "예외) 상품설명서 및 약관동의" only). So case 03 covers *two* distinct patterns on canvas while the index advertises one. The guide itself notes 상품 위험도 안내 is *"동의는 아니지만"* — a consent-shaped UI that isn't legally a consent.

## INDEX (verbatim)
> 01 필수 단일 동의
> 02 필수, 선택 혼합 동의
> 03 예외) 상품설명서 및 약관동의
> 04 예외) 마이데이터 스크롤 동의
> 05 예외) 개인(신용)정보처리 동의

Cases 03–05 are explicitly marked **예외)** — they exist because of product/legal constraints, not because a designer preferred them. Cases 01–02 are the defaults.

## case 01 — 필수 단일 동의 (Single required consent)

The baseline pattern: one required checkbox gating a CTA.

> - "서비스 진행을 위해 [필수] 동의가 필요한 케이스에 체크 후 진행"
> - "'[필수] 동의합니다'라이팅 통일"
> - "미 체크 시 버튼 비활성화 처리"
> - "텍스트내용이 길어지면 Regular 폰트사용"
> - "체크 완료 시 하단 "가입하기" 버튼 활성화 처리"

A second case-01 frame adds the multi-item forms:
> - "필수 모두동의도 가능하고 개별 하위 체크도 필요한 경우"
> - "미 체크시 버튼 비활성화 처리"
> - "필수 모두동의가 필요하지만 개별 하위 체크가 필요 없는 경우 Dot으로 구분"
> - "항목이 길어지는 Max값일때 스크롤 처리"
> - "체크 완료 시 버튼 활성화 처리"

So case 01 has three shapes: single checkbox; 모두동의 **with** per-item checkboxes; 모두동의 **without** per-item checkboxes (items shown as **Dot**-prefixed read-only lines). When the list exceeds its max height it **scrolls inside the sheet** rather than growing.

### case 01 — 상세 (Detail)
> - "개별 하위 항목의 > 화살표를 누를경우 상세를 볼수 있도록 풀팝업 노출"
> - "개별 하위 항목의 통합이 필요할 경우 STEP UI로 세부내용들을 다음 이전으로 확인 할수 있도록 풀팝업으로 제공"

Two flows are diagrammed as separate slides, labeled verbatim:
- **"보고싶은 사람만 보는 상세의 FLOW"** — user optionally taps `>` per item; consent sheet → detail full popup → back.
- **"상세를 무조건 띄워야할 경우의 FLOW"** — detail is forced; the STEP UI walks every item in sequence via 다음/이전 before returning.

## case 02 — [필수][선택] 혼합 동의 (Mixed required/optional)

> - "필수와 선택 동의가 혼합일 경우 말머리에 [필수] [선택] 이라고 구분함"
> - "항목별 개별 체크도 가능"
> - ""모두 동의합니다" 체크시 선택포함하여 동의  *기획 케이스 확인 필요"
> - ""모두 동의합니다" 체크시 선택 미포함되어 [선택] 항목 개별 체크  *선택동의가 모두동의에 묶이면 안되는 케이스 확인이 필요"

**This is an unresolved decision, not a rule.** The guide documents *both* semantics for "모두 동의합니다" — including optional items, or excluding them — and flags each with a blue asterisk note telling the reader to go confirm with 기획. Do not assume either behavior when building; surface it as a question.

Prefix convention is fixed: `[필수]` / `[선택]` at the head of each label. The 모두 동의합니다 row is a boxed, visually separated control at the bottom of the list, above the CTA.

## case 03 — 상품설명서 및 약관동의 (예외: 상품에서만)

> - "상품의 매매 진행단계에서의 동의는 별도의 체크박스 없이 풀팝업 형태 노출"
> - "STEP UI로 상품설명서, 투자설명서,약관 등의 각 상품별로 받아야할 동의 항목 나열"
> - "노출 항목에 따라 스텝 수가 변경됨"
>   - *"\*설명서 및 약관의 STEP은 상단 게이지바에 영향을 주지 않음"*
>   - *"\*동의 항목이 1개인 경우, 항목명은 유지하고 STEP 표시 숨김"*

A second case-03 frame covers multi-consent products:
> - "포트폴리오 상품 등의 다중의 동의가 필요한 경우는 동의박스 체크시 풀팝업 형태로 노출"
> - "확인 체크가 완료되면 원래 화면으로 돌아왔을때 체크 활성화 처리"

Key structural point: the **설명서/약관 STEP indicator is a separate, nested progress track** from the order flow's top 게이지바 — they must not be conflated. With a single consent item, the step dots disappear but the item name stays.

### case 03 (cont.) — 상품 위험도 안내
(Labeled "case 03" on canvas; **not in the INDEX**.)
> - "투자위험 안내 팝업이며 동의는 아니지만 체크를 해야지만 진행이 가능한 케이스"
> - "체크시 "확인" 버튼 활성화 처리"

A consent-shaped gate that is legally *not* a consent — same UI mechanics (check → enable CTA), different semantics. Worth keeping distinct in copy: it's 안내/확인, not 동의.

## case 04 — 스크롤 동의 (예외: 마이데이터에서만)

> - "한페이지 내에 모든 동의 내용이 있는 마이데이터의 케이스에서 사용 아래로 내리기를 버튼을 누르면 한화면 단위로 화면이동"
> - "하단의 동의까지 하면 버튼명이 [다음] 으로 변경 후 프로세스 진행"

The CTA is **stateful**: it starts as **"아래로 내리기"** (paging the user down one viewport per tap) and only becomes **"다음"** once the bottom consent is reached and checked. Scoped strictly to 마이데이터 — do not reuse this pattern elsewhere.

## case 05 — 개인(신용)정보처리 동의 (예외: 정보보호부 의견 반영)

> - "정보보호부 의견 : 동의를 해야만 서비스를 이용할수 있다 하더라도 사용자가 동의 비동의를 직접 선택할수 있게 해야함."
> - "개인(신용)정보처리동의 체크박스를 누르면 별도의 슬라이딩 팝업 노출"
> - "동의 전 버튼 비활성화"

> - "하단 "[필수] 모두 동의합니다"를 체크하면 버튼 활성화 처리  *비동의가 하나라도 있을 시 버튼을 비활성화 됩니다."
> - "동의 후 버튼 활성화"

> - "오른쪽 화살표를 누를시 상세 풀팝업 화면을 띄워줍니다."
> - "확인을 누르면 원래화면으로 돌아갑니다."

**The defining rule**: even when consent is mandatory to use the service, the UI must offer an explicit **동의 / 비동의** pair per item (not a single checkbox). This is a 정보보호부 (Information Security) mandate, quoted verbatim in the guide. The sliding popup groups items under numbered headings ("1. 수집·이용에 관한 사항", "2. 제공에 관한 사항"), each row offering 동의|비동의 buttons, with a "[필수] 모두 동의합니다" control at the bottom. Any single 비동의 keeps the CTA disabled.

## Cross-case invariants

Repeated across every case, verbatim or near-verbatim:
- **미체크/동의 전 → 버튼 비활성화; 체크 완료 → 버튼 활성화.** Stated in cases 01, 02, 03, 05.
- `>` (right arrow) on a consent row always means "open the detail full popup"; returning from it preserves/activates the check.
- `[필수]` / `[선택]` bracket prefixes are the required labeling convention.

## Component notes

Consent rows, 모두동의 boxes, and the sliding/full popups on this page are drawn as flattened image placeholders (`image 1`…`image 6` rounded-rectangles) rather than live component instances — **no componentKeys are recoverable from this page**. The only live instances are the guide's own annotation bullets (`no_1`) and index items (`item01`–`item04`), which are documentation chrome, not product components. For real consent controls, fall back to the Core reference (`radio_basic`, `check_icon_line`/`check_icon_solid`, `btn_bottom_page_assets`) and confirm against a production file.

## How this feeds BUILD mode

When generating or reviewing an NH MTS consent screen:

1. **Start from cases 01/02 — the defaults.** Only reach for 03/04/05 if the screen is, respectively, a 상품 매매 flow, a 마이데이터 flow, or an 개인(신용)정보처리 consent. The guide marks those three **예외)**; using them elsewhere is a misuse.
2. **Copy is fixed**: "[필수] 동의합니다" for a single required consent; `[필수]`/`[선택]` prefixes on every item in a mixed list; "모두 동의합니다" for the aggregate row.
3. **The CTA is always gated**: disabled until required consents are checked, enabled on completion. Never mock a consent screen with an already-enabled CTA and an unchecked box.
4. **`>` on a consent row ⇒ full popup detail.** If details must be seen (not optional), use the STEP UI full popup with 이전/다음 instead of a per-item arrow.
5. **For 개인(신용)정보처리 동의, render 동의/비동의 button pairs — never a single checkbox**, even though consent is mandatory. Any 비동의 keeps the CTA disabled. This is a compliance requirement, not a preference.
6. **In 상품 flows, keep the 설명서/약관 STEP indicator separate from the order 게이지바.** With one consent item, hide the step dots but keep the item name.
7. **마이데이터 only**: the "아래로 내리기" → "다음" stateful CTA. Don't copy it into other flows.
8. **Flag, don't guess, the 모두동의 semantics.** Whether "모두 동의합니다" includes `[선택]` items is explicitly marked *"기획 케이스 확인 필요"* in the guide — raise it as an open question on any mixed-consent screen.
9. Build at **540px**; consent sheets scroll internally at their max height rather than growing the page.
