-- Layout page (NDS_Templates 1xE0qvn2yv3ZkQ9BwhKT1y, node 3760:33077) completion pass
-- Repair agent: layout-completion, 2026-07-17. All quotes below transcribed from screenshots
-- viewed this session (18 frame screenshots + page metadata XML).

UPDATE nhdesign3_pages
SET content_md = content_md || $md$

## Layout page completion (repair pass 2026-07-17)

18 additional frames screenshot-verified this pass. Numbers marked (metadata) come from the
page metadata XML geometry, not from printed annotation labels.

### 6. 상단 배너 (node 3781:30416) — VERIFIED
Verbatim: "📌 꼭 확인하세요!" — yellow bold text + red 3D pushpin on dark background. It is a
plain attention banner; no further rule text inside this node.

### 7. 헤더 예시 (frame "2", node 3781:30115) — VERIFIED
Heading verbatim: "헤더 예시". Four real-service mock columns under labels:
- 스크린 "1Level" = 뉴스포털 header: back chevron + "뉴스포털" + dropdown chevron
- 스크린 "2Level" = "서비스 명" header: back chevron + title + dropdown chevron
- 풀팝업 "1Level" = "토픽 리스트" header: title + close ✕ (no back)
- 풀팝업 "2Level+" = "뉴스상세" header: back chevron + title + close ✕
Note the popup column is labeled "2Level+" (with plus) — deeper popup levels keep back+close.
스크린 mocks include the bottom quickmenu bar; 풀팝업 mocks do not.

### 8. BASIC 기본 — VERIFIED (Screens_1Level 3781:30418, Fullpopup_1Level 3781:30735)
- Screens_1Level: statusbar(65h) + header "<  화면 타이틀명 ⌄" (60h) + bottom quickmenu(74h, y=913).
  Quickmenu items verbatim: 햄버거 아이콘 / "홈" / "관심 그룹" / "주식 현재가" / "국내주식 주문" /
  "국내주식 잔고/손익" / layers icon (green accent).
- Fullpopup_1Level: statusbar + header "화면 타이틀명  ✕" (title centered, close right, NO back) and
  NO bottom quickmenu. Confirms the 헤더 기준 rule visually: full popups drop the quickmenu bar.
- Screens_2Level (3781:30424) / Fullpopup_2Level (3781:30739): NOT screenshotted — metadata shows the
  identical scaffold (statusbar/header_basic/quickmenu), assumed same pattern (gap: duplicate scaffolds).
- Frame canvas for every template screen: 540 x 987 (metadata).

### 9. with CTA Button 하단버튼 — VERIFIED (btn_1버튼 3781:30890, btn_1:2버튼 3781:30894, btn_2버튼 3781:30897)
All buttons labeled "버튼명". btn_bottom_page height 75 (metadata).
- btn_1버튼: single full-width green primary CTA sitting DIRECTLY ABOVE the quickmenu bar (btn y=838,
  quickmenu y=913).
- btn_2버튼: two buttons split 50:50 — left light-gray secondary, right green primary — above quickmenu
  (y=838).
- btn_1:2버튼: 1:2 width ratio — left gray secondary (1/3), right green primary (2/3) — and NO quickmenu;
  the button row is flush to screen bottom (y=912).
Pattern: with quickmenu the CTA floats above it; without quickmenu the CTA anchors to the bottom edge.

### 10. 현재가/관심종목 — VERIFIED (Screens_현재가01 3823:30448, 현재가02 3823:30452, 미트볼 3823:30431)
Topbar_Stock header (60h) layout left→right: back chevron / bold stock name (e.g. "하림") with tiny
corner triangle (expand affordance) / mic icon / dark pill button "주문하기" / vertical 3-dot meatball.
- 현재가02 title node verbatim: "종목명이 길어지면 글자 크기 줄이고 두줄" — long stock names reduce font
  size and wrap to two lines (self-documenting placeholder).
