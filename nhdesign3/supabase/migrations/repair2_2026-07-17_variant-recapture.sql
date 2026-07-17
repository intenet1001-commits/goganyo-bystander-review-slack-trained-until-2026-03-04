-- Repair pass 2026-07-17: re-capture of variant sheets that were previously
-- transcribed only via thumbnails / clipped screenshots.
-- Role: variant-recapture. All quotes below come from screenshots viewed this pass.

-- ============================================================================
-- 1) NDS_M.web (uVcmG6GgOl2J8EOlc22wob) — 유의사항 page, node 645:4572
--    Gap closed: "페이지 내 유의사항" asset sheet (648:7391) had 7 named body
--    variants but only ~5 were captured (screenshot region clipped).
-- ============================================================================
UPDATE nhdesign3_pages SET content_md = content_md || $md$

## Missing variants captured (repair pass 2026-07-17)

Re-screenshotted the "페이지 내 유의사항 / QV-NM 유의사항 Usage" asset sheet's variant
container `648:7405` (552x494) plus two individual variant symbols (`648:7409`,
`648:7412`) that were overlapped/clipped in the sheet render. All 7 named body
variants of the `유의사항_Content` component are now transcribed, matched
symbol-id -> rendered content by y-position within `648:7405`:

1. `648:7424` Type=심사필, 줄 개수=1줄 (y=30, 320x52) — bold, larger weight:
   "· 심사필에 사용하는 줄입니다.심사필에 사용하는 줄입니다."
   (single logical line; wraps to 2 display lines at the 320px symbol width)
2. `648:7421` Type=심사필, 줄 개수=2줄 (y=88, 320x36) — smaller/regular weight, content doubled across 2 lines:
   "심사필에 사용하는 줄입니다.심사필에 사용하는 줄입니다."
   "심사필에 사용하는 줄입니다.심사필에 사용하는 줄입니다."
3. `648:7415` Type=기본, 줄 개수=1줄 (y=170, 320x52):
   "· 기본 타입으로 일반적인 내용에 사용합니다."
4. `648:7418` Type=당구장, 줄 개수=1줄 (y=226, 320x36) — gray/muted, smaller text, ※(당구장 reference-mark) bullet instead of ·:
   "※ 유의사항 밑에 하위에 들어가는 2Depth용으로 사용합니다."
   => 당구장 type = reference-mark annotation row used as 2nd-depth content under a 유의사항 heading. This resolves what "당구장" means in the variant property.
5. `648:7412` Type=기본, 줄 개수=2줄 (y=276, 320x104) — confirmed via dedicated screenshot, fully visible:
   "· 기본 타입으로 일반적인 내용에 사용합니다."
   "  - 단락이 있으면 해당 줄과 같이 사용합니다."
   (sub-paragraph line uses a "-" dash marker, indented under the · line)
6. `648:7406` Type=기본(강조포함), 줄 개수=1줄 (y=358, 320x52):
   "· 해당 줄은 중요한 텍스트가 있는 경우 사용합니다." — with "중요한 텍스트" rendered bold (강조).
7. `648:7409` Type=기본(강조포함), 줄 개수=2줄 (y=416) — confirmed via dedicated screenshot:
   "· 해당 줄은 중요한 텍스트가 있는 경우 사용합니다." ("중요한 텍스트" bold)
   "  - 단락이 있으면 해당 줄과 같이 사용합니" — final syllable(s) "다." clipped at the
   symbol's render boundary even in the dedicated screenshot; by the identical
   sub-paragraph line in sibling `648:7412` the full text is almost certainly
   "- 단락이 있으면 해당 줄과 같이 사용합니다." but the last character was not
   visually verified (honest residual gap, cosmetic only).

Sheet-level note: on the `648:7405` container render, variant 5's second line and
variant 6 visually overlap (source symbols overlap on canvas: y=276+h104 > y=358) —
this is a canvas-authoring quirk, not a component behavior.

### 풀팝업 second block tail captured (645:6053)

Full-frame screenshot of `645:6053` (rendered 360x658) resolved the previously
clipped bottom of Block 2 ("소제목으로 활용가능"):
- "· 투자자는 금융투자상품(집합투자증권)에 대하여 금융회사로 부터 충분한 설명을 받을 권리가 있으며, 투자 전 (간이)투자설명서 및 집합투자규약을 반드시 읽어보시기 바랍니다"
  — the trailing "바랍니다" is cut by the frame's bottom clip mid-glyph (visible
  through "바랍니" + partial "다"); matches the standard boilerplate line known
  verbatim from NDS_Templates 풀팝업.
