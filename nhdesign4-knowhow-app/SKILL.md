---
name: nhdesign4-knowhow-app
description: "Dedicated entry point for saving lessons learned into nhdesign4's app/NDS knowhow category (kind='knowhow', source `knowhow-nhdesign4`) — the running record of what a human correction taught during a `nhdesign4-nds-proposal`/NDS-component BUILD session, distinct from the finished design output itself and distinct from `nhdesign4-knowhow-homepage` (which covers `nhdesign4-homepage-proposal`/desktop-website sessions). Two invocation styles: (1) targeted — user names a specific lesson right now ('노하우 저장해', '이거 노하우로 남겨', '노하우로 기록해', 'save this as knowhow'); (2) session-wrap — invoked at the end of a session ('세션 마무리', '노하우 정리해줘', 'wrap up and save knowhow') with no single lesson pre-named, so this skill scans the conversation for correction/fix moments and proposes candidates before writing. Beyond capture it now also re-reads and re-verifies/audits the existing `knowhow-nhdesign4` rows (Mode 3 — VERIFY) when asked to re-audit the corpus ('노하우 재검증', '노하우 중복 정리해줘', '노하우 감사', 'verify/audit the knowhow'), not only writing new lessons. Use when the correction happened during nhdesign4-nds-proposal/NDS component BUILD work (Figma component instances, coordinate/connector rules) — use `nhdesign4-knowhow-homepage` instead if the correction happened during nhdesign4-homepage-proposal/desktop-website work. Invoke as `/nhdesign4-knowhow-app <lesson, 'wrap up', or 'verify knowhow'>`."
risk: safe
---

# nhdesign4-knowhow-app

This is the nhdesign4-series counterpart of the v3 skill at
`~/.claude/skills/.claude/worktrees/nhdesign3-knowhow/nhdesign3-knowhow-app/SKILL.md`, reading
from and writing to the forked `nhdesign4_*` tables — not `nhdesign3_*`.

Thin, explicitly-invokable front door onto nhdesign4's **Mode 4 — KNOWHOW capture**, scoped to
the **app/NDS side** (`nhdesign4-nds-proposal` and other NDS-component BUILD work). It does not carry its
own rules about *what* qualifies as knowhow or *how* to write it — that logic lives in
`nhdesign4/SKILL.md` and this skill defers to it, so there is exactly one source of truth. What
this skill adds on top: a fast, memorable trigger surface for "save this now" and "wrap up the
session," plus a session-scan procedure for the latter (Mode 4 alone assumes you already know
which lesson to write; a session-wrap doesn't).

**Which knowhow skill to use**: if the correction happened during `nhdesign4-nds-proposal`/NDS component
work (Figma component-instance lookups, coordinate/connector rules, component-key traps), use
this skill. If it happened during `nhdesign4-homepage-proposal`/desktop-website work, use
`nhdesign4-knowhow-homepage` instead — its source (`knowhow-nhdesign4-homepage`) is kept
deliberately separate so neither BUILD pass has to filter through the other domain's lessons.

## 0. Load prerequisites (mandatory, in order)

1. Invoke the `nhdesign4` skill — even if already loaded earlier in the session. Its Storage
   section (how `kind='knowhow'` differs from `guide`/`project`/`website`) and Mode 4 procedure
   are required below, not optional context.
2. Confirm the `knowhow-nhdesign4` source exists and note its current `total_pages`:

   ```sql
   select id, name, total_pages, learned_pages from nhdesign4_sources
   where file_key = 'knowhow-nhdesign4';
   ```

   If it doesn't exist yet, this is the first knowhow write of the project — create it first
   (`kind='knowhow'`, per the Storage table in `nhdesign4/SKILL.md`) before inserting a page.

## 1. Two invocation styles

### (a) Targeted — a specific lesson is already known

