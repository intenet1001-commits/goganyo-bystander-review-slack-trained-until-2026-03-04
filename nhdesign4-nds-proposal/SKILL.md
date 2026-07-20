---
name: nhdesign4-nds-proposal
description: Generate an NDS-standard feature proposal deliverable — a PPT 기획서 (slide deck) plus a 화면 흐름 개요 (screen flow diagram) — for a given feature, built from real NDS components per nhdesign4's learned design system (v4 series — reads nhdesign4_* tables; forked from the v3 series). Trigger: "/nhdesign4-nds-proposal <feature name or scope>", or any request to make a "기획서", "화면흐름개요", "PPT 기획서", "screen flow overview", or "proposal deck" for an NDS feature.
---

# nhdesign4-nds-proposal

This is the nhdesign4-series counterpart of the v3 skill at
`~/.claude/skills/.claude/worktrees/nhdesign3-knowhow/nhdesign3-nds-proposal/SKILL.md`, reading
from the forked `nhdesign4_*` tables instead of `nhdesign3_*`.

Produces the two-part deliverable pattern discovered in the 해외주식의결권 reference file
(`zRrojC3HnGljRiRYMFiCjX`, "해외주식 의결권 투표 — NDS 기획서 - 화면설계 — Copy"): a **PPT
기획서** slide deck and a **화면 흐름 개요** flow diagram, both built from real NDS component
instances in Figma — not boxes-and-labels mockups, not a written spec document.

This skill is a thin orchestrator. It does not carry its own design rules — it hands off to
`nhdesign4` for everything about components, tokens, and quality, and to `figma-use` for
everything about writing Figma. Load `nhdesign4` first, always.

## 0. Load prerequisites (mandatory, in order)

1. Invoke the `nhdesign4` skill. Do not skip this even if it was loaded earlier in the
   session — its BUILD-mode rubric and DB access pattern are required below.
