---
name: domestic-stock-rights
fileKey: ZkwarjFkN8BiGolWO7PcwI
source_url: "https://www.figma.com/design/ZkwarjFkN8BiGolWO7PcwI/반영완료⭐️-국내주식-권리?node-id=262-9472"
learned_date: 2026-07-14
reviewed_date: 2026-07-15
screens_studied:
  - "309:18455 국내주식권리_보유권리_전체 (list)"
  - "309:16045 국내주식권리_보유권리_상세 (detail sheet)"
  - "487:5686 국내주식권리_보유권리_상세 (detail sheet, variant 2 — 매수청구 fields)"
  - "309:16376 popup_silding_basic_table04 (detail sheet, 'full data' reference frame — labeled 상세 전체 데이터 by the designer)"
  - "275:8332 국내주식권리_보유권리_없음 (empty state)"
  - "309:14494 popup_유상청약 권리 확인 (nav-confirm popup)"
  - "330:22548 popup_매수청구 권리 확인 (nav-confirm popup)"
  # added 2026-07-15 — full-file re-audit, MASTER screen inventory pushed to 26/26 product frames
  - "323:20860 테이블 (empty/just-toggled, scroll-depth seq. 1/4)"
  - "487:5796 테이블 (populated unscrolled, seq. 2/4)"
  - "473:4022 테이블 (mid-scroll, sticky header, seq. 3/4)"
  - "507:4886 테이블 (scrolled to end, seq. 4/4)"
  - "333:7386 조회설정 (6개월 preset, date fields disabled)"
  - "333:10115 조회설정 (기간설정 custom, date fields enabled)"
  - "333:2997 예정권리 (populated, 3 cards)"
  - "333:10270 예정권리 (chrome-only blank)"
  - "333:3130 예정권리_없음 (empty state)"
  - "309:12863 직접선택 (clipped in-app bottom sheet, 18 rows/18 options visible)"
  - "306:11610 직접선택 (full reference frame, no chrome/dim, 18 rows/36 options)"
  - "322:18728 보유권리_유상 (type-filtered list, inline CTA)"
  - "323:19590 보유권리_매수청구 (type-filtered list, 반대통보 badge)"
  - "323:20165 보유권리_배당 (type-filtered list)"
  - "338:12388 보유권리 (scrolled-tab-bar reference frame, no 합산조회 checkbox)"
  - "487:5340 보유권리 (mixed-type feed)"
  - "309:17357 상세_스크롤영역 (two-zone sticky-header detail sheet)"
  - "309:15860 05_알림설정_계좌 (adjacent feature, instance only, not deep-learned)"
status: shipped ("반영완료⭐️" in file name — this is production-shipped, not a draft; highest-confidence reference) — see 디자인검수 resolution section below for a qualified per-instruction breakdown (added 2026-07-15)
---

# 국내주식 권리 (Domestic Stock Rights) — NH투자증권 MTS

This is a **shipped production file** (file name is literally "반영완료⭐️" = "reflected/shipped"), covering the domestic-stock counterpart of the overseas-stock voting-rights feature — but broader: it handles all domestic corporate-action right types (배당/dividend, 유상증자/rights offering, 무상증자/bonus issue, 매수청구/appraisal rights, 의결권/voting, etc.), not just voting. Treat this as the ground-truth reference for how NH actually builds a "권리" (corporate-action rights) feature end to end — more authoritative than anything inferred generically.

**Re-reviewed 2026-07-15** against the live Figma file (`get_metadata` + `get_screenshot` on the screens above). Structural claims (screen inventory, bottom-sheet detail pattern, single-CTA popups, app-shell chrome, empty-state chrome retention) all held up. The corrections below fix wording/field-name inaccuracies from the first pass and add designer annotations that were missed — apply these, not the original guesses, when building.

**Second re-review, same day (added 2026-07-15) — whole-file audit, not just MASTER.** The first 2026-07-15 pass only re-checked the `screens_studied` list above (all on the MASTER page). This pass read `figma.root.children` and every one of the file's 6 pages, learned 18 net-new MASTER product screens (now 26/26 product frames covered), and read the file's 3 planning/rationale pages + 1 scratch page + 1 deck-only page in full. See **Page coverage** immediately below, then the per-page sections, for what changed.

> **Build-facing reference.** VERIFY forensics (page coverage, 디자인검수 tickets, 기획안 decks, page verdicts,
> read-only gotchas) moved to `../sources/domestic-stock-rights.md` on 2026-07-15 — a BUILD pass never needed
> them, and they were 40% of the read. Open gaps moved to `../LEDGER.md`.

## MASTER screens (`⭐MASTER⭐ 국내주식 권리`, `262:9472`)

The sections below (Screen inventory through Takeaways) all describe this page. `77 direct children` (**corrected 2026-07-15**, was "42 top-level frames" — see correction note under Screen inventory) — the other 51 children are loose annotation text/vector nodes and sections, not additional screens.

