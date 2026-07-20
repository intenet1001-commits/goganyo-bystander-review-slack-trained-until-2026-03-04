---
name: nhdesign4-project-ingest
description: "Dedicated entry point for LEARNing a shipped NDS mobile-app/M.web feature into nhdesign4 as a kind='project', domain='app' source — enumerate its real reference screens via figma.root.children, transcribe rule-bearing frames verbatim, record actual component choices/density/copy tone, and report N/M coverage honestly, so nhdesign4-project-proposal can re-present it later. Trigger: '/nhdesign4-project-ingest <feature>', or any request to register, learn, or finish learning a completed NDS project (공개매수청약, 국내주식 권리, 채권권리 행사, 해외주식의결권, TAX 플랫폼, etc.) into nhdesign4. Sets status='in_progress'→'complete' as coverage lands — use when the request is specifically about LEARNing/finishing a shipped feature's record, not building or re-presenting it (that's nhdesign4-nds-proposal / nhdesign4-project-proposal)."
risk: safe
---

# nhdesign4-project-ingest

Thin, explicitly-invokable front door onto `nhdesign4/SKILL.md`'s **Mode 1 — LEARN**, scoped to
**app-domain, project-kind sources** (`nhdesign4_sources where kind='project' and domain='app'`).
It does not carry its own rules about *how* to learn a file — that discipline (enumerate via
`figma.root.children`, never `get_metadata`'s bare page list or a file's own TOC; screenshot
every rule-bearing frame because layer names lie; quote verbatim; report N/M honestly) lives in
`nhdesign4/SKILL.md` Mode 1 and, beneath it, `figma-learn-all-pages` — this skill defers to both,
so there is exactly one source of truth. What this skill adds on top: a fast, memorable trigger
for "learn/register this shipped feature," and the `project`-specific parts of Mode 1 that a
generic LEARN pass doesn't spell out — the `status` lifecycle (`in_progress` → `complete`) and
what actually needs recording for a *finished build* (real reference screens, real component
choices, density, copy tone) versus a guide file (abstract rules/variants/tokens).

**Sibling skills**: `nhdesign4-nds-ingest` is the matching LEARN door for `kind='guide',
domain='app'` (the six NDS guide files). `nhdesign4-homepage-ingest` is the LEARN+VERIFY door for
`domain='homepage'`. On the execution/BUILD side, this skill's output feeds
`nhdesign4-project-proposal` (which reads `kind='project', status='complete', domain='app'` rows
to re-present a shipped feature as a deck+flow deliverable) — this skill is what makes those rows
exist and reach `status='complete'` in the first place. If the correction/lesson happening during
an ingest run is itself a generalizable BUILD lesson (not project content), route that to
`nhdesign4-knowhow-app` instead of folding it into the project source.

## 0. Load prerequisites (mandatory, in order)

1. Invoke the `nhdesign4` skill — even if already loaded earlier in the session. Its Storage
   section (`kind`/`domain` taxonomy, the `nhdesign4_sources`/`pages`/`components`/`topics`
   schema) and Mode 1 procedure are required below, not optional context.
2. Load `figma-learn-all-pages` — the actual enumeration/transcription discipline this skill
   runs. Do not substitute a lighter procedure for a "smaller" project file; Mode 1 does not
   relax for project-kind sources.
3. Check whether the requested feature already has a source row, and its current status:

   ```sql
   select id, name, file_key, status, total_pages, learned_pages
   from nhdesign4_sources
   where kind='project' and domain='app' and status='in_progress'
   order by name;
   ```

   Also run without the `status='in_progress'` filter if the feature name doesn't appear, to
   confirm it truly has no row yet (first-learn) rather than already being `complete` (in which
   case this is a VERIFY re-check via Mode 3, not a fresh LEARN — say so and confirm with the
   user before proceeding).

**Tool scope — READ only, no `figma-use`.** This is an ingest/LEARN skill, not a BUILD skill: it
never writes to Figma. It uses `get_metadata`/`figma.root.children` for enumeration,
`get_design_context` for structure/content, and `get_screenshot` for verbatim transcription of
rule-bearing frames — all read paths. Do **not** load `figma-use` and do **not** call
`use_figma`, `generate_figma_design`, `upload_assets`, or any other Figma write tool from this
skill. If the request turns out to need a Figma write (building or fixing screens, not recording
what already shipped), that is out of scope here — redirect to `nhdesign4-nds-proposal` or
`nhdesign4-project-proposal` instead of reaching for a write tool mid-ingest.

## 1. Scope the feature

- **No existing row** (true first-learn): create the `nhdesign4_sources` row with `kind='project'`,
  `domain='app'`, `status='in_progress'` at insert time — per Mode 1's rule to set `domain`
  explicitly at insert, not leave it to a later backfill pass. Then enumerate via
  `figma.root.children` per `figma-learn-all-pages`.
