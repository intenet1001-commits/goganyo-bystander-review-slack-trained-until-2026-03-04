---
name: nds-tpl-box-button
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=18352-2356"
learned_date: 2026-07-15
sections_studied:
  - "18352:2356 (page '    - Box Button 버튼' — canvas, 13 top-level screen-mockup frames + loose asset instances, full metadata read via saved-file python line/indent parser, 690 lines, 100% read)"
  - "18352:11430 (frame 'Button in solid box list 기본01' — two stacked product-list cards, grey box + 상품상세/상품매수 button pair) — screenshotted"
  - "18352:11702 (frame '판매중인 ELS/DLS_메인' — real ELS/DLS product screen, 간이투자설명서/상세보기 button pair) — screenshotted"
  - "18352:12359 (frame 'Cancel Button in list 기본01' — 계좌번호 또는 상품명 cards with 해지 text-button + 상품상세/상품매수 pair) — screenshotted"
  - "18358:12053 (frame 'Cancel Button in list 기본01', second instance under a colliding name — btn_container_large usage, not screenshotted this pass)"
  - "get_libraries (read-only, no page context needed) — confirms this file's subscribed libraries directly, independent of the metadata read"
status: internal NDS component-library guide (design-system reference, not a shipped product screen) — page is a set of finished-looking application-screen mockups, not a token/variant spec sheet
---

# NDS Templates — Box Button 버튼

## Headline finding: this page is composed screen mockups, not a spec sheet — and its layer names are reliable

Unlike `nds-mweb-box-button.md` (three coexisting, internally-conflicting drafts with `Status`/`disabled` vs `State`/`disable` naming disagreements and placeholder chaos), this NDS_Templates page holds **13 top-level 540×987 frames that each look like a finished app screen**: `Button in solid box list 기본01/02`, `판매중인 ELS/DLS_메인`, `Button in list 기본01/02/03/04`, `Button in line box list 기본01/05` (×2, colliding IDs `18352:12077`/`18404:5867`), `Cancel Button in list 기본01/02` (×2, colliding IDs `18352:12359`/`18358:12053`), plus loose `moana` watermark instances, a `title` label frame, and category-caption text nodes (`in Box 박스 내 버튼`, `in list 리스트 내 버튼, 아코디언 버튼`, `Cancel Button 해지,취소버튼 포함`, `EXCEPTION 예외케이스`, `example`) sitting off to the side of the frame grid.

**Screenshot-confirmed layer-name convention: reliable.** `18352:11430` ("Button in solid box list 기본01") renders exactly as named — two grey solid-box product-list cards with a 상품상세/상품매수 button pair. `18352:12359` ("Cancel Button in list 기본01") renders a 계좌번호/상품명 card with a 해지 text-button top-right, matching its name. `18352:11702` ("판매중인 ELS/DLS_메인") is a real-looking ELS/DLS product detail screen with real Korean product copy ("NH Now(ELS)116", "연 18.66%", etc.) and a 간이투자설명서/상세보기 button pair. **No frame-name-vs-on-canvas mismatch found** — a contrast with the UX Guide (`nds-ux-guide-*`) and M.web files, where layer names lied on every prior page learned in this domain.

