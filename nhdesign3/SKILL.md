---
name: nhdesign3
description: "Entry point for NH투자증권 NDS design work, backed by Postgres (Supabase) instead of markdown files. Companion/competitor to `csdesign` — same target domain (NDS: component keys, variants, tokens, per-category rules) and the same rigorous learn methodology (figma.root.children enumeration, verbatim screenshot transcription, honest N/M coverage reporting), but knowledge is stored in queryable `nhdesign3_*` tables in the shared Supabase project `portmanagement` rather than in `LEADER.md`/`CORE.md`/`INDEX.md` files. Covers all six NDS guide files (UX Guide, M.web, CI, Templates, Library, PPT Templates) plus learned project files and production-website records. Use when asked to learn/build/verify any NDS file or NH design work via nhdesign3, or to compare nhdesign3 vs csdesign performance."
risk: safe
---

# nhdesign3

DB-backed sibling of `csdesign/nds`. Built to A/B-test **storage backend and query
ergonomics**, not learn methodology — the actual Figma-learning discipline (enumerate via
`figma.root.children`, never `get_metadata`'s bare page list or a file's own TOC; screenshot
every rule-bearing frame because layer names lie; quote verbatim; report N/M honestly) is
identical to `csdesign`'s, per `figma-learn-all-pages`. What differs is that knowledge lands
in Postgres tables instead of a `LEADER.md`/`CORE.md`/`INDEX.md`/`LEDGER.md` file split.

**Why this exists**: `csdesign/nds` hit a real scaling wall — `CORE.md` grew to ~36k tokens
across 3 learned Figma files and became too large to read in one pass, forcing a file split.
A relational store sidesteps that ceiling by construction (indexed lookup instead of
sequential file read) and enables queries a flat INDEX table can't (full-text search across
verbatim rule text, not just a hand-maintained topic→note mapping). This skill exists to
measure whether that tradeoff is actually worth the added infra (a live DB dependency,
network round-trips instead of local file reads) — see `LEDGER` decision log below.

**Provenance**: nhdesign3 started as a **fork of nhdesign2** (2026-07-16: all rows copied
verbatim into `nhdesign3_*` tables, same ids/content/schema) but has since **diverged
substantially**: nhdesign3 went on to learn NDS_UX Guide, NDS_M.web, NDS_CI, four project
files, and two production websites, and ran a real BUILD session (해외주식의결권) whose lessons
and verified component keys live only in `nhdesign3_*`. As of 2026-07-17, nhdesign2 still
holds the original 3-source/79-page snapshot while nhdesign3 holds 12 sources / 178 pages —
they are no longer comparable copies.

## Storage

Supabase project **`portmanagement`** (ref `fvkmkqhavlqmltowwpfc`, Seoul), tables prefixed
`nhdesign3_` — chosen over a dedicated project because scope here is a knowledge cache, not an
app; keeping it in an existing project avoids spinning up new billing/infra for an experiment.
Schema: `supabase/migrations/00000000000001_nhdesign3_init.sql`.

**Read/write via `supabase db query`, not `db push`.** `portmanagement` has its own
unrelated app migration history — `db push`/`migration repair` would touch that project's
real migration bookkeeping. `db query` (raw SQL, no migration-history involvement) is the
only safe write path here. Never run `supabase db push`, `migration repair`, or `db reset`
against this project from this skill.

