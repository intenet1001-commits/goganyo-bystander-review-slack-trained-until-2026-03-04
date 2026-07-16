---
name: nds-lib-layout
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=7271-11812"
learned_date: 2026-07-16
sections_studied:
  - "7271:11812 (page '    - Layout  레이아웃')"
  - "18384:18526 (section title — layer name '토스트/체결알림 정의', ON-CANVAS text '기본화면')"
  - "18384:18759 / 18384:18764 (frames '[NM] Screens' / '[QV] Screens' — the 540×987 base screen, both channels)"
  - "18384:18527 (section title — layer name '토스트/체결알림 정의', ON-CANVAS text '여백/간격'; subtitle 18384:18528 = '공통 스크린은 좌우 24pt의 기본 마진을 사용합니다.')"
  - "18384:18529 (frame 'Frame 9002' — six 540×987 'Screens' carrying the 📐 Measurements annotations: margins, grid columns, card padding, vertical rhythm)"
  - "18384:18308 (section title '상단 안내영역' — the ONE title whose layer name is honest)"
  - "18384:18309/18318/18322/18326 (frames '상단안내영역01'–'04' — top-guidance-area variants)"
  - "7271:13119 (section title — layer name '토스트/체결알림 정의', ON-CANVAS text '키보드 / 키패드 / keypad / keyboard')"
  - "7271:13161 (COMPONENT_SET 'keyboard', 7 variants)"
  - "10698:15832 (section title — layer name '토스트/체결알림 정의', ON-CANVAS text '스테이터스바 / status bar'); 1648:24967 (COMPONENT_SET 'statusbar')"
  - "10698:15837 (section title — layer name '토스트/체결알림 정의', ON-CANVAS text '섹션바 / 구분선 / section bar'); 10698:15838 (COMPONENT_SET 'sectionbar')"
  - "10902:14503 (section title — layer name '토스트/체결알림 정의', ON-CANVAS text '홈 전용'); 10902:14442 (COMPONENT_SET 'home_top')"
  - "54538:3381 (COMPONENT_SET 'date picker calendar', 4 State variants)"
status: "unknown — this page carries NO 'Last update' stamp and no Update History. Swept every TEXT node's verbatim characters for /update|업데이트|\\d{4}\\.\\d{2}\\.\\d{2}/ → zero hits. Its currency cannot be established from the page itself. Do NOT infer 'live' from the page name."
---

# NDS Library — Layout (레이아웃)

The **spatial foundation** of the NDS mobile screen: canvas size, margins, grid columns, card padding, and the chrome components (statusbar / keyboard / sectionbar / home_top) that bracket every screen.

Unlike `- Lottie animation` (which is blank where it promises values), **this page is genuinely dense with real numbers.** Every measurement below was read from live `📐 Measurements` annotation labels, not inferred.

## ⚠️ Name-reliability verdict: **UNRELIABLE — the worst of the four pages**

**Six separate section-title TEXT nodes are all layer-named `토스트/체결알림 정의`** ("toast / execution-notification definition"). **Not one of them is about toasts.** Every actual heading was recovered by screenshotting the node and reading the pixels:

| Node ID | Layer name (lies) | **Actual on-canvas text** (verbatim) |
|---|---|---|
| `18384:18526` | `토스트/체결알림 정의` | **`기본화면`** |
| `18384:18527` | `토스트/체결알림 정의` | **`여백/간격`** |
| `18384:18528` | `토스트/체결알림 정의` | **`공통 스크린은 좌우 24pt의 기본 마진을 사용합니다.`** |
| `7271:13119` | `토스트/체결알림 정의` | **`키보드 / 키패드 / keypad / keyboard`** |
| `10698:15832` | `토스트/체결알림 정의` | **`스테이터스바 / status bar`** |
| `10698:15837` | `토스트/체결알림 정의` | **`섹션바 / 구분선 / section bar`** |
| `10902:14503` | `토스트/체결알림 정의` | **`홈 전용`** |
| `18384:18308` | `상단 안내영역` | `상단 안내영역` ← **the only honest one** |

This is a copy-paste artifact: a title node was duplicated seven times and its *content* retyped while the *layer name* was never touched. **Anyone reading this page from `get_metadata` alone would conclude it is a toast/notification spec.** It is not — there is no toast content on the page at all.

**Rules embedded in screenshot images?** No pasted-screenshot nodes (swept `스크린샷`/`Screenshot`: zero hits). But the headings are recoverable *only* by rendering — so screenshotting was mandatory here for the same practical reason.

## `기본화면` — the base screen (`18384:18526`)

Two channel frames, structurally identical, 540×987:

