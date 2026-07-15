# nds

Domain knowledge for NH투자증권's NDS (NH Design System) Figma knowledge — the counterpart to `../asset/LEADER.md` (which owns real production *screens*; this file owns the design-system *library/guide* facts those screens are built from).

This domain has three modes. Detect which one applies from the user's request; don't ask unless genuinely ambiguous.

## Mode 1 — LEARN (register an NDS guide/library Figma file)

Triggered when the user gives an NDS-related Figma file name + URL and asks to study/learn it (e.g. "NDS_UX Guide 학습해").

Steps:
1. Load `figma-use` before any Figma tool call.
2. `get_metadata` (no nodeId) on the file to see top-level pages/sections. `get_metadata` on the given nodeId to see the section's frame structure.
3. `get_screenshot` / `get_design_context` on the given node and representative sibling frames to see the actual guide content (component specs, usage rules, do/don't examples, tokens).
4. Note down, concretely (cite actual node/component names, not generic advice):
   - **Component facts**: names, componentKeys, variant axes — cross-reference against the Core reference below; add new ones, flag any that contradict it (libraries evolve)
   - **Usage rules / do's and don'ts** the guide states explicitly
   - **Tokens** (color/font/spacing) if the guide documents them directly
5. Write one file: `projects/<kebab-guide-name>.md` with frontmatter `name`, `fileKey`, `source_url`, `learned_date`, `sections_studied` (node IDs), then the observations from step 4. **Quote copy verbatim, don't paraphrase** — exact rule text is a Mode 3 (VERIFY) finding waiting to happen if it's approximated instead of quoted.
6. If findings extend or correct the Core reference below (new verified component key, a key that no longer resolves, a corrected token), update that section directly — it's the always-on baseline every BUILD pass loads first, so keep it current rather than only adding to `projects/`.

## Mode 2 — BUILD (use NDS knowledge to generate output)

Triggered when the user (or `../asset/LEADER.md` Mode 2) needs to build a screen/component using real NDS components.

Steps:
1. Read the Core reference below first (always-on baseline).
2. If the request touches a topic covered by a learned guide file under `projects/`, read that file too for the more specific rules.
3. Build/validate using `figma-use` / `figma-generate-design` per those skills' rules — real componentKeys and variant names only, no invented components.

## Mode 3 — VERIFY (re-check a learned guide file against source)

Triggered when the user asks to re-review, double-check, verify, or re-learn an **already-registered** guide file (e.g. "이거 제대로 학습된 거 맞는지 봐줘", "다시 검토해줘", "재검토", "검증해줘") — as opposed to Mode 1 (first-time learn, blank slate) or Mode 2 (build). The goal is consistency and accuracy: catch stale component keys, mistranscribed token values, and missed usage rules before they propagate into a BUILD pass.

Steps:
1. **Read the existing `projects/<name>.md` note in full first.** This is the set of claims to check, not a blank slate.
2. Load `figma-use` before any Figma tool call.
3. Re-`get_metadata` on the same node(s) cited in the note's `sections_studied`. If the result exceeds token limits, it's saved to a file — read that with a script (`jq`/python), searching for the literal strings/keys/counts the note claims, rather than skimming or re-requesting narrower slices repeatedly.
4. **Prioritize claims that name a literal string, count, or key** — componentKeys, variant axis names, token values (hex/rgb), exact rule copy. These are the claims most likely to have drifted or been mistranscribed on the first pass, or to have genuinely changed (libraries evolve — re-confirm keys still resolve via `importComponentSetByKeyAsync`, don't assume a prior "broken" or "working" finding still holds). Structural claims (do/don't layout, guide section order) are comparatively stable — spot-check with 1-2 screenshots rather than exhaustively re-verifying every one.
5. `get_screenshot` / `get_design_context` the same representative frames the note cites to visually confirm rules and read exact on-screen copy. TEXT node `name` attributes in the metadata usually mirror their displayed content, but not always (long strings can carry a custom layer name) — when a metadata string-search comes up empty for a quoted claim, fall back to reading it directly off the screenshot instead of assuming it's unverifiable.
6. **Actively search for designer's own annotation text** near the reference frames — spec notes, explicit token/usage rules, reference-frame labels, etc. These are frequently the highest-value find of a VERIFY pass.
7. **Update the project file (and the Core reference below, if affected) in place, not by silent overwrite.** Mark every correction inline with a `corrected <today's date>` or `added <today's date>` note stating what changed and why (cite the old vs. new value). Add/bump a `reviewed_date` field in the frontmatter.
8. If nothing was wrong, still stamp `reviewed_date` and add a one-line "re-reviewed `<date>`, no corrections" note — a verified-clean project is worth recording as such, so a stale `reviewed_date` doesn't get mistaken for "never checked."

## Registered projects

(Populated as NDS guide files are learned via Mode 1 — see `projects/` for the individual files.)

### NDS_UX Guide (`nEINCcmC7AVkWSqRkq60y1`) — coverage: 18/18 content pages, complete as of 2026-07-15

## Enumerating pages — read this first

**Two obvious methods are both WRONG. Only one works.**

| Method | Result | Verdict |
|---|---|---|
| `get_metadata` with no `nodeId` | Returns **1 page** (Welcome, `2:2899`) | ❌ Broken on this file. Reports only what's loaded in the desktop session, not the document. |
| The Welcome/TOC page's own index (`2:2899` → text nodes `3751:3`, `3751:4`) | Lists **17 topics** in 4 groups | ❌ Incomplete. **Silently omits `- Principles`** — the foundational page. |
| `use_figma` → `figma.root.children` | Returns **28 pages** (18 content) | ✅ **Authoritative. Use this.** |

```js
// The only reliable page enumeration for a Figma file:
return figma.root.children.map((p,i) => `${i+1}. ${p.id} | ${p.name}`).join("\n");
```

> **This is not hypothetical.** On 2026-07-15 a coverage audit driven by the TOC reported "17/17 complete" and shipped that claim. A baseline test using `figma.root.children` found an 18th content page (`- Principles`, `4200:70`) that the TOC never lists. Never certify coverage from a TOC or from `get_metadata`.

Page anatomy: of the 28 pages, **18 are content** (name starts with `- `), 4 are section headers (`🎨 Accessibility 접근성`, `✍️ UX writing 서비스 글쓰기`, `✍️ Usage Guidelines`, `📱 Patterns`), 5 are `-----` separators, 1 is Welcome. Only the `- `-prefixed pages carry rules.

| Group | Topics | Status |
|---|---|---|
| *(ungrouped — not in the TOC)* | **Principles** (프로덕트/UI·UX/Graphic/UX Writing/Interaction 원칙) | 1/1 ✅ |
| Accessibility (접근성) | 색상 명도대비, 터치영역 설정, 등락기호표기 | 3/3 ✅ |
| UX Writing (글쓰기) | 완료팝업, 통화표기, 알림톡, 데이터 없음 | 4/4 ✅ |
| Usage Guidelines | 탭, 버튼, 팝업, 계좌 컨트롤러, 넛징, 데이트 피커 | 6/6 ✅ |
| Patterns | 검색, 유의사항, 공유하기, 이용동의 | 4/4 ✅ |

**Not covered, deliberately**: the Welcome TOC's fifth list, **Sample Page** (node `2:2910` — 서비스안내/정보입력/스텝/동의/검색·조건검색/조회/유의사항/설정·편집/완료팝업/자산/주문·거래/이체·환전), is `hidden="true"` and is not a page — it's a text node on the Welcome page listing sample *screens*, not guide rules. If ever needed they belong in `../asset/`, not here.

**TOC typo to know**: the Welcome TOC lists "등록기호표기"; the actual canvas and the learned file are **등락기호표기**. The TOC is wrong — one more reason not to trust it.

| Project | File | Learned | Last reviewed | Notes |
|---|---|---|---|---|
| [nds-ux-guide-principles](projects/nds-ux-guide-principles.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — Principles) | 2026-07-15 | — | **The foundational page — every other guide is an application of these 19 principles.** 5 categories: 프로덕트 (Minimum Thinking / Value First, Cost Later / Clear Communication / Impact First), UI·UX (Instinct / Seamless / Hierarchy / consistent), Graphic (Originality / Instinct / Recognizability / Consistency), UX Writing (Clear / Concise / Empathetic / Trustworthy), Interaction (Predictable / Immediate Feedback / Goal-oriented — only 3). Use as tiebreaker when a specific guide is silent. **Not listed in the Welcome TOC** — nearly missed entirely; see the enumeration warning above. Every TEXT node carries a placeholder layer name (`6개월간 4500시간 단축`) unrelated to content — screenshots are the only way to read this page. |
| [nds-ux-guide-color-contrast](projects/nds-ux-guide-color-contrast.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — 색상 명도대비) | 2026-07-15 | 2026-07-15 | Contrast rules: 4.5:1 baseline, 3:1 for large/bold text, labels get an app-only exception (not on homepage). Includes the pass/fail badge convention and the Figma color-picker contrast-check workflow. Re-reviewed 2026-07-15 — corrected a misread ratio digit (11.89→11.69) and a section/node-ID mislabeling (Figma's internal frame layer names didn't match the on-canvas section numbers); see the file's inline `corrected 2026-07-15` notes. |
| [nds-ux-guide-touch-area](projects/nds-ux-guide-touch-area.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — 터치영역 설정) | 2026-07-15 | 2026-07-15 | Touch-target minimums per element: FAB 52pt (button = touch area, ≥16pt margin), nav icons 34px icon/40px touch/8-16px gap, generic icon & check buttons 36px touch/8-16px gap, list/card icon buttons 36px touch/8-12px gap + one primary action per row. Thumb-zone (75% of taps are thumb-driven, Josh Clark cited) and one-action-per-card principles precede the sizing table. Same frame-layer-vs-on-canvas-number mismatch as color-contrast confirmed again here. |
| [nds-ux-guide-updown-notation](projects/nds-ux-guide-updown-notation.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — 등락기호표기) | 2026-07-15 | 2026-07-15 | Two parallel systems: ▲/▼ triangle (scoped to 지수/현재가/관심그룹/종목요약팝업 only) vs bare +/- sign (standalone rate/return elsewhere). Color: 상승=red, 하락=blue, 보합=green-no-glyph (Korean-market convention, reversed vs US). Only one of amount/rate gets the glyph when both shown together. Financial products with no possible negative return drop the `+` sign entirely. |
| [nds-ux-guide-completion-popup](projects/nds-ux-guide-completion-popup.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — 완료팝업) | 2026-07-15 | — | UX **writing** rules ("NHI UX Writing Guide" tag), not layout: success headline must contain "완료" and be active voice ("등록을 완료했어요" ✅ / "등록이 완료됐어요" ❌ — watch the `-됐/-되었` passive tell); failure headline is "…이/가 완료되지 않았어요", never "실패했어요". A hidden annotation saying to use '실패' is stale — the visible rule wins. |
| [nds-ux-guide-currency-notation](projects/nds-ux-guide-currency-notation.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — 통화표기) | 2026-07-15 | — | The most mechanical of the writing guides. Always comma-group by 3. Marker is chosen **by surface**: 대시보드/총액/카드형 입력 → `원`/`$`; 문장 내 → 한글 통화단위 only (never `$`/`USD` mid-sentence, except 나열식 lists); 리스트/테이블 → 통화코드 **after** the amount, right-aligned. |
| [nds-ux-guide-alimtalk](projects/nds-ux-guide-alimtalk.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — 알림톡) | 2026-07-15 | — | Governs **outbound** KakaoTalk messages, not in-app screens — only relevant when a pass touches notification copy. Five-slot spine in order: 제목 → 요약 → 상세 → 설명 → 참고. 제목 is 동사형, outcome-first, prefixed `[NH투자증권]` ("안내" is the named anti-pattern). Largest page in the file (14 slides). |
| [nds-ux-guide-empty-state](projects/nds-ux-guide-empty-state.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — 데이터 없음) | 2026-07-15 | — | Core stance: an empty state is a **merchandising opportunity, not an error**. Never end on the absence — Headline + Body + CTA. Ending style is **`-어요`, not `-습니다`** (the single most mechanical check on the page). |
| [nds-ux-guide-search](projects/nds-ux-guide-search.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — 검색) | 2026-07-15 | — | Whole search journey: entry → input → results → empty. Bar type follows the screen's **purpose**: 탐색형 (search is the job) puts `searchbar_basic` in the header slot replacing the title; 기본형 (search filters an on-screen list) puts it in a row below `header_basic`. Design all four states, not just Normal. |
| [nds-ux-guide-precautions](projects/nds-ux-guide-precautions.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — 유의사항) | 2026-07-15 | — | **The *why* behind Core-reference component `유의사항_하단노출`** — read together. Case picked mechanically by length: 1문장 → Case 02 floating bar (`Type=1줄`); 2줄 → `Type=2줄`, text box ≤428px; 2–3단락 → Case 01 block; 4+단락/5+항목 → Case 03 popup (4↓ 슬라이딩, 5↑ 풀). Never give a disclaimer its own background color. |
| [nds-ux-guide-share](projects/nds-ux-guide-share.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — 공유하기) | 2026-07-15 | — | App vs web diverge: **app** → OS share sheet (never a custom Kakao/링크복사 menu); **web** → custom 3-item menu 카카오톡 / 링크 복사 / 더보기, in that order. Web 단발성 이벤트 pages are the exception (OS sheet directly, no Kakao). |
| [nds-ux-guide-consent](projects/nds-ux-guide-consent.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — 이용동의) | 2026-07-15 | — | Five consent patterns; cases 01/02 are the defaults, and 03/04/05 are marked **예외)** — compliance-driven (상품 매매 / 마이데이터 / 개인(신용)정보처리 respectively), using them elsewhere is misuse. Copy is fixed ("[필수] 동의합니다", "모두 동의합니다"). CTA is **always gated** — never mock an enabled CTA with unchecked required consents. |
| [nds-ux-guide-tab](projects/nds-ux-guide-tab.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — TAB 탭) | 2026-07-15 | — | "Is it even a tab?" — all three must hold: selecting doesn't navigate/open a popup, it's a single horizontal row (a vertical rail is never a tab), and it's single-select (multi/zero-select → that's a filter). `Last update 22.11.17`. |
| [nds-ux-guide-popup](projects/nds-ux-guide-popup.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — Popup 팝업) | 2026-07-15 | — | Picks among four overlay types. 풀팝업 for one self-contained core process (hide `quickmenu_basic`, no bottom exit button); 레이어 팝업 only for 1~2 sentences with no options/table/agree-button; 슬라이딩 팝업 is the default — **if it would need to scroll, escalate to 풀팝업**. Also holds the most concrete button rules in the whole file (§04 팝업 하단 버튼). `Last update 22.11.21`. |
| [nds-ux-guide-button](projects/nds-ux-guide-button.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — Buttion 버튼) | 2026-07-15 | — | **STUB — this page has zero guide slides; the content lives in Notion.** (Page name carries the guide's own typo "Buttion".) Registered so the gap is recorded, not rediscovered. For button rules route to: `nds-ux-guide-popup` §04 (wording/ratios/left-slot dismiss) → `nds-ux-guide-touch-area` §03 (min sizes) → Core reference `btn_bottom_page_assets`. **Do not read the missing Figma page as "no button rules exist."** |
| [nds-ux-guide-account-controller](projects/nds-ux-guide-account-controller.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — Account Contoller 계좌 컨트롤러) | 2026-07-15 | — | Type is chosen by content, not taste: **박스형** mandatory when mixed with buttons/inputs (default for 호가창 order screens), **라인형** mandatory when showing 잔고 (default for 상품/MY/신청/조회), **텍스트형** when sharing a row or space-constrained. ▼ icon + 계좌번호 always mandatory (empty state = `선택할 수 있는 계좌가 없습니다.`, never blank). Sits directly under header/tab. Picker follows controller type; picker text must equal controller text. **Resolves what `popup_radio_account`'s `Type` variants mean** — see Core reference note. (Page name carries the guide's own typo "Contoller".) |
| [nds-ux-guide-nudge](projects/nds-ux-guide-nudge.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — Nudge 넛징) | 2026-07-15 | — | Three bottom-message patterns split by 동작 유도: **토스트** (no action, 2~3초, margin 74), **스낵바** (message + text button, one at a time, margin 74), **넛징** (emoji pill + `nds_icon_arrow` chevron, 5~7초 or until acted on, **margin 4**). The 74 is the quick-menu height. Includes the full 스낵바 폼디 property table (`snacktype` base=토스트 / filelink=스낵바, duration, animationFADE, bottomMargin…) and the 넛징 두괄식 copy rules. **Two specs are blank in the source** (toast 최대 글자수 = `논의`; snackbar 지속시간) — escalate, don't guess. |
| [nds-ux-guide-date-picker](projects/nds-ux-guide-date-picker.md) | `nEINCcmC7AVkWSqRkq60y1` (NDS_UX Guide — Date Picker 데이트피커) | 2026-07-15 | — | **Underline = tappable** is the core affordance; no underline → ‹ › arrows only. 조회설정 popup presets auto-fill + disable the date fields, 기간설정 enables them **preserving** the preset's values. Per-picker OS split differs every section (Y/M/D: AOS OS-calendar center popup+`확인` vs iOS bottom sheet+`선택`; Y/M wheel: AOS custom/iOS library; time: AOS custom/iOS system Picker). Time is 24h, 10-min steps. 주기 설정 uniquely has **no confirm button** and offers `마지막 일`, not 31일. `Last update 25.10.16` — freshest guide in the file. |

