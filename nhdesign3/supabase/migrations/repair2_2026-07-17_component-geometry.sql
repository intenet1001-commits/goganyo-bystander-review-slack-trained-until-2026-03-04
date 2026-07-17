-- component-internal-geometry extraction pass, 2026-07-17
-- Source of truth: get_design_context on NDS_Library (file 72zrHgMLM4zhCjgSuTf7cC) component masters.
-- Every geometry claim below names its evidence node id. Screenshot cross-checks noted per component.

------------------------------------------------------------------
-- 1. btn_bottom_page  (evidence 3234:8466 [1-btn NM normal, screenshot-verified], 3234:8479 [2-btn NM normal])
------------------------------------------------------------------
UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"radius_px": 0, "width_px": 540, "height_px": 75,
 "font": "NanumBarunGothic", "font_weight": 400, "font_size": 26, "line_height": 38,
 "label_color": "#FFFFFF", "label_box_width_px": 440,
 "fill_hex": "#84C13D", "fill_token": "059(cta색)",
 "type_2btn": {"halves_px": [270, 270], "item_spacing": 0,
   "left_secondary": {"fill_hex": "#E0E0E0", "fill_token": "060", "label_color": "#333333"},
   "right_primary": {"fill_hex": "#84C13D", "label_color": "#FFFFFF"}},
 "typography_token": "Headline/Nanum/R/26"}
$j$::jsonb, updated_at=now() WHERE name='btn_bottom_page';

UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"radius_px": 0, "width_px": 540, "height_px": 75, "font": "NanumBarunGothic", "font_weight": 400, "font_size": 26, "line_height": 38, "fill_hex": "#84C13D", "type_2btn_item_spacing": 0}
$j$::jsonb, updated_at=now() WHERE name='btn_bottom_page (Channel/Type/Status variant set)';

UPDATE nhdesign3_components SET notes = coalesce(notes,'') || $md$ | INTERNAL GEOMETRY (2026-07-17): 1-btn 540x75 radius 0, fill 059(cta색) #84C13D, label NanumBarunGothic Regular 26/38 white centered in 440px box. 2-btn = two flush 270px halves (spacing 0): left gray 060 #E0E0E0 + #333 text, right #84C13D + white. Evidence nodes 3234:8466 (screenshot-verified) and 3234:8479, NDS_Library.$md$, updated_at=now() WHERE name IN ('btn_bottom_page','btn_bottom_page (Channel/Type/Status variant set)');

------------------------------------------------------------------
-- 2. btn_bottom_layerpopup  (evidence 3234:9059 [1-btn NM normal])
------------------------------------------------------------------
UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"radius_px": {"top": 0, "bottom": 16}, "width_px": 492, "height_px": 75,
 "font": "NanumBarunGothic", "font_weight": 400, "font_size": 26, "line_height": 38,
 "label_color": "#FFFFFF", "label_box_width_px": 400,
 "fill_hex": "#84C13D", "fill_token": "059(cta색)", "typography_token": "Headline/Nanum/R/26"}
$j$::jsonb, updated_at=now() WHERE name='btn_bottom_layerpopup';

UPDATE nhdesign3_components SET notes = coalesce(notes,'') || $md$ | INTERNAL GEOMETRY (2026-07-17): 492x75, bottom-only corner radius 16 (top square), fill #84C13D, NanumBarunGothic Regular 26/38 white, label box 400px. Evidence node 3234:9059, NDS_Library.$md$, updated_at=now() WHERE name='btn_bottom_layerpopup';

------------------------------------------------------------------
-- 3. btn_container_large  (evidence 3244:8758 [strength=1, screenshot-verified], 2524:12101 [strength=4(line)])
------------------------------------------------------------------
UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"radius_px": 10, "height_px": 60, "width_in_page_px": 492, "width_in_box_px": 432,
 "font": "NanumBarunGothic", "font_weight": 400, "font_size": 21, "line_height": 32,
 "label_box_width_px": 400,
 "strength_1": {"fill_hex": "#4E5255", "fill_token": "NM/Grayscale/27.245", "label_color": "#FFFFFF"},
 "strength_4_line": {"fill_hex": "#FFFFFF", "stroke_hex": "#E0E0E0", "stroke_token": "NM/ESS/line/2.017(박스테두리)", "stroke_px": 1, "label_color": "#666666"},
 "typography_token": "Body/Nanum/R/21"}
