# LEARN forensics — NDS_Library

- **fileKey**: `72zrHgMLM4zhCjgSuTf7cC`
- **source_url**: https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=3408-8606
- **learned_date**: 2026-07-16
- **Enumeration method**: `use_figma` → `figma.root.children` (the only authoritative source)
- **Total pages**: **51**
- **Content pages (denominator)**: **42**
- **Skipped**: 9 (2 empty section headers, 6 navigation card-grids, 1 cross-file link page) — each probed, none skipped on name alone

> **This is the library file itself** — the one `CORE.md`'s `NDS_Library` libraryKey points at, and the one
> NDS_Templates subscribes to. The three previously-learned files (UX Guide, M.web, Templates) *describe* or
> *consume* these components. This file is where they are defined.

## ⚠️ Triage by page name does NOT work in this file

The `figma-learn-all-pages` heuristics (indent + `- ` prefix = content; underscore-padded = header/cover) are
**wrong in three independent directions here**. Every one was caught by probing, not by reading names:

| Page | Name says | Truth |
|---|---|---|
| ` 📖 Justify_____________________` | underscore-padded → cover/header | **119,629 chars of content** — `get_metadata` overflowed |
| `🌈 Graphic asset______________` | underscore-padded → header | **Real rules** — recommended sizes per asset class |
| `🎨 Foundation_________________` | underscore-padded → header | Genuinely empty ✅ |
| `🖼️ Components________________` | underscore-padded → header | Genuinely empty ✅ |
| ` ` (id `3408:8605`, last page) | blank name → separator | **Working page w/ 정렬 순서 rationale, V1/V2/V3 history, the `guide_parent` COMPONENT_SET, and 6 pasted screenshots** |
| `📍 Navigations` etc. (×6) | header | Not empty — nav card-grids of `guide_parent` instances. No rules. Skip ✅ |

**Rule for this file: probe every page with `get_metadata(nodeId)`. Never skip on the name alone.**
Two of the four underscore-padded "headers" hold real rules; the blank-named page holds some of the most
unique content in the file. A name-driven triage here would have shipped "38/38 complete" against a true 42.

## Page manifest (verbatim from `figma.root.children`, 2026-07-16)