## Screen inventory (from the master page, ~77 direct children — corrected 2026-07-15, was "42 top-level frames")

- `국내주식권리_보유권리_전체` — held-rights list, "all types" view (2 variants)
- `국내주식권리_보유권리_테이블` — held-rights list, table/grid view (4 variants — different scroll/state depths)
- `국내주식권리_예정권리_전체` — upcoming-rights list (2 variants)
- `국내주식권리_보유권리_유상` / `_매수청구` / `_배당` / `국내주식권리_보유권리` (no suffix, generic/untyped variant) — right-type-specific list variants (**4, not 3** — corrected 2026-07-15)
- `국내주식권리_보유권리_직접선택` — manual/direct selection variant (2)
- `국내주식권리_조회설정` — lookup/view settings screen (2)
- `국내주식권리_보유권리_상세` (+ `_스크롤영역`) — detail bottom sheet (3 named `_상세` + 1 `_스크롤영역` variant = 4 frames total)
- `국내주식권리_보유권리_없음` / `국내주식권리_예정권리_없음` — empty states
- `popup_유상청약 권리 확인` / `popup_매수청구 권리 확인` — navigation-confirmation popups
- `05_알림설정_계좌` — notification-settings screen (adjacent/reused flow)
- `popup_guide` (x2) — guide/help popups

**Not part of the feature** (ignore): several `카드`/`👍 thumbnail`/`01–07_플랫폼혁신부_업무명` frames near the bottom of the canvas are leftover cover-slide/template frames from the doc's own presentation wrapper — not screens. Confirmed via re-review: these are literally named `01_플랫폼혁신부_업무명` through `07_...` and sit far outside the feature's node-ID range.

**`corrected 2026-07-15`: frame count "42 top-level frames" → ~77.** The first pass undercounted by tallying only `frame`-typed nodes and missing loose text/vector annotation nodes plus `section` nodes that also sit at the top level of the page. A second independent recount landed on 76, one off from 77 — the discrepancy is a line-boundary artifact of parsing this file's non-strict `get_metadata` XML dump (see the read-only-session gotchas above), not a real disagreement about content. State it as **~77**, not a precise 42 or a false-precision 76/77.

### MASTER screens — 18 newly learned this pass (added 2026-07-15)

