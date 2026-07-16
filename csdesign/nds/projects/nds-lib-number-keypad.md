---
name: nds-lib-number-keypad
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=28884-2873"
learned_date: 2026-07-16
sections_studied:
  - "28884:2873 (page '    - Number Keypad  숫자 키패드' — organised as 4 on-canvas 📌 zones, one per keypad layout)"
  - "28886:11597 / 34223:3693 / 46624:1800 / 46769:6562 (COMPONENTs keypad_number01–04 — the four layouts, all page-level, all standalone)"
  - "28886:13222 (SECTION '개발전달용 ⚡️ 가이드' — 4-column keypad measurements: 상단 구분선 / 크기 / 마진 / 여백)"
  - "58614:1654 (SECTION '개발전달용 ⚡️ 가이드' — 3-column Clear keypad measurements: 크기 / 마진 / 여백 / 터치영역)"
  - "34238:5408 (SECTION '개발전달용 ⚡️ 가이드' — 3-column (00) keypad measurements)"
  - "28886:11525 (SECTION '개발전달용 ⚡️ 이미지 에셋' — 30 ms_btn_numberkey_* key-cap components, nn/sn pairs)"
status: "live — NO Last update stamp anywhere on the page (checked: no 'Last update' node exists), but the page is demonstrably active: keypad_number03/04 and the ms_btn_numberkey_clear_* assets are late additions (node ids 46xxx/58xxx vs the 28xxx base), so the page has been extended well after initial authoring"
---

# NDS Library — Number Keypad (숫자 키패드)

The NDS in-app numeric keypad. **Not** the security keypad — see `nds-lib-security-keypad`, which is a separate, third-party transkey asset and shares nothing with this.

The page's organising principle is **four on-canvas 📌 zone headings**, each a layout variant. These headings are the page's real table of contents:

| 📌 Zone heading (verbatim) | Component | Key | Size |
|---|---|---|---|
| `📌 4열 키패드 (소수점, +/-)` | `keypad_number01` (`28886:11597`) | `d0410808a9ef5168ae0781dc8445b770fa411d17` | 540×375 |
| `📌 3열 키패드 (00)` | `keypad_number02` (`34223:3693`) | `e8a0f88ef750b8d73d6efa3ec177effe0f5ef828` | 540×455 |
| `📌 3열 키패드 (Clear)` | `keypad_number03` (`46624:1800`) | `07c7ffdc870aee263b5fbdf851cf74fcd242896a` | 540×425 |
| `📌 3열 키패드 (소수점)` | `keypad_number04` (`46769:6562`) | `c375fd3f14f299d11986b2de468cd589611d7a82` | 540×425 |

**열 = column.** So: one 4-column layout and three 3-column layouts, differing in which extra key they carry.

**⚠️ All four are standalone COMPONENTs, NOT variants of a COMPONENT_SET.** Verified: `type: "COMPONENT"`, `parent.type: "PAGE"`, `variantProperties: null`, `setKey: null`. There is **no `keypad_number` set** on this page — you cannot switch layout by setting a property. `importComponentByKeyAsync` with the individual key is the only route. The numeric suffix `01`–`04` is doing the job an axis should. Flagged for LEDGER.

**Note the naming collision across pages:** the Security Keypad page has **two different COMPONENT_SETs both named `keypad_number`** (keys `a0d3f5bf…` and `f8a2ddc3…`, both axis `Status`). Neither is related to `keypad_number01`–`04` here. **`keypad_number` is one of the most overloaded names in this file** — always resolve by key.

## Measurements (from the 개발전달용 ⚡️ 가이드 sections)

These are **the page's real payload** and they are rendered as red/blue/green measurement overlays — i.e. **numbers baked into annotation graphics**, recovered by screenshot.

### 4-column keypad — `28886:13222`

Four columns, whose on-canvas headings are **상단 구분선 / 크기 / 마진 / 여백**:

