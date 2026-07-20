---
name: nhdesign4
description: "Full fork of nhdesign3 (2026-07-20), backed by Postgres (Supabase) instead of markdown files. Same target domain (NDS: component keys, variants, tokens, per-category rules) and the same rigorous learn methodology (figma.root.children enumeration, verbatim screenshot transcription, honest N/M coverage reporting), but knowledge is stored in queryable `nhdesign4_*` tables in the shared Supabase project `portmanagement`, with a native `domain` column (app / homepage) on every source row and a Mode 5 ROUTE dispatcher on top. Covers all six NDS guide files (UX Guide, M.web, CI, Templates, Library, PPT Templates) plus learned project files, production-website records, and knowhow. Use when asked to learn/build/verify/route any NDS file or NH design work via nhdesign4, or to compare nhdesign4 vs nhdesign3 performance."
risk: safe
---

# nhdesign4

DB-backed sibling of `nhdesign3`/`csdesign/nds`. Built to test a **native `domain` column +
5-layer request routing** on top of the already-proven DB-backend approach — the actual
Figma-learning discipline (enumerate via `figma.root.children`, never `get_metadata`'s bare
page list or a file's own TOC; screenshot every rule-bearing frame because layer names lie;
quote verbatim; report N/M honestly) is identical to `csdesign`'s and `nhdesign3`'s, per
`figma-learn-all-pages`. What differs from nhdesign3: every `nhdesign4_sources` row carries a
real, queryable `domain` column (`app` / `homepage`) instead of leaving app-vs-homepage
routing as an implicit doc-only heuristic split across `nds-proposal` vs `web-proposal`, and a
new Mode 5 dispatches an incoming request to the right knowledge slice (and skill) by number
or by keyword/domain inference.

**Provenance**: nhdesign4 is a **full fork of nhdesign3** (2026-07-20: all rows copied
verbatim into `nhdesign4_*` tables, same ids/content/schema, `domain` backfilled
deterministically from `kind`/`file_key`/`name`) — this mirrors the exact nhdesign2→nhdesign3
fork precedent from 2026-07-16. It is a new set of tables, not an in-place edit of nhdesign3;
nhdesign3 remains fully intact and untouched as a safe fallback. See Decision log below for why.

## Storage

Supabase project **`portmanagement`** (ref `fvkmkqhavlqmltowwpfc`, Seoul), tables prefixed
`nhdesign4_` — same project as nhdesign2/nhdesign3, for the same reason (knowledge cache, not
an app; avoids spinning up new billing/infra for an experiment).
Schema: `supabase/migrations/00000000000001_nhdesign4_init.sql`. Seed:
`supabase/migrations/00000000000002_nhdesign4_seed_from_nhdesign3.sql`.

**Read/write via `supabase db query`, not `db push`.** `portmanagement` has its own
unrelated app migration history — `db push`/`migration repair` would touch that project's
real migration bookkeeping. `db query` (raw SQL, no migration-history involvement) is the
only safe write path here. Never run `supabase db push`, `migration repair`, or `db reset`
against this project from this skill. The fork files live outside `supabase/migrations/` of
the linked project dir specifically so no migration runner auto-picks them up.

**Exact invocation** (both flags matter — without `--linked` the CLI dials a local Postgres
and fails; the project link lives in `~/.claude/skills/nhdesign3/supabase/.temp/`, so run
from there — nhdesign4 does not need its own separate link, it shares the same linked
project):

```bash
cd ~/.claude/skills/nhdesign3
supabase db query --linked "select ..."          # inline, single statement
supabase db query --linked -f path/to/file.sql   # multi-statement / anything with -- comments
```

Inline SQL that begins with `--` comments gets eaten by the flag parser — use `-f` for
scripts.

**Parallel agents must NEVER call the supabase CLI concurrently.** The CLI's temp login role
is shared per project; concurrent `db query --linked` calls race its initialization and
rotate each other's credentials (`SASL: password authentication failed`), producing endless
retry loops (ledger `supabase-cli-concurrent-auth-race-2026-07-17`, inherited from nhdesign3 —
still applies since nhdesign4 shares the same linked project). Required pattern for any
fan-out: the orchestrator dumps the needed tables to local JSON once (`select json_agg(t) from
nhdesign4_x t`), agents read the dump and emit SQL files, the orchestrator applies them
serially with `-f`.

