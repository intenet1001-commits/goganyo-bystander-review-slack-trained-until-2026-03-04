---
name: nds-lib-icons-archive
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=8883-12961"
learned_date: 2026-07-16
sections_studied:
  - "8883:12961 (page '    - Icons Archive' — canvas root, 39 top-level nodes; 1,414 nodes total)"
  - "8883:13774 (frame '1. Icon' — on-canvas heading 'Icon' / 'QV-NM Icon'; groups COMMON (MAIN ICON, SUB ICON) / FIXED (ICON, IMAGE) / OTHERS, each with its own verbatim usage sentence)"
  - "8883:13039 (frame '2. Flag' — on-canvas heading 'Flag' / 'QV-NM Flag'; block labelled 'CIRCLE  원형 구버전' + 'ss_img_flag_(국가코드)' at sizes 90 / 51 / 20, beside an UNLABELLED second flag set)"
  - "8883:12962 (frame '3. Etc (Status bar, chart UI...)' — on-canvas heading 'Etc (Status bar, chart UI...)' / 'QV-NM Etc'; Chart UI / Status bar / Section bar)"
  - "8883:13696 (frame 'Icon_usage' — on-canvas heading 'Icon Usage' / 'QV-NM icon Usage'; 아이콘 사이즈 가이드 + 색상 가이드 + 폰트와 아이콘 가이드 + 'Last update  2022.10.18 이경은')"
  - "9286:16426 (frame 'Frame 123510' — scratch canvas carrying the on-canvas badge '👿 일단 제외')"
status: "superseded — RESOLVED after this note was first written, by comparison against the live `    - Icons` page (476:10295, `nds-lib-icons.md`, 143 local COMPONENT_SETs), whose own body copy defines it AGAINST this generation: 'nds_icon 이전 리소스와 구분되는 NDS만의 아이콘 입니다.' No page-wide deprecation marker exists ON this page; the verdict rests on that cross-page evidence plus the 2022.10.18 stamp. TWO localised on-canvas markers were found here and stand independently: '원형 구버전' on the ss_img_flag_ circle-flag set (8883:13039) and '👿 일단 제외' on Frame 123510 (9286:16426). CORRECTION: Conflicts #1 below names `ndsw_flag` as the successor to ss_img_flag_ — the in-file successor is `nds_flag` (d81573482ffbff1e5076384753d483a3072d775f); see the RESOLVED section."
---

# NDS_Library — "    - Icons Archive" page

## 🔎 Invisible-signal sweep — verified via `use_figma` (opacity + strikethrough + real characters)

**`struckCount` = 0. No strikethrough anywhere on this page.** Dimming: 10 nodes, and — unlike my Illusts and
Emoji archive pages — **none of it is a deprecation signal**. It is ordinary styling: `Line 49` dividers at 0.55,
`Vector`s at 0.4, `x`/`setting` groups at 0.5, and the caption `배경색에 따라서 사용합니다.` at 0.5.

**One node worth a second look, not yet explained:** `notice_line` (`1827:24038`), a **COMPONENT_SET at opacity
0.78**. It is the only component-level dimming on the page and 0.78 is too slight to read as the file's 0.10
ghost convention. **Unresolved — flagged, not interpreted.**

### ⭐ The `👿 일단 제외` badge is an INSTANCE OVERRIDE — my `get_metadata` read could never have seen it

**This is the "layer names lie" failure mode, live:**

| | Value |
|---|---|
| Node | `I9286:16427;233:19125` |
| **Layer name** | **`Comment`** |
| **Actual `characters`** | **`일단 제외`** |
| `name === characters` | **false** |

**The badge text lives in a nested instance override.** `get_metadata` returned only the frame; the words
`일단 제외` appear **nowhere** in the dump. **I found it by screenshot, and only by screenshot** — a
name-only sweep, however thorough, would have missed one of this page's two real deprecation markers entirely.

**By contrast `원형 구버전` (`21441:2450`) and `확인필요` (`39577:3123`) both have `name === characters` = true** —
which is exactly why the dump caught those two and not the third. **The lesson: on this page, `name === chars`
held for 2 of 3 markers. Layer names are ~67% reliable as a deprecation index here — useless as a guarantee.**

---

