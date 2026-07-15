# Source: NDS_M.web (`uVcmG6GgOl2J8EOlc22wob`)

> **Relocated 2026-07-15, verbatim.** This was part of `nds/LEADER.md` until that file hit ~36k tokens
> and stopped being readable in one pass. **Nothing was deleted** — every claim is still traceable to its
> Figma node and verbatim quote. **BUILD does not read this file**; it reads `../CORE.md` + `../INDEX.md`.
> This is LEARN/VERIFY forensics for one Figma file.

### NDS_M.web (`uVcmG6GgOl2J8EOlc22wob`) — coverage: 20/20 content pages, complete as of 2026-07-15

A **second, separate Figma file** from the NDS_UX Guide above — don't conflate them. This one is the **mobile-web component library** (`M.web`); the UX Guide is the app-side *rules* doc. Several page names collide across the two files (`Tab`, `Popup`, `버튼`, `유의사항`), so every registry row below names its file, and project files are prefixed `nds-mweb-` vs `nds-ux-guide-`.

Enumerated 2026-07-15 via `use_figma` → `figma.root.children`: **30 pages → 20 content** (name starts with `- ` after trim), 4 `___`-suffixed group headers (`🎨 Foundation`, `🌈 Graphic asset`, `🖼️ Components`, `📱Sample Page`), 5 `📍` section headers, 1 Welcome. As on the sibling file, `get_metadata` with no nodeId reported **1 page** — a 30× undercount. Never use it for coverage.

Verified-empty, not an omission: **`📍 Indicators` (`642:3945`) is a section header with no content pages under it.**

> **This file is its own library.** `get_libraries` returns `NDS_Colors`, `NDS_Darkmode Colors`, and **`NDS_M.web`** (libraryKey `lk-3be70d25016393cffa2f36eac4d994fcd5f0c6417dfd4e8a182bbb77346e00a57e7b97d48be832f9ef35e37b02862383ee65d47d437001b9182bd1103d6b3d6c`). **`NDS_Library` is NOT subscribed** — it appears only under `libraries_available_to_add`. Read the componentKey warning below before reconciling any key against the Core reference.

#### ⚠️ Three tiers of component live on this file — only one is safe for BUILD

Learning all 20 pages surfaced a pattern a naive read gets badly wrong:

| Tier | Example | Evidence | BUILD |
|---|---|---|---|
| **Published library component** | `nds_icon_arrow` set `dde648604e4d08cc6b99c44dda81ec73ccbb4b15` (matches Core exactly); `btn_bottom_page_assets` `0fc4758e…` (matches Core exactly, incl. variant axes + hex/alpha) | `getMainComponentAsync()` → `remote: true` | ✅ safe |
| **Page-local documentation re-creation** | `Table_cell` — Type list (`rate`/`with button`/`button`/`multi`/`2line`/`global`/`basic`) matches Core **verbatim**, but all 7 have different keys and are **standalone COMPONENTs, not one COMPONENT_SET with a `Type` axis** as Core implies | Structural mismatch | ❌ doc copy |
| **Unpublished export scaffolding** | `ndsw_ms_btn_rcheck` `469c197c…`, `ndsw_ms_btn_lcheck` `a821d596…`, `ndsw_ms_btn_radio` `a47b239f…` — built to generate export assets ("Export → ndsw_btn") | Local, unpublished, axis-poor vs Core | ❌ never |

**Five agents independently reported "key differs from Core reference." None were promoted.** Same name ≠ same component. Substituting these into a BUILD script would silently break it.

#### 🔴 `header_basic` — contested, do not act on

Four different keys surfaced under this one name; the conflict is **unresolved**:

| Source | key | kind reported |
|---|---|---|
| Core reference (below) | `c95043e94317fde7230298017f42dd8099e1cbdc` | unstated (flagged broken 2026-07) |
| M.web Top Navigation `317:607` | `d2b2c6f762ae23699a7246b671da753819e9a6c0` | unstated |
| M.web Dialog `572:616` | `7888c4556b44006dcde2d2c97a9b0d3f03455f08` | **componentSet** key |
| M.web 자주하는질문 `634:2138` | `6ebb7f6578174274ff2edfcd3b51cc4d98ccde61` | unstated, `remote: true` |

**These are probably not four rival components** — in Figma a COMPONENT_SET and each of its variant COMPONENTs carry *different* keys, and the reporting agents did not consistently distinguish which kind they read. `importComponentSetByKeyAsync` needs the **set** key. **Unresolved because the Figma session was read-only**: that call throws `"Can't call importComponentSetByKeyAsync in read-only mode"`, so no key could be live-tested. A write-capable session must re-check before Core's "broken" note is trusted or replaced. Do not guess.

