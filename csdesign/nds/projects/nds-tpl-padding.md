---
name: nds-tpl-padding
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=9665-20994"
learned_date: 2026-07-15
sections_studied:
  - "9665:20994 (page '    - Padding  여백' — one canvas, one screen mock with spacing-measurement overlay)"
  - "9665:21861 (NM_요즘테마_채권 — full 540x2351 screen mock: 'Bond theme' investment content module)"
  - "9667:19198 (Contents — the actual screen content: status bar, header_basic, title, tag chips, illustration, body copy, 2 content sections '채권ETF' / 'TRF(Target Risk Fund)', BOX image placeholder)"
  - "9667:19162 (Guide — overlay frame of 6 vertical-spacing measurement callouts: 60/60/60/60/60/80px)"
status: internal NDS spacing/padding reference — one annotated real-content screen, not an abstract token sheet
---

# NDS Templates — Padding 여백

Single-page spec (canvas name literally `    - Padding  여백`). Despite sitting directly under the `📍 Button / Overlays 버튼 / 오버레이` section header in the page list, **this page is not a button or overlay component** — content confirms the header does not group pages (per manifest anomaly note). The actual content is a **vertical-spacing (padding) annotation overlaid on one real production screen mock** ("NM_요즘테마_채권" — a bond-investment theme card/module), not an abstract padding-token swatch sheet.

## Layer-name convention — mixed/not applicable

Section header `📍 Button / Overlays` immediately precedes this page but has zero relation to its content (Padding ≠ button/overlay) — confirms headers don't group. Within the page itself, layer names are mostly generic Korean/English content labels (`item01`, `Group 9340`, `label`) that don't encode section numbers to verify against — no on-canvas numbering scheme exists here to check for mismatch, so "reliable vs unreliable" isn't directly testable on this page's own convention. The **spacing-callout labels** (`60px`, `80px` text nodes inside `spacing Topbar_Dropdown - Group ####` frames) do read verbatim and match the screenshot exactly (confirmed).

## Screenshot — transcribed spacing values (verbatim, top to bottom)

1. **60px** — top of screen (status bar) → header/title block
2. **60px** — after intro body paragraph → next content divider
3. **60px** — divider → "채권은 어떤 방법으로 투자할 수 있나요?🧐" prompt block
4. **60px** — prompt block → "①  채권ETF" section start
5. **80px** — after the grey "BOX" image placeholder → "②  TRF(Target Risk Fund)" section start
6. (a further **60px** callout appears cut off at the bottom of the captured screenshot, same pattern continuing)

All six values are **vertical gaps between stacked content sections within one scrolling screen** — measured via `spacing Topbar_Dropdown - Group ####` guide frames (vector + tick lines + `Npx` label), not horizontal padding/margin call-outs. No horizontal margin/padding value is annotated anywhere on this page.

## Structural corroboration (not annotated, but measurable from metadata)

Content frame `item01` (`9665:21944`) sits at `x=24, width=492` inside the 540px-wide screen (`9665:21861`), i.e. **24px left/right margins, 492px content width inside 540px canvas** — this **matches `nds-mweb-layout.md`'s separately-recorded 492px-content / 540px-canvas / 24px-margin figures exactly.** Agreement, not derived from this page's own annotations (this page never labels the horizontal margin — only vertical rhythm is called out).

## 3-tier classification — 5/5 sampled, all COMPONENT, all `remote: true`

| Instance | `main.name` | `main.key` | `main.remote` | parent `COMPONENT_SET` | parent key |
|---|---|---|---|---|---|
| `9665:21935` statusbar | `Type=NM, Dark mode=false` | `169d23c202bd4e85398ceafdf264d6fa19eb1cbf` | true | `statusbar` | `fe57c685f5a27a53c49fc56c9999456340140c2f` |
| `9665:21938` line_section | `line_section` | `01f48dbb92a1ac117e6ca757b641742a33c7bc8a` | true | (standalone COMPONENT, no set) | — |
| `9665:21940` label | `Property 1=lv3` | `f93baa92c21301afaad69ec820f839800908288f` | true | `label` | `10153ec2a923e77ea568f3a712a9218a18def445` |
| `9665:21943` 기본/투자_illust36 | `기본/투자_illust36` | `849f459ce6acc958abf9e56d6c2631a349411f43` | true | (standalone COMPONENT, no set) | — |
| `9667:18967` header_basic | `Channel=NM, Left Icon=off, Right Icon=on` | `400dc4ebbe4d63cdfe75a217b0cd24bda1ca1fe9` | true | `header_basic` | `c95043e94317fde7230298017f42dd8099e1cbdc` |

All resolved directly via explicit-node-ID `getMainComponentAsync()` (page-wide sweep not attempted, per known intermittent-throw pattern). All `remote: true` — corroborates Q4 (NDS_Templates genuinely subscribes to NDS_Library).

## Which family does this page really belong to

**Layout/spacing (vertical rhythm) reference, not Button/Overlays.** It documents section-to-section vertical gaps (60px standard, 80px around a media/BOX module) on one real content screen — closer kin to `nds-mweb-layout.md` (margins/canvas width) than to any button or overlay component page. No button or overlay component appears anywhere on this page.

## Comparison to touch-area minimums (different file, different metric — no direct overlap)

`nds-ux-guide-touch-area.md`'s minimums (FAB 52pt touch + ≥16pt screen margin; nav icon 40px touch/8–16px gap; generic icon+check 36px touch/8–16px gap; list/card icon 36px touch/8–12px gap) are all **component touch-target sizes and inter-icon gaps**. This page's 60px/80px are **macro section-to-section vertical spacing** on a scrolling content screen — a different measurement class entirely. Neither agrees nor conflicts; they're not comparable quantities. No touch-target size or icon gap is annotated anywhere on this page.

## Blanks / gaps

- No horizontal padding/margin value is explicitly labeled on this page — only inferred structurally (24px, matches mweb-layout).
- The bottom of the screenshot cuts off before the final labeled gap fully resolves; metadata confirms it's the 6th `60px` callout (`9667:19200`/`9667:19201` guide group, y=2291) but it wasn't re-screenshotted to double-confirm the value reads "60px" rather than something else — recorded as read from metadata's `label` text-node position/sizing pattern matching the other 60px callouts, not re-screenshot-verified.
- No prose/rule text anywhere on this page — spacing communicated entirely via the annotated screen mock, consistent with this file's usage-example-gallery pattern seen on other pages (e.g. Data Table).
- Page-wide instance sweep not run (known intermittent read-only throw); only the 5 explicit IDs above were sampled — not exhaustive for every component on this screen (e.g. tag chips, ellipse/label combo in item groups untested).
