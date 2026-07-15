---
name: nds-mweb-pulldown
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=639-3141"
learned_date: 2026-07-15
sections_studied:
  - "639:3141 (page '    - Pulldown (Select) (진행중)' — two top-level frames, no shared container between them)"
  - "639:3181 ('4. Filter select box' frame — on-canvas title 'Filter Select Box' / 'QV-NM Filter Select Box Design Guide'; two labeled groups FILTER and COMBO)"
  - "639:3189 ('filter' symbol group — 7 chip-style pill variants: Type=기본/강조 × Status=normal/selected/disabled, plus split selected-NM/selected-QV)"
  - "1664:653 ('default' group — dropdown open-state mockup: State=normal/active × Item=7개 이하/7개 이상, showing the opened option-list panel)"
  - "1663:3194 (title_ 'combo' caption block — text 'combo' / '드롭다운 내려올때~')"
  - "640:3832 ('1. Line select box' frame — on-canvas title 'Line Select Box' / '개발명 bottom design' / 'QV-NM Line Select Box Design Guide'; two labeled groups BASIC and TXT)"
  - "640:3833 ('select_line' symbol group — 6 underline-style variants: Status=normal/selected/disabled × Type=only select/with label)"
  - "640:3868 ('select_txt' symbol group — 3 bare-text dropdown variants keyed by font size: font=15pt/16pt/18pt)"
status: "IN-PROGRESS at source (page name literally suffixed '(진행중)') — see WIP finding below; treat all specs here as provisional, not final"
---

# NDS M.web — Pulldown (Select) — **IN PROGRESS AT SOURCE**

## FINDING: page marked 진행중 (in progress)

The page's own on-canvas/layer name is **`    - Pulldown (Select) (진행중)`** — Figma's page list carries the `(진행중)` suffix as part of the literal page name, not a separate flag. This is on-canvas evidence, not an inference: the page name itself is the artifact. Per the task's rule, this status is reported prominently and **no gaps below are filled in** — anything not shown on canvas is left blank.

Consistent with in-progress status, the page content itself reads as a **draft component-spec sheet**, not a polished usage guide:
- No do/don't callouts, no numbered 원칙 rules, no usage-context guidance (contrast with e.g. `nds-ux-guide-account-controller`'s 원칙 1–4 structure). Just variant swatches + one-line captions.
- The "Line Select Box" frame's own subtitle literally reads **`개발명 bottom design`** ("dev-name bottom design") — a placeholder/internal label left in place, not a finished title.
- Placeholder body copy is used throughout instead of real content: `가로값 최대는 늘 492입니다.` ("horizontal value max is always 492") on every Line Select Box variant, and `텍스트를 입력하세요` / `텍스트입력` as label/trigger placeholders on Select Txt. These are lorem-ipsum-style stand-ins, not shipped strings — do not quote them as real UI copy in a BUILD pass.
- No component key surfaced for any of these — see CORE section below.

## Structure: two independent frames, no shared container

Unlike other NDS guide pages, this page has **no page-level title frame and no single wrapping section** — `get_metadata` on `639:3141` returns two sibling top-level frames directly on the canvas, `639:3181` ("4. Filter select box") and `640:3832` ("1. Line select box"), each carrying its own title block. The leading numbers ("4.", "1.") don't correspond to on-canvas section numbering elsewhere in the file — consistent with the frame-layer-name-vs-content mismatch documented on other NDS pages, though here the numbers may simply be a draft ordering artifact (further evidence of 진행중 status).

## 1. "Filter Select Box" (frame `639:3181`)

On-canvas title: **"Filter Select Box"**, subtitle: **"QV-NM Filter Select Box Design Guide"**.

### FILTER group (`639:3186`/`639:3189`)

Caption, verbatim: **"상품 등 항목에 대한 필터를 강조에 따라 다르게 사용합니다. 슬라이딩 팝업이 호출됩니다."** ("Filters for items like products are used differently depending on emphasis level. A sliding popup is invoked.")

