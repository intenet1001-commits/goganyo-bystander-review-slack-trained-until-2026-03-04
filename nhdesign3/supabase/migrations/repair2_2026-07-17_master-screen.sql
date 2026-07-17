-- Targeted LEARN repair pass 2026-07-17: in-context visual surface of 국내주식 권리 (ZkwarjFkN8BiGolWO7PcwI)
-- Screenshots viewed: 309:18455 (보유권리_전체), 333:2997 (예정권리_전체), 323:20860 (보유권리_테이블, blank body)
-- Geometry/colors extracted via get_design_context on 309:18455 (frame width 540px)

-- 1) MASTER page: append in-context visual surface section, flip gap -> learned
UPDATE nhdesign3_pages
SET content_md = content_md || $md$

## In-context visual surface (repair pass 2026-07-17)
Verified on screenshots of 309:18455 (보유권리_전체), 333:2997 (예정권리_전체), 323:20860 (보유권리_테이블). Exact values from get_design_context on 309:18455. All px values are at the 540px design frame width (frame 540x2033, white #FFFFFF background).

### Top chrome
- statusbar: 65px, white.
- header_basic: h 60px, white. Title exact string **"국내주식 권리"** (space between 국내주식 and 권리), NanumBarunGothic Regular 24px, black, centered, followed by a 24px down-chevron (nds_icon_arrow color=04). Back icon 34px at left. No border/shadow.
- tab_1depth_line: h 72px, white, two 270px halves. Active tab (보유 권리): NanumBarunGothic **Bold** 24px black + 2px solid **black** act_line across the bottom of its half. Inactive tab (예정 권리): Regular 24px **#999** + 2px **#E0E0E0** line. On the 예정 권리 screen the treatment simply swaps sides. These are underline tabs — NOT pills.

### Account row (AccountLookup, h 74px)
- Full-bleed band, fill **#F9F9F9** (not white, not #F5F5F5). No borders.
- Left: account number "201-02-123456" Roboto Regular 24px black. Right: "[종합매매] 김나무" NanumBarunGothic Regular 22px black, right-aligned, with a small dark ▾ triangle at the far right (~24px from edge). Effectively space-between with ~24px side padding.

### Filter/period control row (select_ctrl) — borderless
- No background, no border chrome; sits on white. Padding: top 30 / bottom 10 / x 24.
- Left: 26px circular green check icon (raster asset; exact green not extractable) + "임시주총, 유형없음 제외" #333 21px.
- Right: "6개월" #666 18px + 16px chevron; then view toggles, each 30px: card/list icon (two horizontal bars) fill **#999** when active, grid icon (6 squares) **#DDD** when inactive. In table view (323:20860) the grid icon is the dark one — active state = darker fill.

### Rights-type chip row (tab_btn pills)
- Container px 24 / py 10, single horizontal scroll row, clipped at frame edge (무상 then "ET…" of ETF분배금).
- Selected pill (전체): fill **#2C363B** (dark charcoal-blue, not pure black), radius 99px (full pill), text white 21px, padding x 20 / top 10 / bottom 8.
- Unselected pill: **white fill + 1px #E0E0E0 border**, same radius/padding, text #666 21px.

### List card container — bordered cards, NOT flat rows
- Card: white fill, **1px #E0E0E0 border, radius 20px**, padding 30px horizontal / 24px vertical, width 492 (24px page margins), 16px vertical gap between cards.
- Inside: header row → hairline divider **#F0F0F0 1px** → field rows.
- Header row: 50px logo, gap 16, stock name NanumBarunGothic **Bold 24px black** (ellipsis overflow).
- Field rows: h 30, gap 12; label #999 18px left; value **#333 21px Roboto Regular right-aligned** (dates/amounts).

### Stock brand chip (logo)
- **50px circular raster image**, not text-rendered: kakao = yellow circle + lowercase "kakao" bitmap logotype (component ss_img_ci_035720); SK하이닉스 (red circle), 삼성전자 (navy SAMSUNG oval), 에코프로비엠 (blue circle, italic "EcoPro") are 50px logo_ci images. Case follows each brand's CI.

### Meta badge row under stock name — text tokens, not colored pills
- 18px Regular text tokens separated by 16px-tall 1px vertical hairlines, gap 10, e.g. "배당 | 유통 | 대여".
- Rights-type token color: **#333 for 유상/매수청구/배당** (emphasized), **#999 for all other types** (해외지원개발펀드, Ritz(부동산신탁)...). 유통/대여 always #999. This is the rendered value of the canvas note "강조색 2.023 / 일반색 4.024".

### Secondary status label (배당예정 / 배당완료)
- BOTH render **#999**, 18px Regular, right-aligned immediately before the 24px right-chevron (nds_icon_arrow color=05). Gray in both states on the list screen — **green is not used here**.
- CAUTION: the salmon/pink blocks over the first two card corners in the 309:18455 screenshot are canvas annotation rectangles rgba(255,0,0,0.5) (nodes 745:5122, 745:5123, layer name gibberish "쌔ㅕ처 ㅁㄱㄷㅁ") — they are NOT UI and hide the real gray label underneath.

### Footer promo band (알림)
- Sectionbar divider 12px **#F5F5F5** above; the band row itself is **white** (not gray), px 24, space-between.
- Text: "계좌에 권리가 발생하면 알림을 받을 수 있어요." #666 18px.
- "알림 받기" button = btn_container_regular: **white fill + 1px #E0E0E0 border (outline style), radius 10px, h 50px, px 20, text #666 18px**. Gray outline button — not green, not filled.

### Notice strip (유의사항_하단노출)
- Full-width band **#F9F9F9**, h 52px: 22px ⓘ info icon + "권리 정보는 변경될 수 있으니 감독원 공시를 확인하세요" #666 19px.

### quickmenu_basic bottom bar (in context)
- h 74px, fill **#222222** (very dark charcoal — not pure black, not #343539).
- Left: white hamburger icon. Items separated by 2px vertical bars rgba(255,255,255,0.1), h 48.
- "HOME": **white**, Roboto Medium 18px. Other items two-line NanumBarunGothic Regular 18px **#D1D1D1**: 관심/그룹, 주식/현재가, 국내주식/주문, 국내주식/잔고/손익 (last clipped by the 540px frame, so screenshots show "잔고/손").
- Right: 52px square, radius 14px, fill **#343539**, containing the layered-stack icon (green accent visible in screenshot; exact green not extractable from raster).

### 예정 권리 tab in context (333:2997)
- Same chrome (header/tabs/account row/promo band/notice/quickmenu). NO exclusion-check row, NO period selector, NO chip row — only the two view-toggle icons right-aligned above the cards.
- Cards: same bordered-card chrome; header shows name + single type token (매수청구 / 배당) below it; **no status label and no right-chevron** on scheduled cards.

### Honest gaps
- Table/grid view styling not determinable: frame 323:20860 renders with a blank body (toggle switched, no table drawn).
- Exact greens (check icon, quickmenu layer-icon accent) live in raster assets — not extracted.
$md$,
    status = 'learned',
    sections_studied = CASE WHEN 'in-context-visual-surface' = ANY(sections_studied)
                            THEN sections_studied
                            ELSE array_cat(sections_studied, ARRAY['in-context-visual-surface']) END,
    reviewed_date = current_date
WHERE source_id = (SELECT id FROM nhdesign3_sources WHERE file_key='ZkwarjFkN8BiGolWO7PcwI')
  AND node_id = '262:9472';

-- 2) Page 2 (16:1704): append cross-reference visual-surface note
UPDATE nhdesign3_pages
SET content_md = content_md || $md$

