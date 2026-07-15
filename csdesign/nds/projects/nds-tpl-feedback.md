---
name: nds-tpl-feedback
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=42528-7438"
learned_date: 2026-07-15
sections_studied:
  - "42528:7438 (page canvas '    - 의견 남기기' — title frame 42556:1307 on-canvas '의견 남기기' / 'QV-NM Template Guide')"
  - "42556:1311/42556:1318 (sample page — feedback-entry banners: btn CTA '더 보고 싶은 정보가 있으신가요? 의견을 자유롭게 남겨주세요!'; nmoji banner '현재가 개선을 위한 의견을 들려주세요')"
  - "42556:1345 선택형_통합검색 검색결과 (OX-type feedback flow — 의견_bad/의견_good states, completion popup, GA태깅 mini-table)"
  - "42556:1621 척도형_투자 상담 완료후 (개발 필요) (5-point-scale feedback flow — ms_btn_fav rating row + textarea + completion popup)"
  - "42556:1972 서술형_AI 잔고분석 서비스 하단 (open-text-only feedback flow — same textarea, char-limit variants 0/50 and 0/100)"
  - "42548:37664 Survey Usage (prose rules panel: entry-point types, input-type selection, completion/feedback message, Do/Don't) — Last update 2026.04.17 우채희"
  - "42569:42624 '03' (Do panel, ON_CLICK swap target) / 42569:42637 '04' (Don't panel, ON_CLICK swap target) — same rules restated with icon mockups (헤더 아이콘 진입점 / 넛징 응답 유도 / 너무 긴 안내)"
  - "42722:8406 의견모으기 GA태깅 가이드 (mini GA4 tagging table: OX선택형/5점척도형/주관식 event schemas)"
status: internal NDS component-library guide (Templates file — mostly usage-example gallery, but ALSO carries a genuine prescriptive rules panel, a Gotcha-7 exception)
---

# NDS Templates — 의견 남기기 (Feedback)

Single page (title on-canvas confirmed: **"의견 남기기" / "QV-NM Template Guide"**). Shows 3 parallel feedback-form patterns (OX-type, 5-point-scale, open-text-only), each composed as full-screen mockups with completion popups, plus a standalone **"Survey Usage" prose rules panel** and a small embedded GA4-tagging spec table.

## Layer names — confirmed reliable (title frame screenshot-matched exactly)

## Gotcha 7 — a genuine exception, arguably the strongest yet

**This page STATES rules, not just shows them.** The "Survey Usage" panel (`42548:37664`, screenshot-confirmed, verbatim below) prescribes: (1) three entry-point types with exposure-timing + trait notes (서비스 하단/중간 배너/트리거), (2) three input-type choices tied to data purpose (OX 선택/5점 척도/주관식), (3) a prescribed **completion message example** ("소중한 의견 감사해요! 꼼꼼히 읽어보고 더 나은 나무가 될게요."), a prescribed **UX Action** (확인 button returns user to prior screen), and (4) a **Do/Don't** list. This is more complete than the GA4-Tagging page (which only taught by example) and comparable to the 아티클 page's type-ramp declaration — but with an explicit prescriptive Don't list neither of those has. `Last update 2026.04.17 우채희`.

## Component keys — Gotcha 5, 3 explicit-ID checks, all INSTANCE + remote:true

| Instance | main COMPONENT name | main key | remote | parent SET | parent SET key |
|---|---|---|---|---|---|
| `42574:23577` ms_btn_fav (rating icon) | `Type=solid, Active=on` | `4e7a58aab49fa370c1357e3243d61a97df38eb06` | true | `ms_btn_fav` | `7de2ee3f5b060982bedb028b44e33aa57955098d` |
| `42556:1353` btn_bottom_layerpopup (popup CTA) | `Channel=NM, Type=1-btn, Status=normal` | `1757f54b8bd8db6aa96fb5fa1f6adba2075daeb9` | true | `btn_bottom_layerpopup` | `c2adcc07146493541681ee77243a945154819866` |
| `42556:1315` btn_container_regular | `Strength=4(line), Height=h54, Status=normal` | `5a230f33809ce46b16b3bb811dc4993f4678932d` | true | `btn_container_regular` | `fd0a4e2fd7b3c49612b27963bd8bf41f1580910b` |

`btn_container_regular` parent SET key (`fd0a4e2f…`) is byte-identical to the key recorded on `nds-tpl-no-data` — corroborates Core again, consistent with Q4 (subscribed library).

## TAXONOMY — artifacts and reactions