- **상단 구분선** (top divider): **`line 1, color 017`** — a 1px rule in colour-number **017**. Cross-referencing `nds-mweb-colors`: `NM/ESS/line/2.017(박스테두리)` = **`#E0E0E0`**. So the keypad's top divider is the standard box-border token. This is the one place on the page a design token is named rather than measured.
- **크기** (size): **540px wide × 375px tall.**
- **마진** (margin): **16pt top, 24pt left, 24pt right, 24pt bottom.** ⚠️ **Top is 16, the other three are 24** — asymmetric, and the 16 sits just under the 상단 구분선.
- **여백** (internal spacing): **10pt** between key rows (the purple horizontal bands), **28pt** between key columns (the green vertical bands), and **30pt** above the 취소/확인 action row.

⚠️ **Unit inconsistency at source: 크기 is given in `px`, but 마진 and 여백 are given in `pt`.** Same diagram, same keypad, two units, no conversion note. Do not silently treat them as equal. Flagged for LEDGER.

The rendered layout confirms the key map: rows `1 2 3 .` / `4 5 6 +/_` / `7 8 9 0` / `취소 · 확인 · ⌫`. The **확인 (confirm) key is green** — i.e. `Channel=NM` brand green `#84C13D`. There is **no QV/orange variant of any keypad on this page.** Blank at source.

### 3-column (Clear) keypad — `58614:1654`

Four columns: **크기 / 마진 / 여백 / 터치영역**.

- **크기**: **540px × 425px.**
- **마진**: **16pt top, 24pt L/R/bottom** — same as the 4-column.
- **여백**: **30pt** between columns and above the action row.
- **터치영역** (touch target): **148pt × 70pt per key** — the pink overlay shows the tap region is **wider than the visible key cap**, extending into the gutters. **This is the only touch-target spec in the batch.** The visible caps are 102×70 (per the asset components below), so the touch region adds ~46pt of horizontal slop. **Do not size hit areas to the visual key.**

Key map: `1 2 3` / `4 5 6` / `7 8 9` / `C 0 ⌫`, then `취소` + `확인`. The **`C` (Clear)** key is what names this layout.

⚠️ **This section's sub-frames are correctly named** (`크기`, `마진`, `여백`, `터치영역` — `58614:1714/1690/1675/1655`), whereas the 4-column section's are **`Group 46192`–`46195`** — Figma auto-names, carrying zero information. **The same content is well-named in one section and unnamed in the other.** The 3-column section is newer (node id 58xxx vs 28xxx). Name quality here is a function of authoring date, not of content.

### 3-column (00) keypad — `34238:5408`

Sub-frames `크기` (`34238:5621`) + `Group 46196`–`46198` — **the same half-named pattern**, mid-vintage (34xxx). `keypad_number02` is 540×**455**, the tallest of the four.

## Image assets — `28886:11525` (SECTION `개발전달용 ⚡️ 이미지 에셋`)

**30 standalone key-cap COMPONENTs**, laid out as two rows: **`_nn` (normal)** and **`_sn` (selected)**. On-canvas heading: **`ms_btn_numberkey_숫자,기호_nn/sn`**.

Naming: **`ms_btn_numberkey_<key>_<state>`** where `<state>` ∈ `nn` | `sn`.

`<key>` ∈ `1`–`9`, `0`, `00`, `point`, `plusminus`, `del`, `clear` — 15 keys × 2 states = 30.

Sample keys (full 40-hex, **all standalone COMPONENTs, no set**):

| Component | Key | Size |
|---|---|---|
| `ms_btn_numberkey_1_nn` (`34223:3734`) | `32fe4be020c01c7346f1a1f4c0b3fb3d43611b09` | 102×70 |
| `ms_btn_numberkey_del_nn` (`34223:3783`) | `b5892d92610f8a84b512ddc4985f8d7a426f9a2b` | 102×**75** |
| `ms_btn_numberkey_clear_nn` (`46598:1610`) | `262a96db5592884293d76a3f1ce129323762fc3e` | 102×**75** |

⚠️ **`del` and `clear` are 102×75; every other key is 102×70.** The two action keys are **5px taller**. Nothing on the page explains this. Flagged for LEDGER.

**The `nn`/`sn` suffix grammar matches `nds-lib-9-patch` exactly** (`n`=normal, `s`=seleted[sic]) — same two-letter convention, same `ms_btn_` prefix. Strong evidence this is a **file-wide asset convention**, not a per-page one. But note: these key caps are **not** `.9` nine-patches (no `.9` suffix), so they don't stretch — they're fixed-size rasters.

