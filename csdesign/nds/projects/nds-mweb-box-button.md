---
name: nds-mweb-box-button
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=323-6250"
learned_date: 2026-07-15
sections_studied:
  - "323:6250 (page '    - Box Button  (진행중)' — canvas, full metadata read via saved-file jq/python, 100% of 137,225-char dump read)"
  - "323:6273 (frame '1. Bottom' — original draft, Bottom Button spec: in-page + in-layer-popup, NM/QV × 1-btn/1:2-btn/2-btn × normal/disabled) — screenshotted"
  - "323:6375 (frame '99. Button_assets' — original draft asset sheet: btn_bottom_page_assets, btn_bottom_layerpopup_assets, + _gray counterparts) — screenshotted"
  - "323:6376 / 323:6434 (btn_bottom_page_assets / btn_bottom_page_assets_gray — get_design_context pulled, real hex + prop names confirmed)"
  - "336:6820 (frame '2. Container' — original draft: btn_container_large, btn_container_regular, Strength/Height/Location variant grid)"
  - "1718:1172 through 1718:1761 (fully duplicated second draft under the same page: '99. Button_assets', '4. Order (Buy&Sell)', '3. Text button', '2. Container', '1. Bottom', 'Button_usage' annotation frame, '자주쓰는버튼' quick-pick frame) — 'Order' and 'Text button' screenshotted"
  - "1730:791 / 1730:947 / 2854:232 (Section nodes — third, newest draft: '1. Bottom' / '2. Container' / '3. TXT BTN', using Figma Section not Frame) — '1. Bottom' screenshotted"
  - "1676:1517 / 1676:1667 / 1676:1818 (three unrelated pasted marketing screens — kodex ETF page ×2, pension-fund rewrite page — reference examples of btn_cta in real use, not spec content)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen) — page explicitly marked (진행중) "in progress" by the file's own page name
---

# NDS M.web — Box Button (진행중 / IN PROGRESS)

## Headline finding: this page is not one draft, it is THREE coexisting drafts

The page name itself carries `(진행중)`. The on-canvas evidence for that status is concrete and severe: **the page contains three structurally-parallel, only-partially-consistent copies of the same button system**, stacked at different canvas coordinates:

| Draft | Node IDs | Structure | Frame names |
|---|---|---|---|
| **Draft A (original)** | `323:xxx`, `336:xxx` | `frame` | `1. Bottom` (323:6273), `99. Button_assets` (323:6375), `2. Container` (336:6820) |
| **Draft B (expanded duplicate)** | `1718:xxx` | `frame` | `1. Bottom`, `2. Container`, `3. Text button`, `4. Order (Buy&Sell)`, `99. Button_assets`, `Button_usage` (annotation), `자주쓰는버튼` (quick-pick) |
| **Draft C (newest redesign)** | `1730:xxx` / `1723:xxx` / `1728:xxx` / `2854:xxx` | **`section`** (not `frame`) | `1. Bottom`, `2. Container`, `3. TXT BTN` |

Draft B is a **superset** of Draft A (same Bottom/Container content, plus two new categories: Order buttons and Text buttons, plus a dated usage-rules annotation). Draft C is a **ground-up visual redesign** of Bottom/Container using Figma's newer `Section` node type instead of `Frame`, and it diverges from A/B in ways that look unresolved:

