---
name: nds-lib-data-table
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=375-7499"
learned_date: 2026-07-16
sections_studied:
  - "375:7499 (page '    - Data Table  테이블(표)' — the canvas itself)"
  - "8262:14512 (frame '1. Table' — on-canvas heading 'Data Table' / 'QV-NM Table Design Guide'; section 'TABLE BASIC' / 'data table 최상단에 쓰이는 테이블 필터에요.' — BUILT-OUT CONTENT ABSENT, see note)"
  - "8262:14534 (frame '99. Table_assets' — the only populated section; carries TABLE HEADER and TABLE CELL)"
  - "7866:18253 (COMPONENT_SET 'Table_header', 4 variants — on-canvas headings BASIC / 2 LINE / SORTING / SWITCH)"
  - "7866:17442 (COMPONENT_SET 'Table_cell', 7 variants — on-canvas headings BASIC / 2 LINE / MULTI / BTN / RATE)"
  - "8262:14728 (COMPONENT_SET 'Table_control', 2 variants — check / radio)"
  - "15172:15391 (frame 'Table' — a 492-wide 4-column assembled example)"
  - "15537:15417 (frame 'Table' — a 540-wide 2-column header+cell assembled example)"
status: "unknown — NO `Last update` stamp and NO usage panel exist anywhere on this page (unlike the sibling List/Card pages, which have both). The three component sets are well-formed and axis-clean, but the page's own `TABLE BASIC` section is an empty shell (see below), so freshness/completeness cannot be established from the page."
---

# NDS Library — Data Table (테이블/표)

The table primitives for the **NDS_Library** file (`72zrHgMLM4zhCjgSuTf7cC`). Unlike List and Card, this page ships **no composite table component** — it ships three cell-level primitives (`Table_header`, `Table_cell`, `Table_control`) and expects you to assemble rows yourself. Two hand-assembled examples on the page show how.

## ⚠️ Name reliability on THIS page: RELIABLE at every tier checked

**Determined by screenshotting `8262:14534`.** This is the cleanest of the five pages:

| Tier | Reliable? |
|---|---|
| Frame / section / heading names | **YES** — `1. Table`→"Data Table", `99. Table_assets` headings `table header`/`table cell` render as "TABLE HEADER"/"TABLE CELL", column labels `basic`/`2 Line`/`sorting`/`switch`/`Multi`/`btn`/`RaTE` all match (casing is inconsistent — `RaTE`, `2 Line` vs `2line` — but the *words* are true). |
| Variant names | **YES** — match `variantProperties` exactly. No `\x08` corruption anywhere on this page. |
| TEXT leaf names | **YES** — leaf names equal their `characters` here (`헤더영역`, `기본셀영역`, `100,000` all match). |

**No rules are embedded in pasted screenshot images on this page.** All content is live vector/text.

**No `Last update` stamp and no usage panel exist.** I searched the full metadata dump — this page has neither, so its `status` is `unknown`, not `live`. Do not infer freshness from the page name.

## 🚨 Blank at source: the `TABLE BASIC` section is an empty shell

Frame `1. Table` (`8262:14512`, 1640×980) contains **only two children** — its title block and a section heading:

- `8262:14517` — heading **`table basic`**
- `8262:14518` — description **`data table 최상단에 쓰이는 테이블 필터에요.`** ("this is the table filter used at the very top of a data table")

**There is no filter component underneath it. The section describes a component that was never built on this page.** This is the finding — not an extraction failure. If a table filter is needed, it does not exist here; check the Filter/Select-Box page or ask a designer.

Similarly, two headings inside `99. Table_assets` label artifacts that live **outside** the frame at page level:
- `8274:13899` — heading `Start line` → its artifact is `8274:13898` (`start line (stroke)`, a 490×1 vector at page coords)
- `8274:13900` — heading `swipe (shadow)` → its artifact is `8274:13897` (a 16×293 rounded-rect at page coords)

They render in the screenshot as **labels with empty space beneath them**. The assets exist but are orphaned outside their documenting frame.

Also present as loose page-level text (not in any frame): `8262:14618` `더 많은 사용 예시는` and `8262:14619` `Go Template ->` — a pointer to the Templates file.

## The three primitives

All keys are **SET keys**. Full 40-hex, none truncated.

| Set | SET key | Axes | n |
|---|---|---|---|
| `Table_header` | `8074b6b4ab30e8d392bfb6aec6857386f10e5006` | `Type`(basic / 2Line / sorting / switch) | 4 |
| `Table_cell` | `fc81ad075240f81283ab0769426639ff87b6e542` | `Type`(basic / 2line / button / rate / multi / with button / global) | 7 |
| `Table_control` | `b8581a1efd280c315d2e5c7039f011e9d4a8ea35` | `Type`(basic) × `control`(check / radio) | 2 |

**`Table_control`'s `Type` axis has exactly one value (`basic`).** A single-value axis is dead weight — pass `Type: 'basic'` and vary only `control`. Worth knowing so you don't hunt for other `Type`s.

**Casing is inconsistent across the two sets that both have a "2 line" concept:** `Table_header` uses `2Line` (capital L, no space); `Table_cell` uses `2line` (lowercase, no space). The on-canvas labels say `2 Line` for both. **Three spellings for one idea — match the `variantProperties` string exactly, per set.** Logged to LEDGER.

### `Table_cell` `Type=global` is undocumented on canvas

