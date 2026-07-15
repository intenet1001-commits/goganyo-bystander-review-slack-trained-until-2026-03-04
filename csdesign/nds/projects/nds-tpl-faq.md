---
name: nds-tpl-faq
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=9665-19604"
learned_date: 2026-07-15
sections_studied:
  - "9665:19604 (page canvas '    - 자주하는질문')"
  - "15059:1285 '가이드 미반영' section (5750x2190) — legacy/deviant FAQ compositions"
  - "15059:1284 'NDS가이드 반영' section (1320x2190) — guide-compliant FAQ compositions"
  - "9665:20024 (02_RP_자주하는질문, 가이드미반영 — RP product FAQ, all-collapsed, right-chevron nav rows)"
  - "9665:20451 / 9665:20521 / 9665:20555 (모바일지점_자주묻는질문_전체/1/2, 가이드미반영 — 공모주 청약 IPO-subscription FAQ list+search screens, right-chevron nav rows)"
  - "9665:20433 / 9665:19724 (모바일지점_자주묻는질문_상세 x2, 가이드미반영 — separate detail/answer screens, confirming a navigate-away pattern)"
  - "15059:985 (자주하는 질문_default, NDS가이드 반영 — collapsed accordion list, category tabs + search)"
  - "15059:1020 (자주하는 질문_open, NDS가이드 반영 — same screen with item 1 expanded)"
  - "23026:4729 / 23026:5014 / 23025:2145 / 27002:2373+3 instances (unexpanded SYMBOL nodes — 주식모으기/내주식모아보기 FAQ variants, not drilled into)"
status: usage gallery containing TWO competing FAQ compositions on one page, explicitly self-labeled by the file's own section names — legacy navigate-to-detail pattern ("가이드 미반영" = guide not reflected) vs. accordion pattern matching NDS_M.web ("NDS가이드 반영" = guide reflected)
---

# NDS Templates — 자주하는질문 (FAQ)

Unlike prior gallery pages, this page **states its own compliance verdict** via two top-level Section nodes: `가이드 미반영` ("guide not reflected", 5750×2190, 7 frames) and `NDS가이드 반영` ("guide reflected", 1320×2190, 2 frames). This is a rare case of the source file doing the audit for us.

## ANSWER — real accordion component? Same chevron convention as mweb-faq?

**No dedicated FAQ/accordion SET exists — confirms the Core gap.** Every `FAQ_List`/`FAQ_List01` row is a hand-composed FRAME (not a COMPONENT instance); only the chevron icon inside it is a real published component. So the "component" of this pattern is just `nds_icon_arrow` reused as a state-swap icon inside an ad-hoc frame — same architecture mweb-faq showed, not a stronger one.

**Two chevron treatments coexist, and only one matches mweb-faq:**

| Section | Icon used | Meaning | Matches mweb-faq? |
|---|---|---|---|
| `NDS가이드 반영` (`15059:985`/`1020`) | `nds_icon_arrow` SET, `Type=down`(collapsed)/`Type=up`(expanded), `Height=h24` | **In-place accordion expand** | ✅ Yes — identical convention (`Type=up`=expanded/`down`=collapsed, same SET key) |
| `가이드 미반영` (`9665:20024` RP FAQ) | Same `nds_icon_arrow` SET but `Type=right` on every row | **Navigate to a separate detail screen** (confirmed: sibling frames `모바일지점_자주묻는질문_상세` exist as landing pages) | ❌ No — wrong variant of the right component |
| `가이드 미반영` (`9665:20451`/`20521`/`20555`, 공모주 FAQ) | `icon_arrow_right` — a **different, standalone COMPONENT** (not in the `nds_icon_arrow` SET at all) | Same navigate-away pattern | ❌ No — different component entirely |

**Verdict: this page uses the SAME accordion+chevron convention as mweb-faq, but only in the section the file itself marks as guide-compliant.** The larger, older section demonstrates a rival architecture — tap-through to a separate answer screen — using either a misapplied variant of the correct SET or a wholly different legacy icon. Screenshot-confirmed both patterns render as described (down/up chevrons vs. right chevrons).

