---
name: nds-tpl-buy-method-select
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=31836-5060"
learned_date: 2026-07-15
sections_studied:
  - "31836:5060 (page '    - 매수방법 선택' — 5 top-level artifacts + 1 stray canvas text note, no prototype links between any of them)"
  - "31836:5293/31836:5358 (해외주식 잔고손익 → 상담공통팝업01 — '주문 방식 선택' bottom sheet: 일반 매수 / 소수점 매수 / 주식 모으기 cards)"
  - "32649:11781 / 32649:11806 (계좌선택팝업_계좌선택 — near-identical duplicates, '매수 주문 유형 선택' — price-type list: 보통가/시장가/프리마켓/애프터마켓/주간거래/LOO/LOC...)"
  - "45257:6845 ([NM]국내주식_주문_매수_KRX — composed KRX buy order screen with '다른 주문 방법' popup: 예약주문/시세포착/주식 모으기/소수점 매수)"
  - "45257:7197 ([NM]국내주식_주문_매도_통합시세 — composed SELL order screen (매도, not 매수) with same '다른 주문 방법' popup shell but only 2 rows: 예약주문/시세포착)"
  - "45257:8233 (loose canvas text '해외주식은 실험결과 전체배포할때 업데이트 예정' — off-topic note, not an artifact)"
status: internal NDS component-library guide (Templates file — usage-example gallery of order-method-selection popups, not a prose rules source, not a flow)
---

# NDS_Templates — 매수방법 선택 (Buy Method Select)

Page `31836:5060`. **5 top-level artifacts, zero prototype links between any of them** (confirmed via `reactions` sweep — only 2 reactions exist anywhere on the page, both internal `CHANGE_TO` variant swaps baked into a `market_switcher` instance, destination `45257:5575`, unrelated to inter-artifact navigation). Despite the singular page title, this page actually shows **three structurally different "choose how to buy" popups**, not one flow and not one component:

1. **`주문 방식 선택`** (`31836:5358`) — channel/cadence selector: **일반 매수** (1주 단위로 주문) / **소수점 매수** (금액으로 주문) / **주식 모으기** (주기마다 주문, `FREE` badge). This is the page's namesake pattern.
2. **`매수 주문 유형 선택`** (`32649:11781`, duplicated verbatim at `32649:11806`) — a *different* concept: **order price-type** selector (보통가/지정가, 시장가, 프리마켓(지정가), 애프터마켓(지정가), 주간거래(지정가), LOO(장개시 지정가), LOC(장마감 지정가)...). Confirms Not the same as (1) despite both being "매수 관련 선택" popups.
3. **`다른 주문 방법`** (`45257:6947` inside the KRX buy screen; `45257:7353` inside the sell screen) — an *entry-point* popup offering 예약주문/시세포착/(주식 모으기/소수점 매수 — buy-only). The sell-screen variant is a shorter subset (2 rows vs 4), same shell reused across buy/sell.

## Layer names — MIXED (screenshot-confirmed)

- **Reliable half**: text nodes literally named by their rendered content match exactly — `1주 단위로 주문`, `금액으로 주문`, `주기마다 주문` (subtitle rows), and popup title `주문 방식 선택` / `매수 주문 유형 선택` / `다른 주문 방법` all render verbatim as named.
- **Unreliable half**: the three card *headlines* that actually carry the pattern's real labels are named generically `TXT` (`31836:5365`, `31836:5370`, `31836:5375`) yet render as **일반 매수 / 소수점 매수 / 주식 모으기** — a metadata-only read would show nothing true here, matching the skill's warning ("TEXT node names can be pure placeholder").

## Tiers (`getMainComponentAsync()` → `.remote`, 4 explicit-node samples)

| Instance | main COMPONENT name | main key | remote | parent SET | parent SET key |
|---|---|---|---|---|---|
| `31836:5378` btn_bottom_page | `Channel=btn_bottom_layerpopup, Type=btn_bottom_page, Status=NM` | `3ef42b8dfd48baf9ff4c1572dd2a4de8264bfee7` | true | `btn_bottom_page` | `accfb243ce752fd894af2b6db081b1074022a39d` |
| `45257:6893` statusbar | `Type=NM, Dark mode=false` | `e5e2a9f9fc56a1b50a96ab0569e8f9a3dd7649cf` | true | `statusbar` | `b4d07422e1eedeb9f1ae4b831e905357e54b01a6` |
| `32649:11785` account_popup_assets | `account_popup_assets` (standalone COMPONENT, no SET) | `8a191be6526d9be4b8a6af2ee27ba614a80bea27` | true | — | — |
| `31836:5363` nds_infographic12 | `nds_infographic12` (standalone COMPONENT, no SET) | `66f266d05c2ba471905275d0349247d502fa065f` | true | — | — |

