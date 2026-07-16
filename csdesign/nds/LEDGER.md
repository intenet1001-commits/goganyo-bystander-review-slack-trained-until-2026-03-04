# LEDGER — contested, blocked, unresolved

> **One place for everything that is NOT settled.** Before today these were scattered across registry rows and
> Gotchas — the Search Bar conflict appeared in 3 places, the 428-vs-286 width in 3 more — so a BUILD pass had
> no way to know a rule was unsatisfiable.
>
> **BUILD**: read an anchor only when `INDEX.md` flags the topic ⚠/⛔. **VERIFY**: read this file always — it is
> the worklist.
>
> **⛔ BLOCKED** = the guide **cannot be satisfied** with the current library. Do not pretend otherwise; escalate.
> **⚠ CONTESTED** = the fact is real but ambiguous. Do not resolve it by picking the tidy answer.
>
> **Maintained single-threaded by the orchestrator.** Subagents return proposed entries as text and never edit
> this file — the same discipline that stopped a Core-reference corruption on 2026-07-15.
>
> ⚠️ **This file only works if VERIFY keeps filing cross-file conflicts into it.** Splitting the registry into
> `sources/*.md` removed the single cross-file table that surfaced these conflicts in the first place. `CORE.md`
> carries the cross-file component view; **this file carries the cross-file *conflicts*.** If a VERIFY pass finds
> a contradiction and only notes it in a project file, **the property is silently lost.** That is discipline, not
> structure — it is the known weak point of this design.

---

## search-bar-states — ⛔ **STILL BLOCKED — but it is THREE requirements, not one. Split it.**

**Verdict per requirement (see `#archive-status-method` for the evidence):**
- **Voice-mic rule → BUILT, THEN RETIRED.** The archive holds **14 `nds_icon_mic` INSTANCEs**. Not a gap — a
  removal. **Ask the designer why it went, not whether it can exist.**
- **탐색형 type → NEVER BUILT.** Zero occurrences, any generation. ⛔ stands.
- **4th state → NEVER BUILT.** History is **2 → 3**; the count only ever went **up**. The guide's 4th state has no
  provenance anywhere. ⛔ stands.
**Bundling these was the original mistake.** A future pass should split into `#searchbar-mic-retired` (reframed),
`#searchbar-탐색형-missing` (⛔), `#searchbar-4th-state` (⛔).