The user just corrected something, and either they or you already know what the generalizable
lesson is (e.g. "화살표는 정확히 어디를 눌렀을때 뜨는건지 명확히 보여줘야함" → the lesson is
"connector start-points must anchor to a real element's `absoluteBoundingBox`, never an
approximate point"). Skip straight to §2 (write procedure) — no scanning needed.

### (b) Session-wrap — no single lesson pre-named

Triggered by phrases like "세션 마무리", "노하우 정리해줘", "오늘 배운거 정리해", "wrap up and
save knowhow" — the user wants *this session's* correction history mined for lessons, not just
one thing written down. Procedure:

1. Re-read the session's correction moments: every point where the user pushed back on
   something you built/proposed and you had to change approach (not just fix a typo). Look
   specifically for the signals listed in `nhdesign4/SKILL.md` Mode 4 ("Trigger" paragraph):
   recomputing coordinates a second time, a Figma API quirk that caused a silent wrong value, a
   documented "intentional" choice that got overridden by real judgment, a quality-gate check
   that existed but still missed something.
2. For each candidate, apply the Mode 4 "What does NOT belong here" filter before proposing it
   — drop one-off content typos and anything already fully covered by an existing guide/rubric
   rule (extend that rule instead of duplicating).
3. **List the surviving candidates back to the user in one message, one line each, before
   writing anything** — session-wrap is a batch operation touching multiple DB rows, so a quick
   confirmation pass catches over-eager candidates before they're permanently registered. Skip
   this confirmation only if the user's invocation already named an explicit, small, unambiguous
   set of lessons.
4. Write each confirmed candidate per §2, in one batched SQL file (not N separate round-trips —
   see the concurrent-write caution in `nhdesign4/SKILL.md`'s Storage section).

## 2. Write procedure (per lesson, from `nhdesign4/SKILL.md` Mode 4 §"How to write")

1. Insert one page per lesson into the `knowhow-nhdesign4` source. `page_name` states the lesson
   as a short claim (not a vague topic label); `content_md` gives: 실수/root cause → 수정 방법 →
   일반화 규칙, in that order, mirroring the pattern used by `knowhow-01` through `knowhow-12`.
2. **If the lesson is operationally load-bearing** for future BUILD runs (a routing algorithm, a
   coordinate rule, a component substitution rule) — fold it into the actual page BUILD reads
   too (vibe-rubric, the connector recipe, `screen-flow-overview-pattern`, or the relevant
   skill's own SKILL.md quality-gate section, as happened with `nhdesign4-nds-proposal`'s badge-anchor
   rule). The knowhow page is the browsable record of *why*; the operational page/skill is what
   actually changes future behavior. Writing only the knowhow page and skipping this step means
   the lesson documents itself without preventing recurrence.
3. Register or extend a `nhdesign4_topics` row (bilingual ko/en keywords) so the lesson is
   findable by future BUILD passes querying by topic, not just by browsing knowhow pages
   directly.
4. Bump `knowhow-nhdesign4`'s `total_pages`/`learned_pages` to match the new page count.
5. If the lesson traces back to a concrete incident worth a permanent audit trail (a specific
   bug that shipped, a specific user correction with lasting consequence), also append a
   `nhdesign4_ledger` row with `status='resolved'` — same as the existing knowhow ledger entries
   (`trading-economics-duplicate-build-recovery-2026-07-18`, `ppt-badge-misalignment-fix-2026-07-18`,
   etc.).
6. There is no fixed page count to reach — this keeps growing every session. Do not treat
   "enough knowhow pages exist" as a reason to stop capturing new ones.

## Ingest / VERIFY mode — re-read and re-verify existing knowhow rows

The sections above are the **capture path**: a NEW lesson enters from a live correction that just
happened (targeted §1a) or from mining this session's correction history (session-wrap §1b). This
mode is the opposite direction — it does not write a fresh lesson at all, it re-audits the
**existing** `knowhow-nhdesign4` corpus, mirroring `nhdesign4/SKILL.md` **Mode 3 — VERIFY** (the
same re-read / `reviewed_date`-bump / ledger-on-change discipline the sibling `nhdesign4-nds-ingest`
applies to guide rows).

**When this fires vs. capture**: VERIFY fires on re-audit signals — "노하우 재검증", "노하우
정리해줘"/"노하우 중복 정리해줘", "노하우 감사", "이미 저장된 노하우 최신화",
"verify/audit the knowhow". If the user just corrected something and wants it recorded, that is
still the capture path (§1), not this — VERIFY never opens on a fresh correction.

**Procedure** (defer to `nhdesign4/SKILL.md` Mode 3 for the discipline; the knowhow-specific
application):

1. Pull ALL existing pages for this skill's knowhow source (`file_key = 'knowhow-nhdesign4'`) and
   treat each lesson as a **CLAIM to re-check**, not a blank slate.
2. For each lesson decide: still true & relevant? superseded by a newer rule or already folded
   into an operational page (vibe-rubric / connector recipe / a skill's own quality-gate section)?
   duplicated by another `knowhow-nhdesign4` page?
3. Lessons that still hold unchanged → bump `reviewed_date` on that page (or the source row per
   existing convention) — the signal it was actually re-checked, not left stale.
4. Lessons that changed / were superseded / should merge → update `content_md` in place and append
   a `nhdesign4_ledger` row recording old → new (or merged-into `<anchor>`); never silently
   overwrite. Keep `total_pages`/`learned_pages` accurate after any prune or merge.
5. Operationally load-bearing lessons NOT yet folded into the rubric/recipe/skill → fold them now,
   exactly as capture §2 step 2.

**Anti-invention**: this VERIFY mode NEVER manufactures new lessons. New knowhow enters only
through the capture path (§1) from a real correction — a re-audit can confirm, update, merge, or
prune existing claims, but it does not invent one.

## 3. Report back

After writing, tell the user in 1-3 lines: what was saved (page name + one-sentence gist), and
whether it was also folded into an operational page/skill (step 2 above) — if it wasn't and
probably should have been, say so rather than silently skipping it.

## Non-goals

- Not for registering a finished build's screens/components as a `project`-kind source — that's
  nhdesign4 Mode 1 (LEARN), only once work is actually shipped.
- Not a general "session summary" skill — it only writes to the `knowhow-nhdesign4` source. If
  the user wants a broader session wrap (docs updates, follow-up tasks, non-nhdesign4 learnings),
  that's a separate skill's job; say so rather than overreaching into that scope here.
