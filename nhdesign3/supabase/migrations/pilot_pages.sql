-- Pilot pass: 3 pages of NDS_Templates, chosen for diversity (simple/token page,
-- placeholder-heavy icon-naming page, Korean full-screen mockup) to verify the
-- learn -> verbatim-quote -> DB-write loop before scaling to all 39 pages.

with src as (
  select id from nhdesign_sources where file_key = '1xE0qvn2yv3ZkQ9BwhKT1y'
)
insert into nhdesign_pages (source_id, node_id, page_name, kebab_slug, naming_convention, content_md, sections_studied, status)
select id, '9665:20994', '- Padding  여백', 'nds-tpl-padding', 'partially-reliable', $$
## Padding / spacing tokens

Screenshotted frame `9667:19162` ("Guide") — the spacing-callout overlay on top of a sample
content screen. Verbatim spacing labels found, top to bottom:

- `60px`
- `60px`
- `60px`
- `80px`
- `60px`

These are vertical gaps between named guide rectangles (`Rectangle 5946`..`5951`) laid over
the "Topbar_Dropdown" sample content — i.e. this page documents section-to-section vertical
spacing as 60px standard / 80px for one specific gap (near "Group 9196", y=1861..1941).

**Layer names are NOT reliable for this page's own subject matter** — the underlying content
frame (`NM_요즘테마_채권`) is filled with unrelated demo copy about bond investing
("채권은 어떤 방법으로 투자할 수 있나요?" etc.) used only as filler to show real content density.
Do not mistake this demo copy for a padding rule. The rule is exclusively the `60px`/`80px`
badges in the Guide overlay frame.

**Gap**: no callout distinguishes *when* 80px applies vs 60px beyond position — the source
does not label the two spacing values with named contexts. Escalate rather than infer.
$$, array['Guide overlay spacing badges'], 'learned'
from src
union all
select id, '32758:4146', '- Header 헤더', 'nds-tpl-header', 'unreliable', $$
## Header — icon naming convention

Screenshotted frame `32762:4295` (naming-convention callout, one of several annotation
groups on this page). Verbatim:

- 컴포넌트명 (component name) label points to: `nds_icon_header`
- 아이콘명 (icon name) label points to: `nds_icon_header_tooltip`

Pattern confirmed: header icon instances are named `nds_icon_header_(타입)(컬러숫자)` per a
second on-page text annotation (`아이콘명 nds_icon_header_(타입)(컬러숫자)`), with worked
examples also present verbatim: `nds_icon_header_mic`, `nds_icon_header_back06` (dark
background / white icon), `nds_icon_header_bell02` (light background / grey icon).

**Layer names are UNRELIABLE elsewhere on this page** — confirmed the exact failure mode
`figma-learn-all-pages` warns about: multiple unrelated TEXT nodes (annotation captions for
different frames entirely) are all literally named `토스트/체결알림 정의`, a leftover label
that has nothing to do with what each one actually annotates. Every rule on this page was
recovered from screenshot content, not from node names.

Page also contains many `header_basic` component instances (icon-variant matrix, 14 rows) and
a separate `마이데이터등록/관리` (MyData registration/management) screen mockup — not yet
transcribed; flagging as present but unlearned in this pilot pass.
$$, array['icon naming-convention callouts'], 'learned'
from src
union all
select id, '42129:7390', '- 매매 주문 확인', 'nds-tpl-trade-order-confirm', 'reliable-via-screenshot', $$
## Trade order confirmation popup (현금매수 주문확인)

Screenshotted frame `42129:12696` ("[NM]국내주식_주문_매수_KRX" — domestic stock buy order,
KRX exchange). This is a rendered mobile mockup, not a token/spec page — copy is real, not
placeholder, confirmed by the screenshot (layer names inside are structural/English
(`sum`, `select`, `txt`) and don't carry the copy themselves — the screenshot is authoritative).

Verbatim popup title: `현금매수 주문확인` (cash-buy order confirmation)

Verbatim field rows (label — value), top to bottom:
- 계좌번호 (account number) — `210-00-000000`
- 계좌명 (account name) — `계좌명` (placeholder text, literally "account name")
- 종목코드 (ticker code) — `123456`
- 종목명 (ticker name) — `NH투자증권`
- 거래소 (exchange) — `스마트 (SOR)`
- 매매유형 (order type) — `보통가(지정가)` (market/limit — "regular price (limit price)")
- 매수수량 (buy quantity) — `1주` (1 share)
- 매수단가 (buy unit price) — `52,000`

Buttons: `취소` (cancel, left/secondary) and `주문전송` (submit order, right/primary, red fill).

Other siblings on this page not yet transcribed in this pilot: `간편매수_확인_popup` (simple-buy
confirm, symbol-only), `[QV] Screens` variant, `[NM]국내주식_주문_잔고_일괄매도 주문 팝업`
(bulk-sell confirm popup) — flagging as present but unlearned.
$$, array['국내주식 주문 매수 KRX confirmation popup'], 'learned'
from src
returning node_id, page_name, status;
