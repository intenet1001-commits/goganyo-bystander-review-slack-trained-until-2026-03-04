-- nhdesign3 Phase A (2026-07-17): synthesis source, vibe rubric, csdesign knowledge ports,
-- ledger promotions, transcription fix. Applied via `supabase db query --linked -f`.

-- ============ 0. New synthesis source ============
INSERT INTO nhdesign3_sources (file_key, name, source_url, kind, total_pages, learned_pages, learned_date, status)
VALUES ('synthesis-nhdesign3', 'SYNTHESIS — vibe rubric & cross-cutting rules', 'internal://nhdesign3/synthesis', 'guide', 4, 4, current_date, 'complete')
ON CONFLICT (file_key) DO NOTHING;

-- ============ 1. VIBE RUBRIC page ============
INSERT INTO nhdesign3_pages (source_id, node_id, page_name, kebab_slug, naming_convention, content_md, sections_studied, status)
VALUES (
  (SELECT id FROM nhdesign3_sources WHERE file_key='synthesis-nhdesign3'),
  'synthesis:vibe-rubric', 'VIBE RUBRIC — 사람이 만든 것과 구분되지 않기 위한 필수 체크리스트', 'vibe-rubric', 'n/a (synthesis)',
  $md$# VIBE RUBRIC — mandatory checks for human-parity output

Synthesized 2026-07-17 from the 6-auditor audit (blind build-probe fidelity 7.4/10; prior BUILD output
judged "colorless wireframe" by evidence review) + csdesign/nds confirmed samples. Every BUILD must
pass this rubric BEFORE the screenshot-compare gate. Items marked [csdesign] were confirmed by
instance-sampling in csdesign/nds/CORE.md (2026-07); re-verify if stale.

## 1. Canvas
- Build NH MTS/app screens at **540px width**, not 375/390. Every real NDS screen frame is 540 wide;
  app-shell components (quickmenu_basic, 유의사항_하단노출, header_stock) have fixed-px children sized
  for 540 — a 375 frame CLIPS them (looks like mangled Korean text; easy to misdiagnose). [csdesign]

## 2. Typography — channel-scoped (getting this wrong is an instant giveaway)
- **App/MTS (NDS_Library ecosystem): NanumBarunGothic** — Bold for titles/CTAs, Regular for body.
  The Library Typography page defines 36 local text styles, zero Pretendard. Roboto is for numerals
  (amounts, account numbers; e.g. account-row titles are Roboto Medium). [csdesign]
- **M.web (uVcmG6GgOl2J8EOlc22wob): Pretendard** — different platform, different file. Never carry
  Pretendard into app-side builds or Nanum into M.web builds.
- Header title reference: NanumBarunGothic Bold 17 (manual-header recipe, csdesign port page).

## 3. Color — never ship monochrome
- NM brand green **#84C13D** (style NM/ESS/primary/2.022(대표컬러)); QV counterpart **#FFAA1A**.
- Body ink **#333333**; muted secondary **#576078**; box border **#E0E0E0** (code 017,
  NM/ESS/line/2.017); page background **#EBEDF1** (code 297); surface #FFFFFF. [csdesign + M.web Colors]
- The full ~37-token NM/QV hex table lives in the NDS_M.web Colors page row (topic: "colors").
  Caveat: decoded from the M.web file — for app-side use, spot-verify against a rendered instance.
- A build with no NDS green CTA and gray-only chips is the #1 machine-made giveaway (evidence review).

## 4. Spacing & radius anchors
- Card blocks: 40px between groups / 20px internal (NDS_Templates Layout rules); inputs 40px vertical rhythm.
- popup_radio_account corner radius 16px; **bottom CTA buttons are square (0 radius, full-bleed)**. [csdesign]
- Density: NDS screens run DENSER than generic web defaults — when in doubt compare against a real
  screen from a project source, not instinct (evidence review found machine output too loose).

## 5. Copy tone (Korean register)
- **New work (2025+): 해요체** — e.g. "행사 신청이 완료됐어요" (채권권리 행사, 2025-26).
  Legacy screens (공개매수청약, 2023-24) use 합니다체; do not regress to it on new screens.
- Notices: ※ / ⓘ prefixes per the 유의사항 conventions; consent/legal blocks keep 합니다체 legalese.
- **Dates: dot format `YYYY.MM.DD`**, never ISO hyphens (evidence review violation).
- Microcopy must be real Korean UX writing — no literal-translation phrasing, correct spacing (띄어쓰기).

