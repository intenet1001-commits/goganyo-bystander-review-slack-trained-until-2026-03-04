# Source forensics: 국내주식 권리 (`ZkwarjFkN8BiGolWO7PcwI`)

> **Relocated 2026-07-15, verbatim.** This was part of `projects/domestic-stock-rights.md` until that note hit
> 62KB — 40% of a BUILD pass's entire read, when only the anatomy sections were load-bearing. **Nothing deleted.**
> **BUILD does not read this file.** It is LEARN/VERIFY forensics: how the file was enumerated, what the design
> review said, what the planning decks argued, and which pages were ruled out.
> Build-facing reference: `../projects/domestic-stock-rights.md`.

## Read-only session gotchas (added 2026-07-15)

These are process/tooling notes, not design facts — recorded so a future VERIFY pass doesn't waste time rediscovering them:

- **`figma.root.children[i].children.length` is unreliable for non-current pages.** Figma lazy-loads a page's node tree; only the page that happens to be the *currently open* page in the editor reports a real child count via this API. In this session, 5 of the file's 6 pages falsely reported `children.length` of `0` or `2` — only `⭐MASTER⭐ 국내주식 권리` (`262:9472`, the current page at session start) reported truthfully (77). **Always confirm a page's real size with `get_metadata(nodeId)` on the page node itself**, never trust `p.children.length` from a root listing for a page you haven't opened.
- **`setCurrentPageAsync` is blocked in a read-only session** — there is no way to "open" a different page to make its `children.length` report correctly. `get_metadata(nodeId)` is the only reliable path to a non-current page's structure.
- **`get_metadata` on this file returns non-strict XML.** At least one designer annotation node contains an unescaped `&` in its text, which breaks a naive `ET.parse`/`xml.etree` pass. Use a tolerant/line-based parser (indentation-driven), not a strict XML parser, when scripting over the dump.
- **Large `get_metadata` responses (166–393KB seen here) auto-save to a file** rather than returning inline — read the saved file with a real parser/script in one pass; don't loop narrower `get_metadata` calls to work around the size, that reintroduces the lazy-load unreliability above.

## Text-node-name convention on THIS file (added 2026-07-15)

**On this specific file, a TEXT node's `name` attribute equals its displayed on-canvas copy — reliably, with 10/10 screenshot spot-checks confirming zero mismatches.** This holds for both designer annotation nodes and real content nodes (e.g. `338:12280`, named "삼성전자", renders "삼성전자" on screen). This is a **documented exception** to the general rule in `figma-learn-all-pages` ("layer names lie, don't trust them for content") — it does not generalize to other files, only recorded here because it was directly verified on this one. **Caveat**: 7 of the 18 annotation nodes cited in this note were only grep-confirmed against the metadata dump, not individually screenshotted — treat those 7 as slightly lower-confidence than the 10 that were both grep- and screenshot-checked.

## Page coverage