$j$::jsonb, updated_at=now() WHERE name IN ('btn_container_large','btn_container_large / btn_container_regular');

UPDATE nhdesign3_components SET notes = coalesce(notes,'') || $md$ | INTERNAL GEOMETRY (2026-07-17): 492x60 (in page) / 432x60 (in box), radius 10, NanumBarunGothic Regular 21/32. strength=1 fill #4E5255 white text (screenshot-verified, node 3244:8758); strength=4(line) white fill + 1px #E0E0E0 stroke + #666 text (node 2524:12101). NDS_Library.$md$, updated_at=now() WHERE name IN ('btn_container_large','btn_container_large / btn_container_regular');

------------------------------------------------------------------
-- 4. btn_container_regular  (evidence 3578:7768 [Strength=1, Height=h60, normal])
------------------------------------------------------------------
UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"radius_px": 10, "height_px": 60, "width": "hug",
 "padding": {"left": 20, "right": 20, "top": 15, "bottom": 13},
 "font": "NanumBarunGothic", "font_weight": 400, "font_size": 21, "line_height": 32,
 "strength_1": {"fill_hex": "#4E5255", "fill_token": "NM/ESS/grayscale/3.245(다크블루그레이)", "label_color": "#FFFFFF"},
 "height_variants_px": [60, 54, 50, 46, 40, 32], "typography_token": "Body/Nanum/R/21"}
$j$::jsonb, updated_at=now() WHERE name IN ('btn_container_regular','btn_container_regular (Strength/Height/Status variant set)');

UPDATE nhdesign3_components SET notes = coalesce(notes,'') || $md$ | INTERNAL GEOMETRY (2026-07-17): hug-width, h60 variant: padding LR 20 / top 15 / bottom 13, radius 10, NanumBarunGothic Regular 21/32; Strength=1 fill #4E5255 white text. Height variants h60/h54/h50(hidden)/h46/h40/h32 per set metadata 3578:7763. Evidence node 3578:7768, NDS_Library. Only h60 Strength=1 geometry was context-extracted; other heights' paddings not extracted this pass.$md$, updated_at=now() WHERE name IN ('btn_container_regular','btn_container_regular (Strength/Height/Status variant set)');

------------------------------------------------------------------
-- 5. input_line  (evidence 4483:9187 [Type=basic, Status=normal, screenshot-verified])
------------------------------------------------------------------
UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"width_px": 492,
 "label_row": {"height_px": 30, "font": "NanumBarunGothic", "font_size": 18, "line_height": 24, "color": "#666666", "typography_token": "Info/Nanum/R/18"},
 "field_row": {"height_px": 60, "underline_px": 1, "underline_hex": "#E0E0E0", "padding": {"top": 16, "bottom": 14, "right": 10, "left": 0},
   "text_font": "NanumBarunGothic", "text_size": 24, "text_line_height": 34, "typography_token": "Title/Nanum/R/24",
   "placeholder_hex": "#C5C5C5", "placeholder_token": "NM/Grayscale/54.074"},
 "radius_px": 0, "fill_hex": "#FFFFFF"}
$j$::jsonb, updated_at=now() WHERE name IN ('input_line','Line Text Field / Type=basic');

UPDATE nhdesign3_components SET notes = coalesce(notes,'') || $md$ | INTERNAL GEOMETRY (2026-07-17): 492 wide; label row h30 Nanum R 18/24 #666; field h60, bottom underline only 1px #E0E0E0, padding top 16 / bottom 14 / right 10 / left 0; input text Nanum R 24/34, placeholder #C5C5C5. Screenshot-verified. Evidence node 4483:9187, NDS_Library.$md$, updated_at=now() WHERE name IN ('input_line','Line Text Field / Type=basic');

------------------------------------------------------------------
-- 6. input_box  (evidence 2298:14788 [Type=basic, Status=normal])
------------------------------------------------------------------
UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"width_px": 492, "label_to_field_gap_px": 10,
 "label_row": {"height_px": 30, "font": "NanumBarunGothic", "font_size": 18, "line_height": 24, "color": "#666666"},
 "field_row": {"height_px": 60, "radius_px": 10, "stroke_px": 1, "stroke_hex": "#E0E0E0", "stroke_token": "NM/ESS/line/2.017(박스테두리)",
   "padding": {"left": 20, "right": 20, "top": 15, "bottom": 15},
   "text_font": "NanumBarunGothic", "text_size": 21, "text_line_height": 32, "typography_token": "Body/Nanum/R/21",
   "placeholder_hex": "#C5C5C5", "placeholder_token": "NAMUH/Defult/5.074(HintText)"},
 "fill_hex": "#FFFFFF"}
