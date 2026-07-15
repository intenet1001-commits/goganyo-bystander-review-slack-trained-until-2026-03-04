---
name: nds-mweb-dialog
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=572-616"
learned_date: 2026-07-15
sections_studied:
  - "572:616 (page '    - Dialog (snack bar, toast message)' — canvas holds exactly two sibling mockup frames, both named '[NM] Screens'. No other content on the page.)"
  - "572:617 ('[NM] Screens' #1 — full mobile screen mockup: statusbar + header_basic + a plain toast, no leading icon, sitting above btn_bottom_page)"
  - "572:726 (frame 'toast_basic' inside #1 — plain frame, NOT a component instance, containing one TEXT node '에러메시지를 표시합니다')"
  - "578:730 ('[NM] Screens' #2 — same screen mockup, toast variant WITH a leading icon)"
  - "578:735 (frame 'toast_basic' inside #2 — plain frame containing an nds_icon_banginfo instance + the same TEXT string)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen)
---

# NDS M.web — Dialog (snack bar, toast message)

Despite the page name promising both **snack bar** and **toast message** patterns, the actual canvas content on this page shows **only the toast pattern, in two visual variants** (no leading icon / with leading icon). There is no snackbar example (message + text button) anywhere on this page — no hidden frames, no additional sections. `get_metadata` on `572:616` returns exactly two top-level frames and nothing else; this page is a compact two-screen mockup reference, not a rules document.

## The two mockups (verified via screenshot)

Both are full mobile screens: statusbar → `header_basic` (back arrow + "화면 타이틀명" title + dropdown chevron) → empty content area → a floating dark toast pill positioned just above a green `btn_bottom_page` primary CTA ("버튼명" placeholder text).

| Frame | Toast content | Toast width |
|---|---|---|
| `572:726` | Text only: `에러메시지를 표시합니다` | 275px |
| `578:735` | Icon (`nds_icon_banginfo`) + text: `에러메시지를 표시합니다` | 299px |

**Toast copy is verbatim identical in both**: `"에러메시지를 표시합니다"` ("Displays an error message" — itself a placeholder/example string, not real product copy).

## `toast_basic` is a plain frame, not a real component

**Confirmed via `use_figma`**: both `toast_basic` frames (`572:726`, `578:735`) are Figma type `FRAME`, and `page.findAllWithCriteria({types:["COMPONENT","COMPONENT_SET"]})` on this page returns **zero results**. There is no `toast_basic` component instance anywhere on this page — it's hand-drawn (rounded rect + text, and in the second variant + icon instance), exactly matching the `nds-ux-guide-nudge` note that `toast_basic` is "a layer/instance name seen on canvas, not yet confirmed as a library componentKey." This page does not resolve that gap either — no component exists here to key off of.

### Visual spec (from `get_design_context`, verbatim style names)

- Container: `border-radius: 50px` (fully rounded pill), `padding: 8px 20px`, fill `rgba(48,48,52,0.9)` = style **`NM/Grayscale/109.301` (`#303034`) at 90% opacity**.
- Text: white, style **`Title/Preten/R/24`** = Pretendard Regular, size 24, lineHeight 34, letterSpacing 0.
- Icon variant only: `nds_icon_banginfo` instance, `Color=5, Height=h22` variant, rendered at 18×18px, `gap: 6px` between icon and text (auto-layout `content-stretch flex gap-[6px] items-center justify-center`).

No numeric annotation, no duration text, no character-count text, no snackbar button appears anywhere in either mockup or in the metadata tree.

## Real componentKeys used in this page's screen chrome (new finds vs Core reference)

Fanned out via `use_figma` + `getMainComponentAsync()` on every INSTANCE under both top-level frames. All resolve identically on both mockups (same screen chrome, reused):

| Component | componentSetKey | Variant used here | Note |
|---|---|---|---|
| `statusbar` | `cd20876126ad16ac337802cb72d4e46423b45171` | `Type=NM, Dark mode=off` | Not in Core reference — new. |
| `header_basic` | **`7888c4556b44006dcde2d2c97a9b0d3f03455f08`** | `Channel=NM, Left Icon=on, Right Icon=off` | **Different key from the Core reference's `header_basic` (`c95043e94317fde7230298017f42dd8099e1cbdc`, noted there as "Broken as of 2026-07").** This page's `header_basic` instance is a live, working instance with a distinct componentSetKey. Either the Core reference's key is stale/superseded, or two `header_basic` components coexist in the library. Flagging for Core reference reconciliation — don't assume the "broken" key is the only one. |
| `nds_icon_header` | `19619c9f1fd2e3c2e6515542d0484e651f3f30c6` | `Type=back, Color=2` | **Matches Core reference exactly** — same key. Cross-confirms that entry. |
| `header_title_txt` | `831b44babe0e180f6782f3800745a3898963c2bb` | `2depth 메뉴표시=on, 어두운배경=off` | Not in Core reference — new. The header title component, nested inside `header_basic`. |
| `nds_icon_arrow` | `dde648604e4d08cc6b99c44dda81ec73ccbb4b15` | `Color=04, Type=down, Height=h24` | **Matches Core reference's "more recently updated" `nds_icon_arrow` key exactly**, used here as the header's dropdown chevron (`Type=down`), distinct from the `Type=right` chevron use noted in the nudge guide. |
| `btn_bottom_page` | `ac750203c6f70a9932cdd521293fce8e1d2a8b22` | `Channel=NM, Type=1-btn, Status=normal` | **Not the same component as Core reference's `btn_bottom_page_assets`** (`0fc4758ec4ab4c83ad6052748c3dabf76d0542e8`) — this page uses a sibling/alternate component literally named `btn_bottom_page` (no `_assets` suffix), same variant axis names (`Channel`, `Type`, `Status`). New key, worth noting as a possible duplicate/renamed component in the library. |
| `nds_icon_banginfo` | `b4d2ea50bb6eae5ec8e3786a8ead24bd79bcecaf` | `Color=5, Height=h22` | New. The toast's leading info/warning icon — an outlined circle-info glyph (confirmed via screenshot). Not previously documented anywhere in this domain. |

## How this feeds BUILD mode

- If a BUILD pass needs a toast, there is **no real component to instance** — build it manually as a rounded pill (`border-radius: 50px`, fill `NM/Grayscale/109.301` at 90% opacity, `Title/Preten/R/24` white text, optional `nds_icon_banginfo` leading icon at 18px with 6px gap), following this page's exact visual spec.
- **This page contributes no snackbar (button) reference at all** — for snackbar layout/behavior rules, use `nds-ux-guide-nudge` (the UX Guide rules doc), not this file.
- Confirm before reuse: `header_basic`'s componentSetKey here (`7888c4556b44006dcde2d2c97a9b0d3f03455f08`) differs from the Core reference's — try this key first since it's confirmed live/working on this page, and update the Core reference if it supersedes the older one.

## GAPS — explicit

- **Toast 최대 글자수 (`nds-ux-guide-nudge`'s `논의`/under-discussion blank): NOT resolved by this page.** No character-count spec, annotation, or discussion text appears anywhere in this page's metadata or screenshots — only two example toast strings, both identical (`에러메시지를 표시합니다`, 12 characters), which is too thin a sample to infer a limit from.
- **Snackbar 지속 시간 (blank in `nds-ux-guide-nudge`): NOT resolved by this page.** This page contains no snackbar example at all (no message+button pattern), so there is nothing here bearing on duration.
- Both blanks remain open — do not invent values from this page; escalate per `nds-ux-guide-nudge`'s existing guidance.
