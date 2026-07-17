---
name: nds-proposal
description: Generate an NDS-standard feature proposal deliverable — a PPT 기획서 (slide deck) plus a 화면 흐름 개요 (screen flow diagram) — for a given feature, built from real NDS components per nhdesign3's learned design system. Trigger: "/nds-proposal <feature name or scope>", or any request to make a "기획서", "화면흐름개요", "PPT 기획서", "screen flow overview", or "proposal deck" for an NDS feature.
---

# nds-proposal

Produces the two-part deliverable pattern discovered in the 해외주식의결권 reference file
(`zRrojC3HnGljRiRYMFiCjX`, "해외주식 의결권 투표 — NDS 기획서 - 화면설계 — Copy"): a **PPT
기획서** slide deck and a **화면 흐름 개요** flow diagram, both built from real NDS component
instances in Figma — not boxes-and-labels mockups, not a written spec document.

This skill is a thin orchestrator. It does not carry its own design rules — it hands off to
`nhdesign3` for everything about components, tokens, and quality, and to `figma-use` for
everything about writing Figma. Load `nhdesign3` first, always.

## 0. Load prerequisites (mandatory, in order)

1. Invoke the `nhdesign3` skill. Do not skip this even if it was loaded earlier in the
   session — its BUILD-mode rubric and DB access pattern are required below.
2. Load `figma-use` before any `use_figma` call (nhdesign3's own rule; this skill inherits it).
3. Pull the template spec and the BUILD-mode prerequisites in one query:

   ```sql
   select s.name, p.node_id, p.page_name, p.content_md from nhdesign3_pages p
   join nhdesign3_sources s on s.id = p.source_id
   where s.file_key in ('zRrojC3HnGljRiRYMFiCjX','QFs41kWBHUMQt3k1oRmzgK','synthesis-nhdesign3')
   order by s.name, p.page_name;
   ```

   This returns, in one pass: the slide-deck pattern (`ppt-proposal-slide-pattern`), the
   flow-overview pattern (`screen-flow-overview-pattern`), the 해외주식의결권 BUILD lessons,
   and the SYNTHESIS vibe-rubric/token-port/copy-tone rows. All four are required reading
   before generating anything — the template rows describe *shape*, the lesson/synthesis
   rows describe *substance* (real keys, real tokens, the quality gate).

## 1. Scope the feature

Ask (or infer from the request) what screens/flow the proposal covers. Two cases:

- **Feature already exists in nhdesign3** (a `project`-kind source, or a screen built in a
  prior BUILD-mode session): read its pages/components from the DB — this is the fast path,
  the proposal is essentially re-presenting already-verified work.
- **New/unbuilt feature**: run nhdesign3 Mode 2 (BUILD) first to construct the actual screens
  and popups/sheets in Figma, with real component instances and verified keys. The proposal
  cannot be built from a description alone — every mockup in both deliverables must be a real
  rendered screen, per the template's own rule ("real component instances, not boxes").

Either way, enumerate explicitly: the ordered list of primary-flow screens, and every
popup/sheet/dialog reachable from any of them. This list drives both deliverables.

## 2. Build the 화면 흐름 개요 first

Per the `screen-flow-overview-pattern` row: lay out each primary-flow screen left-to-right at
compact scale (~297px wide device frames), numbered-circle step labels above each
(①②③...), green `flow:` arrows connecting them in sequence (ellipse start-dot + vector body +
arrowhead), and a separate `팝업·시트` section below holding one Mockup frame per popup/sheet
(Scrim + Sheet-or-Layer-Popup, per the pattern's exact recipe), each connected back to its
origin screen by a `branch:` arrow.

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

Run nhdesign3's BUILD-mode vibe-rubric checklist (540px canvas / channel-correct fonts / NDS
green CTA / #EBEDF1 bg / dot-format dates / 해요체 register / quickmenu_basic present / density
matched to reference) against every screen mockup used in both the flow overview and the
slides — they're the same instances, so one pass covers both. Then screenshot-compare the
finished flow overview and the finished slide deck against the reference file
(`zRrojC3HnGljRiRYMFiCjX`) for layout fidelity to the template shape itself (badge placement,
화면경로/화면구분 box structure, arrow style). A deliverable that skips either check is not done.

Write back: if this run discovers a new verified component key, a template deviation that
turned out necessary, or a new popup/sheet pattern, update `nhdesign3_components` /
`nhdesign3_pages` / append a `nhdesign3_ledger` row — same write-back discipline as BUILD mode.

## Non-goals

- Not a general slide-maker — always produces both parts (deck + flow), even if the user only
  asked for one, since the flow overview is what makes the deck's screens trustworthy. If the
  user explicitly wants only one part, say so back before dropping the other.
- Does not invent screens or copy. Anti-invention escalation is inherited from nhdesign3 BUILD
  mode: sample from a rendered instance, take it from a named reference screen, or flag the
  assumption — never guess silently.
