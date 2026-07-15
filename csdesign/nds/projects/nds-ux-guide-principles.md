---
name: nds-ux-guide-principles
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=4200-70"
learned_date: 2026-07-15
sections_studied:
  - "4282:105 (frame '00', y=-1327 → on-canvas '프로덕트 원칙' — 4 principles)"
  - "4200:203 (frame '01', y=-72 → on-canvas 'UI·UX 원칙' — 4 principles)"
  - "4201:40548 (frame '3', y=1208 → on-canvas 'UX Writing 원칙' — 4 principles)"
  - "4200:71 (frame '02', y=2488 → on-canvas 'Graphic 원칙' — 4 principles)"
  - "4203:2 (frame '4', y=3768 → on-canvas 'Interaction 원칙' — 3 principles)"
  - "4200:589 (frame '30', y=-2560 — EMPTY, zero children. Not content.)"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as design-rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — Principles (프로덕트 / UI·UX / Graphic / UX Writing / Interaction 원칙)

The **foundational page of the whole NDS_UX Guide** — 19 named principles across 5 categories. Every other guide in this file (contrast, touch area, popup, nudge, …) is a concrete application of these. When a specific guide is silent on something, reason from here.

## ⚠️ How this page was almost missed — read this before trusting any coverage claim

**This page is NOT listed in the file's Welcome/TOC index** (`2:2899`). The TOC lists 17 topics across 4 groups (Accessibility / UX Writing / Patterns / Usage Guidelines); Principles is in none of them. A coverage audit driven by the TOC will report "17/17 complete" and silently miss this page — which is exactly what happened on 2026-07-15 before a baseline test caught it.

**The TOC is not authoritative. `figma.root.children` is.** See `LEADER.md` → "Enumerating pages" for the correct method.

**Placeholder layer names, in the extreme.** Every TEXT node on this page is named either `6개월간 4500시간 단축` or `디자인 가이드라인 / 디자인 시스템의` — leftover template names with **zero** relationship to displayed content. A metadata-only read of this page yields literally nothing true. Every line below was transcribed from screenshots.

**Frame layer names don't match canvas order either.** By y-position the order is `00` → `01` → `3` → `02` → `4` — layer "02" (Graphic) sits *below* layer "3" (UX Writing) on the canvas. Same gotcha as every other page in this file.

## 프로덕트 원칙 (Product Principles) — frame `00`

| 원칙 | English | 설명 (verbatim) |
|---|---|---|
| 고객 고민을 최소화하고 | **Minimum Thinking** | "필요한 선택만 남기고 고객의 고민을 줄여요." |
| 가치 먼저, 비용은 나중에 | **Value First, Cost Later** | "가치를 먼저 경험하게 하고 비용은 나중에 요청해요." |
| 쉽고 명확한 언어로 | **Clear Communication** | "고객이 바로 이해할 수 있게 쉽게 표현해요." |
| 고객에게 먼저 보이는것부터 | **Impact First** | "임팩트가 큰 일부터 우선순위를 정해요." |

## UI·UX 원칙 — frame `01`

