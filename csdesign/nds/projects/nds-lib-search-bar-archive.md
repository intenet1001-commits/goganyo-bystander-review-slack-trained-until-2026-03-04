---
name: nds-lib-search-bar-archive
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=10-1347"
learned_date: 2026-07-16
sections_studied:
  - "10:1347 (page '    - Search bar Archive' — canvas root, 34 top-level nodes spanning x=-655 to x~12,454; 689 nodes total)"
  - "163:2417 (frame 'Search Bar' — on-canvas heading 'Search Bar' / 'QV-NM Searchbar Design Guide'; four type blocks LINE 라인형 / R-SQUARE 라운드스퀘어형 / ROUNDED 라운드형 / COMPLEXE 복합형, each × NORMAL / PRESSED columns only)"
  - "2851:8723 (frame 'Search Bar_usage' — on-canvas heading 'Search Bar Usage' / 'QV-NM Typography Font Usage'; 사용방법 + 사용 시 유의사항 + 'Last update  2022.10.21  이경은')"
  - "46725:3843 (section '테스트중' — WIP scratch area of number-keypad screens + pasted competitor screenshots; unrelated to search bars)"
  - "16543:2639 in fileKey 1xE0qvn2yv3ZkQ9BwhKT1y (NDS_Templates 'Search Bar_legacy' — read for cross-file comparison ONLY, not part of this page)"
status: "deprecated — NOT inferred from the page name. Its content is a visual match for NDS_Templates `2. Search bar_legacy` (`16543:2639`), which carries the on-canvas badge '👿 NDS 추가 개발 해당없음' and red text '사용을 지양합니다.' The archive's own stamp (2022.10.21) predates the live Templates sheet (2023.08.07). Evidence is CROSS-FILE, not on-canvas self-marking — see 'Status verdict' below for the exact limits of this claim."
---

# NDS_Library — "    - Search bar Archive" page

## ⭐ THE `#search-bar-states` ⛔ ANSWER — it splits into THREE, not one (verified via `use_figma`)

**The ledger's ⛔ BLOCKED bundles three guide requirements the library can't meet. This page answers each
differently. Bundling them was the mistake; they have different histories.**

| Guide requirement | Archive holds it? | Verdict |
|---|---|---|
| **Voice-mic rule** | ✅ **YES — 14 `nds_icon_mic` INSTANCEs** (`1860:24842`, `454:9685`, `2514:14038`, `454:9801`, …, each wrapping an `nds_icon_mic04` slice) across the LINE, R-SQUARE and COMPLEXE blocks | **BUILT, THEN RETIRED.** Reframes ⛔ → the guide documents a real feature that was deliberately removed. |
| **탐색형 (header-slot) type** | ❌ **NO — zero occurrences of `탐색형` in any text or layer name on this page.** The only `기본형` hit (`2851:8732`) uses it to mean "the basic types", unrelated. | **NEVER BUILT.** ⛔ stands. |
| **4th state** | ❌ **NO — the archive has TWO states (NORMAL/PRESSED).** Live ships three. | **NEVER BUILT — and the count went UP, not down.** ⛔ stands, and the guide is over-specifying against every generation. |

**So: one of the three reframes to "built then retired"; two remain "never built".** The mic is the only one with
a documented ancestor. **The 2 → 3 → (9 variants) progression means the state history is one of *addition*** —
no generation ever had 4 states, so the guide's 4th state has no provenance anywhere in this file.

### Also found: the `확장 활용안` keypad proposal is ghosted at opacity 0.5

My original note called this block "unresolved, gated behind ask-first". **It is also dimmed — the entire
proposal is at 50% opacity**, verified:

`📌 금액입력 키패드 (사용시 문의요망)` (`34791:8060`) **0.5** · `확장 활용안` (`34791:8061`) **0.5** ·
`이체_계좌선택_직접입력_계좌번호입력` ×2 (`34791:8062`, `:8077`) **0.5** · `이체_금액입력_filled` ×2
(`34791:8128`, `:8149`) **0.5** · both `-->` connector vectors (`34791:8206`, `:8207`) **0.5**.

