---
name: nds-lib-tooltip
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=5261-10694"
learned_date: 2026-07-16
sections_studied:
  - "5261:10694 (page '    - Tooltip  툴팁')"
  - "5261:10773 (section '1. Tooltip' — on-canvas heading 'Tooltip' / 'QV-NM Tooltip Design Guide'; group heading 'TOOLTIP  width 440 고정, 우측마진 16')"
  - "5261:10776 (COMPONENT_SET 'tooltip' — 6 variants, Type × Status)"
  - "21647:2 (section '2. Guide Tooltip' — on-canvas heading 'Guide Tooltip'; group heading 'GUIDE TOOLTIP  width contents hug, 우측마진 10')"
  - "21648:2330 (COMPONENT_SET 'guide_tooltip' — 2 variants; plus 4 sibling standalone components outside the set)"
  - "21648:766 (section '99. Tooltip_assets' — polygon/arrow assets: nds_img_guidepolygon, Polygon)"
status: "unknown — this page has NO 'Last update' stamp and NO usage/유의사항 panel, unlike every sibling page in my batch (Button 2022.10.31, Popup 2024.06.20, Dialog 2025.09.15). Components are structured and coherent, so it is plausibly live, but the page itself offers no evidence of currency. Do not assume."
---

# NDS Library — Tooltip / Guide Tooltip

**This page settles the domain's open question `#tooltip-no-rules` — and the answer is mostly "still no".** The library defines tooltip **geometry** (width, margins, line cap) and **channel colour**, but **states no timing, trigger, or dismissal rule whatsoever**. No delay, no duration, no auto-dismiss, no "show on tap vs long-press", no coach-mark sequencing. `#tooltip-no-rules` should be **narrowed, not closed**: geometry rules were found; behaviour rules confirmed blank at source.

This is a textbook instance of the domain's systematic-blankness pattern: the design system specifies what a tooltip *looks like* and is silent on when it appears or leaves.

## ⚠ Page conventions — layer names LIE on this page

**Determined by screenshotting, and the verdict differs sharply from my `- Dialog` page.** Three distinct failures:

**1. `Type=QV` renders as "N2".** The `tooltip` set's axis is `Type: NM | QV`, but the on-canvas demo copy inside the QV variants reads **`N2 툴팁 타이틀`**, while the NM variants read `나무 툴팁 타이틀`. So **`N2` is an on-canvas alias for the `QV` channel.** The same `N2`/`QV` collision appears independently on my `- Box Button` page (see `nds-lib-box-button`), where one component set uses `Channel: NM | N2` and its sibling uses `Channel: NM | QV`. **`N2` and `QV` are the same channel under two names.** Cross-file note: `nds-mweb-colors` documents the axis as `NM | QV` only and never mentions `N2` — a build that string-matches `"QV"` will silently miss `N2`.

**2. `Color=black` renders WHITE.** In `2. Guide Tooltip` there are three visual columns — black-filled, white-filled, grey-filled. But the components named `guide_tooltip/up/black` (`81555:8879`) and `guide_tooltip/down/black` (`81555:8883`) are the **white** bubbles. The naming appears to track *text* colour on the standalone pair while the in-set variants (`Type=up, Color=black`, `21648:2329`) track *background* colour. **The word "black" means opposite things two columns apart.** Match these by node ID or by screenshot, never by name.

**3. Demo copy is placeholder, not real copy.** `타이틀 없이 들어가는 툴팁 형태에요.`, `툴팁에 들어가는 내용이에요.` — self-describing filler. Do not lift it as product copy. (Contrast the `guide_tooltip` bubbles, which carry realistic copy: `세로운 계좌를 찾았어요 🔍 / 지금 바로 연결할 수 있어요!` — note `세로운` is itself a typo for `새로운` in the source; preserved verbatim here.)

**Rules embedded in screenshot images: NO** — but **one rule is embedded in a sticky-note annotation** (`moana`, `30036:719`), which no text-node walk of the component tree would surface. See below. I found it only by screenshotting.