| Table | Mirrors (nhdesign3) | Purpose |
|---|---|---|
| `nhdesign4_sources` | `nhdesign3_sources` | One row per Figma file (or website/knowhow source): fileKey, kind, **`domain`** (`app`/`homepage`, native column — see below), `total_pages`, `learned_pages`, status |
| `nhdesign4_pages` | `nhdesign3_pages` | One row per content page — verbatim quoted rules, naming-convention reliability per page, sections studied |
| `nhdesign4_components` | `nhdesign3_components` | One row per distinct component: key, key kind (SET/COMPONENT), tier (published/page-local/unpublished), variants, tokens |
| `nhdesign4_topics` | `nhdesign3_topics` | topic → page_ids/component_ids, with a `flag` (none/contested/blocked) |
| `nhdesign4_ledger` | `nhdesign3_ledger` | Contested/blocked findings, `anchor` slug referenced from `nhdesign4_topics.flag` rows |

**`nhdesign4_sources.kind` has four values — `guide` / `project` / `website` / `knowhow`** —
identical semantics to nhdesign3 (see nhdesign3's `SKILL.md` for the full `kind` writeup;
unchanged here).

**`nhdesign4_sources.domain` is new and native (not present in nhdesign3).** Values: `app`
(mobile app / MTS / M.web — the surface `nhdesign4-nds-proposal`/`nhdesign4-project-proposal`
and BUILD Mode 2 already target) or `homepage` (NH's desktop websites — the surface
`nhdesign4-homepage-proposal` targets). Backfilled at fork time deterministically: `website`
kind → `homepage`; `project` kind → `app`; `guide` kind → `app` by default, overridden to
`homepage` only for the row whose `file_key` is `lib-guide-homepage` or whose `name` contains
`홈페이지`; `knowhow` kind → `app` for this fork's one knowhow row (originally copied as
`file_key='knowhow-nhdesign3'`, renamed 2026-07-20 to `knowhow-nhdesign4` — see the file_key
note below), else left `NULL` — never guessed. Post-backfill distribution (verified 2026-07-20,
see Scope below): every one of the 19 rows got a non-NULL domain, no row was left NULL. Because
this is a real column (not a doc heuristic), Mode 5 can `where domain = 'app'` / `where domain =
'homepage'` directly instead of re-deriving domain from `kind`/`name` on every request.

**`file_key` values were copied verbatim from nhdesign3 and mostly still say "nhdesign3" — this
is expected, not a bug, except where explicitly renamed.** The fork copies data, not identifiers;
renaming every `file_key` string would have been pure churn for no functional gain. Two rows
were deliberately renamed post-fork because a skill needs to address them by a v4-native name
(`knowhow-nhdesign3` → `knowhow-nhdesign4`; the homepage-knowhow source doesn't exist yet and
will be created directly as `knowhow-nhdesign4-homepage` on first write). Everything else keeps
its original `file_key` unchanged — most visibly `synthesis-nhdesign3` (the SYNTHESIS
vibe-rubric row) and the real Figma fileKeys (`zRrojC3HnGljRiRYMFiCjX`, `QFs41kWBHUMQt3k1oRmzgK`,
etc.), which every v4 skill's SQL still queries by their original literal value. Before writing
or trusting any `file_key` literal in a new v4 skill, check what's actually live in
`nhdesign4_sources` rather than assuming a `nhdesign4`-named key exists — a `nhdesign4-project-
proposal` bug caught on 2026-07-20 queried a `synthesis-nhdesign4` key that was never created.

## Scope (current)

**The DB is the source of truth, not this section** — it will drift as more is learned.
Always start a LEARN/BUILD/VERIFY/ROUTE pass with:

```sql
select name, file_key, kind, domain, total_pages, learned_pages, status
from nhdesign4_sources order by domain, kind, name;
```

Snapshot as of 2026-07-20 (immediately post-fork from nhdesign3, verified row-count parity in
all 5 tables) — **19 sources, 220 pages, 201 components, 210 topics, 26 open/closed ledger
rows** (identical counts to nhdesign3 at fork time; content is a byte-for-byte copy, only
`domain` is new):

| domain | kind | count |
|---|---|---|
| app | guide | 8 |
| app | project | 7 |
| app | knowhow | 1 |
| homepage | guide | 1 |
| homepage | website | 2 |

Everything else about the corpus (per-file caveats, layer-name unreliability, partial variant
coverage, website volatility, topic-name collisions across sources) carries over unchanged
from nhdesign3 — read nhdesign3's `SKILL.md` "Scope" section for the full per-file detail if
you need it; it is not re-duplicated here since the content is identical, only the table
prefix and the new `domain` column differ.