## Shipped visual-surface values (repair pass 2026-07-17, verified on MASTER page 262:9472)
The screens described above shipped with these concrete values (from screenshots + design context of 309:18455, 540px frame): header title "국내주식 권리" Regular 24px black + 24px chevron; underline tabs 72px (active Bold 24 black + 2px black line, inactive #999 + #E0E0E0); account row 74px band #F9F9F9 (number Roboto 24 left, [종합매매] 김나무 22px right, space-between); filter/period row borderless on white (#333 21px check-text, #666 18px period, 30px view toggles #999 on / #DDD off); type chips = full pills radius 99 (selected fill #2C363B white text, unselected white + 1px #E0E0E0 border, #666 21px); list cards = bordered white cards 1px #E0E0E0 radius 20px, px30/py24, 16px gaps, inner divider #F0F0F0, label #999 18 / value #333 21 Roboto right; brand logo 50px circular raster (kakao lowercase per CI); type token #333 only for 유상/매수청구/배당 else #999; status labels 배당예정/배당완료 BOTH #999 18px (gray, not green); promo band = 12px #F5F5F5 sectionbar + white row, 알림 받기 = outline button (white fill, 1px #E0E0E0, radius 10, h50, #666 18px); notice strip #F9F9F9 h52 #666 19px; quickmenu_basic bar fill #222, HOME white Roboto Medium 18, others #D1D1D1 18, right 52px #343539 rounded-14 layer button. Note: "자세히 보기 >" link seen in this page's earlier drafts does not appear in the shipped cards — the whole card is tappable via a right-chevron (#999 status text + 24px chevron).
$md$,
    reviewed_date = current_date
WHERE source_id = (SELECT id FROM nhdesign3_sources WHERE file_key='ZkwarjFkN8BiGolWO7PcwI')
  AND node_id = '16:1704';

-- 3) Component tokens (single-row name matches only)
UPDATE nhdesign3_components
SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"in_context_2026_07": {"source": "국내주식 권리 309:18455 @540px", "bar_fill": "#222222", "height_px": 74, "active_item": "HOME white Roboto Medium 18px", "inactive_item_color": "#D1D1D1", "inactive_item_font": "NanumBarunGothic Regular 18px two-line", "divider": "2px rgba(255,255,255,0.1) h48", "hamburger": "white, left", "right_layer_button": {"size_px": 52, "radius_px": 14, "fill": "#343539"}}}
$j$::jsonb, updated_at = now()
WHERE name = 'quickmenu_basic';