Two denominators are tracked, deliberately kept separate — collapsing them into one "N/N done" number is the exact failure this audit was built to avoid:
- **Pages**: `6/6` (method: `figma.root.children` on the file root — see the lazy-load gotcha above for why raw child counts from that call could not be trusted and `get_metadata` per page was used instead).
- **MASTER product frames**: `26/26` (method: `get_metadata('262:9472')`, filtered to the file's own screen/popup frames — excludes the 11 unrelated cover/template frames noted below under "Not part of the feature").

| Page (node) | Real size (via `get_metadata`, not `figma.root.children`) | Role | Coverage this pass |
|---|---|---|---|
| `⭐MASTER⭐ 국내주식 권리` (`262:9472`) | 77 direct children (only page whose `figma.root.children` count was truthful — it was the current page) | Production screen canvas | 26/26 product frames — see **MASTER screens** section below |
| `ㄴ 🚧 디자인검수 🚧` (`473:4462`) | design-review fixes | Post-ship QA notes | 10/10 numbered fixes read, verbatim-matched — see **디자인검수** section |
| `기획안 2nd` (`222:4804`) | AS-IS + to-be rationale | Planning/spec doc | Fully read — see **기획안 2nd** section |
| `기획안 수정전` (`0:1`) | 11 direct children, contains its own to-be | Earlier/parallel planning doc | Fully read — see **기획안 수정전** section |
| `Page 2` (`16:1704`) | 283 direct children, scratch canvas | Draft/scratch, dummy data | Fully read — see **Page 2** section |
| `슬랙공유용` (`457:12899`) | 9 deck frames, 2880×1620 | Presentation deck (out of scope) | Read for the one deck slide that carries unique spec content — see **슬랙공유용** section |

## 디자인검수 (`ㄴ 🚧 디자인검수 🚧`, `473:4462`) — added 2026-07-15

Post-ship QA notes page: 10 numbered fixes, all verbatim-matched against the annotation text, none drifted from what's recorded here.

1. "탭 활성화 언더바 컬러 확인 카드 내 우측 데이터 폰트 Roboto로 변경" → targets 예정권리_전체.
2. "테이블 행 높이값 디자인보다 높게 노출되어서 시각적 조정이 필요합니다. 테이블헤더 높이값 -6px 줄여주세요. 행 높이값 -12px 줄여주세요. (텍스트 패딩값을 줄여도 될 것 같습니다.)" → targets 보유권리_테이블 (screenshot-verified against the reviewer's own device evidence, see Images below).
3. "높이 늘어남 현상 박스 상단 마진 -4 구분선 아래 마진 -4 항목 사이 마진 -2 박스 하단 마진 -4" → card list-row.
4. "높이 늘어남 현상 박스 상하단 마진 -4 박스와 항목 사이 마진 -4 항목 사이 마진 -2 유의사항과 메인버튼 사이 마진 -8" → `popup_silding_control_radio03` "매도예상금액 조회".
5. "QV 탭 BG 화이트로 적용 유의사항 박스 상단 라인 제거" → targets 보유권리_테이블; the QV tab sat outside the frame's screenshot crop this pass, so this instruction is unconfirmed.
6. "뷰 선택 아이콘 이미지처리로 비율고정으로 부탁드립니다." → view-toggle icon.
7. "활성화 탭 Stroke 제거" → active tab.
8. "주식교환/일반 <- 항목과 divider 사이 마진 -4px 줄여주세요."
9. "보유권리탭 카드 상하 마진 줄인것 예정권리 카드형에서도 적용 부탁드립니다. Roboto로 변경"
10. "상단 마진 영역 없이 스크롤 되게 적용 부탁드려요. 하단 마진 40 위에 그라데이션 이미지 적용 부탁드려요." → targets 보유권리_직접선택.

**Images:** `476:4464` (`image 1`) is a **real-device screenshot** (SKT status bar, 10:39, 5G, 94% battery) of the table view with a magenta markup overlay drawn over the header and grid lines — this is the reviewer's own evidence for fix #2. `476:4466` (`image 2`) is the same shot without the markup (visible rows: DL건설/한샘/동화기업/링네트/SNT에너지/SGA/삼성머스트스팩5호). No fix instruction lives only inside the images — every rule above is also stated as text.

**Resolution status — qualified, not a flat "shipped" (write this carefully, per the file's own name `반영완료⭐️`):**

| # | Status | Basis |
|---|---|---|
| 10 | **Applied — confirmed** | Strongest signal in the set: a screenshot of the current MASTER 직접선택 frame shows the gradient present, AND a separate designer note `598:7282` reads "nds_img_popup_gradation01 이미지 들어가 있음" — past tense, i.e. it IS in place now. |
| 1, 9 | **Likely still open — flag, don't assert either way** | Both independently demand Roboto for "카드 내 우측 데이터" — two separate annotations converging on the same font fix is itself a signal it mattered enough to call out twice. Worth a follow-up check of whether MASTER's card font is actually Roboto; not confirmed this pass. |
| 2, 3, 4, 8 | **Unverifiable — read-only session, no measurement** | These are pure pixel deltas (-4px, -6px, -12px, etc.) relative to a baseline the reviewer measured on their own physical device. `get_metadata` only returns static authored bounding boxes, not rendered runtime spacing, and the read-only session blocks Figma's Inspect panel. Do not assert applied or unapplied — record as unverifiable. |
| 5, 6, 7 | **Unchecked, not applied** | Mechanically checkable (QV tab visibility, icon aspect-ratio lock, tab stroke) but not actually screenshotted this pass — #5's QV tab sat outside the 540px crop, #6/#7 were never screenshotted at all. Record as unchecked, distinct from "unverifiable" (2/3/4/8) which can never be checked without device access, and distinct from "applied" (10).

**Verdict**: keep `status: shipped` in the frontmatter (the file is literally named 반영완료⭐️), but treat it as **qualified shipped** — per-instruction applied/unverifiable/unchecked, not a blanket claim. Where a 검수 instruction and a current MASTER frame appear to disagree, **the 검수 note is the later authority** (it post-dates the original screen).

## 기획안 2nd (`222:4804`) — the rationale layer, added 2026-07-15

Everything in this section is new to the note — the prior passes never read this page.

**AS-IS problem statement, verbatim** (from deck frame `222:4829` — this is the *sole* place this exact sentence is written, so the deck-frames-out-of-scope rule has a documented exception here): *"as-is : 업무QV F2501, F2502 화면의 내용 그대로 MTS에 그리드 형식으로 보여주고 있어 권리 내용을 확인하기 어려운 UI로 가독성이 떨어지고 활용도가 낮은 상태임"*. The legacy screen was called 권리 현황, with tabs 권리 보유현황 / 권리 예정현황, a dense spreadsheet grid, empty-state copy "예정된 권리가 없습니다.", reached via 자산뱅킹>청약/권리>권리>권리현황.

**IA renames** (legacy → current): 권리 현황 → **국내주식 권리** (해외주식 has its own separate screen, not folded in); 권리 보유현황 → **보유 권리**; 권리 예정현황 → **예정 권리**. The navigation path itself is unchanged.

**37-type taxonomy, verbatim** (`223:11172`): 01 배당 · 02 유상 · 03 무상 · 04 매수청구 · 05 신주인수권증서 · 06 뮤추얼 · 07 ETF분배금 · 08 선박펀드 · 09 투융자펀드 · 10 해외자원개발펀드 · 11 Ritz(부동산신탁) · 12 ELS상환 · 13 DLS상환 · 14 ELW만기상환 · 15 기타청산 · 16 전환/상환 · 17 ETN분배금 · 21 흡수합병 · 22 회사분할 · A2~A5 회사분할2~5 · 23 주식교환 · 24 자본감소 · 25 액면분할 · 26 액면병합 · 27 종목변경 · 31 후흡수합병 · 32 후회사분할 · 33 후주식교환 · 34 후자본감소 · 35 후액면분할 · 36 후액면병합 · 37 후종목변경 · 48 수익증권 · 4B 말소. Plus `223:11173`, verbatim: *"F-2501 권리구분 -37개, 전체 포함 38개 -제일 긴명칭 해외자원개발펀드 Ritz(부동산신탁)"*. This 37-type count is independently cross-confirmed by the 슬랙공유용 deck (see below).

**Tab/직접선택 rule** (`223:10944`, verbatim): *"권리유형은 전체를 기본으로 제공하되, 탭으로 가장 많이 조회하는 유상, 매수청구, 배당, 무상, ETF분배금 를 제공하고 그외 권리는 직접선택 버튼을 통해 팝업으로 선택 가능한 유형 제공 처리 -전체 권리는 37개 유형임"* — this is the source spec for the tab-set correction above (5 named tabs + 전체, everything else via 직접선택). `223:11169`, verbatim: *"선택은 1가지만 가능"* (직접선택 is single-select, not multi-select).

**Badge rules** (`223:10929`, verbatim): *"뱃지 순서 : 권리유형, 유통구분, 대차담보구분 권리유형은 필수, 배당/유상/매수청구만 강조색, 나머지 권리유형은 일반색 유통구분은 : 유통만 표시, 일반은 표시하지 않음, 일반일 경우 공란 처리, 공란일 경우 다음 뱃지 댕겨서 보여주기 대차담보구분 : 값있을 때만 표시, 없을 땐 공란"*.

**Status label / CTA visibility rules** (`223:10940`, `223:10942`, `229:15109`–`229:15111`):
- 배당: 지급일자 ≤ today ⇒ "배당완료"; 지급일자 > today ⇒ "배당예정".
- 매수청구: 반대통보마감일 present AND 매수청구마감일 absent ⇒ "반대통보" (this is the source spec for the badge seen on `323:19590` above).
- 유상: the CTA only appears while 청약예약일 ≤ today ≤ 청약종료일 ("유상청약 신청기간 중에만 바로가기 버튼 제공"); "배정수량 0인 권리도 바로가기 제공" (0-quantity rows still get the CTA — confirmed on-screen at `322:18728` above); after the application window closes, the button disappears, 신청종료일 is dropped from the field set, and 상장(입고)일자 is added instead.

**Card field branch logic**: the `card_accordion_center` component's variants are literally named by branch — 권리유형이 배당/유상/매수청구/그외일 경우. 배당 has 4 branches keyed on 지급일자×상장(입고)일자 presence; 유상 has 3 date-window branches (destination path: 자산뱅킹>청약/권리>청약>유상청약>유상청약(예약)신청); 매수청구 has 4 branches (destination path: 자산뱅킹>청약/권리>권리>반대통보/매수청구>반대통보 신청/취소); 그외 has 5 branches.

**Filter defaults** (all verbatim): `223:10946` "임시주총,유형없음 제외를 디폴트 제공"; `223:10947` "조회기간은 현재와 동일하게 6개월전~오늘 디폴트로 제공"; `223:10948` "카드형 기본 제공 ,그리드형은 선택 가능"; `223:10943` "권리 유형에 따라 노출 분기, 최소 2개 최대 4개, 노출기준은 기획서 참고".

**Notification banner and its routing**: the "계좌에 권리가 발생하면 알림을 받을 수 있어요." banner appears ×8 across this page's frames (already documented in Screen anatomy above). New this pass: a sticky note (`222:6664`, author 강현아) reads *"[업무참고] 통합알림 > 알림설정 > 계좌 알림설정으로 이동"* — this is the banner's actual routing target, previously undocumented (it goes to 통합알림 > 알림설정 > 계좌 알림설정, not directly to `05_알림설정_계좌`).

**Decks**: 11 deck frames on this page, out of scope per the deck rule — one line, no further breakdown. Note: within deck frame `222:4829`, numbered items 3–10 (`222:4854`–`222:4901`) are `hidden="true"` placeholder nodes containing the literal text "내용" — this is blank-at-source, not a read failure on this pass.

## 기획안 수정전 (`0:1`) — VERDICT: not-superseded, added 2026-07-15

**11 direct children** (not 20 — an earlier working assumption in this session's brief was wrong; corrected against the actual `get_metadata` read). This page contains its **own** to-be section (`1:3163`, 5197×6039) — which directly contradicts the premise that only 기획안 2nd carries a to-be. The deck cover is stamped **"2024.06.24 V0.1"**.

Its to-be section holds real wireframes plus the **same** rename spec found in 기획안 2nd (국내주식권리 ← 권리현황; 보유 권리 ← 권리 보유현황; 예정 권리 ← 권리 예정현황), a full 보유 권리 flow (5+ frames: a 신주인수증서 branch, a 유상청약 handoff, a 반대통보/매수청구 handoff, popup/toast states), and a separate 예정 권리 flow (3 frames). Also unique to this page: `1:5807`, a "👍 thumbnail" node carrying a 기획/디자인/개발 progress indicator.

**AS-IS fingerprints differ between the two planning pages — record both, do not merge them into one description:**
- `0:1`'s AS-IS: 11 children — 2 mobile screenshots (1080×2400), 6 desktop table screenshots, the text "ETF도 권리가 있어요!", a `05_알림설정_계좌` instance, and "최신순".
- `222:4805`'s AS-IS (기획안 2nd): 13 children, flat structure — 8 screenshots, 2 `IMG_378x`-style images, the same 2 text nodes, the same `05_알림설정_계좌` instance.
- Both AS-IS sections share the same overall canvas size (4167×9931) and a similar-but-not-identical composition — close enough to be the same source material handled twice, not close enough to call byte-identical.

**Open question, recorded rather than guessed at**: whether `0:1`'s to-be is an earlier draft of `222:4804`'s to-be, or a genuinely divergent parallel proposal, was **not determined** this pass — it would need a direct wireframe-by-wireframe diff. Do not infer "superseded" just because the page is named 기획안 수정전 ("plan, before revision") — the page's *content* argues the opposite (it has its own complete to-be, not a stub).

## Page 2 (`16:1704`) — VERDICT: scratch/working canvas, added 2026-07-15

**283 direct children** (not 394 — another corrected working-assumption from this session's brief). The page sprawls x −6202→18290, y −340→11003 across roughly 27 spatial clusters. Node-type breakdown: frame=110, text=74, vector=56, instance=41, section=1, symbol=1. Of the 110 frames, only 7 are full-height, 540-wide screen frames that resemble real product screens.

**Why this page is scratch, not authoritative**: every one of those 7 screen frames uses **dummy placeholder data** — every company-name row reads "카카오", every amount reads the same repeated `123,456,789` — versus MASTER's varied real sample data (삼성전자, SK하이닉스, 에코프로비엠, DL건설, etc.). This reads as a draft that predates or ran alongside MASTER's authoring of the same feature. **Do not learn this page's screens further** as if they were additional product frames — they're development scratch work, already superseded in intent by MASTER.

**Unresolved designer questions still sitting on the canvas** (not answered anywhere else in the file — worth a future targeted VERIFY if these exact field-priority rules are ever needed for real): "0주 배정의 경우 일단 보여주기?" · "배정수량 0일 경우?? 신청버튼 제외?? 표시???" · "입고일자와 입금일자가 다를경우??? 보통은 같음 지급일자 기준으로 보여주기" · "반대통보 했는지는 판단 안함. 권리 유무만 판단". (Note: the 기획안 2nd rule "배정수량 0인 권리도 바로가기 제공" reads like the resolved answer to the second question here — but that wasn't cross-confirmed as the direct resolution, just a plausible connection.)

**Stray frame flagged, not adopted**: `222:4568` (540×745), titled "조회 설정", is a popup with 적합펀드만/전체펀드 toggles, a 국가 selector (국내·글로벌·미국·중국·유럽), and an 알림종류 selector (알림톡·PUSH·SMS) — this is **unrelated to 국내주식 권리** entirely (it looks like a funds/global-investment feature). It's a single isolated frame on this scratch page, likely pasted in from another project's file. Flagged for awareness; does not warrant spawning a sibling `asset` project entry.

## 슬랙공유용 (`457:12899`) — decks only, out of scope, added 2026-07-15

**9 deck frames** (not 18 — a third corrected working-assumption), all 2880×1620. Cover slide: "국내주식 권리(권리 현황) UI 개선", 플랫폼UX부, dated **2024.07.19, V0.3**.

**One deck slide is the sole carrier of unique spec content**, so per the deck-exception rule it gets recorded in full rather than a one-line dismissal. Verbatim, from the `457:13088` area: *"보유 권리 화면에서 제공할 권리는 총 37개 입니다. 배당, 유상증자, 무상증자, 매수청구 등과 같이 익숙한 권리도 있지만 그렇지 않은 권리도 있습니다. 도출 빈도가 낮다고 해서 소홀할 수 없으므로 모두 표시하기로 했습니다. 화면의 이동 없이 권리 행사까지 종료하면 이상적일 수도 있겠지만 발생한 권리를 조회하는 화면으로서의 기능을 유지하는 대신 권리 행사 가능 기간에 대한 안내와 강조 기능을 추가하였습니다. 보유 권리 화면에서 조회되는 정보의 원천은 한국예탁결제원에서 제공됩니다. 감독원에 권리가 공시된 후 권리 내역이 생성되기 때문…"*.

This slide does two things the rest of the file doesn't: it **independently cross-confirms the 37-type count** already found in 기획안 2nd (two separate planning artifacts, same number — good corroboration), and it names the **data source** (한국예탁결제원 = Korea Securities Depository) plus states the **deliberate scope decision**: this is a *lookup* screen for rights that already exist, not an *exercise* screen that completes the right's action inline — the design compensates for that scope limit with explicit period guidance/emphasis instead.

## Version timeline (assembled from stamps found across the file, added 2026-07-15)

`기획안 수정전` deck cover: **2024.06.24, V0.1** → `슬랙공유용` deck cover: **2024.07.19, V0.3**. Roughly a month between the earliest recorded planning draft and the V0.3 share-out; no V0.2 artifact was found in this file. This dates the planning sequence but does not by itself resolve the open question above (whether `0:1`'s to-be is a draft of `222:4804`'s).
