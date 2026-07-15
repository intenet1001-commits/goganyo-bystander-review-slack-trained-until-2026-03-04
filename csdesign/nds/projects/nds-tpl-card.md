---
name: nds-tpl-card
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=404-13016"
learned_date: 2026-07-15
sections_studied:
  - "404:13016 (page '    - Card  카드' — usage-example gallery, ~25+ composed screen mocks across 5 named sections: Data Card 데이터 카드 / Select Card 선택 컨트롤 카드 / Emphasis Card 상단 강조 카드 / Direct Card 바로가기 카드 / with Box button 버튼 포함)"
  - "4067:30734 (title frame: on-canvas 'Card' / 'QV-NM Template Guide')"
  - "4216:31489 (국내ETF검색 — MULTI-FIELD CARD: 2 status chips + title/subtitle + price/rate + 3 label/value rows + CTA button)"
  - "4214:31482 (계좌잔고_해외주식 — MULTI-FIELD CARD: 4-part title row + 6 label/value pairs in a 2-col grid)"
  - "4173:30771 (card_데이터_01 — basic 3-row label/value card, placeholder copy)"
status: internal NDS component-library guide (Templates file — usage-example gallery, not an asset-swatch sheet)
---

# NDS Templates — Card 카드

Usage gallery (title on-canvas: **"Card" / "QV-NM Template Guide"**) of composed mobile screens, each holding one or two card instances inside a full status-bar/header/quickmenu mock. Five on-canvas section labels group the examples: **Data Card 데이터 카드**, **Select Card 선택 컨트롤 카드**, **Emphasis Card 상단 강조 카드**, **Direct Card 바로가기 카드**, **with Box button 버튼 포함**. Card variants seen: `card_data`, `card_select`, `card_emphasis`, `card_simple list`, plus two account/asset-summary cards (`나의자산현황_당행`/`_타행`, `계좌잔고_국내주식`/`_해외주식`) and a fund/ETF search card (`국내ETF검색`, `펀드`) that reuse `card_data`'s slot.

## Layer-name convention — reliable on this page