**큰손픽 not present.** This page's real content is brokerage/retail-banking FAQs — RP (repo) products, 공모주 청약 (IPO subscription), 해외선물옵션 (overseas futures/options) — unrelated to mweb-faq's 큰손PICK feature. No cross-project link found.

## Real content, but with a copy-paste defect

The guide-compliant `NDS가이드 반영` screen (`15059:1020`) is richer than mweb-faq's plain 4-item list: it adds category tabs (전체/계좌개설/주문·정산/환전/세금), a keyword search bar, and a category badge above each question. Screenshot-confirmed the expanded item's question is "해외선물옵션 거래를 하고 싶은데 어떤 유형의 계좌를 보유해야 할까요?" but its rendered answer text is the **공모주 청약 (IPO subscription) answer** ("청약 개시일 직전일까지 개설된 계좌로만…") — an identical string also found verbatim on the unrelated detail frame `9665:20436`. This is a real, non-placeholder answer, but it is **pasted under the wrong question** — a content-authoring defect, not a blank.

## Layer names — UNRELIABLE on this page (contrast with `nds-tpl-no-data`)

Every FAQ row's category-label text node is named `청약` (= "subscription") regardless of on-canvas content. Screenshot confirms rendered badges read "계좌개설", "주문/정산", "환전", "세금", "예금자보호", "편입종목", "금리", etc. — the layer name is a stale copy-paste from an original template row, not the true label. **Verdict for this page: names unreliable** — always screenshot before trusting a `청약`-named node.

## Component keys (5 single-node `getMainComponentAsync` calls, unverified beyond these)

| Instance | main name | main key | type | remote | parent SET key |
|---|---|---|---|---|---|
| `9665:20033` nds_icon_arrow (RP FAQ row) | `Color=05, Type=right, Height=h24` | `d0ec4c9777b1f8ce1bec480f25a1f72c2d962aa1` | COMPONENT | true | `dde648604e4d08cc6b99c44dda81ec73ccbb4b15` (= Core `nds_icon_arrow`) |
| `15059:995` nds_icon_arrow04_d24 (default, collapsed) | `Color=05, Type=down, Height=h24` | `7c328ec445db51b44cdbe133974e6796eeebbefe` | COMPONENT | true | `dde648604e4d08cc6b99c44dda81ec73ccbb4b15` (= Core, = mweb-faq's down key) |
| `15059:1034` nds_icon_arrow04_u24 (open, expanded) | `Color=05, Type=up, Height=h24` | `8571fa97ecb73cec4c329be89c1c77ccd0375dae` | COMPONENT | true | `dde648604e4d08cc6b99c44dda81ec73ccbb4b15` (= Core, = mweb-faq's up key, exact match) |
| `9665:20396` icon_arrow_right (공모주 FAQ row) | `icon_arrow_right` | `5820008d0ff7fbcb44402a3263c67e95b4a0d179` | COMPONENT | true | none (standalone, not a SET) |
| `9665:20026` statusbar (RP FAQ frame) | `Type=Clear, Dark mode=false` | `419379268eb08b270314d5359b72f73961f38204` | COMPONENT | true | `b4d07422e1eedeb9f1ae4b831e905357e54b01a6` — **yet another distinct `statusbar` SET key**, adding a 6th to Gotcha 5b's tally |

All 5/5 `remote: true` — corroborates Q4 (subscribes to NDS_Library).

## Blanks / gaps

- Four SYMBOL/instance nodes (`23026:4729`, `23026:5014`, `23025:2145`, `27002:2373`+3 more instances) sit off-canvas to the right/below, named after other features' FAQs (주식모으기 / 내주식모아보기). Not drilled into — out of scope for this page's own two sections, flagged as unverified.
- No prose usage rules anywhere on this page — consistent with Gotcha 7 (gallery, not rules source).
- The `가이드 미반영` vs `NDS가이드 반영` split is itself undocumented — no note on canvas explains which pattern is currently correct or when the migration happened; inferred purely from the section names and the chevron-key evidence above.