Column headers on-canvas: **NORMAL / SELECTED / DISABLED**. Two rows of pill-style chip controls, each `[label] ⌄`:

| Type | Status | Label shown | Visual |
|---|---|---|---|
| 기본 (basic) | normal | `기본` | gray outline `#E0E0E0`, gray text `#666` |
| 기본 | selected | `선택됨` | black outline, bold black text |
| 기본 | disabled | `비활성화` | gray outline, faded gray text `#C5C5C5` |
| 강조 (emphasis) | normal | `기본` | gray outline, gray text |
| 강조 | selected-NM | `투자성향` | green outline `#84C13D` / green bold text `#3C9800` |
| 강조 | selected-QV | `투자성향` | orange outline `#FFAA1A` / orange bold text `#FC6E00` |
| 강조 | disabled | `비활성화` | gray outline, faded gray text |

Confirmed via `get_design_context` (React scaffold, not a published component instance — see CORE note below): the component's own prop types are literally `status: "normal" | "selected" | "disabled" | "selected-NM" | "selected-QV"` and `type: "기본" | "강조"`. So **강조+selected is channel-specific** (NM green vs QV orange) while **기본+selected is channel-agnostic** (plain black) — this is the same NM/QV channel divergence documented in `nds-mweb-colors.md`, applied here to a filter-chip selected state instead of a primary CTA. Icon is `nds_icon_filterarrow`, rotated 90°, at 14px.

Tokens sampled directly from the generated code (cross-check against `nds-mweb-colors.md`):
- `NM/ESS/primary/1.272(강조텍스트)` `#3C9800` = 강조 selected-NM text
- `NM/ESS/primary/2.022(대표컬러)` `#84C13D` = 강조 selected-NM border
- `QV/ESS/primary/1.272(강조텍스트)` `#FC6E00` = 강조 selected-QV text
- `QV/ESS/primary/2.022(대표컬러)` `#FFAA1A` = 강조 selected-QV border
- `NM/Default/2.023` `#333333`, `NM/Default/3.013` `#666666`, `NM/Default/5.074(HintText)` `#C5C5C5`, `NM/ESS/line/2.017(박스테두리)` `#E0E0E0` — all match `nds-mweb-colors.md` exactly, no drift.
- Font: `Pretendard` Medium (기본 states) / Bold (선택됨, 강조 states), 18px/24px line-height.

### COMBO group (`1663:3194`/`1664:653`)

Caption, verbatim: **"드롭다운 내려올때~"** ("when the dropdown comes down~") — an informal/draft-sounding caption, another 진행중 signal.

Two side-by-side examples, each a trigger chip `[테마 전체 ⌄]` / `[매그니… ⌄]` opening a stacked option-list panel below it. Confirmed via `get_design_context`:

- Component prop shape: `item?: "7개 이하" | "7개 이상"` (7-or-fewer vs 7-or-more items), `state?: "normal" | "active"` (closed vs open).
- **"7개 이하" (≤7 items) example**: trigger reads `매그니...` (truncated), open panel lists exactly 7 rows: 테마 전체 / 관세 / 체중감량 / 전기차 / 금리 / 매그니피센트 7 / 미국 경제. Panel width 155px, drop-shadow `0px 2px 10px rgba(0,0,0,0.1)`, no visible scroll affordance in the screenshot.
- **"7개 이상" (≥7 items) example**: trigger reads `관세`, open panel adds an 8th row `트럼프` (partially cropped at the bottom edge in the screenshot — "이상" case explicitly triggers a taller/scrollable panel: `h-[336px] overflow-x-clip overflow-y-auto shadow-[0px_2px_20px_...]`, i.e. a stronger shadow and internal scroll once the list grows past a threshold).
- Selected/highlighted row in the open panel (first item, "테마 전체") is bold black (`Pretendard SemiBold`); other rows are `#666` Medium — i.e. the topmost/default option renders visually distinct from the rest, consistent with it being the currently-applied filter.
- Trigger closed-state chip background `#F9F9F9` (`NM/ESS/grayscale/7.051(그레이박스)`, confirmed against `nds-mweb-colors.md`).

