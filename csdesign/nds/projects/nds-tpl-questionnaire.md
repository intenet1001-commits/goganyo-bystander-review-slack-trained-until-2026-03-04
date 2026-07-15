---
name: nds-tpl-questionnaire
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=27668-54043"
learned_date: 2026-07-15
sections_studied:
  - "27668:54043 (page canvas '    - 질문지 등록' — title text 27668:54253 on-canvas '투자자 정보 등록 UI')"
  - "27668:54044 / 27668:54102 (로보투정_질문지_step1 ×2 variants — default vs one row 'active' — 투자기간 선택 question)"
  - "27668:54255 / 27668:54284 (로보투정_질문지_step4 ×2 variants — default vs one row 'active' — 금융상품 이해도 선택 question)"
status: internal NDS component-library guide (Templates file — 4-artifact gallery, not a flow; last of 39 content pages, coverage now complete)
---

# NDS Templates — 질문지 등록

Small page: 4 top-level frames, two pairs of (step1, step4) variants of one questionnaire screen shell. On-canvas section label (`27668:54253`): **"투자자 정보 등록 UI"**. In-header title (screenshot-confirmed, both steps): **"로보 투자자정보 등록"**.

## ANSWER 1 — what IS this?

**Resolved, not ambiguous.** The header title "로보 투자자정보 등록" ("Robo [advisor] investor-information registration") plus the on-canvas section label "투자자 정보 등록 UI" identify this as the **투자성향 진단-family questionnaire** for a robo-advisor onboarding flow — an investor-profile/suitability form, not an admin question-authoring tool. Step 1 asks investment horizon (투자기간 선택); step 4 asks financial-product literacy (금융상품 이해도 선택) — both canonical KOFIA-style 투자성향 진단 items. A `gauge` progress-step instance (`Step=4, No.=1` on step1) confirms a ≥4-step wizard, consistent with a multi-question suitability form, not a single admin CRUD screen.

## ANSWER 2 — radio_basic / radio_btn: still NOT sighted

Each single-select option row uses **`check_icon_line`** (SET `0598f4c21dd68667d15d34875f12c1b3e1176c34` = Core exactly, remote) as the selection affordance — not `radio_basic` (`91f58f3a…`) or `radio_btn` (`1a972d99…`). One row per screen carries frame-name `active` (step1's 4th row, step4's 3rd row) vs `default` elsewhere — a single-select radio-like pattern **implemented with the checkmark component, not a radio component**. Across all 4 files/pages checked to date, **Core's radio keys remain unconfirmed on any live page** — this is the fourth and final miss, not the first sighting.

## ANSWER 3 — Gotcha 8 copy compliance

Every string transcribed verbatim (screenshot-confirmed, layer names **reliable** — match on-canvas exactly):

| Node | String | Notes |
|---|---|---|
| Header title | 로보 투자자정보 등록 | both steps |
| Step1 label | 투자기간 선택 | |
| Step1 question | 현재 자금으로 투자기간은 얼마나 예상하나요? | ends `-나요?` |
| Step1 options | 1년이내로 · 1년 이상 ~ 5년 미만 까지 · 5년 이상 ~ 10년 미만 까지 · 10년이상 ~ 20년 미만 까지 · 20년 이상 | |
| Step4 label | 금융상품 이해도 선택 | |
| Step4 question | 금융상품에 대해 얼마나 알고 계신가요? | ends `-가요?` |
| Step4 options | 시중은행 예금, 적금 정도만 · CMA,RP 등 초저위험 금융상품까지 · 주식, 채권 등 잘알려진 금융상품을 일정부분 · 주식, 채권 등 잘 알려진 금융상품을 깊이있게 · 파생상품을 포함한 대부분의 금융상품을 전부 | |
| Bottom buttons | 이전 · 다음 | |

Both question sentences end **`-나요?`/`-가요?`** — the informal-polite interrogative register, in the same family as the guide-mandated `-어요` (not the redlined `-습니다`). **No `-습니다` anywhere on this page — fully compliant with the ending-style side of the rule.** **No validation/error copy and no completion state exist on this page** (only two mid-flow question steps, no submit/confirm/completion frame) — **blank at source, not a drift**; cannot check the `완료` criterion here. Do not infer a completion screen exists elsewhere in this flow from this page alone.

## Keys

| Instance | main COMPONENT name | main key | remote | parent SET name | parent SET key |
|---|---|---|---|---|---|
| `check_icon_line` | `Channel=NM, Status=normal` | `2ba0a9b18aeff6007483454c3a8c2c6cadd4d996` | true | `check_icon_line` | `0598f4c21dd68667d15d34875f12c1b3e1176c34` = Core exactly |
| `statusbar` | `Type=NM, Dark mode=false` | `e5e2a9f9fc56a1b50a96ab0569e8f9a3dd7649cf` | true | `statusbar` | `b4d07422e1eedeb9f1ae4b831e905357e54b01a6` — matches `nds-tpl-buy-method-select`'s key, a distinct member of the collision family (Gotcha 5b) |
| `header_basic` | `Channel=NM, Left Icon=on, Right Icon=off` | `c7706f72a18d458759548113071367745adc8d96` | true | `header_basic` | `c95043e94317fde7230298017f42dd8099e1cbdc` = Core exactly |
| `gauge` | `Step=4, No.=1` | `0376e697c278b385d75f940f933103055372986a` | true | `gauge` | `221d620b9fdb17b67d6c623aeaaa5c6c93aa667a` — **new, not in Core**: a wizard step-progress bar, distinct from `nds-tpl-indicators`' `step_header`/`pagination01` |
| `btn_bottom_page` | `Channel=NM, Type=2-btn, Status=normal` | `8e51feb08dd81e4f0bc6f32c6da649981de37097` | true | `btn_bottom_page` | `accfb243ce752fd894af2b6db081b1074022a39d` — matches the non-Core `btn_bottom_page` family (≠ Core's `btn_bottom_page_assets`) |

5/5 sampled instances confirmed INSTANCE before key-read; all `remote: true`. All 5 keys corroborate prior findings in this file (Core hits for `check_icon_line`/`header_basic`; known non-Core collision families for `statusbar`/`btn_bottom_page`); `gauge` is a genuine new addition worth promoting to Core.

## Taxonomy / reactions

4 top-level frames, `.reactions` swept on all — **0 reactions on every frame, 0 nested reactions found in either subtree**. A **fourth confirmation** that `📱Sample Page`/gallery frames carry zero prototype links: no counter-example found here either.

## Names

Layer names **reliable** — screenshot-confirmed against both step frames; every text-node layer name matches its on-canvas rendering exactly (question text, option labels, section labels).

## Blanks / gaps

- No completion/submit/confirm frame exists on this page — the flow's end state is unlearned (out of scope: not present here).
- No validation/error-state copy present.
- Only steps 1 and 4 of an implied ≥4-step wizard are shown; steps 2–3 are not on this page.
- Coverage note: this closes NDS_Templates at **39/39 content pages** per `figma.root.children` (see `LEADER.md`).