#### `(진행중)` — 8 of 20 pages are work-in-progress at source

A first-class finding, not a footnote: these carry unstable specs and **a BUILD pass must not consume them as settled**. The tag is on the page name; the evidence below is what learning actually found on canvas.

| Page | What "(진행중)" actually means here |
|---|---|
| Layout | Placeholder copy throughout (`타이틀`, `버튼명`, Korean-numeral lorem ipsum) |
| Tab | **Zero rule copy**, no version stamp (sibling UX Guide tab page has 15 rule sections + `Last update 22.11.17`) |
| Box Button | **Three coexisting parallel drafts** of the same button system, disagreeing on variant naming (`Status`/`disabled` vs `State`/`disable`); Draft C adds an untokened indigo CTA + a live copy-paste artifact |
| Popup | Sliding-popup diagram's own **30px margin callout contradicts its instance's actual 24px** padding; orphaned `252525` text node; two captions in metadata that don't render |
| Tooltip | Page-name tag is the *only* WIP signal; content reads complete for what it covers, but nothing states what else is planned |
| Data Table | Title says "QV-NM Table Design Guide" but **zero QV content exists**; section copy ("테이블 필터입니다") doesn't match the rows beneath it |
| Pulldown | Captions all say "슬라이딩 팝업이 호출됩니다" but the only mocked interaction is an **inline dropdown** — self-contradictory; `16pt` variant renders at 21px |
| Controls | **toggle and switch do not exist** — a 95-node sweep incl. hidden found zero matching nodes, despite the page name promising them |

The 4 comparatively settled content pages: 자주하는질문, Dialog, Top Navigation, Archive (plus the 7 Foundation/Graphic-asset pages).

#### Unresolved / escalate — do not invent

- **`nds-ux-guide-nudge`'s two blank specs stay blank.** Dialog `572:616` does **not** resolve toast `최대 글자수` (marked `논의` at source) nor snackbar `지속 시간`. Worse: that page is named "Dialog (snack bar, toast message)" but **contains no snackbar at all** — only two toast mockups. Its `toast_basic` is a plain frame with **no componentKey** (`findAllWithCriteria` for COMPONENT/COMPONENT_SET returned zero).
- **Real cross-file contradiction, unadjudicated**: 유의사항 floating-bar 2-line text-box max width is **286px** (M.web `645:4572`, on-canvas caption) vs **428px** (`nds-ux-guide-precautions.md`). Different platforms may legitimately differ — **no winner picked**. Resolve with a designer; don't average.
- **Archive `1291:793` status is `unknown`.** Exhaustive metadata grep (`구버전|이전|미사용|deprecated|legacy|obsolete|Last update`…) plus screenshots of all 9 frames found **no** deprecation marker — and no positive "current" marker either. Treat nothing there as sanctioned until resolved. Its name is a hint, not evidence.
- **Attribution question**: `btn_bottom_page_assets` keys match the Core reference exactly, yet M.web does **not** subscribe to NDS_Library. Figma keys are unique per component, so Core's blanket *"All from NDS_Library unless noted"* may be mis-attributed for this component. Unverified.