$j$::jsonb, updated_at=now() WHERE name IN ('input_box','Box Text Field / Type=basic');

UPDATE nhdesign3_components SET notes = coalesce(notes,'') || $md$ | INTERNAL GEOMETRY (2026-07-17): 492 wide; label row h30 (Nanum R 18/24 #666), 10px gap to field; field h60 radius 10, 1px #E0E0E0 border, padding 20 LR / 15 TB, text Nanum R 21/32, placeholder #C5C5C5. Evidence node 2298:14788, NDS_Library.$md$, updated_at=now() WHERE name IN ('input_box','Box Text Field / Type=basic');

------------------------------------------------------------------
-- 7. tab_btn pill tab  (evidence frame 1572:27222 = nodes 3683:15177/15186, 1222:18646, 3683:15184; screenshot-verified all 4)
------------------------------------------------------------------
UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"radius_px": 99, "height_px": 50, "width": "hug",
 "padding": {"left": 20, "right": 20, "top": 10, "bottom": 8},
 "font": "NanumBarunGothic", "font_weight": 400, "font_size": 21, "line_height": 32, "typography_token": "Body/Nanum/R/21",
 "active_NM": {"fill_hex": "#2C363B", "fill_token": "NM/ESS/grayscale/2.298(탭활성화)", "label_color": "#FFFFFF"},
 "active_QV": {"fill_hex": "#0E1A49", "fill_token": "QV/ESS/grayscale/2.298(탭활성화)", "label_color": "#FFFFFF"},
 "inactive": {"fill_hex": "#FFFFFF", "stroke_px": 1, "stroke_hex": "#E0E0E0", "label_color": "#666666"}}
$j$::jsonb, updated_at=now() WHERE name='tab_btn (BUTTON tab, round pill)';

UPDATE nhdesign3_components SET notes = coalesce(notes,'') || $md$ | INTERNAL GEOMETRY (2026-07-17): pill radius 99, padding LR 20 / top 10 / bottom 8, h50, Nanum R 21/32. Active NM #2C363B, active QV #0E1A49 (both white text); inactive white + 1px #E0E0E0 border, #666 text. Screenshot-verified all 4 variants. Evidence frame 1572:27222, NDS_Library. A smaller h40 (105x40, 7513:12955) and h39 (14449:15237) tab_btn family exists on the same page - not geometry-extracted this pass.$md$, updated_at=now() WHERE name='tab_btn (BUTTON tab, round pill)';

------------------------------------------------------------------
-- 8. label_risk  (evidence frame 7247:12332, all 6 Lv variants, screenshot-verified)
------------------------------------------------------------------
UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"radius_px": 99, "height_px": 30,
 "padding": {"left": 12, "right": 12, "top": 6, "bottom": 4},
 "font": "NanumBarunGothic", "font_weight": 400, "font_size": 15, "line_height": 20, "typography_token": "Label/Nanum/R/15",
 "lv1": {"fill_hex": "#EEF9EE", "text_hex": "#429F40"},
 "lv2": {"fill_hex": "#FEF5DF", "text_hex": "#97721A"},
 "lv3": {"fill_hex": "#FEF5DF", "text_hex": "#97721A"},
 "lv4": {"fill_hex": "#FFF4EC", "text_hex": "#EE5B18"},
 "lv5": {"fill_hex": "#FFF4EC", "text_hex": "#EE5B18"},
 "lv6": {"fill_hex": "#FFF0EF", "text_hex": "#D73838"},
 "usage_rules": {"label_gap_px": 8, "min_width_px": 44, "dev_height_px": 26, "max_chars_ko": 8}}
$j$::jsonb, updated_at=now() WHERE name='label_risk';

UPDATE nhdesign3_components SET notes = coalesce(notes,'') || $md$ | INTERNAL GEOMETRY (2026-07-17): h30 pill (radius 99; Lv6 node uses 999 - same visual), padding LR 12 / top 6 / bottom 4, Nanum R 15/20. Colors screenshot-verified: Lv1 #EEF9EE/#429F40, Lv2-3 #FEF5DF/#97721A, Lv4-5 #FFF4EC/#EE5B18, Lv6 #FFF0EF/#D73838. Usage page verbatim: "라벨 간 간격은 8px", "여백은 좌우 12px, 상 6px, 하 4px", "최소 Width 값은 44px", "Height 30이나 개발상 수치는 26". Evidence frame 7247:12332 + usage text 2295:14090, NDS_Library. Geometry applies to the 6-level Lv=1..6 set; the overloaded Lv=green/red/blue set (16349:15603) shares h30 but was not context-extracted.$md$, updated_at=now() WHERE name='label_risk';

