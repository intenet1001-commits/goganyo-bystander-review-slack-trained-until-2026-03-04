---
name: nds-ux-guide-currency-notation
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=3055-38"
learned_date: 2026-07-15
sections_studied:
  - "3070:11558 (frame internally named '01' — actually the INDEX slide, contains child frame 3070:11601 'index'. Lists: 01 통화 표기 기본 정의, 02 사용처별 표기 규칙, 부록 NH투자증권 표기 서식 체크리스트. Carries a 'Last update 25.07.22' stamp.)"
  - "3082:5861 (frame '02' → on-canvas '01 통화 표기 기본 원칙 - 금액 표기' — comma + 한글 병기 + 소수점 rules)"
  - "3070:3940 (frame '03' → on-canvas '01 통화 표기 기본 원칙 - 통화 표기' — 통화단위/통화코드/통화기호 placement rules)"
  - "4047:40127 (frame '04' → on-canvas '02 사용처별 표기 예시 - 대시보드·상단 총액·카드형 입력필드')"
  - "3070:4051 (frame '05' → on-canvas '02 사용처별 표기 예시 - 문장 내 (본문, 유의사항, 알럿 등)')"
  - "3070:4035 (frame '06' → on-canvas '02 사용처별 표기 예시 - 리스트·테이블')"
  - "4049:9244 (frame '7' → on-canvas '부록. NH투자증권 서식 표기 규칙' — the checklist matrix; contains child 3070:12409 named '※ 참고: N2 표기 서식 체크리스트')"
  - "3070:3930 ('👍 thumbnail' cover slide)"
  - "3070:4074 (Update_History_01 — version table, rows still placeholder 'v0.1 최초작성 / 백채원 / 2021.12.28')"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as formatting rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — 통화표기 (Currency & Amount Notation)

Part of the NDS_UX Guide file's "통화표기" canvas — the design team's internal rulebook for how money is written on screen ("NHI UX Writing Guide" corner tag). This is the **most directly mechanical** of the UX-writing guides: it produces concrete, checkable formatting rules for every amount rendered in the app.

**Frame-numbering gotcha confirmed again**: internal frame layer names ("01"–"7") are offset by one from the on-canvas section numbers, because the layer named **"01" is the INDEX**, not section 01. Layer "02" is on-canvas section 01; layers "04"/"05"/"06" all belong to the single on-canvas section 02; layer "7" is the 부록. Same class of mismatch documented in `nds-ux-guide-color-contrast` and `nds-ux-guide-touch-area`. Trust the screenshot heading only.

**Freshness note**: this is the only canvas of the four UX-writing pages studied on 2026-07-15 that carries its own currency stamp — the INDEX reads **"Last update 25.07.22"**. (The Update_History table is still unfilled placeholder rows, so the INDEX stamp is the only real date signal.)

## 01. 통화 표기 기본 원칙 — 금액 표기 (Amount formatting)

Rule 1, verbatim: **"3자리 마다** 쉼표 사용 필수"

Examples shown: `₩1,000` · `$25,000` · `USD 1,000,000`

Rule 2, verbatim: **"만단위 이상 부터** 한글로 표기 가능"

A three-row example table (row labels: 일반 / 한글 병기* / 소수점 표기**):

| 일반 | 한글 병기* | 소수점 표기** |
|---|---|---|
| 2,500 원 | 2,500 원 | – |
| 25,000 원 | 2만 5,000 원 | 2.5만 원 |
| 2,500,000 원 | 250만 원 | – |
| 25,000,000 원 | 2,500만 원 | – |
| 2,250,000,000 원 | 22억 5,000만 원 | 22.5억 원 |

Footnotes, verbatim:
> \* 상황 및 요건에 따라 한글 병기 방식 혼용 가능
> \*\* 필요 시 만단위 이상 금액 소수점 표기 가능

Note the 2,500 row: below 만 단위 the 한글 병기 column is **identical** to 일반 — i.e. the 한글 rule genuinely starts at 만, and the 소수점 column is `-` (not applicable) for it.

## 01. 통화 표기 기본 원칙 — 통화 표기 (Currency marker placement)

Three markers, each with its own placement rule (all verbatim):

