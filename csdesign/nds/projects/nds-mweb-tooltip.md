---
name: nds-mweb-tooltip
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=649-11392"
learned_date: 2026-07-15
sections_studied:
  - "649:11392 (page '    - Tooltip  툴팁  (진행중)' — single content frame '1. Tooltip' plus one loose 'Polygon' component-set frame)"
  - "649:11397 ('1. Tooltip' — page header 'Tooltip' / 'QV-NM Tooltip Design Guide' + section heading + the tooltip demo frame)"
  - "649:11398 ('tooltip' — component set: 6 variants, axes Type=NM|QV, Status=notitle|normal|complex)"
  - "649:11503 ('Polygon' — component set: 4 variants, axes Type=up|down, Channel=NM|QV; doubles as the tooltip's colored pointer/caret)"
sections_studied_gaps:
  - "No other frames on the page besides the one studied — this is a small, single-topic page."
status: "WIP — page name itself is tagged (진행중) on-canvas. See FINDING below."
---

# NDS M.web — Tooltip 툴팁 (진행중 / work-in-progress)

## FINDING: page is explicitly marked in-progress

The page's own name in the Figma page list is:

```
    - Tooltip  툴팁  (진행중)
```

`진행중` = "in progress" (verbatim, on-canvas evidence: the page-list label itself, confirmed via `figma.root.children` enumeration per the `figma-learn-all-pages` method). This is reported as a finding per instruction, not filled in. The content that does exist (below) reads as a small, self-contained spec — 6 tooltip variants plus a shared pointer asset — but nothing on the page states whether more variants (states, positions, dismiss behavior, animation) are still to come. **Do not assume 6 variants is the final/complete set.** Nothing else on the page hints at what's missing; there is no "TBD" placeholder frame, no `논의` marker, no empty variant slot — the in-progress signal is the page name alone.

## Page structure

One content frame, `1. Tooltip` (`649:11397`, 1502×1175), containing:

- Page header: text "Tooltip" (`649:11444`, Bold ~48px look in screenshot — exact style not sampled, dark charcoal card background) + subtitle "QV-NM Tooltip Design Guide" (`649:11445`, verbatim) + a divider line (`649:11446`).
- Section heading: frame `title` (`649:11447`) containing text node named `tooltip` (`649:11448`) whose literal `characters` are lowercase **"tooltip"**; it renders as **"TOOLTIP"** on canvas via an all-caps text style — confirmed by screenshot, not a layer-name/content mismatch (the underlying string is unmodified, only display casing differs). Worth flagging per this skill's "layer names lie" rule even though in this specific case the *characters* do match — the *rendered* text does not match the raw string, which is the same trap in a different shape.
- The `tooltip` component set (`649:11398`) — six variants laid out in a 3-column grid on canvas (NM column, QV column beside it per pair — actually laid out as: col1 = NM-notitle/QV-notitle stacked; col2 = NM-normal/QV-complex... see exact screenshot-verified column/row placement below).
- A second, separate component set named `Polygon` (`649:11503`) sitting below/beside the main frame — the small colored caret/pointer glyph used atop each tooltip bubble.

Only one topic on this page: no do/don't examples, no usage-rule prose, no dismiss/interaction-timing notes, no positioning rules (left/right/top/bottom placement) — the entire page is the variant swatch grid.

## Component: `tooltip` (component set, node `649:11398`)

Two independent variant axes, six variants total:

| Variant (on-canvas layer name) | node id | size |
|---|---|---|
| `Type=NM, Status=notitle` | `649:11404` | 290×75 |
| `Type=NM, Status=normal` | `649:11853` | 290×121 |
| `Type=NM, Status=complex` | `649:11900` | 291×133 |
| `Type=QV, Status=notitle` | `649:11820` | 290×75 |
| `Type=QV, Status=normal` | `649:11874` | 290×121 |
| `Type=QV, Status=complex` | `649:11937` | 291×133 |