| # | nodeId | Name | Class | Note |
|---|---|---|---|---|
| 1 | `3408:8606` | `👋  Welcome___________________` | **content** | license + TOC + card grid |
| 2 | `1867:20156` | ` 📖 Justify_____________________` | **content** | 119k — overflows |
| 3 | `476:10293` | `🎨 Foundation_________________` | skip | empty (probed) |
| 4 | `2283:9973` | `    - Colors` | **content** | |
| 5 | `208:2042` | `    - Typography` | **content** | |
| 6 | `19851:347` | `🌈 Graphic asset______________` | **content** | asset-class sizing rules |
| 7 | `476:10295` | `    - Icons` | **content** | |
| 8 | `15422:15275` | `    - Emoji & Nmoji` | **content** | |
| 9 | `19888:18193` | `    - Infographic` | **content** | |
| 10 | `1165:16606` | `    - Illusts` | **content** | |
| 11 | `59389:2505` | `    - Lottie animation` | **content** | |
| 12 | `2283:9975` | `    - Images` | **content** | |
| 13 | `39:58` | `    - Img Naming Rule` | **content** | |
| 14 | `476:10294` | `🖼️ Components________________` | skip | empty (probed) |
| 15 | `7271:11812` | `    - Layout  레이아웃` | **content** | |
| 16 | `7247:11970` | `📍 Navigations  내비게이션` | skip | nav card-grid (probed) |
| 17 | `0:1` | `    - Top Navigation (Header)  헤더` | **content** | |
| 18 | `338:6691` | `    - Bottom Navigation (Quickmenu)  퀵메뉴` | **content** | |
| 19 | `1935:15771` | `    - Tab  탭` | **content** | |
| 20 | `7247:11965` | `📍 Button / Overlays  버튼 / 오버레이` | skip | nav card-grid (probed) |
| 21 | `45:621` | `    - Box Button  버튼` | **content** | |
| 22 | `5913:10937` | `    - Popup  팝업` | **content** | |
| 23 | `5261:10694` | `    - Tooltip  툴팁` | **content** | |
| 24 | `2283:9982` | `    - Dialog (snack bar, toast message)  스낵바, 토스트, 넛징` | **content** | |
| 25 | `7247:11968` | `📍 View  보기방식` | skip | nav card-grid (probed) |
| 26 | `50814:3570` | `    - Title  타이틀` | **content** | |
| 27 | `2283:9978` | `    - List  리스트` | **content** | |
| 28 | `353:6951` | `    - Card  카드` | **content** | |
| 29 | `375:7499` | `    - Data Table  테이블(표)` | **content** | |
| 30 | `17535:15607` | `    - Chart  차트(그래프)` | **content** | |
| 31 | `7247:11966` | `📍 Inputs  입력` | skip | nav card-grid (probed) |
| 32 | `46:622` | `    - Pulldown (Select)  풀다운, 셀렉트박스, 콤보` | **content** | |
| 33 | `2283:9979` | `    - Text Field (Input)  텍스트필드, 인풋` | **content** | |
| 34 | `4357:9138` | `    - Account Contoller  계좌 컨트롤러` | **content** | [sic] "Contoller" |
| 35 | `19644:2695` | `    - Search bar (Filter, Sort)  검색, 검색창` | **content** | |
| 36 | `371:7729` | `    - Controls (toggle, switch, check, radio)` | **content** | |
| 37 | `7247:11967` | `📍 Indicators  표시자` | skip | nav card-grid (probed) |
| 38 | `2283:12892` | `    - Label (Tag)  라벨` | **content** | |
| 39 | `2846:8724` | `    - Indicators (pagination, step)` | **content** | |
| 40 | `7247:11969` | `📍 Others  기타` | skip | nav card-grid (probed) |
| 41 | `13717:14694` | `    - 유의사항` | **content** | |
| 42 | `28884:2873` | `    - Number Keypad  숫자 키패드` | **content** | |
| 43 | `5461:10188` | `    - Security Keypad  보안 키패드` | **content** | |
| 44 | `77050:8664` | `    - 9-patch 나인패치` | **content** | |
| 45 | `1867:19979` | `👀 Archive________________` | skip | link page → NDS_Templates (probed) |
| 46 | `10:1347` | `    - Search bar Archive` | **content** | archive |
| 47 | `8883:12961` | `    - Icons Archive` | **content** | archive |
| 48 | `46732:1202` | `    - Illusts Archive` | **content** | archive |
| 49 | `71611:7011` | `    - Emoji & Nmoji / Infographic Archive` | **content** | archive |
| 50 | `2283:15426` | `    - 썸네일` | **content** | archive |
| 51 | `3408:8605` | ` ` (blank) | **content** | working page — see ⚠️ above |

**Coverage: 42 content pages. 9 skipped, each probed and justified above.**

## Registry rows — 42/42 content pages

**Status is evidence-based, never inferred from the page name.** Note the **independent stamp conventions**: some
pages carry `Last update <date> <author>`, `- Images` has a bare date, and many carry **nothing at all** — where
there is no stamp, `live` rests on populated masters + zero deprecation markers, **not on a date. Say so.**