## Core reference (always-on baseline)

Reference data collected from a real NHIS Digital Platform Figma file (org `organization::1445250327526291914`) so future `use_figma` work doesn't have to re-discover the same components from scratch. Always confirm keys still resolve with a quick `importComponentSetByKeyAsync` before relying on them — libraries evolve.

**Promotion bar note** (for consistency with `../asset/LEADER.md` and the production-site domains, which require ≥2 independently-learned projects before promoting a claim to their own "Common patterns" section): this Core reference doesn't wait for a 2nd source. NDS is a single canonical design-system library — one confirmed observation from the real, subscribed library file is already authoritative, since there's no second independent implementation to cross-check against. `asset` covers independently-built shipped screens that might each do things their own way, so that domain's bar is intentionally higher. This is a deliberate difference in how the two domains work, not an inconsistency.

### Libraries

Discovered via `get_libraries({ fileKey })` on a file already subscribed to NDS. Library keys are long-lived; reuse them directly in `search_design_system({ includeLibraryKeys: [...] })` to scope searches instead of searching everything.

| Library | libraryKey | Contents |
|---|---|---|
| NDS_Library | `lk-e6bea415400bda7333bf420ebc524217219c3d9a92b4b42c8fe4e43e2bf613b37c02396f57bcda1f307f67fa55fe9b0b5d405b1b977e0313aecdfcb7951e5119` | Core components: headers, buttons, radio/checkbox, tabs, icons, tables |
| NDS_Templates | `lk-6485b4ef7b0b10972b6bedaec2939b2704dde7bf1b3c11029414263b122918e9dec57db8c867a3e3c30d3ccd34568ea2cd685c80389235d66d054f4a651770a6` | Full page templates (e.g. product order flows) |
| NDS_Colors | `lk-a53c04528e4f6b93f81844642ba2d019d3e52894662e8def952bf0ea35739941a9316cf5abf9c2320d59cb70e584b84d7cf59c567ef44d17dc5791fd1ad0ea9b` | Color fill styles — names are cryptic numeric codes (e.g. `NM/Primary/270.274`, `NM/Grayscale/20.203`), not semantic. Faster to sample colors directly off existing component instances (see Tokens below) than to decode style names. |
| NDS_Darkmode Colors | `lk-77c238f65d24623b72cc780ce48ba757b17edd3122aea855450a33fe3643b869cd2d2a19c2079333cbdcaf940375e853687bb924c00dac4398a46b2497ea4121` | Dark-mode counterpart color styles |