**No 7-vs-8 threshold rule is stated in text anywhere on this frame** — the "7개 이하"/"7개 이상" variant names are the only documentation of when the taller/scrolling panel kicks in. Treat the cutoff as **exactly 7 items** (7 = no scroll, 8+ = scroll) since that's what the two example item counts show, but this is inferred from the variant names and example data, not an explicit stated rule — flag as inferred, not verbatim, if a BUILD pass leans on it.

## 2. "Line Select Box" (frame `640:3832`)

On-canvas title: **"Line Select Box"**, with the placeholder-looking subtitle **"개발명 bottom design"**, and design-guide subtitle **"QV-NM Line Select Box Design Guide"**.

### BASIC group (`640:3857`/`640:3833`)

Caption, verbatim: **"보통으로 쓰이는 라인형 콤보입니다. 슬라이딩 팝업이 호출됩니다."** ("The commonly-used line-style combo. A sliding popup is invoked.")

Column headers: **NORMAL** (with sub-caption **"기본값 없는 케이스에서만"** — "only for cases with no default value") / **SELECTED** / **DISABLED**. Two rows: a bare `only select` row and a `with label` row (adds a floating label above the field, e.g. `텍스트를 입력하세요`).

| Status | Type | Text color | Underline | Notes |
|---|---|---|---|---|
| normal | only select / with label | `#C5C5C5` (hint gray) | `#E0E0E0` gray | placeholder-style: value shown in hint color, per NORMAL's own caption this state is **only for cases with no default value** |
| selected | only select / with label | black | **black** underline | value in solid black, bold underline signals active/chosen |
| disabled | only select / with label | `#C5C5C5` | `#E0E0E0` gray, no arrow icon shown in disabled | greyed, non-interactive |

Confirmed via `get_design_context`: prop shape `status: "disabled" | "normal" | "selected"`, `type: "only select" | "with label"`. Arrow icon `nds_icon_arrow`, color axis `03`/`04`/`05` seen across variants (04 = default/normal gray arrow). Value text uses **`NanumBarunGothic Regular`, 24px/34px** (not Pretendard) — the label row above it, when present, uses `NanumBarunGothic Regular` 18px/24px at `#666`. This is a font-family split worth flagging: the FILTER/COMBO group above used **Pretendard**; this Line Select Box group uses **NanumBarunGothic** for the value text. Don't assume one font family applies across the whole page.

Body text on every swatch is the literal placeholder **"가로값 최대는 늘 492입니다."** ("the horizontal value max is always 492") — this is a layout stress-test string (testing max character width), not real copy. Do not quote it as UI copy in a BUILD pass; it exists to visually confirm the 492px-wide text truncation limit implied by the fixed `w-[446px]` text box inside a wider container.

### TXT group (`640:3860`/`640:3868`)

Caption, verbatim: **"텍스트형 콤보입니다. 슬라이딩 팝업이 호출됩니다. 제일 작은 형태는 테이블 헤더에만 사용합니다."** ("A text-style combo. A sliding popup is invoked. The smallest form is used only in table headers.")

Three swatches, keyed by a `font` prop axis rather than status/type: `font: "15pt" | "16pt" | "18pt"`. All three render as bare `텍스트입력 ⌄` (no box, no underline) at different sizes:

| font variant | Family / size / line-height | Stated use |
|---|---|---|
| `18pt` | `NanumBarunGothic Regular`, 18px/24px | general text-combo use (default, not restricted) |
| `15pt` | `NanumBarunGothic Regular`, 15px/20px | **smallest form — per the caption, table-header use only** |
| `16pt` | `Pretendard Medium`, 21px/30px (labelled "16pt" but the rendered size is actually 21px — a naming/value mismatch in the guide itself) | not separately captioned; presumably an intermediate size |