## The geometry rules (verbatim)

**Tooltip** — from the group heading `5261:10820` → `5261:10822`:

> `width 440 고정, 우측마진 16`

→ Width is **fixed at 440** (not hug). Right margin **16**.

**Guide Tooltip** — from `21648:7` → `21648:9`:

> `width contents hug, 우측마진 10`

→ Width **hugs contents**. Right margin **10**.

So the two tooltip families have **deliberately different sizing models and different right margins**. Picking the wrong one is not a cosmetic slip.

**Line cap**, embedded in the placeholder demo copy of the `Status=normal` variants: the body text ends `... 툴팁에 들어가는 내용이에요. 3줄까지` — **"up to 3 lines"**. This is a real constraint hiding inside filler copy; it is stated nowhere else.

## ⭐ The design-vs-dev discrepancy (sticky note, `30036:719`)

A `moana` sticky note under the Guide Tooltip columns reads, verbatim:

> `😎 텍스트 박스 상하 마진은 20이나, 개발상의 수치는 16으로 적용되어야함`

**"The text box's top/bottom margin is 20, but the value applied in development must be 16."**

This is a rare and valuable artifact: **the design file explicitly states that the implemented value must differ from the drawn value.** A BUILD pass that measures the Figma frame and reads 20 would be *wrong by the design system's own instruction*. Use **16** vertical padding for guide tooltips.

A second sticky (`81555:8889`) labels the middle (white) column: `😎 다크모드용` — **the white guide-tooltip bubbles are for dark mode.** That is the only dark-mode signal on the page, and it too lives in a sticky note rather than a variant axis.

## Component inventory

**`tooltip`** (`5261:10776`) — the main tooltip. Axes `Type: NM | QV` × `Status: normal | notitle | complex`.

| Status | What renders |
|---|---|
| `normal` | title + body paragraph (≤3 lines) |
| `notitle` | body only, no title |
| `complex` | title + bulleted list (`·` items) |

**`guide_tooltip`** (`21648:2330`) — coach-mark style, black filled, arrow up/down. Axes `Type: up | down` × `Color: black`. **The set contains only the `black` colour**; the white and grey versions exist as **four standalone components parked outside the set** (`81555:8879/8883`, `27944:4290/4316`). So the `Color` axis is misleadingly incomplete — you cannot reach white/grey by swapping a variant property. (b)-tier concern: this looks like an in-progress consolidation someone never finished.

**Assets** (`21648:766`) — arrow/polygon glyphs, 20×11:
- `nds_img_guidepolygon` (SET) — `Type: up|down` × `Color: 01|03|06`. Naming convention documented on-canvas as `nds_img_guidepolygon_u/d/01/03/06` (`21780:6164`).
- `Polygon` (SET) — `Type: up|down` × `Channel: NM|QV`. On-canvas name `nds_img_polygon_up/down` (`21780:6166`).

**Note the axis-name split**: the guide polygon is keyed by `Color` (numeric colour codes 01/03/06), the tooltip polygon by `Channel` (NM/QV). Two arrow systems, two naming schemes, same page.

## componentKeys — Tooltip page

Read-only session → **all keys `unverified`**. Components are LOCAL (`remote: false`) — expected in the library file itself; not evidence of non-publication.

**COMPONENT_SET keys** (for `importComponentSetByKeyAsync`):

| Name | SET key (40-hex) | Axes | Tier |
|---|---|---|---|
| `tooltip` | `ab2d6aa4f54ae00d86fdb644d9a7963ccde2fb28` | `Type: NM\|QV` × `Status: normal\|notitle\|complex` | (a) published library component |
| `guide_tooltip` | `80538a1c120ffbe7e5fbe22f02d127273efa92db` | `Type: up\|down` × `Color: black` | (a) published, but axis incomplete — see above |
| `nds_img_guidepolygon` | `86cf784d7f2090f9410d51d815f3132418b0f7a9` | `Type: up\|down` × `Color: 01\|03\|06` | (a) published asset |
| `Polygon` | `7e28641b217609cff5e353cc7f29d33851c8b2d0` | `Type: up\|down` × `Channel: NM\|QV` | (a) published asset |