- **Existing `in_progress` row**: this is a continuation, not a fresh start. Read its existing
  `nhdesign4_pages` rows first as a partial record, not a blank slate — figure out which screens
  are already covered and which are the actual gap before re-enumerating everything from scratch.
- **Existing `complete` row**: not this skill's job — hand off to Mode 3 (VERIFY) instead, since
  the source is already finished and any re-check is a re-verify, not a first-learn.

## 2. Learn procedure (per Mode 1, project-kind specifics)

1. Enumerate the feature's real reference screens via `figma.root.children` — the actual shipped
   flow, in the order a user would hit it, not whatever order the Figma page happens to list
   frames in.
2. For every screen (and every popup/sheet/dialog reachable from it), screenshot and transcribe
   verbatim: the real component choices used (which NDS component key, which variant — not what
   the guide *recommends*, what actually shipped), information density, and copy tone. This is
   the part that differs from guide-file LEARN: a project row records *what was actually built*,
   including any deviation from the guide, not an idealized rule set.
3. Write one `nhdesign4_pages` row per screen (or logical group of screens where the content is
   genuinely one unit), `content_md` quoting verbatim rather than paraphrasing.
4. Register/extend `nhdesign4_components` rows only for component usages not already covered by
   the guide-kind source's own component rows — a project row should reference the guide's
   component key, not duplicate its full variant/token definition.
5. Register or extend `nhdesign4_topics` rows so the feature is findable by name from Mode 5
   lane-2 routing and from `nhdesign4-project-proposal`'s own queries.
6. **Report N/M coverage honestly** after each pass — "covered 9 of 12 identified screens, 3
   popups not yet transcribed" — never round up to imply completeness that hasn't been verified.
   This is the same anti-invention discipline Mode 1/2 apply everywhere else in this family.
7. If a finding is contested (e.g. a screen's real component choice conflicts with what the guide
   documents as the "correct" pattern, and it's unclear whether that's an intentional deviation or
   drift), write a `nhdesign4_ledger` row with `status='open'` and set the relevant
   `nhdesign4_topics.flag = 'contested'` — same pattern used for the TAX 플랫폼 case below.
8. **Status lifecycle**: update `status` to `'complete'` only once every identified screen and
   popup/sheet/dialog in the enumerated flow has a corresponding `nhdesign4_pages` row and no
   `contested` flags remain open against it. Bump `total_pages`/`learned_pages` to match on every
   write, not just at completion.

## 3. Concrete example — the TAX 플랫폼 gap

As of the last check, the TAX 플랫폼 project source is `in_progress` with roughly **13% coverage**
— only the `2509 화면개편` page has been transcribed, and its content is flagged **contested** in
`nhdesign4_topics` (an unresolved question about which component choices on that page are
intentional vs. drift, not yet reconciled against the guide). Finishing this row — enumerating
the rest of the TAX 플랫폼 flow via `figma.root.children`, transcribing the remaining screens
verbatim, resolving the `2509 화면개편` contested flag one way or the other with a ledger entry,
and flipping `status` to `'complete'` once real coverage supports it — is exactly the job this
skill exists to make callable and repeatable (`/nhdesign4-project-ingest TAX 플랫폼`) instead of
ad-hoc SQL run by hand. Before starting, always re-run the live query in §0.3 rather than trusting
this note's percentage — coverage drifts every time someone touches the row.

## 4. Report back

After writing, tell the user in 1-3 lines: which source/screens were learned or extended, the
honest N/M coverage figure, whether `status` moved to `complete` (and if not, what's still
missing), and whether anything was flagged `contested` and needs a ledger entry follow-up.

## Non-goals

- Not for building new screens from guide-level knowledge for a feature that hasn't shipped —
  that's `nhdesign4-nds-proposal` (BUILD, Mode 2).
- Not for re-presenting an already-`complete` project as a 기획서/화면흐름개요 deliverable —
  that's `nhdesign4-project-proposal`.
- Not for re-verifying a `complete` project row (Mode 3, not Mode 1) — this skill's job ends once
  a row is genuinely complete; further checks on a complete row are a VERIFY pass, not an ingest.
- Not for capturing a generalizable BUILD-correction lesson — that's `nhdesign4-knowhow-app`, even
  if the correction happened to surface during an ingest run.
- Not for `domain='homepage'` sources — that's `nhdesign4-homepage-ingest`, which also folds in
  VERIFY (Mode 3) for the volatile website rows; this skill stays app-domain only.
- Never writes to Figma. If the task requires creating, editing, or fixing a Figma screen, that
  is out of scope — hand off to the appropriate BUILD skill instead of loading `figma-use` here.