- 미트볼 screen header title verbatim: "최대 14자 권장" (screen title max 14 chars recommended).
  Meatball opens: dimmed screen + white select box (266w, rows 70h, metadata) anchored top-right with
  4 rows verbatim: "관심종목추가" / "관심카드 설정" / "상단영역 작게 보기" (green rounded-square check,
  checked) / "관심그룹 필드명 보기" (green toggle, ON).

### 11. Step 스텝 — VERIFIED (Screens_Step스텝 4585:38589)
step_header bar (74h at y=125, directly under 60h header; metadata) on light-gray band:
left verbatim "스텝명"; right progress indicator = 4 small gray dots + green filled circle containing
current step number "5". Second copy 4965:17252 not screenshotted (same symbol, gap: duplicate).

### 12. Header combo 헤더 콤보 오픈 — VERIFIED (Screens_headercombo_NM 5158:18555)
Open-state of the header dropdown: header "<  타이틀명 ⌄" then 3 stacked navi_category rows (60h each,
metadata), remainder of screen dimmed. First row highlighted pale-green background + bold text.
Rows verbatim: "중간 카테고리" (highlighted) / "중간 카테고리" / "최하위 카테고리 하단 보더값 0"
(the last row's own text documents: bottom border value 0 on the lowest category row).
Duplicate 5158:18620 not screenshotted.

### 13. 데이터 없음 케이스 (empty state) — VERIFIED (Screens_1Level 16378:14007)
Centered in the upper third of the content area (icon y=225, text y=275 of 987; metadata):
gray outline info icon (nds_icon_info05_h30, 30px) ABOVE the message, text verbatim:
"조회 가능한 데이터가 없습니다." Standard 1Level scaffold (back header + quickmenu) retained.

### 14. Header 1Button (챗봇) / Header 2Button (챗봇, 비밀번호) — VERIFIED (10265:16619, 10272:17692, 10272:17576, 10272:17796)
- header_1버튼: "<  화면 타이틀명" + ONE right-side icon: headset (챗봇/상담).
- header_2버튼: "<  화면 타이틀명" + TWO right-side icons: headset + open-padlock icon labeled "PW"
  (비밀번호). Icons right-aligned, headset left of PW.
- Each exists in two verified color variants: light (white header, dark text) and dark (deep navy
  statusbar+header, white text/icons). Body and quickmenu identical in both.

### 15. with Tab 탭 — VERIFIED (tab_2column 14483:2671, tab_3column 14483:2694, tab_4column 14483:2689, tab_swipe 14483:2721)
tab_1depth_line bar 72h at y=125 directly under header (metadata). Active tab = bold black text +
black underline; inactive = gray. Self-documenting label placeholders give the char-count rules:
- 2column verbatim: "한글기준최대열두글자요" / "너무 길게 쓰면 안됩니다" → max 12 Korean chars per
  2-column tab; don't write longer.
- 3column verbatim: "일이삼사오육칠" ×3 → 7 chars fit at 3 columns.
- 4column verbatim: "일이삼사오" ×4 → 5 chars fit at 4 columns.
- swipe verbatim: "일이삼사오육" repeated, edge tabs horizontally clipped → swipeable tab row.
2col/3col mocks: back+dropdown header, green CTA above quickmenu. 4col/swipe mocks: title+✕ (fullpopup)
header, CTA flush to bottom, no quickmenu.

### 16. with 서브페이지 상단 안내영역 — VERIFIED (상단안내영역01 14483:2677, 상단안내영역05 27275:17032, Subpage_top symbol set 3794:30403)
Banner sits directly below the tab bar (y=197, metadata), white card with right-side illustration,
line_section (12h) divider beneath. Subpage_top symbol set has 4 variants:
- Type=basic (200h): title + sub only. Example verbatim: "1주 단위 자동전환을 신청하면?" /
  "소수점 잔고가 1주 단위로 자동전환되어 빠른 일반 거래가 가능합니다."
- Type=1-btn (268h): title placeholder verbatim "일이삼사오육칠팔구십일이삼사" (= 14 chars, the title
  max), 2-line sub placeholder, one bordered button "버튼명".
- Type=2-btn (268h): example verbatim "이제 미국주식도 청약하세요!" / "국내주식 소수점 거래를 신청하시면
  백원 단위부터 주식을 거래할 수 있어요." + buttons "서비스안내" / "버튼명".
- Type=with tooltip (268h): "서비스명을 입력하세요." + gray (?) tooltip icon; sub verbatim
  "해당 영역은 서비스 추가 설명란으로 사용되며, 두줄로 사용 가능합니다." (sub text max 2 lines).
In-screen example 상단안내영역05 verbatim: "ELS/DLS가 처음이신가요?" / "혼자하기 어려운 투자,
투자가이드에서 확인하세요!" + buttons "투자가이드" / "숙려제도", illustration 154px (기본/교육_illust61).
Caption node 27275:22671 (metadata text): "일러스트 여백에 따라 이미지는 140/154 사이즈를 사용합니다."
— 01 uses the 140 size (기본/모바일_illust23, 140px), 05 uses 154.
상단안내영역02/03/04 NOT individually screenshotted — they are plain instances of the same Subpage_top
symbols verified above (gap: instance-level overrides unchecked).

### 17. FAB, floating 플로팅 액션 버튼 — VERIFIED (fab_plus 18548:20966, fab_close 18548:20970, fab_top 18548:21002, fab_chatbot 19877:1792)
FAB = rounded-square button, bottom-right; nds_img_fab asset 80x80 (incl. shadow padding) at x=450
(metadata), i.e. ~24px visual margin from the right edge.
- fab_plus: light-gray rounded square with gray + icon; no quickmenu on this mock (Topbar_Basic "타이틀").
- fab_close (open state): background dimmed; quickmenu_popup card floats above the FAB with 2 rows
  verbatim: "단건 매수" (blue memo icon) / "타종목 매수" (red PDF icon); FAB turns dark with white ✕.
- fab_top: same button with upward arrow (scroll-to-top).
- fab_chatbot: dark rounded square with chatbot face icon; this mock keeps the quickmenu bar, and the
  FAB sits ABOVE it (y=803 vs y=877 on quickmenu-less mocks; metadata) — FAB never overlaps quickmenu.

### Coverage after this pass
16/17 template groups on the page screenshot-verified (previous pass: 4 sections; this pass adds 헤더
예시, BASIC, CTA buttons, 현재가/관심종목, Step, Header combo, empty state, Header 1/2Button, 4 tab
layouts, 서브페이지 상단 안내영역 + Subpage_top symbol set, FAB x4, top banner).
Remaining honest gaps: Screens_2Level / Fullpopup_2Level duplicate scaffolds, second copies of
Step/headercombo/frame-"2" duplicates, and 상단안내영역02–04 instance overrides — all believed identical
to verified siblings but not screenshot-confirmed.
$md$,
    sections_studied = ARRAY[
      '화면 이동 구조 (screen navigation structure)',
      '헤더 기준 (header rules)',
      '카드 그리드 세로 간격 (card grid vertical spacing)',
      '인풋 세로 간격 (input vertical spacing)',
      '상단 배너 꼭 확인하세요',
      '헤더 예시 (real-service header examples)',
      'BASIC 기본 (screen/fullpopup scaffolds)',
      'with CTA Button 하단버튼 (1/2/1:2 buttons)',
      '현재가/관심종목 (Topbar_Stock + meatball)',
      'Step 스텝 (step_header indicator)',
      'Header combo 헤더 콤보 오픈',
      '데이터 없음 케이스 (empty state)',
      'Header 1Button/2Button (챗봇, 비밀번호)',
      'with Tab 탭 (2/3/4column + swipe, char limits)',
      'with 서브페이지 상단 안내영역 (Subpage_top 4 types)',
      'FAB 플로팅 액션 버튼 (plus/close/top/chatbot)'
    ],
    status = 'learned',
    reviewed_date = current_date
WHERE source_id = (SELECT id FROM nhdesign3_sources WHERE file_key='1xE0qvn2yv3ZkQ9BwhKT1y')
  AND node_id = '3760:33077';

-- ---------------------------------------------------------------------------
-- Topics for the newly verified groups (bilingual keywords)
-- ---------------------------------------------------------------------------

INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT $q$NDS Templates Layout - FAB 플로팅 액션 버튼$q$,
       ARRAY['FAB','floating action button','플로팅 액션 버튼','fab_plus','fab_close','fab_top','fab_chatbot','quickmenu_popup','단건 매수','타종목 매수','스크롤 탑'],
       ARRAY[(SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='1xE0qvn2yv3ZkQ9BwhKT1y' AND p.node_id='3760:33077')]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic=$q$NDS Templates Layout - FAB 플로팅 액션 버튼$q$);

INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT $q$NDS Templates Layout - 데이터 없음 empty state 템플릿$q$,
       ARRAY['empty state','빈 화면','데이터 없음','no data','조회 가능한 데이터가 없습니다','nds_icon_info05_h30','empty screen template'],
       ARRAY[(SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='1xE0qvn2yv3ZkQ9BwhKT1y' AND p.node_id='3760:33077')]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic=$q$NDS Templates Layout - 데이터 없음 empty state 템플릿$q$);

INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT $q$NDS Templates Layout - Step 스텝 인디케이터$q$,
       ARRAY['step indicator','스텝','step_header','스텝명','진행 단계','step 템플릿','dots progress'],
       ARRAY[(SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='1xE0qvn2yv3ZkQ9BwhKT1y' AND p.node_id='3760:33077')]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic=$q$NDS Templates Layout - Step 스텝 인디케이터$q$);

INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT $q$NDS Templates Layout - 현재가 레이아웃 (Topbar_Stock)$q$,
       ARRAY['현재가 레이아웃','current price layout','Topbar_Stock','종목 헤더','주문하기','관심종목','미트볼','meatball','종목명 두줄','최대 14자'],
       ARRAY[(SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='1xE0qvn2yv3ZkQ9BwhKT1y' AND p.node_id='3760:33077')]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic=$q$NDS Templates Layout - 현재가 레이아웃 (Topbar_Stock)$q$);

INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT $q$NDS Templates Layout - 하단 CTA 버튼 배치$q$,
       ARRAY['CTA','하단버튼','bottom button','btn_bottom_page','1버튼','2버튼','1:2버튼','버튼명','quickmenu 위 버튼'],
       ARRAY[(SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='1xE0qvn2yv3ZkQ9BwhKT1y' AND p.node_id='3760:33077')]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic=$q$NDS Templates Layout - 하단 CTA 버튼 배치$q$);

INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT $q$NDS Templates Layout - 탭 글자수 규칙$q$,
       ARRAY['tab layout','탭 레이아웃','탭 글자수','2column','3column','4column','swipe tab','스와이프 탭','tab_1depth_line','최대 열두글자'],
       ARRAY[(SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='1xE0qvn2yv3ZkQ9BwhKT1y' AND p.node_id='3760:33077')]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic=$q$NDS Templates Layout - 탭 글자수 규칙$q$);

INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT $q$NDS Templates Layout - 서브페이지 상단 안내영역 (Subpage_top)$q$,
       ARRAY['subpage banner','상단안내영역','Subpage_top','상단 배너','서브페이지 배너','일러스트 140 154','basic 1-btn 2-btn tooltip'],
       ARRAY[(SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='1xE0qvn2yv3ZkQ9BwhKT1y' AND p.node_id='3760:33077')]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic=$q$NDS Templates Layout - 서브페이지 상단 안내영역 (Subpage_top)$q$);

INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT $q$NDS Templates Layout - 헤더 콤보 & 챗봇/비밀번호 헤더 버튼$q$,
       ARRAY['header combo','헤더 콤보','navi_category','챗봇 헤더','header_1버튼','header_2버튼','headset icon','PW 자물쇠','비밀번호 버튼','다크 헤더'],
       ARRAY[(SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='1xE0qvn2yv3ZkQ9BwhKT1y' AND p.node_id='3760:33077')]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic=$q$NDS Templates Layout - 헤더 콤보 & 챗봇/비밀번호 헤더 버튼$q$);