Card frame names correspond to their content category and are not generic placeholders: `card_데이터_01/02/03` under the Data Card section, `card_선택_01/02/03` under Select Card, `card_상단강조_01/02` under Emphasis Card, `card_심플리스트_01/02` under Direct Card. Screenshot of `4173:30771` (`card_데이터_01`) shows on-canvas placeholder content ("기본 타이틀" / "출금가능금액 — 내용을 입력하세요." ×3) consistent with a basic 3-row data card — no frame-number-vs-heading mismatch found (confirmed on sampled frames, not exhaustive — unlike `3:158`/`nds-tpl-popup`'s unreliable verdict elsewhere in this file).

## ANSWER — Multi-field card EXISTS, built from a dedicated `colum` component — REFUTES the Table_cell framing

Two genuine 4+-field cards found on this page, both screenshot-confirmed:

1. **`국내ETF검색`** (`4216:31489`, card frame `4216:31784`) — a stock/fund search-result card: 2 status chips ("미국주식"/"2배수"), title + subtitle, price + up/down rate (▲ red), a "수익률(3개월)" badge (12.30%), **3 label/value rows** ("총 보수율" 0.250% / "시가총액" 676(억) / "일 거래금액" 110(백만)), and a CTA button. **This is exactly Core's hypothetical** — a stock card with label/value pairs + status chips.
2. **`계좌잔고_해외주식`** (`4214:31482`, card frame `4214:31569`) — an account-balance card: a 4-part title row (애플/AAPL/보통주/USD) + **6 label/value pairs in a 2-column grid** (잔고/평가손익/평가금액/수익률/매입가/현재가).

**Neither is `Table_cell`.** Sampled the "colum" instances inside both cards' `item list` frames via `getMainComponentAsync()`:

| Instance | variant | `main.key` (COMPONENT) | `main.remote` | parent SET name | parent SET key |
|---|---|---|---|---|---|
| `4216:31788` colum (국내ETF검색) | `단분할=off` | `96a2c3272bb7f33b702f6c22748064c2afccb013` | true | `colum` | `c355ddcba3cd13f902b9ff2d9a678498b0ca119c` |
| `4216:31789` colum (국내ETF검색) | `단분할=off` | (same) | true | `colum` | (same) |
| `4214:31572` colum (계좌잔고_해외주식) | `단분할=on` | `ddef0d9c36054da78d7f46f785ba6c29742e5ed2` | true | `colum` | `c355ddcba3cd13f902b9ff2d9a678498b0ca119c` |
| `4217:31361` label_risk (국내ETF검색 chip) | `Type=stroke, Lv=normal` | `862adae5dbe11b2ca36c5703afa5cd81a28d7604` | true | `label_risk` | `d71897c636a71e92ebef7e6075bb797aa3572b09` |
| `4216:31793` plus_line_circle (icon) | `Color=2` | `133a34e962238c6113683280f0d719deaecb49a2` | true | `plus_line_circle` | `55e978d1505b41ce7f24ef4ed8f6ea02f26c5176` |

**`colum` is a real, published, `remote: true` COMPONENT_SET (`c355ddcba3cd13f902b9ff2d9a678498b0ca119c`) — a purpose-built label/value-row component, distinct from `Table_cell` (`fc81ad0752…`, confirmed in `nds-tpl-data-table.md`) by both name and key.** Its `단분할` (split-in-half) axis toggles single-column vs the 2-column grid seen in the 애플 card.

**This settles the Core cross-file question with a third answer, neither of the two offered:** Core said `Table_cell` is a poor fit for multi-field cards and to "build those manually instead" — implying hand-built (raw text/frame) composition. The real library instead ships a **dedicated `colum` component** for this exact use case. It is not `Table_cell`, and it is not hand-built either — it's a purpose-built, `remote: true` alternative component that Core's reference doesn't document. **Core's negative claim about `Table_cell` holds; its implied fallback ("build manually") is incomplete — `colum` is the real answer.**

## Findings summary

- **New component surfaced, not in Core reference: `colum`** (SET `c355ddcba3cd13f902b9ff2d9a678498b0ca119c`), a 2-cell label/value row used inside `card_data`-family multi-field cards. Variant axis `단분할` (off = full-width single row, on = split into a 2-column grid) — confirmed both values live on canvas.
- **`label_risk`** (SET `d71897c636a71e92ebef7e6075bb797aa3572b09`, `Type=stroke/Lv=normal` sampled) is the status-chip component used atop the ETF card — consistent with `nds-tpl-box-button.md`'s prior sighting of `label_risk`, now confirmed with a resolvable key.
- 상승/하락 glyph convention (▲ red) reconfirmed inside `국내ETF검색`'s price row, consistent with every other file's finding.
- Per `nds-ux-guide-touch-area.md`'s one-primary-action-per-card rule: both multi-field cards examined here carry exactly one CTA (button or `+` icon), consistent with the rule — no card in the sampled set has multiple competing tap targets.
- `card_타이틀밖에` (title-outside variant, `553:20906`/`4384:33329`) is a distinct card composition style not seen in the Table/Popup files — title sits above the card frame rather than inside it, seen paired with a `card_data` or a custom "feature" report-list frame.

## Blanks / gaps

- **Read-only session degraded key capture, matching the pattern reported file-wide.** Only 5 explicit-node-ID lookups were run (per task instructions — page-wide sweeps reliably throw here); `colum`'s full variant set (beyond `단분할=on/off`) is not exhaustively enumerated.
- No written usage rules found on this page — pure composed-example gallery, same as `nds-tpl-data-table` and `nds-tpl-popup`.
- `card_select`, `card_emphasis`, `card_simple list` instances were screenshotted/inventoried via metadata but not key-sampled — out of scope once the multi-field-card question was settled; a future pass could resolve their keys too.
- All keys above obtained via live-instance `getMainComponentAsync()` (not `importComponentSetByKeyAsync`, unavailable in read-only mode) — directly observed, not `unverified`.
