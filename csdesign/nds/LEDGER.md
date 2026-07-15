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

## search-bar-states — ⛔ BLOCKED (guide cannot be satisfied)
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

## nudge-blank-timing — ⛔ BLOCKED (blank at source — designer decision, not a research gap)
`nds-ux-guide-nudge` leaves two specs empty: toast **`최대 글자수`** is literally marked **`논의`** ("under
discussion"), and snackbar **`지속 시간`** is blank. **Unresolved after checking three files**: M.web's Dialog page
(named "Dialog (snack bar, toast message)" but **contains no snackbar at all**, and its `toast_basic` is a plain
frame with zero componentKey) and Templates' Alarm page (**not even the same UI category** — it is outbound
알림톡/푸시). **Do not invent a value.** This is the specific case of the general pattern in `CORE.md` Gotcha 6.
Sources: `nds-ux-guide-nudge.md`, `nds-mweb-dialog.md`, `nds-tpl-alarm.md`.

## header-basic-keys — ⚠ CONTESTED (not resolvable read-only)
Core's `c95043e94317fde7230298017f42dd8099e1cbdc` is **corroborated 6× independently** (`remote: true`, 18 of 19
instances on the Header page). **But a second, genuinely different, also-`remote: true` SET coexists**:
`07fb2e569ac9d8cd9e31b49cf8770209df58c089` (마이데이터, node `32762:3302`). **Two published components share the
name.** `statusbar` is worse — **6 distinct keys** across `3:158`, `3760:33077`, `9665:20994`, `9665:19604`.
`header_stock` `2037ab88…` ≠ Core's `28c77263…`.
**Two causes, now distinguished — don't collapse them (see `CORE.md` Gotcha 5):**
**(a) proven artefact** — `Topbar_Dropdown` reports COMPONENT `69e7ffd43cdf9888ae6fc9bbedff3627fe504e6d` **with
parent SET** `ce701f7c5eda23073d17bd862838e75f191b0a96`; two earlier agents reported those same two keys as a
"conflict". Same component. **(b) genuine collision** — the two `header_basic` SETs above are both real.
**Blocked because `importComponentSetByKeyAsync` throws in a read-only session.** Needs a write-capable session.

## radio-keys-never-sighted — ⚠ CONTESTED (Core lists them; nothing has ever seen them)
`radio_basic` `91f58f3a086c5ef03ac03c8d77a725d32b3f7a1f` and `radio_btn` `1a972d991cc7c8f8f97bc5557740fba58ca82f23`
are in `CORE.md`, but **have never been sighted live across 3 Figma files / 77 pages** — 4 consecutive misses,
including the two pages most likely to hold them (`nds-tpl-controls`, `nds-tpl-questionnaire`, a robo-advisor
questionnaire, which uses `check_icon_line` for single-select instead). **Their status is now a *known* gap, not an
unexamined one.** Related, proven: **a literal "switch" component does not exist** (382-node sweep, zero matches)
despite `Controls (toggle, switch, check, radio)` promising it in its page name.

## precautions-width — ⚠ CONTESTED (evidence 2:1, NOT adjudicated)
`nds-tpl-precautions` states verbatim on-canvas (text node `2707:27147`): *"할 말이 많을 경우 최대 두 줄로 제한합니다.
텍스트박스 가로길이 **최대 428px**"* — corroborating `nds-ux-guide-precautions` (428px) against
`nds-mweb-precautions` (**286px**). **Not adjudicated: M.web is mobile web and 286 may be correct for that
platform.** Do not overwrite either. Resolve with a designer.

## tab-2depth-chip-source — ⚠ CONTESTED (source unidentified across all 3 files)
`tab_2depth_chip` `0f20528265a3c598e42e30f6ae422be67e941c10` (axis `Property 1` = `Default`/`Variant2`) is in
`CORE.md`, but **no page in any of the three files sources it.** `nds-tpl-tab` has no node of that name and **no
`Property 1` axis at all** (its axes are `Colum`/`Type`, `Channel`); `nds-mweb-tab` found no match either.

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
