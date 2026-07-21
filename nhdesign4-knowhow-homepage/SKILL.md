---
name: nhdesign4-knowhow-homepage
description: "Dedicated entry point for saving lessons learned into nhdesign4-homepage-proposal's knowhow category (kind='knowhow', source `knowhow-nhdesign4-homepage`) — the running record of what a human correction taught during a `nhdesign4-homepage-proposal` BUILD/correction session (NH desktop website mockup work), distinct from `nhdesign4-knowhow-app` (which covers NDS/app BUILD sessions via `nhdesign4-nds-proposal`) and distinct from the finished deliverable itself. Two invocation styles: (1) targeted — user names a specific lesson right now ('노하우 저장해', '이거 노하우로 남겨', '노하우로 기록해', 'save this as knowhow'); (2) session-wrap — invoked at the end of a session ('세션 마무리', '노하우 정리해줘', 'wrap up and save knowhow') with no single lesson pre-named, so this skill scans the conversation for correction/fix moments and proposes candidates before writing. It also re-verifies/audits the existing knowhow corpus (Mode 3 over its own kind='knowhow' rows) — re-reading `knowhow-nhdesign4-homepage` pages as claims to re-check, bumping `reviewed_date`, merging/updating superseded lessons — when asked to '노하우 재검증'/'노하우 정리·중복 정리'/'verify the knowhow', not just capturing new ones. Use when the correction happened during nhdesign4-homepage-proposal work (desktop website mockups, live-site sampling, brand/nav facts) — use `nhdesign4-knowhow-app` instead if the correction happened during nhdesign4-nds-proposal/NDS component BUILD work. Trigger via `/nhdesign4-knowhow-homepage <lesson | 'wrap up' | 'verify knowhow'>`."
risk: safe
---

# nhdesign4-knowhow-homepage

This is the nhdesign4-series counterpart of the v3 skill at
`~/.claude/skills/.claude/worktrees/nhdesign3-knowhow/nhdesign3-knowhow-homepage/SKILL.md`, reading
from and writing to the forked `nhdesign4_*` tables — never the `nhdesign3_*` tables.

Thin, explicitly-invokable front door onto `nhdesign4-homepage-proposal`'s own **KNOWHOW capture** section
(`nhdesign4-homepage-proposal/SKILL.md` §7). Sibling to `nhdesign4-knowhow-app` — same pattern, different
domain and different storage row: this one writes to `knowhow-nhdesign4-homepage`, never
`knowhow-nhdesign4`. It does not carry its own rules about *what* qualifies as knowhow or *how* to
write it — that logic lives in `nhdesign4-homepage-proposal/SKILL.md` §7 and this skill defers to it, so
there is exactly one source of truth per domain.

**Which knowhow skill to use**: if the correction happened while building/reviewing a desktop
website mockup (`nhdesign4-homepage-proposal`) — live-site sampling, brand/nav volatility, Chrome
`use_browser` quirks, screenshot-compare against a live site — use this skill. If it happened
during `nhdesign4-nds-proposal`/NDS component work, use `nhdesign4-knowhow-app` instead. If genuinely unsure
which session the correction belongs to, ask rather than guessing — the two sources are
deliberately kept separate so a BUILD pass never has to filter out irrelevant-domain lessons.

## 0. Load prerequisites (mandatory, in order)

1. Invoke the `nhdesign4` skill — even if already loaded earlier in the session. It owns the DB
   connection and Storage conventions (`kind='knowhow'` vs `guide`/`project`/`website`) that this
   skill's writes depend on.
2. Confirm the `knowhow-nhdesign4-homepage` source exists and note its current `total_pages`:

   ```sql
   select id, name, total_pages, learned_pages from nhdesign4_sources
   where file_key = 'knowhow-nhdesign4-homepage';
   ```

   An empty result (0 rows) is expected the first time this skill runs — it just means no lesson
   has been written yet, not an error. If it doesn't exist yet, this is the first
   nhdesign4-homepage-proposal knowhow write — create it first (`kind='knowhow'`, per the Storage
   table in `nhdesign4/SKILL.md`) before inserting a page.

