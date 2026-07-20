---
name: nhdesign4-homepage-ingest
description: "Dedicated entry point for LEARNing or re-VERIFYing NH desktop-website knowledge (나무증권/mynamuh.com, NH투자증권/nhsec.com) into nhdesign4 as domain='homepage' guide/website rows — live-site sampling via Chrome use_browser (computed-style frequency scan, nav/layout capture), honest volatility notes. Trigger: '/nhdesign4-homepage-ingest <site/area>', or any request to learn, sample, or re-verify a NH desktop-website page into nhdesign4."
risk: safe
---

# nhdesign4-homepage-ingest

Thin, explicitly-invokable front door onto nhdesign4's **Mode 1 — LEARN** and **Mode 3 —
VERIFY**, scoped to the **homepage side** (`domain='homepage'`, `kind in ('guide','website')`):
나무증권/mynamuh.com and NH투자증권/nhsec.com. It carries no rules of its own about *how* to
learn or re-verify a source — that procedure lives in `nhdesign4/SKILL.md` Mode 1 and Mode 3,
and this skill defers to it so there is exactly one source of truth. What this skill adds on
top: a crisp, single-intent trigger for "learn/sample/re-verify this homepage" that doesn't have
to compete against nhdesign4's own five other jobs (BUILD, app-side LEARN, KNOWHOW, ROUTE) to
get selected — the same fix the `nhdesign4-knowhow-app`/`-homepage` split already proved for the
KNOWHOW lane.

**Why LEARN and VERIFY are folded together here, unlike the app-side ingest skills.** Homepage
rows are volatile — production websites change without notice, and nhdesign4's own Storage
section flags the two `website`-kind rows as needing live verification before trust (ledger
`mynamuh-nhsec-rebrand-flap-2026-07`, inherited unchanged from nhdesign3). For this domain,
re-sampling (Mode 3, bumping `reviewed_date`) is the dominant day-to-day operation, not first-
learn — so a caller asking "is this still accurate" and a caller asking "learn this for the
first time" both belong at the same front door, running the same live-site sampling procedure
against the same rows.

**Sibling skills**: for the app-side equivalents (`domain='app'`), use `nhdesign4-nds-ingest`
(kind='guide') or `nhdesign4-project-ingest` (kind='project') instead — desktop-website and
mobile-app/M.web are disjoint audiences with different components, fonts, and conventions, per
nhdesign4's Mode 5 "cross-domain combinations are not meaningful" rule. For the corresponding
**BUILD** deliverable (기획서/화면흐름개요) once homepage knowledge is learned, hand off to
`nhdesign4-homepage-proposal`. For homepage-side **KNOWHOW** capture (lessons learned during a
`nhdesign4-homepage-proposal` session), use `nhdesign4-knowhow-homepage` — that skill is for
correction-lesson capture, not source learning, and this skill does not duplicate it.

## Tool scope: READ only — no Figma writes

This is an ingest/LEARN-and-VERIFY skill, not a BUILD skill. It never mutates a Figma file. Do
**not** load `figma-use` and do **not** call `use_figma`, `upload_assets`, `generate_figma_design`,
`create_new_file`, or any other Figma **write** tool — none of them belong to this skill's job.
The only external reads this skill performs are:

- Figma: `get_metadata` / `figma.root.children` enumeration and `get_design_context` — only if
  the homepage `guide`-kind Figma source (the one `domain='homepage'` guide row) is what's being
  learned/re-verified, not the live `website` rows.
- Chrome `use_browser` (from `superpowers-chrome`) — for live-site sampling of mynamuh.com /
  nhsec.com: navigating pages, capturing computed styles, nav structure, and layout, per §2
  below. This is a **read-only** browsing session — no form submission, no account actions, no
  site mutation.

This is a genuine capability reduction versus the proposal/BUILD skills, not just a scoping
note: an ingest run under this skill cannot accidentally write to Figma even if the model
mis-infers intent mid-session, because the write tool is simply not loaded.

## 0. Load prerequisites (mandatory, in order)

1. Invoke the `nhdesign4` skill — even if already loaded earlier in the session. Its Storage
   section (how `domain`/`kind` discriminate rows, the `file_key` caution, the volatility
   caveat) and Mode 1/Mode 3 procedures are required below, not optional context.
2. Check what's currently live for the homepage domain before doing anything else:

   ```sql
   select name, file_key, kind, domain, total_pages, learned_pages, status, reviewed_date
   from nhdesign4_sources where domain = 'homepage' order by kind, name;
   ```

   As of the 2026-07-20 fork snapshot this is 1 `guide`-kind row and 2 `website`-kind rows — but
   the DB is the source of truth, not that number; always check live. If the target site/area
   has no existing row, this is first-learn (Mode 1, insert path). If a matching row exists,
   this is re-verify (Mode 3, update-in-place path) — decide which before choosing a procedure
   below.