## ⭐ RESOLVED — read this first (added after the original pass), and I NAMED THE WRONG SUCCESSOR

**The live rival page has landed as `nds-lib-icons.md` (page `476:10295`, status `live` — 143 COMPONENT_SETs,
all `remote:false` source components). It resolves the page status AND corrects a factual error below.**

### 1. Status: superseded — and the live page says so in its own words

The live `1. Icon` frame (`2402:13166`) carries this body copy verbatim:

> **`nds_icon 이전 리소스와 구분되는 NDS만의 아이콘 입니다.`**
> ("nds_icon — NDS's own icons, **as distinguished from the previous resources**.")

**The live page defines itself *against* a previous generation.** This archive page — `Last update 2022.10.18`,
`ss_img_flag_` self-labelled `원형 구버전` — is that previous generation. Combined with the live page's 143 local
COMPONENT_SETs versus this page's zero, **the page resolves to superseded.** The page-level `unknown` below is
upgraded.

### 2. ⚠️ Correction: the flag successor is `nds_flag`, NOT `ndsw_flag`

**Conflicts #1 below states the successor to `ss_img_flag_` is `ndsw_flag`. That is wrong**, and the error was
reaching into the wrong *file*. There are **three** flag generations across two files:

| Generation | Component | File | Status |
|---|---|---|---|
| Old | **`ss_img_flag_(국가코드)`** | NDS_Library (this archive page) | **`원형 구버전`** — circle only, sizes 90/51/20 |
| **Live, this file** | **`nds_flag`** — key `d81573482ffbff1e5076384753d483a3072d775f`, **56 variants** | **NDS_Library** `476:10295` | **live** |
| Live, other file | `ndsw_flag` | NDS **M.web** | live (that file's own) |

**`nds_flag` is the successor within NDS_Library.** `ndsw_flag` is the M.web file's parallel component — a
sibling, not this page's replacement. I conflated them because `nds-mweb-icons.md` was the only flag note
available when I wrote this. **The supersession chain is `ss_img_flag_` → `nds_flag`, in-file.**

**The live `nds_flag` axes** (from `nds-lib-icons.md`): `Type=[Circle|Square]` × `Country=[28 values]` — and note
the live note's sharp catch: **the `Country` values are ISO-4217 *currency* codes (`KRW`, `GBP`, `USD`…) despite
the on-canvas caption saying `(국가코드)` (country code).** The archive's old set used true country codes
(`hk(홍콩)`, `ta(대만)`, `fr(프랑스)`) — **so the code system itself changed between generations.** That is a
concrete, checkable difference and it strengthens the supersession finding.

### 3. ✅ What survives unchanged — and why

**The `원형 구버전` finding stands exactly as written**, because it never depended on the successor's identity:
the words `원형 구버전` are printed on the canvas above the set. **The label was the evidence.** Only my claim
about *what replaced it* was wrong.

> **Related, and load-bearing:** in my sibling note `nds-lib-illusts-archive.md` I hypothesised from this page's
> `ss_img_flag_` that **`ss_img_` is the file's legacy prefix**. **`nds-lib-icons.md` refutes that** — the live
> Icons page ships `ss_img_quickbar`, `ss_img_2022home_morebank`, `ss_img_menu_speed` and others, and states
> plainly that **`nds_img_` / `ss_img_` are "images, not icons"** — an **asset-class** prefix, not a version
> marker. **`ss_img_flag_` is old because it is labelled old, not because of its prefix.** I flagged that
> hypothesis as unverified and told the reader not to act on it; that caution was warranted. Corrected in full
> there.

---

## Status verdict (as originally written) — `unknown` at page level, with two CONFIRMED deprecated blocks inside it

**Read this distinction carefully, because the page does not have one status.**

**Page level: `unknown`.** I searched the full 1,414-node metadata dump and every top-level frame's screenshot
for a page-wide marker: `구버전`, `이전`, `미사용`, `deprecated`, `old`, `백업`, `폐기`, `중단`, `사용금지`,
strikethrough, greyed-out overlays, `→ 이동` pointers. **No page-wide marker exists.** The page name "Archive" is
a hint and is explicitly **not** being used as evidence. The page carries `Last update 2022.10.18 이경은` — that
dates it, but a date is not a status.

> ⚠️ **A grep for `old` returned 9 hits on this page. All 9 were the substring inside `Bold`** (text nodes
> `36500:2634`, `:2648`, `:2662`, `:2676`, `:2690`, `:2705`, `:2719`, `:2734`, `:2748` in the `mixed` frame).
> **Zero were deprecation markers.** Recording this because a careless keyword sweep would have called this page
> "deprecated ×9" on the strength of a font weight.

**Block level: two blocks ARE explicitly marked, and these are real findings, not inferences.**

### Confirmed marker 1 — `원형 구버전` on the circle flag set (`8883:13039`)

Verbatim on canvas, confirmed in both the metadata dump (text node `21441:2450`, inside frame `title`
`21441:2448`, sibling of text `Circle` `21441:2449`) **and** the screenshot:

> **`CIRCLE`**  `원형 구버전`
> `ss_img_flag_(국가코드)`

"구버전" = **old version**, applied to the `ss_img_flag_` circle-flag set, shown at sizes **90 / 51 / 20**.
Immediately to its right sits a **second, unlabelled flag set** — i.e. the replacement, in situ. **This is
exactly the "older rival version" shape the LEDGER exists to hold**, and it corroborates rather than contradicts
what is already recorded as live. See Conflicts.

### Confirmed marker 2 — `👿 일단 제외` on `Frame 123510` (`9286:16426`)

The frame carries an on-canvas pill badge reading verbatim **`👿 일단 제외`** ("excluded for now"). Its contents
are a scratch canvas of loose icon experiments (`minus_line`, `plus_line`, `pageopoen_line` [sic — misspelt on
canvas], `warning_line`, `loading_line`, `bell_solid`, `plus_line_circle`, `arrow_line_circle`, `change_line`,
`history_line`, `person_solid`, `notice_line`) plus untitled floating glyphs.

> **🔎 Convention discovered — the `👿` emoji is this design system's house marker for "excluded / not
> applicable".** The same emoji appears on NDS_Templates' `Search Bar_legacy` badge: **`👿 NDS 추가 개발
> 해당없음`**. Two independent files, same emoji, same meaning. **Future passes should treat `👿` as a
> first-class deprecation signal and grep for it** — it is not in the standard keyword list and would be missed.
> (Two sightings is a pattern, not a proof; worth confirming on a third.)

### Not a deprecation marker — `OTHERS`, and why the distinction matters

The `1. Icon` frame's final group is labelled **`OTHERS`** with the verbatim sentence:

> `현재 사용 중인 화면은 없으나 미리 제작된 샘플 아이콘입니다.`
> ("These are sample icons prepared in advance, though no screen currently uses them.")

**This says "not yet used", not "no longer used".** It is a *forward*-looking statement — icons built ahead of
demand. **Do not file this as deprecation**; it is the opposite end of the lifecycle. Recording it because
"현재 사용 중인 화면은 없으나" would trip a naive not-in-use heuristic.

**Consequence for BUILD:** the page-level `unknown` verdict stands, so **nothing here may be promoted to
`CORE.md` or used in a build**. The `ss_img_flag_` circle set is additionally **positively disqualified** —
it is self-labelled 구버전 and the live successor is already documented.

## Layer-name convention on THIS page — reliable for the four spec frames, misleading elsewhere

- **The four spec frames** (`1. Icon`, `2. Flag`, `3. Etc`, `Icon_usage`) have layer names matching their
  on-canvas headings, and their icon layer names (`search_line`, `bell_solid`, `nds_icon_arrow`…) read as real
  component names — **reliable**.
- **Elsewhere, names lie.** `Frame 123510` is the `👿 일단 제외` scratch canvas; `Group 1`, `mixed`, `Frame 9297`,
  `tobe`, `테스트화면` ("test screen"), `확인필요` ("needs checking") are debris. `TinyPNG-Figma` /
  `TinyPNG-Website` (`8883:16037`, `8883:16044`) are 1920×1080 frames named after an *external tool*.
- **One on-canvas misspelling to preserve, not fix**: `pageopoen_line` (should be `pageopen_line`). Quoted as-is
  because a BUILD pass searching for the correct spelling would miss it.
- Another verbatim oddity: `rate_solid_홈제외` ("rate_solid_home-excluded") — a name encoding a usage exclusion.

## What's actually on the page (inventory only — page status `unknown`, not for BUILD)

39 top-level nodes under canvas `8883:12961`.

1. **`1. Icon` (`8883:13774`, 2820×4251)** — heading "Icon" / "QV-NM Icon". Five labelled groups, each with its
   own verbatim usage rule (all quoted exactly):
   - **`COMMON`** — `여러 화면에서 공통으로 사용되는 아이콘입니다.`
     - **`MAIN ICON`** — `텍스트 없이 단독으로 버튼 기능을 합니다. 사용자가 기능을 파악하는데 어려움이 없는 경우에 한하여 사용합니다. h34(h30)사이즈를 기본으로 사용합니다.`
       Icons: `search_line`, `edit_line`, `minus_line`, `plus_line`, `favorite_line_normal`, `favorite_solid`,
       `pageopoen_line` [sic], `close_line`, `calendar_line`, `close_solid`, `view`, `reload_solid`,
       `reload_line`, `orderchange_line`, `download_line`, `share_line`, `paste_line`, `align_line`,
       `table_searchstock_solid`, `img_line`, `chart_line`, `shopping_line`, `filter_line`, `meatball_solid`,
       `align_solid`, `bell_line`, `memo_line`, `setting_line`, `trash_line`, `tooltip_solid`, `mic_solid`.
     - **`SUB ICON`** — `버튼 내 텍스트와 함께 보조로 사용되는 아이콘입니다.`
       Icons: `nds_icon_arrow` (a large chevron/caret matrix), `call_solid`, `setting_solid`, `list_line`,
       `wallet`, `pdf_solid`.
   - **`FIXED`** — `특정 케이스에서만 사용되는 아이콘입니다.`
     - **`ICON`** — `특정 화면에서 사용되는 아이콘입니다. 명시된 화면에서만 사용합니다.`
       `nds_icon_header`, `navi_icon`, `card_icon`, `chatbot_line`, `전체메뉴`, `quickmenu_layer`, `quickmenu`,
       `color_solid`, `bell_solid`, `plus_solid_circle`, `plus_line_circle`, `global_line`, `crown_solid`,
       `rebalancing`, `Asset Link`.
     - **`IMAGE`** — `버튼 외에 접근성을 높이기 위한 용도로 사용되는 아이콘입니다.`
       `complete_line`, `warning_line`, `nds_bullet_color`, `nds_bullet_mydata`, `nds_ci_null`, `CI`,
       `loading_line`, `essential_label`, `banginfo_line`, `info_line`, `info_solid`.
   - **`OTHERS`** — `현재 사용 중인 화면은 없으나 미리 제작된 샘플 아이콘입니다.` (see verdict — *pre-built*, not retired)
     `arrow_line_circle`, `나무앰뷸스` [sic, as named], `change_line`, `history_line`, `person_solid`,
     `notice_line`, `power_line`, `widget`.
2. **`2. Flag` (`8883:13039`, 1750×1656)** — heading "Flag" / "QV-NM Flag". **The `CIRCLE 원형 구버전` block** —
   `ss_img_flag_(국가코드)` at sizes **90 / 51 / 20**. The 90 and 51 rows carry ~18 flags (USA, Korea, China,
   Brazil, Australia, Indonesia, Japan, Hong Kong, Thailand, Taiwan, India, France, Germany, Vietnam, Canada,
   Mexico, Russia, Switzerland); the 20 row is denser (~27, adding UK, Norway, Sweden, Denmark, South Africa, EU
   and others). Variant symbols are named on the pattern `Height=h51, Country=hk(홍콩)` /
   `Height=h51, Country=ta(대만)` etc. To the right sits the **unlabelled successor set**.
3. **`3. Etc (Status bar, chart UI...)` (`8883:12962`)** — heading "Etc (Status bar, chart UI...)" / "QV-NM Etc".
   - **`Chart UI`** — up/down/flat triangle markers; pill chips `0.34%` (red), `-30.84%` (blue), `0.00%` (green)
     in solid and tinted treatments; rate rows `▲ 14.89 (30.62%)` red / `▼ 14.89 (30.62%)` blue /
     `14.89 (30.62%)` green, on both dark and light backgrounds.
     > Corroborates the 상승=red / 하락=blue / 보합=green convention in `nds-ux-guide-updown-notation` and
     > `nds-mweb-colors`. **Consistent — not a conflict.**
   - **`Status bar`** — `9:41` clock + signal/wifi/battery, in five chrome treatments (dark, white, navy ×2, dimmed).
   - **`Section bar`** — a single white rule.
4. **`Icon_usage` (`8883:13696`)** — heading "Icon Usage" / "QV-NM icon Usage". Verbatim:
   - **아이콘 사이즈 가이드** — `레이블 size : 30 / 22 / 16` · `34size : 단독으로 기능할 때 사용.` ·
     `24size : 특수케이스 (ex. quickmenu 등)`
   - **색상 가이드** — `1. darkgray 2.023` · `2. gray013 3.013  단독 사용` · `3. gray024 4.024` ·
     `4. gray074 54.074` · `5. gray060 58.060(47.060)` · `6. white 5.063`
   - **폰트와 아이콘 가이드** — `사이 여백 : 4px` · `기본적인 기준은 아래 참조. (경우에 따라 다르게 사용 가능)`
     Pairing table: FONT `21size 이상` → ICON `22size`; FONT `18size 이하` → ICON `16size`. Colour pairings:
     font `2.023` → icon `3.013` / `4.024`; font `3.013` → icon `3.013` / `4.024` / `54.074`;
     font `4.024` → icon `54.074`. Footnote `원본 30size`.
   - **`Last update  2022.10.18 이경은`**
5. **`Frame 123510` (`9286:16426`)** — the **`👿 일단 제외`** scratch canvas (see verdict).
6. **Debris / unresolved** — `테스트화면` (`8883:13541`, 540×1362); `mixed` (`36500:2629`, 2053×1952 — the frame
   whose nine `Bold` labels caused the false `old` hits); `TinyPNG-Figma` / `TinyPNG-Website` (1920×1080 each);
   `Basic_btn` (`78:1357`, 1900×1275) far to the left at x=-3415; `Frame 9297`; `tobe` (`39577:3121`);
   `확인필요` (`39577:3123`) — verbatim "needs checking" — sitting on a red rectangle `Rectangle 6267` beside
   `account_trading_withbtn` / `account_lookup` / `account_apply` / `combo_box` / `select_line` instances and
   four `nds_icon_accountarrow02_d` copies; a pasted `스크린샷 2023-10-23 오전 9.57 1` (1294×817) and `image 1`
   (1294×652); loose `flag` frames (`18105:17617`, `:17625`, `:17627`, `19648:2129`, `19648:2177`); `appicon_nm`
   ×2; `bank`; symbols `txt_simle/잔고표시/normal` [sic — "simle"] and `txt_simle/잔고표시/disabled`.
7. **`국내/해외/은행 CI 아이콘 NDS_StockIcon_CI 별도 라이브러리` (`8883:16033`)** — verbatim text node:
   domestic/overseas/bank CI icons live in a **separate library** called `NDS_StockIcon_CI`. **A pointer to a
   Figma file not in the learned set** — worth flagging as a coverage gap for the orchestrator.

## Conflicts for LEDGER

### 1. `ss_img_flag_` (구버전) vs `ndsw_flag` (live) — **a confirmed supersession chain, corroborating**

This is the "does an Archive page hold an older rival of something documented live" question, and the answer is
**yes, and the archive says so itself**:

| | Archive (this page) | Live |
|---|---|---|
| Naming | `ss_img_flag_(국가코드)` | `ndsw_flag`, `Type=Square\|Circle`, `Country=<CUR>(<한글국가명>)` |
| Shapes | **Circle only** | **Square + Circle** |
| Sizes | 90 / 51 / 20 | (per `nds-mweb-icons`) |
| Self-label | **`원형 구버전`** (old version) | — |
| Source | NDS_Library `8883:13039`, `Last update 2022.10.18` | `nds-mweb-icons.md` (`1607:1172`, `1607:2877`), `nds-mweb-archive.md` (`1589:979`) |

Proposed entry:

> **Not a contradiction — a resolved version history, recorded so it stays resolved.** The `ss_img_flag_`
> circle-flag set in NDS_Library's Icons Archive is **self-labelled `원형 구버전`** and is superseded by
> `ndsw_flag` (`Type=Square|Circle`, `Country=<CUR>(<한글국가명>)`), already documented in `nds-mweb-icons.md`.
> The old set was **circle-only**; the successor added Square. **Any asset named `ss_img_flag_*` is old-version
> by the library's own on-canvas label — never promote one, and treat its appearance in a ticket or handoff as a
> staleness signal.**
> Note `nds-mweb-icons.md` separately flags that the live export rule names only `ndsw_flag_circle_(국가코드)`
> while the component ships both Square and Circle — **the archive explains why**: the circle-only export naming
> is a holdover from the circle-only `ss_img_flag_` generation. **That is a plausible provenance link, not a
> proven one** — offered to whoever resolves the Square-export-naming gap.

### 2. `👿` is an undocumented deprecation marker — **method-level, affects every future pass**

> The `👿` emoji functions as an on-canvas "excluded / not applicable" badge in this design system, confirmed in
> **two independent files**: NDS_Library Icons Archive `9286:16426` (**`👿 일단 제외`**) and NDS_Templates
> `16543:2639` (**`👿 NDS 추가 개발 해당없음`**). It is **absent from the standard keyword list**
> (`구버전`/`이전`/`미사용`/`deprecated`/`old`/`백업`/`폐기`/`중단`) and would be missed by any pass that greps
> that list alone. **Add `👿` (and `제외`, `해당없음`) to the LEARN/VERIFY keyword sweep.**
> Two sightings is a strong hint, not a rule — worth confirming on a third file.

### 3. Coverage gap — `NDS_StockIcon_CI` is a separate library, unlearned

> Text node `8883:16033` states verbatim: `국내/해외/은행 CI 아이콘 NDS_StockIcon_CI 별도 라이브러리`.
> **A named Figma library outside the four learned files** (UX Guide, M.web, Templates, Library). Domestic /
> overseas / bank CI icons are therefore **undocumented in this domain**. Not a conflict — a **hole**. A BUILD
> pass needing a stock or bank CI icon has no source. Flagging for the orchestrator to decide whether to
> enumerate it.

## CORE — componentKeys found

**None captured — deliberately.** `get_metadata` + `get_screenshot` only; no `get_design_context` /
`importComponentSetByKeyAsync` calls, so no 40-hex key was read. **Given the page-level `unknown` verdict,
nothing here is promotable** — and the one block whose identity is fully settled (`ss_img_flag_`, `원형 구버전`)
is settled in the *negative*. Extracting keys would yield an inventory labelled "not for promotion" in every row.
The live flag component's identity is already in `nds-mweb-icons.md`.

## Gaps / unverifiable

- **The live `    - Icons` page (`476:10295`) in this same file was NOT read** — it is outside my batch. **The
  sharpest available test of this archive's status is a direct comparison against it**, and I could not run it.
  Whoever holds `    - Icons` should compare: if it carries a `Last update` newer than **2022.10.18** and
  re-states the same COMMON/FIXED/OTHERS groups, this page resolves to `deprecated` immediately.
- **`mixed` (`36500:2629`, 2053×1952) was not screenshotted** — the largest unviewed frame on the page. Known
  only to contain nine `Bold` text labels. Contents unverified.
- **`테스트화면` (`8883:13541`), `Basic_btn` (`78:1357`, 1900×1275), `TinyPNG-Figma`/`TinyPNG-Website`, and
  `Frame 9297` were not screenshotted.** `Basic_btn` is large and sits far off to the left — it is a *button*
  sheet on an *icons* page, i.e. probably parked debris, but unverified.
- **Pasted raster not transcribed**: `스크린샷 2023-10-23 오전 9.57 1` (1294×817) and `image 1` (1294×652). Per
  the "rules live inside pasted screenshots" warning these may hold rules. **Unread.**
- **The `확인필요` cluster (`39577:3122`–`3123` + surrounding account instances) is unresolved by its own
  admission** — "needs checking" is the canvas's own word. Not my finding to resolve.
- **No frame was flagged `hidden="true"`** in the dump, so the blank-1×1 caveat did not apply — not re-confirmed
  node-by-node.