- The one remaining content instance after it (`648:7464`) renders as a 1x1 blank
  when screenshotted directly (node appears hidden/invisible) — its text could not
  be captured visually; unchanged honest gap, but it contributes nothing visible
  to the frame.
- Also confirmed in this render: the red risk-highlight span covers
  "자산가격 변동, 환율변동, 신용등급 하락 등에 따라 투자원금의 손실(0~100%)이 발생할 수 있"
  and the 예금자보호 line appears twice, as previously recorded.

### Updated coverage (honest)

- 페이지 내 유의사항 asset sheet body variants: 7/7 transcribed (was ~5/7). One
  cosmetic residual: final "다." of variant 7's sub-line not pixel-verified.
- 풀팝업 Block 2: fully transcribed except hidden node 648:7464 (renders blank).
$md$, reviewed_date=current_date
WHERE source_id=(SELECT id FROM nhdesign3_sources WHERE file_key='uVcmG6GgOl2J8EOlc22wob')
  AND node_id='645:4572';

-- ============================================================================
-- 2) NDS_Templates (1xE0qvn2yv3ZkQ9BwhKT1y) — Text Fields page, node 3760:32774
--    Gap closed: 버튼포함 / 2단 / 복합 / 선택 / Stock variants were identified via
--    full-page thumbnail only. Each instance now screenshotted individually.
-- ============================================================================
UPDATE nhdesign3_pages SET content_md = content_md || $md$

## Missing variants captured (repair pass 2026-07-17)

Fresh get_metadata of canvas `3760:32774` + individual instance screenshots.

### CORRECTION to earlier instance mapping

The earlier pass misattributed Basic-row instances. Correct mapping by canvas
coordinates (Basic row y=-332, columns x=-111 / 729 / 1569 / 2409):
- 기본     = frame `4585:37111`, instance `input_line` `6966:17879` (492x90) — unchanged.
- 버튼포함 = frame `4585:37213`, instance `input_line` `4585:37217` (492x90) — NOT `input_box 4585:37948` as previously recorded.
- 2단      = frame `4585:37274`, instance `input_line` `4585:37278` (492x90) — NOT `4585:37217`.
- 복합     = frame `4585:37339`, instance `input_line` `4585:37343` (492x90) — unchanged.
`input_box 4585:37948` actually lives in the STOCK row (frame `4585:37415`, y=1690).
All four Basic variants are `input_line` (underline style), h=90; the boxed
`input_box` (h=100) belongs to the Stock section only.

### Basic 버튼포함 (instance 4585:37217, 492x90) — screenshot transcription
- Label (top, dark gray): "텍스트 입력"
- Placeholder (light gray, above underline): "힌트 텍스트 입력"
- Right side: a light-gray rounded-rectangle button labeled "버튼명" (disabled-looking
  gray fill, dark-gray text), sitting to the right of the underline field.
- Underline runs under the text area only (stops before the button).

### Basic 2단 (instance 4585:37278, 492x90) — screenshot transcription
- Label (top): "텍스트 입력"
- Two side-by-side field segments, EACH with its own underline and the same
  placeholder: "최대6글자까지" (left) and "최대6글자까지" (right),
  separated by a centered dash "–" between the two segments.
- Use case implied: paired/split entry (e.g. two short codes) with shared label.

### Basic 복합 (instance 4585:37343, 492x90) — screenshot transcription
- Label (top): "텍스트 입력"
- Left segment: a dropdown-style field showing selected value "SKT알뜰폰" with a
  down-chevron (⌄), own underline.