| Page | Note | Status (+ evidence) |
|---|---|---|
| `👋  Welcome` | nds-lib-welcome.md | **live** — carries the dated `Library Update` changelog (latest 2024.06.07) |
| ` 📖 \bJustify` [sic, U+0008] | nds-lib-justify.md | **unknown** — no stamp; 3-slide fragment; not deprecated either |
| `    - Colors` | nds-lib-colors.md | **live** — signpost page only (2-node pointer to `NDS_Colors`); no spec |
| `    - Typography` | nds-lib-typography.md | **live** — `Last update  2022.10.12  구자영`; 36 local styles resolve |
| `🌈 Graphic asset` | nds-lib-graphic-asset.md | **live** — no stamp; rests on populated masters |
| `    - Icons` | nds-lib-icons.md | **live** — no stamp |
| `    - Emoji & Nmoji` | nds-lib-emoji-nmoji.md | **live** — no stamp |
| `    - Infographic` | nds-lib-infographic.md | **live** — usage card stamped 2023.12.06 송수연 (**dates the CARD, not the inventory** — assets clearly postdate it) |
| `    - Illusts` | nds-lib-illusts.md | **live** — `Last update 2025.10.24 유상엽` (freshest content page) |
| `    - Lottie animation` | nds-lib-lottie-animation.md | **live** — `Last update 2025.11.14 유상엽` |
| `    - Images` | nds-lib-images.md | **live** — bare date `2026.01.26`, no label/author (may date one section only) |
| `    - Img Naming Rule` | nds-lib-img-naming-rule.md | **live** — own stamp 2023.06.26 우채희, **but STALE vs its own content** (its lottie section is cited by a 2025-11-11 policy) |
| `    - Layout  레이아웃` | nds-lib-layout.md | **unknown** — **zero date strings anywhere**; do NOT infer from the page name |
| `    - Top Navigation (Header)` | nds-lib-top-navigation.md | **live** — NO stamp (0 TEXT nodes match "Last update"), no usage frame; **recency unknown** |
| `    - Bottom Navigation (Quickmenu)` | nds-lib-bottom-navigation.md | **live, frozen** — badge `👿 NDS 추가 개발 해당없음` (**scope declaration, not deprecation**); no stamp |
| `    - Tab  탭` | nds-lib-tab.md | **live** — `Last update  2025.12.18 박의정` (newest in the file) |
| `    - Box Button  버튼` | nds-lib-box-button.md | **live** — `Last update 2022.10.31 구자영` |
| `    - Popup  팝업` | nds-lib-popup.md | **live** — `Last update 2024.06.20 구자영` |
| `    - Tooltip  툴팁` | nds-lib-tooltip.md | **unknown** — NO stamp, no usage panel |
| `    - Dialog (snack bar, toast message)` | nds-lib-dialog.md | **live** — `Last update 2025.09.15 우채희` |
| `    - Title  타이틀` | nds-lib-title.md | **live** — no stamp; structural evidence (well-formed documented set) |
| `    - List  리스트` | nds-lib-list.md | **live** — `Last update 2023.02.07 구자영` |
| `    - Card  카드` | nds-lib-card.md | **live** — `Last update 2023.02.09 구자영` |
| `    - Data Table  테이블(표)` | nds-lib-data-table.md | **unknown** — no stamp; its one non-asset section is an empty shell |
| `    - Chart  차트(그래프)` | nds-lib-chart.md | **live** — no stamp; structural evidence |
| `    - Pulldown (Select)` | nds-lib-pulldown.md | **live** — `Last update 2022.11.14 구자영` |
| `    - Text Field (Input)` | nds-lib-text-field.md | **live** — `Last update 2022.11.18 구자영` |
| `    - Account Contoller` [sic] | nds-lib-account-controller.md | **live** — **NO stamp, no usage frame at all** |
| `    - Search bar (Filter, Sort)` | nds-lib-search-bar.md | **live** — `Last update 2023.08.07 구자영` |
| `    - Controls (toggle, switch, check, radio)` | nds-lib-controls.md | **live** — `Last update 2022.11.04 구자영` (assets 2025.05.16) |
| `    - Label (Tag)  라벨` | nds-lib-label.md | **live** — `Last update 2023.06.20 구자영` |
| `    - Indicators (pagination, step)` | nds-lib-indicators.md | **live** — `Last update 2022.11.08 구자영` |
| `    - 유의사항` | nds-lib-precautions.md | **live** — `Last update 2022.10.25 구자영` |
| `    - Number Keypad  숫자 키패드` | nds-lib-number-keypad.md | **live** — no stamp; late-extension node ranges (46xxx/58xxx) prove ongoing work |
| `    - Security Keypad  보안 키패드` | nds-lib-security-keypad.md | **live but CONTESTED** — no stamp; `as-is`/`to-be_230413`/`아름경은ver` all unresolved |
| `    - 9-patch 나인패치` | nds-lib-9-patch.md | **unknown** — NO stamp; its embedded guide is a **2018 screenshot** |
| `    - Search bar Archive` | nds-lib-search-bar-archive.md | **deprecated** — ⚠️ **CROSS-FILE evidence, not self-marked**: matches NDS_Templates `2. Search bar_legacy`, badged `👿 NDS 추가 개발 해당없음` + red `사용을 지양합니다.`; own stamp 2022.10.21 predates live 2023.08.07 |
| `    - Icons Archive` | nds-lib-icons-archive.md | **superseded** — live Icons defines itself AGAINST it: `nds_icon 이전 리소스와 구분되는 NDS만의 아이콘 입니다.` Local markers `원형 구버전`, `👿 일단 제외` stand independently |
| `    - Illusts Archive` | nds-lib-illusts-archive.md | **superseded** + **65/153 individually ghosted at `opacity 0.10`** — meaning UNSTATED, unresolved |
| `    - Emoji & Nmoji / Infographic Archive` | nds-lib-emoji-nmoji-infographic-archive.md | **superseded** (nmoji grid) / **unknown** (scratch cluster) — shares live's **exact `nds_nmoji42` gap** → same lineage, live is 3 ahead |
| `    - 썸네일` | nds-lib-thumbnail.md | **unknown** — judged on its OWN evidence; "archive" is inherited from page position only. File-cover art, not spec |
| ` ` (blank, page 51) | nds-lib-sort-order-working-page.md | **working-draft** — orderings are historical; the `guide_parent` / `Component 1` keys on it are live |

