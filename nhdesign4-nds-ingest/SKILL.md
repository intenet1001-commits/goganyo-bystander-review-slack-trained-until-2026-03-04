---
name: nhdesign4-nds-ingest
description: "Dedicated entry point for LEARNing an NDS mobile-app/M.web design-system guide file (kind='guide', domain='app') into nhdesign4's DB — enumerate via figma.root.children, transcribe rule-bearing frames verbatim, report N/M coverage honestly, write nhdesign4_sources/pages/components/topics rows. Trigger: '/nhdesign4-nds-ingest <figma file>', or any request to learn/register/re-learn an NDS guide (UX Guide, M.web, CI, Templates, Library, PPT Templates) into nhdesign4."
risk: safe
---

# nhdesign4-nds-ingest

Thin, explicitly-invokable front door onto nhdesign4's **Mode 1 — LEARN** (and, for re-learns of
an already-registered guide, **Mode 3 — VERIFY**), scoped to the **app-side guide lane**:
`kind='guide', domain='app'` rows in `nhdesign4_sources` — the six NDS guide files (UX Guide,
M.web, CI, Templates, Library, PPT Templates) and any future app-side guide file. It does not
carry its own rules about *how* to learn a file — that discipline (figma.root.children
enumeration, verbatim screenshot transcription, honest N/M coverage reporting, the reviewed_date
bump on re-verify) lives entirely in `nhdesign4/SKILL.md` Mode 1 / Mode 3, and this skill defers
to it so there is exactly one source of truth. What this skill adds on top: a fast, memorable,
narrow trigger surface for "learn/register this guide file" that doesn't have to compete with
nhdesign4's other four jobs (BUILD, VERIFY-in-general, KNOWHOW, ROUTE) in the same paragraph.

**Which ingest/proposal skill to use**: this skill is for *learning* an app-side guide file —
not for building a deliverable from one (that's `nhdesign4-nds-proposal`, which loads this
skill's output data via Mode 1/2 but does not itself write new source rows), and not for
learning a *shipped project* or a *homepage* source (`nhdesign4-project-ingest` and
`nhdesign4-homepage-ingest` respectively — see Non-goals). If a correction happens *during* an
`nhdesign4-nds-proposal` BUILD session, that's knowhow, not ingest — hand off to
`nhdesign4-knowhow-app`.

## Tool scope — READ only, no Figma writes

This is a LEARN/ingest skill, not a BUILD skill. It needs Figma **read** access
(`get_metadata`/`figma.root.children` enumeration, `get_design_context`, `get_screenshot`) to
transcribe a guide file's rules — it does **not** need, and must **not** load, the `figma-use`
skill or call `use_figma`/`generate_figma_design`/`upload_assets`/any other Figma **write** tool.
An ingest run must never be able to mutate the Figma file it is reading, even by accident. This
is a genuine capability reduction relative to `nhdesign4-nds-proposal` (which does load
`figma-use` for BUILD) — keep it that way; if a task genuinely needs to write to Figma, that is
out of scope for this skill and belongs in the proposal skill instead.

## 0. Load prerequisites (mandatory, in order)

1. Invoke the `nhdesign4` skill — even if already loaded earlier in the session. Its Storage
   section (`nhdesign4_sources`/`pages`/`components`/`topics`/`ledger`, the `kind`/`domain`
   columns, the `supabase db query --linked` invocation and the concurrent-write caution) and
   the Mode 1 (LEARN) / Mode 3 (VERIFY) procedures are required below, not optional context.
2. Check whether the target guide is already registered, and if so its current coverage:

   ```sql
   select id, name, file_key, kind, domain, total_pages, learned_pages, status
   from nhdesign4_sources
   where kind = 'guide' and domain = 'app' order by name;
   ```

   - No matching row for the target file → this is a **first learn**: proceed under Mode 1,
     inserting a new `nhdesign4_sources` row with `kind='guide'`, `domain='app'` set explicitly
     at insert time (per Mode 1's instruction — don't leave it to a later backfill pass).
   - A matching row already exists → this is a **re-learn**: proceed under Mode 3 (VERIFY),
     re-running enumeration regardless of when it was last learned, treating existing
     `nhdesign4_pages` rows as claims to check rather than a blank slate, bumping
     `reviewed_date` and logging any changed claim to `nhdesign4_ledger` (old → new).

## 1. Write procedure

Follow `nhdesign4/SKILL.md` Mode 1 (first learn) or Mode 3 (re-learn) exactly — enumerate via
`figma.root.children` (never `get_metadata`'s bare page list or the file's own TOC, since layer
names lie), screenshot every rule-bearing frame, quote rule text verbatim into `content_md`, and
report N/M page coverage honestly rather than rounding up or omitting unreached pages.

1. `nhdesign4_sources`: insert (first learn) or confirm/verify (re-learn) the guide row —
   `kind='guide'`, `domain='app'`, `total_pages` set to the real enumerated page count.
2. `nhdesign4_pages`: one row per content page — verbatim quoted rules, naming-convention
   reliability note, sections actually studied. On re-learn, update in place and bump
   `reviewed_date`; never silently overwrite a prior claim without a ledger note.
3. `nhdesign4_components`: one row per distinct component encountered — key, key kind
   (SET/COMPONENT), tier (published/page-local/unpublished), variants, tokens.
4. `nhdesign4_topics`: register or extend topic rows (bilingual ko/en keywords) so the guide's
   content is findable by future BUILD/ROUTE passes querying by topic.
5. `nhdesign4_ledger`: append a row for any contested or blocked finding (a rule that can't be
   confirmed, a screenshot that contradicts a layer name, a re-verify that changed a prior
   claim) — set `nhdesign4_topics.flag` to `contested`/`blocked` accordingly, per the existing
   ledger pattern (e.g. `mynamuh-nhsec-rebrand-flap-2026-07`-style entries, adapted to app-side
   findings).
6. Update `learned_pages` on the source row to match actual coverage — if coverage is partial
   (N of M), say so in the row and in the report-back below; do not mark a source `complete` or
   imply full coverage when it is not.

## 2. Report back

After writing, tell the user in a few lines: which guide file, first-learn or re-verify, N/M
page coverage (honest, not rounded up), how many components/topics were added or updated, and
any contested/blocked findings logged to `nhdesign4_ledger`. If coverage is partial, name what's
still missing so a future re-run (via this same skill) knows where to pick up.

## Non-goals

- Not for learning a **shipped app-side project** (`kind='project', domain='app'`) — reference
  screens, real component choices, density, copy tone from a finished build. That's
  `nhdesign4-project-ingest`.
- Not for learning or re-verifying **homepage/desktop-website** knowledge
  (`domain='homepage'`, `kind in ('guide','website')`) — that's `nhdesign4-homepage-ingest`.
- Not for capturing a **knowhow lesson** learned during a BUILD correction — that's
  `nhdesign4-knowhow-app` (app-side) or `nhdesign4-knowhow-homepage` (homepage-side). This
  skill's job ends at writing guide/page/component/topic rows, not lessons-learned rows.
- Not for building a deliverable (기획서/화면흐름개요) from an already-learned guide — that's
  `nhdesign4-nds-proposal`, which reads this skill's output but does not itself register new
  source rows.
- No Figma writes, ever — see "Tool scope" above. If a task requires writing to Figma, it is out
  of scope here.