------------------------------------------------------------------
-- 9. header_basic  (evidence 8901:13962 [Channel=NM, Left+Right on], screenshot-verified)
------------------------------------------------------------------
UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"width_px": 540, "height_px": 60, "radius_px": 0,
 "fill_token": "018(현재가 탭 bg)", "fill_hex_NM": "#FFFFFF",
 "icon_size_px": 34, "icon_edge_inset_px": 16, "icon_top_px": 13,
 "title_area": {"x": 60, "width_px": 420, "align": "center"},
 "title_font": "NanumBarunGothic", "title_size": 24, "title_line_height": 34, "title_color_NM": "#000000", "typography_token": "Title/Nanum/R/24"}
$j$::jsonb, updated_at=now() WHERE name IN ('header_basic','header_basic (Type variant)');

UPDATE nhdesign3_components SET notes = coalesce(notes,'') || $md$ | INTERNAL GEOMETRY (2026-07-17): 540x60, NM bg white (token 018), left/right icons 34x34 inset 16px from edges at y13, title area x60 width 420 centered, Nanum R 24/34 black. Screenshot-verified (back chevron left, X right). Evidence node 8901:13962, NDS_Library.$md$, updated_at=now() WHERE name IN ('header_basic','header_basic (Type variant)');

------------------------------------------------------------------
-- 10. quickmenu_basic  (evidence 370:7436 [Channel=NM, Type=normal], screenshot-verified)
------------------------------------------------------------------
UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"width_px": 540, "height_px": 74, "radius_px": 0,
 "fill_hex": "#222222", "fill_token": "203",
 "menu_row": {"x": 76, "y": 12, "item_spacing": 14,
   "divider": {"width_px": 1, "height_px": 48, "color": "rgba(255,255,255,0.1)", "token": "119"}},
 "item_font": "NanumBarunGothic", "item_size": 18, "item_line_height": 24,
 "item_color_inactive": "rgba(255,255,255,0.8)", "item_color_inactive_token": "124",
 "active_home": {"font": "Roboto", "weight": 500, "size": 18, "line_height": 22, "color": "#FFFFFF", "typography_token": "Info/Roboto/M/18"},
 "quickbar_icon": {"size_px": 52, "radius_px": 14, "x": 476, "y": 11, "fill_hex": "#343539"}}
$j$::jsonb, updated_at=now() WHERE name='quickmenu_basic';

UPDATE nhdesign3_components SET notes = coalesce(notes,'') || $md$ | INTERNAL GEOMETRY (2026-07-17): 540x74, bg #222 (token 203); hamburger icon left; menu row from x76 y12 with 14px item spacing and 1x48px dividers rgba(255,255,255,0.1); inactive items Nanum R 18/24 at 80% white. FONT EXCEPTION OBSERVED: active 홈 item is styled with token Info/Roboto/M/18 (Roboto Medium 18/22, white) - not NanumBarunGothic - confirmed in extracted node styles. Quickbar icon 52x52 radius 14 at x476 y11, bg #343539. Screenshot-verified. Evidence node 370:7436, NDS_Library.$md$, updated_at=now() WHERE name='quickmenu_basic';

------------------------------------------------------------------
-- 11. 유의사항 notice rows  (evidence 13717:14779 [Title 더보기=on], 13717:14797 [Content 기본 1줄, screenshot-verified])
------------------------------------------------------------------
UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"width_px": 492, "height_px": 32,
 "title_font": "NanumBarunGothic", "title_size": 24, "title_line_height": 34, "title_color": "#666666", "typography_token": "Title/Nanum/R/24",
 "btn_more_area": {"width_px": 80, "height_px": 32, "arrow_icon_px": 24, "arrow_x": 468, "arrow_y": 4, "more_text_visible": false}}
$j$::jsonb, updated_at=now() WHERE name='유의사항_Title';

UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"width_px": 492, "bullet_gap_px": 6, "bullet_width_px": 8, "bullet_weight": "Bold",
 "body_font": "NanumBarunGothic", "body_size": 19, "body_line_height": 26, "body_color": "#666666", "body_width_px": 478,
 "typography_token": "Notice/Nanum/R/19", "paragraph_gap_px": 10}
$j$::jsonb, updated_at=now() WHERE name='유의사항_Content';

UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"row_geometry_reference": "same 19/26 #666 bullet-row pattern as 유의사항_Content; popup variant width 480, item spacing 10"}
$j$::jsonb, updated_at=now() WHERE name='유의사항_Content_popup';

UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"title_row": {"height_px": 32, "font_size": 24, "line_height": 34, "color": "#666666"},
 "content_row": {"font_size": 19, "line_height": 26, "color": "#666666", "bullet_gap_px": 6, "body_width_px": 478},
 "paragraph_gap_px": 10}
$j$::jsonb, updated_at=now() WHERE name='유의사항 (Caveats notice component)';

UPDATE nhdesign3_components SET notes = coalesce(notes,'') || $md$ | INTERNAL GEOMETRY (2026-07-17): Title row 492x32, "유의사항" Nanum R 24/34 #666; right btn_more_area 80x32 with 24px arrow at x468 y4 and an intentionally transparent 더보기 text node (touch label hidden). Content row: bullet "·" Bold 8px wide + 6px gap + body Nanum R 19/26 #666 in 478px column (screenshot-verified). Usage page verbatim: "항목(단락) 간격 10px 입니다." Evidence nodes 13717:14779 / 13717:14797 / usage 13717:14753, NDS_Library.$md$, updated_at=now() WHERE name IN ('유의사항_Title','유의사항_Content','유의사항 (Caveats notice component)');

------------------------------------------------------------------
-- 12. card_data  (evidence 7766:20567 [Type=basic 1줄], screenshot-verified)
------------------------------------------------------------------
UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"width_px": 492, "radius_px": 20, "padding": {"left": 30, "right": 30, "top": 30, "bottom": 30},
 "title_to_list_gap_px": 20, "row_gap_px": 10, "fill_hex": "#FFFFFF",
 "title_font": "NanumBarunGothic", "title_weight": 600, "title_size": 24, "title_line_height": 34, "title_color": "#000000", "title_typography_token": "Title/Nanum/B/24",
 "row": {"height_px": 30, "label_width_px": 100, "label_size": 18, "label_line_height": 24, "label_color": "#999999",
   "label_value_gap_px": 10, "value_size": 21, "value_line_height": 32, "value_color": "#333333"}}
$j$::jsonb, updated_at=now() WHERE name IN ('card_data','Card / Data');