3 top-level feedback-flow artifacts (OX / 5-point-scale / open-text), each a composed screen family with its own completion popup — same "usage-example gallery" shape as prior pages. **`.reactions` swept across the whole page: 24 found (non-zero, unlike most prior probes)** — but all are internal micro-interactions, not cross-screen navigation: cursor-blink `AFTER_TIMEOUT` loops inside the textarea mockups, `ON_CLICK` swaps between the Survey-Usage panel's own numbered sub-panels (`01`/`02`/`03`/`04`), and a toast open/close pair. **Zero `navTarget` values point to a different top-level artifact** — confirms the established "no cross-screen flow" pattern even where reaction count is non-trivial.

## ANSWERS

**Q1 — Input surface: a distinct hand-composed textarea, NOT input_line/input_box/input line_certify.** Grepped the full page tree for those 3 names — zero matches anywhere. Every feedback-entry field on this page is the same hand-built pattern: a frame named `input area` (or `Group 9653`) containing a rounded-rectangle `Rectangle 6040` background, a `커서` (cursor) rounded-rectangle, a placeholder/filled TEXT node, and a live character counter (`0/50`, `10/50`, `17/50`, `0/100`, `100/100` — limits vary 50 vs 100 by flow). This is unkeyed (plain FRAME/rectangle/text, no SET, no INSTANCE) — a genuine Core gap: no textarea component exists in the library; this page fills it only as "no such component exists," same shape as `nds-tpl-faq`'s accordion finding. Separately, the **rating surface for the 5-point-scale flow is `ms_btn_fav`, a real remote SET** (table above) — fills the Core rating gap with a genuine key.

**Q2 — Gotcha 8, copy compliance: COMPLIANT, not drift.** Every completion-popup body string transcribed verbatim, screenshot-confirmed:
- OX flow (`42556:1348`) / 5-point-scale flow (`42556:1687`): **"소중한 의견 남겨주셔서 감사해요.\n더 나은 검색이 될게요."** — ending **-어요** ✓, CTA **"확인"**.
- Open-text flow (`42556:2045`, dim-backed popup): **"소중한 의견 감사해요.\n더 좋은 서비스 제공을 위해 참고할게요!"** — ending **-어요** ✓, CTA **"확인"**.
- None of the 3 observed completion headlines contain **완료** — they use 감사(thanks)-framed copy instead, a different pattern from `nds-tpl-completion-popup`'s 완료/실패 headline convention (that page's mandate doesn't literally apply here — this is a thank-you toast, not a success/failure state).
- The Survey Usage panel's *prescribed* example message — **"소중한 의견 감사해요! 꼼꼼히 읽어보고 더 나은 나무가 될게요."** — matches the *actual* shipped copy almost exactly (실제 구현 copy swaps "될게요" object from "나무" to "검색"/"서비스", i.e. contextualized per surface, but keeps the -어요 ending and 감사 framing). **This is the cleanest guide↔implementation agreement found in this library**, on par with `nds-tpl-share`.
- No validation/error copy exists anywhere on this page — grepped for 필수/초과/에러/invalid, zero hits. The textarea has a hard character cap (via counter) but no visible over-limit error string like `nds-tpl-text-fields`'s `…초과했습니다.` — **blank at source**.
- Field prompts (verbatim, all end in `-나요?` interrogative, not the -어요/-습니다 axis): "어떤 점이 만족스러우셨나요?" / "어떤 점이 불만족스러우셨나요?" / "구체적인 고객님의 의견이 궁금해요." / "검색 결과에 대한 김나무님의 의견이 궁금해요." (personalized with a placeholder customer name).

## BLANKS / gaps

- No textarea/rating component exists in Core — confirmed absent, not just unchecked.
- No validation/error copy found on this page (feedback appears optional, no required-field enforcement visible).
- Two stray "토스트/체결알림 정의" text nodes present (`42556:1337` etc.) — same off-topic noise pattern seen on `nds-tpl-no-data`; not screenshot-confirmed, flagged as leftover, not content.
- The "NH데이터탭" dashboard mockup block embedded mid-page (`42569:42646` onward) is unrelated stray content, not screenshotted (low priority, off-topic).
- Only 3 of many instances key-checked (read-only-session sampling per Gotcha 5 rule) — `input_line`/`input_box`/`input line_certify` absence is confirmed by name-grep across the full metadata dump, not by individual key lookups (moot, since none of those names appear at all).

## CORE

Add: **no textarea component in NDS_Library** (confirmed absent a 2nd time, `nds-tpl-faq`-style gap). **`ms_btn_fav` SET `7de2ee3f5b060982bedb028b44e33aa57955098d`** = the real rating/heart-icon component for 5-point-scale UIs — new Core entry, fills the "no rating entry" gap noted in the brief.