## What this pass changed in the domain

**Resolved** — `#radio-keys-never-sighted` (sighted; Core's keys correct) · `#header-basic-keys` (collision REAL;
**root cause found** — nested `header_title_txt` has duplicate variants) · `#tab-2depth-chip-source` (found; it is a
defined-but-never-used orphan).
**Corroborated, NOT resolved** — `#search-bar-states` ⛔ (4th confirmation; the library really does ship 3 and the
guide really does demand 4 + 탐색형 + mic).
**Corrected in `CORE.md`** — labels/body font is **NanumBarunGothic**, not Pretendard · `quickmenu_basic` is not
"5 icons + hamburger" · `header_basic` is neither broken nor deprecated.
**New gotchas promoted to `CORE.md`** — 10 (four invisibility mechanisms) · 11 (U+0008 in shipped names) ·
12 (N2 vs QV) · 13 (names aren't identifiers; counts are stale) · 14 (the 컬러넘버 legend) · 15 (licence constrains
outputs) · 16 (the Wanted maturity scheme is not NH's).

## Method notes for the next pass on this file

- **`remote: false` here means MASTER.** This is the home library. An agent classified the masters as
  "documentation re-creations, do NOT import" on that basis — **inverted**, and it would have blacklisted
  `header_basic`, `quickmenu_basic` and `nds_icon_header`. Proof: `header_stock` reads `remote: false` here with
  the exact key Core records as verified from files where it reads `remote: true`.
- **Resolve instance → main via `getMainComponentAsync()` before recording any key.** `get_metadata` renders a
  COMPONENT_SET as `<frame>` and a COMPONENT as `<symbol>` — which is exactly what made `guide_parent` (standalone
  COMPONENT, `importComponentByKeyAsync`) look like a variant of `Component 1` (a SET). Wrong key **and** wrong
  import function.
- **Guard `variantGroupProperties` with try/catch** — 7 sets throw; a bulk sweep crashes without it.
- **Render every rule-bearing frame even when no `스크린샷` node exists.** 4 of 5 graphics pages had zero
  image-embedded rules, yet hid real information behind fill colour, opacity and spatial layout.
- **Known gaps, named rather than papered over:** ~43 of 143 Icons SETs uncaptured (`use_figma` payload truncated
  at 20 kB) · the component↔label **spatial** join is unextracted on Infographic (253 comps / 926 labels) and
  Illusts (140 / ~397), which **blocks any "find the asset for X" workflow** · `Tax(참고불가)` reason unknown ·
  the illust ×1-vs-필요배수 conflict unresolved · `nds_icon_header`'s rival key `94ffbc72…` comes from an
  unidentified library.
- **Next target suggested by this pass:** the Welcome `GO ->` hyperlink resolves to **NDS_Templates**
  (`1xE0qvn2yv3ZkQ9BwhKT1y`, node `1030:25730`) — the most likely home for `📖 Justify`'s missing
  `Structure` / `Type A` slides. That file is already learned 39/39, so this would be a **Mode 3 VERIFY**, not a
  fresh learn.