- **`[NM] Screens`** (`18384:18759`) and **`[QV] Screens`** (`18384:18764`).

Both compose the same four chrome instances at the same coordinates — this is the **canonical screen skeleton**:

| Component | y | height |
|---|---|---|
| `statusbar` | 0 | 65 |
| `header_basic` | 65 | 60 |
| `btn_bottom_page` | 838 | 75 |
| `quickmenu_basic` | 913 | 74 |

So: **540×987 canvas; statusbar 65 + header 60 = 125px of top chrome; 75 + 74 = 149px of bottom chrome; 713px of content between y=125 and y=838.**

The NM/QV split here is the same `Channel` axis decoded in `nds-mweb-colors` — **structure is identical, only the brand identity differs.**

## `여백/간격` — margins & spacing (`18384:18527`)

**The governing rule, verbatim** (`18384:18528`):

> `공통 스크린은 좌우 24pt의 기본 마진을 사용합니다.`
> *("Common screens use a base margin of 24pt left and right.")*

Confirmed by the annotations on `18384:18535` (`📐 Measurements`): left rail `24px`, right rail `24px`, content width `492px`. And **540 − 24 − 24 = 492 ✓** — the arithmetic closes exactly.

**⚠️ `pt` vs `px` conflict**: the prose says **`24pt`**; every measurement label says **`24px`**. See Conflicts.

### The complete measurement-label inventory

Swept every TEXT node matching `/^\d+(px|pt)$/` across the page. **This is the exhaustive set** — there are no others:

`9px`, `12px`, `16px`, `24px`, `30px`, `60px`, `80px`, `158px`, `240px`, `492px`, **`60pt`**

Note `60pt` and `60px` **both appear**. The `pt`/`px` slippage is not a one-off in the prose — it reaches the annotation labels too.

### Grid columns (`18384:18641`, `18384:18671`)

Transcribed from the `card_grid_fund` frames and their `📐 Measurements` annotations:

| Columns | Column width | Gutter | Arithmetic check |
|---|---|---|---|
| **1-col** | `492px` | — | 492 = 540 − 48 ✓ |
| **2-col** | `240px` | `12px` | 240 + 12 + 240 = **492** ✓ |
| **3-col** | `158px` | `9px` | 158×3 + 9×2 = 474 + 18 = **492** ✓ |

**All three grids close on 492px exactly.** The gutter shrinks as columns multiply (12px → 9px) — it is *not* a constant. Do not assume an 8pt or 4pt grid; **these are hand-tuned to make 492 divide cleanly.**

### Card padding — two densities (`18384:18554` vs `18384:18591`)

Two `card_grid_fund` screens sit side by side, each a 492×216 outer card with an inner content frame, annotated on all four sides:

| Screen | Inner label (verbatim) | Padding (T/B/L/R) | Inner frame |
|---|---|---|---|
| `18384:18554` | **`데이터가 많을 때`** ("when there is a lot of data") | `24px` all four | 444×168 |
| `18384:18591` | **`기본`** ("default") | `30px` all four | 432×156 |

Check: 492 − 24×2 = 444 ✓; 492 − 30×2 = 432 ✓; 216 − 24×2 = 168 ✓; 216 − 30×2 = 156 ✓.

**`기본` (default) is the LOOSER one at 30px.** Tighten to 24px only when content is dense (`데이터가 많을 때`). This is counter-intuitive — the instinct is to treat the smaller number as the default. **It is not.**

Card-to-card vertical spacing: **`16px`** (`18384:18634`, labelled `spacing card_grid_fund - card_grid_fund`).
Topbar_Dropdown → first content group: **`30px`** (`18384:18628`).

### Vertical rhythm (`18384:18716`, frame `Guide`)

Five `spacing Topbar_Dropdown - Group NNNN` annotations inside a 540×2226 `Guide` frame:

| Node | Label | Value |
|---|---|---|
| `18384:18720` | `spacing Topbar_Dropdown - Group 9192` | **`60pt`** ← the lone `pt` |
| `18384:18726` | `spacing Topbar_Dropdown - Group 9193` | `60px` |
| `18384:18732` | `spacing Topbar_Dropdown - Group 9198` | `60px` |
| `18384:18744` | `spacing Topbar_Dropdown - Group 9195` | `60px` |
| `18384:18750` | `spacing Topbar_Dropdown - Group 9196` | **`80px`** |
| `18384:18738` | `spacing Topbar_Dropdown - Group 9197` | `60px` |

**60px is the standard section gap; one section takes 80px.** The `Guide` frame's own rectangles are 60/60/80 tall, corroborating. The `60pt` label (`18384:18725`) is almost certainly a `60px` typo — its geometry (`height=60`) matches the `60px` siblings exactly.