**The whole block was dimmed as a unit** — the same soft-marking mechanism found on the Illusts and Emoji
archives (there at 0.10). Combined with its own "사용시 문의요망", this reads as **parked**, not merely
un-approved. **Meaning still unstated on canvas — not guessing.** `struckCount` = **0** on this page; the other
dimmed nodes are ordinary styling (`Rectangle` 0.05/0.15 background tints, `Line 49` 0.55 dividers, `종목 검색`
placeholder text 0.5).

---

## ⭐ CORROBORATED IN-FILE — read this first (added after the original pass)

**When I wrote this note, my `deprecated` verdict rested on a CROSS-FILE chain (NDS_Templates' legacy badge +
a visual match + date ordering), and I flagged that as its main weakness. The live rival page has since landed
as `nds-lib-search-bar.md` (page `19644:2695`, status `live`) — and it carries a `2. Search bar_legacy` frame
(`19791:20045`), "explicitly deprecated", *in this very file*.**

**The chain no longer needs to leave NDS_Library.** The legacy design is marked legacy on the live Search bar
page of the same file, one page away from this archive — not only in Templates. The live page also confirms
`Last update 2023.08.07 구자영` (matching Templates) against this archive's **2022.10.21**, and confirms
`searchbar_basic` / `searchbar_filter` as **local COMPONENT_SETs with published keys, 9 variants each**.

**The verdict below is unchanged — `deprecated` — but its weakest link is repaired.** The "stated limit" I set
out (cross-file inference, verify before acting) has now been met by an in-file, independently-authored source.

**Two things this newly opens, neither of which I can close:**

1. **`searchbar_basic` has 9 variants, not 3 states.** `nds-lib-search-bar.md` calls that SET "**the tiebreaker
   for the states question**" — the exact ⛔ BLOCKED ledger entry my Conflicts #1 addresses. **The 2-state
   (archive) → 3-state (Templates sheet) → 9-variant (library SET) picture is richer than the flat "2 vs 3 vs 4"
   table below.** Whoever holds that note has the tiebreaker; my Conflicts #2 table should be read alongside it,
   not instead of it.