`Channel` variant property seen across many components: `NM` = 나무(NAMUH?) main channel, `QV` = QV channel. Default to `NM` unless the target screen is explicitly a QV surface.

### Verified component keys (componentKey, for `importComponentSetByKeyAsync`)

All from NDS_Library unless noted.

| Component | key | Variant axes | Notes |
|---|---|---|---|
| `header_stock` | `28c77263cb49ee32b6dc3ab6df216e5887659855` | Channel, country, Type | Good reference for header structure (back icon + title + right icons); has nested `tit` and `nds_icon_header` instances |
| `header_basic` | `c95043e94317fde7230298017f42dd8099e1cbdc` | Channel, Left Icon, Right Icon | **Broken as of 2026-07**: `importComponentSetByKeyAsync` succeeds but instancing throws `"Component set for node has existing errors"`. Build headers manually instead — see Workaround below. Re-test before trusting it again. |
| `nds_icon_header` | `19619c9f1fd2e3c2e6515542d0484e651f3f30c6` | Type, Color, Darkmode | 81 variants. Confirmed present: `back`, `close`, `info`, `bell`, `bellnew`, `guide`, `kebab`, `stock`, `mic`. Use `Color=2, Darkmode=false` for standard light-mode icons. |
| `btn_bottom_page_assets` | `0fc4758ec4ab4c83ad6052748c3dabf76d0542e8` | Channel, Type(`1-btn`/`1:2-btn`/`2-btn`), Status(`normal`/`disabled`) | Primary (green) bottom CTA. `1-btn` = full-width single button (540w). `2-btn` = one half of a two-button row (270w) — place two instances side by side. Override text via nested `TXT` node (`findAllWithCriteria({types:["TEXT"]}).find(t=>t.name==="TXT")`). |
| `btn_bottom_page_assets_gray` | `873d1a7bbe44364aef31c19bbf15f19d7d457265` | Type(`1:2-btn`/`2-btn`, + `(icon)` variants), Status | Secondary/gray counterpart — pair with the green `2-btn` above for confirm-dialog cancel/submit rows. |
| `radio_basic` | `91f58f3a086c5ef03ac03c8d77a725d32b3f7a1f` | Channel, Status(`normal`/`selected`/`disabled`/`disabled-selected`) | Bare 26×26 radio circle, **no nested label** — wrap in your own auto-layout pill with a text node alongside it for a labeled option. |
| `radio_btn` | `1a972d991cc7c8f8f97bc5557740fba58ca82f23` | Height(`h60`/`h46`), Active(`on`/`off`/`disabled`) | Alternative full-row radio control |
| `popup_radio_account` | `bca81c36fdb886105179354ec7c1a6b150c0d0e8` | Type(`계좌만`/`통장이름`/`잔액표시`), Status(`normal`/`selected`) | **This is a 계좌 선택창 (picker) row, not the 계좌 컨트롤러 itself** — the two are strictly distinct; see `projects/nds-ux-guide-account-controller.md`. **The `Type` axis is a rule decision, not styling** (added 2026-07-15 from that guide): `계좌만` = 계좌번호 only, `통장이름` = +계좌정보, `잔액표시` = +잔고표시 — and per 원칙 3, `잔액표시` implies the feeding controller must be 라인형. Picker text must equal controller text (only 잔고표시 may be dropped). Guide shows a `최대 24글자 표기 이상은 말줄임` budget on the secondary line, consistent with the no-reflow clipping gotcha below. **No component key exists yet for the controller itself** — a real gap, since it appears on nearly every transactional screen. Full-width (480px default) account-row selector card. Nested TEXT nodes named `통장이름` (title) and `계좌번호` (subtitle) — override both via `findAllWithCriteria({types:["TEXT"]})`. **Do not shrink below ~330px width** — internal text doesn't reflow and clips; use full-width, stacked vertically, not squeezed side-by-side. |
| `check_icon_solid` | `3452ebde77d6d2d759f123e422ccee3a6c01b3c4` | Channel, Height(`h34`/`h26`), Status, Darkmode | Solid checkmark badge, good for completion/success states |
| `check_icon_line` | `0598f4c21dd68667d15d34875f12c1b3e1176c34` | Channel, Status | Outline checkmark |
| `tab_2depth_chip` | `0f20528265a3c598e42e30f6ae422be67e941c10` | `Property 1` (`Default`/`Variant2`) | Default variant ships pre-populated with multiple example `tab_btn` + `TXT` pairs (not a clean 2-state toggle) — trim to the N tabs you need or build a simple 2-pill toggle manually if you only need 2 states. |
| `Table_cell` | `fc81ad075240f81283ab0769426639ff87b6e542` | Type(`rate`/`with button`/`button`/`multi`/`2line`/`global`/`basic`) | Fits simple label+value or label+icon rows; not a good fit for multi-field cards (e.g. a stock card with 4+ label/value pairs + a status chip) — build those manually instead. |
| `Table_header` | `8074b6b4ab30e8d392bfb6aec6857386f10e5006` | Type(`switch`/`sorting`/`2Line`/`basic`) | |
| `toggle_basic` | `42cff7468c8000d28635cd9abd7695ce9aabc30b` | Channel, Height(`h32`), Active(`on`/`off`) | |
| `nds_icon_menu` | `9bc511d2e0676903ee9be6cdeb26598d234604b7` | Type(`exchange`/`setting`/`login`/`logout`/`person`/`home`) | |
| `quickmenu_basic` | `9c5dd3cd3e714255914cf288f442fad7c3ac76dd` | Channel, Type(`normal`/`pressed`/`Easy`) | Global 5-icon app-shell bottom nav (+ hamburger = 6 tappable slots): 홈/관심 그룹/주식 현재가/국내주식 주문/국내주식 잔고·손익. Nested TEXT names match those labels exactly for override. Appears on **every** real screen in the app, not just list screens — include it on any screen meant to look "real" unless that screen has its own sticky primary CTA (then the CTA replaces it, don't stack both). |
| `유의사항_하단노출` | `6ab304902264c6101f4a0a62927f79d08c1d5827` | Type(`1줄`/`2줄`), 더보기(`on`/`off`) | Persistent one-line (or two-line) disclaimer bar that sits directly above `quickmenu_basic`, always visible (not just in a popup). Use `더보기=on` to keep a "more" link that opens the fuller info popup. Single nested TEXT named `유의사항(default)` — override directly. |
| `nds_icon_arrow` | `dde648604e4d08cc6b99c44dda81ec73ccbb4b15` | Color(`01`/`03`/`04`/`05`/`06`), Type(`up`/`down`/`left`/`right`), Height(`h16`/`h24`) | Two different components share this exact name (an older one, key `e5c1cd3126858fc4f2ad492128e21c059097a5b9`, last updated 2025-11-03) — prefer the more recently updated key above. Use `Type=right` for a plain list-row chevron (the "actionable, nothing pending" state in a 3-tier status pattern — see `../asset/projects/domestic-stock-rights.md`). |

### Sampled tokens (fonts/colors observed on real component instances)

Because NDS_Colors style names are non-semantic numeric codes, prefer sampling actual fills/text colors off existing component instances (see `figma-use` for the sampling script pattern: create instance → `findAllWithCriteria` → read `fills`/`fontName`/`fontSize` → remove instance) over guessing a style name. Values confirmed 2026-07:

- Brand primary green (NM channel button fill): `rgb(0.518, 0.757, 0.239)` ≈ `#84C13D`
- Body ink: `rgb(0.2, 0.2, 0.2)` = `#333333`
- Muted secondary text (labels, switcher text): `rgb(0.341, 0.376, 0.416)` ≈ `#576078`
- White surface: `#FFFFFF`
- Headers/buttons font: `NanumBarunGothic` (`Bold` for titles/CTAs, `Regular` for body use in headers)
- Labels/body font: `Pretendard` (`Regular`, `SemiBold`)
- Account-row title font: `Roboto Medium` (as used inside `popup_radio_account`)
- `popup_radio_account` corner radius: 16px. Bottom CTA buttons: 0 radius (square, full-bleed).

### Workaround: manual header (since `header_basic` is broken)

```js
const iconSet = await figma.importComponentSetByKeyAsync("19619c9f1fd2e3c2e6515542d0484e651f3f30c6");
const backIcon = iconSet.children.find(c => c.name === "Type=back, Color=2, Darkmode=false").createInstance();
const infoIcon = iconSet.children.find(c => c.name === "Type=info, Color=2, Darkmode=false").createInstance();
const header = figma.createAutoLayout("HORIZONTAL");
header.paddingLeft = 8; header.paddingRight = 12; header.paddingTop = 14; header.paddingBottom = 14;
header.itemSpacing = 8; header.counterAxisAlignItems = "CENTER";
header.appendChild(backIcon);
const title = figma.createText();
await figma.loadFontAsync({ family: "NanumBarunGothic", style: "Bold" });
title.fontName = { family: "NanumBarunGothic", style: "Bold" };
title.fontSize = 17;
title.characters = "화면 제목";
header.appendChild(title);
title.layoutSizingHorizontal = "FILL";
header.appendChild(infoIcon);
```

### Canvas width: build at 540px, not 375px

Every real NDS screen — every frame across NDS_Library, NDS_Templates, and the shipped `domestic-stock-rights` production file — uses a **540px-wide canvas** (`statusbar width="539.99..."`, `header_basic width="540"`, all screen frames `width="540"`), not the 375px iPhone-point convention. Components like `quickmenu_basic` and `유의사항_하단노출` have internal children with fixed pixel widths sized for a 540 canvas; forcing them into a 375-wide frame via `layoutSizingHorizontal = 'FILL'` does **not** shrink those internal children — it just clips them (looks like mangled/truncated Korean text at small screenshot scale, easy to misdiagnose as a font-rendering bug rather than real overflow). **Always build new NH MTS screens at 540px width** to match the system natively, especially any screen that will include app-shell components (`quickmenu_basic`, `유의사항_하단노출`, `header_stock`, etc.).

### Gotchas specific to this design system

1. **`header_basic` import succeeded on one attempt (this file, `mxm5Ml7RfFH9bEXrhWdKRy`), but failed with `"Component set for node has existing errors"` on another attempt in the same file.** Also confirmed working as a plain `createInstance()` when observed inside an existing production file (`domestic-stock-rights` project, fileKey `ZkwarjFkN8BiGolWO7PcwI` — title-as-dropdown variant instanced fine there). So the break is not universal to the component — likely a specific corrupted variant or transient import-cache issue in a specific target file. **Don't assume it's broken — try it first**, and only fall back to the manual-header workaround below if the specific file/variant actually errors.
2. **`popup_radio_account` breaks when resized narrow.** It's built for a single full-width row in a vertical list (account picker / bottom sheet), not a side-by-side card. Stack rows vertically at full width (≥330px).
3. **`radio_basic` / `check_icon_*` are bare glyphs with no label slot.** Always pair them with your own text node in a wrapping auto-layout frame if you need a labeled option or list row.
4. **Color style names in NDS_Colors/NDS_Darkmode Colors are opaque numeric codes** (`NM/Primary/270.274` etc.) with no changelog describing which is "the" brand green. Sampling real instances is faster and more reliable than guessing from the name list — see Sampled tokens above.
5. Multiple plans exist on this account (`whoami`) — for NH-internal work the right org is usually **NHIS Digital Platform** (`organization::1445250327526291914`), not the personal `chunsung's team` plan.