The on-canvas column headings over `Table_cell` are **BASIC / 2 LINE / MULTI / BTN / RATE** — five headings for **seven** variants. `Type=global` (`16807:15549`) and `Type=with button` (`7866:17448`) have **no heading of their own**; `global` renders visually beneath the "2 LINE" heading, which is misleading.

`Type=global` content (read via `use_figma`): `Treasure Global Inc` 21px `#333333`, with `HMBL` and `Financial` at 15px `#999999`. It's the **overseas-equity** cell — name + ticker + sector, versus the domestic `2line` cell. Real component, absent documentation.

## Colour — corroborates 상승=red, but exposes an internal inconsistency

Sampled directly off the nodes (fills read via read-only `use_figma`, not eyeballed):

| Role | Node | Hex | Verdict |
|---|---|---|---|
| **Table header fill** | `Type=basic` (`15109:15346`) | **`#F7F7F7`** | ✅ **exactly** `NM/ESS/grayscale/6.066(테이블헤더배경)` — the colors note's "테이블헤더배경색". Independent confirmation. |
| Table header text | `헤더영역` 18px | **`#666666`** | ✅ exactly `NM/Default/3.013` (글자 보조) |
| `Type=global` primary | `Treasure Global Inc` 21px | `#333333` | ✅ `NM/Default/2.023` (글자 GrayDark) |
| `Type=global` secondary | `HMBL` / `Financial` 15px | `#999999` | ✅ `NM/Default/4.024` (글자 Gray Mid) |
| **`Type=rate` 상승 text** | `TXT` 22px | **`#D73838`** | ✅ matches domain 상승 |
| **`Type=rate` 상승 triangle** | `Triangle` VECTOR | **`#EF2D26`** | ❌ **MISMATCH** |

### 🚨 Conflict: the rate cell's triangle is off-palette

Inside the single component `Table_cell / Type=rate` (`12731:14209`):

```
TXT  "100,000"  →  #D73838   ← the domain's 상승 red
Triangle ▲       →  #EF2D26   ← NOT #D73838, not any documented NDS token
```

**The text and its own up-arrow are two different reds.** `#EF2D26` appears nowhere in the `nds-mweb-colors` NM palette. Compare the **List** page, where the equivalent `Triangle` *is* `#D73838` — so this is a Data-Table-local defect, not a system-wide alternate token.

**For BUILD: use `#D73838` for both. Treat `#EF2D26` as a bug to flag, not a token to reproduce.** Logged to LEDGER.

**No 하락/보합 examples exist on this page** — the only rate demo is a rise. `#247EF2` / `#009F83` are **untested here, not contradicted.**

## The two assembled examples

The page shows two hand-built tables (neither is a component — both are plain frames of instances):

- **`15172:15391`** — 492 wide (in-card), **4 columns × 123px**. Header row 48px; three cell rows 56px each. Topped by a `start Line (Stroke)` vector, 492×1.
- **`15537:15417`** — 540 wide (full-bleed), **2 columns**: a 140px `Table_header` used as a *row* label on the left + a 400px `Table_cell` on the right. Row height 56px. Also topped by a `start Line (Stroke)`, 540×1.

**The second example is the important one**: it shows `Table_header` used **vertically as a row header**, not just as a column header. The set supports both orientations by reuse — there is no `orientation` variant.

Geometry worth reusing: **header 48px tall (column) / 56px (row-label); cells 56px; 4×123 = 492; a 1px start line above the table.**

## Placeholder copy — do NOT record as product strings

| String (verbatim) | Status |
|---|---|
| `헤더영역` | **Pure placeholder** — "header area". |
| `기본셀영역` | **Pure placeholder** — "basic cell area". |
| `하나면하나지둘이겠냐둘이면둘이지셋이겠느냐` | **Korean lorem-ipsum** — a nonsense tongue-twister used to test `Type=multi` line wrapping. |
| `버튼명` / `상세` | **Pure placeholder** — "button name" / "detail". |
| `100,000` | Filler amount. |
| `Treasure Global Inc` / `HMBL` / `Financial` | Real-shaped overseas-equity sample; still demo data. |

## How this feeds BUILD mode

- **There is no table component — assemble from primitives.** `Table_header` for the header row (or row-label column), `Table_cell` per cell, `Table_control` when rows are selectable. Follow the two on-page examples for geometry.
- **Header fill is `#F7F7F7` (`NM/ESS/grayscale/6.066`), header text `#666666` (`NM/Default/3.013`).** Both confirmed by direct sampling — bind the tokens, don't hardcode.
- **Add the 1px `start line` above the table.** Both examples have it. The colors note gives the likely token: `NM/ESS/line/1.016(테이블상단구분선)` `#ADADAD` — its Korean suffix literally means "table top divider". *(Token binding inferred from the name match; the vector's own fill was not sampled — verify before relying on it.)*
- **Pick `Type=global` for overseas equities, `2line` for domestic** — despite `global` having no on-canvas heading.
- **Match variant-string casing per set** (`2Line` on header, `2line` on cell).
- **Use `#D73838` for 상승 including the triangle** — do not copy the cell's `#EF2D26`.
- **Don't look for a table filter here.** The `TABLE BASIC` section that promises one is empty.
- Keys are `unverified` for publish state (read-only session). `remote: false` is expected — this *is* the library file. Structurally all three sets are section-documented and axis-clean → **(a) published library components**. The empty `TABLE BASIC` section is **(c) scaffolding** — a heading with nothing behind it.
