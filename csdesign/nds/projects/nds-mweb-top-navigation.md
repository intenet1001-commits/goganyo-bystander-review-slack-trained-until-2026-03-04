---
name: nds-mweb-top-navigation
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=317-607"
learned_date: 2026-07-15
sections_studied:
  - "317:607 (page canvas '    - Top Navigation (Header)', single section, no siblings)"
  - "1716:3633 (section '1. Top Navigation_Header', 1340x1519 -- the whole page content)"
  - "1716:3634 (frame 'Frame 123818' -- title block: 'M.web Top Navigation (Header)' / 'Top Navigation (Header) Asset')"
  - "1716:3637 (frame ' ' -- the two on-canvas bullet notes)"
  - "1710:3375 (COMPONENT_SET 'header_basic', 10 variants -- light/dark x 5 right-type configs)"
  - "1731:519 (COMPONENT_SET 'header_stock' [layer name carries a literal backspace char between header_ and stock], 3 variants -- left/right icon combos)"
  - "1730:748 (INSTANCE of header_stock, mainComponent 1731:495 -- override example demonstrating long-title truncation)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen)
---

# NDS M.web -- Top Navigation (Header)

Small, single-section page (1340x1519, one section, no siblings, nothing hidden) documenting the two header component families used across NDS_M.web: `header_basic` (generic screen header) and `header_stock` (stock/quote ticker header). No frame-layer-vs-on-canvas-heading mismatch found on this page -- `Frame 123818`'s text nodes read "M.web Top Navigation (Header)" / "Top Navigation (Header) Asset" and match what's on canvas.

## On-canvas notes (verbatim, `1716:3637`)

Two bullets, plain Korean, no screenshot-embedded images on this page (checked -- `get_screenshot` on the whole section shows only the title block, notes, and the two component grids; nothing else is pasted in):

- "밝은 배경, 어두운 배경 선택가능" (light background, dark background selectable)
- "Component > Fill 에서 배경 컬러를 변경해서 사용하세요" (change the background color via Component > Fill to use it)

This describes how the light/dark modes are meant to be operated: **not** a `Mode` boolean toggle alone controls the look -- the guidance is to override the instance's fill directly under Component > Fill. (The variant set does still expose a `mode` prop -- see below -- so in practice both exist: pick the `Mode=dark` variant *and/or* override Fill; the note doesn't disambiguate which is canonical.)

## `header_basic` -- COMPONENT_SET `1710:3375`

**componentKey found on this page: `d2b2c6f762ae23699a7246b671da753819e9a6c0`**

This does **not match** the Core reference's `header_basic` key (`c95043e94317fde7230298017f42dd8099e1cbdc`, flagged broken as of 2026-07). Two different keys under the same component-set name `header_basic` -- see CORE section below for what this implies.

