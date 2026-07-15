---
name: nds-tpl-guide-page
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=29065-55508"
learned_date: 2026-07-15
sections_studied:
  - "29065:55705 [NM] 모바일계좌개설_해외선물옵션 (labeled '03 해외선물옵션' — full account-guide screen: hero illust + headline '다양한 수익기회, 해외선물옵션' + intro paragraph + FAQ link + 장점(benefits) list ×3 + 기본정보 table + 약관 및 설명서 (2 PDF links) + bottom CTA '해외선물옵션계좌 개설하기')"
  - "29076:56986 symbol [NM] 중개형 ISA 개설안내 (labeled '01 중개형 ISA' — same shell, headline '전국민 필수계좌, 중개형 ISA', 투자 포인트 list ×3, 기본정보 table (6 rows), 2 PDF links, CTA '중개형 ISA 계좌 개설하기')"
  - "29076:56862 symbol [NM] 국내투자형 ISA 개설안내 (labeled '02 국내투자형 ISA' — same shell, headline '국내투자 특화 절세계좌, 국내투자형 ISA', 투자 포인트 list ×3, 기본정보 table (5 rows), 2 PDF links, CTA '국내투자형 ISA 계좌 개설하기')"
  - "29076:57107 / 29076:57108 — plain INSTANCE duplicates of the two symbols above, same content"
  - "29065:56044 title frame ('계좌 안내' / 'QV-NM Template Guide') + loose text labels '01 중개형 ISA' / '02 국내투자형 ISA' / '03 해외선물옵션' floating above each artifact"
status: internal NDS component-library guide (Templates file — usage-example gallery of full account-opening informational screens, not a prose rules source)
---

# NDS Templates — 안내페이지 (Guide Page)

Single-page gallery (on-canvas title: **"계좌 안내" / "QV-NM Template Guide"**) — despite the page name "안내페이지" (guide page), the on-canvas title reads "계좌 안내" (account guide). Three full-screen mockups, all one shared template shell applied to three different account/product types: 해외선물옵션 (overseas futures/options), 중개형 ISA, 국내투자형 ISA. Each screen: statusbar + header_basic → hero illustration + product headline → intro paragraph + "자주하는 질문" FAQ link → benefits/포인트 list (3 items, icon + title + description) → 기본정보 table (key-value rows) → 약관 및 설명서 (2 PDF download rows) → bottom CTA button to open that account. Screenshot-confirmed all three (`gp_1/2/3.png`) — identical composition, only copy/icons/table rows differ per product.

## Layer names — confirmed reliable