UPDATE nhdesign3_components SET notes = coalesce(notes,'') || $md$ | INTERNAL GEOMETRY (2026-07-17): 492 wide, radius 20, padding 30 all sides, 20px title-to-list gap, 10px row gap; title Nanum Bold 24/34 black; data row h30 = label (Nanum R 18/24 #999, fixed 100px) + 10px gap + value (Nanum R 21/32 #333). Screenshot-verified. NOTE: this master variant shows no stroke in extracted code, while the card usage frame states white-bg cards need stroke(017) - treat stroke as context-dependent. Evidence node 7766:20567 + usage 7710:14728, NDS_Library.$md$, updated_at=now() WHERE name IN ('card_data','Card / Data');

------------------------------------------------------------------
-- 13. card_select  (evidence 7766:20749 [Type=basic, Active=off], screenshot-verified)
------------------------------------------------------------------
UPDATE nhdesign3_components SET tokens = coalesce(tokens,'{}'::jsonb) || $j$
{"width_px": 492, "radius_px": 20, "padding": {"left": 30, "right": 30, "top": 30, "bottom": 30},
 "stroke_px": 1, "stroke_hex": "#E0E0E0", "stroke_token": "NM/ESS/line/2.017(박스테두리)",
 "title_to_list_gap_px": 20, "row_gap_px": 10, "fill_hex": "#FFFFFF",
 "title_row": {"height_px": 34, "check_icon_px": 34, "icon_title_gap_px": 10, "arrow_icon_px": 24,
   "title_weight": 600, "title_size": 24, "title_line_height": 34, "title_color": "#000000"},
 "row": {"height_px": 30, "label_width_px": 100, "label_size": 18, "label_color": "#999999", "value_size": 21, "value_color": "#333333"}}
$j$::jsonb, updated_at=now() WHERE name IN ('card_select','Card / Select');

UPDATE nhdesign3_components SET notes = coalesce(notes,'') || $md$ | INTERNAL GEOMETRY (2026-07-17): same box as card_data (492 / radius 20 / padding 30 / gaps 20+10) plus 1px #E0E0E0 border; title row h34 = 34px check circle + 10px gap + Nanum Bold 24/34 title + 24px right arrow. Active=off state screenshot-verified (gray check circle). Evidence node 7766:20749, NDS_Library.$md$, updated_at=now() WHERE name IN ('card_select','Card / Select');

------------------------------------------------------------------
-- Page content appends (one Internal geometry section per spec page)
------------------------------------------------------------------
UPDATE nhdesign3_pages SET content_md = content_md || $md$

## Internal geometry (repair pass 2026-07-17)

get_design_context 추출값 (증거 노드 명시, NanumBarunGothic = 이하 "Nanum"):

**btn_bottom_page** (노드 3234:8466 1-btn / 3234:8479 2-btn, 1-btn 스크린샷 검증)
- 1-btn: 540x75, 코너 radius 0, fill 059(cta색) #84C13D, 라벨 Nanum Regular 26px/행간38 흰색 중앙정렬(라벨박스 440px).
- 2-btn: 270+270 두 조각이 간격 0으로 맞붙음. 좌측(보조) fill 060 #E0E0E0 + #333 텍스트, 우측(주) #84C13D + 흰색.

**btn_bottom_layerpopup** (노드 3234:9059)
- 492x75, 하단 코너만 radius 16 (상단 직각), fill #84C13D, Nanum Regular 26/38 흰색, 라벨박스 400px.

**btn_container_large** (노드 3244:8758 strength=1 스크린샷 검증 / 2524:12101 strength=4(line))
- in page 492x60 / in box 432x60, radius 10, Nanum Regular 21/32, 라벨박스 400px.
- strength=1: fill #4E5255 (NM/Grayscale/27.245), 흰색 텍스트. strength=4(line): 흰 배경 + 1px #E0E0E0 테두리 + #666 텍스트.

**btn_container_regular** (노드 3578:7768, Strength=1 h60)
- hug 너비, 패딩 좌우 20 / 상 15 / 하 13, radius 10, Nanum Regular 21/32, fill #4E5255. 높이 배리언트 h60/h54/h50(숨김)/h46/h40/h32.

미추출: h54 이하 높이별 패딩, disabled 색상값, order/gray 계열 세트의 내부 수치.
$md$, reviewed_date=current_date WHERE source_id=(SELECT id FROM nhdesign3_sources WHERE file_key='72zrHgMLM4zhCjgSuTf7cC') AND node_id='45:621';

UPDATE nhdesign3_pages SET content_md = content_md || $md$

## Internal geometry (repair pass 2026-07-17)

**input_line Type=basic normal** (노드 4483:9187, 스크린샷 검증)
- 전체 너비 492. 레이블 행 h30: Nanum Regular 18/24 #666 (Info/Nanum/R/18).
- 필드 행 h60: 하단 밑줄만 1px #E0E0E0, 패딩 상 16 / 하 14 / 우 10 / 좌 0. 입력 텍스트 Nanum Regular 24/34 (Title/Nanum/R/24), 플레이스홀더 #C5C5C5.

**input_box Type=basic normal** (노드 2298:14788)
- 전체 너비 492, 레이블 행 h30 (18/24 #666) 후 10px 간격.
- 필드 박스 h60, radius 10, 1px #E0E0E0 테두리, 패딩 좌우 20 / 상하 15, 텍스트 Nanum Regular 21/32 (Body/Nanum/R/21), 플레이스홀더 #C5C5C5.

미추출: input_large(110px)/certify(80px)/amount controller 내부 수치, pressed·filled·disabled 상태 색상.
$md$, reviewed_date=current_date WHERE source_id=(SELECT id FROM nhdesign3_sources WHERE file_key='72zrHgMLM4zhCjgSuTf7cC') AND node_id='2283:9979';

UPDATE nhdesign3_pages SET content_md = content_md || $md$

## Internal geometry (repair pass 2026-07-17)

**tab_btn (라운드 필형 버튼 탭)** (프레임 1572:27222, 4개 배리언트 모두 스크린샷 검증)
- 필형: radius 99, 패딩 좌우 20 / 상 10 / 하 8, 높이 ~50, hug 너비. 폰트 Nanum Regular 21/32 (Body/Nanum/R/21).
- Active on: NM #2C363B (NM/ESS/grayscale/2.298 탭활성화) / QV #0E1A49 (QV 동명 토큰), 흰색 텍스트.
- Active off: 흰 배경 + 1px #E0E0E0 테두리, #666 텍스트 (NM/QV 동일).
- 같은 페이지에 h40(105x40, 7513:12955)·h39(14449:15237) 소형 tab_btn 세트 존재 - 이번 패스 미추출.
$md$, reviewed_date=current_date WHERE source_id=(SELECT id FROM nhdesign3_sources WHERE file_key='72zrHgMLM4zhCjgSuTf7cC') AND node_id='1935:15771';

UPDATE nhdesign3_pages SET content_md = content_md || $md$

## Internal geometry (repair pass 2026-07-17)

**label_risk Lv=1..6** (프레임 7247:12332, 6개 배리언트 스크린샷 검증)
- h30 필형, radius 99 (Lv6 노드만 999로 지정, 시각적 동일), 패딩 좌우 12 / 상 6 / 하 4, 폰트 Nanum Regular 15/20 (Label/Nanum/R/15).
- 색상쌍(배경/글자): Lv1 #EEF9EE/#429F40, Lv2·3 #FEF5DF/#97721A, Lv4·5 #FFF4EC/#EE5B18, Lv6 #FFF0EF/#D73838.

**Usage 프레임 원문 수치** (텍스트 노드 2295:14090 verbatim):
"라벨 간 간격은 8px입니다. BASIC 라벨의 여백은 좌우 12px, 상 6px, 하 4px 입니다. 추가 케이스 생성은 최대한 지양합니다. 라벨 최소 Width 값은 44px 입니다. 라벨 Height 30이나 개발상 수치는 26 입니다. 라벨 글자수 한글기준 8자 이상은 지양합니다."

미추출: label_basic 7종 배리언트별 색상값(스크린샷만으로 판단 불가한 오버로드 네이밍 이슈 기존 기록 참조), label_beta.
$md$, reviewed_date=current_date WHERE source_id=(SELECT id FROM nhdesign3_sources WHERE file_key='72zrHgMLM4zhCjgSuTf7cC') AND node_id='2283:12892';

UPDATE nhdesign3_pages SET content_md = content_md || $md$

## Internal geometry (repair pass 2026-07-17)

**header_basic Channel=NM, Left+Right Icon=on** (노드 8901:13962, 스크린샷 검증: 좌 back chevron / 우 X)
- 540x60, 배경 흰색 (토큰 018 현재가 탭 bg), radius 0.
- 좌우 아이콘 34x34, 양쪽 가장자리에서 16px 인셋, y13.
- 타이틀 영역 x60~480 (너비 420) 중앙정렬, Nanum Regular 24/34 검정 (Title/Nanum/R/24).

미추출: N2(네이비)·clear 배리언트 색상값, header_stock 내부 수치, header_order_switcher(72x46) 내부 수치.
$md$, reviewed_date=current_date WHERE source_id=(SELECT id FROM nhdesign3_sources WHERE file_key='72zrHgMLM4zhCjgSuTf7cC') AND node_id='0:1';

UPDATE nhdesign3_pages SET content_md = content_md || $md$

## Internal geometry (repair pass 2026-07-17)

**quickmenu_basic Channel=NM, Type=normal** (노드 370:7436, 스크린샷 검증)
- 540x74, 배경 #222 (토큰 203). 좌측 햄버거 아이콘.
- 메뉴 행 x76 y12 시작, 아이템 간격 14px, 구분선 1x48px rgba(255,255,255,0.1) (토큰 119).
- 비활성 항목: Nanum Regular 18/24, rgba(255,255,255,0.8) (토큰 124), 2줄 라벨 허용 (관심/그룹 등).
- 활성 "홈": 토큰 Info/Roboto/M/18 = Roboto Medium 18/22 흰색 - **NanumBarunGothic 아님, 실제 관측된 폰트 예외**.
- 우측 퀵바 아이콘 52x52, radius 14, x476 y11, 배경 #343539.
$md$, reviewed_date=current_date WHERE source_id=(SELECT id FROM nhdesign3_sources WHERE file_key='72zrHgMLM4zhCjgSuTf7cC') AND node_id='338:6691';

UPDATE nhdesign3_pages SET content_md = content_md || $md$

## Internal geometry (repair pass 2026-07-17)

**유의사항_Title 더보기=on** (노드 13717:14779)
- 492x32. "유의사항" Nanum Regular 24/34 #666 (Title/Nanum/R/24).
- 우측 btn_more_area 80x32: 화살표 아이콘 24x24 (x468 y4), "더보기" 텍스트 노드는 투명 처리(색 rgba 0) - 문구 미노출 규칙과 일치.

**유의사항_Content Type=기본 1줄** (노드 13717:14797, 스크린샷 검증)
- 불릿 행: "·" Nanum Bold 8px 폭 + 간격 6px + 본문 Nanum Regular 19/26 #666 (Notice/Nanum/R/19), 본문 컬럼 478px (총 492).

**Usage 원문** (노드 13717:14753 verbatim 일부): "항목(단락) 간격 10px 입니다."

미추출: 유의사항_하단노출(플로팅) 1줄/2줄 내부 수치, 유의사항_pagetop(492x92) 내부 수치.
$md$, reviewed_date=current_date WHERE source_id=(SELECT id FROM nhdesign3_sources WHERE file_key='72zrHgMLM4zhCjgSuTf7cC') AND node_id='13717:14694';

UPDATE nhdesign3_pages SET content_md = content_md || $md$

## Internal geometry (repair pass 2026-07-17)

**card_data Type=basic 1줄** (노드 7766:20567, 스크린샷 검증)
- 492 너비, radius 20, 패딩 상하좌우 30, 타이틀-리스트 간격 20, 행 간격 10, 배경 흰색.
- 타이틀: Nanum Bold 24/34 검정 (Title/Nanum/B/24).
- 데이터 행 h30: 레이블 Nanum Regular 18/24 #999 고정폭 100 + 간격 10 + 값 Nanum Regular 21/32 #333.
- 이 마스터 배리언트 추출 코드에는 stroke 없음. usage 프레임은 "기본 배경(white)위에는 stroke(017)이 필요합니다" 명시 - 맥락 의존.

**card_select Type=basic, Active=off** (노드 7766:20749, 스크린샷 검증)
- card_data와 동일 박스(492 / radius 20 / 패딩 30 / 간격 20·10) + 1px #E0E0E0 테두리.
- 타이틀 행 h34: 체크 아이콘 34x34 + 간격 10 + Nanum Bold 24/34 타이틀 + 우측 화살표 24x24.

**Usage 원문 수치** (verbatim): "기본 마진은 좌우상하 30px입니다. (데이터가 많을 땐 마진 24px를 사용합니다.)", "item 간격은 기본적으로 10px입니다.", "블루그레이 배경에는 라인없는 박스를 사용합니다."

미추출: card_emphasis / card_accordion / card_guide / financial_boxlist 내부 수치, Active=on 색상값.
$md$, reviewed_date=current_date WHERE source_id=(SELECT id FROM nhdesign3_sources WHERE file_key='72zrHgMLM4zhCjgSuTf7cC') AND node_id='353:6951';

------------------------------------------------------------------
-- Topic
------------------------------------------------------------------
INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT $q$component internal geometry (radius/padding/in-component typography)$q$,
       ARRAY['radius','padding','item spacing','NanumBarunGothic','internal geometry','corner radius','font size'],
       ARRAY[
         (SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='72zrHgMLM4zhCjgSuTf7cC' AND p.node_id='45:621'),
         (SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='72zrHgMLM4zhCjgSuTf7cC' AND p.node_id='2283:9979'),
         (SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='72zrHgMLM4zhCjgSuTf7cC' AND p.node_id='1935:15771'),
         (SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='72zrHgMLM4zhCjgSuTf7cC' AND p.node_id='2283:12892'),
         (SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='72zrHgMLM4zhCjgSuTf7cC' AND p.node_id='0:1'),
         (SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='72zrHgMLM4zhCjgSuTf7cC' AND p.node_id='338:6691'),
         (SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='72zrHgMLM4zhCjgSuTf7cC' AND p.node_id='13717:14694'),
         (SELECT p.id FROM nhdesign3_pages p JOIN nhdesign3_sources s ON s.id=p.source_id WHERE s.file_key='72zrHgMLM4zhCjgSuTf7cC' AND p.node_id='353:6951')
       ]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic=$q$component internal geometry (radius/padding/in-component typography)$q$);
