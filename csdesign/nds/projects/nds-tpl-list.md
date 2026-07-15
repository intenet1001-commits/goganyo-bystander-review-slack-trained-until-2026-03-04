---
name: nds-tpl-list
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=94-17765"
learned_date: 2026-07-15
sections_studied:
  - "94:17765 (title frame '- List 리스트' — on-canvas 'List' / 'QV-NM Template Guide', one canvas of ~20 composed usage examples across list genres: 종목/stock, 계좌/account, 게시판/board, 상품/product, 권리/rights, button-in-list variants)"
  - "3996:31446 / 4008:31754 etc. (list_종목_xx — 4-row stock list card: icon + name/exchange-code + price + rate)"
  - "594:26403 / 3896:31285 (list_계좌 — list_account rows)"
  - "3867:31654 / 4015:32806 / 14001:1125 (list_게시판 — list_board rows)"
  - "18404:9018 (Button in list 기본02 — expanded list_product03 anatomy: chips + title + subtitle + price/note + 2-button row)"
  - "33055:3946/6770 (권리 — 'list' component rows)"
status: internal NDS component-library guide (Templates file — usage-example gallery, not an asset-swatch sheet)
---

# NDS Templates — List 리스트

Single-page usage gallery (title on-canvas: **"List" / "QV-NM Template Guide"**) for stock/account/board/product/rights list rows composed into ~20 example screens (종목 리스트, 계좌 리스트, 게시판 리스트, 상품 버튼 리스트, 권리, Button-in-list accordion variants). Like `nds-tpl-data-table`, no isolated component-swatch sheet — every instance is live inside a composed screen mock.

## Layer-name convention — confirmed reliable

Screenshot of title frame (`3823:32013`) reads "List" / "QV-NM Template Guide" on-canvas — matches the page name exactly. Instance layer names (`list_stock`, `list_account`, `list_board`, `list_product03`, `card`, `btn_order_container_list`) read directly as their component name, confirmed via `getMainComponentAsync()`. Consistent with `nds-tpl-data-table`'s finding for this file.

## Component keys — all genuine COMPONENT_SETs, `remote: true`

Sampled via explicit node IDs (page-wide sweep not attempted, per read-only risk):

| Instance | variant | main COMPONENT key | remote | parent SET name | parent SET key |
|---|---|---|---|---|---|
| `3996:31582` list_stock | `Type=기본, CI=on, in Card=on` | `06542d8143e0a2eecd4a6db65bed59083d8342c2` | true | `list_stock` | `09fd4ecabbb4e3db2151a55b00396e49a05693e7` |
| `4008:32328` list_account | `Type=타행포함, BTN=on, in Card=on` | `d5a78d8d5ed9a7fa17f7895b3bdd276238aa3480` | true | `list_account` | `13d1fd192e1910377c11012c4752f91e3236b3dd` |
| `4015:32713` list_board | `Type=상태표시, in Card=off` | `52c5c7feb08763e1dadc7e68ad3fba61e43f1408` | true | `list_board` | `d4853f1f0a6138bd17f603b51706282ca6ae6da9` |
| `4027:31655` list_product03 | `in Card=off` | `dac7bea55af02c9922efc2725eb8d5a8e3759d68` | true | `list_product03` | `6eb8cdb388e2ffdf8be7688c9f040597c289db80` |
| `18404:9005` card | `Property 1=normal` | `51d237a1923e95f6c252cb79e14d16d1a4d1e6e0` | true | `card` | `8ec93dc2c367da7954a072d96b5cb4c7addae943` |
| `4015:34192` btn_order_container_list | `Type=3-btn` | `b5eef6ce855e1a4af2ae2ab32779cb49ec801df5` | true | `btn_order_container_list` | `66d9401ae65b8e1d796dfa5e34abfdb90c8336e4` |
| `18404:8957` label_basic | `Type=강조-신용등급` | `fac3afb2d0114584c7bd37cb5c14f0092a65269f` | true | `label_basic` | `58930d555b83c0fc5eb8873c382ea1286bccdf14` |

None named `Table_cell`/`Table_header` — NDS ships **separate purpose-built list-row COMPONENT_SET families per genre** (stock/account/board/product/rights), distinct from the table component family.

## ANSWER — multi-field card found; NOT built from `Table_cell`

`18404:9018` "Button in list 기본02" shows `list_product03` **expanded** (raw content, not collapsed instance): chip row (3× `label` instances) + 상품명 (title) + 부가설명 (subtitle) + price/rate + 안내사항 (note) — a genuine 4+-field product card. Its live main-component key (`dac7bea5…`, parent SET `6eb8cdb3…`) is **not** `Table_cell`'s key (`fc81ad07…`). **This is the first real multi-field-card example found across three files learned** — and it **confirms Core's claim**: NDS does not repurpose `Table_cell` for it, it ships a dedicated `list_product03` component family instead. "Build those manually instead" reads as "use a purpose-built component," not literal from-scratch construction.

**Touch-area check** (`nds-ux-guide-touch-area`'s one-primary-action + `더보기` rule): `list_stock`/`list_account` rows agree — one row tap or one `버튼명` button, no competing actions. `list_product03`'s **expanded** state (`ls_3.png`) shows **two simultaneous buttons** — "상품상세" (outline/secondary) + "상품매수" (filled/primary) — not routed through a `더보기` menu. This reads as primary+secondary pairing rather than a violation (only one *filled/primary* action), but it is **not the single-button pattern** the touch-area guide's other examples show — flagged as a partial deviation, unconfirmed against the guide's exact wording.

## Blanks / gaps

- Page-wide instance sweep not attempted (read-only risk per task instructions) — only 7 explicit-ID instances sampled; other list genres (권리 `list`, board `list_board` other Types) not individually key-verified, though names read reliably.
- No written usage rules found on this page (same as `nds-tpl-data-table`) — example-gallery only, no prose guidance to report as blank-at-source beyond that.
- `label_risk` (risk-badge chip seen in `list_product03`'s expanded frame, `18404:9026`) not resolved to a key — out of scope for this pass.
