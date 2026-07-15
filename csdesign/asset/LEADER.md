# asset

Domain knowledge for turning real NH투자증권 Figma projects into reusable design knowledge, and for using that knowledge later to generate new screens/prototypes that read as "designed by NH's own team," not generic AI output.

This domain has three modes. Detect which one applies from the user's request; don't ask unless genuinely ambiguous.

## Mode 1 — LEARN (register a project)

Triggered when the user gives a Figma project name + file URL(s) and asks to study/learn it (e.g. "이 프로젝트 학습해", a `figma.com/design/...` link with no build request).

Steps:
1. Load `figma-use` (and read `../nds/LEADER.md` if NDS components appear) before any Figma tool call.
2. `get_metadata` (no nodeId) on the file to see top-level pages. `get_metadata` on the given nodeId to see the section's frame/screen structure.
3. `get_screenshot` on the given node and on 2-4 sibling top-level frames to see representative screens across the flow (list → detail → confirm → complete, etc. — whatever the project's actual flow is).
4. For each representative screen, note down:
   - **Information architecture**: what's on screen, in what order, what's primary vs. secondary
   - **Interaction/behavior structure**: what's tappable, what triggers a sheet/popup/toast/navigation, disabled-state rules, confirmation-before-destructive-action patterns
   - **Design structure**: header pattern, spacing rhythm, card/list conventions, button placement (sticky bottom vs inline), color usage for status/semantic states
   - **Component reuse**: which NDS component sets appear as instances (cross-reference `../nds/LEADER.md` keys; add any new ones discovered)
5. Write one file: `projects/<kebab-project-name>.md` with frontmatter `name`, `fileKey`, `source_url`, `learned_date`, `screens_studied` (node IDs), then the observations from step 4. Keep it concrete — cite actual node names/labels seen, not generic advice. **Quote copy verbatim, don't paraphrase** — exact disclaimer/popup/label text is a Mode 3 (VERIFY) finding waiting to happen if it's approximated instead of quoted.
6. If the component/color/font findings extend what's in `../nds/LEADER.md`, append there too (don't duplicate — that file owns global NDS facts; this domain's per-project files own project-specific screen/flow conventions).
7. **Check for promotion to "Common patterns" below.** Skim the other already-registered projects' Takeaways sections for overlap with this project's findings. If **another project already independently makes the same claim**, promote/update it into the "Common patterns" section below, citing both projects + today's date — this is now a confirmed cross-project pattern, not a one-off. If this is the **first** project to observe it, don't promote yet — tag it `[candidate-common]` inline in this project's own Takeaways section instead, so the next LEARN pass in this domain knows to check specifically for it.

## Mode 2 — BUILD (generate matching output)

> **Pairing contract (one line, canonical wording lives in `csdesign/SKILL.md` routing step 3 — sync on edit):**
> When building alongside `../nds`: **component facts come from NDS; if a component fact conflicts with this domain's project note, this note (shipped production) wins.**
> Stated here too because a task may load this LEADER without `csdesign/SKILL.md`, and the pair would silently lose its rule.


Triggered when the user gives a prompt or a prototype and asks for a new Figma file or prototype that should match NH's existing quality/conventions.

Steps:
1. **Read "Common patterns" below first** — these are cross-project-confirmed rules that apply regardless of which specific project is closest, and should be treated as defaults.
2. Identify which learned project(s) under `projects/` are the closest match to the requested screen (by domain — e.g. rights/의결권/권리 requests match `projects/domestic-stock-rights.md` if learned). If no project file matches closely, say so and proceed with only "Common patterns" + `../nds/LEADER.md` as the base — don't silently invent conventions.
3. Read the matched project file(s), then the guide domain — **`../nds/CORE.md` → `../nds/INDEX.md` → the note it names** (not `../nds/LEADER.md`, and never `../nds/sources/*`). Load `figma-use`/`figma-generate-design`.
4. Build using the **same** information architecture, interaction patterns, and component choices documented in the project file — not a fresh generic layout. Where a project's specific note conflicts with "Common patterns," the project's own note wins (it's more specific), but flag the conflict — it likely means "Common patterns" needs its confirmed-project-count re-checked.
5. Validate with `get_screenshot` against the patterns noted (header style, button placement, spacing) before considering it done.

## Mode 3 — VERIFY (re-check a learned project against source)

Triggered when the user asks to re-review, double-check, verify, or re-learn an **already-registered** project (e.g. "이거 제대로 학습된 거 맞는지 봐줘", "다시 검토해줘", "재검토", "검증해줘") — as opposed to Mode 1 (first-time learn, blank slate) or Mode 2 (build). The goal is consistency and accuracy: catch mistranscribed strings, undercounted supersets, and missed designer annotations before they propagate into a BUILD pass.

Steps:
1. **Read the existing `projects/<name>.md` note in full first.** This is the set of claims to check, not a blank slate — you're auditing specific assertions, not re-discovering the project from scratch.
2. Load `figma-use` before any Figma tool call.
3. Re-`get_metadata` on the same node(s) cited in the note's `screens_studied`. If the result exceeds token limits, it's saved to a file — read that with a script (`jq`/python), searching for the literal strings/keys/counts the note claims, rather than skimming or re-requesting narrower slices repeatedly.
4. **Prioritize claims that name a literal string, count, or key** — component keys, field label names, exact popup/disclaimer copy, variant counts. These are the claims most likely to have drifted or been mistranscribed on the first pass. Structural/behavioral claims (interaction pattern, layout order, chrome composition) are comparatively stable — spot-check with 1-2 screenshots rather than exhaustively re-verifying every one.
5. `get_screenshot` the same representative frames the note cites (list/detail/popup/empty, etc.) to visually confirm interaction patterns AND read exact on-screen copy. TEXT node `name` attributes in the metadata usually mirror their displayed content, but not always (long strings can carry a custom layer name) — when a metadata string-search comes up empty for a quoted claim, fall back to reading it directly off the screenshot instead of assuming it's unverifiable.
6. **Actively search for designer's own annotation text** sitting near the reference frames — spec notes, explicit rules, "전체 데이터"/reference-frame labels, sticky/scroll behavior notes, etc. These are frequently the highest-value find of a VERIFY pass: real production rules that no amount of inspecting the ordinary screens would reveal, because they only exist as a designer's own margin note on the canvas.
7. **Update the project file in place, not by silent overwrite.** Mark every correction inline with a `corrected <today's date>` or `added <today's date>` note stating what changed and why (cite the old vs. new value). Add/bump a `reviewed_date` field in the frontmatter. This keeps the note auditable — a future VERIFY pass (or a human) can see what was checked when, not just the final claim.
8. **If the correction touches a claim already promoted to "Common patterns" below** (not just this one project file), correct it there too with the same dated convention — and re-check whether the claim still clears the 2-project confirmation bar (see Mode 1 step 7). A correction to one supporting project can knock a "confirmed" pattern back down to a single-project `[candidate-common]`.
9. If nothing was wrong, still stamp `reviewed_date` and add a one-line "re-reviewed `<date>`, no corrections" note — a verified-clean project is worth recording as such, so a stale `reviewed_date` doesn't get mistaken for "never checked."

## Common patterns (confirmed across ≥2 projects)

Cross-project generalizations belong here, not scattered across individual project files' Takeaways sections — this is what Mode 2 (BUILD) checks first for "does this apply to any NH production screen," before falling back to a single project's specific notes.

**Promotion rule**: a claim only earns a place here once it's independently confirmed by **2 or more** learned projects (see Mode 1 step 7 / Mode 3 step 8) — a single project's convention might be project-specific, not a real NH-wide pattern. This is a **higher bar than `../nds`'s Core reference uses** — NDS is a single canonical design-system source, so one confirmed observation from the real library is already authoritative; `asset` covers independently-built shipped screens that might each do things their own way, so one project alone doesn't prove a pattern is universal.

**Status as of 2026-07-15**: only 1 project (`domestic-stock-rights`) is registered — nothing below has cleared the 2-project bar yet. That project's Takeaways section contains several claims that are strong `[candidate-common]` candidates and should be promoted here the moment a second `asset` project independently confirms any of them:
- App-shell chrome (`statusbar` + `header_basic` + global `quickmenu_basic` bottom nav + persistent one-line disclaimer) is always present on every real screen.
- Row-level detail view defaults to a bottom sheet, not push navigation, unless the flow is a genuinely separate multi-step task.
- Card/detail fields are modeled as one full superset with per-type visibility toggles, not a different hand-built card per type.
- Single-button layer popups for informational/navigational heads-ups; two-button (취소/제출) popups reserved strictly for irreversible confirmations.
- List-row status has 3 tiers (chevron = actionable / colored badge, optionally labeled = needs attention / text label = done), not a plain binary chip.

(This section stays empty of actually-confirmed entries until a 2nd project reaches it — do not promote from a single source, even one that looks obviously general.)

## Registered projects

(Populated as projects are learned via Mode 1 — see `projects/` for the individual files.)

| Project | File | Learned | Last reviewed | Notes |
|---|---|---|---|---|
| [domestic-stock-rights](projects/domestic-stock-rights.md) | `ZkwarjFkN8BiGolWO7PcwI` (반영완료⭐️ 국내주식 권리) | 2026-07-14 | 2026-07-15 | Shipped production reference (qualified — see below). Key patterns: detail = bottom sheet (not push nav), always-on bottom disclaimer + global quickmenu nav, single-CTA nav-confirm popups vs two-CTA confirm (irreversible actions **and** setting/filter-apply confirms — widened 2026-07-15), card fields as superset w/ per-type visibility. Coverage: **6/6 pages** (method: `figma.root.children`) · **26/26 MASTER product frames** (method: `get_metadata`) — both denominators tracked separately, see the note's Page coverage table. `기획안 수정전` (`0:1`) verdict: **not-superseded** — it carries its own complete to-be section, contradicting the assumption that only `기획안 2nd` has one; whether it's an earlier draft or a divergent proposal is an open question. `Page 2` (`16:1704`) verdict: **scratch/working canvas** — 283 children, dummy data throughout (every row "카카오"), not authoritative. `디자인검수` (`473:4462`) verdict: **qualified shipped** — of 10 numbered fixes, 1 confirmed applied, 2 likely still open (Roboto font, flagged twice), 4 unverifiable (pixel deltas need device access this read-only session didn't have), 3 unchecked. Re-reviewed 2026-07-15 (two passes same day) — first pass corrected several mistranscribed field names/quoted copy; second pass audited all 6 pages, learned 18 net-new MASTER screens, and recorded a file-specific exception (TEXT node `name` reliably matches on-canvas copy here) plus a tooling gotcha (`figma.root.children` child counts are unreliable for non-current pages — use `get_metadata` per page instead). See the file's inline `corrected 2026-07-15` / `added 2026-07-15` notes. |