## 6. App-shell & structural must-haves
- **Every top-level screen includes quickmenu_basic** (bottom bar) — recorded BUILD decision; its
  omission was flagged on all prior proto screens.
- 유의사항 notice rows: arrow 〉 only — **never a '더보기' text label** (explicit NDS Don't).
- Status/label chips: use the recorded label_risk / tag color semantics (green only for emphasis
  categories like 배당/유상/매수청구; secondary states gray) — see 국내주식 권리 MASTER page.

## 7. Reference-first rule
- Before building ANY screen, read the nearest human-made screen from a project source
  (공개매수청약 / 국내주식 권리 / 채권권리 행사 MASTER pages) and mirror its density, section order,
  and tone. Component correctness cannot rescue a screen with no human reference.

## Checklist (copy into every BUILD session)
[ ] 540px canvas  [ ] channel-correct font family  [ ] NDS green CTA present where spec'd
[ ] page bg #EBEDF1 / surfaces white  [ ] dot-format dates  [ ] 해요체 register (new screens)
[ ] quickmenu_basic on top-level screens  [ ] no '더보기' next to notices
[ ] density matched to a named human reference screen  [ ] screenshot-compare vs that reference$md$,
  ARRAY['vibe rubric','typography','color','spacing','copy tone','app shell'], 'learned')
ON CONFLICT (source_id, node_id) DO UPDATE SET content_md=EXCLUDED.content_md, reviewed_date=current_date;