TIERS: 4/4 remote, 0 local, 0 unverified (of the sampled set). One additional node, `45257:6846` "국내주식 주문 공통", errored on `getMainComponentAsync` — it is a **FRAME**, not an INSTANCE (hand-built local scaffolding sharing the name of the remote base-screen component seen elsewhere), so it carries no key at all — see ANSWERS below.

## TAXONOMY (assigned question)

**5 top-level artifacts, ZERO prototype links, parallel component-page — not a flow. This confirms the "product order flows" description is dead for good.**

- No reactions chain any of the 5 top-level frames to each other (or to any other page). The only 2 reactions on the whole page are a variant-swap baked inside a `market_switcher` instance — internal component state, not navigation.
- The artifacts aren't sequential steps of one journey; they're **three independent popup patterns** (order-frequency picker, price-type picker, other-order-method entry list) shown once each, plus a near-duplicate (`32649:11806` is a verbatim copy of `32649:11781`) and a buy/sell shell reuse (`45257:6947`/`45257:7353`).
- Together with `42129:7390` (매매 주문 확인, also 0 links / 3 parallel artifacts), **both halves of the "order journey" this Core reference used as its flagship example are galleries, not flows.** The "Full page templates (e.g. product order flows)" description in the Libraries table has now failed on the two strongest candidate pages in the file. Treat it as dead — this library is composition/usage examples, full stop.

## ANSWERS (relation to `nds-tpl-trade-order-confirm`)

**No shared componentKeys, and the buy→confirm sequence is nowhere expressed — only implied by page names.**

- `국내주식 주문 공통` reappears **by name only**. On `nds-tpl-trade-order-confirm` it was a remote **INSTANCE** (`42129:12697`, key `057e29c977538fefecae14a2d970b6f87c7995d2`). Here (`45257:6846`, `45257:7198`) it is a plain **FRAME** — local, hand-composed, not an instance of anything, no key. Same label, structurally unrelated node — another instance of the Gotcha-5-style name collision, one level worse (not even the same node *kind*).
- `btn_bottom_layerpopup` does not appear anywhere in this page's metadata at all (searched the full XML dump — only `btn_bottom_page`, `btn_container_regular`, `btn_order_container` are present).
- The local `간편매수_확인_popup` COMPONENT from the confirm page does not appear here either.
- **No prototype link, annotation, or connector anywhere on this page points at `42129:7390` or any of its child node IDs.** The only signal that 매수방법 선택 precedes 매매 주문 확인 is the **page names themselves** (and general domain knowledge of a buy flow) — nothing in the Figma structure encodes the sequence. Consistent with the file-wide pattern: this library shows isolated moments, never wires them together.

## BLANKS

- Page-wide instance sweep not attempted (read-only risk) — only 4 explicit-ID components key-verified; `TAB`, `header_stock`, `quickmenu_basic`, `combo_box`, `3Depth_Stock`, `Table_cell`/`Table_header`, `check_icon_solid`, `nds_icon_*` family, `nds_nmoji*` instances not individually key-checked (names read reliably per screenshot spot-checks above, per the same convention observed elsewhere in this file).
- `32649:11803` / `32649:11828` (`Group 9523`, gradient/rect footer decoration) are `hidden="true"` — not screenshotted, not quoted as rules per the hidden-frame rule.
- No prose usage rules found anywhere on this page (matches every other NDS_Templates page learned so far) — pure example gallery, confirms Gotcha 7 again.
- Whether `일반 매수` / `소수점 매수` / `주식 모으기` correspond 1:1 to real product features, or whether the price-type list (보통가/LOO/LOC/...) is complete/current, cannot be confirmed from this page alone — no changelog or spec text present.

## CORE

None — no new componentKey, variant axis, or token correction to promote. The `국내주식 주문 공통` name-vs-node-kind mismatch (remote INSTANCE elsewhere, local FRAME here) is worth folding into Gotcha 5 as a sharper example in a future LEADER.md pass, but per instructions this agent does not touch LEADER.md.
