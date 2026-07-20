---
name: nhdesign4-project-proposal
description: Generate an NDS feature proposal deliverable — a PPT 기획서 (slide deck) plus a 화면 흐름 개요 (screen flow diagram) — by re-presenting an already-finished, shipped NDS feature from nhdesign4's `project`-kind knowledge, rather than building new screens from scratch (that's `nhdesign4-nds-proposal`'s job). Reads `nhdesign4_sources where kind='project' and status='complete' and domain='app'`. Trigger: "/nhdesign4-project-proposal <feature name>", or any request to make a "기획서"/"화면흐름개요" that references an existing/shipped NDS feature by name (공개매수청약, 국내주식 권리, 채권권리 행사, 해외주식의결권, etc.) rather than a new one. This is the v4-series lane-2 skill that `nhdesign4/SKILL.md` Mode 5 routes to — it has no v3 predecessor (v3's `nhdesign3-nds-proposal` never split project-reference work out into its own skill; this is a v4-only design improvement).
---

# nhdesign4-project-proposal

v4-series skill, reads the forked `nhdesign4_*` tables (not `nhdesign3_*`). Sibling to
`nhdesign4-nds-proposal`, `nhdesign4-homepage-proposal`, `nhdesign4-knowhow-app`, and
`nhdesign4-knowhow-homepage`. Fills **Mode 5, lane 2** of `nhdesign4/SKILL.md`'s router — the
lane that was defined in that Mode 5 menu from the start but never had a real skill to hand off
to until now.

**Why this is a separate skill from `nhdesign4-nds-proposal`, not a mode of it**: `project`-kind
rows are finished, shipped, signed-off work — re-presenting one into deck+flow format is a much
narrower task (no BUILD-mode component lookup, no new-screen construction, no risk of inventing
anything) than `nds-proposal`'s job of building screens from guide-level component knowledge.
Keeping them separate means a request that names an existing shipped feature never accidentally
triggers a full from-scratch BUILD pass, and a request for something genuinely new never
silently reuses stale finished-project content.

This skill is a thin orchestrator. It hands off to `nhdesign4` for DB access and to `figma-use`
for everything about writing Figma. Load `nhdesign4` first, always.

## 0. Load prerequisites (mandatory, in order)

1. Invoke the `nhdesign4` skill. Do not skip this even if it was loaded earlier in the session —
   its Storage section (the native `domain` column, the `kind` taxonomy) is required below.
2. Load `figma-use` before any `use_figma` call.
3. Pull the template spec and every eligible finished-project row in one query:

   ```sql
   select s.name, s.file_key, s.status, s.domain, p.node_id, p.page_name, p.content_md
   from nhdesign4_pages p
   join nhdesign4_sources s on s.id = p.source_id
   where s.file_key in ('zRrojC3HnGljRiRYMFiCjX','QFs41kWBHUMQt3k1oRmzgK','synthesis-nhdesign3')
      or (s.kind = 'project' and s.status = 'complete' and s.domain = 'app')
   order by s.name, p.page_name;
   ```

   This returns, in one pass: the slide-deck pattern (`ppt-proposal-slide-pattern`), the
   flow-overview pattern (`screen-flow-overview-pattern`), the SYNTHESIS vibe-rubric/token-port
   rows (shared verbatim with `nhdesign4-nds-proposal`, reused as-is) — plus every **complete**
   `project`-kind, app-domain row. **The `status = 'complete'` filter is mandatory, not
   optional**: some `project`-kind rows are still `in_progress` at any given time, and which ones
   drifts as work ships — don't rely on a remembered list. To see the current `in_progress` set
   (e.g. because the requested feature didn't match in step 1), run
   `select name from nhdesign4_sources where kind='project' and status='in_progress' and
   domain='app'` live rather than trusting a cached name list. Pulling an unfinished feature into
   a deck that presents it as shipped/signed-off would misrepresent it. If the user explicitly
   asks for one of the in_progress features, say so explicitly and ask whether they want a
   from-scratch build via `nhdesign4-nds-proposal` instead (the honest path for unfinished work),
   rather than silently loosening the filter.

## 1. Scope the feature

Match the requested feature name against the query results from step 0.3.

- **Match found** (a `complete` `project`-kind row): this is the fast path — the proposal is
  re-presenting already-verified, shipped work. Read its page(s) in full.
- **No match, but the name matches an `in_progress` project row**: flag this explicitly per step
  0.3's caveat — do not proceed silently.
- **No match at all**: this feature has no finished-project record. Redirect to
  `nhdesign4-nds-proposal` instead (it builds new screens from guide-level knowledge) — do not
  attempt to fabricate a "finished" project from nothing.

Either way once scoped: enumerate explicitly the ordered list of primary-flow screens, and every
popup/sheet/dialog reachable from any of them. This list drives both deliverables.

## 2. Build the 화면 흐름 개요 first

Identical procedure to `nhdesign4-nds-proposal` step 2 (same `screen-flow-overview-pattern`
row, same page/page-selection discipline via `setCurrentPageAsync`, same 540px uniform scale,
~180px screen spacing, orthogonal-only `flow:`/`branch:` connector recipe with live-bounds
coordinate re-reads, same lane-collision handling for 2+ branch arrows through one drop zone).
The only difference: every screen mockup here is a **re-presentation of an already-shipped
screen** (real component instances the finished project already used), not a newly-built one —
there is no BUILD-mode component-lookup step, since the components were already chosen and
verified when the feature shipped.

## 3. Build the PPT 기획서

Identical three-part shape to `nhdesign4-nds-proposal` step 3 — Cover / one content slide per
primary-flow screen (reusing the flow-overview instances) / Closing — per the
`ppt-proposal-slide-pattern` row, with bilingual Korean+English header pairs.

## 4. Quality gate (mandatory, both deliverables)

Same two-part gate as `nhdesign4-nds-proposal` step 4: the BUILD-mode vibe-rubric checklist
(540px canvas / channel-correct fonts / NDS green CTA / #EBEDF1 bg / dot-format dates / 해요체
register / quickmenu_basic present / every connector arrow actually present and visibly joining
its endpoints), plus a screenshot-compare of the finished flow overview and slide deck against
the `zRrojC3HnGljRiRYMFiCjX` template file for shape fidelity. Numbered PPT callout badges
follow the same real-`absoluteBoundingBox`-anchor + local-coordinate-conversion rule as
`nhdesign4-nds-proposal` (never evenly-spaced guessing, never an absolute coordinate assigned
straight to a slide-child node's `.x`/`.y`).

Write back: if this run discovers a page/content gap in the finished-project record used, update
the relevant `nhdesign4_pages` row (`reviewed_date` bump) or append a `nhdesign4_ledger` row —
same write-back discipline `nhdesign4-nds-proposal` uses.

## Non-goals

- Not for new/unbuilt features — that's `nhdesign4-nds-proposal`'s job. This skill only
  re-presents `kind='project', status='complete', domain='app'` rows; it never builds new
  screens from guide-level component knowledge.
- Not for `in_progress` project rows without an explicit user override and acknowledgment per
  step 0.3 — silently including unfinished work would misrepresent it as shipped.
- Not for homepage/desktop-website features — no `project`-kind homepage source exists yet (all
  7 current project rows are app-domain). A homepage request naming an "existing feature" falls
  back to `nhdesign4-homepage-proposal`'s `website`-kind rows instead, per `nhdesign4/SKILL.md`
  Mode 5 lane 4 — this skill has nothing to offer a homepage request.
- Not a general slide-maker — always produces both parts (deck + flow), even if the user only
  asked for one. If the user explicitly wants only one part, say so back before dropping the
  other.