These bring MASTER coverage to 26/26 product frames (the prior pass's 8 `screens_studied` entries + these 18). Full node IDs are listed in the frontmatter `screens_studied` above.

- **테이블 ×4 = one screen's scroll-depth sequence, not 4 separate states** — this is the answer to "why does the note list 4 테이블 variants": `323:20860` is empty/just-toggled (zero content, confirmed) → `487:5796` is populated unscrolled (4 rows, 10 columns) → `473:4022` is mid-scroll (app chrome scrolled out of view, **sticky bold table header**, 13 rows, columns narrowed to 4) → `507:4886` (h=1623) is scrolled to the end of the list (the 알림 opt-in banner and bottom disclaimer reappear at the list's terminus, same as a normal card-view scroll-to-end). This directly matches the `473:4459` designer annotation "테이블 헤더 sticky 되게" (table header should stay sticky on scroll) — see Designer annotations table below.
- **조회설정 ×2 = a preset-vs-custom-range pair, not two unrelated screens**: `333:7386` has "6개월" selected as the period preset, and as a result the date-range fields are **disabled/grayed** (`Date_asset/disabled` component, showing 2022.06.22~2022.06.31 as a non-editable illustrative range); `333:10115` has "기간설정" (custom range) selected instead, and the date fields become **enabled** (`Date_asset/normal` component, 2024.06.22~2024.12.22). Both frames share `popup_silding_control_radio01` + `btn_bottom_page` structure with a 취소/조회 footer — this is the 조회설정 sheet's own two-button pair, distinct from the destructive-confirm pattern (see Takeaway #3 correction below).
- **예정권리 (2nd top-level tab, wholly new to this note)**: `333:2997` (h=1519) is the populated state — 3 cards, including an 에코프로비엠 매수청구 card and a 배당 card with 6 field rows. `333:10270` (h=1082) is a chrome-only blank frame, the same "just-toggled, no content yet" pattern seen in the 테이블 sequence. `333:3130` is the empty state — `nds_icon_info05_h30` icon + "조회 내역이 없습니다." text, an identical shell to the already-documented 보유권리_없음 empty state (same icon, same copy).
- **직접선택 ×2 = a clipped in-app bottom sheet vs. a full uncropped reference frame** — do not treat these as duplicates: `309:12863` (h=987) is the real in-app sheet — titled "권리 유형 선택" with an X close icon, a dim overlay behind it, 9 rows / 18 visible options, a scroll-fade mask at the bottom, and CTA "선택완료". `306:11610` (h=1617) has no dim overlay, no chrome, no scroll-fade mask, and shows all **18 rows / 36 options verbatim** — this is the designer's full-reference frame, the same "clipped view vs. full-superset reference" convention already seen once in this file for the detail sheet (see `[candidate-common]` note below). The full 36-option list, verbatim: 전체·배당·유상·무상·매수청구·신주인수권증서·뮤추얼·ETF분배금·선박펀드·투융자펀드·해외지원개발펀드·Ritz(부동산신탁)·ELS상환·DLS상환·ELW만기상환·기타청산·전환/상환·ETN분배금·흡수합병·회사분할·회사분할2~5·주식교환·자본감소·액면분할·액면병합·종목변경·후흡수합병·후회사분할·후주식교환·후자본감소·후액면분할·후액면병합·후종목변경·수익증권·말소.
- **Type-filtered lists**: `322:18728` 유상 (h=1715) shows an **inline full-width `btn_container_large` CTA "유상청약 권리 확인" built INSIDE the card** on actionable rows — this is the literal on-screen trigger for the nav-confirm popup already documented under "Popups" below; one card in this frame shows both 배정수량 and 배정금액 as "0", confirming the 기획안 2nd rule "배정수량 0인 권리도 바로가기 제공" (see 기획안 2nd section). `323:19590` 매수청구 (h=1828) shows a **new badge label "반대통보"** not previously recorded (the note only had 배당예정/확인완료/배당완료) plus its own inline "매수청구 권리 확인" CTA. `323:20165` 배당 (h=1991) confirms 배당완료/배당예정 as previously documented, with up to 4 field rows visible. `338:12388` (h=987) **omits the 합산조회 checkbox** and shows the tab bar pre-scrolled (x=-220) with 직접선택 already selected — it is the scrolled-tab-bar reference frame, not an actual additional type filter; whether the missing 합산조회 checkbox is deliberate for this state or just a stale copy of an older frame is unresolved (see Open gaps below). `487:5340` (h=2033) is a mixed-type feed, proving row count/field set is applied per-right-type within a single list, not per-screen.
- **`309:17357` 상세_스크롤영역 — a new structural pattern, refines the existing "one master field list" claim**: this frame is literally named `fixed` for its title + card-header zone (y=0–172) which stays pinned, above a **separately-scrolling** ~20-field body (`Frame 481821`, y=172+) inside a bottom sheet with its own scroll-fade `mask`. This **refines**, not contradicts, the note's existing claim that the detail sheet is "one master field list, hidden/shown per type" (see the ~20-field superset above) — it's ALSO a two-zone sticky-header layout, not a single flat scroll. Sample field values read verbatim off this frame: 기준일자 2023.12.31 / 잔고수량 123,456,123주 / 배정금액 123,456,789원 / 상장(입고)종목 A378340 / 유상감자단가 123,456원; among the hidden-by-default fields: 고배당기업여부 → "미대상", plus 5 co-positioned hidden fields (신청계좌·신청수량·입고계좌·거래구분·환불계좌·예상수수료).
- **`309:15860` 05_알림설정_계좌`** — confirmed to be a genuinely different, adjacent feature (입출금 알림 / 미수(추가증거금) 및 제권리 알림 / 선물옵션계좌 알림 / 로보어카운트 알림 toggle rows), present in this file only as an **instance**, not authored here. The note's existing characterization ("notification-settings screen, adjacent/reused flow") holds; this pass did not deep-learn it further, by design — it belongs to a different feature.
- `[candidate-common]` The "full-superset reference frame kept separate from the clipped in-app view" convention is now confirmed **twice within this file** — once for the detail sheet (20 fields, `309:16376`) and once for 직접선택 (18 in-app rows vs. 36-option full list, `306:11610`). This is within-file recurrence only, **not** a cross-project promotion — it still needs a 2nd independently-learned `asset` project before it could move to `../COMMON.md`'s Common patterns.

### Designer annotations (verbatim, added 2026-07-15)

| Node | Annotation (verbatim) |
|---|---|
| `322:18715` | "권리유형 text color 유상/매수청구/배당 : 강조색 2.023 나머지 : 일반색 4.024" |
| `338:12707` | "카드 view 항목 최대 6개, 더보기 팝업 없음" |
| `473:4459` | "테이블 헤더 sticky 되게" |
| `338:11331` | "상세 전체 데이터" (labels the full-data reference frame) |
| `338:12757` / `338:12758` / `338:12759` | Section labels: 조회설정 · 권리 상세 · 계좌 알림설정 |
| `338:12705` / `338:12709` / `338:12712` | Section labels: 카드 view · 보유 권리 · 예정 권리 |
| `338:12706` + `338:12708` | Section label 테이블 view (duplicate label on two nodes) |
| `338:12700` | Section label 직접선택 |
| `473:4455` | Section label 스크롤 시 |
| `473:4461` + `507:5119` | Section label 스크롤 영역 |
| `487:5684` / `487:5685` | Giant watermark labels "NM" / "QV" marking channel-variant clusters (e.g. QV = the legacy grid channel referenced in 기획안 2nd's AS-IS) |

7 of these 18 annotation nodes were grep-confirmed against the metadata dump only, not individually screenshotted — see the Text-node-name convention note above for the confidence caveat this implies.

### Prototype flow graph (added 2026-07-15 — the note previously had none)

9 real prototype edges found on MASTER (everything else under `364:10448`–`364:10973` named with a `-->` pattern, e.g. "Vector --> Rectangle", is a Figma boolean-op auto-name — a geometric artifact of vector operations, not a prototype connection; ~48 such nodes were excluded as a judgment call, flagged here rather than silently dropped):

| Source | Trigger | Destination |
|---|---|---|
| `338:12699` | tab_btn | 보유권리_직접선택 |
| `338:12717` | nds_icon_arrow | 보유권리_상세 |
| `338:12718` | filter | 조회설정 |
| `338:12721` | btn_container_regular | 05_알림설정_계좌 |
| `338:12722` | btn_container_regular | 05_알림설정_계좌 |
| `338:12723` | btn_container_regular | 05_알림설정_계좌 |
| `338:12725` | btn_container_regular | 05_알림설정_계좌 |
| `377:3831` | icon_view_h30 | 보유권리_테이블 |
| `377:3832` | tab_line_24pt | 예정권리_없음 |

Note the 4 separate `btn_container_regular` source points that all land on `05_알림설정_계좌` — which specific on-screen button each one maps to was not determined this pass (see Open gaps below).

## Screen anatomy (list screen — the flagship pattern)

Top → bottom, exactly this stack:

1. **Top chrome** (`Top` frame, always 3 stacked instances): `statusbar` → `header_basic` (back chevron + **title text that is itself a dropdown** — "국내주식 권리 ⌄" — clicking the title switches between related sub-domains, not just static text) → `tab_1depth_line` (underline-style 1-depth tabs: **보유 권리 | 예정 권리**, plain text + bottom underline on the active one, NOT a pill/segmented control).
2. **Account row** (`account_lookup`, single compact line, not a card): account number + **account-type tag + owner name** + a chevron to switch/expand accounts — literal observed string is **"201-02-123456 [종합매매] 김나무 ⌄"** (the `[종합매매]` account-type bracket-tag was missed in the first pass — always include it, don't render just the name). To the right: a green checkmark + one-line active-filter summary — literal observed strings are **"임시주총, 유형없음 제외"** (list screen) and **"임시주총, 유형없음, 배당미정 제외"** (empty-state screen) — **corrected 2026-07-15**: the first pass mistranscribed this as "임시투자" (temporary investment); the real term is **임시주총** (temporary shareholders' meeting) — surfaces which exclusion filters are currently applied, inline, without opening a settings screen. A designer annotation near the reference frame spells out the rule directly: *"권리유형: 임시주총, 공란은 화면에서 제외 처리. 체크 해제하면 전체 내용 제공"* (right-type 임시주총, and blanks, are excluded by default; unchecking the filter reveals everything) — this is a real spec note, not inferred behavior.
3. **Select control row** (`select_ctrl`): a "합산조회" (combined/aggregate view) checkbox+label on the left, and on the right a period filter chip (e.g. "6개월") + a **view-mode toggle** (`card_solid_card_on` / `card_solid_grid_off` — card view vs. table/grid view, exactly two icon buttons, one always active).
4. **Category tabs** (`tab_2depth_button`, horizontally scrollable, `tab_btn` instances): **`corrected 2026-07-15`** — was "7 tab_btn: 전체·유상·매수청구·배당·무상·(기타 types)", implying an open-ended tail. The designed tab set is fixed and closed: **전체 · 유상 · 매수청구 · 배당 · 무상 · ETF분배금**. Every other right type (of the file's full 37-type taxonomy — see 기획안 2nd below) routes through the 직접선택 popup instead of getting its own tab. Selected tab is bold black + underline; others gray.
5. **Notification opt-in banner** (`알림`, one persistent card, not dismissed by default): promotional single-line **"계좌에 권리가 발생하면 알림을 받을 수 있어요."** + inline **"알림 받기"** text-link CTA (verified verbatim against the file — exact match). Sits inline in the list content, not as a toast/popup.
6. **Card list** (`card`, repeating) — see Card anatomy below.
7. **Bottom-fixed disclaimer** (`유의사항_하단노출`): a single always-visible line — literal observed text (verified via screenshot, **corrected 2026-07-15** — the first pass paraphrased this): **"권리 정보는 변경될 수 있으니 감독원 공시를 확인하세요"** — sits directly above the bottom nav, in every screen of this feature (list, detail, empty). **This is not a popup you have to tap to see — it's permanently rendered.** My earlier voting-rights prototype only put this content behind an info-icon popup; the real pattern keeps a short version always visible AND offers the fuller version in a popup.
8. **Global bottom nav** (`quickmenu_basic`): 5 fixed icons — 전체메뉴(hamburger) · HOME · 관심그룹 · 주식현재가 · 국내주식주문 · 국내주식잔고/손익(active/highlighted). **Every real MTS screen in this app keeps this bar** — it is chrome owned by the app shell, not by this feature. Any prototype meant to "look real" needs this bar present and unchanged across all screens.

## Card anatomy (list row)

```
[CI logo, 50×50 circle]  회사명 (bold, 18-ish)              [status/arrow, top-right]
                          유형태그 | 유통 | 대여 (small gray, pipe-separated)