| 원칙 | English | 설명 (verbatim) |
|---|---|---|
| 이해하기 쉽고 | **Instinct** | "필요한 정보를 바로 확인하고 어렵게 않게 표현해요." *(sic — "어렵게 않게" is the guide's own typo, likely for "어렵지 않게")* |
| 매끄러운 | **Seamless** | "원하는 목표까지 매끄럽게 도달할 수 있어야 해요." |
| 시각적 계층으로 | **Hierarchy** | "핵심 행동을 유도할 수 있도록 화면 정보를 구성해요." |
| 일관되게 | **consistent** | "사용자가 매번 학습하지 않도록 일관되게 사용해요." *(sic — lowercase "consistent" here, but capitalized "Consistency" in Graphic 원칙)* |

## Graphic 원칙 — frame `02`

| 원칙 | English | 설명 (verbatim) |
|---|---|---|
| 독창성 | **Originality** | "차별성있는 비주얼로 브랜드 이미지를 전달해요." |
| 직관성 | **Instinct** | "메세지 전달에 적합한 비주얼 그래픽을 사용해요." *(sic — "메세지", non-standard spelling of "메시지")* |
| 시인성 | **Recognizability** | "대비와 조화를 통해 선명하게 표현하여 높은 가시성을 제공해요." |
| 일관성 | **Consistency** | "시각적 일관성을 갖춰 서비스의 통일성을 유지해요." |

## UX Writing 원칙 — frame `3`

| 원칙 | English | 설명 (verbatim) |
|---|---|---|
| 명료한 | **Clear** | "사용자 관점에서 고민 없이 한눈에 이해되는 문장을 써요." |
| 간결한 | **Concise** | "정보를 빠르게 스캔할 수 있도록 꼭 필요한 핵심만 전달해요." |
| 공감하는 | **Empathetic** | "고객의 상황을 살피고 정서적으로 연결되어 있다는 느낌을 주세요." |
| 신뢰를 주는 | **Trustworthy** | "과장 없는 정직한 정보 전달로 단단한 믿음을 쌓아요." |

## Interaction 원칙 — frame `4`

**Only 3 principles** — the one category that doesn't have 4.

| 원칙 | English | 설명 (verbatim) |
|---|---|---|
| 예측 가능한 | **Predictable** | "예측 가능한 동적 요소로 사용자의 행동을 유도해요." |
| 즉각적인 | **Immediate Feedback** | "행동에 대한 즉각적인 피드백으로 사용자의 투자 경험을 도와요." |
| 목적 중심의 | **Goal-oriented** | "보기 좋은 결과물을 위함이 아닌 목적을 위한 움직임을 설계해요." |

## Cross-references — which guide implements which principle

Useful when a specific guide is silent and you need to reason from first principles:

| Principle | Implemented concretely by |
|---|---|
| Graphic 시인성 (Recognizability) — "대비와 조화를 통해 선명하게" | `nds-ux-guide-color-contrast` (4.5:1 / 3:1 / label exception) |
| UI·UX Instinct — "필요한 정보를 바로 확인" | `nds-ux-guide-search` (bar type follows purpose), `nds-ux-guide-empty-state` |
| UI·UX Seamless — "원하는 목표까지 매끄럽게" | `nds-ux-guide-touch-area` (thumb zone, one action per row), `nds-ux-guide-date-picker` |
| UI·UX Hierarchy — "핵심 행동을 유도" | `nds-ux-guide-account-controller` (원칙 3/4), `nds-ux-guide-popup` (type selection) |
| UI·UX consistent — "매번 학습하지 않도록" | `nds-ux-guide-tab` ("is it even a tab?"), `nds-ux-guide-share` (app vs web) |
| UX Writing 명료한/간결한 | `nds-ux-guide-completion-popup`, `nds-ux-guide-currency-notation`, `nds-ux-guide-alimtalk` (두괄식, outcome-first) |
| UX Writing 공감하는 | `nds-ux-guide-empty-state` (`-어요` ending, "merchandising not error"), `nds-ux-guide-nudge` (넛징 copy) |
| UX Writing 신뢰를 주는 — "과장 없는 정직한 정보" | `nds-ux-guide-precautions` (disclaimers), `nds-ux-guide-consent` (gated CTA) |
| Interaction Immediate Feedback | `nds-ux-guide-nudge` (토스트 2~3초 status feedback) |
| Product Minimum Thinking — "필요한 선택만 남기고" | `nds-ux-guide-account-controller` ("메인 액션은 하나로 제한"), `nds-ux-guide-touch-area` (one primary action per row/card) |

## How this feeds BUILD mode

These are **tiebreakers and defaults**, not measurable specs — the concrete numbers live in the per-topic guides. Use them when:

1. **A specific guide is silent.** Two guides have literally blank specs (`nds-ux-guide-nudge`: toast 최대 글자수 marked `논의`, snackbar 지속시간 empty). Reason from Interaction **Immediate Feedback** and UX Writing **간결한** — but still flag the gap rather than inventing a number.
2. **Two options both satisfy the rules.** Prefer the one with fewer choices (**Minimum Thinking**), that shows value before asking for cost (**Value First, Cost Later**), and that leads with the highest-impact item (**Impact First**).
3. **Justifying a design decision to a stakeholder.** Cite the principle by its Korean+English name — this page is the design team's own shared vocabulary.
4. **Reviewing copy.** 명료한 / 간결한 / 공감하는 / 신뢰를 주는 is the 4-point checklist the UX-writing guides all descend from. "과장 없는 정직한 정보 전달" (Trustworthy) is the direct basis for never over-promising in 유의사항/consent copy.
5. **Reviewing motion.** Interaction **Goal-oriented** is explicitly anti-decorative: *"보기 좋은 결과물을 위함이 아닌 목적을 위한 움직임을 설계해요."* Don't add animation for polish alone.