Text-node names on this page carry the literal Korean on-canvas string (`기본예탁금 없이 투자 가능`, `23시간 거래 가능`, `레버리지 효과`, `해외선물옵션 거래약관`, etc.) — verified against the screenshot character-for-character. Structural containers use short generic English names (`tit`, `txt`, `list`, `table`, `column`, `contents`) that are consistent, not misleading. No section-numbering mismatch found (contrast with NDS_UX Guide's `02` frame showing `01`) — this page's `01/02/03` labels are loose canvas text, not frame names, and they correctly match each artifact's position. **Verdict: reliable.**

## Component keys — genuine COMPONENT_SETs, `remote: true`

Sampled via 5 explicit node IDs (one `getMainComponentAsync()` call each, no loop; a 6th attempt on `btn_txt_arrow` (`29065:55787`) errored with "Operation attempted to modify the file while in read-only mode" and was not retried):

| Instance | main COMPONENT name | main key | remote | parent SET | parent SET key |
|---|---|---|---|---|---|
| `29065:55790` statusbar | `Type=NM, Dark mode=off` | `cb5f0b3d84426eeb3e20a2765b0612fb14263025` | true | `statusbar` | `e453babe03efec7dabe6c99a8db8d6a46eebac58` |
| `29065:55791` header_basic | `Channel=NM, Left Icon=on, Right Icon=off` | `c7706f72a18d458759548113071367745adc8d96` | true | `header_basic` | `c95043e94317fde7230298017f42dd8099e1cbdc` |
| `29065:55776` icon_pdf | `icon_pdf` | `1196f50682c98ced5976382f2499d9428181adbf` | true | — (single COMPONENT, not a SET) | — |
| `29065:55788` btn_bottom_page | `Channel=btn_bottom_layerpopup, Type=btn_bottom_page, Status=NM` | `3ef42b8dfd48baf9ff4c1572dd2a4de8264bfee7` | true | `btn_bottom_page` | `accfb243ce752fd894af2b6db081b1074022a39d` |
| `29065:55711` Table_header | `Type=basic 1줄` | `d8f3ca5e0a13079c00b5ad6f222bdd2603c6d293` | true | `Table_header` | `8074b6b4ab30e8d392bfb6aec6857386f10e5006` |

All `remote: true` — corroborates Q4 (NDS_Templates subscribes to NDS_Library), no doc-copy rivalry, consistent with every other Wave on this file.

## TAXONOMY — answers the assigned question

**3 top-level artifacts** on this page: `29065:55705` (해외선물옵션, real FRAME), `29076:56986` (중개형 ISA, SYMBOL) + its duplicate INSTANCE `29076:57107`, `29076:56862` (국내투자형 ISA, SYMBOL) + its duplicate INSTANCE `29076:57108`. Counting distinct content = **3 artifacts** (the 4th/5th nodes are plain instance copies of the 2nd/3rd, not new content).

**Prototype links: ZERO.** Checked `.reactions` directly on all three top-level nodes (`29065:55705`, `29076:57107`, `29076:57108`) — all returned `"[]"`. No connectors, no flow between them.

**Not a flow — parallel variants of one template, applied to 3 unrelated products.** Each artifact is a complete, self-contained "account guide" screen for a different product (해외선물옵션 / 중개형 ISA / 국내투자형 ISA). They share the exact same shell/structure (hero → benefits list → info table → PDFs → CTA) but there's no sequence between them — a user would never navigate 01→02→03 in order; each stands alone as the landing/info screen you'd reach before opening that specific account. This is the **third `📱Sample Page` page in a row** (after Wave 1's `42129:7390` 매매 주문 확인) that comes back as parallel component/pattern compositions, not a flow.

**→ `📱Sample Page` does NOT mean "flow".** Three-for-three now: it means "here are full-screen composed examples of a reusable template, varied across 3 product contexts." Recommend downgrading Core's "flow" hypothesis for this section grouping — it should read "composed full-screen template galleries," not flows, pending any counter-example.

## ANSWERS — near-neighbour to coach-mark/tooltip family

**Separate — no shared components observed.** This page's icon set is `nds_icon_account_benefit01/02/03` (benefit/feature icons for the 3-point list) plus `icon_pdf`, `statusbar`, `header_basic`, `btn_bottom_page`, `Table_header`/`Table_cell`, `btn_txt_arrow` — all generic product-screen chrome and content components. None of these match `guide_tooltip` or any coach-mark-family component name found on `nds-tpl-coach-mark`. This page is a **static full-page informational screen** (reached via normal navigation, no dismiss-✕ affordance, no overlay/spotlight mechanics) — structurally and componentwise unrelated to the standalone tooltip bubble. The "announce/onboarding" family hypothesis does not hold for this page: this is ordinary product-education content (account benefits + terms), not an announcement or first-use overlay.

## Blanks / gaps

- `btn_txt_arrow` (`29065:55787`, the FAQ-link button on the 해외선물옵션 screen) could not be key-verified — single `getMainComponentAsync()` attempt errored on read-only-mode; not retried per no-loop rule. Layer name matches visible "자주하는 질문 >" text, so content is still screenshot-confirmed even without the key.
- A hidden frame `29065:55748` (`nds_icon_notify`, `hidden="true"`) sits stacked behind the visible `nds_icon_account_benefit03` icon in the third benefit row — unverified, not quoted, likely leftover/swapped icon state.
- `nds_icon_account_benefit01/02/03` component keys not individually sampled (budget spent on shell components); names read reliably from screenshots.
- No prose usage rules found anywhere on this page — pure composed-screen gallery, consistent with every other page in this file family.