2. Load `figma-use` before any `use_figma` call (nhdesign4's own rule; this skill inherits it).
3. Pull the template spec and the BUILD-mode prerequisites in one query:

   ```sql
   select s.name, p.node_id, p.page_name, p.content_md from nhdesign4_pages p
   join nhdesign4_sources s on s.id = p.source_id
   where s.file_key in ('zRrojC3HnGljRiRYMFiCjX','QFs41kWBHUMQt3k1oRmzgK','synthesis-nhdesign3')
   order by s.name, p.page_name;
   ```

   This returns, in one pass: the slide-deck pattern (`ppt-proposal-slide-pattern`), the
   flow-overview pattern (`screen-flow-overview-pattern`), the 해외주식의결권 BUILD lessons —
   including the verified connector-drawing recipe (`화면 흐름도(Flow Overview) 커넥터 제작
   레시피 — 검증된 패턴`, id `7c1b8a79-8e64-40c5-b110-2a3f2eaf3e40`): orthogonal-only routing
   (never a single diagonal line from source-center to target-center), coordinates always
   recomputed from live node bounds at draw time (never cached/stale), and explicit
   arrowhead-triangle geometry (never `createPolygon()` + rotation) — and the SYNTHESIS
   vibe-rubric/token-port/copy-tone rows. All five are required reading before generating
   anything — the template rows describe *shape*, the lesson/synthesis rows describe
   *substance* (real keys, real tokens, the quality gate).

## 1. Scope the feature

Ask (or infer from the request) what screens/flow the proposal covers. Two cases:

- **Feature already exists in nhdesign4** (a `project`-kind source, or a screen built in a
  prior BUILD-mode session): read its pages/components from the DB — this is the fast path,
  the proposal is essentially re-presenting already-verified work.
- **New/unbuilt feature**: run nhdesign4 Mode 2 (BUILD) first to construct the actual screens
  and popups/sheets in Figma, with real component instances and verified keys. The proposal
  cannot be built from a description alone — every mockup in both deliverables must be a real
  rendered screen, per the template's own rule ("real component instances, not boxes").

Either way, enumerate explicitly: the ordered list of primary-flow screens, and every
popup/sheet/dialog reachable from any of them. This list drives both deliverables.

## 2. Build the 화면 흐름 개요 first

**Page structure (verified live via Plugin API, 2026-07-18):** the PPT 기획서 slides and the
화면 흐름 개요 diagram belong on the SAME Figma page — PPT slides in the top row (y=0), the flow
overview laid out below them. Before appending any top-level content to this page, call
`setCurrentPageAsync` explicitly to select it. Never rely on `figma.currentPage`'s default —
doing so has previously placed flow-overview content into the wrong page silently. Do not
create two separate Figma pages for this deliverable.

Per the `screen-flow-overview-pattern` row: lay out each primary-flow screen left-to-right at
**the same 540px scale used for the popup mockups** (verified 2026-07-18 by human review — an
earlier 297px "compact" scale for screens next to 540px popups read as a mistake, not a
deliberate choice, no matter how clearly annotated; there is no real reason to shrink screens
just to fit more on one canvas, since Figma's canvas isn't size-constrained). Space screens
~180px apart (not 60px) — the extra room measurably reduces connector-routing complexity.
Numbered-circle step labels above each
(①②③...), green `flow:` arrows connecting them in sequence — per the verified connector
recipe: three sibling nodes per arrow (stroke-only path + filled start-dot ellipse + filled-
triangle arrowhead with explicitly computed vertices, never `createPolygon()`+rotation),
routed orthogonally with rounded corners (never a diagonal line straight through intervening
frame content), with every coordinate re-read from live node bounds immediately before
drawing — and a separate `팝업·시트` section below holding one Mockup frame per popup/sheet
(Scrim + Sheet-or-Layer-Popup, per the pattern's exact recipe), each connected back to its
origin screen by a `branch:` arrow using the same recipe.

**When drawing 2+ branch arrows through the same drop zone** (recipe §6, added after a real
collision was found and fixed 2026-07-18): assign each a distinct lane y-level (spacing >
corner radius, e.g. 35-40px), with the widest-x-span arrow on the outermost/last lane so any
unavoidable crossing is a clean straight-line perpendicular intersection, never a line cutting
through another arrow's rounded corner. Always delete and rebuild ALL connectors in the drop
zone together from freshly-read live bounds in one script — patching an existing arrow's
coordinates after it has been cloned/reparented/grouped has produced arrowheads rendering over
1000px away from their own line (stale internal vectorPaths vs. the node's new transform). When
a connector's origin is a specific nested trigger element (a link/button/card inside a screen,
not the screen itself), always read its position via `node.absoluteBoundingBox` — never sum
parent offsets manually. A trigger nested 3-4 levels deep (e.g. Body > banner > text-block >
link) has produced 68-125px position errors when only 2 levels were summed by hand.

Building this before the slides is not optional — enumerating every branch arrow is what
surfaces missing states (empty state, already-done dialog, error case) before they're baked
into a slide deck. If a state the feature clearly needs (e.g. an already-submitted guard) has
no branch arrow, that's a gap — either build it now or flag it explicitly, don't silently omit.

## 3. Build the PPT 기획서

Per the `ppt-proposal-slide-pattern` row, in order:

1. **Cover slide**: feature title, subtitle, team/eyebrow label, optional prototype-link
   block, thin divider, date+version (left) / org name (right).
2. **One content slide per primary-flow screen** (reuse the exact screen instances built in
   step 2 as the embedded mockup — do not rebuild them): Korean+English header pair, thin
   divider, scaled-up mockup with numbered callout badges, right-column `화면경로` box +
   `화면구분` box, numbered detail-description list matching the callout badges.
3. **Closing slide**: centered "End of Document" + thick rule. Nothing else.

## 4. Quality gate (mandatory, both deliverables)

Run nhdesign4's BUILD-mode vibe-rubric checklist (540px canvas / channel-correct fonts / NDS
green CTA / #EBEDF1 bg / dot-format dates / 해요체 register / quickmenu_basic present / density
matched to reference / every `flow:` and `branch:` connector arrow actually present and
visibly joining its two named endpoints — pixel-correct screens with missing arrows is NOT a
pass) against every screen mockup and every connector used in both the flow overview and the
slides — they're the same instances, so one pass covers both. Then screenshot-compare the
finished flow overview and the finished slide deck against the reference file
(`zRrojC3HnGljRiRYMFiCjX`) for layout fidelity to the template shape itself (badge placement,
화면경로/화면구분 box structure, arrow style). A deliverable that skips either check is not done.

**Numbered callout badges on PPT slides must be anchored to the real target element's
`absoluteBoundingBox`, never placed by evenly-spaced guessing** (same failure class as
connector arrows — see `knowhow-12`). For each slide's numbered badge: find the real element
it describes on the 540px source screen (Screens page), take its `absoluteBoundingBox`, scale
by `mockupFrame.width / 540`, and offset by the mockup frame's own position. **When writing the
result back to `node.x`/`node.y`, convert from absolute to the badge's own parent's local
coordinates first** (`localX = absX - node.parent.absoluteBoundingBox.x`) — assigning an
absolute coordinate straight to `.x` on a node whose parent is a Slide/Section frame (not the
page) silently double-offsets it off-slide. If no real element matches a described action
(e.g. a feature not yet present in the built screen), anchor to the closest real element and
say so explicitly — never invent a floating position.

Write back: if this run discovers a new verified component key, a template deviation that
turned out necessary, or a new popup/sheet pattern, update `nhdesign4_components` /
`nhdesign4_pages` / append a `nhdesign4_ledger` row — same write-back discipline as BUILD mode.

## Non-goals

- Not a general slide-maker — always produces both parts (deck + flow), even if the user only
  asked for one, since the flow overview is what makes the deck's screens trustworthy. If the
  user explicitly wants only one part, say so back before dropping the other.
- Does not invent screens or copy. Anti-invention escalation is inherited from nhdesign4 BUILD
  mode: sample from a rendered instance, take it from a named reference screen, or flag the
  assumption — never guess silently.
</content>
