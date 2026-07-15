---
name: nds-mweb-archive
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=1291-793"
learned_date: 2026-07-15
sections_studied:
  - "1291:793 (page '    - Archive' — canvas root, 9 top-level frames/sections spanning x=0 to x~11,416)"
  - "1291:794 (frame 'Typo_styleguide' — on-canvas heading 'M.web Typography' / 'QV-NM Typography Scale & Hierarchy')"
  - "1291:1111 (frame '[NM] Screens' — a single mobile-frame mockup, 360x658, showing header/amount rows/bottom CTA/quickmenu)"
  - "1291:1127 (section 'FONT USAGE' — on-canvas heading '문자' / 'Pretendard - 기본', size/line-height table)"
  - "1589:964 (frame '3. Trading' — on-canvas heading 'Trading icon' / 'QV-NM Icon', subheading '주식 거래, 차트, 현재가, 등락률')"
  - "1589:979 (frame '4.flag' — on-canvas heading 'Flag icon' / 'QV-NM Icon', subheading '국기, 해외, 국가코드')"
  - "1589:988 (frame '1. Icon' — on-canvas heading 'Icon' / 'QV-NM Icon', body 'NDS_ICON 프로덕트 앱에 사용할 아이콘 입니다.')"
  - "1589:1306 (frame '2. Specific Icon' — on-canvas heading 'Specific Icon' / 'QV-NM Icon', body 'NDS_ICON_SPECIFIC 사용 위치가 명확한 NDS 아이콘 입니다.')"
  - "1730:1810 (frame 'Container BTN' — 'Basic' and 'Stock' button-state swatch grids, on-canvas labels '버튼명' / '매수' / '매도')"
status: "unknown — no deprecation marker found at source"
---

# NDS M.web — "- Archive" page

**Read the verdict first: this page's live/deprecated status could NOT be determined from on-canvas evidence.** No dated stamps, no `구버전`/`이전`/`미사용`/`deprecated`/`old`/`백업`/`폐기`/`중단` text, no strikethrough, no greyed-out/low-opacity overlays, and no `→ 이동` pointer to a replacement page were found anywhere on the page — either via a full-text search of the page's saved metadata dump or via screenshots of every top-level frame. Per the method's rule, the page name "Archive" is a hint, not evidence, and is explicitly **not** being used to infer deprecation.

That said, the content itself reads as clean, current, professionally-maintained reference material (typography scale, full icon inventories, flag set, trading-state icons, button-state swatches) — visually indistinguishable from the actively-maintained pages already learned in `nds-mweb-colors.md` (same `QV-NM` channel-labeling convention, same visual polish, no half-finished or crossed-out content). **This is circumstantial, not proof of "live"** — there is no explicit "current"/"active" stamp either, so the honest call per the method's rules is `unknown`, not a guessed `live`.

**Do not mine this page for BUILD-pass rules until the status is resolved.** Treat every fact below as inventory, not as sanctioned specification, until a future VERIFY pass either finds explicit currency evidence (e.g. cross-reference from a still-open build task, a "Last update" stamp newer than a competing page) or finds a deprecation marker that this pass missed (e.g. inside a hidden frame — none were detected as hidden in the metadata dump, but a re-check should confirm).

## What's actually on the page (inventory only)

Nine top-level frames/sections under canvas `1291:793`, in on-canvas reading order (left-to-right by x-coordinate):