2. **A `3. Sort` section (`45992:24913`) on the live page has the on-canvas heading `작업중` ("work in
   progress"), with 2025-era node ids.** So the live Search bar page is *still being built*. That is further
   evidence this archive is behind — and it means the search-bar story is **not settled**, merely no longer
   ambiguous about *this* page.

---

## Status verdict (as originally written) — `deprecated`, by external evidence, with a stated limit

**On this page itself there is NO deprecation marker.** I searched the full 689-node metadata dump and the
screenshots for: `구버전`, `이전`, `미사용`, `deprecated`, `old`, `백업`, `폐기`, `중단`, `사용금지`, `임시`, `보류`,
strikethrough, greyed-out/low-opacity overlays, and a `→ 이동` pointer to a replacement page. **None of those appear
on this page.** (One `old` hit in a sibling dump turned out to be the substring inside **`Bold`** — a false positive,
discarded.) On on-canvas evidence alone this page would be `unknown`, exactly as `nds-mweb-archive.md` concluded.

**What changes the verdict is a cross-file match, not the page name.** The already-learned
`nds-tpl-search-bar.md` records a frame `2. Search bar_legacy` (`16543:2639`) in **NDS_Templates**
(`1xE0qvn2yv3ZkQ9BwhKT1y`) carrying, verbatim on canvas:

> `LEGACY`  ·  "종목검색, 메뉴검색 등에서 쓰였던 기존의 디자인입니다. **사용을 지양합니다.**"
> badge: "👿 NDS 추가 개발 해당없음"

I screenshotted that legacy frame and compared it to this page's `Search Bar` frame. **The rows are the same
design**, in the same order:

| Row shown in BOTH this Archive page and Templates `Search Bar_legacy` |
|---|
| `검색 키워드 입력` + 🔍  →  `입력 중` + ✕ |
| `검색 키워드 입력` + `버튼명` button  →  `입력 중` + `버튼명` |
| `검색 키워드 입력` + 🎤 mic  →  `입력 중` + 🎤 |
| `메뉴를 검색하세요` + 🔍 + 챗봇 chip + ⏻  →  `입력 중` + 챗봇 + ⏻ |
| `전체` ▾ scope dropdown + `검색 키워드 입력` (± mic) — this page's **COMPLEXE 복합형** block |

Both frames even share the subtitle line: this page reads `QV-NM Searchbar Design Guide`, the Templates legacy
frame reads `QV-NM Search Bar Design Guide`. **The mic variant and the `전체 ▾` scope dropdown are the two
distinctive features Templates names as legacy, and both are here.**

**The limit of the claim, stated plainly:** this is a supersession inference from a dated, explicit,
*external* callout plus a visual design match — it is **not** a marker on this page. A VERIFY pass should
confirm the frames are the same generation rather than coincidentally similar. But the direction is not in
doubt: dated 2022.10.21 here vs 2023.08.07 on the live sheet, and Templates explicitly says the design shown
here is the one to avoid.

**Consequence for BUILD: do not use anything on this page.** Not "unknown, so hold" — *superseded, so don't*.
The live component is `searchbar_basic` / `searchbar_filter` (keys already in `nds-tpl-search-bar.md`).

## ⚠️ This page resolves the open `search-bar-states` ⛔ BLOCKED ledger entry — see Conflicts

The LEDGER's `search-bar-states` entry says the UX Guide's **voice-search mic-replacement rule** and its
**4-state** requirement "cannot be satisfied" by `searchbar_basic`/`searchbar_filter`, with no explanation of
where those rules came from. **This page is where they came from.** See the Conflicts section.

## Layer-name convention on THIS page — unreliable, and the file's own warning applies

`sources/nds-library.md` already warns "probe every page; never skip on the name alone" for this file. That
warning extends to layer names **within** this page. The convention here is **mixed**:

- The two spec frames (`Search Bar` `163:2417`, `Search Bar_usage` `2851:8723`) have layer names that **match**
  their on-canvas headings — reliable.
- Everything else is **scratch debris with non-descriptive or misleading names**: `Group 9269`, `IMG_7666 1`,
  `IMG_0167 3`/`IMG_0167 4` (pasted screenshots), and ~20 frames named for *other* components entirely
  (`popup_silding_control_check03` ×3, `popup_바텀시트_선택01` ×4, `이체_금액입력_filled`, `계좌선택팝업_계좌선택`).
- **The page name says "Search bar" but most of its area is not about search bars.** A name-driven read of this
  page would be wrong about its contents, not just its status.

## What's actually on the page (inventory only — superseded, not for BUILD)

34 top-level nodes under canvas `10:1347`. In on-canvas reading order:

1. **`Search Bar` (`163:2417`, 1919×4419)** — heading "Search Bar" / "QV-NM Searchbar Design Guide". Four type
   blocks, each with **NORMAL** and **PRESSED** columns and **no third state**:
   - **`LINE`** / 라인형 — placeholder `검색 키워드 입력`, `종목 또는 검색어를 입력하세요.`; pressed shows `포커스 입력 중`. Mic and clipboard variants.
   - **`R-SQUARE`** / 라운드스퀘어형 — `검색 키워드 입력`, `메뉴를 검색하세요`; pressed `입력 중`. Includes `버튼명` button, mic, and 챗봇+⏻ variants.
   - **`ROUNDED`** / 라운드형 — on a dark panel: `종목 검색`, `소수점 거래가 가능한 종목을 검색해요.`; pressed `포커스 온`.
   - **`COMPLEXE`** / 복합형 — `전체` ▾ scope dropdown + `검색 키워드 입력` (± mic), in NORMAL and PRESSED.
   > **Note the state count: 2 (NORMAL/PRESSED).** The live Templates sheet ships 3 (NORMAL/PRESSED/FILLED).
   > The UX Guide demands 4. All three documents disagree — see Conflicts.
2. **`Search Bar_usage` (`2851:8723`)** — heading "Search Bar Usage" / "QV-NM Typography Font Usage". Verbatim:
   - **사용방법**
     - `Line` — `- 최상단에 위치할 경우` / `- 콘텐츠 항목이 라운드형으로 사용된 경우` / `- [라인형 탭]과 [필터콤보] 사이에 사용되는 경우` / `- [라인형 탭]이 사용된 경우`
     - `Rounded Square` — `- Bg 색상이 있을 경우` / `- 콘텐츠 항목이 라운드형으로 사용된 경우 (ex. 인풋, 버튼 등)`
     - `Rounded` — `- 특수한 페이지에서만 사용합니다.` / `- ex) 홈`
   - **사용 시 유의사항**
     - `Line & Rounded Square 는 기본형이나 사용방법에 따라 사용합니다.`
     - `디자이너와 협의가 필요한 경우` — `- 제공되는 스타일 외의 다른 타입이 필요할 경우` / `- 사용방법 외의 화면이 나올 경우` / `- NDS_Templates 외의 화면이 나올 경우`
   - **`Last update  2022.10.21  이경은`** — present, and it is what dates this generation.
3. **`Search bar` (`14819:15262`)** and **`외화채권_검색바` (`12530:14220`)** — two loose one-off search bars.
4. **`테스트중` section (`46725:3843`, 4861×2050)** — literally "**being tested**". Contains **number-keypad**
   screens and pasted competitor screenshots (a Toss-style `보낼 금액` transfer screen, `간편 비밀번호 입력`,
   `시세오차 목표가 매수` sheets). **Nothing to do with search bars.** A WIP scratch area parked on this page.
5. **`📌 금액입력 키패드 (사용시 문의요망)` (`34791:8060`)** — verbatim text node: "amount-entry keypad (please
   inquire before use)". Below it `확장 활용안` ("expansion proposal") + four `이체_*` transfer screens
   (`이체_계좌선택_직접입력_계좌번호입력` ×2, `이체_금액입력_filled` ×2) joined by two `-->` vector arrows —
   a before/after proposal pair. **A live proposal, gated behind "ask first" — not a spec.**