-- ============ 2. csdesign token/sampling port ============
INSERT INTO nhdesign3_pages (source_id, node_id, page_name, kebab_slug, naming_convention, content_md, sections_studied, status)
VALUES (
  (SELECT id FROM nhdesign3_sources WHERE file_key='synthesis-nhdesign3'),
  'synthesis:csdesign-token-port', 'PORT — csdesign 검증 토큰/샘플링 방법론 (app-side colors & fonts)', 'csdesign-token-port', 'n/a (synthesis)',
  $md$# Ported from csdesign/nds/CORE.md (confirmed 2026-07; provenance: instance-sampling on live components)

## Why this port exists
nhdesign3's NDS_Library "- Colors" page is a redirect stub ("NDS_Colors 별도 라이브러리" + GO->) whose
target file was never resolved — NDS_Colors is subscribed as a LIBRARY (opaque lk-… library key, not a
design fileKey), so app-side color styles cannot be learned by opening a file. csdesign solved this by
SAMPLING rendered instances. Its confirmed values are ported here; see ledger anchor
`nds-colors-library-unresolved`.

## Sampled tokens (app-side, confirmed on real component instances 2026-07)
- Brand primary green (NM button fill): rgb(0.518, 0.757, 0.239) ≈ **#84C13D**
- Body ink: **#333333** · Muted secondary text: **#576078** · Surface: #FFFFFF
- Headers/buttons font: **NanumBarunGothic** (Bold titles/CTAs, Regular body)
- Labels/body in NDS_Library are **NanumBarunGothic, NOT Pretendard** (36 local text styles, zero
  Pretendard; fontName census: NanumBarunGothic R×66/B×15, Roboto Medium×14/R×9/B×5). Pretendard
  survives only as a raw font inside one published asset (nds_img_market_switcher " 통합").
  **NDS_M.web genuinely uses Pretendard — scope fonts to the file you build against.**
- Account-row title font: Roboto Medium (inside popup_radio_account)
- popup_radio_account radius 16px; bottom CTA buttons 0 radius (square, full-bleed)

## Color style naming decode (from M.web Colors page; verify app-side before relying)
- Pattern: CHANNEL/TIER/semantic/CODE(한글주석) — e.g. NM/ESS/primary/2.022(대표컬러) = #84C13D;
  QV counterpart = #FFAA1A; NM/ESS/line/2.017(박스테두리) = #E0E0E0; background code 297 = #EBEDF1.
- Duplicate codes for the same hex exist across paths (NM/Line/137.017 vs NM/ESS/line/2.017 both
  #E0E0E0; NAMUH/Others/129.001 vs NM/ESS/others/1.238 up/down) — unreconciled; do not treat code
  identity as color identity.

## Sampling methodology (when a color/font is not in any table)
create instance → findAllWithCriteria → read fills/fontName/fontSize → remove instance.
Faster and more reliable than guessing opaque style names (NM/Primary/270.274 …).$md$,
  ARRAY['colors','tokens','fonts','sampling methodology'], 'learned')
ON CONFLICT (source_id, node_id) DO UPDATE SET content_md=EXCLUDED.content_md, reviewed_date=current_date;

-- ============ 3. csdesign structural-defects & recipes port ============
INSERT INTO nhdesign3_pages (source_id, node_id, page_name, kebab_slug, naming_convention, content_md, sections_studied, status)
VALUES (
  (SELECT id FROM nhdesign3_sources WHERE file_key='synthesis-nhdesign3'),
  'synthesis:csdesign-defects-port', 'PORT — NDS_Library 구조 결함 진단 + 수동 헤더 레시피 (csdesign)', 'csdesign-defects-port', 'n/a (synthesis)',
  $md$# Ported from csdesign/nds/CORE.md — library structural defects & workarounds (2026-07-16)

## Diagnostic (audited across 27 sets, exact 1:1): duplicate variant name ⇔ "Component set has existing errors"
When a set throws on import/variant read, look for two children declaring the same variant combo.
Guard EVERY variantGroupProperties read with try/catch — a bulk sweep over NDS_Library crashes without it.

## Known broken sets in NDS_Library (address by node id; keys unusable)
header_title_txt (9864:16724 — root cause of header_basic failures: two variants both named
"2depth 메뉴표시=off, 어두운배경=off"), nds_img_tab_gradation (14449:15313), list_icon (50855:17337),
input_line dup (45112:2329), NM keypad (12003:14703), nds_icon_bullet, ms_btn_memo.
header_basic itself is FINE — it nests header_title_txt (BASIC ×12, OPTIONAL ×6) so instancing throws;
header_stock nests it ×0 and works. Try header_basic first (it worked inside the 국내주식 권리
production file); fall back to the manual header only on actual error.

## Manual header recipe (fallback while header_title_txt is unfixed)
Auto-layout HORIZONTAL, padding L8 R12 T14 B14, itemSpacing 8, counterAxis CENTER;
back icon + title (NanumBarunGothic Bold 17, FILL) + info icon from icon set
19619c9f1fd2e3c2e6515542d0484e651f3f30c6 (variants "Type=back, Color=2, Darkmode=false" / "Type=info, ...").

## Other component gotchas
- popup_radio_account breaks when resized narrow — stack full-width rows (≥330px), never side-by-side.
- radio_basic / check_icon_* are bare glyphs with no label slot — wrap with your own text node.
- A COMPONENT_SET and its variant COMPONENTs carry different keys; importComponentSetByKeyAsync needs
  the SET key. Always report which kind you read (nhdesign3 already enforces the SET→variant 2-step).$md$,
  ARRAY['broken sets','header recipe','gotchas'], 'learned')
ON CONFLICT (source_id, node_id) DO UPDATE SET content_md=EXCLUDED.content_md, reviewed_date=current_date;

-- ============ 4. Copy-tone rule page ============
INSERT INTO nhdesign3_pages (source_id, node_id, page_name, kebab_slug, naming_convention, content_md, sections_studied, status)
VALUES (
  (SELECT id FROM nhdesign3_sources WHERE file_key='synthesis-nhdesign3'),
  'synthesis:copy-tone-rule', 'RULE — 카피 톤 진화: 합니다체(레거시) → 해요체(현행)', 'copy-tone-rule', 'n/a (synthesis)',
  $md$# Copy-tone rule (synthesized 2026-07-17 from project corpus)

The shipped-project corpus shows a deliberate register shift by NH designers/planners:
- 공개매수청약 (2023-24): 합니다체 — "신청합니다", formal legalese consent blocks.
- 채권권리 행사 (2025-26): **해요체** — "행사 신청이 완료됐어요".

**Rule for new builds: default to 해요체 for user-facing flow copy** (completion, guidance, empty
states), keep 합니다체 for legal/consent blocks and formal notices. This was present in the raw data
but never stated as a rule; an agent defaulting to 합니다체 everywhere produces 2023-vintage tone —
a subtle but real "not current house style" giveaway.
Related: dates always dot format YYYY.MM.DD; notices ※/ⓘ; see vibe-rubric page.$md$,
  ARRAY['copy tone','register','해요체'], 'learned')
ON CONFLICT (source_id, node_id) DO UPDATE SET content_md=EXCLUDED.content_md, reviewed_date=current_date;

-- ============ 5. Topics for the synthesis pages ============
INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT 'VIBE RUBRIC — 필수 빌드 체크리스트 (canvas 540, fonts, colors, tone, app shell)',
       ARRAY['vibe','바이브','rubric','체크리스트','checklist','build quality','540px','canvas','밀도','density'],
       ARRAY[(SELECT id FROM nhdesign3_pages WHERE node_id='synthesis:vibe-rubric')]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic LIKE 'VIBE RUBRIC%');

INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT 'App-side color tokens & fonts (ported csdesign samples: #84C13D, NanumBarunGothic)',
       ARRAY['color','컬러','색상','hex','token','토큰','font','폰트','NanumBarunGothic','Pretendard','Roboto','#84C13D','sampling'],
       ARRAY[(SELECT id FROM nhdesign3_pages WHERE node_id='synthesis:csdesign-token-port')]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic LIKE 'App-side color tokens%');

INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT 'NDS_Library structural defects + manual header recipe (ported csdesign)',
       ARRAY['broken set','component set has existing errors','header_basic','header_title_txt','manual header','duplicate variant','try/catch'],
       ARRAY[(SELECT id FROM nhdesign3_pages WHERE node_id='synthesis:csdesign-defects-port')]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic LIKE 'NDS_Library structural defects%');

INSERT INTO nhdesign3_topics (topic, keywords, page_ids)
SELECT '카피 톤 규칙 — 해요체 현행 / 합니다체 레거시',
       ARRAY['copy tone','카피','톤','문체','해요체','합니다체','microcopy','마이크로카피','UX writing'],
       ARRAY[(SELECT id FROM nhdesign3_pages WHERE node_id='synthesis:copy-tone-rule')]
WHERE NOT EXISTS (SELECT 1 FROM nhdesign3_topics WHERE topic LIKE '카피 톤 규칙%');

-- ============ 6. Ledger promotions ============
INSERT INTO nhdesign3_ledger (anchor, title, description, status)
VALUES ('supabase-cli-concurrent-auth-race-2026-07-17',
  'Concurrent `supabase db query --linked` calls from parallel agents break the shared login role',
  'During the 2026-07-17 audit workflow, 6 parallel agents each running `supabase db query --linked` raced the CLI''s temp login-role initialization; each rotated the credentials out from under the others (SASL: password authentication failed for cli_login_postgres), producing endless retry loops and zero completions for ~1h. REMEDIATION (now the required pattern): the orchestrator dumps needed tables to local JSON once, parallel agents read the dump and emit SQL files, the orchestrator applies them serially with `db query --linked -f`. Never let >1 concurrent process invoke supabase CLI against this project.',
  'open')
ON CONFLICT (anchor) DO NOTHING;

INSERT INTO nhdesign3_ledger (anchor, title, description, status)
VALUES ('nds-colors-library-unresolved',
  'NDS_Colors is a subscribed LIBRARY (opaque lk-… key); its file was never learned — app-side hexes ported from csdesign sampling instead',
  'NDS_Library "- Colors" page is a redirect stub ("NDS_Colors 별도 라이브러리" + GO->) whose target fileKey is unresolved (csdesign hit the same wall; the library key lk-a53c…ea9b is not a design fileKey). App-side color truth therefore rests on (a) the M.web Colors ~37-token hex table and (b) csdesign''s instance-sampled values ported to the synthesis source (csdesign-token-port page). If the NDS_Colors file URL ever surfaces, learn it as a 14th source and reconcile.',
  'open')
ON CONFLICT (anchor) DO NOTHING;

INSERT INTO nhdesign3_ledger (anchor, title, description, status)
VALUES ('floating-notice-width-conflict-428-286',
  '유의사항 floating textbox max width: 428px (NDS_Library) vs 286px (NDS_M.web) — unreconciled',
  'Cross-source numeric conflict recorded during learn passes but never promoted: the floating 유의사항 textbox max width differs between the app library (428px) and M.web (286px). Plausibly a platform difference, but unverified. Until reconciled, scope the number to the channel you are building for.',
  'open')
ON CONFLICT (anchor) DO NOTHING;

-- ============ 7. Transcription fix (audit: 1 contradicted claim of 54) ============
UPDATE nhdesign3_pages
SET content_md = replace(content_md, '탬플릿 보러가기', '템플릿 보러가기'), reviewed_date = current_date
WHERE node_id = '2439:38'
  AND source_id = (SELECT id FROM nhdesign3_sources WHERE file_key='nEINCcmC7AVkWSqRkq60y1')
  AND content_md LIKE '%탬플릿 보러가기%';