**No `Status`/`State` naming conflict found on this page.** Grepping the full metadata dump for `State=` and bare `disable"` (M.web Draft C's divergent naming) returned zero hits; the only variant-name strings visible are `Status=normal` (5 occurrences, e.g. `Strength=4(line), Height=h46, Status=normal`) — consistent with M.web's Draft A/B convention, not Draft C's. **This page does not reproduce M.web's three-draft conflict.**

## Component instances observed (by name, unique count)

`label_risk` (16), `label` (19), `statusbar` (13), `Topbar_Dropdown` (12), `btn_order_container_list` (11), `check_circle` (9), `label_basic` (7), `moana` (7, watermark), `btn_container_regular` (6), `check_icon_solid` (6), `Strength=4(line),Height=h46,Status=normal` instance (5, a `btn_container_*` variant surfacing its raw variant name as the instance name), `ss_img_sticker79` (4), `btn_bottom_orderlist_assets` (4), `filter` (3), `nds_icon_arrow` (3), `주문신청-종목리스트` (3), `label_risk/stroke/normal` (3), `title` (3), `btn_container_large` (3), plus one each of `quickmenu_basic`, `유의사항_하단노출`, `nds_icon_filter`, `btn_txt_arrow`, `header_basic`, `card`, four `Group 101xx` nodes.

**Notably absent from this page**: `btn_bottom_page_assets` / `btn_bottom_page_assets_gray` (Core's key `0fc4758e…`/`873d1a7b…`) never appear by name anywhere in the metadata — this page's button content is the *box/container/order* button family, not the generic full-width bottom-CTA family Core documents.

**Notably present and matching M.web's page-local names exactly**: `btn_order_container_list`, `btn_bottom_orderlist_assets`, `btn_container_large`, `btn_container_regular` — these are the same names `nds-mweb-box-button.md` recorded from M.web's **Draft B "Order (Buy&Sell)"** section, which that pass could not confirm as published (no key resolvable in a read-only session there either).

## GAP — component keys and remote status unverified this pass

**Read-only session.** Per the domain's known constraint, `setCurrentPageAsync`/any node-touching call (even a bare `getMainComponentAsync()` read) threw `"Operation attempted to modify the file while in read-only mode"` on this file — confirmed by direct test, twice, before and after attempting a page switch. **No componentKey, no parent-SET key, and no `.remote` flag could be obtained for any instance on this page.** Tier classification (published / doc-copy / unpublished-scaffold) is therefore **not resolvable this pass** — report as unverified, not as "safe to use."

## ANSWERS

**`btn_bottom_page_assets` attribution**: not directly settleable from this page — the key never appears here to compare `remote` status against. But `get_libraries({fileKey: "1xE0qvn2yv3ZkQ9BwhKT1y"})` (a read-only call, unaffected by the write restriction) **confirms this file subscribes to NDS_Library, NDS_Colors, NDS_Darkmode Colors, and NDS_Templates itself — and does NOT subscribe to NDS_M.web** (`NDS_M.web` appears only in `libraries_available_to_add`). This matches the pre-loaded verdict. Since this NDS_Library-subscribing file independently contains real, screenshot-confirmed working instances of `btn_order_container_list`/`btn_container_large`/`btn_container_regular`/`btn_bottom_orderlist_assets` — names M.web could only place in its unresolved, non-subscribing "Draft B" — the more plausible read is that **NDS_Library is the true publisher of this button family**, and M.web's copies are that same library's components used locally (or a doc re-creation), not the other way around. This is **circumstantial, not proof**: the read-only session blocked the one call (`getMainComponentAsync().key`/`.remote`) that would make it definitive.

**Conflicting drafts like M.web?** No. One coherent naming convention (`Status=normal`, no `State=`/`disable` variants found), no duplicate/contradictory frame content, layer names screenshot-confirmed accurate. This page reads as a finished template-library reference, not a `(진행중)` work-in-progress.

## How this feeds BUILD mode

- For box/container/list-row buttons (상품상세, 상품매수, 해지, order buttons), this page is the real usage reference — pull `btn_container_large`/`btn_container_regular`/`btn_order_container_list`/`btn_bottom_orderlist_assets` names from here, but **re-verify keys in a write-capable session before use** (this pass could not).
- For full-width bottom-CTA buttons, this page has none — use Core's `btn_bottom_page_assets`/`_gray` instead.
- Prefer this page's box-button usage over M.web's Draft A/B/C for guidance on **how buttons compose inside real product cards** (risk labels, 해지 pill, buy/sell pairing) — M.web only has isolated spec frames, this page has full assembled screens.

## GAPS (do not fill in)

- No componentKey/remote flag for any instance — read-only session.
- `filter`, `nds_icon_filter`, `주문신청-종목리스트`, `card`, and the four `Group 101xx` nodes were seen by name only; their content/rules were not screenshotted this pass (word/time budget) — flag for a future VERIFY pass if filter-row buttons become relevant.
- Two frame-name collisions exist on this page (`Button in line box list 기본01` at both `18352:12077` and `18404:5867`; `Cancel Button in list 기본01` at both `18352:12359` and `18358:12053`) — not investigated for content differences this pass.