6. **Scratch debris** — `popup_silding_control_check03` ×3, `popup_silding_basic_sentence03`,
   `popup_silding_control_confirm03`, `popup_바텀시트_선택01` ×4, `계좌선택팝업_계좌선택` ×2, `tab_1.5depth_txt`,
   `tab_2depth_txt/default`, `check_combine_txt` ×2, and pasted images `IMG_7666 1` (3024×4032), `IMG_0167 3`/`4`.

**Read the page for what it is: one superseded spec (items 1–2) plus a general-purpose scratch canvas
(items 3–6) that accumulated unrelated WIP.** The "Archive" name describes item 1–2 accurately and items 3–6
not at all.

## Conflicts for LEDGER

### 1. `search-bar-states` ⛔ BLOCKED — **this page supplies the missing provenance**

The existing ledger entry states the guide's **탐색형** type, **4 states**, and **voice-search mic-replacement
rule** cannot be satisfied by the current library, and treats this as an unexplained blockage.

**Proposed addition — the rules are stale, and here is their ancestor:**

> The UX Guide's **mic-replacement rule has a documented origin: the legacy search bar generation**
> (`nds-lib-search-bar-archive`, NDS_Library `10:1347`, `Last update 2022.10.21 이경은`). That generation shipped
> mic variants in its LINE, R-SQUARE and COMPLEXE blocks. **NDS_Templates explicitly retired that generation** —
> `2. Search bar_legacy` (`16543:2639`), badge "👿 NDS 추가 개발 해당없음", text "종목검색, 메뉴검색 등에서 쓰였던
> 기존의 디자인입니다. 사용을 지양합니다.", `Last update 2023.08.07 구자영`. The mic is therefore **absent from
> `searchbar_basic`/`searchbar_filter` by decision, not by omission.**
>
> Likewise the guide's **탐색형** (in-header) 종목검색/메뉴검색 case: Templates names 종목검색/메뉴검색 as exactly
> the *legacy* use cases. **The guide is describing the retired generation.**
>
> **This reframes the entry from ⛔ BLOCKED ("library is deficient") to ⚠ CONTESTED ("the guide is stale").**
> The escalation to a designer should now ask a sharper question: *should `nds-ux-guide-search` be updated to
> drop the mic rule and the 탐색형 type, given Templates retired that design in 2023.08?* — rather than *why
> can't the library do what the guide says?*
> **Caveat kept honest:** the archive page carries no self-marking; this chain rests on the Templates legacy
> badge + a visual design match + the 2022.10 vs 2023.08 date ordering. Verify before acting.