- **Variant-property naming disagrees across drafts.** Draft A/B use `Status=normal/disabled` (full word). Draft C's `btn_bottom_basic` (`1718:2012`, reused inside the Draft-C section) and `btn_container_basic` (`1728:256`) use **`State=normal/disable`** (different property name, and `disable` not `disabled`, verbatim from the metadata). Any code generated against Draft C's naming will not match Draft A/B's `Status`/`disabled` convention.
- **Draft C introduces a CTA button type with no Draft A/B equivalent.** `btn_bottom_cta` (`1728:244`) has variant `Top FAB=on`/`off` — a scroll-to-top floating button paired with the CTA bar. Draft A/B's Bottom section has no CTA category at all; it only documents "in page" and "in layer popup." Draft C's own annotation frame (`1730:1419`) is the only place that explicitly names and defines three types: **"Basic → Page, Bottom sheet(Sliding popup) 맨 하단에 영역 고정된 버튼" / "Layerpopup → Layer popup 맨 하단에 영역 고정된 버튼" / "CTA → 이벤트, 상품설명 페이지 등 단독 구성된 웹페이지 맨 하단에 영역 고정된 버튼"** (verbatim).
- **Draft C's colour scheme for CTA departs from the NM/QV green/orange system entirely.** The `latest_bottom.png` screenshot of Draft C's Bottom section (`1730:791`) shows CTA buttons rendered in an indigo/purple fill ("ETF 상세 확인하기") that matches neither `NM/ESS/primary` (`#84C13D`) nor `QV/ESS/primary` (`#FFAA1A`) documented in `nds-mweb-colors.md`. Whether this is a deliberate new CTA-specific token or a stray sample fill left over from copy/paste is **unverifiable from this pass** — flagging as a gap.
- **A title-text copy-paste artifact confirms Draft C is unfinished**, mirroring the pattern already seen elsewhere in this domain (QV role-text copied from NM in `nds-mweb-colors.md`): Draft C's `2854:232` section is named `"3. TXT BTN"` on-canvas, its header text reads **"M.web Text BTN"**, but the *subtitle* text node still reads `"Container BTN Asset"` (id `2854:235`) — copied verbatim from the Container section's header (`1730:947`'s own subtitle is `"Container BTN Asset"`, id `1730:950`) and never updated for the Text-button section.
- **Draft C's `btn_bottom_layerpopup` (`1723:624`) symbols carry no `State` property at all** (`Channel=NM, Type=1-btn` / `Channel=QV, Type=1-btn` / etc., no normal/disable suffix) — inconsistent with its own sibling `btn_bottom_basic` in the same section, which does carry `State`.

**Do not treat any single draft as "the" spec.** Cross-check whichever draft a request references; if unspecified, Draft A/B's `btn_bottom_page_assets` / `btn_bottom_page_assets_gray` keys are the ones already confirmed against the Core reference (below) and are the safer default.

## Draft A/B — Bottom Button (`btn_bottom_page` / `btn_bottom_page_assets`)

On-canvas heading "Bottom Button" / "QV-NM Button Design Guide". Body copy verbatim: **"페이지/팝업 하단에 쓰이는 기본 버튼입니다."** ("basic button used at the bottom of pages/popups").

Two contexts, each with NM/QV × normal/disabled:
- **"in page" / 페이지 하단버튼** (`btn_bottom_page`, 323:6288 in Draft A / 1718:1689 in Draft B) — Type axis `1-btn` (full width) / `1:2-btn` (2/3+1/3 split) / `2-btn` (50/50 split)
- **"in layer popup" / 레이어 팝업 하단버튼** (`btn_bottom_layerpopup`, 323:6323 / 1718:1724) — same Type axis, no `1:2-btn` size difference confirmed (narrower symbol widths: 328px vs 360px for the page version)

Screenshot of `323:6273` confirms: **green pill = NM channel, orange pill = QV channel**, grey pill (separate row, not part of the Channel axis) = a **gray/neutral button family** — this is the `btn_bottom_page_assets_gray` (323:6434) / `btn_bottom_layerpopup_assets_gray` (323:6449) pair, which has **no `Channel` property** (only `Type` + `Status`) — it's channel-agnostic by design, used for secondary/cancel actions.

### Real values pulled via `get_design_context` (Draft A assets, 323:6376 / 323:6434)

Confirms the Core reference's `btn_bottom_page_assets` / `btn_bottom_page_assets_gray` component structure almost exactly:

```
BtnBottomPageAssets: { channel: "NM"|"QV", status: "normal"|"disabled", type: "1-btn"|"2-btn"|"1:2-btn" }
BtnBottomPageAssetsGray: { status: "normal"|"disabled", type: "2-btn"|"1:2-btn" }
```

- NM normal fill: `#84C13D` (`NM/Primary/246.022`) — matches `nds-mweb-colors.md`'s `NM/ESS/primary/2.022(대표컬러)` exactly.
- QV normal fill: `#FFAA1A` (`QV/Essential/4.022 (강조색)`) — matches `nds-mweb-colors.md`'s `QV/ESS/primary/2.022(대표컬러)` exactly.
- NM disabled: `rgba(132,193,61,0.6)` = `#84C13D` @ 60% — matches `nds-mweb-colors.md`'s recorded `NM/ESS/primary/3.107` disabled-alpha (60%) exactly.
- QV disabled: `rgba(255,170,26,0.7)` = `#FFAA1A` @ 70% — matches the colors file's recorded QV disabled-alpha (70%) exactly.
- Gray family: normal fill `#E0E0E0` (text `#333`), disabled fill `#F3F3F3` (text `#C5C5C5`).
- Label text style: `Pretendard Medium`, `26px` / `36px` line-height (`Headline/Preten/M/26`) — this is much larger than the 17px used in the Core reference's manual-header workaround; button labels in this file use a bigger type ramp than headers.
- Button label placeholder on every variant, verbatim: **"버튼명"** (literally "button name" — a placeholder token, not real copy).

**This independently corroborates and does NOT supersede** the Core reference's `btn_bottom_page_assets` (key `0fc4758ec4ab4c83ad6052748c3dabf76d0542e8`) and `btn_bottom_page_assets_gray` (key `873d1a7bbe44364aef31c19bbf15f19d7d457265`) — `get_design_context` does not surface a raw `componentKey` the way `importComponentSetByKeyAsync` does, so the literal key string couldn't be re-confirmed byte-for-byte in this pass, but every variant name, prop name, and hex value read off `323:6376`/`323:6434` matches the Core reference's documented axes (`Channel`, `Type`, `Status`) exactly, which is the strongest available confirmation short of the key itself.

## Draft A/B — Container Button (`btn_container_large` / `btn_container_regular`)

On-canvas heading "Container Button". Two size classes, each with its own body copy (verbatim):

- **"large"**: **"화면 중간 혹은 박스(컨테이너) 내에 쓰이는 cTA 버튼으로 시각적 계층구조에 맞게 사용합니다."** ("a CTA button used mid-screen or inside a box/container; use according to visual hierarchy")
- **"regular"**: **"기본적인 버튼입니다. 콘텐츠 밸런스에 맞게 사용합니다."** ("a basic button; use according to content balance")

Variant axes: `Strength` (`1`, `2-NM`, `2-QV`, `3-gray`, `3-bluegray`, `4(line)`, `4(line)-R`) × `Height` (`h60`/`h54`/`h50`/`h46`/`h40`/`h32`/`h30`/`h26`/`h20` depending on size class) × `Status`(`normal`/`disabled`) × for `_large` only, `Location`(`in page`/`in box`).

**Height-scale annotation, verbatim (336:377:39-43):** `h60 > 40`, `h54 > 36`, `h46 > 30`, `h40 > 26`, `h32 > 20` — reads as an internal padding/line-height mapping table for each button height, but the exact semantics (px inset? font size drop?) are not spelled out anywhere on the page — **gap, don't guess.**

**Strength naming is inconsistent with itself**: `2-NM` / `2-QV` exist only at the largest sizes (h60-ish grid in `btn_container_large`); at smaller heights the axis collapses to plain `2-gray` with no channel split. This mirrors a broader pattern in this design system where channel-specific variants exist only at certain scales.

Draft B (`1718:1430`) adds an **"exception" row** absent from Draft A, verbatim: **"예외적인 버튼입니다. 꼭 필요한 상황에서만 사용합니다."** ("an exceptional button; use only when strictly necessary"), covering two named cases:
- **Stock plus / 관심그룹 화면 하단에 들어가는 예외 케이스** (`btn_container_except_stockplus`, 1718:1656) — exception case appearing at the bottom of the watchlist-group screen
- **Keyword / 삭제가 가능한 키워드형 버튼입니다. 검색어, 필터 등에서 사용합니다.** (`btn_container_except_keyword`, 1718:1663) — a deletable keyword-chip button for search terms/filters, with `Type=squre`/`line` sub-variants (note: "squre" is the guide's own typo for "square", verbatim from the layer name).

## Draft B only — Order (Buy&Sell) Button

On-canvas heading "Order Button". Body copy verbatim: same bottom-button description as Bottom, reused ("페이지/팝업 하단에 쓰이는 기본 버튼입니다.") — **this looks like a copy-paste that wasn't customized for Order's actual content** (Order is about buy/sell coloring, not generic bottom placement).

Screenshot of `1718:1391`'s sibling `1718:1296` confirms the core rule visually: **매수(buy) = red, 매도(sell) = blue** — this is the *same* red/blue mapping documented for 상승(up, red)/하락(down, blue) market-direction color in `nds-ux-guide-updown-notation` and `nds-mweb-colors.md`'s NM `others` group (`상승 #D73838` / `하락 #247EF2`). Buy inherits the "up" red, sell inherits the "down" blue — a direct semantic bridge between the transaction action and the market-direction convention, not independently documented anywhere else.

Three sub-sections, each with `Order=buy`/`sell` axis:
- **Bottom** (`btn_order_bottom`, 1718:1322) — Type `1-btn`/`1:2-btn`/`2-btn` × Status, full page-bottom order CTA
- **Container "regular" / 매수/매도 기본 버튼입니다.** (`btn_order_container`, 1718:1297) — Height `h74`/`h54`/`h50` × Status, small in-content buy/sell pair
- **Container "list" / 리스트, 박스(컨테이너) 등 내에 사용합니다.** (`btn_order_container_list`, 1718:1376) — `Type=3-btn`/`2-btn`/`2-btn 우정렬`(right-aligned) — no Order axis, this is a row-level control (매수/현재가/상세정보 etc. per the screenshot)
- **Order-list assets** (`btn_bottom_orderlist_assets`, 1718:1279) — 8-color swatch set: `Color=buy`/`sell`/`primary-NM`/`primary-QV`/`기본-gray039`/`기본-gray101`/`비강조-white063`/`강조-gray245` — a small color palette specific to list-row action buttons, distinct from the Essential palette in `nds-mweb-colors.md`.

The Order screenshot (`1718:1296`) also shows a **List** row example with outlined pill buttons ("매도", "매수", "상품매수") alongside plain-text rows ("현재가", "상품상세", "상세정보") — confirms `btn_order_container_list`'s "3-btn"/"2-btn" types are meant to sit inline in a table/list row, not as standalone CTAs.

## Draft B only — Text Button (TXT / Quaternary Button)

On-canvas heading "Text Button". Body copy verbatim: **"부가적으로 사용되는 Quaternary Button"** ("a supplementary Quaternary button") — this is the first place in the NDS_M.web learning so far that names a 4th button tier explicitly (Primary=NM/QV fill, Secondary/Tertiary presumably the `Strength` container variants, Quaternary=text-only).

Three named types, screenshot-confirmed (`1718:1391`):
- **txt icon** (`btn_txt_icon`, 1718:1392) — rule verbatim: **"기능 버튼 : 아이콘 우정렬 / 영역 설명 : 아이콘 좌정렬"** ("action button: icon right-aligned / area-description: icon left-aligned"). Sub-variants `TXT Size=21pt`/`18pt` × `icon location=left`/`right`.
- **txt arrow** (`btn_txt_arrow`, 1718:1405) — rule verbatim, and repeated identically in Draft C (`2854:357`): **"'더보기' 텍스트는 사용하지 않습니다."** ("do not use the text '더보기' [more]") — i.e. the arrow-suffixed text button must carry a real label, never the generic "more" placeholder. `Type=18pt`/`21pt`.
- **txt only** (`btn_txt_only`, 1718:1427) — rule verbatim: **"특별한 경우에만 사용합니다. (ex. 박스 전체가 터치영역)"** ("use only in special cases, e.g. when the entire box is the touch target"). Single `Property 1=Default` variant.

This "txt arrow" rule (repeated verbatim in both Draft B and Draft C, the only rule that survived unchanged across drafts) is the single most confidently-stable fact on this page.

## Draft C only — CTA with scroll-to-top FAB

`btn_bottom_cta` (`1728:244`) variant `Top FAB=on`/`off` — pairs the CTA button with an optional floating "back to top" button (▲ icon, per the screenshot's `↑` glyph at `1730:791`'s CTA row). No Draft A/B equivalent exists; this appears to be new functionality introduced only in the newest redesign. **Not corroborated elsewhere in the domain** — flag as unverified/new until cross-checked against a real shipped screen.

Draft C's global rule, verbatim (`1730:796`, sits above all three Bottom sub-sections): **"버튼명 텍스트 박스에서 넘치지 않도록"** ("make sure the button label doesn't overflow its text box") — a text-overflow constraint not present anywhere in Draft A/B.

Draft C's Container section carries its own scoping rule, verbatim (`1730:952`): **"사용하고자 하는 width값까지 늘려서 사용가능 (최대 492)"** ("can be stretched to whatever width value you need, max 492[px]") — plus a nudge to use the adjacent example, verbatim (`1730:1509`): **"example을 활용해보세요!"**. Draft C also adds a **Stock** sub-variant (`btn_container_stock`, 1730:675, `Type=매수`/`매도`) inside the Container section — folding Order's buy/sell coloring into the Container button family, where Draft A/B kept them as entirely separate top-level categories ("2. Container" vs "4. Order").

## The dated usage-rules annotation (Draft B only, `Button_usage` frame, 1718:1745)

This is the highest-value single text block on the page — explicit governance rules, verbatim, dated and attributed:

> **"제공된 라이브러리 이외의 버튼은 사용을 지양합니다. Assets 수정은 디자이너와 협의가 필요합니다. (for designer) 예외케이스는 해당하는 templates에 추가하도록 합시다. 페이지 하단 '매수 버튼'이 상품에 사용될 때 1:2 버튼을 사용합니다. 페이지 하단 '이전 다음 버튼'이 투자설명서에 사용될 때 1:1 버튼을 사용합니다."**

Translation sense: avoid buttons outside the provided library; asset edits require designer consultation; exception cases should be added to the relevant templates; the bottom "buy button" uses a 1:2 split when used on a product page; the bottom "prev/next button" uses a 1:1 split (i.e. `1-btn`/`2-btn`, not `1:2-btn`) when used on a prospectus (투자설명서) page.

**Attribution, verbatim: "Last update 2022.10.31 구자영"** — this is the oldest dated artifact found in the NDS domain so far (compare `nds-ux-guide-tab`'s `22.11.17`, `nds-ux-guide-popup`'s `22.11.21`, `nds-ux-guide-date-picker`'s `25.10.16`). Given Drafts B and C both postdate this note structurally (Draft C adds whole new button types this note never anticipated), **treat this 2022 rule as historically authoritative but possibly incomplete for Draft C's newer CTA/FAB and Stock-container additions** — nothing on the page updates or supersedes it explicitly.

Also present (`1718:1746-1751`), a short numbered usage-method note, verbatim: **"1. 상황에 맞는 적절한 버튼을 가져다 사용합니다." / "2. 케이스별 properties를 확인합니다."** ("1. Bring in the appropriate button for the situation. 2. Check the properties per case.") — generic, low new-information-value, included for completeness.

## Unrelated pasted content on this page (not button spec — for the record)

Three large frames (`1676:1517`, `1676:1667`, `1676:1818`) are full marketing/product pages ("250523_kodex 미국 휴머노이드로봇 웹페이지" ×2, "연금펀드_리라이팅") pasted onto this canvas far to the right of the button-spec frames. They contain a real `btn_cta` instance in context (a full-width green CTA "ETF 상세 확인하기" bar) and Compliance Notice / 투자 유의사항 disclaimer blocks. These are **reference examples of the CTA button in production use**, not part of the button design-system spec itself — noted only so a future learn doesn't mistake them for additional button categories.

## How this feeds BUILD mode

- **Default to Draft A/B's `btn_bottom_page_assets` / `btn_bottom_page_assets_gray`** for any bottom-button work — these are the ones cross-confirmed against the Core reference's componentKeys and against `nds-mweb-colors.md`'s independently-learned hex values (both channel normal fills and both disabled-alpha percentages matched exactly).
- **Order buttons**: buy=red, sell=blue, following the same convention as market up/down — safe to reuse `#D73838`/`#247EF2` from `nds-mweb-colors.md` if no Order-specific hex gets pulled directly.
- **Text/Quaternary buttons**: never use literal "더보기" as a txt-arrow label; this is the one rule confirmed twice, verbatim, across two independent drafts.
- **If the request touches CTA-with-FAB or a Container "Stock" buy/sell chip**, that's Draft-C-only territory — flag it as new/unverified rather than assuming it's shipped, since it has no corroboration elsewhere in the domain yet.
- **Never silently pick a draft.** If a build task cites "the button page" without specifying which variant-naming convention (`Status`/`disabled` vs `State`/`disable`), ask, or default to Draft A/B since it's the one with Core-reference corroboration.

## GAPS (blank or unverifiable at source — do not fill in)

- The `h60 > 40` / `h54 > 36` / etc. height-mapping annotation (`336:377:39-43`) has no accompanying explanation of what the right-hand number represents.
- Draft C's indigo/purple CTA fill color has no named token anywhere on the page or in `nds-mweb-colors.md` — unresolved.
- No component key was directly re-derivable for any Draft C component (`btn_bottom_basic`, `btn_bottom_cta`, `btn_container_basic`, `btn_container_stock`) — these were only read via `get_metadata`/screenshot, not `get_design_context` or `importComponentSetByKeyAsync`, in this pass.
- Whether Draft C is meant to **replace** Drafts A/B or is a **parallel exploration** is not stated anywhere on the canvas — this is the crux of the `(진행중)` status and is unresolved by design, not by omission on this pass's part.