## 1. LEARN (first time a homepage source/area is registered) — Mode 1

Per `nhdesign4/SKILL.md` Mode 1: "Identical procedure to nhdesign3 Mode 1, writing to
`nhdesign4_*` tables instead of `nhdesign3_*`... When registering a newly learned source, set
`domain` explicitly at insert time (don't leave it to a later backfill pass) — `homepage` for
desktop-website content."

1. If the target is the homepage `guide`-kind Figma source, load `figma-learn-all-pages` first
   (as nhdesign4 Mode 1 requires) and enumerate via `figma.root.children` — never `get_metadata`'s
   bare page list or the file's own TOC. Screenshot every rule-bearing frame (layer names lie);
   quote verbatim; report N/M coverage honestly, not optimistically.
2. If the target is a live website area (나무증권/mynamuh.com or NH투자증권/nhsec.com), use
   Chrome `use_browser` to sample the page(s): capture nav structure, layout regions, and a
   computed-style frequency scan (colors, spacing, typography actually rendered, not assumed from
   a stylesheet you haven't checked). Note anything that looks provisional or A/B-tested — that
   belongs in the page's `content_md` as an explicit caveat, not silently dropped.
3. Insert/update `nhdesign4_sources` with `domain='homepage'` and the correct `kind` (`guide` for
   the Figma design-system row, `website` for a live-site row) set at insert time.
4. Write `nhdesign4_pages` rows per the same verbatim-quote, N/M-honest discipline as the app
   side — no invented rules, no filled-in gaps.
5. Write `nhdesign4_components` rows for any distinct reusable homepage component identified
   (nav bar, hero module, footer, etc.), if applicable to what was sampled.
6. Register or extend `nhdesign4_topics` rows (bilingual ko/en keywords) so the learned content is
   findable by future BUILD/ROUTE passes querying by topic.
7. If a finding is contested (e.g. mynamuh vs nhsec branding conflicts, a value that looked wrong
   on re-check), write a `nhdesign4_ledger` row rather than silently picking one answer — same
   pattern as `mynamuh-nhsec-rebrand-flap-2026-07`.

## 2. VERIFY (re-sample an existing homepage row) — Mode 3

Per `nhdesign4/SKILL.md` Mode 3: "Re-run enumeration regardless of when a file was last learned;
re-read existing `nhdesign4_pages` rows as claims to check, not a blank slate. Update in place
with a `reviewed_date` bump — never silently overwrite; note old → new in `nhdesign4_ledger` if a
claim changes."

1. Pull the existing `nhdesign4_pages` rows for the source being re-verified and treat each
   claim as something to check against the live site/file, not something to trust.
2. Re-sample: for a `website`-kind row, re-navigate via Chrome `use_browser` and re-run the
   computed-style/nav/layout capture; for the `guide`-kind row, re-enumerate via
   `figma.root.children` and re-check the previously quoted rules.
3. For every claim that still matches, bump `reviewed_date` on that page's row (or the source
   row, per existing convention) — this is the signal that the row was actually re-checked, not
   just left stale.
4. For every claim that changed, update `content_md` in place and append a `nhdesign4_ledger`
   row recording old → new, with enough context (URL, date sampled, what changed) that a future
   reader understands why the value moved rather than assuming it was always this way.
5. If the re-sample surfaces a genuinely new ambiguity (e.g. two properties showing different
   branding for what should be the same element), don't resolve it by guessing — write it as a
   contested `nhdesign4_ledger` entry and flag the relevant `nhdesign4_topics` row, exactly as
   `mynamuh-nhsec-rebrand-flap-2026-07` did.

## 3. Report back

After writing, tell the user in 1-3 lines: which source/area was learned or re-verified, N/M
coverage (LEARN) or what changed vs. what stayed the same (VERIFY), and whether anything was
flagged contested/blocked in the ledger. If a live-site sample turned up something that looks
provisional or worth a follow-up re-check soon, say so — homepage rows don't get to be assumed
stable just because they were just checked.

## Non-goals

- Not for app-side (`domain='app'`) learning — use `nhdesign4-nds-ingest` (guide) or
  `nhdesign4-project-ingest` (project) instead.
- Not for building a 기획서/화면흐름개요 deliverable — that's `nhdesign4-homepage-proposal`
  (Mode 2 BUILD), which loads this skill's learned data but does not belong here.
- Not for capturing a correction/lesson learned during a homepage BUILD session — that's
  `nhdesign4-knowhow-homepage` (Mode 4 KNOWHOW), a separate write target
  (`knowhow-nhdesign4-homepage`) with its own procedure.
- Never writes to Figma. If a request turns out to need a Figma write (creating/editing a file,
  uploading assets, generating a design), that is out of scope here — hand off to the BUILD-side
  skill that actually loads `figma-use`.