## Mode 1 — LEARN

Identical procedure to nhdesign3 Mode 1, writing to `nhdesign4_*` tables instead of
`nhdesign3_*`. Load `figma-learn-all-pages`, then `figma-use` first — this skill does not
relax that discipline. When registering a newly learned source, set `domain` explicitly at
insert time (don't leave it to a later backfill pass) — `app` for MTS/M.web content, `homepage`
for desktop-website content, per the same rule used in the fork backfill above.

## Mode 2 — BUILD

Identical procedure to nhdesign3 Mode 2 (reference-first, SET→variant two-step, vibe-rubric +
screenshot-compare quality gate), querying `nhdesign4_*` tables. Read the BUILD lessons
(`해외주식의결권`, `domain='app'`) and the SYNTHESIS vibe rubric first — both mandatory, same
query pattern as nhdesign3 with the table prefix swapped:

```sql
select s.name, p.page_name, p.content_md from nhdesign4_pages p
join nhdesign4_sources s on s.id = p.source_id
where s.file_key in ('QFs41kWBHUMQt3k1oRmzgK','synthesis-nhdesign3') order by s.name, p.page_name;
```

## Mode 3 — VERIFY

Identical procedure to nhdesign3 Mode 3. Re-run enumeration regardless of when a file was last
learned; re-read existing `nhdesign4_pages` rows as claims to check, not a blank slate. Update
in place with a `reviewed_date` bump — never silently overwrite; note old → new in
`nhdesign4_ledger` if a claim changes.

## Mode 4 — KNOWHOW capture

Identical procedure to nhdesign3 Mode 4, writing to the `knowhow-nhdesign3`-equivalent
knowhow-kind source in `nhdesign4_sources` (`domain='app'`). Same trigger conditions
(generalizable lessons from live human corrections during BUILD), same "what does NOT belong
here" exclusions, same write procedure (one page per lesson, fold operationally load-bearing
lessons into the actual rubric/recipe pages BUILD reads, register a topic row so it's
keyword-findable).

## Mode 5 — ROUTE (5-layer request dispatch)

**Purpose**: a single entry point that sends an incoming NH design request to the right slice
of `nhdesign4_*` (and, where one exists, the right downstream skill) instead of making every
caller guess which of app/homepage × guide/project/knowhow they need.

**Path caveat**: the 5 hand-off skill paths referenced below
(`~/.claude/skills/nhdesign4-*/SKILL.md`) currently exist only inside the uncommitted worktree
this fork was built in, not yet at that canonical location in the main `~/.claude/skills` tree.
No action is needed once the worktree is merged; until then, those paths will not resolve for
any session running outside this worktree.

**Guard — read this first, every time Mode 5 is entered:**