UPDATE nhdesign3_components
SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"in_context_2026_07": {"source": "국내주식 권리 309:18455", "fill": "#F5F5F5", "height_px": 12, "usage": "divider above footer promo band"}}
$j$::jsonb, updated_at = now()
WHERE name = 'Sectionbar';

UPDATE nhdesign3_components
SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"in_context_2026_07": {"source": "국내주식 권리 309:18455 @540px", "radius_px": 99, "padding": "x20 top10 bottom8", "selected": {"fill": "#2C363B", "text": "white 21px"}, "unselected": {"fill": "white", "border": "1px #E0E0E0", "text": "#666 21px"}}}
$j$::jsonb, updated_at = now()
WHERE name = 'tab_btn (BUTTON tab, round pill)';

-- 4) Topics (bilingual keywords), guarded against duplicates
INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT $q$quickmenu in context (국내주식 권리)$q$,
       ARRAY['quickmenu','퀵메뉴','quickmenu_basic','bottom bar','하단바','하단 메뉴','#222','dark charcoal','in context'],
       ARRAY[(SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='ZkwarjFkN8BiGolWO7PcwI' AND p.node_id='262:9472')]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic=$q$quickmenu in context (국내주식 권리)$q$);

INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT $q$권리 목록 화면 visual surface$q$,
       ARRAY['권리 목록 화면','rights list screen','bordered card','카드 리스트','list card','radius 20','status label','배당예정','배당완료','gray status','pill chip','#2C363B','account row','#F9F9F9','계좌 행'],
       ARRAY[
         (SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='ZkwarjFkN8BiGolWO7PcwI' AND p.node_id='262:9472'),
         (SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='ZkwarjFkN8BiGolWO7PcwI' AND p.node_id='16:1704')
       ]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic=$q$권리 목록 화면 visual surface$q$);

INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT $q$promo band 알림 받기 (footer notification banner)$q$,
       ARRAY['promo band','프로모 밴드','알림 받기','알림 배너','notification banner','sectionbar','outline button','btn_container_regular','#E0E0E0','radius 10'],
       ARRAY[(SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='ZkwarjFkN8BiGolWO7PcwI' AND p.node_id='262:9472')]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic=$q$promo band 알림 받기 (footer notification banner)$q$);
