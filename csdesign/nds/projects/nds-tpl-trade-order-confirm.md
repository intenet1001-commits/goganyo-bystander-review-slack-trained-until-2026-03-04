---
name: nds-tpl-trade-order-confirm
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=42129-7390"
learned_date: 2026-07-15
sections_studied:
  - "42129:7390 (page '    - 매매 주문 확인' — 3 top-level artifacts, no prototype links between them)"
  - "42129:10645 (frame '간편매수_확인' — overseas easy-buy confirm popup, local COMPONENT '간편매수_확인_popup' at 42129:10647)"
  - "42129:12696 (frame '[NM]국내주식_주문_매수_KRX' — domestic KRX buy confirm layer-popup composed over base order screen)"
  - "42129:13837 (top-level instance '[NM]국내주식_주문_잔고_일괄매도 주문 팝업' — bulk-sell selection popup, a DIFFERENT sub-pattern despite the shared page name)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen)
---

# NDS_Templates — 매매 주문 확인 (Trade Order Confirm)

Page `42129:7390` in **NDS_Templates** (`1xE0qvn2yv3ZkQ9BwhKT1y`). Contains exactly **3 top-level artifacts**, each a single composed screen (dimmed background context + one popup), with **no prototype connections/reactions found in the metadata between them** — they are parallel examples of the confirm-popup pattern in different order contexts, not sequential steps of one journey.

## Artifact 1 — `간편매수_확인` (`42129:10645`)
Overseas easy-buy ("간편매수") confirmation popup. On-canvas title reads **"매수 주문 확인"**. Real content example: 테슬라(TSLA), 계좌번호 `201-02-123456 김나무`, 시장구분 `정규장`, 매수단가 `216.47 USD`, 매수수량 `1주`, 예상 주문금액 `423,567원 / 267.05 USD`. Bottom bar: 이전 (gray) / 매수 (red CTA). Built from a **local COMPONENT**, `간편매수_확인_popup` (`42129:10647`, type `COMPONENT`, **not an instance of a remote main component** — page-local scaffolding, not a published library piece).

## Artifact 2 — `[NM]국내주식_주문_매수_KRX` (`42129:12696`)
Domestic KRX buy order confirm, composed as a **layer popup over a live base screen**. On-canvas title reads **"현금매수 주문확인"**. Base screen is instance `국내주식 주문 공통` (`42129:12697`, remote, key `057e29c977538fefecae14a2d970b6f87c7995d2`) showing a real 현재가 screen (종목 NH투자증권, 70,100원). The popup itself (`contents` frame `42129:12749`) is a **title + 7-row key/value table** built from real `Table_cell`/`Table_header` instances, plus `btn_bottom_layerpopup` (2-btn 취소/주문전송). Table rows confirmed on screenshot: 계좌번호 `210-00-000000`, 계좌명, 종목코드 `123456`, 종목명 `NH투자증권`, 거래소 `스마트 (SOR)`, 매매유형 `보통가(지정가)`, 매수수량 `1주`, 매수단가 `52,000`.

Also holds a separate un-popped-up drafting area at the frame's other coordinates (`sum`/`주문금액`/`check_combine_txt` groups) — a **금액 지정 buy-entry mock**, not part of the popup itself; likely a leftover/adjacent working area on the same frame rather than a second screen.

## Artifact 3 — `[NM]국내주식_주문_잔고_일괄매도 주문 팝업` (`42129:13837`, top-level INSTANCE)
On-canvas title reads **"일괄매도 주문"** — a **bulk-sell selection list**, not a confirmation summary: account picker (`123-45-678891 [종합매매] 김나무`), helper text "최대 60개 종목을 선택하여 한 번에 매도할 수 있습니다.", a checkbox-driven table (종목명/구분, 가능수량/평가금액, 매입가/현재가, 대출...) with repeated 에스티아이 rows, footer `닫기` / `30건 일괄매도`. Confirmed `remote: true`, key `df912b606cf16222ceabd292a814b9e69de57800` — this is itself a **published NDS_Templates component** (a full composed screen), not a local mock. **This is structurally a different UI pattern (multi-select order list) from Artifacts 1–2 (single-item confirm summary)** even though the page groups it under the same "주문 확인" name.

## Layer-name convention — confirmed reliable for this page
All 3 top-level layer names match their on-canvas headline content: `간편매수_확인` → "매수 주문 확인"; `[NM]국내주식_주문_매수_KRX` → "현금매수 주문확인"; `[NM]국내주식_주문_잔고_일괄매도 주문 팝업` → "일괄매도 주문". No frame-vs-heading mismatch observed on this page (contrast the NDS_UX Guide, where this mismatch was pervasive).

## Component tiers (`getMainComponentAsync()` → `.remote`)
Sampled 10 nodes: `nds_icon_info`, `3Depth_Stock`, `nds_icon_minus`, `nds_icon_plus`, `check_icon_solid`, `Table_cell`, `Table_header`, `btn_bottom_layerpopup`, `국내주식 주문 공통`, `[NM]국내주식_주문_잔고_일괄매도 주문 팝업` — **all 9 INSTANCEs resolved `remote: true`** with distinct componentKeys (e.g. `Table_cell` → `5d5243c0a77ea31c1dc15832ab9d206d21bf7650`, `btn_bottom_layerpopup` → `326337818c7ad746e5d0b144a9ea78355a3c2878`). One node, `간편매수_확인_popup`, is a **local `COMPONENT` (not an instance)** — page-local scaffolding, no key to import.

## ANSWERS — Taxonomy (assigned question)
**Component/pattern page (a small gallery of the confirm-popup pattern), NOT a multi-screen flow, leaning hybrid only in that each example is a *fully composed* screen (base screen + popup) rather than an isolated bare component.**

Evidence:
- **3 top-level artifacts, zero prototype links between them** — no reactions/interactions chain one screen to the next in metadata; each is a static, self-contained popup-over-background snapshot.
- **Different order contexts, not sequential steps**: overseas easy-buy, domestic KRX buy, and bulk sell are three independent product scenarios showing the same UI idea (an order confirmation/selection popup), not stage 1→2→3 of one order journey.
- **Artifact 3 is a structurally different pattern** (multi-select list, not single-item confirm) despite sharing the page's "주문 확인" framing — further evidence this is a curated set of examples, not one coherent flow.
- Contrast with a true flow: a flow would show consecutive full screens (e.g. entry → confirm → result) connected by navigation; this page shows only the **confirm/selection moment**, once per context, each frozen with its dimmed background.

**Conclusion for the later wave of ~9 flow-candidate pages**: page names resembling "product order flows" per the Core reference's description may still resolve to single-moment popup galleries like this one rather than true multi-screen journeys — verify per page via prototype-link/reaction absence and artifact count, don't assume from the name alone.

## BLANKS
None found blank at source on this page — all sampled fields and table rows carried real content.

## CORE
None — no new componentKey, variant axis, or token correction to promote to Core reference; `Table_cell`/`Table_header`/`btn_bottom_layerpopup` keys observed here are consistent with prior NDS_Templates learnings (real, `remote: true`, per LEADER.md's pre-loaded verdict).