> If this skill was invoked **by a router** as part of an already-routed dispatch (i.e. some
> other skill's own step 0 said "invoke nhdesign4 first" and that skill already picked a lane
> before calling in here), **do not re-run routing** — just answer the query against the
> relevant `nhdesign4_*` rows directly, using whichever Mode (1–4) actually fits the request.
> Re-entering Mode 5 in that situation would re-present the numbered menu to a caller that
> already chose a lane, and if a future sibling skill's own entry step is itself "invoke
> nhdesign4," a naive Mode 5 would loop back into routing indefinitely instead of terminating
> in an answer. Concretely: if the invocation context already states a domain and/or a lane
> number, or already names a specific source/kind, skip straight to the matching Mode and
> answer — Mode 5 is for genuinely ambiguous top-level requests only.
>
> **This guard is currently inferential only, not enforced by any explicit signal at
> invocation time.** As of 2026-07-20 none of the 5 hand-off skills' step 0 (`nhdesign4-nds-
> proposal`, `nhdesign4-project-proposal`, `nhdesign4-homepage-proposal`, `nhdesign4-knowhow-
> app`, `nhdesign4-knowhow-homepage`) actually states the lane number or `domain=`/`kind=`
> it already routed on when it says "invoke nhdesign4" — they only say variants of "invoke the
> nhdesign4 skill... even if already loaded earlier in the session," with nothing in that
> sentence for this guard to key off of. Until each sibling skill's step 0 is updated to pass
> an explicit inline marker (e.g. "invoke nhdesign4, already-routed to lane 2 / domain=app /
> kind=project"), this guard depends on inferring "already routed" from context rather than
> reading it off an explicit field — flagged at design time, not yet exercised by a real
> sibling skill, and not yet fixed as of this note.

**The menu** (present this when a request is ambiguous and no lane is already implied):

1. **App-side guide/design-system knowledge** — NDS mobile app/M.web component keys,
   variants, tokens, per-category rules. Source: `nhdesign4_sources where domain='app' and
   kind='guide'`. For a full 기획서+화면흐름개요 deliverable of a **new/unbuilt** feature, hand
   off to `~/.claude/skills/nhdesign4-nds-proposal/SKILL.md` (it loads this skill's data
   itself).
2. **App-side finished-project knowledge** — how a shipped mobile app/M.web screen was
   actually built (reference screens, real component choices, density, copy tone). Source:
   `nhdesign4_sources where domain='app' and kind='project' and status='complete'` (the
   `status='complete'` filter matters — the in_progress/complete split drifts as projects ship,
   so verify live rather than trusting a hardcoded count: `select status, count(*) from
   nhdesign4_sources where domain='app' and kind='project' group by status`; as of 2026-07-20
   that query returned 1 of 7 project rows still `in_progress`, not a fixed number to assume
   going forward). For a full deliverable **re-presenting an existing/shipped** feature, hand off
   to `~/.claude/skills/nhdesign4-project-proposal/SKILL.md`.
3. **App-side knowhow** — generalizable lessons from live BUILD corrections (coordinate
   bugs, layout conventions, alignment gotchas, plugin-API pitfalls). Source:
   `nhdesign4_sources where domain='app' and kind='knowhow'` (file_key `knowhow-nhdesign4` as
   of the 2026-07-20 rename from the copied `knowhow-nhdesign3` key). See Mode 4, or hand off
   to `~/.claude/skills/nhdesign4-knowhow-app/SKILL.md` for an explicit capture/session-wrap.
4. **Homepage-side guide/website knowledge** — NH desktop-website knowledge (나무증권/
   mynamuh.com, NH투자증권/nhsec.com): the one homepage-domain guide row plus the two
   `website`-kind rows. Source: `nhdesign4_sources where domain='homepage' and kind in
   ('guide','website')`. **The website rows are volatile — verify live before trusting the DB
   snapshot**, same caveat as nhdesign3 (see ledger `mynamuh-nhsec-rebrand-flap-2026-07`,
   inherited unchanged). For a full deliverable, hand off to
   `~/.claude/skills/nhdesign4-homepage-proposal/SKILL.md`. There is no homepage equivalent of
   lane 2 yet (no `project`-kind homepage source exists) — an "existing homepage feature"
   request also lands here, sourced from the `website`-kind rows instead.
5. **Homepage-side knowhow** — generalizable lessons specific to homepage/desktop-website
   builds or corrections, kept separate from app-side knowhow (#3) since the two channels
   have different component libraries, fonts, and conventions. Source: `nhdesign4_sources
   where domain='homepage' and kind='knowhow'`, file_key `knowhow-nhdesign4-homepage`.
   **None exists yet as of 2026-07-20** — the one forked knowhow row is app-side
   (`knowhow-nhdesign4`, MTS/M.web lessons only); the first homepage-side lesson should be
   captured via `~/.claude/skills/nhdesign4-knowhow-homepage/SKILL.md`, which creates this
   source row on first write rather than overloading the existing app-side one.

**Lanes combine — this is not a pick-exactly-one menu.** Each lane is an independent skill
invocation; a request can name any subset, and the numbered form ("1", "1+2", "1+3", "2+3",
"1+2+3", etc.) is the explicit override syntax. This flexibility is the actual thing this fork
exists to test against v3 (see Decision log) — v3 requires the caller to already know which of
`nhdesign3-nds-proposal` / `nhdesign3-knowhow-app` / etc. to invoke and in what order; v4's bet
is that naming lanes by number and letting them compose is faster and more consistent.
**The numeric combo form is an unordered set of lanes, not a left-to-right execution
sequence** — "1+2" and "2+1" name the same combination; read each combo's parenthetical for
the actual execution order. Common combinations, not exhaustive:
- **1 alone** — a new feature, no reference screen and no known relevant lessons yet.
- **2+1** — build a new feature but explicitly pattern-match its shape against a named shipped
  feature first (invoke lane 2 to read the reference, then lane 1/`nhdesign4-nds-proposal` to
  build, citing what was reused).
- **1+3** (or **2+3**) — build or re-present a feature AND apply accumulated app-side knowhow
  explicitly, rather than relying on `nhdesign4-nds-proposal`/`nhdesign4-project-proposal`'s own
  BUILD-lesson query (file_key `QFs41kWBHUMQt3k1oRmzgK`) to have already surfaced everything
  relevant — useful when the request calls out a specific known gotcha by name.
- **1+2+3** — all three app-side lanes: build a new feature, referencing a shipped one, with
  explicit knowhow review before/after. The heaviest app-side combination; use when the request
  is complex enough that skipping any one lane would leave a real gap (a truly new sub-flow,
  but adjacent to an existing shipped feature, with a known lesson that applies to both).
- **4+5** is the homepage-domain mirror of 1+3 (build/re-present a homepage feature with
  explicit homepage knowhow review) — lane-2-shaped homepage combinations don't exist yet since
  no homepage `project`-kind source exists (see lane 4's note).
Cross-domain combinations (e.g. "1+4") are not meaningful — app and homepage are disjoint
audiences/deliverables, never combined into one request.

**Inference when the user doesn't specify a number.** Route by keyword/domain signal before
asking:

- Mentions of 앱/MTS/M.web/모바일, or any NDS component-name vocabulary (btn_, popup, tab,
  card, quickmenu, Sectionbar, …) → lane 1–3 (app domain). Within that: "how is X built /
  what's the component key" for a **new** feature → 1; "how did a real **shipped** screen do
  this" (names an existing/completed feature) → 2; "what's a known gotcha/lesson about doing
  X" → 3.
- Mentions of 홈페이지/웹사이트/데스크톱/나무증권/mynamuh/nhsec, or a URL under those domains
  → lane 4–5 (homepage domain). Within that: guide/component/layout question → 4; "what's a
  known gotcha/lesson about the homepage build" → 5.
- Mentions of 기획서/화면흐름개요 (proposal deck + flow overview) plus an app-domain feature
  name: if the feature is **new/unbuilt** → lane 1, hand off to `nhdesign4-nds-proposal`; if
  it names an **existing/shipped** feature → lane 2, hand off to `nhdesign4-project-proposal`.
  Same phrase plus a homepage-domain feature → lane 4, then hand off to
  `nhdesign4-homepage-proposal` (no lane-2 equivalent exists for homepage yet).
- Genuinely ambiguous (no domain/lane signal at all) → present the numbered menu and ask,
  rather than guessing — anti-invention rule from Mode 2 applies to routing decisions too.

## Decision log

- **2026-07-20 — fork from nhdesign3, native `domain` column + Mode 5 router.** This is a
  **full fork of nhdesign3, not an in-place edit** — a new `nhdesign4_*` table set, seeded by
  copying every row from `nhdesign3_*` with matching UUIDs (`insert into nhdesign4_x select *
  ... from nhdesign3_x on conflict (id) do nothing`, FK-safe order sources → pages →
  components → topics → ledger), verified via row-count parity across all 5 tables (19 / 220 /
  201 / 210 / 26, identical on both sides) plus a zero-orphan FK spot-check. This exactly
  mirrors the nhdesign2→nhdesign3 fork precedent from 2026-07-16 (same "copy all rows with
  matching UUIDs, verify parity, keep the source untouched" procedure, same
  same-Supabase-project/new-prefix approach) — done specifically **so nhdesign3 remains a
  safe, untouched fallback** if nhdesign4's schema experiment (the native `domain` column plus
  the Mode 5 router) underperforms or needs to be abandoned; nhdesign3 was confirmed to still
  read exactly 19 `nhdesign3_sources` rows post-fork, i.e. zero mutation of the fork source.
  The two things being tested that nhdesign3 doesn't have: (1) whether promoting the
  app-vs-homepage split from an implicit doc/skill-choice heuristic into a real, queryable
  `domain` column earns its keep over nhdesign3's approach (`nds-proposal` vs `web-proposal`
  choosing correctly by the caller already knowing which skill to invoke); (2) whether a
  single Mode 5 router entry point that dispatches to 5 numbered lanes is a net usability win
  over callers picking a lane themselves — including whether the self-invocation guard
  actually prevents infinite loops in practice once a sibling skill lists "invoke nhdesign4
  first" as its own step 0, which was flagged as a foreseeable failure mode at design time but
  not yet exercised by a real sibling skill. Not yet measured: real LEARN/BUILD/VERIFY usage
  diverging from nhdesign3 (at fork time, content is byte-for-byte identical, only `domain` is
  new) — that divergence, and whether Mode 5 routing measurably speeds up or misroutes real
  requests, is the actual open question this fork exists to answer, per the same
  measured-trigger-before-refactor discipline nhdesign2→nhdesign3 established.