## 1. Two invocation styles

### (a) Targeted — a specific lesson is already known

The user just corrected something during a `nhdesign4-homepage-proposal` session, and either they or you
already know what the generalizable lesson is (e.g. "라이브 사이트 색상/nav는 매번 새로 확인해야해,
DB 스냅샷 믿지마" → the lesson is "brand palette/nav must be freshness-checked live every run,
given the mynamuh/nhsec ~24h rebrand flap — never trust the DB's last-recorded snapshot as
current"). Skip straight to §2 (write procedure) — no scanning needed.

### (b) Session-wrap — no single lesson pre-named

Triggered by phrases like "세션 마무리", "노하우 정리해줘", "오늘 배운거 정리해", "wrap up and
save knowhow" — the user wants *this session's* correction history mined for lessons, not just
one thing written down. Procedure:

1. Re-read the session's correction moments: every point where the user pushed back on something
   you built/proposed for the website deliverable and you had to change approach (not just fix a
   typo). Look specifically for the signals listed in `nhdesign4-homepage-proposal/SKILL.md` §7 ("Trigger"
   paragraph): a live-site sampling method that silently produced a wrong value, a
   browser-automation quirk, a stale brand/nav assumption, a screenshot-compare gate that still
   missed a mismatch.
2. For each candidate, apply the §7 "What does NOT belong here" filter before proposing it — drop
   one-off page-fact corrections with no generalizable sampling-method lesson, and anything
   already fully covered by an existing rule in `nhdesign4-homepage-proposal/SKILL.md`.
3. **List the surviving candidates back to the user in one message, one line each, before writing
   anything** — session-wrap is a batch operation touching multiple DB rows, so a quick
   confirmation pass catches over-eager candidates before they're permanently registered. Skip
   this confirmation only if the user's invocation already named an explicit, small, unambiguous
   set of lessons.
4. Write each confirmed candidate per §2, in one batched SQL file (not N separate round-trips —
   see the concurrent-write caution in `nhdesign4/SKILL.md`'s Storage section).

## 2. Write procedure (per lesson, from `nhdesign4-homepage-proposal/SKILL.md` §7 "How to write")

1. Insert one page per lesson into the `knowhow-nhdesign4-homepage` source. `page_name` states the
   lesson as a short claim (not a vague topic label); `content_md` gives: 실수/root cause → 수정
   방법 → 일반화 규칙, in that order.
2. **If the lesson is operationally load-bearing** for future BUILD runs — fold it into
   `nhdesign4-homepage-proposal/SKILL.md`'s own relevant step (step 1's live-check procedure, step 5's
   substance-swap rules, or step 6's quality gate). The knowhow page is the browsable record of
   *why*; the skill's own step is what actually changes future behavior. Writing only the knowhow
   page and skipping this step means the lesson documents itself without preventing recurrence.
3. Register or extend a `nhdesign4_topics` row (bilingual ko/en keywords) so the lesson is
   findable by future BUILD passes querying by topic, not just by browsing knowhow pages
   directly.
4. Bump `knowhow-nhdesign4-homepage`'s `total_pages`/`learned_pages` to match the new page count.
5. If the lesson traces back to a concrete incident worth a permanent audit trail (a specific
   mismatch that shipped, a specific user correction with lasting consequence), also append a
   `nhdesign4_ledger` row with `status='resolved'`.
6. There is no fixed page count to reach — this keeps growing every session. Do not treat "enough
   knowhow pages exist" as a reason to stop capturing new ones.

## Ingest / VERIFY mode — re-read and re-verify existing knowhow rows

This mode is the counterpart to the LEARN+VERIFY front doors (`nhdesign4-nds-ingest`,
`nhdesign4-project-ingest`, `nhdesign4-homepage-ingest`) that can re-read and re-verify existing
DB rows, not only write new ones — applied here to this skill's own `kind='knowhow'` corpus. It
runs nhdesign4's **Mode 3 — VERIFY** over the `knowhow-nhdesign4-homepage` source; this skill
carries no verify procedure of its own and defers to `nhdesign4/SKILL.md` Mode 3 for the
discipline (re-read every stored row as a claim to check, update in place with a `reviewed_date`
bump, never silently overwrite, note old → new in `nhdesign4_ledger`), the same framing as
`nhdesign4-homepage-ingest` §2 and `nhdesign4-nds-ingest` Mode 3.

**When this mode fires, vs. the capture path (§1/§2).** Capture = a NEW lesson from a live
correction the user just made and wants recorded — stay on the §1/§2 path for that, even at
session-wrap. VERIFY = re-auditing the EXISTING knowhow corpus with no new lesson being learned.
Signal phrases for VERIFY: "노하우 재검증", "노하우 정리해줘 / 중복 정리해줘", "노하우 감사",
"verify/audit the knowhow", "이미 저장된 노하우 최신화". If the user just corrected something and
wants it written down, that is still capture, not this — do not route a fresh correction here.

**Procedure** (defer to `nhdesign4/SKILL.md` Mode 3; knowhow-specific application):

1. Pull ALL existing `nhdesign4_pages` rows for THIS skill's knowhow source
   (`file_key = 'knowhow-nhdesign4-homepage'`) and treat each lesson as a CLAIM to re-check, not
   a blank slate. **If no `knowhow-nhdesign4-homepage` source/pages exist yet** — expected until
   the first homepage knowhow is captured (this source is created on first capture, per §0) —
   there is nothing to re-verify; say so plainly and stop, rather than inventing rows to audit.
2. For each lesson decide: still true & relevant? superseded by a newer rule or already folded
   into an operational page (a vibe-rubric / recipe / a skill's own quality-gate section, e.g.
   `nhdesign4-homepage-proposal/SKILL.md`'s live-check/substance-swap/quality-gate steps)?
   duplicated by another knowhow page?
3. Lessons that still hold unchanged → bump `reviewed_date` on that page's row (or the source
   row, per existing convention) — the signal it was actually re-checked, not left stale.
4. Lessons that changed / were superseded / should merge → update `content_md` in place and
   append a `nhdesign4_ledger` row recording old → new (or merged-into `<anchor>`) — never
   silently overwrite. Keep `total_pages`/`learned_pages` accurate after any prune or merge.
5. Operationally load-bearing lessons NOT yet folded into the rubric/recipe/skill → fold them now
   into `nhdesign4-homepage-proposal/SKILL.md`'s relevant step, exactly as §2 step 2 requires for
   capture — a re-verify pass is a legitimate moment to close that gap.

**This VERIFY mode NEVER manufactures new lessons.** New knowhow enters only through the capture
path (§1/§2) from a real human correction; re-verify audits, bumps, updates, and merges what is
already stored — it does not invent claims that no correction ever taught.

## 3. Report back

After writing, tell the user in 1-3 lines: what was saved (page name + one-sentence gist), and
whether it was also folded into `nhdesign4-homepage-proposal/SKILL.md` (step 2 above) — if it wasn't and
probably should have been, say so rather than silently skipping it.

## Non-goals

- Not for registering a finished website deliverable's pages as a `website`/`project`-kind
  source — that belongs to `nhdesign4-homepage-proposal`'s own live-site page write-back (step 6), only for
  confirmed/sampled facts, not lessons.
- Not for corrections that happened during `nhdesign4-nds-proposal`/NDS component BUILD work — route those
  to `nhdesign4-knowhow-app` and its `knowhow-nhdesign4` source instead.
- Not a general "session summary" skill — it only writes to the `knowhow-nhdesign4-homepage`
  source. If the user wants a broader session wrap (docs updates, follow-up tasks,
  non-nhdesign4-homepage-proposal learnings), that's a separate skill's job; say so rather than
  overreaching into that scope here.