**Exact invocation** (both flags matter — without `--linked` the CLI dials a local Postgres
and fails; the project link lives in this skill dir's `supabase/.temp/`, so run from here):

```bash
cd ~/.claude/skills/nhdesign3
supabase db query --linked "select ..."          # inline, single statement
supabase db query --linked -f path/to/file.sql   # multi-statement / anything with -- comments
```

Inline SQL that begins with `--` comments gets eaten by the flag parser — use `-f` for
scripts. Multi-agent LEARN fan-outs must write per-agent temp SQL files with unique names
(agents once nearly clobbered each other via shared `/tmp` filenames — ledger anchor
`concurrent-agent-tmp-file-collision-2026-07-16`).

**Parallel agents must NEVER call the supabase CLI concurrently.** The CLI's temp login role
is shared per project; concurrent `db query --linked` calls race its initialization and
rotate each other's credentials (`SASL: password authentication failed`), producing endless
retry loops — a 6-agent fan-out thrashed for an hour with zero completions on 2026-07-17
(ledger `supabase-cli-concurrent-auth-race-2026-07-17`). Required pattern for any fan-out:
the orchestrator dumps the needed tables to local JSON once (`select json_agg(t) from
nhdesign3_x t`), agents read the dump and emit SQL files, the orchestrator applies them
serially with `-f`.

| Table | Mirrors (csdesign) | Purpose |
|---|---|---|
| `nhdesign3_sources` | `nds/LEADER.md` "Learned files" table | One row per Figma file: fileKey, kind, `total_pages` (the `figma.root.children` denominator), `learned_pages`, status |
| `nhdesign3_pages` | `nds/projects/*.md` | One row per content page — verbatim quoted rules, naming-convention reliability per page, sections studied |
| `nhdesign3_components` | `nds/CORE.md` | One row per distinct component: key, key kind (SET/COMPONENT), tier (published/page-local/unpublished), variants, tokens |
| `nhdesign3_topics` | `nds/INDEX.md` | topic → page_ids/component_ids, with a `flag` (none/contested/blocked) |
| `nhdesign3_ledger` | `nds/LEDGER.md` | Contested/blocked findings, `anchor` slug referenced from `nhdesign3_topics.flag` rows |

## Scope (current)

**The DB is the source of truth, not this section** — it will drift as more is learned.
Always start a LEARN/BUILD/VERIFY pass with:

```sql
select name, file_key, kind, total_pages, learned_pages, status
from nhdesign3_sources order by kind, name;
```

Snapshot as of 2026-07-17 (post audit+repair, +proposal-template add) — **14 sources, 184
pages, 191 components (65 with internal-geometry tokens), 190 topics, 7 open ledger rows**:

| Source | fileKey | Kind | Pages |
|---|---|---|---|
| NDS_UX Guide | `nEINCcmC7AVkWSqRkq60y1` | guide | 28/28 |
| NDS_M.web | `uVcmG6GgOl2J8EOlc22wob` | guide | 30/30 |
| NDS_CI | `KmpaYeoYh41F6nyIKvBQ7h` | guide | 16/16 |
| NDS_Templates | `1xE0qvn2yv3ZkQ9BwhKT1y` | guide | 39/39 |
| NDS_Library | `72zrHgMLM4zhCjgSuTf7cC` | guide | 38/38 |
| NDS_PPT Templates | `nh0nlwHeVAQso8qRmFJ3sv` | guide | 2/2 |
| 반영완료 ⭐️ 공개매수청약 | `sFjiOKmTJP8VnhTTMETwW0` | project | 6/6 |
| 반영완료 ⭐️ 국내주식 권리 | `ZkwarjFkN8BiGolWO7PcwI` | project | 6/6 |
| 반영완료 ⭐️채권권리 행사 | `FnGtZI4foLBk4nLAZmodAx` | project | 3/3 |
| 해외주식의결권 (BUILD lessons) | `QFs41kWBHUMQt3k1oRmzgK` | project | 8/8 |
| nhnamuh-production (mynamuh.com) | — | website | 1/1 |
| nhsec-production | — | website | 1/1 |
| SYNTHESIS — vibe rubric & cross-cutting rules | `synthesis-nhdesign3` | guide | 4/4 |
| PPT_Proposal+FlowOverview Template | `zRrojC3HnGljRiRYMFiCjX` | guide | 2/2 |

The PPT_Proposal+FlowOverview Template source (added 2026-07-17) holds the two-page structural
spec behind the global `nds-proposal` skill (`~/.claude/skills/nds-proposal/SKILL.md`) —
`ppt-proposal-slide-pattern` (Cover/content-slide/Closing layout) and
`screen-flow-overview-pattern` (numbered screens connected by green flow/branch arrows, with a
popup·시트 mockup section) — learned verbatim from a real shipped example (해외주식의결권 NDS
기획서 파일, fileKey `zRrojC3HnGljRiRYMFiCjX`, distinct from the BUILD-lessons source above
which shares the same feature name but a different fileKey). Invoke `/nds-proposal <feature>`
to generate a new 기획서+화면흐름개요 pair for any NDS feature; it loads this skill first.

The SYNTHESIS source (added 2026-07-17 after a 6-auditor quality audit) holds rules distilled
from the corpus rather than transcribed from Figma: the **vibe-rubric** page (mandatory BUILD
checklist), **csdesign-token-port** (app-side hex/fonts confirmed by instance sampling —
fills the NDS_Colors gap), **csdesign-defects-port** (broken component sets + manual header
recipe), and **copy-tone-rule** (해요체 현행 / 합니다체 레거시).

All six guide fileKeys correspond to the live NDS Figma URLs
(`figma.com/design/<fileKey>/...`). The 해외주식의결권 source is special: its 8 "pages" are
**BUILD-session lesson notes** (verified component keys, plugin-API pitfalls, flow-diagram
recipes), not Figma page transcriptions — see Mode 2.

Per-file caveats that survive from the original learn passes:

- **Partial variant coverage is recorded honestly, per row.** Treat a `status='learned'`
  page row as "the page was visited and something verbatim was recovered," not "every
  variant on it is documented" — large multi-variant galleries often had only 2–4 of dozens
  of variants screenshot-verified, with the rest explicitly listed as unstudied gaps in
  `content_md`. Check the row's own `content_md` for its stated gaps before relying on it.
- **Layer names lie** — confirmed repeatedly across files (e.g. one TEXT node named
  identically across 7+ unrelated frames). Per-page reliability is recorded in
  `nhdesign3_pages.naming_convention`.
- **NDS_Library**: `get_metadata`/`get_screenshot` alone can't confirm `remote:true`
  (published-vs-page-local), so most components sighted there are logged
  `status='unverified'` despite coming from the library file — "found in Library" ≠
  "confirmed published." The `nds-lib-colors` page is a redirect stub to a separate
  color-token library file not reachable from this node ("no tokens found here" is honest,
  not a gap to fill by invention).
- **NDS_PPT Templates**: 2 content pages, each holding 13 slide-template frames (1920x1080
  + a 1.5x/2880x1620 sibling per slide); documented one combined note per page. Open
  ledger anchor `ppt-n2-orphan-frames`: two unexplained extra 2880x1620 frames on the N2
  page — check before using slides 01/03 at 1.5x.
- **Topic names are not unique across sources** — the same concept (tab, card, popup, box
  button, …) often has one topic row from NDS_Templates and one from NDS_Library. Query by
  keyword and read **all** matching topic rows, not just the first.

## Mode 1 — LEARN

1. Load `figma-learn-all-pages`, then `figma-use` — same as `csdesign`. This skill does not
   relax any of that discipline.
2. Enumerate via `figma.root.children`; if `nhdesign3_sources.total_pages` is already set for
   the fileKey, cross-check rather than blindly trusting either source.
3. Per content page: `get_metadata(nodeId)` → screenshot every rule-bearing frame → verbatim
   transcribe. **Confirm naming-convention reliability per page** (record it in
   `nhdesign3_pages.naming_convention` — "reliable" / "unreliable" / "mixed" / whatever the
   page actually shows) — do not assume it carries from a prior page in the same file.
4. `INSERT ... ON CONFLICT (source_id, node_id) DO UPDATE` into `nhdesign3_pages` via
   `supabase db query`. Promote any distinct component sighted into `nhdesign3_components`
   (full 40-hex key or null — never an ellipsis; classify tier before trusting a key, per
   `figma-learn-all-pages`).
5. **Registering is not optional** — update `nhdesign3_sources.learned_pages` and add/update
   `nhdesign3_topics` rows for the page's subject. A page inserted into `nhdesign3_pages` but
   with no `nhdesign3_topics` row pointing at it is exactly the "17 of 20 registered" failure
   `figma-learn-all-pages` warns about, just in DB form instead of file form.
6. File cross-file or self-contradicting findings into `nhdesign3_ledger`, flag the relevant
   `nhdesign3_topics` row.

## Mode 2 — BUILD

0. **Read the BUILD lessons and the vibe rubric first — both are mandatory.** The
   해외주식의결권 source (8 lesson pages: verified component keys, plugin-API bugs, the
   Sectionbar ban) AND the SYNTHESIS source (vibe-rubric checklist, app-side token/font
   port, broken-set diagnostics, copy-tone rule). One query gets both:

   ```sql
   select s.name, p.page_name, p.content_md from nhdesign3_pages p
   join nhdesign3_sources s on s.id = p.source_id
   where s.file_key in ('QFs41kWBHUMQt3k1oRmzgK','synthesis-nhdesign3') order by s.name, p.page_name;
   ```

1. **Reference-first (mandatory — skipping this is the #1 machine-output failure mode).**
   Before touching components, pick the nearest human-made screen(s) from the `project`-kind
   sources (공개매수청약 / 국내주식 권리 / 채권권리 행사) and read their pages for: section
   order, density, spacing rhythm, real microcopy tone, and which components a human chose
   for which job. Name the chosen reference screen(s) in your working notes — the final
   quality gate compares against them. If no project screen resembles the target, say so
   explicitly and fall back to the closest guide Templates page, flagging the build as
   reference-weak. Note: project pages mix build-facing content with LEARN forensics
   (naming-reliability notes, coverage bookkeeping) — read for the former, skip the latter.

2. Query `nhdesign3_components` for the component(s) needed. Rows with
   `status='verified'` carry **real, createInstance()-tested keys** (SET key in
   `component_key`, per-variant keys in `variants[]`); the majority are honest
   name/variant sightings with `component_key IS NULL` — for those, recover the key live
   via `search_design_system(query, fileKey)`. Real keys only — never invent one.

   ```sql
   select name, component_key, key_kind, variants, notes, status
   from nhdesign3_components where name ilike '%btn%' or 'button' = any(string_to_array(lower(name),'_'));
   ```

3. **SET→variant two-step (mandatory for every variant component).**
   `search_design_system` returns component-**set**-level keys; passing one to
   `figma.importComponentByKeyAsync` fails with "Component with key ... not found."
   Instead: `figma.importComponentSetByKeyAsync(setKey)` → find the needed variant →
   `setNode.children[i].key` is the key that actually works with `createInstance()`.
   Known traps (details in the `검증된 컴포넌트 키 레지스트리` topic / page
   `component-key-registry`): `nds_icon_arrow` has two duplicate SET keys in the library;
   `label_risk` has two incompatible naming revisions — never match variants by name
   alone, screenshot-confirm; `btn_bottom_layerpopup` lives in the **NDS_M.web** library,
   not NDS_Library; `Sectionbar` is **banned standalone** (ledger
   `sectionbar-offset-bug`).

4. Query `nhdesign3_topics` for the topic — by keyword (GIN-indexed, keywords are
   bilingual ko/en) and read **every** matching row (topic names repeat across
   Templates/Library). Follow `page_ids`/`component_ids` to the verbatim rules. Full-text
   fallback when keywords miss: `where content_md ilike '%…%'` on `nhdesign3_pages`. If a
   topic row's `flag` is `contested`/`blocked`, read the linked `nhdesign3_ledger` row
   before building.

   ```sql
   select topic, page_ids, component_ids, flag from nhdesign3_topics
   where keywords && array['popup','팝업'];
   ```

5. Build per `figma-use`/`figma-generate-design`, with the rubric's hard constraints:
   **540px canvas** for MTS/app screens (app-shell components have fixed-px children sized
   for 540 — a 375 frame clips them into what looks like mangled Korean text);
   **channel-correct fonts** (app = NanumBarunGothic + Roboto numerals; M.web = Pretendard —
   never crossed). **Anti-invention escalation**: when the store and live Figma are both
   silent on something (a color, a spacing, a variant), do not silently guess — either
   sample it off a rendered instance (methodology in `csdesign-token-port`), take it from
   the named reference screen, or flag it as a stated assumption in your output. A page
   row's `status='learned'` still means "visited, something verbatim recovered" — check its
   own `content_md` gap notes before treating any variant list as complete.

6. Precedence when guide and project sources conflict: component facts from the guide
   store (NDS_* files), screen structure/behaviour from shipped production (the
   `project`-kind sources: 공개매수청약, 국내주식 권리, 채권권리 행사 and the `website`
   rows) — more specific wins on conflict.

7. **Quality gate before declaring done — two checks, both mandatory.**
   (a) **Vibe rubric pass**: walk the checklist at the bottom of the `vibe-rubric` page
   (540px canvas, channel font, NDS green CTA present, bg #EBEDF1, dot-format dates,
   해요체 register, quickmenu_basic on top-level screens, no '더보기' next to notices,
   density matched to the named reference). A geometrically perfect screen that fails
   these reads as machine-made — the 2026-07-16 proto screens passed geometry and failed
   exactly here. (b) **Screenshot compare vs the NAMED reference from step 1** (not just
   the component spec pages): `get_screenshot` the built node, view it next to the
   reference screen, and reconcile spacing, density, and tone deltas. A build that was
   never screenshot-compared is not done. New verified keys or pitfalls discovered during
   the build go back into the DB (update the component row to `status='verified'`, append
   to the 해외주식의결권 lesson pages or add a new one) — that write-back loop is what
   keeps BUILD quality compounding.

## Mode 3 — VERIFY

Re-run enumeration regardless of when a file was last learned (pages get added). Re-read the
existing `nhdesign3_pages` rows as claims to check, not a blank slate. Update in place with a
`reviewed_date` bump — never silently overwrite; note old → new in `nhdesign3_ledger` if a
claim changes.

## Decision log (why DB, not files)

- **2026-07-16**: User explicitly chose Supabase over markdown from the start, prefix
  `nhdesign_` (for nhdesign2, later renamed — see below), in the existing `portmanagement`
  project (not a dedicated new project) — see session record. The stated hypothesis to test:
  a relational store removes csdesign's 36k-token file-size ceiling and enables real queries
  (full-text/keyword search across verbatim rules) instead of a hand-maintained INDEX table.
  **Not yet measured**: whether the network-round-trip cost of `supabase db query` per
  read/write is worse in practice than a local file Read for a BUILD pass — that's the actual
  A/B question and needs a real BUILD run against both skills once nhdesign2 has comparable
  coverage to `csdesign/nds`.
- **2026-07-16 (later same day)**: User asked for a second fork, `nhdesign3`, using its own
  `nhdesign3_` prefix in the same `portmanagement` project, seeded by copying all rows from
  nhdesign2's tables (then still `nhdesign_*`) as-is (`insert into nhdesign3_x select * from
  nhdesign_x`, same UUIDs so FKs transfer intact). Verified row-count parity post-copy: 3
  sources / 79 pages / 96 components / 79 topics / 1 ledger row in both prefixes. Open
  question this fork could answer: whether running a genuinely separate LEARN/VERIFY pass
  against `nhdesign3_*` produces different results than nhdesign2's tables for the same Figma
  files — i.e. how much learn-pass variance exists independent of the storage-backend question
  nhdesign2 was built to test.
- **2026-07-16 (later still)**: User asked to bulk-rename nhdesign2's `nhdesign_` prefix to
  `nhdesign2_` for naming consistency with `nhdesign3_` (nhdesign2 predates nhdesign3 and so
  never needed a numbered prefix until a sibling existed). Renamed via `alter table ... rename
  to ...` (OID-tracked, so all FKs/constraints survived) plus matching index renames; migration
  file and `nhdesign2/SKILL.md` updated to match. nhdesign3's own tables and this file's
  `nhdesign3_*` references were unaffected — only nhdesign2's prefix changed.
- **2026-07-17 — audit & repair pass**: DB had drifted far past this doc (12 sources / 178
  pages vs the documented 3/79). Fixed in DB: 해외주식의결권 source counts (was
  total_pages=0 / learned=7 / 8 actual rows → 8/8); registered the one learned-but-topicless
  page (`lesson-color-upgrade`); **promoted the 14 verified component keys** out of the
  `component-key-registry` lesson page into `nhdesign3_components` proper (13 rows now carry
  real keys, 15 `verified` + 1 `contested`), with a new topic row linking them — before
  this, BUILD's documented lookup path (`component_key` column) matched zero rows and the
  keys were only findable by reading the right lesson page. Fixed in this doc: scope
  rewritten around a source-of-truth query + snapshot table; exact `--linked`/`-f` CLI
  invocation documented (inline queries starting with `--` comments get eaten by the flag
  parser); BUILD mode rewritten to lead with the lesson pages, the SET→variant two-step,
  known key traps, and a screenshot-compare quality gate with DB write-back. Repair SQL
  preserved at `supabase/migrations/repair_2026-07-17.sql` (documentation only — applied
  via `db query -f`, never `db push`); all changes verified against the live DB post-apply.
- **2026-07-17 (ultracode audit + vibe repair)**: A 6-auditor workflow measured the store
  and pipeline end-to-end. Results: stored claims are accurate (53/54 verified against live
  Figma screenshots); a **blind build probe** (rebuild a shipped 국내주식 권리 screen from
  the DB alone) scored copy ~9/10 and layout ~9/10 but overall fidelity 7.4/10 — the
  deficit was entirely **in-context visual surface** (colors, chrome, density), and the
  prior BUILD's proto screens were judged "colorless wireframes" for the same reason.
  Repairs: (1) new SYNTHESIS source — vibe-rubric checklist, csdesign token/font port
  (#84C13D, NanumBarunGothic app-side, 540px canvas), defect diagnostics, copy-tone rule
  (해요체 현행); (2) four targeted Figma re-learn passes — MASTER 국내주식 권리 shipped
  screens (all 9 probe misses resolved with concrete hex/px values), internal geometry for
  13 tier-1 components (65 component rows now carry tokens), Templates Layout completion
  (4/17 → 16/17 groups), clipped variant sheets recaptured; (3) BUILD Mode 2 rewritten —
  mandatory vibe-rubric read, mandatory reference-first step, anti-invention escalation,
  two-part quality gate; (4) operational rule added after a live failure: parallel agents
  must never call the supabase CLI concurrently (login-role credential race, ledger
  `supabase-cli-concurrent-auth-race-2026-07-17`) — fan-outs use dump-then-read with serial
  SQL apply. Repair scripts preserved under `supabase/migrations/` (phaseA_synthesis + 4
  learner scripts).
- **2026-07-17 (PPT_Proposal+FlowOverview template)**: User pointed at a real shipped example
  (해외주식 의결권 투표 — NDS 기획서 - 화면설계 — Copy, fileKey `zRrojC3HnGljRiRYMFiCjX`, a
  companion file to but distinct from the `QFs41kWBHUMQt3k1oRmzgK` BUILD-lessons source) and
  asked for a reusable global skill command that can generate the same two-part deliverable
  (PPT 기획서 slide deck + 화면 흐름 개요 flow diagram) for future features. Learned the file's
  two structural patterns verbatim into a new `guide`-kind source (2/2 pages, see snapshot
  table above) rather than hardcoding the spec into a skill file, consistent with this
  project's DB-is-source-of-truth stance. Shipped `~/.claude/skills/nds-proposal/SKILL.md` as
  a thin orchestrator: it loads `nhdesign3` + `figma-use`, queries the new template rows
  alongside the existing BUILD lessons/SYNTHESIS rubric, builds the flow overview before the
  slides (reusing the same screen instances in both), and runs the standard BUILD quality
  gate plus a template-fidelity screenshot compare against the reference file. Not yet
  measured: whether a real `/nds-proposal` run for a brand-new (unbuilt) feature actually
  produces deck+flow output that reads as on-template — the pattern is transcribed from one
  example only, so a second real use is the first test of whether it generalizes.