| Marker | Rule | Examples |
|---|---|---|
| **통화단위** (Korean unit word) | "는 금액 뒤에 씀 (띄어쓰기가 원칙, 붙여쓰기 허용)" | `3만 원` · `5,000 달러` · `100 엔` · `50 유로` |
| **통화코드** (ISO code) | "는 금액 앞에 씀 (띄어쓰기가 원칙)" — footnote: *"\* 단, 문장안에 들어가는 경우를 제외하고, 예외적으로 금액 뒤에 표기 가능"* | `KRW 30,000` · `USD 5,000` · `JPY 100` · `EUR 50` |
| **통화기호** (symbol) | "는 금액 앞에 씀 (붙여쓰는 것이 일반적)" — footnote: *"\* 달러($) 외 통화기호 사용 지양, 금액 뒤에 통화기호 표기 불가."* | `₩30,000` · `$5,000` · `¥100` · `€50` |

Two closing rules, verbatim:
> "**통화코드와 통화기호 중복 표기 금지.** 예: USD $1,000 (X)"
> "**동일한 서비스 내에서는 통화 표기 방식을 일관되게 유지.**"

## 02. 사용처별 표기 예시 — 대시보드 · 상단 총액 · 카드형 입력필드

Intro, verbatim:
> "사용자가 앱에 진입했을 때 가장 먼저 확인하는 핵심 자산 정보 영역입니다."
> "정책: 가장 직관적인 '원' 또는 '$' 를 사용합니다."

Real-screen examples with the amount red-boxed: `123,456,789 원` (내 자산 총자산), `1,436.00 원` (미국 USD 환율 카드), `$ 440.0000` (테슬라 호가 입력필드), `$ 30.00` (외화RP 매수 입력필드).

**예외 케이스** (called out in red on the same slide) — the 환전 screen shows `USD` / `EUR` dropdowns beside `100달러` / `87.72유로`. Annotation, verbatim:
> "환전 서비스처럼 서로 다른 통화의 금액을 동시에 보여주어야 하는 경우, 사용자의 인지 편의성과 정보의 명확성을 최우선으로 하여 복합적으로 표기 허용합니다."

## 02. 사용처별 표기 예시 — 문장 내 (본문, 유의사항, 알럿 등)

Intro, verbatim:
> "텍스트 흐름 속에서 금액이 읽혀야 하는 경우입니다."
> "정책: 한글 통화 단위 사용을 원칙으로 합니다."
> "이유: 문장 중간에 기호($)나 코드(USD)가 들어가면 읽기 흐름이 끊길 수 있습니다."

**일반문장 적용 예시** (verbatim):
> "최소 1,000원부터 투자할 수 있어요."
> "환전 시 100달러 기준으로 수수료가 부과돼요."
> "해외선물옵션 거래시 수수료는 계약당 1달러 ~ 12.5달러입니다."

**예외문장 적용 예시 (나열식 정보에는 패턴을 통한 가독성 확보를 위해 통화코드 허용)** (verbatim):
> 해외주식 온라인 거래 최소 수수료 안내
> – 중국·홍콩·일본: 없음
> – 기타 국가: 영국(GBP 20), 독일(EUR 20), 호주(AUD 10), 베트남(VND 600,000), 인도네시아(IDR 350,000)

Note in the 일반문장 examples the 통화단위 is written **붙여쓰기** (`1,000원`, `100달러`) even though §01 says 띄어쓰기 is the 원칙 — §01 explicitly permits 붙여쓰기, and in-sentence usage is where that allowance is exercised.

## 02. 사용처별 표기 예시 — 리스트 · 테이블

Intro, verbatim:
> "가장 많은 데이터가 노출되는 영역으로, 숫자 간의 크기 비교가 쉽도록 우측 정렬과 통일된 단위 위치가 중요합니다."
> "정책: 가독성을 위해 통화코드(USD 등)를 금액 뒤에 표기하는 것을 예외로 허용합니다."
> "이유: 금액 자릿수가 제각각일 때 통화기호나 코드가 앞에 붙으면 정렬이 흐트러져 가독성이 떨어집니다."

This is the **explicit carve-out** referenced by §01's 통화코드 footnote. Examples (red-boxed on real screens): `100,000 USD` / `10,000,000 JPY` / `600,000 HKD` / `500,000 CNY` in a 환전 가능통화 table; `134,234원` / `27,777원` / `26.81%` / `123 USD` in a 파생전용계좌 balance list.

## 부록. NH투자증권 서식 표기 규칙 (checklist matrix)

A decision matrix where each row is a formatting question and the **checked** column is NH's chosen answer. Transcribed from the on-canvas checkmarks (`4049:9244`):