- Middle segment: text field with placeholder "-없이 입력" (i.e. "enter without
  hyphens"), own underline.
- Right side: light-gray rounded button labeled "인증요청".
- => 복합 = dropdown + input + action-button composite (phone-number/carrier
  verification pattern).

### Stock 주문/관심 — both mockups screenshotted
- Left (instance `input_box` `4585:37948`, 492x100): label "텍스트 입력" above a
  rounded-rectangle BOX field (light border, full width) containing placeholder
  "힌트 텍스트 입력".
- Right (instance `input_box` `6990:18284`, 492x100): same label + box field, plus a
  light-gray rounded button "버튼명" to the right of the box (box narrows to make room).
- Confirms the section note: 박스형 (boxed) style is specific to Stock context.

### Certify 선택 (instance `input line_certify` `4585:37838`, 492x80) — screenshot transcription
- Label (top): "텍스트 입력"
- Value row: placeholder "힌트 텍스트 입력" with a down-chevron (⌄) at the far right
  of the underline row — select/dropdown affordance (vs the pencil/edit icon on the
  "입력" variant).
- Same compact 80px height as the Certify "입력" variant.

### Updated coverage (honest)

- All 8 field-variant mockup columns outside the Product section are now
  individually screenshotted and transcribed: Basic 기본/버튼포함/2단/복합,
  Stock 기본 x2, Certify 입력/선택 (was: only 기본 + Certify 입력 + one Product
  instance). Product-section states remain as previously recorded (1 of 6 mockups
  screenshotted directly; helper/error strings from metadata text values).
- Still NOT retrieved: exact color hexes, type tokens, corner radii (would need
  get_design_context / get_variable_defs on the instance ids above).
$md$, reviewed_date=current_date
WHERE source_id=(SELECT id FROM nhdesign3_sources WHERE file_key='1xE0qvn2yv3ZkQ9BwhKT1y')
  AND node_id='3760:32774';

-- ============================================================================
-- 3) NDS_Templates (1xE0qvn2yv3ZkQ9BwhKT1y) — 유의사항 page, node 309:16791
--    Gap closed: 플로팅고정형 / 플로팅고정형_두줄 / 일반_심사필 / 일반_버튼추가 were
--    inventoried via metadata only. Each frame now screenshotted (540x987).
-- ============================================================================
UPDATE nhdesign3_pages SET content_md = content_md || $md$

## Missing variants captured (repair pass 2026-07-17)

Individual 540x987 frame screenshots of the 4 previously metadata-only variants.

### 유의사항_플로팅고정형 (891:25682) — screenshot transcription
- Pink/rose "Contents" placeholder fills the screen body.
- Floating notice bar (light gray strip above the bottom button):
  "ⓘ 유의사항" with a ">" chevron at the right edge.
  NOTE: label is exactly "유의사항" here — no "(default)" suffix (the M.web file's
  equivalent frame shows "유의사항(default)"; the two files differ in this string).
- Bottom action bar: full-width green button "버튼명".

### 유의사항_플로팅고정형_두줄 (891:25699) — screenshot transcription
- Same layout; notice bar carries a 2-line self-documenting rule text:
  "ⓘ 할 말이 많을 경우 최대 두 줄로 제한합니다. 텍스트박스 가로길이 최대 428px"
  with ">" chevron at right; green button "버튼명" below.
- NOTE the width figure: 428px in THIS file (540px-wide template), whereas the
  NDS_M.web asset sheet's floating rule says "텍스트박스 가로 길이 최대 286px" —
  the max-width rule scales per platform/file; do not treat 286px as universal.

### 유의사항_일반_심사필 (891:25189) — screenshot transcription
- Bottom-anchored notice block on white below the pink Contents area:
- Title: "유의사항" with ">" chevron at the right edge (expandable).
- Content rows (3):
  "· 심사필에 사용하는 줄입니다.심사필에 사용하는 줄입니다." — BOLD (심사필 emphasis style)
  "· 해당 유의사항은 스크롤 화면에서 쓰입니다."
  "· 해당 줄은 중요한 텍스트가 있는 경우 사용합니다."
- Matches the M.web 645:6020 equivalent line-for-line.

### 유의사항_일반_버튼추가 (891:25727) — screenshot transcription
- Title: "유의사항" with ">" chevron.
- Content rows (3):
  "· 심사필에 사용하는 줄입니다.심사필에 사용하는 줄입니다.
     심사필에 사용하는 줄입니다.심사필에 사용하는 줄입니다." — BOLD, wraps to 2 lines (doubled copy)
  "· 해당 유의사항은 스크롤 화면에서 쓰입니다."
  "· 해당 줄은 중요한 텍스트가 있는 경우 사용합니다."
- Button below the list: small OUTLINED/ghost button "해지하기" (thin gray border,
  white fill, dark text, left-aligned, hugs its content width — NOT a full-width
  filled CTA). Matches M.web 645:6030's button copy.

### Updated coverage (honest)

- All 7 template frames on this page are now individually screenshotted:
  일반, 일반_심사필, 일반_버튼추가, 플로팅고정형, 플로팅고정형_두줄, 더보기_슬라이딩팝업,
  더보기_풀팝업 (was 3/7).
- Still-open gaps carried over unchanged: exact copy of the last 2 유의사항_Content
  rows in real-example node `13007:912` (ids 13016:1086, 13016:21062) and the
  "금융소비자 확인사항" table cells (`13007:973`) — outside this repair pass's scope.
$md$, reviewed_date=current_date
WHERE source_id=(SELECT id FROM nhdesign3_sources WHERE file_key='1xE0qvn2yv3ZkQ9BwhKT1y')
  AND node_id='309:16791';