──────────────────────────────────────────── (divider line)
label                                                   value (right-aligned)
label                                                   value
[2-4 rows depending on right type — see below]
```

- Leading logo: circular CI image (`ss_img_ci_######` masked bitmap, or plain colored `logo_ci` ellipse fallback when no logo asset exists) — always 50×50, always circular.
- Title row: company name (bold) + a metadata line combining **right-type label** (배당/유상/매수청구/etc.) with **유통** and **대여** tags, each separated by a thin vertical `line` divider — this "tag chips separated by hairline dividers" pattern recurs across the file; it's the standard way to pack 2-3 short attribute labels next to a title without full chip/pill styling. A designer annotation on the reference frame documents the **text-color rule for this right-type label** (missed in the first pass, added 2026-07-15): *"권리유형 text color — 유상/매수청구/배당: 강조색 2.023, 나머지: 일반색 4.024"* — i.e. 유상·매수청구·배당 get the accent color token, every other right type gets the normal/default text color token. Apply this rule, don't just make every type label the same gray.
- Trailing slot (`status+arrow`) has **three real states, and the colored-badge state can itself carry a text label** (refined 2026-07-15 — the first pass described the badge as wordless, but the observed SK하이닉스 row shows a coral badge *with* the label "배당예정" plus a chevron together):
  - Plain chevron (`nds_icon_arrow`) — tap to view detail, nothing pending.
  - Colored highlight (a solid rounded-rect badge, coral/salmon in this file) — may be blank (visual-only "needs attention" flag) or carry a short label like **"배당예정"** alongside a chevron; distinct from NDS's usual green success semantic.
  - Text label instead of chevron, e.g. **"확인완료"** or **"배당완료"** — once the right has been fully processed, the row shows a done-state label and drops the chevron/actionability entirely (no dead-end tap).
