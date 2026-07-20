---
name: nhdesign3-knowhow-homepage
description: "Dedicated entry point for saving lessons learned into nhdesign3-homepage-proposal's knowhow category (kind='knowhow', source `knowhow-homepage-proposal`) — the running record of what a human correction taught during a `nhdesign3-homepage-proposal` BUILD/correction session (NH desktop website mockup work), distinct from `nhdesign3-knowhow-app` (which covers NDS/app BUILD sessions via `nhdesign3-nds-proposal`) and distinct from the finished deliverable itself. Two invocation styles: (1) targeted — user names a specific lesson right now ('노하우 저장해', '이거 노하우로 남겨', '노하우로 기록해', 'save this as knowhow'); (2) session-wrap — invoked at the end of a session ('세션 마무리', '노하우 정리해줘', 'wrap up and save knowhow') with no single lesson pre-named, so this skill scans the conversation for correction/fix moments and proposes candidates before writing. Use when the correction happened during nhdesign3-homepage-proposal work (desktop website mockups, live-site sampling, brand/nav facts) — use `nhdesign3-knowhow-app` instead if the correction happened during nhdesign3-nds-proposal/NDS component BUILD work."
risk: safe
---

# nhdesign3-knowhow-homepage

Thin, explicitly-invokable front door onto `nhdesign3-homepage-proposal`'s own **KNOWHOW capture** section
(`nhdesign3-homepage-proposal/SKILL.md` §7). Sibling to `nhdesign3-knowhow-app` — same pattern, different
domain and different storage row: this one writes to `knowhow-homepage-proposal`, never
`knowhow-nhdesign3`. It does not carry its own rules about *what* qualifies as knowhow or *how* to
write it — that logic lives in `nhdesign3-homepage-proposal/SKILL.md` §7 and this skill defers to it, so
there is exactly one source of truth per domain.

**Which knowhow skill to use**: if the correction happened while building/reviewing a desktop
website mockup (`nhdesign3-homepage-proposal`) — live-site sampling, brand/nav volatility, Chrome
`use_browser` quirks, screenshot-compare against a live site — use this skill. If it happened
during `nhdesign3-nds-proposal`/NDS component work, use `nhdesign3-knowhow-app` instead. If genuinely unsure
which session the correction belongs to, ask rather than guessing — the two sources are
deliberately kept separate so a BUILD pass never has to filter out irrelevant-domain lessons.

## 0. Load prerequisites (mandatory, in order)

1. Invoke the `nhdesign3` skill — even if already loaded earlier in the session. It owns the DB
   connection and Storage conventions (`kind='knowhow'` vs `guide`/`project`/`website`) that this
   skill's writes depend on.
2. Confirm the `knowhow-homepage-proposal` source exists and note its current `total_pages`:

   ```sql
   select id, name, total_pages, learned_pages from nhdesign3_sources
   where file_key = 'knowhow-homepage-proposal';
   ```

   If it doesn't exist yet, this is the first nhdesign3-homepage-proposal knowhow write — create it first
   (`kind='knowhow'`, per the Storage table in `nhdesign3/SKILL.md`) before inserting a page.

## 1. Two invocation styles

### (a) Targeted — a specific lesson is already known

The user just corrected something during a `nhdesign3-homepage-proposal` session, and either they or you
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
   typo). Look specifically for the signals listed in `nhdesign3-homepage-proposal/SKILL.md` §7 ("Trigger"
   paragraph): a live-site sampling method that silently produced a wrong value, a
   browser-automation quirk, a stale brand/nav assumption, a screenshot-compare gate that still
   missed a mismatch.
2. For each candidate, apply the §7 "What does NOT belong here" filter before proposing it — drop
   one-off page-fact corrections with no generalizable sampling-method lesson, and anything
   already fully covered by an existing rule in `nhdesign3-homepage-proposal/SKILL.md`.
3. **List the surviving candidates back to the user in one message, one line each, before writing
   anything** — session-wrap is a batch operation touching multiple DB rows, so a quick
   confirmation pass catches over-eager candidates before they're permanently registered. Skip
   this confirmation only if the user's invocation already named an explicit, small, unambiguous
   set of lessons.
4. Write each confirmed candidate per §2, in one batched SQL file (not N separate round-trips —
   see the concurrent-write caution in `nhdesign3/SKILL.md`'s Storage section).

## 2. Write procedure (per lesson, from `nhdesign3-homepage-proposal/SKILL.md` §7 "How to write")

1. Insert one page per lesson into the `knowhow-homepage-proposal` source. `page_name` states the
   lesson as a short claim (not a vague topic label); `content_md` gives: 실수/root cause → 수정
   방법 → 일반화 규칙, in that order.
2. **If the lesson is operationally load-bearing** for future BUILD runs — fold it into
   `nhdesign3-homepage-proposal/SKILL.md`'s own relevant step (step 1's live-check procedure, step 5's
   substance-swap rules, or step 6's quality gate). The knowhow page is the browsable record of
   *why*; the skill's own step is what actually changes future behavior. Writing only the knowhow
   page and skipping this step means the lesson documents itself without preventing recurrence.
3. Register or extend a `nhdesign3_topics` row (bilingual ko/en keywords) so the lesson is
   findable by future BUILD passes querying by topic, not just by browsing knowhow pages
   directly.
4. Bump `knowhow-homepage-proposal`'s `total_pages`/`learned_pages` to match the new page count.
5. If the lesson traces back to a concrete incident worth a permanent audit trail (a specific
   mismatch that shipped, a specific user correction with lasting consequence), also append a
   `nhdesign3_ledger` row with `status='resolved'`.
6. There is no fixed page count to reach — this keeps growing every session. Do not treat "enough
   knowhow pages exist" as a reason to stop capturing new ones.

## 3. Report back

After writing, tell the user in 1-3 lines: what was saved (page name + one-sentence gist), and
whether it was also folded into `nhdesign3-homepage-proposal/SKILL.md` (step 2 above) — if it wasn't and
probably should have been, say so rather than silently skipping it.

## Non-goals

- Not for registering a finished website deliverable's pages as a `website`/`project`-kind
  source — that belongs to `nhdesign3-homepage-proposal`'s own live-site page write-back (step 6), only for
  confirmed/sampled facts, not lessons.
- Not for corrections that happened during `nhdesign3-nds-proposal`/NDS component BUILD work — route those
  to `nhdesign3-knowhow-app` and its `knowhow-nhdesign3` source instead.
- Not a general "session summary" skill — it only writes to the `knowhow-homepage-proposal`
  source. If the user wants a broader session wrap (docs updates, follow-up tasks,
  non-nhdesign3-homepage-proposal learnings), that's a separate skill's job; say so rather than
  overreaching into that scope here.