1. **`Typo_styleguide` (`1291:794`)** — "M.web Typography" / "QV-NM Typography Scale & Hierarchy". A large table crossing two typefaces (**Pretendard**, **Roboto**) × six scale steps (**L, P1, P2, H, Title, Body, Notice, info, Label**) with columns App Size / M.Web Size / Line Height / Usage examples at 1, 2, and pseudo-3/4-line lengths. Sample copy is literally the placeholder text `"1줄 일때 이런느낌"` / `"2줄 일때 이런느낌 2줄 일때 이런느낌"` (Pretendard rows) and `"Keep it simple"` / `"Keep it simple: Clutter clouds clarity."` (Roboto rows) — these are lorem-ipsum-style fillers, not real UI copy, and should not be quoted as product strings.
2. **`[NM] Screens` (`1291:1111`)** — a single 360×658 mobile mockup frame: header "화면 타이틀명", large amount display "100주 / 1,000,000원", a list of paired values ("100원", "1,246원", "3,245,273원", "1,235,125원" ×2 columns), a green bottom CTA labeled "버튼명", and a 5-icon bottom nav row (홈/관심그룹/주식 현재가/국내주식 주문/국내주식 잔고·손익) matching the `quickmenu_basic` component already documented in the domain Core reference.
3. **`FONT USAGE` section (`1291:1127`)** — "문자" / "Pretendard - 기본" / "Bold / Semibold / Medium / Regular", with an explicit size↔line-height pairing table: 30/38, 26/36, 24/34, 21/30, 18/24, 15/18 (px).
4. **`3. Trading` (`1589:964`)** — "Trading icon" / "QV-NM Icon", subheading "주식 거래, 차트, 현재가, 등락률". Named layers verbatim: `ndsw_icon_rateup_red`, `ndsw_icon_ratedown_blue`, `ndsw_icon_rateup_gray`, `ndsw_icon_ratedown_gray`, `ndsw_icon_rateflat_green`, plus a second variant family `ndsw_icon_rateup/upper_white01`, `ndsw_icon_ratedown/lower_white01`, `.../upper_white02`, `.../lower_white02`, `.../upper_red01`, `.../lower_blue01`. Sample rate chips shown: `14.89 (30.62%)` (red/up), `14.89 (30.62%)` (blue/down), `14.89 (30.62%)` (green/flat), plus colored pill chips `0.34%` / `-30.84%` / `0.00%`. This corroborates the red=상승/blue=하락/green=보합 convention already recorded in `nds-ux-guide-updown-notation` and `nds-mweb-colors`.
5. **`4.flag` (`1589:979`)** — "Flag icon" / "QV-NM Icon", subheading "국기, 해외, 국가코드", layer-name pattern `ndsw_flag_circle/square_(국가코드)`. Two full rows of the same ~27 country flags rendered as circle badges and square badges (Australia, Brazil, Canada, Switzerland, China, Denmark, EU, France, UK, Germany, Hong Kong, Indonesia, India, Japan, Korea, Mexico, Norway, New Zealand, Russia, Sweden, Singapore, Thailand, Taiwan, USA, Vietnam, South Africa, Netherlands, plus a globe icon).
6. **`1. Icon` (`1589:988`)** — "Icon" / "QV-NM Icon", body copy "NDS_ICON 프로덕트 앱에 사용할 아이콘 입니다." A large general icon inventory grouped by function (찾기·검색, 편집·수정, 달력·캘린더·기간, 지우기·제거, 전환·맞바꿈, 다운로드·내려받기, 공유·올리기·업로드, 새로고침·다시 불러오기, 링크·복사, 상담·고객센터·전화, 필터·조건검색, 더보기·상세메뉴·계반·미트볼, 복사·카피, PDF, 음성인식·마이크, 설정·셋팅, 툴팁, 빼기, 더하기, 느낌표·안내·경고, 만세·유의사항, 자물쇠, 필수·필수확인사항, 추가, 정렬·스와이프·로글, 계산기, 통장, 닫기·X, 알림아이콘), then a **`Multi Status`** subsection (장바구니·비교함, 보기방식(카드/테이블/차트)) and a **`FAB`** subsection (플로팅 액션 버튼, 플로팅 볼릿), then **`표, 테이블`** (정렬·오정, 더보기·항목변경, 확대·축소, 잔고형·지갑, 관심종목 등록, 관심종목 보기), **`불릿, 아이콘불릿`** (스탬·단계, 통합알림, 마이데이터, 내용없음·중요없음, ETF 2배수·2배수), and **`Ci, Bi, 로고, 앱아이콘`** (나무 앱아이콘, BI·로고, BI·로고 이미지, 농협 CI·로고, 기관로고, CI·로고 with visible `N2,` wordmarks, one shown at reduced opacity — likely an alternate/legacy lockup rather than a deprecation mark, unconfirmed).
7. **`2. Specific Icon` (`1589:1306`)** — "Specific Icon" / "QV-NM Icon", body "NDS_ICON_SPECIFIC 사용 위치가 명확한 NDS 아이콘 입니다." Grouped by feature area: **관심그룹** (관심그룹 종목 팝업, 목록·메뉴·햄버거, 핸들·순서변경, 퀵메뉴·바텀 네비게이션, 완료팝업, 관심·즐겨찾기, 메모·종목메모, 왕관·TOP·순위, 수익률 공유하기 아이콘), **내비게이션** (헤더·탭 네비게이션— a large icon strip shown in both light and dark chrome, 홈), **기타** (나무템버스, 위젯, 파이낸셜타임즈·뉴스인사이트, 이미지 없음·호출 불가, 상품 유도 포인터, 자산진단, 쿠폰, 나무팡·투자카드, 챗봇이미지, 배당서비스, 커뮤니티(넘버), 다이렉트 인덱싱 리밸런싱, 다이렉트 인덱싱 종목편집).
8. **`Container BTN` (`1730:1810`)** — Two labeled swatch grids: **`Basic`** — a 5×2 grid of button style/state combinations (filled-dark, light-gray outline/fill variants, each rendered in an active and lighter "disabled-looking" tint — this is a normal enabled/disabled design spec pattern, not a deprecation signal) all labeled with placeholder text "버튼명"; **`Stock`** — two pill buttons labeled "매수" (red outline, buy) and "매도" (blue outline, sell).
9. A section labeled **`FONT USAGE`** (see #3) sits alongside the typography frame; no separate additional top-level frames were found beyond the 9 listed above (confirmed via the raw XML metadata dump — direct children of canvas `1291:793`, 9 total: `1291:794`, `1291:1111`, `1291:1127` (section), `1589:964`, `1589:979`, `1589:988`, `1589:1306`, a small `Frame 123571` (`1589:1428`, unscreenshotted — tiny 593×261 utility frame near the Icon section), and `1730:1810`).

## Cross-reference against live pages

- The `quickmenu_basic` bottom-nav pattern in `[NM] Screens` matches the Core reference's documented `quickmenu_basic` component (5 icons + hamburger) — consistent, not contradictory.
- The 상승=red/하락=blue/보합=green trading-icon convention matches `nds-ux-guide-updown-notation` and the hex values recorded in `nds-mweb-colors` (`#D73838`/`#247EF2`/`#009F83`) — consistent.
- No component here contradicts anything already recorded as live. Nothing here was found to supersede or duplicate a *newer* version elsewhere — this page reads as a **standalone asset/foundation collection** (typography, icon, flag, trading-icon, button inventories), not as an alternate/older copy of a screen or component documented on another page.

## Gaps / unverifiable

- **`Frame 123571` (`1589:1428`)** was not screenshotted (small utility frame, likely a legend/key) — unverified.
- No hidden (`hidden="true"`) frames were flagged in the metadata dump for this page, so the "hidden frame = blank 1×1" caveat from the method doc did not apply here — but this was not independently re-confirmed node-by-node.
- The dimmed `N2,` wordmark lockup in the Ci/Bi/로고 group (`1. Icon`) visually reads as lower-opacity/greyed relative to its sibling — flagged as a possible soft deprecation signal but **not conclusive** (could just be an unfinished/WIP lockup); recommend a closer zoomed screenshot in a future VERIFY pass.
- No "Last update" stamp was found anywhere on this page, unlike several `NDS_UX Guide` pages (e.g. `Last update 22.11.17`, `25.10.16`) that carry one — this page's freshness is genuinely unknown, not just unlabeled.

## CORE — componentKeys found

**None.** This pass used `get_metadata` (structure/names only) and `get_screenshot` (visual confirmation) — no `get_design_context`/`importComponentSetByKeyAsync` calls were made, so no `componentKey` was captured for anything on this page. Even if one had been captured, **given the `unknown` status verdict, nothing from this page should be promoted to the Core reference or used in a BUILD pass** until a future pass resolves whether this page is live or superseded.