| Group | Question | Options | ✅ Chosen |
|---|---|---|---|
| 금액 표기 | 소수점 표기 | 한 자리까지 (12.5) / 두 자리까지 (12.51) / 세 자리까지 (12.513) / 상황에 따라 다름 | **상황에 따라 다름** |
| 금액 표기 | 쉼표 표기 | 세 자리마다 (25,000원) / 하지 않음 (25000원) / 둘 다 사용 | **세 자리마다** |
| 금액 표기 | 소숫점으로 금액 표기 | 억 단위 이상 (12.5억원) / 하지 않음 (12억 5천만원) / 둘 다 사용 | **둘 다 사용** |
| 금액 표기 | 숫자→한글 표기 | 만 단위 이상부터 한글로 / 천 단위 이상부터 한글로 / 하지 않음 / 상황에 따라 다름 | **만 단위 이상부터 한글로** (ㄴ 병기 시) **+ 하지 않음** (ㄴ 일반 표기 시) **+ 상황에 따라 다름** — three boxes ticked, disambiguated by the "ㄴ 병기 시" / "ㄴ 일반 표기 시" sub-labels under the columns |
| 분수 표기 | 분수 표기 | 한글로 풀어서(서술) "3분의 1" / 슬래시로(수치 제시) "1/3" / 기호로 "⅓" | **한글로 풀어서** (labeled 문장) **+ 슬래시로** (labeled 수치) — i.e. prose→한글, data→slash; **기호(⅓) is not used** |
| 통화 표기 | 원화 표기 | ₩10,000 / 10,000원 / 상황에 따라 다름 | **10,000원** |
| 통화 표기 | 외화 표기 (예시: 달러) | $1,000 / USD $1,000 / USD 1,000 / 1,000달러 | **USD 1,000** **+ 1,000달러** — side note, verbatim: *"문장 안에 들어갔을 때만으로 한정. 나머지 쿠폰이미지, 입력필드, 표, 리스트 등에는 각각의 상황에 따라 다름"* |
| — | 날짜 표기 순서 | 연-월-일 순서 / 월-일-연 순서 / 일-월-연 순서 / 상황에 따라 다름 | **연-월-일 순서** |

**Caution on this matrix**: it is rendered as a small embedded image-like table and several rows tick more than one box, resolved only by tiny sub-labels. The prose rules in §01/§02 are the higher-confidence source; use this matrix as corroboration (and for the 분수/날짜 rules, which appear *only* here). The 원화 표기 row choosing `10,000원` over `₩10,000` is worth noting — §01 shows `₩30,000` as a valid 통화기호 example, but the checklist says the house default for KRW is the 한글 unit, not the symbol.

## How this feeds BUILD mode

When generating or reviewing any NH MTS screen that renders money (via `csdesign` → `nds/LEADER.md` Mode 2), apply in this order:

1. **Always comma-group by 3 digits.** No exceptions (`25,000원` ✅ / `25000원` ❌).
2. **Pick the marker by surface**, not by taste:
   - **대시보드 / 상단 총액 / 카드형 입력필드** → 한글 `원` or symbol `$`. (`123,456,789 원`, `$ 440.0000`)
   - **문장 내 (본문·유의사항·알럿)** → 한글 통화단위 only. (`1,000원부터`, `100달러 기준`) Never `$`/`USD` mid-sentence — except a 나열식 list of per-country values, where 통화코드 is allowed for scan-ability.
   - **리스트 / 테이블** → 통화코드 **after** the amount, right-aligned. (`100,000 USD`, `123 USD`) This is the sanctioned exception to "코드는 앞에".
3. **Never `USD $1,000`** — code and symbol are mutually exclusive.
4. **Never put a 통화기호 after the amount** (`30,000₩` ❌). And avoid non-`$` symbols (`¥`, `€`) in general — prefer the code or the 한글 unit.
5. **KRW house default is `10,000원`, not `₩10,000`** (per the 부록 checklist), even though `₩` is a legal symbol form.
6. **한글 병기 only from 만 단위 up**: `2만 5,000 원` ✅ / `2천 5백 원` ❌. Decimal-abbreviated form (`2.5만 원`, `22.5억 원`) is optional and also only ≥만.
7. **Keep one notation style per service.** Mixing `$` and `달러` and `USD` across screens of the same flow violates the explicit consistency rule — the only sanctioned mix is a genuine multi-currency comparison surface (환전).
8. **Dates: 연-월-일.** Fractions: spell out in prose (`3분의 1`), slash in data (`1/3`); never `⅓`.