- **Row count is per-right-type, not fixed, and the field names are `배정` not `배당`** (corrected 2026-07-15 — confirmed via both screenshot OCR and raw text-node names in the file; the first pass wrote "배당수량"/"배당금액" throughout, which do not exist as field labels in this file): dividend-type cards show 2 rows (지급일자/배정금액), rights-offering cards show 3 rows (상장(입고)일자/배정수량/배정금액), appraisal-rights cards show 2 rows (지급일자/배정금액). Build detail templates with the full possible field set and toggle visibility per right type — see Detail sheet below, same pattern.

## Detail = bottom sheet, not push navigation

**Critical interaction pattern**: tapping a card does **not** navigate to a new screen. It opens a **sliding bottom sheet** (`popup_silding_control_radio03`) over a dimmed version of the current list (list chrome — header/tabs — stays visible above the dim). This is a materially different pattern from the voting-rights prototype I built earlier (which pushed to a full new screen). For "권리" (rights) detail views specifically, NH's convention is the bottom sheet.

Sheet contents, top to bottom:
1. Title: "보유 권리 상세"
2. The same card header (logo + name + type tags) as the list row, repeated
3. Label/value rows, **built as one master list with most hidden by default** and only the relevant subset shown per right type. **Corrected 2026-07-15**: the first pass undercounted this at "~13 possible fields" — the actual reference frame (`309:16376`, literally named `popup_silding_basic_table04`, and annotated on-canvas by the designer as **"상세 전체 데이터"** = "detail full data") contains **~20 distinct fields**: 기준일자, 잔고수량, 상장(입고)일자, 배정수량, 지급일자, 배정금액, 신청수량, 신청금액, 신청종료일자, 상장(입고)종목, 예약시작일, 예약마감일, 반대마감일, 신청, 실현 여부 (**corrected 2026-07-15**: was "신청·실현 여부" with a middle-dot; the raw text-node name at `309:17506`/`309:17507` uses a comma, not a middle-dot — 신청, 실현 여부), 유상감자단가, 고배당기업여부, 신청계좌, 입고계좌, 거래구분, 환불계좌, 예상수수료. A dividend-type detail (`309:16045`) shows only the first 4 (기준일자/잔고수량/상장(입고)일자/상장(입고)종목); an appraisal-rights (매수청구) detail (`487:5686`) shows a different 9-field subset (기준일자/잔고수량/상장(입고)일자/상장(입고)종목/신청, 실현 여부/고배당기업여부/신청계좌/신청수량/입고계좌/거래구분/환불계좌/예상수수료). Always build the full ~20-field superset and toggle per right type — do not hand-author a smaller field list per type.
4. Inline caution line — **corrected 2026-07-15** (verbatim, differs from the bottom-fixed disclaimer's wording, not just a duplicate copy as the first pass assumed): **"※ 권리 정보는 변경될 수 있습니다. 금융감독원 공시를 통해 확인하시기 바랍니다."**
5. **Single full-width green CTA "확인"** (`btn_bottom_page`) — acknowledgment only, no cancel needed (this is a read-only detail view, not a destructive action).

## Popups: two distinct kinds — don't conflate them

1. **Navigation-confirmation popup** (`popup_layer_title+body`, seen for 유상청약/매수청구): triggered when tapping into a right-type that hands off to a *different* flow/screen. Shows a **title stating what will happen** (verified verbatim: **"유상청약 신청 화면으로 이동합니다."**) + one line of caveat/explanation (verified verbatim: **"신청 가능 기간이 아니라면 신청할 수 있는 수량이 보이지 않을 수 있습니다."**), and a **single button** ("확인") via `btn_bottom_layerpopup`. This is a heads-up, not a yes/no decision — proceeding is the only action offered.
2. **Basic layer popup** (`popup_layer_basic`, present but hidden/unused variant in these frames): body text only, no title — for shorter single-sentence notices.
3. Contrast with the **two-button destructive-confirm pattern** (취소/제출하기, `btn_bottom_page_assets` green + `btn_bottom_page_assets_gray`) used in the overseas voting-rights prototype — that pattern is reserved for irreversible actions requiring an explicit choice. A navigational heads-up before entering another flow does **not** get a cancel button in this design system; if the user doesn't want to proceed, they use the header back button instead.

## Empty state

Same full chrome (header, account row, select control, category tabs) stays mounted — only the card-list area is replaced with: centered `nds_icon_info05_h30` icon + "조회 내역이 없습니다." text. No separate empty-state screen layout; it's a content-area swap within the same screen shell. Confirmed via screenshot: the account row's exclusion-filter chip on this specific empty-state screen reads "임시주총, 유형없음, 배당미정 제외" — one more exclusion clause than the list screen's example ("임시주총, 유형없음 제외"), i.e. the chip text is dynamic/per-context, not a fixed string — build it as a composed summary, not a hardcoded label.

## New component/pattern names observed here (resolve keys via search_design_system when building; not yet in csdesign/nds's verified-key table)

`header_basic` (title-as-dropdown variant — and note: it instanced fine here, contradicting the "broken" finding logged against a specific file in `csdesign/nds`; the earlier break may be file/branch-specific — re-verify per file before assuming it's broken), `tab_1depth_line`, `tab_2depth_button` + `tab_btn`, `account_lookup`, `check_combine_txt`, `card_solid_card_on`/`card_solid_grid_off`, `알림` (notification opt-in banner), `유의사항_하단노출` (bottom-fixed disclaimer), `quickmenu_basic` (global bottom nav — 5 icons), `btn_bottom_page` (single full-width sheet CTA), `popup_silding_control_radio03` (sliding bottom-sheet container), `popup_layer_basic` / `popup_layer_title+body` (single-CTA info popups), `btn_bottom_layerpopup`, `nds_icon_arrow`, `nds_icon_info05_h30`, `label_basic`, `logo_ci` / `ss_img_ci_######`.

Also observed (added 2026-07-15): a table-view variant carries its own designer annotations near the reference frame — **"스크롤 시 테이블 헤더 sticky 되게"** (table header should stay sticky on scroll) and **"카드 view 항목 최대 6개, 더보기 팝업 없음"** (card view caps at 6 items, with no "더보기"/"show more" popup) — apply both as literal build rules for the table/card view toggle, not just visual mimicry.

**Added 2026-07-15, from the whole-file re-audit — verification level marked honestly, since none of these had a `componentKey` verifiable this session (read-only session blocks `importComponentSetByKeyAsync`):**
- Verified via screenshot **and** metadata: `card_solid_card_off` / `card_solid_grid_on` (the counterpart pair to the already-known `card_solid_card_on`/`card_solid_grid_off` on/off states), `Date_asset/disabled` + `Date_asset/normal` (조회설정's date-field enable/disable pair), `btn_container_large` (the in-card CTA seen on 유상/매수청구 type-filtered rows).
- Verified via metadata only (not individually screenshotted): `radio_btn_calendar`, `radio_btn`, table cell variants `Type=2Line` / `multi` / `sorting` / `2line`, `icon_view_h30` (not visually cross-checked against the `card_solid_*` pair despite the shared view-toggle role), `nds_icon_close`, `nds_icon_info05_h30`, `sectionbar`.
- **No `componentKey` was verifiable this session** for any of the above — do not treat these as key-checked against `../nds/CORE.md`; they're recorded here, in this project's own list, only.

## Takeaways to apply when building NEW NH MTS prototypes/screens

Items tagged `[candidate-common]` are strong candidates for promotion to `../COMMON.md`'s "Common patterns" section — per that file's promotion rule, they stay here until a **2nd `asset` project** independently confirms the same claim (this project alone isn't enough to call something an NH-wide pattern).

1. `[candidate-common]` Always include the app-shell chrome: `statusbar` + `header_basic` + (if the feature has 2 top-level sub-views) `tab_1depth_line`, AND the global `quickmenu_basic` bottom nav + the bottom-fixed one-line disclaimer. Omitting the bottom nav (as the overseas-voting prototype did) reads as an incomplete/non-native screen.
2. `[candidate-common]` Default the "view detail" interaction for a list row to a **bottom sheet**, not push navigation, unless the flow is a genuinely separate multi-step task (like the actual ballot-casting screen, which legitimately is its own page).
3. `[candidate-common]` Model card/detail fields as one **~20-field superset** (not ~13 — see correction above) with per-type visibility toggles rather than hand-building a different card per right type — matches how the real file is authored and makes future right-types trivial to add. Use the real field names (**배정수량/배정금액**, not 배당수량/배당금액).
4. `[candidate-common]` Use single-button layer popups for informational/navigational heads-ups. **`corrected 2026-07-15`**: was "reserve the two-button (취소/제출) pattern strictly for irreversible confirmations" — too narrow. `조회설정` (`333:7386`/`333:10115`) is a **non-destructive filter-apply sheet** and still uses a 취소/조회 two-button footer (`popup_silding_control_radio01` + `btn_bottom_page`). The real rule: two-button confirm covers irreversible actions **and** explicit setting/filter-apply confirmations — anywhere the user is committing to a choice that changes what they see or do next, not only anywhere data gets destroyed. Quote popup copy verbatim when it maps to a real flow (see exact strings above) rather than paraphrasing.
5. `[candidate-common]` Status/action state on a list row has 3 tiers (chevron = actionable / colored badge, optionally labeled = needs attention / text label = done) — richer than a plain "완료/미완료" chip, and the "needs attention" badge can carry its own short label text, not just color.
6. Apply the observed **text-color token rule** for right-type labels (유상/매수청구/배당 → accent color; everything else → normal color) rather than uniform gray. (Kept project-specific for now — this is a 권리-feature-specific rule, not obviously a general NH-wide convention; re-assess once a 2nd project's data exists.)
7. Treat filter-summary chips (e.g. the account row's exclusion text) as **dynamically composed strings**, not fixed labels — the exact clause list varies per screen/context. (Also project-specific for now, same reasoning as #6.)

## Applied to: 해외주식 의결권 투표 프로토타입 (2026-07-14)

Reviewed that earlier prototype (Figma `mxm5Ml7RfFH9bEXrhWdKRy` + HTML at `/Users/gwanli/product_2026/Right1/prototype/index.html`) against the takeaways above and retrofitted:

- Added the persistent bottom disclaimer + global `quickmenu_basic` bottom nav to the list/empty/complete screens.
- Added the disclaimer line (not the nav bar) to the ballot-detail screen — judgment call: a screen with its own sticky primary CTA (제출하기) replaces the global nav rather than stacking both; not directly evidenced in this project's frames (only the bottom-sheet detail was observed, which sits over list chrome that already has the nav), flagged as a deviation from a literal "add to all 5 screens" plan.
- Swapped the 2-state colored status chip (rust "미투표"/green "투표완료") for the chevron (pending) / plain text-label (done) pattern — no 3rd "needs attention" tier applied, since this domain has no equivalent urgent state.
- Left the header as a static title (no dropdown) and kept push-navigation + two-button confirm sheet + single-CTA info popups unchanged — already correct per the takeaways above.
- **Correction (same day):** the "국나" glyph-substitution artifact noted above was misdiagnosed — it was real clipping, not a font-rendering quirk. Root cause: the prototype's phone frames were built at 375px width (iPhone-point convention) while NDS components are natively sized for a 540px canvas (see `csdesign/nds` → "Canvas width: build at 540px, not 375px"). Fixed by resizing all 5 wrapper frames to 540px; clipping fully resolved.
- **Full interaction coverage (same day):** the user asked for *every* clickable behavior from the HTML prototype (info popups, language toggle, "already voted" state) to exist as real Figma prototype connections, not just the main navigate-through flow. Built 3 new popup frames (cloned from the confirm-sheet frame, then stripped to single-CTA — reusing NDS's single-CTA layer-popup pattern from the Takeaways above) and 1 cloned+translated detail-screen variant, then wired 15 `setReactionsAsync` connections total: both info icons + all 4 persistent disclaimer bars → 유의사항 팝업; AI번역 pill → cloned Korean-text detail screen; that screen's 원문보기 pill → back to the English original; its "자세히" link → AI번역 유의사항 팝업; the already-voted stock card → "이미 투표 참여" dialog (instead of the ballot detail); all 3 popup CTAs → `BACK` action.
  - API limitation hit: `frame.overlayPositionType`/`overlayBackground`/`overlayBackgroundInteraction` are genuinely read-only via the Plugin API (confirmed by testing — throws `TypeError: ...read-only property`), so these popups are wired as full-screen `NAVIGATE` connections, not true floating `OVERLAY`s. They'll still show as connector arrows and work when clicked through in Figma's Present mode, they just replace the screen instead of floating over it. To get real overlay behavior, a human has to set that in the Figma UI (Prototype panel) — the API cannot do it.
  - Also: `get_screenshot` renders canvas content only — it does NOT show the blue prototype connector arrows themselves (those are editor UI chrome). Confirming the arrows requires opening the file directly in Figma.
- **Static flow-diagram overlay, take 2 (same day):** the user asked to also make the click flow visible as literal arrows drawn on the canvas (since native prototype connector lines are invisible outside Figma's own Prototype tab). First attempt used diagonal 2-3-point lines fanning into shared destinations (e.g. 4 sources → 유의사항 팝업) and was correctly called out as messy/unlike how a real NH file would present a flow. Fixed by: (1) repositioning frames into a strict grid — main flow left-to-right in row 1, each secondary screen (popup/AI-toggle variant) directly below its trigger frame in row 2/3, unrelated demo states (empty-state) moved off to the side entirely; (2) redrawing every arrow as **pure horizontal or pure vertical only** (`figma.createVector` with a `VectorNetwork`, `strokeCap: 'ARROW_EQUILATERAL'` on the end vertex) — the one unavoidable long-distance connection (완료 → 목록, a return path) uses a 4-point orthogonal (right-angle only) route via a side channel, never a diagonal; (3) for a popup fed by multiple screens, drew **one representative arrow** (from the geometrically cleanest source) plus a one-line label noting the other screens connect identically, instead of fanning every source in — much closer to how production flow annotations actually read.
  - Tooling note: `get_screenshot` cannot produce one combined overview image of a multi-frame canvas layout — it always clips to the target node's own bounding box (tested: an empty marquee frame and an empty `figma.createSection()` around everything both render blank, and `contentsOnly: false` only affects overlap *within* a node's own box, not content extending beyond it). Verify a hand-drawn flow diagram by screenshotting individual arrow/label node IDs, not by trying to screenshot a wrapper around the whole page.
- **Redundant header icon removed (2026-07-15):** the top-right `nds_icon_header_tooltip` info icon duplicated the bottom disclaimer's own info+더보기 pattern (a guideline violation) — deleted the instance from all 4 frames that had it (list `2:2061`, detail `4:72`, detail/AI번역 `18:211`, empty-list `4:23`); left-side back-button icons untouched; complete screen never had it. Mirrored the same removal in the HTML prototype (list + detail headers). Updated the stale flow-diagram label `27:260` from "ⓘ / 더보기 탭" to "더보기 탭" to match.
- **Missing entry point added (2026-07-15):** the prototype and Figma file jumped straight into the list screen with no real "권리" (Rights) hub screen — the breadcrumb text referenced 권리 > 관리 but no actual screen existed above the list. Built a new `00_해외주식 의결권 투표 - 권리(진입)` frame (Figma `32:229`, placed left of the list frame in the row-1 grid at x=-460) by cloning the list frame's chrome (`nds_icon_header` back button, `유의사항_하단노출`, `quickmenu_basic`) and replacing the body with two sections ("권리" / "관리") of row items — 국내주식 권리, 해외주식 권리, 반대통보·매수청구, 채권 권리행사, 환매청구권행사, 해외주식 배당옵션 약정, 기타대여금 자동환전, and 해외주식 의결권 투표 (the real entry row, bold + jade-colored, wired via `setReactionsAsync` NAVIGATE to the list frame `2:2052`). Added a horizontal flow-diagram arrow + "해외주식 의결권 투표 탭" label per the established pure-horizontal/vertical annotation convention. Mirrored in HTML: new `#screen-rights` section is now the default-active screen; the list screen's header back button (previously an inert spacer) now points to it via `goTo('screen-rights')`.
