# COMMON — cross-project baseline (always-on for BUILD)

> **BUILD reads this FIRST.** These are patterns confirmed across **≥2 independently-learned projects** — the only
> things safe to assume about *any* NH MTS screen without checking a specific project note.
>
> **Read order for BUILD:** this file → `INDEX.md` (find the closest project) → that project note → the guide domain
> (`../nds/CORE.md` → `../nds/INDEX.md` → its note). Check `LEDGER.md` only when INDEX flags ⚠/⛔.
> **Never** read `sources/*.md` at build time — that is LEARN/VERIFY forensics.
>
> **The ≥2 bar is deliberate and differs from `../nds`.** This domain covers **independently-built shipped screens**
> that may each solve a problem their own way, so one sighting proves nothing general — it proves what *that project*
> did. `../nds` has no bar because NDS is a single canonical library with no second implementation to disagree.
> **A claim seen in only 1 project stays in that project's note, tagged `[candidate-common]`.** Do not promote it
> here to be tidy — promoting a one-off as a "pattern" is how a project's quirk becomes a fake rule.

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