⚠️ **A parallel, near-duplicate set of `rounded-rectangle` nodes named `ms_numberkey_1_nn` … `ms_numberkey_del_nn`** (`28886:13306`–`28900:13756`) floats at page level at `y≈2001–2296`, **outside any section**, at the same 102×70/75 sizes. Note the name drops `btn_`: **`ms_numberkey_*` vs `ms_btn_numberkey_*`.** These are plain rectangles, **not components**, and are not in the 개발전달용 section. Almost certainly **superseded scaffolding** left behind when the section was created. **Do not export these.** Flagged for LEDGER.

## Context screens

Three 540×987 frames named `시세포착주문_손익감시_조건 설정` show `keypad_number01` in situ, annotated by the page-level headings **`input focus`**, **`press`**, and **`하단 고정`** ("fixed to bottom") — plus **`Non-Modal`** over the whole zone. So: **the number keypad is non-modal and docks to the bottom of the screen.** Two more frames (`큰손픽_따라사기_01_금액수정`) show `keypad_number02` inside a **dimmed popup** (`dim` rectangle at 100% frame size) — so keypad_number02's usage context **is** modal, contradicting the `Non-Modal` heading that governs zone 1 only. Different zones, different rules — don't generalise the `Non-Modal` label past `keypad_number01`.

⚠️ These context frames are **heavily hidden**: `tab_1depth_line`, `account_lookup`, `Frame 125281`, `Frame 125227` and one of the two `header_basic` instances all carry `hidden="true"`. Their content is **unverified** — a screenshot of them renders nothing. If those hidden layers encode alternate states, that is not recoverable from this pass. **Unhide and re-check** if the context screens matter.

## Name-reliability verdict for this page

**Mixed, and the split is by authoring vintage rather than by node kind:**

- **Component names: reliable and load-bearing.** `keypad_number01`–`04`, `ms_btn_numberkey_<key>_<state>` are real, systematic, and match the on-canvas asset heading.
- **Section/zone routing: use the 📌 headings.** All three guide SECTIONs are identically named `개발전달용 ⚡️ 가이드`; the 📌 TEXT nodes above them are what distinguish 4열/3열(00)/3열(Clear)/3열(소수점).
- **Guide sub-frame names: half reliable.** Newest section (58xxx) = `크기/마진/여백/터치영역` ✅. Older sections (28xxx, 34xxx) = `Group 46192`–`46198` ❌.
- **`📐 Measurements` (`28884:4189`)** is a real annotation frame — one of the few self-describing names in the older material.

**Rules embedded in screenshot images: YES — the measurements are.** Every dimension (540, 375, 425, 16pt, 24pt, 10pt, 28pt, 30pt, 148×70 touch) exists only as **rendered annotation overlay graphics**. The node tree gives frame sizes but **none** of the margin/spacing/touch-target numbers. This page cannot be learned from `get_metadata` alone.

## How this feeds BUILD mode

- **Four layouts, four separate imports by key.** No set, no property switch. Choose by which extra key you need: `.` and `+/-` → 01; `00` → 02; `C` → 03; `.` (3-col) → 04.
- **All four are 540 wide.** Heights differ: 375 / 455 / 425 / 425.
- **Margins: 16pt top, 24pt L/R/B.** Row gap 10pt, column gap 28pt (4열) or 30pt (3열), 30pt above the action row.
- **Touch targets are 148×70pt — wider than the 102×70 key cap.** Size hit areas to the touch spec, not the art.
- **Top divider = 1px, colour 017 = `#E0E0E0`.**
- **NM/green only.** No QV keypad exists. If you need a QV surface keypad, that's an escalation, not a `Channel` flip.
- **`keypad_number01` is non-modal + bottom-docked. `keypad_number02` appears in a dimmed modal.** Don't assume one usage pattern.
- **Watch the px/pt mix and the `ms_numberkey_*` vs `ms_btn_numberkey_*` duplicate rectangles** — both are live traps on this page.
