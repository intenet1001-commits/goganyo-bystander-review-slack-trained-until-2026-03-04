---
name: nds-ux-guide-alimtalk
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=4050-61940"
learned_date: 2026-07-15
sections_studied:
  - "4090:8836 (frame '02' — the INDEX slide, child frame 4090:8837 'index'. Lists: 01 왜 알림톡 라이팅이 중요한가요?, 02 알림톡 라이팅 규칙, 03 알림톡 표준 작성 구조, 부록 알림톡 샘플 템플릿)"
  - "4090:8644 (frame '03' → on-canvas '왜 알림톡 라이팅이 중요한가요?' = index section 01 — push vs SMS vs 알림톡 positioning)"
  - "4090:9027 (frame '04' → on-canvas '알림톡 라이팅 규칙 1: 결론 우선 쓰기')"
  - "4094:9059 (frame '05' → on-canvas '알림톡 라이팅 규칙 2: 친절하고 명확하게 쓰기' — next-action clarity)"
  - "4105:40 (frame '06' → on-canvas '알림톡 라이팅 규칙 2: 친절하고 명확하게 쓰기' AGAIN — jargon plain-language. 규칙 2 spans two slides.)"
  - "4094:9064 (frame '07' → on-canvas '알림톡 라이팅 규칙 3: 시각적 위계 주기' — bullets/whitespace)"
  - "4105:101 (frame '08' → on-canvas '알림톡 라이팅 규칙 4: 시각적 위계 주기' — heading/subtitle copy-pasted from 규칙 3; actual content is link-as-button. See gotcha.)"
  - "4094:9231 (frame '09' → on-canvas '알림톡 공통 표준 작성 구조' = index section 03 — the 제목→요약→상세→설명→참고 spine)"
  - "4107:99 (frame '10' → on-canvas '부록. 알림톡 샘플 템플릿 [해외주식 권리안내]' — 4 rewritten templates)"
  - "4109:50 / 4109:508 / 4109:899 / 4109:266 / 4109:382 (frames '11'–'15' → further 부록 sample-template slides: [해외주식 권리안내] 2nd page, [국내주식 보고·권리] ×2, [주식모으기] ×2. Same template shape as 4107:99; not individually transcribed.)"
  - "4067:7763 ('👍 thumbnail' cover slide — title '알림톡 글쓰기')"
  - "4067:7766 (Update_History_01 — version table, rows still placeholder 'v0.1 최초작성 / 백채원 / 2021.12.28')"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as UX-writing rule source of truth for outbound KakaoTalk business messages, not a screen-flow reference)
---

# NDS UX Guide — 알림톡 (AlimTalk / KakaoTalk Business Message Writing)

Part of the NDS_UX Guide file's "알림톡" canvas ("NHI UX Writing Guide" corner tag). Unlike the other UX-writing pages, this one governs **outbound messages**, not in-app screens — so it is only relevant to a BUILD pass when that pass touches notification copy. It is by far the largest of the four pages studied (14 content slides).

**Frame-numbering gotcha confirmed again**: layer names "02"–"15" are offset from the on-canvas structure. Layer **"02" is the INDEX**; layer "03" is index-section **01**; layers "04"–"08" are index-section **02** (the four rules across five slides); layer "09" is index-section **03**; layers "10"–"15" are the **부록**. Trust the screenshot heading.

