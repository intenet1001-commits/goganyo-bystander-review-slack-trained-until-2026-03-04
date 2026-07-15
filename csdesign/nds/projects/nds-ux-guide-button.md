---
name: nds-ux-guide-button
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=1396-1047"
learned_date: 2026-07-15
sections_studied:
  - "1396:1047 (page canvas '    - Buttion  버튼' — the whole page; exactly 2 children, no guide slides. This page is a REDIRECT STUB, not a guide. See below.)"
  - "1396:1301 (frame '👍 thumbnail' — the 1920×1080 cover card: '버튼 가이드' + 'ⓒ2024 NDS GUIDE. Last update 2024.01.30'. The only content on the page.)"
  - "1396:1302 (TEXT '버튼 가이드' inside the thumbnail — carries the same Notion hyperlink as the banner)"
  - "1396:1303 (TEXT — layer named 'UI 가이드라인이란?' but actually displays 'ⓒ2024 NDS GUIDE. Last update 2024.01.30'. Placeholder layer name; see gotcha.)"
  - "4201:58732 (TEXT 'Button 가이드 보러가기' — a 1926×239 banner link; hyperlink → the Notion page that holds the real guide)"
status: internal UX guide (design-team documentation, not a shipped product screen) — CONTENT MIGRATED OFF-FIGMA; this page is a redirect stub only
---

# NDS UX Guide — Buttion 버튼 (Button Usage) — **STUB, content lives in Notion**

Part of the NDS_UX Guide file's "Buttion 버튼" canvas (page node `1396:1047`), inside the guide's "Usage Guidelines" group. (The typo "Buttion" is the guide's own — it is the literal Figma page name, reproduced here verbatim so the page can be found by search.)

## ⚠️ The headline finding: this page contains no button guidance

Unlike its siblings (`nds-ux-guide-tab` — 13 content slides; `nds-ux-guide-popup` — 14 content slides), **this page has exactly two children and zero guide slides**:

1. `1396:1301` — a `👍 thumbnail` cover frame (1920×1080) reading **버튼 가이드** with the footer **ⓒ2024 NDS GUIDE. Last update 2024.01.30**
2. `4201:58732` — a large (1926×239) text banner reading **Button 가이드 보러가기** ("go see the Button guide")

Both the banner and the cover title carry the **same hyperlink**, confirmed by reading the `hyperlink` property off the text nodes:

```
https://www.notion.so/nhidesign/Box-Button-29a87b1bf5b24d27bf8e21d1357d8706?source=copy_link
```

**The button guide has been migrated out of Figma into Notion** (workspace `nhidesign`, page "Box, Button"). This Figma page is now only a signpost. The `Last update 2024.01.30` stamp is ~14 months newer than the TAB (`22.11.17`) and Popup (`22.11.21`) covers — consistent with a 2024 migration, and a hint that **Notion, not Figma, is the current system of record for at least some NDS UX guidance.**

**The Notion page is not readable from this environment** — `https://www.notion.so/nhidesign/...` 307-redirects to `https://app.notion.com/p/nhidesign/...`, which then redirect-loops (auth-gated internal workspace). No credentialed path to it was available during this pass. **This is the one genuinely open gap in the Usage Guidelines group.**

## Gotcha confirmed: placeholder layer names

The layer-name-lies problem is present here in its purest form. TEXT node `1396:1303` is **named** `UI 가이드라인이란?` but **displays** `ⓒ2024 NDS GUIDE. Last update 2024.01.30` — the name is a leftover template placeholder with no relationship to the rendered copy. (The same placeholder name `UI 가이드라인이란?` appears on cover slides across this file.)

Two conclusions, worth carrying into any future pass on this file:
- **Never read content off `name` attributes in this file** — screenshot, or read `characters` via `use_figma`.
- **Conversely**, `get_metadata` alone would have made this page look like a normal cover + heading slide. Only reading the actual `characters` **and** the `hyperlink` property revealed it's a redirect stub. When a page's metadata looks suspiciously thin, read the text properties before concluding the node "didn't resolve."

## Component keys / variants observed

**None from this page** — there is no button spec here to cross-reference. Nothing contradicts the `LEADER.md` Core reference; nothing extends it either.

For reference, the Core reference already records these button-family keys, none of which this page confirms or refutes:

| Component | key | Status after this pass |
|---|---|---|
| `btn_bottom_page_assets` | `0fc4758ec4ab4c83ad6052748c3dabf76d0542e8` | unchanged — but see note below |
| `btn_bottom_page_assets_gray` | `873d1a7bbe44364aef31c19bbf15f19d7d457265` | unchanged — but see note below |
| `nds_icon_header` | `19619c9f1fd2e3c2e6515542d0484e651f3f30c6` | unchanged |
| `radio_basic` / `radio_btn` / `check_icon_*` / `toggle_basic` | (see Core reference) | unchanged |

**Note**: although *this* page is empty, the sibling **Popup** guide (`nds-ux-guide-popup.md`) turned out to carry substantial bottom-button rules (1:1 vs 1:2 ratios, the left-slot-is-always-a-dismiss rule, 확인-not-닫기 wording). And the sibling **터치영역** guide (`nds-ux-guide-touch-area.md`) carries button *sizing* minimums (FAB 52pt, nav icons 40px, icon/check buttons 36px). **So button guidance in this file is not missing — it's distributed across the other pages.** Look there first before chasing the Notion link.

## How this feeds BUILD mode

This page contributes **no rules of its own**. Its practical value to a BUILD pass is routing:

- **Do not treat the absence of a Figma button guide as "no button rules exist."** For button work, read, in this order:
  1. `nds-ux-guide-popup.md` → "04. 팝업 하단 버튼" — bottom-button wording, ratios, and the left-slot dismiss rule (the most concrete button rules in this whole file).
  2. `nds-ux-guide-touch-area.md` → "03. UI 요소 별 터치 영역 크기 가이드" — minimum touch-target sizes for FAB / nav / icon / check buttons.
  3. `LEADER.md` Core reference → `btn_bottom_page_assets` (+ `_gray`) for the real componentKeys and variant axes.
- **For anything those three don't cover** (e.g. in-page box buttons, button hierarchy, states, the "Box, Button" spec the Notion page is named after), the source of truth is **Notion → `nhidesign` → "Box, Button"**, which is **not reachable from this environment**. Flag it to the user and ask for an export or a credentialed fetch rather than inventing a rule.
- **Don't invent button specs.** Per `figma-use`'s rules and this domain's Mode 2, use real componentKeys and variant names only. If a needed button rule isn't in the three sources above, it is genuinely unknown here.