**Variant COMPONENT keys** (⚠ variant-component keys, **not** SET keys):

| Variant | COMPONENT key (40-hex) |
|---|---|
| `tooltip / Type=NM, Status=normal` | `5aa3388155e7ee06befc39e2a3d58d356fb0c762` |
| `tooltip / Type=NM, Status=notitle` | `ce6b3b88a4b50e8e41440c2b8328cc5a87d537cc` |
| `tooltip / Type=NM, Status=complex` | `85ad1808ef5364930e63f2324309e1c677dc160e` |
| `tooltip / Type=QV, Status=normal` | `ea99f741a19df95967a50a224f638eb33c39040b` |
| `tooltip / Type=QV, Status=notitle` | `8e3f99d929df335012cd7faf1ce6e2ef39d47061` |
| `tooltip / Type=QV, Status=complex` | `7d3ef4d60efedf340b9e33aaa9b5fb603e642692` |
| `guide_tooltip / Type=up, Color=black` | `a3b83865aefb8f1168017cd21874adb9174dc14a` |
| `guide_tooltip / Type=down, Color=black` | `78bd0379aba7fc0f715837c5291d29294728db20` |

**Standalone COMPONENT keys** (outside any set — ⚠ names lie, see convention #2):

| Name | COMPONENT key (40-hex) | Actually renders |
|---|---|---|
| `guide_tooltip/up/black` | `99c659ef7a466152aad8312509f857bf0e09382f` | **white** bubble (dark-mode) |
| `guide_tooltip/down/black` | `c6d4a587bb2d5c336439f5b36c8cf1764e2aaaef` | **white** bubble (dark-mode) |
| `guide_tooltip/up/gray` | `2cc7ccf8e905975b9bc6495c160674f4b3c1dc92` | grey bubble |
| `guide_tooltip/down/gray` | `b6b872d2ec915bd90744ec529c7adfcf7bffc735` | grey bubble |

Polygon variant keys: `nds_img_guidepolygon` — up/01 `939b6ab04405f403e2aa9c3308b5a307c7420019`, up/03 `5930c8932c96344dc84005d698f84a2996943b21`, up/06 `910b15e0b1b0d550c00663f48309977205bc4f02`, down/01 `d60711797d2d85582e2475fbec9e639282df2a47`, down/03 `8ffeac642edb0000bd723e089fc64899ed048c14`, down/06 `650e558e9c9f913727ddc7de46a6aa2f77b06463`. `Polygon` — up/NM `53c69b67c0416d7ce085bd5fa46bd4991d1d3a5a`, up/QV `d23385917c6109aff93c711a90b2670024639dec`, down/NM `6ad51a7cdeb75e2a6f80ee0aef105db5350f46df`, down/QV `5f0e3deb961c4d5fe19bedab20b81dcc3942592d`.

## How this feeds BUILD mode

- **Tooltip: width 440 fixed, right margin 16, body ≤3 lines.** Guide tooltip: **hug width, right margin 10, vertical padding 16 (not the drawn 20).**
- **Never derive a tooltip's show delay or dismiss duration from this page — there isn't one.** Escalate to the designer. The `#tooltip-no-rules` flag stays open for behaviour.
- **Treat `N2` and `QV` as the same channel.** Any channel switch must match both spellings.
- **Do not select a guide tooltip by the word "black"** — it is unreliable. White = dark mode, per the sticky note. Use the node IDs / keys in the table above.
- The `Color` axis on `guide_tooltip` cannot reach white or grey — import those four standalone components directly.
- `tooltip` `Status=complex` is the bulleted-list form; `notitle` drops the title. There is no disabled/error tooltip state in the library.