## `상단 안내영역` — top guidance area (`18384:18308`)

Four variants, `상단안내영역01`–`04`, all 540×987. Only `01` (`18384:18309`) is built from raw nodes; `02`–`04` use a `Subpage_top` **instance**.

`상단안내영역01` internals (`18384:18311`, `Subpage_top`, 540×200):

| Child | Position | Size |
|---|---|---|
| `box` (rounded-rectangle) | 0,0 | 540×188 |
| `Main Text` | 24,40 | 352×36 |
| `Sub Text` | 24,86 | 352×64 |
| `기본/모바일_illust23` (instance) | 376,24 | 140×140 |
| `line_section` (instance) | 0,188 | 540×12 |

Text starts at **x=24** — consistent with the 24px margin. Text column is **352px**, leaving the 140px illustration a 376–516 slot. **`line_section` is 12px tall** and sits flush at the box's bottom edge.

`02`–`04` all use `Subpage_top` at 540×**268** (vs `01`'s 200) — **a 68px difference.** The instances resolve to two *different* published component sets (`Type=1-btn` vs `Type=2-btn`) — see componentKeys.

## componentKeys

Read via `use_figma` on `7271:11812`, then **cross-checked against the library publish index** via `get_libraries` + `search_design_system`. All keys are `unverified` in the import sense — read-only session, `importComponentSetByKeyAsync` not exercised — but publish state below is **verified against the index**, not inferred.

### ⚠️ How to read `remote` in THIS file — the rule that inverts naive classification

**`NDS_Library` (`72zrHgMLM4zhCjgSuTf7cC`) is the home library: it is where these components are DEFINED.** Therefore:

- **`remote: false` = MASTER.** A master component always reads `remote: false` *in its own file*. This is expected and is **not** evidence of a documentation re-creation. These are the importable, canonical definitions.
- **`remote: true` = imported from elsewhere** — either from another library, **or from NDS_Library's own published snapshot** (see below).

Proof, not assumption: `get_libraries` shows **`NDS_Library` subscribes to ITSELF** (it appears in its own `libraries_added_to_file`, `libraryKey lk-e6bea415…`). So a component can exist here twice — as the live local master *and* as a stale re-import of its own earlier publish. **This single fact explains almost every "duplicate" on this page.**

Independent confirmation via `search_design_system`: the current published `statusbar` in NDS_Library is `e453babe03efec7dabe6c99a8db8d6a46eebac58` (updated 2026-04-09) — **byte-identical to the local `remote: false` key below**. Local here = master, confirmed by the publish record.

**Corrected classification scheme for this file:**

| Observed | Means |
|---|---|
| `remote: false` **+ key in publish index** | **MASTER — import this** |
| `remote: false` **+ key absent from index** | Local unpublished — WIP/scaffolding (category (c)) |
| `remote: true` **+ key absent from index** | **Stale self-import** — pinned to a superseded NDS_Library publish |
| `remote: true` **+ key traced to another library** | Genuine cross-library import |

### ✅ Verified MASTERS — `remote: false` AND present in the NDS_Library publish index

**These are the importable SET keys.** Variant COMPONENT keys listed separately below.

| Name | **SET key (40-hex)** | KIND | Variant axis | Variants | Published |
|---|---|---|---|---|---|
| `statusbar` | `e453babe03efec7dabe6c99a8db8d6a46eebac58` | COMPONENT_SET | `Type` | `N2`, `NM`, `Clear` | **✓ index, 2026-04-09** |
| `nds_icon_header` | `19619c9f1fd2e3c2e6515542d0484e651f3f30c6` | COMPONENT_SET | `Type`, `Color`, `Darkmode` | — | **✓ index, 2026-06-19** |
| `header_basic` | `c95043e94317fde7230298017f42dd8099e1cbdc` | COMPONENT_SET | `Channel`, `Left Icon`, `Right Icon` | — | **✓ index, 2026-04-07** |

`header_basic` `c95043e9…` is corroborated **6× as `remote: true` from other files** in LEDGER — same component, opposite side of the library boundary. That is exactly what a master looks like from outside.

### `remote: false` sets NOT individually confirmed in the index — treat as masters, publish state unverified

Same `remote: false` status as the confirmed masters above; I simply did not run a targeted `search_design_system` for each. **Default to treating these as masters** (that is the home-library norm), but confirm before relying on publish state.

| Name | **SET key (40-hex)** | KIND | Variant axis | Variants |
|---|---|---|---|---|
| `keyboard` | `a5d4c15eb9df4b8f1b17a2a39efb3a8851f0e7f0` | COMPONENT_SET | `Type` | `kor`, `eng`, `number`, `keypad`, `␈number_ios`, `␈password`, `␣date picker calendar` |
| `sectionbar` | `b3ebdba6c80b1e5a2fa5abc80c142719da0ebb93` | COMPONENT_SET | `Property 1` | `Sectionbar`, `Sectionbar_dark` |
| `home_top` | `7aab964b0e944edcee40d82056c1033df31349ae` | COMPONENT_SET | `Night mode` | `off`, `on` |
| `date picker calendar` | `00c6c5341eef01bf85f4a594770712bfc2b152cc` | COMPONENT_SET | `State` | `disable`, `normal`, `today`, `select` |

### ⚠️ `statusbar` `fe57c685f5a27a53c49fc56c9999456340140c2f` — `remote: false`, axes `Type` + `Dark mode`

**Did not appear** in the `statusbar` publish-index search, which returned the master `e453babe…` and the legacy `Statusbar` `e85a1956…` but not this. Likely **local unpublished (category (c))** — a WIP dark-mode-capable statusbar that has not been published. Flagged, not asserted (see Gaps re: search-absence).

`keyboard` variant COMPONENT keys (**different from the SET key** — do not confuse):

| Variant | COMPONENT key (40-hex) |
|---|---|
| `Type=kor` | `9fd5b004ee0c1d694c9565d324e0b9d0dcc9282a` |
| `Type=eng` | `fe3251fb06b094a2fe484028770d44d24eeec35c` |
| `Type=number` | `7da78c26b43d01cb338bca33439ef1c170f51f11` |
| `Type=keypad` | `7b711e01f4d4e9a5cc24bb810ee670b3925c6576` |
| `Type=␈number_ios` | `2c90f2730bd20d0f9b6e9747e1577f2ca2918e58` |
| `Type=␈password` | `d3725cfc300f39b88bd90bf480508e1b63c8f29a` |
| `Type=␣date picker calendar` | `ebda40ecb5509c2105c0213622c43de135828225` |

`statusbar` variants: `Type=N2` `1098e00d830f437069905760accd9a005015ecc1` · `Type=NM` `cb5f0b3d84426eeb3e20a2765b0612fb14263025` · `Type=Clear` `1f9ff35391121de528ca789beb2d6db358400374`
`sectionbar` variants: `Property 1=Sectionbar` `0d892f830112e3acb778cb36d17dc4470890a6b0` · `Property 1=Sectionbar_dark` `ba6628b5c1931cbb4570a154a2f90cf393d158bc`
`home_top` variants: `Night mode=off` `7eea5961f0380e815da2bb8fab83783969312cbf` · `Night mode=on` `578f58f166fa89dc7238ef9d0bca852577eea264`
`date picker calendar` variants: `State=disable` `b299aefe5a622126b4b0fc1cae3a33a2675e9947` · `State=normal` `df7e9f5f3252002a66a00f3a5b8d3fd9cfc0599d` · `State=today` `81707dc703fb4022c99a2faaa8cb3c6540ae8b22` · `State=select` `89000a07abb97b6d08071d406ce021e41fb3cc81`

### Remaining `remote: false` masters instanced on this page

Standalone COMPONENT: `기본/모바일_illust23` `8062d6b65e1863a1db6564d8cc68e85f591418b7`

COMPONENT_SETs: `btn_bottom_page` `accfb243ce752fd894af2b6db081b1074022a39d` (`Channel`/`Type`/`Status`) · `input_area` `40413cab7794da12eef4d6fcddeaecacbf1e09b6` (`Status`) · `ms_img_keypadcheck` `0b3f00a1a4522c437be4c84786704828deea7fec` (`Property 1`) · `btn_bottom_page_assets_gray` `873d1a7bbe44364aef31c19bbf15f19d7d457265` (`Type`/`Status`) · `btn_bottom_page_assets` `5b1b5d0489f7071a1f47dad454d46abb9ff31697` (`Channel`/`Type`/`Status`) · `header_title_txt` `3adbf2e221ffa7d8421e52a8e1b6cb51b0bb7e47` · `nds_icon_arrow` `dde648604e4d08cc6b99c44dda81ec73ccbb4b15` (`Color`/`Type`/`Height`) · `quickmenu_basic` `9c5dd3cd3e714255914cf288f442fad7c3ac76dd` (`Channel`/`Type`) · `ss_img_quickbar` `80fc818618096f42616ee1ec5f8f6f45a5fb1a4b` (`Type`)

### ⚠️ `remote: true` on this page — these are the IMPORTS, and they need the scrutiny

**Not "the published ones to import."** Each is either a stale snapshot of NDS_Library's own earlier publish (the file subscribes to itself) or a genuine cross-library import. **None of the keys below appeared in a current NDS_Library publish-index search.**

**Genuine cross-library import — traced:**

| Name | SET key (40-hex) | Axes | **Traced origin** |
|---|---|---|---|
| `Subpage_top` | `a64d3559986500518141a81b4a6dfce6a29c6ff4` | `Type` (=`1-btn`) | **NDS_Templates** — superseded |
| `Subpage_top` | `4aee11466d7a115bc3da7c400f20a3b527903fff` | `Type` (=`2-btn`) | **NDS_Templates** — superseded |

`search_design_system` shows **NDS_Templates currently ships ONE `Subpage_top` set: `d6ad46694b936bf545c099efa3d0a538f91696e4` (2025-10-29)** (`lk-6485b4ef…`). **That is the key to import** — not either of the two above. `Subpage_top` is **not an NDS_Library component at all**; it belongs to NDS_Templates.

**Stale self-imports / unidentified origin** — key absent from the current NDS_Library index; superseded snapshots still pinned by instances on this page. **Do not import these; use the master key instead.**

| Name | key (40-hex) | Axes | Master to use instead |
|---|---|---|---|
| `nds_icon_header` | `94ffbc72589e16b24dcaf3532c11b141e6195bf8` | `Type`, `Color` (**no Darkmode**) | `19619c9f…` (has `Darkmode`) |
| `statusbar` | `fef1ad4be14eea79c12365981b51051d21ea4a96` | `Type`, `Dark mode` | `e453babe…` |
| `statusbar` | `794235a4fc4e61da6624c9d26bbf7930438874bc` | `Property 1` (=`night`) | `e453babe…` |
| `sectionbar` | `c0a316e6e8146f8c524525073ac4de6801510f59` | `Property 1` | `b3ebdba6…` |
| `nds_icon_arrow` | `68b7311ec74030900f760598e9ba81a449387f2c` | `Color`, `Type`, `Height` | `dde64860…` |
| `Topbar_Dropdown` | `e307456ae4de9a6d7edd00dc8acb2363ce2aa7fc` | `Channel`, `Type`, `Combo` | not traced — see Gaps |
| `btn_container_regular` | `fd0a4e2fd7b3c49612b27963bd8bf41f1580910b` | `Strength`, `Height`, `Status` | not traced — see Gaps |
| `tooltip_icon` | `971d8993d7f1f627ff79663994521a60cca4d23c` | `Channel`, `Status` | not traced — see Gaps |

Standalone `remote: true` COMPONENTs (imports, origin not individually traced): `u:angle-down` `c1379900bad550fe85ad5688cff30763f884579b` · `icon_global` `5ea198ef5ae8ce536ea1c38b006f7402a566fa7c` · `icon_CI/NM` `5a3d129dcfd77e791e8365d26699913512264077` · `statusbar_darkmode` `2112d9e78926c14cb1f2dacbc1aac2f3398ede14` · `line_section` `03049eb5b61c955584ea22278756f0792f00e178` **and** `01f48dbb92a1ac117e6ca757b641742a33c7bc8a` · `icon_hamburger` `ac927a488cf3a61b43725113a9011aaeef332bd5` · `투자종류/글로벌투자_illust01` `f7ea398596e9ff4d6624c9f7d4cddda8018eefd2` · `QV/illust05` `26206b1ebac34a15c0e87581e479911dfb1c69ee`

`u:angle-down` is the one obvious foreign body — the `u:` prefix matches no NDS naming grammar and is almost certainly a third-party/community UI-kit icon.

### Superseded publish records surfaced by the index (not instanced here, but relevant)

| Name | key (40-hex) | Published | Note |
|---|---|---|---|
| `nds_icon_header` | `e40b494d13e6cab0e5cc2c8b5db57b2e5ac94243` | 2024-01-12 | older publish of the same set |
| `Statusbar` (capital S) | `e85a19561355a73969857f6c25d9dbb91c63c715` | 2023-08-07 | legacy retired set |
| `header_basic` | `07fb2e569ac9d8cd9e31b49cf8770209df58c089` | 2026-04-07 04:33:35 | **second `header_basic`, published 6s after `c95043e9…`** | · `statusbar` `fe57c685f5a27a53c49fc56c9999456340140c2f` (`Type`/`Dark mode`)

## Conflicts (for LEDGER)

> **Re-derived after a classification error.** An earlier draft of this note read `remote: false` as "documentation re-creation" and `remote: true` as "the published component". **That is inverted for a home library.** Conflicts 1–3 and 5–6 below are restated under the corrected lens; the underlying observations are unchanged, but their *meaning* is different — several turn out to be **staleness**, not disagreement.

0. **⭐ The root cause of most "duplicates" on this page: `NDS_Library` subscribes to ITSELF.** Confirmed via `get_libraries` — `NDS_Library` (`lk-e6bea415…`) appears in its own `libraries_added_to_file`. So the same component can be present twice: once as the **live local master** (`remote: false`) and once as a **stale re-import of its own earlier publish** (`remote: true`). Every local-vs-remote "duplicate" below is an instance of this. **This is the finding to record — the individual pairs are symptoms.**

1. **`statusbar`: FOUR sets, but ONE master — the other three are stale, not rival designs.** Re-derived:
   - **`e453babe03efec7dabe6c99a8db8d6a46eebac58`** — `remote: false`, axis `Type` = `N2`/`NM`/`Clear`. **✓ Confirmed in the publish index, updated 2026-04-09. THIS IS THE MASTER.**
   - `fe57c685f5a27a53c49fc56c9999456340140c2f` — `remote: false`, axes `Type` + `Dark mode`. **Not in the index** → local unpublished, likely WIP.
   - `fef1ad4be14eea79c12365981b51051d21ea4a96` — `remote: true`, `Type` + `Dark mode`. Stale self-import.
   - `794235a4fc4e61da6624c9d26bbf7930438874bc` — `remote: true`, `Property 1` = `night`. Stale self-import, older grammar.
   - `statusbar_darkmode` `2112d9e78926c14cb1f2dacbc1aac2f3398ede14` — `remote: true` standalone; dark mode as a separate component.
   - Also in the index: legacy **`Statusbar`** (capital S) `e85a19561355a73969857f6c25d9dbb91c63c715`, published 2023-08-07 — retired.

   **The defect is real but re-characterised.** It is *not* "four rival answers to dark mode in current use". It is: **the published master `e453babe…` has NO dark-mode concept at all** (`Type`=N2/NM/Clear only), while three superseded artifacts *and* an unpublished local WIP each carry a different dark-mode mechanism (`Dark mode` axis / `Property 1=night` / separate component). So the live library **cannot express a dark statusbar via the master**, and the page's own instances reach for stale snapshots to get it. **That is the hygiene defect worth escalating** — and it's a sharper finding than the original framing.

2. **`nds_icon_header` — my original conclusion was BACKWARDS.** Corrected:
   - **`19619c9f1fd2e3c2e6515542d0484e651f3f30c6`** — `remote: false`, `Type`/`Color`/**`Darkmode`**. **✓ In the index, updated 2026-06-19. The MASTER** (and CORE's recorded key).
   - `94ffbc72589e16b24dcaf3532c11b141e6195bf8` — `remote: true`, `Type`/`Color`, **no Darkmode**. **Absent from the index.**

   I originally wrote *"the published component cannot express dark mode; the local doc copy can."* **Wrong.** The **master has `Darkmode`**; `94ffbc72…` is a **superseded snapshot from before the `Darkmode` axis was added**. The index corroborates a version history: an older publish `e40b494d13e6cab0e5cc2c8b5db57b2e5ac94243` (2024-01-12) sits below the current `19619c9f…` (2026-06-19).

   **Which library does `94ffbc72…` come from? Best determination: NDS_Library itself — a stale self-import, not a foreign library.** Evidence: it does not appear in NDS_Library's current index; the only other library shipping a header icon is **NDS_M.web**, whose equivalent is named **`ndsw_icon_header`** (`1e4f301bff2b205d1076239009529a1ef13a2109`, 2026-07-06) — a **different name** (`ndsw` = web prefix, per the naming rule) and a different key. No other subscribed library ships an `nds_icon_header`. **So this is a version-staleness conflict, not a cross-library one.** Stated as a determination, not a certainty — see Gaps.

   **Net: not a cross-library conflict. The page's instances are pinned to a pre-Darkmode snapshot of NDS_Library's own component.**

3. **`Subpage_top` — also re-derived. It is not an NDS_Library component at all.**
   `search_design_system` traces it to **NDS_Templates** (`lk-6485b4ef…`), which **currently ships ONE set: `d6ad46694b936bf545c099efa3d0a538f91696e4` (2025-10-29).**
   
   My original *"two separate published SETs, not one set with two variants"* was an **artifact of staleness**: the two keys I found (`a64d3559…` `Type=1-btn`, `4aee1146…` `Type=2-btn`) are **two superseded NDS_Templates snapshots**, both absent from the current index. The live component is a single set — you almost certainly *can* swap 1-btn↔2-btn via the `Type` property on `d6ad4669…`. **The real finding: this page pins two different stale snapshots of a component owned by another library, and the 68px height discrepancy (200 vs 268) I noted earlier is very likely that staleness showing.**

4. **`sectionbar` master (`b3ebdba6…`, `remote: false`) vs stale self-import (`c0a316e6…`, `remote: true`)** — both `Property 1`, but the **master** adds `Sectionbar_dark`. Same shape as #2: the master *gained* a dark value; the import predates it. Not a disagreement — a **version lag**.

5. **`nds_icon_arrow` master (`dde64860…`) vs stale self-import (`68b7311e…`)** — identical axes (`Color`/`Type`/`Height`) and identical instanced variant (`Color=04, Type=down, Height=h24`). Not a "pure duplicate to be cleaned up" — a **master and a stale snapshot of itself**, indistinguishable because the component hasn't changed since that publish. Harmless in practice; import the master.

6. **`line_section` appears twice as `remote: true`** (`03049eb5b61c955584ea22278756f0792f00e178`, `01f48dbb92a1ac117e6ca757b641742a33c7bc8a`), both instanced on this page. **Both are imports** — two snapshots of the same component pinned at different times. **Neither is the master**; I did not locate a local `line_section`, so its home library is untraced.

6b. **Two `header_basic` sets published 6 seconds apart** — `c95043e94317fde7230298017f42dd8099e1cbdc` (2026-04-07 04:33:29, the one instanced here and corroborated 6× in LEDGER) and `07fb2e569ac9d8cd9e31b49cf8770209df58c089` (04:33:35). Both currently in the index under the same name. A near-simultaneous double-publish — **the index genuinely offers two `header_basic` masters**, and only one is the one everything points at. Worth a hygiene flag.

7. **`\x08` (backspace) corruption in variant names — CONFIRMED on this page.** `keyboard` has `Type=␈number_ios` and `Type=␈password`, where `␈` is a literal `\b` / `\x08` control character embedded in the variant name. A third variant, `Type=␣date picker calendar`, has a **leading space**. Any code doing `variantName === 'Type=password'` **will fail silently**. Match with `.trim()` and strip `\x08`, or match by key.

8. **`date picker calendar` exists both as a variant of `keyboard` AND as its own COMPONENT_SET** (`00c6c5341eef01bf85f4a594770712bfc2b152cc`, axis `State`). Two different things share one name at two levels of the hierarchy.

9. **`pt` vs `px` inconsistency.** The governing margin rule says **`24pt`**; every label says **`24px`**. Separately, `60pt` (`18384:18725`) sits among five `60px` siblings with identical 60-unit geometry. On a 540-wide 2× mobile artboard the two are being used interchangeably. **Treat every value as `px` at the 540 artboard scale**; the `pt` occurrences are legacy/typo. Flagged rather than silently normalised.

10. **Six section titles all layer-named `토스트/체결알림 정의`** while none concern toasts (see verdict table above). Metadata-only reads of this page are actively misleading.

## Gaps / unverifiable

- **Status is genuinely unknown.** No `Last update` stamp, no Update History, zero date strings anywhere in the page's TEXT content (swept `/update|업데이트|\d{4}\.\d{2}\.\d{2}/` over verbatim `characters` → **0 hits**). Unlike `- Img Naming Rule` (2023.06.26), `- Lottie animation` (2025.11.14) and `- Images` (2026.01.26), this page is **undated**. Its currency cannot be asserted. **Do not assume it is current.**
- **`상단안내영역02`/`03`/`04` were not individually screenshotted.** Their metadata is identical (same `Subpage_top` at 540×268, same statusbar/header), so what distinguishes the four variants is **not visible in metadata and remains unverified.** Screenshot `18384:18318`, `18384:18322`, `18384:18326` to resolve. Note `03` and `04` list children in a different z-order than `02` — possibly meaningful, possibly incidental.
- **The `keyboard` variants were not screenshotted individually.** Their heights differ meaningfully (`kor`/`eng`/`number` = 380, `keypad` = 300, `number_ios` = 418, `password` = 668, `date picker calendar` = 597) but I did not verify what each looks like or when to use which. `password` at 668px is nearly 2× the standard keyboard — worth confirming before laying out a screen around it.
- **No `hidden="true"` frames on this page**, so the blank-1×1-PNG hazard did not apply.
- **Publish-state claims rest on `search_design_system` absence, which is strong but not proof.** The index search returns a ranked, bounded result set. When I say a key is "absent from the index" I mean a targeted query on that component's name returned the master and other same-name records **but not that key** — which makes absence meaningful (the query was clearly matching the right family, and even surfaced tangential fuzzy hits). It is not the same as an exhaustive index enumeration. **To harden: call `importComponentSetByKeyAsync` on each key in a write-capable session** — masters resolve, dead snapshots throw.
- **Three `remote: true` sets were not traced to an origin library**: `Topbar_Dropdown` `e307456ae4de9a6d7edd00dc8acb2363ce2aa7fc`, `btn_container_regular` `fd0a4e2fd7b3c49612b27963bd8bf41f1580910b`, `tooltip_icon` `971d8993d7f1f627ff79663994521a60cca4d23c`. Each needs its own `search_design_system` query. They are most likely stale self-imports (the dominant pattern here), but **that is an inference from pattern, not a finding.**
- **`line_section`'s home library is untraced** — both keys are `remote: true` and no local master was found on this page.
- **`94ffbc72…`'s origin is a determination, not a certainty.** The evidence (absent from NDS_Library's index; no other subscribed library ships an `nds_icon_header`; NDS_M.web's equivalent is differently named `ndsw_icon_header`) points to a stale NDS_Library self-import. **A write-capable `importComponentSetByKeyAsync` would settle it definitively.**
- **The six subscribed libraries** are: `NDS_Library` (itself), `NDS_Colors`, `NDS_Templates`, `NDS_Darkmode Colors`, and `00_컬러팔레트_라이브러리용` (**listed twice, under two different library keys** — `lk-6113fc02…` and `lk-7cb0b84c…`; a duplicate subscription worth flagging separately). `NDS_M.web` is **available but NOT added** to this file.
- **`btn_bottom_page` variant `Channel=btn_bottom_layerpopup, Type=btn_bottom_page, Status=NM`** is malformed — the `Channel` axis holds `btn_bottom_layerpopup` and `Status` holds `NM`, which look **swapped/misassigned** (elsewhere `Channel` = `NM`/`QV` and `Status` = `normal`). Flagged as suspicious; not verified against the set's full variant list.
- **Nothing on this page addresses toasts**, despite seven layers claiming to. If a toast/execution-notification spec exists in NDS, **it is on some other page** — and its layer names may well be equally unreliable.

## How this feeds BUILD mode

- **The screen is 540×987.** Top chrome 125px (statusbar 65 + header 60), bottom chrome 149px (btn_bottom_page 75 + quickmenu_basic 74). Content lives between **y=125 and y=838**.
- **Horizontal margin is 24px each side → content width is always 492px.** Every grid on the page closes on 492.
- **Grid gutters are not constant**: 2-col = 240px @ 12px gutter; 3-col = 158px @ 9px gutter; 1-col = 492px. Don't assume an 8pt grid — use these three.
- **Default card padding is 30px, not 24px.** 24px is the *dense* variant (`데이터가 많을 때`). Getting this backwards is easy and wrong.
- **Vertical rhythm: 60px between sections (80px in one case); 16px between sibling cards; 30px from Topbar_Dropdown to first content.**
- **Import the `remote: false` SET keys — those are the masters.** This file is the home library; `remote: false` means *defined here*, not *doc re-creation*. Confirmed masters: `statusbar` `e453babe03efec7dabe6c99a8db8d6a46eebac58`, `nds_icon_header` `19619c9f1fd2e3c2e6515542d0484e651f3f30c6`, `header_basic` `c95043e94317fde7230298017f42dd8099e1cbdc`.
- **Treat `remote: true` keys on these pages as suspect, not authoritative.** They are stale snapshots (mostly of NDS_Library's own earlier publishes — the file subscribes to itself) or imports from other libraries. **Never import a key just because it reads `remote: true`.**
- **`Subpage_top` belongs to NDS_Templates, not NDS_Library.** Import `d6ad46694b936bf545c099efa3d0a538f91696e4` — both keys on this page are superseded.
- **For `statusbar`, the master `e453babe…` has NO dark-mode axis** (`Type` = N2/NM/Clear only). If you need a dark statusbar, **stop and ask** — every dark-capable variant on this page is a stale snapshot or unpublished WIP. Do not silently import a stale key to get the axis you want.
- **Always read `componentPropertyDefinitions` off the imported set** rather than trusting an axis name recorded here — several sets gained axes (`Darkmode`, `Sectionbar_dark`) after the snapshots on this page were taken.
- **Never string-match NDS variant names.** `\x08` and leading spaces are present in shipped variant names on this very page. Match by key, or `.trim()` + strip control characters.
- **Set `Channel` (NM/QV) deliberately** — same as the colour foundation. Layout geometry is identical across channels; only brand identity differs.