### 2. Search-bar state count — **three documents, three answers**

| Source | States | Date |
|---|---|---|
| `nds-lib-search-bar-archive` (this page, NDS_Library `163:2417`) | **2** — NORMAL / PRESSED | 2022.10.21 |
| `nds-tpl-search-bar` (NDS_Templates `16543:2498`, live) | **3** — NORMAL / PRESSED / FILLED | 2023.08.07 |
| `nds-ux-guide-search` | **4** — Normal / Focused Empty / Focused Typing / Results | — |

Proposed note: the progression 2 → 3 is a **coherent version history** (FILLED was added when the legacy design
was retired), which *supports* reading the guide's 4th state as guide-side over-specification rather than a
library gap. **Not conclusive** — it does not explain where the guide's 4-state model came from.

### 3. Type taxonomy fully replaced — no overlap in naming

Archive: `LINE` / `R-SQUARE` / `ROUNDED` / `COMPLEXE` (by **shape**).
Live: `searchbar_basic` / `searchbar_filter` (by **function**).
**Zero shared vocabulary.** Any older doc, ticket, or handoff citing "R-SQUARE" or "복합형" is referring to the
retired generation. Worth recording so the terms aren't mistaken for live variant names.

## CORE — componentKeys found

**None captured — deliberately.** This pass used `get_metadata` (structure/names) + `get_screenshot` (pixels)
only; no `get_design_context` / `importComponentSetByKeyAsync` calls were made, so no 40-hex key was read for
anything on this page. **Given the `deprecated` verdict this is the correct stop:** no key from this page is
promotable to `CORE.md` under any reading, so extracting keys would produce inventory whose only possible label
is "never use this". The live keys for this component already exist in `nds-tpl-search-bar.md`
(`searchbar_basic` SET `755deb62dc296ad41135fb0147e814de64cb7e08`, `searchbar_filter` SET
`0ca00d45253ed2384c2cce8e681af9eda793c502`) and are the ones BUILD should use.

## Gaps / unverifiable

- **No frame on this page was flagged `hidden="true"`** in the metadata dump, so the "hidden frame renders as a
  blank 1×1 PNG" caveat did not bite here — but this was not re-confirmed node-by-node.
- **Pasted images not transcribed**: `IMG_7666 1` (3024×4032), `IMG_0167 3`/`4` (540×1169 each), and the
  screenshots inside `테스트중` are raster. Per the method's "rules live inside pasted screenshot images"
  warning, these *could* hold rules. I screenshotted `테스트중` and read it as competitor-app reference imagery,
  not spec — but the two `IMG_0167` images beside the `popup_바텀시트_선택01` frames were **not** individually
  zoomed. Unverified.
- **`Group 9269` (`21269:18572`)** and the `tab_1.5depth_txt` / `tab_2depth_txt/default` nodes at negative x were
  not individually screenshotted — small stragglers outside the two spec frames.
- **The `확장 활용안` keypad proposal (`34791:8060`–`34791:8207`) is unresolved.** Its own copy says "사용시
  문의요망" (ask before using), so it is neither approved spec nor dead. It is also **the same subject matter as
  the two live pages `    - Number Keypad  숫자 키패드` (`28884:2873`) and `    - Security Keypad  보안 키패드`
  (`5461:10188`)** in this file — a possible fourth conflict I did **not** chase, since those pages are outside
  my batch. **Flagging for whoever holds them.**