**Font-family split again**: `15pt` and `18pt` use `NanumBarunGothic`; `16pt` uses `Pretendard`. Combined with the BASIC group's split above, **this page mixes NanumBarunGothic and Pretendard within a single component family** without stating a rule for when each applies — this looks like an artifact of in-progress/inconsistent authoring rather than an intentional design decision, consistent with the page's 진행중 status. Flag rather than resolve.

## Special context: relation to other guide files (different fileKey)

Per the task brief, `nds-ux-guide-date-picker.md` and `nds-ux-guide-account-controller.md` live in a **different Figma file** (`nEINCcmC7AVkWSqRkq60y1`, NDS_UX Guide) and are not conflated with this NDS_M.web component-library page. Two relevant cross-references, kept clearly separated by file:

- `nds-ux-guide-date-picker.md`'s **04. 주기 설정 (Recurrence popup)** describes a **"셀렉트박스 선택 시" → 바텀 슬라이딩 팝업** interaction pattern (요일/일자 pickers, closes on selection, no confirm button) that is conceptually the same trigger family as this page's Filter/Line/Txt select boxes ("슬라이딩 팝업이 호출됩니다." appears as the caption on **every** group on this page). Neither guide states the popup's internal layout for a *generic* pulldown (as opposed to the specific 주기/계좌 cases) — this NDS_M.web page is a component-spec sheet for the trigger control only; it does not itself show the sliding-popup content, so it does not fill that gap.
- `nds-ux-guide-account-controller.md`'s **03. 계좌 선택창 가이드** documents 드롭다운 vs 슬라이딩 팝업 as a decision keyed to **controller type** (박스형→드롭다운, 라인형/텍스트형+다중선택→슬라이딩팝업). This page's own COMBO group (`1664:653`) shows an **inline dropdown expanding under the trigger** (not a bottom sheet) for the Filter Select Box's chip trigger — i.e. **this page's own two groups (FILTER's chip-trigger COMBO vs Line/Txt's caption-stated "슬라이딩 팝업")  are internally inconsistent with each other**: the FILTER chip's dropdown opens inline in-place, while every caption on this page (including FILTER's own) says a sliding popup is invoked. This inconsistency is itself further evidence for the page's 진행중 status — the on-canvas mock (inline dropdown) and the written caption (sliding popup) disagree, and nothing on the page resolves that conflict.

## Component/instance identity — no library componentKey found

`get_design_context` was run on all four variant-swatch groups (`639:3189`, `1664:653`, `640:3833`, `640:3868`). None returned a `componentKey`/`importComponentByKeyAsync`-style reference — all four came back as locally-scaffolded React from raw frame/instance trees, the same signature seen on `nds-ux-guide-date-picker.md`'s locally-drawn controls (not on published `NDS_Library` components). **These pulldown/select controls do not appear to be instances of a published NDS_Library component** — consistent with the Core reference's absence of any `pulldown`/`select`/`combo`-named entry in its "Verified component keys" table. This is a real gap: if a BUILD pass needs a select/pulldown control, there is currently no confirmed componentKey to import; build manually from the specs above (chip shape + `nds_icon_filterarrow` for Filter; underline + `nds_icon_arrow` for Line; bare text + `nds_icon_arrow` for Txt), matching the token/font tables recorded here.

## GAPS (blank at source — not filled in)

- **No do/don't rules, no usage-context guidance** (when to pick Filter vs Line vs Txt select) anywhere on this page — contrast with the fully-worked 원칙-based guides in the other NDS_UX Guide file. If usage rules are needed, they are not documented here; do not invent them.
- **7-vs-8-item scroll threshold** for the COMBO group is inferred from variant naming and example counts only, not stated as a rule.
- **Sliding-popup content/layout** is never shown on this page — only the trigger control and (for COMBO) an inline-expanding option list are illustrated. The caption's claim of "슬라이딩 팝업" is unverified/contradicted by the on-canvas COMBO mock (see inconsistency above).
- **No stated rule for the NanumBarunGothic vs Pretendard font split** within this page's own components.
- **`16pt` font variant's actual rendered size (21px) doesn't match its own variant name** — unresolved naming/value mismatch, reported as found, not corrected.
