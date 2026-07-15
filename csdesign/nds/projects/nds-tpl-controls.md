---
name: nds-tpl-controls
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=6936-17455"
learned_date: 2026-07-15
sections_studied:
  - "6936:17455 (page '    - Controls (toggle,switch, check, radio)' — a canvas of real composed screen templates, not an export-spec sheet)"
  - "25279:11663 ('✅ 보안키보드 진동 설정_진동없음' frame — screenshotted, on-canvas heading '보안키보드 진동 설정')"
  - "25279:11669 ('list' child frame — row pairing label '보안키보드 진동' with a live `toggle_basic` instance)"
  - "25279:7995 / 25279:11733 ('✅발행어음 모으기_금액 선택' instances — each contains a `toggle_basic` + `check_icon_solid` instance)"
  - "25279:8330 ('✅ NM_보안키보드 진동설정_진동없음' instance — third `toggle_basic` usage)"
status: internal NDS component-library guide — page is a real usage-template canvas, sparse but genuine (not a stub)
---

# NDS Templates — Controls (toggle, switch, check, radio)

Unlike NDS_M.web's identically-named page (blank export-spec stub, 2 frames both mislabeled `2. Check`), this NDS_Templates page is **real, composed product screens** using live control components — a "settings" screen (보안키보드 진동 설정) and several 금액 선택/계산기 popups. `get_metadata` on `6936:17455` returned the full canvas directly (no overflow): 15 top-level items (instances, symbols, one expanded frame), all real screens, no section-header scaffolding.

## Layer-name convention — confirmed reliable [screenshot-verified]

Screenshotted `25279:11663` (downloaded via curl, read as PNG). The frame's layer name `✅ 보안키보드 진동 설정_진동없음` **matches** its on-canvas heading "보안키보드 진동 설정" exactly (module name + state suffix). Unlike the M.web sibling page (frame-name-vs-heading mismatches, misleading `2. Check` duplicate naming) and the UX Guide (numbering mismatches), **this page's names are trustworthy** — verdict: **reliable**. The `✅` prefix itself appears to be the designer's own "done/approved" marker, consistent with this being finished content rather than WIP.

The screenshot shows a real iOS-style pill toggle (rendered off/grey) next to the label "보안키보드 진동", directly under a back-chevron header "보안키보드 진동 설정", with a footer callout card ("보안키보드란?") below.

## Component sweep — 382 nodes scanned (all types, incl. hidden), regex `toggle|switch|check|radio|토글|스위치|체크|라디오`

6 matches, all live instances (no hidden matches, no COMPONENT/COMPONENT_SET definitions on this page — only INSTANCEs of remote components):

| Instance | Main component variant | mainComponentKey | remote | Parent SET name / key |
|---|---|---|---|---|
| `toggle_basic` (×4 instances: in `25279:11669` list row, inside `25279:7995`, `25279:11733`, `25279:8330`) | `Channel=NM, Height=h32, Active=on` (3×) / `Active=off` (1×, the visible screenshot row) | `225034975893f7907e883f8860158ef7375f3411` (on) / `807c0bafd46087611faec0b84445be5019966393` (off) | **true** | `toggle_basic` / **`42cff7468c8000d28635cd9abd7695ce9aabc30b`** |
| `check_icon_solid` (×2, inside `25279:7995`, `25279:11733`) | `Channel=NM, Height=h26, Status=normal` | `7078b6e2024a2c646e85d32b922cf113f35c97cb` | **true** | `check_icon_solid` / **`3452ebde77d6d2d759f123e422ccee3a6c01b3c4`** |

Format per instructions: `toggle_basic = 42cff7468c8000d28635cd9abd7695ce9aabc30b (SET, remote=true)`; `check_icon_solid = 3452ebde77d6d2d759f123e422ccee3a6c01b3c4 (SET, remote=true)`; the individual variant COMPONENT keys used in-scene are `225034975893f7907e883f8860158ef7375f3411` (toggle on) / `807c0bafd46087611faec0b84445be5019966393` (toggle off) and `7078b6e2024a2c646e85d32b922cf113f35c97cb` (check normal).

## ANSWERS to the assigned open question

- **`toggle_basic` EXISTS here and is CONFIRMED against Core**: parent SET key `42cff7468c8000d28635cd9abd7695ce9aabc30b` **matches Core's `toggle_basic` key exactly**. `getMainComponentAsync().remote === true` — this is the real, published NDS_Library component, not a page-local scaffold. **This proves the Core reference key is real and that M.web's absence of toggle was a genuine gap in that file, not a naming/discovery miss** — the component does exist in the subscribed library and NDS_Templates consumes it live.
- **`check_icon_solid` also confirmed**: SET key `3452ebde77d6d2d759f123e422ccee3a6c01b3c4` matches Core exactly, `remote: true`.
- **Literal "switch" does NOT exist as a separate component/instance** on this page — no node name or component matched `switch`/스위치 in the 382-node sweep. `toggle_basic` (rendered as an iOS-style pill) is the only toggle-family control present; the page name's "switch" appears to be a synonym for the same toggle, not a distinct control. Consistent with Core, which also lists no separate `switch_*` key.
- **`radio_basic`, `radio_btn`, `check_icon_line` — NOT found on this page.** Zero matches in the sweep (0 nodes named radio/라디오, 0 additional check_icon_line instances). This page happens to only compose screens that use toggle + solid-check; it does not cover the other 3 of Core's 5 keys. Absence here is a coverage gap of *this specific canvas' example screens*, not evidence the components don't exist — unlike M.web's page, which affirmatively proved toggle/switch absent via an exhaustive 95-node sweep of a page that was *supposed* to contain them structurally (labeled sections). Here there were never "sections" to check — it's simply a handful of unrelated demo screens that didn't happen to use radio or check_icon_line.

## Touch-area cross-check (`nds-ux-guide-touch-area.md`)

That guide requires a **≥36px touch box** around a 16–24px check-button icon. The `check_icon_solid` instances here render at `Height=h26` (26px icon) per their variant name, inside composed screens (not bare glyphs on an export sheet) — but this page provides no visible touch-target wrapper around them either; the instance itself carries no padding/hit-area beyond the icon bounds observed in metadata (`width="540" height="1374"` is the containing screen frame, not a touch box for the icon). **No contradiction with the touch-area guide, but no confirmation of compliance either** — this page doesn't demonstrate a ≥36px tappable wrapper around the check icon, consistent with the guide's own gap note that `check_icon_*`/`radio_basic` ship as bare glyphs with no label/touch-target slot (Core reference gotcha #3). Agreement: both sources independently describe these controls as bare, unwrapped glyphs — the guide states the *requirement*, this page and M.web both show the *component itself* doesn't fulfill it out of the box, so any BUILD use must add the touch-target wrapper manually.

## Blanks / unverifiable

- No COMPONENT/COMPONENT_SET *definitions* live on this page — only instances. Confirms this file subscribes to (rather than defines) `toggle_basic`/`check_icon_solid` per the pre-loaded `get_libraries` verdict.
- Did not screenshot every one of the 15 top-level items (물타기계산기, 03 자산_총자산_계산기팝업 variants, IMG_1160/1161) — out of scope for this question; the one screenshot taken was sufficient to confirm the naming convention and the toggle's rendered appearance.
- `getMainComponentAsync` was used read-only (no `importComponentSetByKeyAsync` attempted — read-only session per Method step 8).