**Additional authoring bug found on this canvas (report, don't silently fix)**: frame `4105:101` is headed **"알림톡 라이팅 규칙 4: 시각적 위계 주기"** and carries the subtitle *"알림톡은 '읽는 것'이 아니라 '훑어보는 것'입니다. 한눈에 읽기 쉽도록 불렛포인트를 활용하여 시각적으로 위계를 주세요."* — **both copy-pasted verbatim from 규칙 3** (`4094:9064`). The slide's actual content is about **not exposing raw URLs / using the button affordance**, which has nothing to do with 시각적 위계. The heading text "규칙 4" is correct (it is the 4th rule); the *title phrase and subtitle* are wrong. Rule content below is transcribed from what the slide actually teaches.

Also note the rule numbering runs **1, 2, 2, 3, 4** across five slides — 규칙 2 legitimately spans two slides.

## 01. 왜 알림톡 라이팅이 중요한가요?

Intro, verbatim (three lines):
> "알림톡은 서비스 관련 필수 정보를 고객에게 카카오톡으로 전달하는 정보형 메시지입니다.
> 고객이 다음 행동을 정확하게 인지하고, 거래를 완료할 수 있도록 돕는 역할을 합니다.
> 목적에 맞는 글쓰기를 위해 푸시나 문자와의 차이를 확인해주세요."

Two positioning cards:

**푸시와의 차이**, verbatim:
> "푸시는 '유입'과 '발견'이 목적이라면, 알림톡은 '**정보의 기록과 확인**'이 목적입니다.
> 푸시처럼 휘발되지 않으므로 나중에 다시 봐도 명확해야 합니다."

**문자메세지와의 차이**, verbatim:
> "SMS보다 가독성이 높고(버튼, 강조형 제목), '**인증된 채널**'이라는 신뢰감을 줍니다.
> 따라서 딱딱한 공지보다는 정중한 안내가 적합합니다."

This is the page's thesis and the reason every rule below exists: **an 알림톡 is a durable record read out of context later**, so it optimizes for standalone clarity, not for click-through.

## 02. 알림톡 라이팅 규칙 1: 결론 우선 쓰기

Subtitle, verbatim:
> "사용자는 알림톡의 첫 두 줄만 보고도 나에게 무슨 일이 일어났는지 알아야 합니다."

| ❌ | ✅ |
|---|---|
| "'안내'와 같은 관용구나 긴 서론으로 시작하지 않습니다." | "핵심 액션(입금, 체결, 만기)을 맨 앞에 배치합니다." |

DON'T example (verbatim, title line): `[NH투자증권] 해외권리 거래발생 안내` — body dumps `박*순님 2010183***6 해외주식입출고 10/10 12:12 1,000주 고고로 액면병합출고 50주 고고로 액면병합입고` as an unpunctuated run-on.

DO example (verbatim, title line): `[NH투자증권]주식 수가 바뀌었어요!(액면 병합)` — then a 요약 line, a `▶ {김엔투}님 주식 수 변경 내역` detail block, and a `▶ 액면 병합이란?` explainer.

## 02. 알림톡 라이팅 규칙 2: 친절하고 명확하게 쓰기

Subtitle, verbatim:
> "어려운 금융 용어는 쉽게 풀고, 다음 행동을 명확히 제시합니다."

This rule occupies **two slides**, one per half of the subtitle.

### 2a — next-action clarity (`4094:9059`)
| ❌ "모호한 안내로 끝내지 않습니다." | ✅ "사용자가 지금 무엇을 해야 하는지 명확히 알려주세요." |

DON'T flags the vague single line *"주식모으기 주문 성공을 위해, 주문시간 전까지 외화(USD)를 직접 채워주세요."*
DO replaces it with a numbered, bulleted action block (verbatim):
> ▶ 이렇게 해주세요
> 1. 해외주식 온주 주문 시간을 확인해주세요.
> 2. 주문 시간 전까지 계좌에 외화(USD)를 직접 채워주세요.

### 2b — plain language (`4105:40`)
| ❌ "모호한 안내로 끝내지 않습니다." | ✅ "어려운 금융 용어는 쉽게 풀어 써주세요." |

DON'T flags *"자세한 내용은 관리 영업점(8:00~17:00) 및 고객지원센터(8:00 ~ 18:00)로 문의주시기 바랍니다."* — i.e. punting the customer to a phone line instead of explaining.
DO adds an inline explainer block (verbatim):
> ▶ 주식 배당이란?
> 회사가 주주에게 현금 대신 주식으로 배당을 주는 것을 의미해요.

The DO example also converts the DON'T's numbered `1. 종목명 : |종목명|` pipe-delimited placeholder list into a `- 계좌번호: {계좌번호}` brace-placeholder list — see the placeholder-syntax note below.

## 02. 알림톡 라이팅 규칙 3: 시각적 위계 주기

Subtitle, verbatim:
> "알림톡은 '읽는 것'이 아니라 '훑어보는 것'입니다. 한눈에 읽기 쉽도록 불렛포인트를 활용하여 시각적으로 위계를 주세요."

| ❌ | ✅ |
|---|---|
| "모든 문장을 붙여 쓰면 정보의 경계가 모호해 지고, 내용을 파악하기 어려워집니다." | "정보의 단위(요약/상세/참고)가 바뀔 때는 한 줄의 여백을 두고, 불렛포인트(▶, -, ※)를 활용해주세요." |

**This names the three-glyph bullet system explicitly: `▶` (block heading), `-` (item within a block), `※` (caveat/참고).**

DO example (verbatim):
> [NH투자증권] 반대통보 신청이 접수됐어요.
>
> {고객명}님, 보유하신 {종목명}의 주요사항(분할·합병 등) 결의에 대한 반대통보 신청이 정상 접수됐어요.
>
> ▶ 신청 내역
> - 계좌번호: {계좌번호}
> - 대상 종목: {종목명}
> - 신청 상태: 반대통보 접수 완료
>
> ※ 이건 확인해주세요
> 15시가 반대통보 신청 마감 시간이에요.
> 마감 이후에는 변경·취소가 어려우니 참고해주세요.

## 02. 알림톡 라이팅 규칙 4: (링크 대신 버튼) — heading mislabeled "시각적 위계 주기"

Actual content of `4105:101`:

| ❌ | ✅ |
|---|---|
| "본문 안에 텍스트 형태의 URL 주소 링크를 그대로 노출하지 않습니다." | "연결할 링크가 하나라면, 버튼 기능을 활용해 주세요." |

DON'T example exposes `바로가기( http://nhqv.page.link/HVFx )` inline in the body.
DO example ends the message with a proper button reading **"지금 포트폴리오 보러가기"**.

Note the qualifier **"연결할 링크가 하나라면"** — the button rule is scoped to single-link messages. The 규칙 2b DO example, which needs two links (나무 / N2 channels), keeps them as labeled inline links under a `▶ 나의 거래내역 확인하기` heading rather than as buttons. That's consistent, not a contradiction.

## 03. 알림톡 공통 표준 작성 구조

The page's spine. Slide title (verbatim): **"알림톡 공통 표준 작성 구조"**, with the order stated as:
> "[제목 → 요약 → 상세 → 설명 → 참고] 순서로 작성해주세요."

| Slot | Rule (verbatim) |
|---|---|
| **제목** | "동사형으로 작성하기" |
| **요약** | "'누가, 무엇을 했는지' 한 문장으로 경어체를 사용해 설명하기" |
| **상세** | "항목과 값을 명확히 분리하여 데이터를 보기 좋게 쓰기" |
| **설명** | "어려운 한자어나 상황, 용어는 일상어로 풀어 설명하기" |
| **참고** | "문의처나 유의사항을 공통 포맷으로 적고 마무리하기" |

A stray canvas-level text node (`4083:2`) restates the same spine in older wording, verbatim: *"형식 통일 (제목 →요약 문구 →세부 내역 → 상황(용어)설명 → 참고 사항의 흐름)"* — same five slots, older labels. Prefer the slide's labels.

## 부록. 알림톡 샘플 템플릿

Six slides of already-rewritten production templates ("기존에 리라이팅된 알림톡 템플릿을 참고해주세요."), grouped by domain:

| Slide | Domain | Templates |
|---|---|---|
| `4107:99` ("10") | [해외주식 권리안내] | 회사분할 · 주식청산 · 유상청약 신주인수권증서 입출고 · 단수주 대금 입금 |
| `4109:50` ("11") | [해외주식 권리안내] | 주식 배당(무상주 입고) · 배당금 입금 · 액면분할 및 병합 |
| `4109:508` ("12") | [국내주식 보고·권리] | 주식형사채 권리행사 신청 안내 · 찬반(매수청구) · 찬반(매수청구)_미수제권리약정 계좌 · 찬반(매수청구)_반대통보 신청고객 |
| `4109:899` ("13") | [국내주식 보고·권리] | 분배금_분배금 입금 안내 · ELS/DLS분배금안내 · 무상_무상증자 신주입고안내 · 배당_배당주 입고 안내 |
| `4109:266` ("14") | [주식모으기] | 만기안내 · 일시정지 · 미체결 · 미실행 |
| `4109:382` ("15") | [주식모으기] | 자동환전(1차) · 자동환전(2차) |

Representative template transcribed verbatim (회사분할, from `4107:99`) — this is the canonical shape every template follows:

> [NH투자증권] 회사 분할 후 새 주식이 입고되었어요.
>
> {김엔투}님, 보유한 주식(소니 파이낸셜 그룹)의 '회사 분할'에 따라 새로운 주식이 입고되었습니다.
>
> ▶ {김엔투}님 주식 입고 내역
> - 계좌 번호: 0180120*0
> - 종목명: 소니 파이낸셜 그룹
> - 입고 수량: 1,000주
>
> ▶ 회사 분할이란? 고객님이 기존에 투자했던 회사가 사업을 나누어 새로운 회사를 만들면서, 그 대가로 새 회사의 주식을 받는 것을 말합니다.
>
> [버튼] 권리 내역 · 상세 내용 보러가기

Sibling template (단수주 대금 입금) shows the `※` caveat slot in use, verbatim:
> ※입금된 금액은 외화(USD)로 예수금에 반영됩니다. 자세한 내용은 계좌 거래 내역에서 확인할 수 있습니다.

**Placeholder syntax**: DO examples and all 부록 templates use **`{변수명}`** braces (`{고객명}`, `{계좌번호}`, `{종목명}`, `{총 세금액}`). The DON'T examples use legacy **`|변수명|`** pipes (`|계좌번호|`, `|종목명|`, `|총 입고수량|주`). Braces are the current convention; pipes are a smell that a template predates this guide.

## How this feeds BUILD mode

When writing or reviewing an NH 알림톡 template (via `csdesign` → `nds/LEADER.md` Mode 2):

1. **Follow the five-slot spine in order: 제목 → 요약 → 상세 → 설명 → 참고.** A template missing 설명 (the "…이란?" explainer) or 참고 is incomplete, not merely terse.
2. **제목 must be 동사형 and lead with the outcome**, prefixed `[NH투자증권]`. `[NH투자증권] 배당주를 받았어요.(주식 배당)` ✅ / `[NH투자증권] 주식배당주 입고 안내` ❌ ("안내" is explicitly named as the anti-pattern).
3. **First two lines must answer "what happened to me".** No 관용구 preamble, no 서론.
4. **요약 = one 경어체 sentence naming who did what.** Templates open it with `{고객명}님, …`.
5. **상세 = a `▶` block of `- 항목: 값` pairs.** Never a run-on sentence; never numbered `1. 종목명 : |종목명|` pipe lists.
6. **Every piece of jargon gets a `▶ X란?` plain-language explainer** in the 설명 slot. Do not substitute a phone number ("문의주시기 바랍니다") for an explanation — that's the flagged DON'T.
7. **Blank line between information units; bullets `▶` (block) / `-` (item) / `※` (caveat).** Nothing runs together.
8. **One link → use the button.** Never paste a raw `http://…` into the body. Multiple links → labeled inline links under a `▶` heading.
9. **Use `{변수명}` braces for placeholders**, never `|변수명|`.
10. **Write for later re-reading, not for the tap.** The push-vs-알림톡 distinction is the tiebreaker on any "is this too long?" call — an 알림톡 that is complete-but-long beats one that is short-but-ambiguous. (Amount formatting inside these templates should follow `nds-ux-guide-currency-notation` — the 부록 templates use `USD 432.23` / `150,000 원`, consistent with its 나열식/문장 rules.)
