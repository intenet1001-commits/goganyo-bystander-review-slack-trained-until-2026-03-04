---
name: nds-mweb-controls
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=1827-189"
learned_date: 2026-07-15
sections_studied:
  - "1827:189 (page '    - Controls (toggle, switch, check, radio) (진행중)' — 2 top-level frames only, both named '2. Check')"
  - "1828:2421 ('2. Check' frame — on-canvas heading 'M.web Check' / 'Check Design Guide')"
  - "1828:3024 (Frame 125367 — 'SOLID / ndsw_btn_rcheck' export spec + component set)"
  - "1828:3070 (Frame 125368 — 'LINE / ndsw_btn_lcheck' export spec + component set)"
  - "2010:204 ('2. Check' frame, second instance — on-canvas heading 'M.web Radio' / 'Check Design Guide')"
  - "2010:210 (Frame 125367 — 'SOLID / ndsw_btn_radio_(sataus)' export spec + component set)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen) — page is INCOMPLETE, see WIP finding below
---

# NDS M.web — Controls (toggle, switch, check, radio) — page marked (진행중), largely empty

**Headline finding: despite the page name promising four control families (toggle, switch, check, radio), the page contains content for exactly two — check and radio — and even those two are minimal export-spec sheets, not full usage guides.** Enumerated via `figma.root.children` per the learning method; the page (`1827:189`) has only **2 top-level frames**, both literally named `2. Check` (a copy-paste artifact — the second one's on-canvas heading reads "M.web Radio", not "M.web Check"). There is no `1. Toggle`, no `3. Switch`, and no separately-numbered radio frame — the radio content was pasted into a duplicate of the check frame and re-labeled only in the on-canvas title text, not the frame layer name. This is the same frame-layer-name-vs-on-canvas-heading mismatch documented elsewhere in this domain, but here it also affects frame **numbering/sequence**, not just section labels.

A `findAllWithCriteria` sweep of all 95 nodes on the page (frames, groups, instances, components, component sets, text, rectangles, vectors) found **zero hidden nodes and zero nodes matching `toggle`/`switch`/토글/스위치 in any name, visible or hidden**. This isn't a case of content existing-but-hidden — the toggle and switch content simply does not exist anywhere on this page, confirming the `(진행중)` tag is accurate and not just conservative labeling.

## What actually exists: Check (2 variants) and Radio (1 variant), as export specs

Both frames share an identical template: a dark header ("M.web Check" / "M.web Radio", subtitle **"Check Design Guide"** verbatim on both — the radio frame's subtitle was never updated either), then an "Export →" callout with the same three bullet rules on both frames, verbatim:

> Export → `ndsw_btn` (check) / `ndsw_btn_radio` (radio)
> - Size 전달 필수
> - 하나의 애셋을 사용하는 경우 Color hex, Size 전달 필수
> - ndsw 공통처리

Below that, each frame shows one or two labeled swatch rows (a plain instance row, then the actual Figma component-set grid rendered with its standard dashed selection border) — nothing else. No do/don't examples, no touch-area guidance, no state-transition rules, no copy guidance. This page is a **component export spec sheet**, not a usage guide, even for the two families it does cover.

### Check — SOLID (`ndsw_btn_rcheck`)

- Label verbatim: `SOLID` / `ndsw_btn_rcheck`
- Component set node `1828:3029`, **componentSetKey `469c197c5fca304dbb0564d2d931d95d3937f114`**
- Variant axis: **`Status`** only — `normal` / `selected` / `disabled` / `selected-disiabled` (verbatim typo: "disiabled", not "disabled" — consistent across every instance of this axis on the page)
- Size: **34×34px** bare glyph, no nested label, no touch-target wrapper
- The whole SOLID column (header + both swatch rows, node `1828:3024`) renders at **`opacity: 30%`** in the design — visually washed out compared to the LINE variant below. Read as an on-canvas signal that SOLID is draft/placeholder relative to LINE, though the guide states nothing explicit about this; recorded as raw evidence, not interpreted further.

### Check — LINE (`ndsw_btn_lcheck`)

- Label verbatim: `LINE` / `ndsw_btn_lcheck`
- Component set node `1828:3075`, **componentSetKey `a821d596ac029a9d28ec73039fd7cd70c1e558bb`**
- Variant axis: **`Status`** only — `normal` / `selected` / `disabled` / `selected-disiabled` (same typo)
- Size: **34×34px** bare glyph
- This column (node `1828:3070`) has **no opacity reduction** — full 100%, unlike the SOLID column above.
- Only **one example instance** is shown in the top swatch row (vs. two in the SOLID rcheck row) — page is visibly unfinished even within this small section.

### Radio — SOLID (`ndsw_btn_radio`)

- Label verbatim: `SOLID` / **`ndsw_btn_radio_(sataus)`** — typo "sataus" for "status", quoted verbatim as it appears in the layer/text name
- Component set node `2010:219`, **componentSetKey `a47b239fef3ceb42e0affee7f56657dc1c73404f`**
- Variant axis: **`Status`** only — `normal` / `selected` / `disabled` / `selected-disiabled` (same "disiabled" typo)
- Size: **26×26px** bare circle, no nested label
- Same 30%-opacity treatment as the check SOLID column (node `2010:210`).

No LINE variant, no button-row variant, and no other size/height variant exists for radio on this page.

## CORE reference cross-check — none of the five flagged keys are confirmed here

The Core reference in `LEADER.md` lists five component keys this page was expected to be the source of truth for. **All five are contradicted on componentKey, though two match loosely on visual/structural facts:**

| Core reference key | Expected | Found on this page? |
|---|---|---|
| `radio_basic` `91f58f3a086c5ef03ac03c8d77a725d32b3f7a1f` | bare 26×26 circle, no label, Status normal/selected/disabled/disabled-selected | **Key does not appear on this page.** This page's radio component set is a *different* componentKey (`a47b239fef3ceb42e0affee7f56657dc1c73404f`, name `ndsw_ms_btn_radio`) — but it independently **corroborates the shape claim**: also 26×26, also bare (no nested label), also 4 statuses (normal/selected/disabled/selected-disiabled). Read as: the *design fact* (bare 26px circle, 4-state) is confirmed by an independent local component, but this page is not the source of the `91f58f3a…` key itself — that key must live in the published NDS_Library, not in this unpublished page-local component set. |
| `radio_btn` `1a972d991cc7c8f8f97bc5557740fba58ca82f23` (Height h60/h46, Active on/off/disabled) | row-style radio control | **Not found.** No h60/h46 row-style radio exists anywhere on this page — only the bare 26px circle described above. Cannot confirm or contradict the key itself; the *component* it describes simply isn't present here to check against. |
| `toggle_basic` `42cff7468c8000d28635cd9abd7695ce9aabc30b` (Channel, Height h32, Active on/off) | toggle switch | **Not found — page has zero toggle content of any kind** (see headline finding). Cannot confirm or contradict. |
| `check_icon_solid` `3452ebde77d6d2d759f123e422ccee3a6c01b3c4` | bare glyph, no label slot | **Key does not appear.** This page's SOLID check is a different componentKey (`469c197c5fca304dbb0564d2d931d95d3937f114`, `ndsw_ms_btn_rcheck`) at 34×34, variant axis Status only (**no Channel, no Height, no Darkmode axis** — the Core reference's `check_icon_solid` documents Channel/Height(h34/h26)/Status/Darkmode, a materially richer axis set than what's on this page). Confirms the "bare glyph, no label" characterization; contradicts on axis completeness — this page's version looks like a reduced/older or export-only variant, not the full published component. |
| `check_icon_line` `0598f4c21dd68667d15d34875f12c1b3e1176c34` | bare glyph, no label slot | **Key does not appear.** This page's LINE check is `a821d596ac029a9d28ec73039fd7cd70c1e558bb` (`ndsw_ms_btn_lcheck`), Status-only axis (Core reference lists Channel + Status for `check_icon_line` — again missing a Channel axis here). Confirms "bare glyph" characterization only. |

**Interpretation**: this page's `ndsw_ms_btn_*` components read as **unpublished, page-local components built for generating export assets** (see the "Export →" spec text on both frames — `ndsw_btn`, `ndsw_btn_radio`), not as the live, published library components (`radio_basic`, `check_icon_solid`, etc.) that BUILD-mode work should actually instance. They're useful for confirming *visual/structural facts* (sizes, bare-glyph-no-label, 4-state naming pattern) but their componentKeys should **not** be substituted for the Core reference's keys in any BUILD script — those keys must still be sourced from the published NDS_Library.

## Touch-area cross-check (`nds-ux-guide-touch-area.md`)

That guide requires a **≥36px touch box** around a 16–24px check-button icon. Every glyph found here is presented completely bare — no wrapping frame, no touch-target padding, no auto-layout container — at:
- Check SOLID/LINE: 34×34px (icon itself, no touch box)
- Radio SOLID: 26×26px (icon itself, no touch box)

Both **fall short of the 36px touch-box minimum on the icon alone**, and neither has any surrounding touch-target structure at all. This is consistent with the touch-area guide's own gap note (bare glyphs, no label slot) — this page adds no touch-target guidance of its own, so the touch-area guide remains the only source for that requirement. Nothing here contradicts it; it simply doesn't address it.

## Gaps (blank/unverifiable at source)

- **Toggle**: zero content, zero hidden nodes, zero related-name matches anywhere on the page. Not a rendering gap — genuinely absent.
- **Switch**: same — zero content anywhere.
- **Radio row/button style** (`radio_btn`'s h60/h46 Active on/off/disabled): not present on this page in any form.
- No do/don't guidance, no state-transition rules, no accessibility notes, no copy/label rules for check or radio on this page — it is export-spec-only.
- No `Last update` / version stamp found anywhere on the page.