| Project | File | Learned | Last reviewed | Notes |
|---|---|---|---|---|
| [nds-mweb-colors](projects/nds-mweb-colors.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Colors) | 2026-07-15 | — | **Highest-value page in this file.** Decodes the NDS color-style naming scheme that the Core reference below still calls undecodable — see Gotcha 4, now partially superseded. NM (Namuh) / QV Essential palettes with semantic Korean suffixes, e.g. `NM/ESS/primary/2.022(대표컬러)` = `#84C13D`, QV counterpart = `#FFAA1A`. |
| [nds-mweb-typography](projects/nds-mweb-typography.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Typography : Pretendard) | 2026-07-15 | — | Token declaration, not a rules essay: font families, 4 weights, 9-step size/line-height ramp. Pretendard-based — contrast the app side's NanumBarunGothic headers; different platform, different type stack. |
| [nds-mweb-icons](projects/nds-mweb-icons.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Icons) | 2026-07-15 | — | Three sections: `Icon_color usage` (a hard **allowlist** of which colour numbers an icon may use), `Icon_guideline` (~30 icon families, each with a Korean role label + `ndsw_i*` naming catalogue), and a flag set. |
| [nds-mweb-nmoji-emoji](projects/nds-mweb-nmoji-emoji.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Nmoji & Emoji) | 2026-07-15 | — | Asset library, not rules: two structurally identical but separate sets on one canvas — **Nmoji** (NH's in-house pictograms) and Emoji. Purpose is finding an asset and handing its export filename to dev. |
| [nds-mweb-infographics](projects/nds-mweb-infographics.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Infographics) | 2026-07-15 | — | Asset library, same template as Nmoji (dark header → export-rule block → grid of standalone components). Source of the `nds_infographic*` instances seen on the UX Guide's Principles page. |
| [nds-mweb-illusts](projects/nds-mweb-illusts.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Illusts) | 2026-07-15 | — | Asset library, largest of the group (5400×17865, ~4× Infographics) and the **only** asset set that is channel-differentiated (NM vs QV). |
| [nds-mweb-label-tag](projects/nds-mweb-label-tag.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Label (Tag)) | 2026-07-15 | — | The one page in the Graphic-asset group that is **not** a static asset library — a real variant-driven component, so it yields a genuine componentKey + variant-axis fact. Note: a COMPONENT_SET named `label_risk` renders on-canvas as `tag_basic` (name-vs-display mismatch). |
| [nds-mweb-layout](projects/nds-mweb-layout.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Layout) | 2026-07-15 | — | **(진행중.)** Non-linear APP→M.web size-conversion table (e.g. `75 (btn h75)→50`); **492px content width inside the 540px canvas** (24px margins); `card_grid_fund` padding presets (24 dense / 30 default); 2-col (240/12 gutter) and 3-col (158/9) grids. New single-observation finding: QV uses a **dark-navy statusbar** — structurally different chrome, not just the known green/orange accent swap. Not promoted (one observation). |
| [nds-mweb-top-navigation](projects/nds-mweb-top-navigation.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Top Navigation (Header)) | 2026-07-15 | — | `header_basic` (10 variants: mode light/dark × leftIcon/rightIcon/rightType=`기본`/`txt btn`/`two`/`-`) and `header_stock` (3 variants; translucent blurred ticker header with price+rate row). Adds a `rightType` axis Core never documented. Long titles **truncate with ellipsis, not wrap**. See the contested-`header_basic` warning above before using any key. |
| [nds-mweb-tab](projects/nds-mweb-tab.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Tab) | 2026-07-15 | — | **(진행중.)** Pure specimen/token sheet, **zero usage rules** — contrast `nds-ux-guide-tab.md`, which holds the actual "is it even a tab?" rules. Line tabs (fixed 2/3/4-col + swipe), pill tabs (NM `#2C363B` / QV `#0E1A49` active). **Core's `tab_2depth_chip` is NOT sourced here** — no name or axis match; its real source page is still unidentified. |
| [nds-mweb-box-button](projects/nds-mweb-box-button.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Box Button) | 2026-07-15 | — | **(진행중** — three parallel drafts, see table above.**)** The **real Figma-side button source of truth** that Core and the `nds-ux-guide-button` stub were both missing — it does **not** supersede that stub (which remains a genuine content-free Notion-routed page). Confirms `btn_bottom_page_assets`/`_gray` axes + hex/alpha **exactly** against Core. Buy=red/Sell=blue mirrors the market up/down convention. The "don't use '더보기'" text-button rule survives verbatim across two independent drafts. |
| [nds-mweb-popup](projects/nds-mweb-popup.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Popup 팝업) | 2026-07-15 | — | **(진행중.)** 슬라이딩/레이어 팝업 spec diagrams (padding, margins, min/max) + two "MAX Case" mockups. **Agrees with `nds-ux-guide-popup.md` everywhere they overlap** (default-to-sliding, scroll→풀팝업 escalation, 492px layer width) — additions only, no contradictions. Internal defect: its own 30px margin callout contradicts the adjacent instance's actual 24px padding. Surfaces 6 componentKeys incl. `Topbar_Dropdown` `69e7ffd4…` (the real component behind the header the UX Guide only mocks flat) and a `btn_bottom_layerpopup` **name-collision** (same variant string, two keys). |
| [nds-mweb-tooltip](projects/nds-mweb-tooltip.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Tooltip 툴팁) | 2026-07-15 | — | **(진행중.)** 6-variant `tooltip` set (Type=NM/QV × Status=notitle/normal/complex) + a shared `Polygon` caret (reused from the market up/down glyph). Extends `nds-mweb-colors`' tooltip token with the matching border/caret token. **No usage rules at all** — no trigger, dismiss, timing, or anchor-positioning guidance. Variant axis is named `Type`, not `Channel` — a naming inconsistency vs the domain convention. |
| [nds-mweb-dialog](projects/nds-mweb-dialog.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Dialog (snack bar, toast message)) | 2026-07-15 | — | Page name promises snack bar + toast but the canvas holds **only two toast mockups — no snackbar exists**. `toast_basic` is a hand-drawn frame with **zero componentKey**. Visual spec: `#303034` @90% pill, `Title/Preten/R/24` white text, optional `nds_icon_banginfo` leading icon. **Does not resolve either blank spec** in `nds-ux-guide-nudge.md`. Confirms `nds_icon_header` + `nds_icon_arrow` keys match Core exactly. |
| [nds-mweb-data-table](projects/nds-mweb-data-table.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Data Table) | 2026-07-15 | — | **(진행중.)** Confirms `Table_cell` and `Table_header` Type lists **verbatim** against Core, but every key differs and each Type is a **standalone COMPONENT, not a COMPONENT_SET with a `Type` axis** as Core implies — a page-local doc re-creation (see tier table). New undocumented `Table_control` (check/radio row-selection), never used in either composed example. Core's "poor fit for multi-field cards" claim is **neither confirmed nor refuted** — no such example exists here. Unreconciled `NAMUH/*` vs `NM/*` token duplicate for up/down. |
| [nds-mweb-pulldown](projects/nds-mweb-pulldown.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Pulldown (Select)) | 2026-07-15 | — | **(진행중.)** Two unconnected frames: Filter Select Box (pill chips, channel-split selected state, inline-expanding COMBO panel) and Line Select Box (underline field + bare-text TXT variant, mixed NanumBarunGothic/Pretendard). **All locally-scaffolded frames — no published key for any variant**; consistent with Core having no pulldown/select entry either. New axis pattern: `강조+selected` is channel-split (NM green / QV orange) while `기본+selected` is channel-agnostic black. |
| [nds-mweb-controls](projects/nds-mweb-controls.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Controls (toggle, switch, check, radio)) | 2026-07-15 | — | **(진행중** — largely empty.**)** Only 2 frames exist, **both misleadingly named `2. Check`**; covers Check (SOLID/LINE) and Radio (SOLID) as bare export-spec sheets. **Toggle and switch do not exist anywhere on the page** (95-node sweep incl. hidden = zero hits). **None of Core's 5 control keys are here**; the local `ndsw_ms_btn_*` sets are unpublished export scaffolding — never substitute them. Independently corroborates Core's "bare 26×26 radio / bare glyph, no label slot" facts. |
| [nds-mweb-faq](projects/nds-mweb-faq.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — 자주하는질문) | 2026-07-15 | — | One of the few **genuinely finished** pages (real feature copy, not placeholder). Single FAQ screen for 큰손PICK (13F-filing stock picks): 4-item accordion, Q1 expanded with full real answer copy, **Q2–Q4 answers absent from the file entirely** (not hidden — no node exists), so they must be sourced elsewhere, never invented. Documents the accordion chevron pattern (`nds_icon_arrow` `Type=up` = expanded / `down` = collapsed), not previously recorded. All 5 instances verified `remote: true`. |
| [nds-mweb-precautions](projects/nds-mweb-precautions.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — 유의사항) | 2026-07-15 | — | **(진행중.)** Mirrors `nds-ux-guide-precautions.md`'s Case 01/02/03 split (페이지 하단 / 플로팅 고정 / 호출 팝업) and **strongly corroborates it** with real legal-disclosure copy — 심사필-always-first, arrow-only "more", no separate background color. **One hard numeric contradiction: 2-line floating text-box max width 286px here vs 428px there — unadjudicated.** `유의사항_Content` reveals richer axes than documented anywhere else (`Type=기본/심사필/기본(강조포함)/당구장 × 줄개수=1줄/2줄`); `기본(강조포함)` and `당구장` are new. No componentKey resolvable (read-only session). |
| [nds-mweb-archive](projects/nds-mweb-archive.md) | `uVcmG6GgOl2J8EOlc22wob` (NDS_M.web — Archive) | 2026-07-15 | — | **Status: `unknown` — treat nothing here as sanctioned.** Exhaustive metadata grep + screenshots of all 9 frames found **no** deprecation marker (`구버전`/`미사용`/strikethrough/greyed-out/"→ 이동") **and no positive "current" marker**, so `live` was not guessed either. Holds a clean inventory (Typography scale, general + specific icon libraries, flag set, trading-state icons, button-state swatches) visually consistent with live pages. Resolve status before any BUILD use. |
