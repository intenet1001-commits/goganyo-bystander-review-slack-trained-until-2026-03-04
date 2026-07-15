# INDEX — screen / feature → project note

> **BUILD reads this SECOND** (after `COMMON.md`), to pick the closest-matching project. **One line per project** —
> this is the file that stays cheap as projects accumulate. The old registry table put ~1,800 characters in a single
> cell per project; at N projects that becomes unreadable, which is exactly what happened to `../nds` before it was
> split.
>
> **How to match:** find the row whose screens/patterns are closest to what you're building. **Closest ≠ same** —
> read the note and take the *pattern*, not the content. If nothing is close, say so and build from `COMMON.md` +
> `../nds` alone rather than forcing a bad match.
>
> **Flags:** ⚠ = contested / unresolved · ⛔ = cannot be determined with what exists. When flagged, read that
> `LEDGER.md` anchor **before** building.
> **An unflagged row means "no contest on record" — NOT "audited and clean."** Every LEDGER entry was found by an
> explicit pass; an un-audited project and a genuinely clean one look identical here.

| project | screens / patterns it covers | status | note | forensics | flags |
|---|---|---|---|---|---|
| **국내주식 권리** (`ZkwarjFkN8BiGolWO7PcwI`) | list screen (card + table view toggle) · 4-state scroll-depth table w/ sticky header · bottom-sheet detail (2-zone, sticky header) · 조회설정 filter sheet (preset vs custom range) · 직접선택 single-select popup · nav-confirm popups · empty state · account controller (라인형) · header (title-as-dropdown) · 9-edge prototype flow graph | **shipped** (반영완료⭐️) — highest-confidence reference | `projects/domestic-stock-rights.md` | `sources/domestic-stock-rights.md` | ⚠ LEDGER#header-basic-key-choice · ⚠ LEDGER#ux-writing-drift-in-production · ⛔ LEDGER#header-account-spacing |

## Applied-from log

Where a project's patterns have been reused. **This is the evidence a pattern travels** — a pattern applied twice is
a `[candidate-common]` worth promoting to `COMMON.md` (that's the ≥2 bar, met by *application*, not just by sighting).

| built | from | recorded in |
|---|---|---|
| 해외주식 의결권 투표 프로토타입 (2026-07-14) | 국내주식 권리 | `projects/domestic-stock-rights.md` → "Applied to:" |