**⚠️ Read this before "resolving it to 3".** A 2026-07-16 pass recommended exactly that, on the premise that this
was a *3-vs-4 counting dispute between files*. **It is not, and this entry never claimed it was** — it already
records that the library ships three. **The block is a guide-vs-library capability gap**: the guide *demands* four
**named** states plus a type and a rule the library **does not implement at all**. Counting the library again
cannot close it. (The premise came from an imprecise orchestrator brief, not from the agent's evidence — noted so
the same mistake isn't repeated.)

**Library side, now verified directly in NDS_Library** (`72zrHgMLM4zhCjgSuTf7cC`, page `19644:2695`) — **exactly 3
states**, on both sets:
- `searchbar_basic` `755deb62dc296ad41135fb0147e814de64cb7e08` — `Type=[left-line|left-solid|right-solid] × Status=[normal|pressed|filled]`
- `searchbar_filter` `0ca00d45253ed2384c2cce8e681af9eda793c502` — `Type=[line|no line|round] × Status=[normal|pressed|filled]`
**There is no `disabled` search-bar state** — genuine absence. (The sibling **Text Field** page *does* ship 4:
`normal|pressed|filled|disabled` — near-identical-looking component, a plausible source of a mistaken "4".)
Caveat: on-canvas labels are inconsistently capitalised (`normal`/`Pressed`/`filled`) while variant values are all
lowercase — **use lowercase**. Also on that page: section `3. Sort` is headed literally **`작업중`** ("in progress")
and contains **no COMPONENT_SET** — the page name advertises Sort, but **Sort does not exist**.
Deprecated siblings ship only 2 states: `R-Square` `24ceacff…`, `Complex` `b6a7ae4c…`.

**Original blocker, unchanged:**
`nds-ux-guide-search` requires a **탐색형** type (searchbar in the header slot, replacing the title) and **all four
states** (Normal / Focused Empty / Focused Typing / Results). The library ships **three** (NORMAL/PRESSED/FILLED,
no distinct "Focused Typing") and **zero 탐색형 examples** — every composed screen is 기본형. The guide's
voice-search mic-replacement rule is also absent from the current component.
**A BUILD pass cannot satisfy that guide with `searchbar_basic` / `searchbar_filter`. Escalate to a designer.**
Sources: `nds-tpl-search-bar.md`; `nds-ux-guide-search.md`.

## ux-writing-drift — ⛔ BLOCKED (the library contradicts the guides; check copy against the library, not the guide)
Three independent drifts, each a different shape:
- **`nds-ux-guide-completion-popup`**: **8 of 8** failure headlines use the explicitly **banned** `실패했어요`
  (`이체한도수정에 실패했어요` ×4 · `자동대체신청에 실패했어요` · `…실패했습니다` · 2줄케이스 ×2). The mandated
  `…이/가 완료되지 않았어요` appears **zero** times. **100% violation — no compliant subset exists to correlate
  against.** Yet the same page's **success** headlines are **9/9 clean** (all contain `완료`, all active voice).
  **Half the rule is followed, half is inverted.** An unprescribed 3rd form also exists:
  `일부 계좌 신청을 완료하지 못했어요` (partial failure).
- **`nds-ux-guide-empty-state`**: **3 of 7** no-data screens use the redlined `-습니다` — and the 3 are **exactly
  the screens on the older `상단안내영역03` shell**. **Correlated with template age, not scattered typos.** The
  shipped `../asset` production file (`국내주식권리`) drifts identically (`조회 내역이 없습니다.`), so the guide is
  contradicted by **both the library and production**.
- **`nds-tpl-faq`** labels its own non-compliance, holding a `가이드 미반영` composition beside a `NDS가이드 반영` one.

**Counter-example — do NOT over-generalise:** `nds-tpl-share` corroborates `nds-ux-guide-share` **word-for-word**,
including the exact 카카오톡 → 링크 복사 → 더보기 order, and links back to that guide. **It varies by page. Check.**
Sources: `nds-tpl-completion-popup.md`, `nds-tpl-no-data.md`, `nds-tpl-faq.md`, `nds-tpl-share.md`.

## nudge-blank-timing — ⛔ **STILL BLOCKED for toast/snackbar. NUDGE portion resolved 2026-07-16 — read this before "unblocking" it.**

**⚠️ This entry is NAMED for the nudge but its two literal blockers are about TOAST and SNACKBAR.** A 2026-07-16
pass reported it "UNBLOCKED"; **that was wrong, and the distinction matters** — closing it would tell a future BUILD
that toast durations are available when they are not.

**✅ NEW — the NUDGE now has real timing.** NDS_Library `    - Dialog` page, node `62361:34876`,
**screenshot-verified as rendered** (not merely present in the tree), page stamped `Last update 2025.09.15 우채희`:
```
넛징 문구: 이동할 화면의 컨텐츠를 예상할 수 있도록 작성
기본 노출 시간 : 화면진입 시 3초 후 슬라이드 in, 3초 후 슬라이드 out
최대 글자수 : 공백포함 최대 20자
넛징 하단 마진: 4
```
Lifecycle: **enter screen → wait 3s → slide in → wait 3s → slide out.** Both intervals stated; nothing inferred.
Corroborated by the NUDGE group subtitle (`36658:23670`), which adds that the background is a **nine-patch image**
(`nds_nudge01.9`). **This is the first hard timing value found anywhere in NDS** — see Gotcha 6, which it narrows
but does not overturn. Verified independently by the orchestrator. Source: `nds-lib-dialog.md`.

**⛔ STILL BLOCKED — the two original blockers are untouched, and now confirmed blank in a FOURTH file:**
`nds-ux-guide-nudge` leaves toast **`최대 글자수`** marked **`논의`** and snackbar **`지속 시간`** blank.
**NDS_Library supplies neither.** Snack bar and toast have **no timing / trigger / dismissal rule anywhere** —
confirmed across every text node plus a full-section screenshot. Only structural hints exist (`Stock`/`Logintime`
have an ✕ close; `toast_basic` has no affordance → *implies* auto-dismiss, **duration stated nowhere**).
**The nudge's 20자 limit does NOT transfer to the toast** — different component, and the guide's `논의` marks the
toast's limit as an open designer decision, not a lookup.
**Suggested split for a future pass:** `#nudge-timing` (✅ resolved) + `#toast-blank-timing` (⛔ still blocked).
**Do not invent a value.** Sources: `nds-ux-guide-nudge.md`, `nds-mweb-dialog.md`, `nds-tpl-alarm.md`, `nds-lib-dialog.md`.

## nudge-blank-timing-original — historical detail (superseded by the entry above)
`nds-ux-guide-nudge` leaves two specs empty: toast **`최대 글자수`** is literally marked **`논의`** ("under
discussion"), and snackbar **`지속 시간`** is blank. **Unresolved after checking three files**: M.web's Dialog page
(named "Dialog (snack bar, toast message)" but **contains no snackbar at all**, and its `toast_basic` is a plain
frame with zero componentKey) and Templates' Alarm page (**not even the same UI category** — it is outbound
알림톡/푸시). **Do not invent a value.** This is the specific case of the general pattern in `CORE.md` Gotcha 6.
Sources: `nds-ux-guide-nudge.md`, `nds-mweb-dialog.md`, `nds-tpl-alarm.md`.

## radio-keys-never-sighted — ✅ **RESOLVED 2026-07-16 — SIGHTED, Core was right all along**
Both keys sighted live in **NDS_Library** (`72zrHgMLM4zhCjgSuTf7cC`), page `    - Controls`, and they match
`CORE.md` **exactly**:
- `radio_basic` **`91f58f3a086c5ef03ac03c8d77a725d32b3f7a1f`** — SET, node `3928:8868`, `remote: false` (= master,
  this IS the library), 8 variants, axes `Channel=[NM|QV] × Status=[normal|selected|disabled|disabled-selected]`.
- `radio_btn` **`1a972d991cc7c8f8f97bc5557740fba58ca82f23`** — SET, node `3950:8515`, 6 variants,
  axes `Height=[h46|h60] × Active=[off|on|disabled]`. **No Channel axis.**
Verified twice independently (orchestrator + `nds-lib-inputs`). Variant-COMPONENT keys: `nds-lib-controls.md`.

**Why 4 consecutive passes missed them, so this isn't re-litigated:** the three previously-learned files are
guide/template/M.web files that **consume** components. They simply never instanced a radio — the robo-advisor
questionnaire really does use `check_icon_line` for single-select. **The absence was in the consuming files, never
in the library.** Generalisable: *a component missing from every consumer is not evidence it doesn't exist; only
the home library can answer that.* Sources: `nds-lib-controls.md`; NDS_Library page `371:7729`.

**Still true and still worth keeping:** **a literal `switch` component does not exist** — re-confirmed here. The
Controls page (27 sets) ships `switcher_table`, `switcher_table_asset`, `nds_img_switcher`, `nds_img_priceswitcher`,
`nds_img_market_switcher`, `nds_img_order_switcher` — **no `switch`** — despite the page name promising one.

## header-basic-keys — ✅ **RESOLVED 2026-07-16 — the collision is REAL, and the "broken" attribution was wrong**
**The ledger was right to refuse to pick a winner.** In the library itself, `header_basic` genuinely exists **twice**
as two distinct `COMPONENT_SET`s, siblings under frame `1. Top Navigation_Header`, different keys, non-overlapping
axes. **Not** a SET-vs-variant artifact — both are `KIND: COMPONENT_SET`:
- **BASIC** `c95043e94317fde7230298017f42dd8099e1cbdc` — 12 variants — `Channel(NM, N2, clear 밝은배경, clear 어두운배경) × Left Icon × Right Icon`
- **OPTIONAL** `07fb2e569ac9d8cd9e31b49cf8770209df58c089` — 6 variants — `Channel(NM, N2) × Type(버튼, 아이콘 1개, 아이콘 2개)`
Core recorded only BASIC; **OPTIONAL is now added to `CORE.md`.**

**Correction to this entry's own wording:** it said the rival is `remote: true`. **In the library both read
`remote: false`** — expected, since this *is* the home library, so **`remote` cannot discriminate here.**

**⭐ And this collision is NOT the self-import artifact that explains most others (`CORE.md` → subscribes-to-itself).
The publish index shows both sets published SIX SECONDS APART** — `c95043e9…` at **04:33:29** (the one actually
instanced, and the source of this entry's 6× corroboration) and `07fb2e56…` at **04:33:35**. **Both are live in the
index, under the same name.** A near-simultaneous double-publish → **the index genuinely offers two masters.**
So the original refusal to pick a winner was right for a reason nobody had yet identified: **there is no stale one
to discard.** Still **escalate** — a designer must say which is canonical, or rename one.

**⭐ ROOT CAUSE of `Component set for node has existing errors` — SOLVED. `header_basic` is neither broken nor
deprecated.** The error cascades from a nested dependency: **`header_title_txt`** (`9864:16724`) declares **two
variants with the identical combo** `2depth 메뉴표시=off, 어두운배경=off` (`9864:16725`, `50853:16826`).
Proof by nesting — BASIC nests it ×12 → throws; OPTIONAL ×6 → throws; **`header_stock` ×0 → works** (exactly why
Core records it as the healthy reference). **Zero on-canvas evidence of deprecation** — renders normally under
heading "BASIC", no strikethrough, no dimming, no marker.
**🔧 Fix = rename/delete one duplicate variant in `header_title_txt`. Re-keying will not help — the defect is
upstream of the key. ESCALATE: a one-line fix unblocks the most-used component in the system.**
**Reusable diagnostic (audited 27 sets, exact 1:1, zero exceptions): duplicate variant name ⇔ set-has-errors.**
Known broken sets: `header_title_txt` · `nds_img_tab_gradation` · `list_icon` · `input_line` dup (`45112:2329`) ·
`NM` keypad (`890429b7…`) · `nds_icon_bullet` + `ms_btn_memo` (missing `Type=` prefix).
**Guard every `variantGroupProperties` read with try/catch — a bulk sweep over this file crashes without it.**
Sources: `nds-lib-top-navigation.md`; verified independently by the orchestrator on page `0:1`.

## tab-2depth-chip-source — ✅ **RESOLVED 2026-07-16 — found, and it is an orphan**
`tab_2depth_chip` is a local **COMPONENT_SET**, node **`7513:13045`**, SET key
**`0f20528265a3c598e42e30f6ae422be67e941c10`**, in **NDS_Library → page `    - Tab  탭` → frame `3. 2depth`**
(x=1058, y=1260). `remote: false`. Axes `Property 1 = Default | Variant2`. Variant COMPONENT keys:
Default `c3c3eea1265c5d2861c008e38efc8556eada91b3`, Variant2 `0ff1ee0331f9a859bc535b4fb4800c49e97ea523`.

**Why it stayed contested across 3 files: it is defined but never used.** `description` empty,
`documentationLinks` empty, **no on-canvas heading**, and **zero instances anywhere resolve to it**.
It is published, undocumented and uninstanced. **Searching for a *usage* will keep failing — there isn't one.**
Chip copy is `국내주식`/`해외주식` ×6; `Property 1` appears to select the active chip. **Purpose is blank at
source — that is the finding.** Source: `nds-lib-tab.md`.

## precautions-width — ⚠ CONTESTED (evidence 2:1, NOT adjudicated)
`nds-tpl-precautions` states verbatim on-canvas (text node `2707:27147`): *"할 말이 많을 경우 최대 두 줄로 제한합니다.
텍스트박스 가로길이 **최대 428px**"* — corroborating `nds-ux-guide-precautions` (428px) against
`nds-mweb-precautions` (**286px**). **Not adjudicated: M.web is mobile web and 286 may be correct for that
platform.** Do not overwrite either. Resolve with a designer.

## step-header-duality — ⚠ CONTESTED
`step_header` resolves as a **standalone COMPONENT with no parent SET** on one instance
(`bf51d607adbf521531ba3f06f380ea13bc5ea916`, seen twice) but as a **SET member** on another
(`step_header/Property 1=flowing` `d0102f9f…`, SET `78bcf171…`). **Unresolved.** Separately confirmed: it is a
compact top progress marker, **structurally unrelated** to `pagination01` (carousel dots) and to
`nds-tpl-step-timeline`'s hand-composed multi-step list. A third component, `gauge` SET
`221d620b9fdb17b67d6c623aeaaa5c6c93aa667a`, is a distinct wizard progress bar.

## tooltip-no-rules — ⚠ CONTESTED (thrice-confirmed absence)
**No usage rules — trigger, dismiss, timing, anchor positioning, sequencing, once-per-user persistence — exist in
ANY of the three sources**: `nds-tpl-tooltip`, `nds-mweb-tooltip`, `nds-tpl-coach-mark`. Also: **no `tooltip`
component exists on the Templates page at all** (the bubble is a hand-composed FRAME every time), and
`guide_tooltip` `80538a1c120ffbe7e5fbe22f02d127273efa92db` — **despite its name — is NOT a coach-mark component**;
it is a standalone ✕-dismiss feature-announcement bubble, itself hand-composed. **Coach marks share no components
with tooltips.** A BUILD pass has visual specs but no behaviour spec. Escalate.

## button-stub — ⚠ CONTESTED (a documented void, so it isn't rediscovered)
`nds-ux-guide-button` is a **content-free stub** — that Figma page has **zero guide slides**; the content lives in
**Notion**. **Do not read the missing page as "no button rules exist."** Route instead: `nds-ux-guide-popup` §04
(wording / ratios / left-slot dismiss — the most concrete button rules anywhere) → `nds-ux-guide-touch-area` §03
(minimum sizes) → `CORE.md`'s `btn_bottom_page_assets`. Note `nds-tpl-box-button` covers a **different** family
(box/container/order) and `btn_bottom_page_assets` never appears on it.
**Also unresolved**: `btn_bottom_page` `accfb243ce752fd894af2b6db081b1074022a39d` is a **different component** from
`btn_bottom_page_assets` `0fc4758ec4ab4c83ad6052748c3dabf76d0542e8` despite the near-identical name — easy to conflate.

## mweb-archive-status — ⚠ CONTESTED (`unknown`, deliberately)
`nds-mweb-archive` (`1291:793`): an exhaustive metadata grep
(`구버전|이전|미사용|deprecated|legacy|obsolete|Last update`…) plus screenshots of all 9 frames found **no
deprecation marker — and no positive "current" marker either.** So `live` was **not** guessed. **Treat nothing on
that page as sanctioned until resolved.** Its name is a hint, not evidence.

## btn-bottom-page-assets-attribution — ⚠ CONTESTED
`CORE.md`'s Libraries table says *"All from NDS_Library unless noted"*, yet `btn_bottom_page_assets`
`0fc4758ec4ab4c83ad6052748c3dabf76d0542e8` matches exactly on **NDS_M.web**, which **does not subscribe to
NDS_Library** (`get_libraries` confirmed). Figma keys are unique per component, so the attribution may be wrong for
this component. **Unverified.** (NDS_Templates *does* subscribe, which is why its key sightings corroborate rather
than rival.)

---

---

# Opened 2026-07-16 by the NDS_Library learn (`72zrHgMLM4zhCjgSuTf7cC`)

## clipboard-strings-possible-secret — 🔒 **ESCALATE TO A HUMAN (not a design question)**
Two loose TEXT nodes on the Welcome page — **`43376:623`** and **`43376:624`**, floating outside every frame at
(-980,-2046)/(-980,-1997) — each read `Copied to clipboard` followed by a **32-char base62 string**.
**Ruled out with evidence:** not componentKeys (those are 40 **lowercase hex**; these are 32, mixed-case base62),
not fileKeys (Figma's are **22** base62 — confirmed twice in-file), not branch keys (same 22 format), and neither
carries a hyperlink (`getStyledTextSegments(['hyperlink'])` → `null`). `Copied to clipboard` is **Figma's own toast
wording** → most likely someone pasted a toast + a copied value onto the canvas as literal text: **accidental
debris.** **But 32-char base62 is the shape of an API token/secret**, on a page carrying an explicit IP notice.
**The values are deliberately REDACTED from `projects/nds-lib-welcome.md`** — copying an unidentified possible
credential into this git-tracked repo would spread it into clone history for no analytic gain. The node IDs above
are sufficient to read them at source. **They were NOT tested against any API** — confirming a suspected secret by
using it is not this domain's call. **If live: delete from Figma and rotate. Do not catalogue.**

## library-structural-defects — ⛔ **7 broken component sets in the library itself (real defects, not read artifacts)**
`variantGroupProperties` **throws `Component set has existing errors`** on: **`header_title_txt`** (`9864:16724`,
dup `2depth 메뉴표시=off, 어두운배경=off` — **root cause of the `header_basic` gotcha**, see `#header-basic-keys`) ·
**`nds_img_tab_gradation`** (`14449:15313`, dup `Type=nds_img_tab_gradation01`) · **`list_icon`** (`d15c808a…`, dup
`Type=인포그래픽, Line=multi, Margin=30, Arrow=off` at `81858:762`; renders ghosted) · **`input_line` dup**
(`45112:2329`, two × `Type=basic, Status=pressed`) · **`NM` keypad** (`890429b7…`, `Type=ms_btn_keypadcheck_nn`/`_sn`
each naming two children) · **`nds_icon_bullet`** (`eb1ab3ac…`) and **`ms_btn_memo`** (variants `25 global`/
`26 chatbot` missing the `Type=` prefix their 24 siblings have).
**⭐ Diagnostic, audited across 27 sets — exact 1:1, zero exceptions: duplicate variant name ⇔ set-has-errors.**
**Each is a one-line designer fix (rename/delete the dup). Guard every `variantGroupProperties` read with
try/catch — a bulk sweep over this file crashes.** **ESCALATE `header_title_txt` first** — it alone breaks
`header_basic`, the most-used component in the system.

## n2-vs-qv — ⚠ CONTESTED (do NOT merge, do NOT string-match one and assume you caught both)
`Channel=[NM|N2]` and `Channel=[NM|QV]` both exist; **they never co-occur on one axis**, so most families offer no
direct test. **FOR equivalence (strongest evidence):** on `    - Tooltip`, a variant named **`Type=QV` renders
on-canvas as `N2 툴팁 타이틀`.** **AGAINST a naive merge:** measured fills differ — `N2` header self-fill `#0E2A3F`
vs `QV` tab pill `#0E1A49`; close but distinct navies (may be per-family tokens). `nds_img_market_switcher` ships a
third value: `Channel=[NM|N2|ALL]`. Header/Quickmenu use `N2` only; Tab uses `QV` only.
**Consequence: a build filtering on `"QV"` silently skips every `N2` component. Enumerate the axis.**
⚠️ **`QV` in NDS_Library is dark navy `#0E1A49`, NOT orange** — `nds-mweb-colors`' `#FFAA1A` is **M.web**, a
different file/platform. **Do not carry "QV = orange" into NDS_Library.** (NM's tab pill `#2C363B` *is* exactly
M.web's `NM/ESS/grayscale/1.296` — so those ColorNumbers do reach this file, which sharpens the question.)

## treemap-보합-grey — ✅ RESOLVED as **context-scoped** (the convention is not file-wide)
The domain records 상승=red / 하락=blue / **보합=green `#009F83`**. The Chart page's **Tree Map uses grey
`#A6A9B7` for 보합** — verified twice (rgb caption + sampled fill). **Deliberate, not a slip**: a saturated green
would read as a third category in a treemap. **Resolution: `#009F83` holds for list/row/text; treemap overrides.**
Full 7-band treemap scale: `#A32C30`/`#CC4549`/`#ED5C5F` (up) → `#A6A9B7` (flat) → `#0291FF`/`#027BD9`/`#03599C`
(down) — **none of the 7 are in the NM palette.** Separately, the chart **categorical** palette is NOT the
directional one (`#FF5252`≠상승 `#D73838`, `#0093FF`≠하락 `#247EF2`, `#52C750`≠보합 `#009F83`) — **no directional
semantics; don't reuse it for up/down.** Source: `nds-lib-chart.md`.

## data-table-rate-red — ⚠ two reds in one component (Data-Table-local bug)
`Table_cell` `Type=rate`: text `#D73838` but its own ▲ triangle **`#EF2D26`** — a hex **in no NDS palette**. The
List page's equivalent triangle **is** `#D73838`. **Use `#D73838`; flag `#EF2D26` to a designer.**

## popup-max-height-unresolved — ⚠ **a rule was retired by STRIKETHROUGH, with no replacement**
Popup `5913:11448` reads `레이어 팝업은 [최대 높이 850/ 최소 높이 230] 입니다. (*987화면 기준)`, but **`최대 높이 850`
is its own `STRIKETHROUGH` segment** (verified via `getStyledTextSegments(['textDecoration'])` by two independent
passes). **No replacement value is given → layer-popup max height is genuinely unresolved at source.** The
sliding-popup rule on the same node (`최대 높이 842/최소 높이 400`) is **not** struck and stands.
**Any text-only read reports 850 as live.** See `CORE.md` Gotcha 10(b). Escalate to a designer.

## incomplete-asset-classes — ⛔ BUILD must not assume these exist
- **Character** — Graphic-asset card reads `곧, 만나요~😘`, **zero instances**. The one genuinely incomplete class.
- **Infographic ×8 backlog** (`75435:2868`) — `*제작 예정*`, text-only, no artwork: `쌓인 동전`·`안락의자`·`장바구니`·
  `인증서`·`축하 폭죽`·`정장`·`음표`·`보드판`. **The section is NAMED `인포그래픽_제작완료_개발전달전` ("production
  complete") while containing `*제작 예정*` and zero assets — the name is a lie.**
- **`Tax(참고불가)`** (Illusts `28451:194`) — **≥7 shipped components explicitly marked do-not-reference, with no
  reason and no replacement pointer.** Highest-severity unknown on those pages. Escalate.
> **❗ NOT incomplete — a correction, so this isn't re-flagged: Nmoji is FINE.** The `제작중` label (`51631:3278`)
> reports `visible: true` but is **white text on a white card — invisible at source**. The card renders 12 live
> nmoji, and `    - Emoji & Nmoji` ships **152** nmoji components. **Flagging Nmoji ⛔ would have blocked a BUILD
> from 152 real assets.** See `CORE.md` Gotcha 10(a).

## illust-export-multiplier — ⚠ CONTESTED (needs 유상엽; do NOT encode ×1 into Core)
`📌 nds_illust ( X1배수 전달 )` (**undated**, sits *above* the card so it reads first) **vs** `(NEW) illustration
Asset Usage` step 4 `필요 배수로 추출` (**stamped 2025.10.24**). "Newer wins" is **inference, not evidence.**
Related, unreconciled: **three export multipliers across three asset classes** — 9-patch `x1`, Label `2x`+tinypng,
sticker `_x2/_x3/_x05/_x25` suffixes. And **9-patch contradicts itself**: 8 layer names say
`*기존 이미지의 3배 사이즈로 컷팅` while the canvas says `*Export : 이미지의 x1배 추출`.

## emoji-two-generations — ⚠ CONTESTED (neither marked canonical)
Two emoji naming systems coexist, both live, different keys: slash-path **`nds_emoji/Smileys & Face/…`** (human
names, categories `Symbol`/`Travel & Places`/`Animals & nature`) vs flat **`nds_emoji_<hex>`** (frames
`People & Body`/`Objects`). **Don't assume either is current.** Related: `nds_nmoji42` and `nds_infographic233` are
**missing** from otherwise-complete sequences; `nds_infographic138` is **duplicated**.

## statusbar-dark-mode — ⛔ **RE-DERIVED 2026-07-16. Not "4 rival sets" — the MASTER cannot do dark mode at all.**

**This entry was twice wrong before it was right; both errors are recorded so they aren't repeated.**
First framing: "four rival answers to dark mode" — derived by using `remote` to sort masters from copies, which is
**invalid in the home library**. Second: "`nds_icon_header`'s rival comes from an unidentified other library" —
**refuted**, see below. The **sharp** finding is better than either:

**The master — `statusbar` `e453babe03efec7dabe6c99a8db8d6a46eebac58`, published 2026-04-09 — has NO dark-mode
concept whatsoever.** Its only axis is `Type = [N2 | NM | Clear]`. Everything else is a snapshot or a workaround:
- `fe57c685f5a27a53c49fc56c9999456340140c2f` — `remote: false` + a `Dark mode` axis, **absent from the index** →
  **unpublished WIP**.
- `fef1ad4be14eea79c12365981b51051d21ea4a96` (`Dark mode`) and `794235a4fc4e61da6624c9d26bbf7930438874bc`
  (`Property 1=night`) → **stale self-imports** (NDS_Library subscribes to itself — `CORE.md`), two older grammars.
- `statusbar_darkmode` `2112d9e78926c14cb1f2dacbc1aac2f3398ede14` → dark as a **separate component**.
- Legacy `Statusbar` (capital S) `e85a19561355a73969857f6c25d9dbb91c63c715`, 2023-08-07 → retired.

**⛔ The defect worth escalating: the live library cannot express a dark statusbar through its master, so the
Layout page's own instances reach for stale snapshots to get one.** A BUILD that imports the master and sets
`Dark mode` **throws** — the axis does not exist. **Escalate: the master needs a dark-mode axis, or the separate
`statusbar_darkmode` component needs sanctioning.**

**Related and REFUTED — `nds_icon_header` is NOT a cross-library conflict.** Master `19619c9f…`
(`Type/Color/Darkmode`, index 2026-06-19); `94ffbc72589e16b24dcaf3532c11b141e6195bf8` (`Type/Color`) is a
**pre-Darkmode snapshot of the same component**, absent from the index, with a visible lineage
(`e40b494d13e6cab0e5cc2c8b5db57b2e5ac94243` 2024-01-12 → `19619c9f…`). **No other subscribed library ships an
`nds_icon_header`**; M.web's is `ndsw_icon_header` `1e4f301bff2b205d1076239009529a1ef13a2109` — different name,
different key. **The master GAINED the axis; the import predates it. Version lag, not disagreement.**
Same shape: `Subpage_top` (**NDS_Templates'**, now ONE set `d6ad46694b936bf545c099efa3d0a538f91696e4`, 2025-10-29),
`sectionbar`, `nds_icon_arrow`. **Import the master; a "missing axis" here usually means you're holding a snapshot.**
Caveat: index **absence is strong, not proof** — `importComponentSetByKeyAsync` in a write session is definitive.

## quickmenu-easy-undocumented — ⚠ (Core corrected; behaviour still blank)
`quickmenu_basic`'s `Type=Easy` (간편홈) hides the hamburger and swaps both end caps, exposing menu items present in
no other variant — **it was entirely absent from Core's description.** Now recorded. **Still blank at source:** no
animation/duration for the 74px→532px expansion, **no dismissal rule** despite ✕ affordances existing in artwork,
and **no rule for which 5 labels appear / max count / overflow** despite `퀵메뉴 등록`/`퀵메뉴 해제` implying
customization. Page badge `👿 NDS 추가 개발 해당없음` is a **scope declaration, not a deprecation** (components are
clean and render) — what "NDS 추가 개발" formally covers is **unverified**.

## tab-2depth-txt-dimmed — ⚠ evidence, NOT a verdict
Section `3683:15217` is at **`opacity: 0.30`** while siblings `switch`/`button` sit at 1.0 — **likely
soft-deprecation, no confirming text on canvas**, and the set itself is structurally clean. **Confirm with a
designer before using `tab_2depth_txt`.** Same mechanism class as `CORE.md` Gotcha 10(c).

## label-height-30-vs-26 — ⚠ CONTESTED (stated as intentional; the reconciliation is blank)
Label is **H30 in Figma, H26 in code** — the page says this is deliberate, but **where the 4px goes is blank at
source.** Related design≠dev instance, explicit at source: Tooltip sticky `30036:719` —
`텍스트 박스 상하 마진은 20이나, 개발상의 수치는 16으로 적용되어야함`. **Measuring the frame gives the WRONG answer by
the design system's own instruction.**

## security-keypad-undecided — ⚠ CONTESTED (three live candidates, none marked adopted)
`as-is` / `to-be_230413` / `📌 아름경은ver` all present, **none marked adopted, no date stamp.** Also
`📌 아래의 540 키패드를 사용해주세요` is explicit, **yet the complete 608 build sits undeleted below it.**
**Correction to a prior expectation:** the page is **not** under-specified for security reasons — it is the *most*
specified page in its batch (11,422-line dump, 26 components). **Over-specified and contradictory, not withheld.**
`keypad_number` names **6 different things** across 2 pages. **No QV keypad exists at all** (number or security).

## illusts-archive-ghosting — ⚠ CONTESTED (a real marking convention whose MEANING is unstated)
On `    - Illusts Archive`, **65 of 153 components are individually ghosted at `opacity: 0.10`, with their captions
at `0.30`** — while the other 88 sit at full opacity. **Selective and per-asset, so it is deliberate**, but the
canvas **never says what it means** (retired? migrated to `nds_illust`? not-for-reference?). **Unresolved — ask a
designer.** No strikethrough anywhere on the page (verified, `struckCount 0`). The page itself is **superseded**:
the live `    - Illusts` consolidated everything into the `nds_illust` SET (140 × NM/N2, no gaps,
`Last update 2025.10.24`), while this page is the loose pre-consolidation grid with **no stamp**.
**Two false leads, recorded so they aren't re-chased:** the keyword hits `중단`/`이전` on this page are **illustration
subject matter**, not deprecation markers; and `ss_img_` is **not** a legacy prefix (refuted via `nds-lib-icons.md`).
See `CORE.md` Gotcha 10(c) — opacity is one of this file's four invisibility mechanisms.

**⭐ The `opacity: 0.10` ghost convention is FILE-WIDE, confirmed on two independent pages.** Also on
`    - Emoji & Nmoji / Infographic Archive`: `nds_nmoji57`, `nds_nmoji146`, `nds_nmoji147` at 0.10. And the
Illusts ghosting is **selective *within* groups** (프로필: 3 ghosted / 3 solid; 투자종류: 2 of 10; **all 29
`QV/illust*` solid`) — **a deliberate two-level convention, not incidental styling.**
**⚠️ Both "no dimming" claims in the first pass were WRONG**, and for the same reason: they rested on
`get_metadata`, **which cannot see opacity**, without screenshotting the grid. *The flagged gap was exactly where
the evidence was.* **Strikethrough was 0 on all five archive pages — dimming carried the entire invisible signal.**
**Against "ghosted = retired":** every ghosted number (08–123) **exists in live's complete 01–140 range**.
**Concrete test for whoever owns `1165:16606`:** do live `nds_illust08 / 30 / 121` depict the same subjects as
archive `투자종류/안정적투자_illust08` / `기본/중단_illust30` / `기본/투자성향_illust121`? If yes → migrated-and-marked-done,
not retired.

## deprecation-marker-👿 — ⭐ an UNDOCUMENTED marker, invisible to metadata
**`👿` is this org's informal deprecation/scope marker**, and nothing documents it: `👿 일단 제외` (Icons Archive
`9286:16426`) · `👿 NDS 추가 개발 해당없음` (Quickmenu page, and NDS_Templates' `Search bar_legacy`).
**Add `👿` / `제외` / `해당없음` to the deprecation sweep** alongside `구버전`/`이전`/`미사용`/`deprecated`/`백업`/`폐기`.
⚠️ **Its text is an INSTANCE OVERRIDE** — layer name `Comment`, characters `일단 제외`. **Invisible to
`get_metadata`; recoverable only by screenshot.** A 5th invisibility mechanism in the same family as `CORE.md`
Gotcha 10 — *the name is not the content, and the content only exists in the render.*
⚠️ **Not all `👿` mean deprecated:** the Quickmenu badge is a **scope declaration** (components clean, render fine).
**Read the sentence, don't pattern-match the emoji.**

## archive-means-parking-lot — ⚠ extends "never triage by name" from ENUMERATION to STATUS
**"Archive" in NDS_Library does not mean "retired" — it means "parking lot". 3 of the 5 archive pages host ACTIVE
WIP:** a `테스트중` keypad section · a `디자인작업용 🎨` 연금 working area · a battery exploration whose screenshots are
filename-dated **2026-02-27 / 03-04**. So an archive page can be **simultaneously superseded and actively edited**,
and a page's *status* is as unsafe to infer from its name as its *content* was. **Judge per frame, not per page.**
Also parked, not retired: the `확장 활용안` keypad proposal is ghosted at **0.5** as a whole block with
`사용시 문의요망` — same subject as the live `- Number Keypad`/`- Security Keypad` pages. **Unchased; possible 4th
conflict.**
**Coverage hole, not a conflict:** **`NDS_StockIcon_CI`** is a named library outside the learned set.

## archive-status-method — ✅ RESOLVED as a **method**, worth keeping
**All four `*-Archive` pages were dated by CROSS-PAGE/CROSS-FILE comparison, not by self-marking** — because
**none of them carries a page-wide deprecation marker.** The page name is never evidence. What worked:
- **Search bar Archive → `deprecated`**: visually matches NDS_Templates `2. Search bar_legacy`, which **is** badged
  (`👿 NDS 추가 개발 해당없음`, red `사용을 지양합니다.`); archive stamp 2022.10.21 < live 2023.08.07.
- **Icons Archive → `superseded`**: the **live** page defines itself *against* it — `nds_icon 이전 리소스와 구분되는
  NDS만의 아이콘 입니다.`
- **Emoji/Nmoji Archive → `superseded`**: it and the live page **share the exact same `nds_nmoji42` gap** → same
  lineage, live is 3 assets ahead. **That also resolves the "missing `nds_nmoji42`" question: the gap is historical
  and present in both — the archive does NOT hold the missing asset.**
- **썸네일 → `unknown`**, correctly: judged on its own evidence; its "archive" status is inherited from page
  position only, and it is file-cover art, for which live-vs-deprecated is arguably the wrong axis.
**Bearing on `#search-bar-states` — ⚠️ CORRECTION, this entry first said "no mic rule … never built". WRONG on the
mic.** The ⛔ **bundles three requirements with three different histories**, and bundling them was the mistake:

| Guide requirement | In the archive? | Verdict |
|---|---|---|
| **Voice-mic rule** | ✅ **14 `nds_icon_mic` INSTANCEs** across LINE / R-SQUARE / COMPLEXE | **BUILT, THEN RETIRED** → reframes |
| **탐색형 type** | ❌ **zero** occurrences of `탐색형` on the page | **NEVER BUILT** → ⛔ stands |
| **4th state** | ❌ archive has **2** (NORMAL/PRESSED); live has 3 | **NEVER BUILT — the count went UP** → ⛔ stands |

**Only the mic reframes**, and it matters: "we removed it" is a different conversation with a designer than "we
never built it". State history is **2 → 3 → (9 variants)** — pure *addition*, so the guide's 4th state has **no
provenance in any generation**. Source: `nds-lib-search-bar-archive.md`.

## welcome-toc-drift — ⚠ (recorded so it is never used as a denominator)
The Welcome TOC **drifts both ways** — worse than the sibling precedent, which only omitted. Real file = **51 pages**
(`figma.root.children`); TOC lists ~25. **Omits 16**, including **`📖 Justify` itself**, the whole `🌈 Graphic
asset` and `👀 Archive` sections, `Chart`, `Title`, `유의사항`, `Number Keypad`, `Security Keypad`, `9-patch`.
**PLUS a phantom: `Date Picker` is in the TOC (and in the V3 ordering) but is NOT a page.**
**Self-refuting:** it omits `Infographic` and `Number Keypad`, which **the changelog on the same page** lists as
2024 updates. **Never a coverage denominator.**
> ✅ **Counterweight — the same page carries the domain's best freshness anchor:** a **dated `Library Update`
> changelog**, latest **2024.06.07** (Infographic), then 2024.02.15 (Box Button), 2024.01.31 (Number Keypad,
> Indicators(step)). Frame is `Notification - Collapsed` → **older entries exist, unread.** Use it to adjudicate
> undated pages.

## justify-deck-fragment — ⚠ (the file's "why" layer is incomplete)
`📖 Justify` is the **UI Pattern guide** — the only place answering *how you decide what goes on a screen* rather
than what a component looks like. **But it exists only as frames `03`/`04`/`06`.** No 01/02/05, and `06`'s own
left-nav advertises **`Structure`** and **`Type A. 조회/요약+ Data Grid`**, which **exist nowhere in the 51 pages.**
No `Last update`. Not deprecated either → `status: unknown`. **Likely home for the missing slides: NDS_Templates**
(`1xE0qvn2yv3ZkQ9BwhKT1y`) — the Welcome `GO ->` carries a real hyperlink to node `1030:25730` there.
Internal defect: frame `03` says **`세 가지 유형`**, frame `04` says **`네 가지의 유형`** while naming three;
diagrams show three on both → **three is correct; `04` is a source defect** (not silently normalised).

## Resolved

Kept, not deleted — this is where VERIFY's `corrected <date>` history lives, and it is the evidence that more
learning *closes* questions rather than only adding them.

- **`Table_cell` / `Table_header` doc-copy question — RESOLVED 2026-07-15 in Core's favour.** `nds-mweb-data-table`
  found the `Type` lists matching Core **verbatim** but all 7 keys different, and each Type a **standalone
  COMPONENT rather than one COMPONENT_SET** — it was classified a page-local doc re-creation and its keys were
  **blocked from promotion**. Templates (`3:160`) settled it: genuine COMPONENT_SETs, `Type` axis real, SET keys
  `fc81ad075240f81283ab0769426639ff87b6e542` / `8074b6b4ab30e8d392bfb6aec6857386f10e5006` matching Core **exactly**,
  `remote: true`. **The tier classification that blocked the promotion was correct** — it prevented a real corruption.
- **Core's "no component key exists yet for the 계좌 컨트롤러 itself" — RESOLVED 2026-07-15.** The answer is **4 keys,
  one per usage context**, all SET + `remote: true`, mapping 1:1 onto the UX Guide's 박스형/라인형/텍스트형 rule.
  See `CORE.md`.
- **`Table_cell` "build multi-field cards manually" — CORRECTED 2026-07-15, half wrong.** The "poor fit" half is
  confirmed (List and Card both hold real 4+-field cards; **neither uses `Table_cell`**). But *"build those manually"*
  is **wrong** — purpose-built published components exist: `colum` `c355ddcba3cd13f902b9ff2d9a678498b0ca119c` and
  `list_product03` `6eb8cdb388e2ffdf8be7688c9f040597c289db80`. Following Core would have meant reinventing them.
- **`toggle_basic` — CONFIRMED 2026-07-15.** `42cff7468c8000d28635cd9abd7695ce9aabc30b` = Core exactly, `remote: true`.
  M.web's missing toggle was **a gap in that file, not a Core error**.
- **NDS_Templates "product order flows" — CORRECTED 2026-07-15. It is not flows.** Five independent probes, **zero
  cross-artifact prototype links each**. The most rigorous (`nds-tpl-feedback`) **found 24 reactions** and correctly
  classified all as internal (cursor blink, panel swap, toast close) with **zero navTargets** — stronger evidence
  than a count of zero. Both halves of the order journey (`매매 주문 확인`, `매수방법 선택`) are refuted, and the
  매수방법선택→매매주문확인 sequence **exists nowhere structurally — only implied by page names.**
  `📱Sample Page` = composed full-screen template galleries.
- **Six truncated, unusable componentKeys — FIXED 2026-07-15.** `54946e9f…`, `123c8f22…`, `16b2d524…`, `6eb8cdb3…`,
  `1f8a2fec…`, `5f4e5c45…` were stored with ellipses and could not be passed to `importComponentSetByKeyAsync`.
  Full values recovered from `projects/*.md` (the data was never lost — only the registry transcription was), plus
  15 more sibling keys in Notes cells. **Prevention**: the key-format rule in `CORE.md`.
- **유의사항_하단노출 key identity — RESOLVED 2026-07-15.** `nds-mweb-precautions` could resolve no key (read-only);
  `nds-tpl-precautions` confirmed `6ab304902264c6101f4a0a62927f79d08c1d5827` = Core exactly, SET, `remote: true`.