`Type` = channel (`NM` = 나무/Namuh, `QV` = QV) — consistent with the `Channel` axis documented for colors/components elsewhere in this domain, though here the property is literally named `Type` not `Channel` (don't assume the axis name is always `Channel`). `Status` = content density: `notitle` (body copy only, no heading) → `normal` (bold title + body paragraph) → `complex` (bold title + up to 3 bulleted list rows).

### Copy, verbatim (from `get_design_context`, cross-checked against the screenshot)

- **NM / notitle** body: "툴팁에 타이틀 없이 들어가는 툴팁의 형태입니다. 툴팁에 타이틀 없이 들어가는 툴팁의 형태입니다. "
- **QV / notitle** body: identical string to NM/notitle (verbatim copy-paste placeholder, not channel-specific copy).
- **NM / normal** title: "나무 툴팁 타이틀"; body: "툴팁에 들어가는 내용의 텍스트입니다.툴팁에 들어가는 내용의 텍스트입니다.툴팁에 들어가는 내용의 텍스트입니다.툴팁에 들어가는 내용의 텍 길이는 3줄까지" (note: literal placeholder text is itself truncated/glitchy mid-word — "내용의 텍 길이는 3줄까지" reads as a cut-off "텍스트" — this is placeholder-lorem quality, not a deliberate line-length example, though the phrase does describe the **3-line max** rule for this variant).
- **QV / normal** title: "QV 툴팁 타이틀"; body: same placeholder string as NM/normal, same mid-word truncation artifact.
- **NM / complex** title: "나무 툴팁 타이틀"; three bullet (`·`) rows, each: "툴팁 내용이 들어가는 내용의 텍스트 박스입니다." (all three rows identical copy — a placeholder repeat, not three distinct examples).
- **QV / complex** title: "QV 툴팁 타이틀"; same three identical bullet rows as NM/complex.

**All body/bullet copy across both channels is verbatim-identical Lorem-style placeholder text** — the guide does not demonstrate channel-specific wording, only channel-specific *color*. Treat every string above as a filler example, not real product copy to reuse literally.

### Structure per variant

- Rounded rect (6px corner radius), 1px solid border, background fill, 16px padding, column layout, gap 6px between title and body when both present, content top offset 7px (leaves room for the caret above).
- `notitle`: single paragraph only, Pretendard Medium 18/24.
- `normal`: title (Pretendard Bold 21/30, black) + one paragraph (Pretendard Medium 18/24, colored — see token table below).
- `complex`: title (Pretendard Bold 21/30, black) + up to 3 bullet list rows (Pretendard Medium 18/24, `#333333`), each row prefixed with a literal `·` character glyph (own small text node, not a CSS list-style).
- A `Polygon` instance is placed at `left:26px, top:0, size 16×8` on every variant — the pointer/caret — but **only visually present for QV** per the generated code (`channel={type === "QV" ? "QV" : undefined}`); NM variants pass no explicit channel prop, defaulting inside `Polygon` to `NM`. Functionally every variant gets a caret; the prop-passing just looks asymmetric in the generated code.

### Colors used (verbatim style names + hex, from `get_design_context`)

| Channel | Role | Style name | Hex |
|---|---|---|---|
| NM | Tooltip background | `NM/ESS/primary/5.273(툴팁배경)` | `#F9FDF4` |
| NM | Border / caret | `NM/ESS/primary/2.022(대표컬러)` | `#84C13D` |
| NM | Title text | `NM/Default/1.004` | `#000000` |
| NM | Body text (notitle status only) | `NM/Default/2.023` | `#333333` |
| NM | Body text (normal status) | `NM/Default/3.013` | `#666666` |
| NM | Complex-status bullet text | `NM/Default/2.023` | `#333333` |
| QV | Tooltip background | `QV/ESS/primary/5.273(툴팁배경)` | `#FFF9F0` |
| QV | Border / caret | `QV/ESS/primary/2.022(대표컬러)` | `#FFAA1A` |

**This directly confirms and extends `nds-mweb-colors.md`'s NM-primary-group table**, which already recorded `NM/ESS/primary/5.273(툴팁배경)` = `#F9FDF4` with Korean role "Mydata_툴팁 배경색" (Mydata tooltip background color) — this page is the literal usage site that role text was describing, and adds the QV counterpart (`#FFF9F0`) plus the border/caret token (`2.022(대표컬러)`, the brand color already documented as NM green / QV orange) and confirms the same disabled-adjacent primary tokens are reused here rather than a dedicated tooltip-only color pair.

Text styles used: `Body/Preten/B/21` (Bold, 21px/30, titles), `Info/Preten/M/18` (Medium, 18px/24, body/notitle), `Info/Preten/R/18` (Regular, 18px/24 — appears in the style list but the sampled paragraphs above read as Medium; the guide's own style-list output includes both Regular and Medium 18px entries, so don't assume every 18px run is Medium without checking the specific node).

## Component: `Polygon` (component set, node `649:11503`)

Four variants — this is a **shared asset**, not tooltip-exclusive:

| Variant | node id | size |
|---|---|---|
| `Type=up, Channel=NM` | `649:11504` | 14×8 |
| `Type=down, Channel=NM` | `649:11790` | 16×8 |
| `Type=up, Channel=QV` | `649:11778` | 16×8 |
| `Type=down, Channel=QV` | `649:11802` | 14×8 |

Screenshot (`649:11503`) shows two green up-triangles side by side (NM/QV) and two down-triangles below (colored, rotated 180° per code — `down` reuses the `up` glyph asset rotated, not a separate drawn shape, for `NM`/`QV` respectively; QV-down additionally swaps to its own image asset per the code, `imgObject2` vs the shared `imgObject1`).

**Cross-domain note**: this component's `Type=up/down` naming and its role match the market up/down (상승/하락) triangle convention already documented in `nds-ux-guide-updown-notation` (sibling NDS_UX Guide project) and the hex values in `nds-mweb-colors.md` (`상승 #D73838`, `하락 #247EF2`, per that page's Essential-others group). **However, the actual small triangle glyphs rendered here are not colored via the up/down red/blue hexes** — in the tooltip usage they're recolored to the NM green / QV orange brand tokens as a pointer/caret, not as a rate-change indicator. Same component, two different semantic uses (market-direction glyph vs. tooltip caret) — do not assume `Polygon`'s color always maps to the 등락 convention; check usage context.

## Gaps found at source (per method: report, don't fill)

- **Page marked `(진행중)`** — see FINDING above. Primary gap.
- No usage rules: no guidance on tooltip trigger (tap/hover/press-and-hold), dismiss behavior, auto-hide timing, positioning relative to anchor (only a single fixed top-left caret position is shown, no bottom/right/left-pointing variants).
- No max-width/responsive rule beyond the "3줄까지" (up to 3 lines) phrase embedded in placeholder copy for `normal` status — this is not a formally stated rule, just a hint inside filler text.
- No dark-mode counterpart shown on this page (unlike the Colors page, which documents `NDS_Darkmode Colors` as a separate library).
- No component key was retrievable for `tooltip` or `Polygon` via `get_design_context` (it returns generated React/Tailwind code + style names, not `componentKey`/`importComponentSetByKeyAsync` keys) — BUILD-mode work needing the actual importable key should run `search_design_system` or `get_libraries` against this file separately; this note only has node IDs, not resolvable component keys.