**Variant axes** (from `get_design_context`'s generated prop types, cross-checked against the 10 on-canvas symbol names in `get_metadata`):
- `mode`: `"light" | "dark"`
- `leftIcon`: boolean (on/off)
- `rightIcon`: boolean (on/off)
- `rightType`: `"기본" | "txt btn" | "two" | "-"` (four distinct values; `"two"` appeared twice in the generated TS union -- a get_design_context codegen artifact, not a real 5th value)

Confirmed 10 instances on canvas (5 light + 5 dark), matching `mode x {leftIcon=on,rightIcon=on,rightType=기본 / leftIcon=on,rightIcon=off,rightType=- / leftIcon=off,rightIcon=on,rightType=기본 / leftIcon=on,rightIcon=on,rightType=txt btn / leftIcon=on,rightIcon=on,rightType=two}` -- i.e. **not a full cartesian product** of the axes (no leftIcon=off x rightType!=기본 example, no rightIcon=off x rightType!="-"  example). Treat the 10 shown as the supported combinations, not proof every axis combination is valid.

**Per-variant on-canvas content, verbatim:**
- All title text nodes read "화면 타이틀명" (placeholder for "screen title name") -- this is a real placeholder convention (matches the pattern of other NDS guide title fields), not a mistranscription.
- The `txt btn` variant's pill button reads "최대4자" (max 4 characters) -- this is the button's own character-budget label baked into the placeholder copy, i.e. the guide is telling you the button text field has a 4-character budget.
- The `two` variant adds a `ndsw_icon_header_tooltip` icon between the title and the close icon (at `left=440px`), in addition to the standard right-side `ndsw_icon_header_close` at `left=490px` -- "two" means two right-side icons (tooltip + close), not two of the same icon.
- Left icon (when present) is `ndsw_icon_header_back` (< chevron); right icon (when present, non-two/non-txt-btn) is `ndsw_icon_header_close` (X).
- Dark mode (`mode=dark`) swaps container fill to `#121212` and text/icon color to white; light mode is white background / black text -- confirmed directly in the rendered screenshot (left column white, right column near-black).

**Token/style refs surfaced by `get_design_context` on this node** (verbatim names): `NM/Default/2.023` (#333333), `NM/Default/1.004` (#000000), `Title/Preten/M/24` (Pretendard Medium 24/34), `NM/Default/6.063` (#FFFFFF), `NM/Default/3.013` (#666666), `Label/Preten/M/15` (Pretendard Medium 15/18), `NM/Grayscale/53.254` (#C3C4C5, the txt-btn pill border). These match `nds-mweb-colors.md`'s decoded `NM/Default/*` grammar exactly (`2.023`=글자 GrayDark, `1.004`=글자 기본, `3.013`=글자 보조, `6.063`=기본글자색White) -- good cross-file confirmation the color-name grammar holds outside the Colors page itself. `NM/Grayscale/53.254` uses the *old* undecoded `NM/Grayscale/<n>.<n>` pattern from the Core reference's NDS_Colors library note, not the `NM/ESS/...` grammar -- so both naming eras coexist in the live file.

## `header_stock` -- COMPONENT_SET `1731:519`

**componentKey found on this page: `17a62257fbeadd0799c4b5b00f832849bc3279ca`**

This does **not match** the Core reference's `header_stock` key (`28c77263cb49ee32b6dc3ab6df216e5887659855`). See CORE section below.

Layer name is literally `header_` + backspace char + `stock` (confirmed via raw JS string read, not a rendering glitch). Cosmetically displays as "header_stock" in most viewers.

**Variant axis**: `leftIcon` / `rightIcon` booleans only (no `mode`/dark variant on this component -- unlike `header_basic`). 3 on-canvas variants: `leftIcon=on,rightIcon=on` / `leftIcon=on,rightIcon=off` / `leftIcon=off,rightIcon=on`. No `leftIcon=off,rightIcon=off` example shown.

**Structure**: a two-line stacked title block (`header_title_txt`) -- line 1 is the instrument name (placeholder "애플" / Apple), line 2 is a `Price` row showing value + signed percent change ("206.66" + "(+3.11%)"), colored `#D73838` (= `NM/ESS/others/1.238`, the 상승/red up-color confirmed in `nds-mweb-colors.md`). Optional `ndsw_icon_header_back` on the left, `ndsw_icon_header_close` on the right, same icon components as `header_basic`.

**Truncation example (`1730:748`, an INSTANCE override, not a base variant):** title text overridden to "MICROS FANG INDEX 2X Exp 8 Jan 2038 ETN X3" (a long real product name) while price/percent stay at the placeholder "206.66 (+3.11%)". The rendered screenshot shows this clipped to "MICROS FANG INDEX 2X Exp 8 Jan 2038 ETN..." with an ellipsis -- confirming the title line truncates with `text-ellipsis` rather than wrapping or overflowing. This is the only deliberately-long-content example on the page and is the clearest evidence of the component's real-world text-overflow behavior.

**Token refs surfaced**: `NM/Default/1.004` (#000000, title text), `Notice/Preten/M/19` (Pretendard Medium 19/26, title), `NM/ESS/others/1.238` (#D73838, price/rate up-color), `Info/Preten/M/18` (Pretendard Medium 18/24, price/rate), `NM/Default/2.023` (#333333). Container fill is `rgba(255,255,255,0.9)` with a 5px backdrop-blur -- a translucent/frosted header, unlike `header_basic`'s opaque fill.

## How this feeds BUILD mode

- Pick `header_basic` for a generic screen header (title + optional back/close/tooltip/txt-btn), `header_stock` specifically for stock/quote-ticker screens (title + live price/rate row, translucent blur background).
- `header_stock` has no dark-mode variant -- don't assume parity with `header_basic`'s light/dark axis.
- Long instrument names in `header_stock` truncate with an ellipsis; don't design copy assuming it wraps.
- The "Component > Fill" note suggests light/dark for `header_basic` may be applied by directly overriding fill on an instance rather than only switching the `mode` variant -- worth trying both if a build needs a background color the variant set doesn't already offer.

## Gaps

- Could not test either componentKey's `importComponentSetByKeyAsync`/instancing behavior from this session -- the file opened **read-only** (`use_figma` returned `"Can't call importComponentSetByKeyAsync in read-only mode"`) for both keys. The on-canvas node data (name, key, variant structure, text/token content) is solid; only the "does it still import/instance cleanly elsewhere" question is unverified here.
- No do/don't usage guidance or written rules beyond the two bullets above -- this page is pure component/asset documentation, not a rules guide like the NDS_UX Guide pages.
- No 4th `leftIcon=off,rightIcon=off` variant shown for either component set -- can't confirm whether that combination is unsupported by design or just unshown.
