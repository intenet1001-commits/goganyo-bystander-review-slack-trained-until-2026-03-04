---
name: nds-lib-emoji-nmoji-infographic-archive
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=71611-7011"
learned_date: 2026-07-16
sections_studied:
  - "71611:7011 (page '    - Emoji & Nmoji / Infographic Archive' — canvas root; ~190 top-level nodes, NO nesting beyond 2 levels, NO title frame, NO section headings. get_metadata returned the whole page inline without overflowing — the smallest page in this batch)"
  - "74675:324 … 74675:472 (the nds_nmoji01–nds_nmoji150 instance grid, 40×40 each, ~7 rows at y=459–1,144 — the page's main inventory)"
  - "71572:2698 / 71572:2699 / 71572:2700 (symbols nds_infographic181/182/183, 80×80)"
  - "72500:3591 / 72500:3600 / 72500:3605 / 72500:3618 / 82058:10439 / 82074:11689 (frames nds_infographic185 / 169 / 57 / 58 / 247 / 248 — each a slice + an 'object' child)"
  - "71611:7012 (text '1위 깃발' — the ONLY caption on the entire page)"
status: "superseded (nmoji grid) / unknown (scratch cluster) — RESOLVED after this note was first written, by comparison against the live `    - Emoji & Nmoji` page (15422:15275, `nds-lib-emoji-nmoji.md`). The live page runs nds_nmoji01–153 and shares this page's EXACT nds_nmoji42 gap — same lineage, live is 3 assets ahead. So this page's grid is an older snapshot of the live set, NOT a rival. The scratch cluster (battery exploration, screenshots filename-dated 2026-02-27/03-04) is recent and remains unknown. No on-canvas deprecation marker exists on this page — the verdict rests on the cross-page comparison. See 'Status verdict'."
---

# NDS_Library — "    - Emoji & Nmoji / Infographic Archive" page

## 🔴 CORRECTION + negative answers to three sibling-batch questions (verified via `use_figma`)

### I said the grid was "full-colour and undimmed". Three assets are ghosted at opacity 0.10.

| Node | Name | Opacity |
|---|---|---|
| `74675:372` | **`nds_nmoji57`** | **0.10** |
| `74675:469` | **`nds_nmoji146`** | **0.10** |
| `74675:470` | **`nds_nmoji147`** | **0.10** |

**Three INSTANCEs, individually ghosted to 10% — inside an otherwise full-opacity grid of ~150.** My original
note stated the grid was undimmed; I based that on a page-zoom screenshot where each glyph renders at ~40px, and
I explicitly conceded it was "partially verified only". **It was wrong.** At 0.10 these read as faint ghosts —
visible in hindsight in the bottom row of my screenshot, but not something I could have called reliably at that
scale. **Only `node.opacity` surfaces this.**

**Same convention as the Illusts Archive** (see `nds-lib-illusts-archive.md`, where 65 components sit at 0.10) —
so the 0.10 ghost is a **file-wide marking convention**, seen now on two independent pages. **Its meaning is
still unstated on either page.** Not guessing. `struckCount` was **0** here; 4 `Rectangle`s sit at 0.70 (the
infographic-247 backing plates — styling, not signal).

### Negative answers — verified, and negatives are the useful part here

The sibling batch asked whether this page explains the emoji naming split or homes the missing assets.
**It does none of these, and I checked rather than assumed:**

| Question | Answer |
|---|---|
| Does this page explain `nds_emoji/Smileys & Face/…` vs flat `nds_emoji_<hex>`? | **No — there are ZERO `nds_emoji` nodes of any kind on this page.** Searched all 1,400 nodes. It holds only `nds_nmoji*` and `nds_infographic*`. **This page cannot adjudicate the emoji-naming question.** |
| Does it home the missing **`nds_nmoji42`**? | **No.** Absent here too — and its absence here is the *same gap* as the live page's (see RESOLVED below). |
| Does it home the missing **`nds_infographic233`**? | **No.** Absent. |
| Does it hold the duplicated **`nds_infographic138`**? | **No.** Absent — this page's infographics are 57, 58, 151, 169, 181–183, 185, 247, 248 only. |

> **`nds_nmoji42` is not "missing from the live page" — it is missing from BOTH, identically.** That reframes it
> from a suspected extraction failure into an **inherited numbering gap** in the source lineage. Whatever `42`
> was, it was gone before this snapshot was taken. **No archive page in my batch homes it.**

---

## ⭐ RESOLVED — read this first (added after the original pass)

**When I first wrote this note the verdict was `unknown`, because the live rival page was outside my batch and
unread. It has since landed as `nds-lib-emoji-nmoji.md` (page `15422:15275`, status `live`), and it settles the
question.**

| | This archive page (`71611:7011`) | Live `    - Emoji & Nmoji` (`15422:15275`) |
|---|---|---|
| nmoji range | `nds_nmoji01` … **`nds_nmoji150`** | `nds_nmoji01` … **`nds_nmoji153`** |
| Missing number | **`nds_nmoji42`** | **`nds_nmoji42`** |
| Node kind | INSTANCEs (consumers) | **COMPONENTs, `remote:false` (sources)** |
| Count | ~150 instances | 152 components / 243 total |

**The `nds_nmoji42` gap is identical on both pages.** That is a fingerprint, not a coincidence — a shared,
inherited numbering defect. **The two grids are the same lineage**, and the live page is **three assets ahead**
(`151`–`153`).

**This answers the exact test I proposed in the original note** ("does the live grid run to 150? if the live page
stops lower, this archive page is the *newer* one"). It runs to **153 > 150** — so **this page is the older
snapshot, and the archive label is accurate for the grid.** The live page holds the source COMPONENTs; this page
holds INSTANCEs of them. **This grid is not an older rival — it is a stale mirror. It contributes nothing the
live page lacks, and must not be promoted.**

**What is NOT resolved:** the **scratch cluster** (the battery-glyph exploration, the CPU photos, dated
2026-02-27 / 2026-03-04) is *recent* and is **not** part of the live page's inventory. Its status stays
`unknown`. The recency evidence below stands — it was never evidence about the grid; it was always evidence
about the scratch cluster, and the split verdict is the accurate one.

> **The reasoning below is preserved as written**, including the recency argument. It reached `unknown` on the
> evidence available at the time, and `unknown` was the correct call *then* — the comparison that resolved it
> required a page I did not have. **Recording that the honest-uncertainty verdict was right and got upgraded by
> evidence, not by guessing, is the point.**

---

## Status verdict (as originally written) — `unknown`, but for the opposite reason to the other archive pages

**No deprecation marker exists on this page.** Searched the full page dump (which returned **inline, without
overflowing** — this page is small) and the page screenshot for: `구버전`, `이전`, `미사용`, `deprecated`, `old`,
`백업`, `폐기`, `중단`, `사용금지`, `임시`, `보류`, `제외`, `해당없음`, `👿`, strikethrough, greyed-out overlays, and
`→ 이동` pointers. **Zero hits — not even a false positive.** The page name "Archive" is a hint, not evidence, and
is **not** being used to infer deprecation.

### The freshness evidence points *away* from "archived" — and that is a finding, not a verdict

Unlike its sibling archive pages, this one carries **no `Last update` stamp**. But it does carry something the
others don't: **pasted screenshots whose filenames are recently dated.**

| Node | Verbatim name | Implied date |
|---|---|---|
| `72500:3628` | `스크린샷 2026-03-04 오후 3.35.07 1` | **2026-03-04** |
| `72500:3634` | `스크린샷 2026-02-27 오후 2.29.21 1` | **2026-02-27** |
| `72500:3635` | `스크린샷 2026-02-27 오후 2.31.02 1` | **2026-02-27** |
| `72500:3636` | `스크린샷 2026-02-27 오후 2.30.59 1` | **2026-02-27** |

Today is **2026-07-16**. **Someone was pasting reference material onto this "Archive" page roughly four months
ago.** For comparison, its siblings' newest timestamps are 2022.10.18 / 2022.10.21 (`Last update` stamps) and
2024-01-29 (a pasted-screenshot filename on the Illusts Archive). **This page is, by a wide margin, the most
recently touched page in my batch.**

**Why this still is not a `live` verdict.** The method's rule cuts both ways: just as the name "Archive" is not
evidence of death, a recent edit is not evidence of sanctioned currency. What the dates establish is narrower and
worth stating precisely:

- ✅ **"This page is a dead archive nobody has touched in years" is contradicted by evidence.** It is an
  *actively-used working canvas*.
- ❌ **"Its contents are approved, current spec" does not follow.** Active ≠ approved. The page has **no title
  frame, no section headings, no usage rules, and no captions** (one exception, below) — it has **none of the
  spec-page furniture** that `Icon` / `Flag` / `Search Bar` / `Icon Usage` all have. Structurally it is a
  **scratchpad**, and scratchpads are where unapproved work lives.
- Filename dates are also **weak evidence** — they record when a screenshot was *taken*, not when it was pasted.
  Strong enough to raise doubt about "archived"; not strong enough to establish anything positive.

**Honest verdict: `unknown`.** Not "unknown because I found nothing" (the Illusts case) but **"unknown because
the evidence conflicts"**: the page name says archived, the timestamps say active, the structure says scratchpad,
and nothing says approved.

**Consequence for BUILD: nothing on this page may be promoted to `CORE.md` or used in a build.** The `unknown`
rule applies unchanged. **If anything, the recency makes this page *more* dangerous, not less** — a BUILD pass
might mistake fresh-looking work for sanctioned work. The `nds_nmoji01`–`150` grid in particular looks like a
complete, promotable inventory and **is not** (see Conflicts — a live `    - Emoji & Nmoji` page exists).

## Layer-name convention on THIS page — reliable, and unusually so

**The convention is per-page, and this page's is the strictest in my batch — it is essentially all names.**

- **`nds_nmoji<NN>`** — instances, 40×40, numbered `nds_nmoji01` … `nds_nmoji150`. Zero-padded to 2 digits below
  10 (`nds_nmoji01`…`nds_nmoji09`), unpadded above (`nds_nmoji10`…`nds_nmoji150`).
- **`nds_infographic<NN>`** — symbols and frames, 80×80, numbered `nds_infographic57`, `58`, `151`, `169`,
  `181`–`183`, `185`, `247`, `248`.
- **Nested frames** consistently follow `slice` + `object`: e.g. `nds_infographic185` (`72500:3591`) contains
  slice `nds_infographic185` (`72500:3592`) + frame `object` (`72500:3593`). Same for `169`, `57`, `58`, `247`,
  `248`, and `nds_nmoji141` (`72500:3641`).
- **Names are reliable *as identifiers* — and useless *as documentation*.** `nds_nmoji87` tells you the asset's
  id and nothing about what it depicts. **There are no captions on this page** save one (below), so the
  emoji↔meaning mapping that would make this inventory usable **does not exist here**. That is a blank at
  source, and per the method the blank IS the finding — I have not invented meanings from the artwork.
- **The exceptions, verbatim**: text `1위 깃발` ("1st-place flag", `71611:7012`) — the page's **only** caption,
  labelling `nds_nmoji143`/`144`/`145`; text `🔋` (`72500:3627`) — a bare emoji as a layer name; and the raster
  imports `battery_1f50b (1)`–`(4) 1` (`72500:3629`–`3633`) — **`1f50b` is the Unicode codepoint for 🔋**,
  i.e. these are named after an external emoji source, not an NDS asset.

## What's actually on the page (inventory only — status `unknown`, not for BUILD)

**Structurally this page is unlike every other in my batch: it has no frames wrapping anything.** ~190 nodes sit
loose on the canvas, nesting no deeper than 2 levels. There is **no title bar, no `Last update`, no section
divider, no usage text.**

### 1. The `nds_nmoji` grid (y ≈ 459–1,144) — the page's main content

~150 instances, `nds_nmoji01` → `nds_nmoji150`, 40×40, laid out ~19 per row across 7 rows (x ≈ -170 → 1,399).
Screenshotted: full-colour emoji-style glyphs — piggy bank, bar/line charts, coins, `₩`/`$` currency marks, a
`NH` badge, shield, lock, bell, cart, rocket, seedling, trophy, gift, clock, umbrella, magnifier, gauges,
Korean-flag taegeuk, gold bars, etc. **The layer names carry no subject information, and the page carries no
caption grid** — so I am **not** transcribing an emoji↔meaning table. It does not exist at source.

Gaps in the numbering are visible in the metadata and are real, not read errors: **`nds_nmoji42` is absent**
(the grid runs `nds_nmoji41` → `nds_nmoji43`). `nds_nmoji128` appears **twice** — once as `72500:3646` (a
straggler at x=691, y=-70, up in the scratch cluster) and once as `74675:451` (in the grid proper at x=310,
y=1,011). Recorded as found; not reconciled.

### 2. The scratch cluster (y ≈ -102 → 335) — a mid-session working area

This is where the recent activity is:

- **`1위 깃발`** (`71611:7012`) + `nds_nmoji143` / `nds_nmoji144` / `nds_nmoji145` — 1st/2nd/3rd place ribbon
  badges (gold/silver/bronze in the screenshot), and the page's only labelled group.
- **`nds_infographic181` / `182` / `183`** (`71572:2698`–`2700`) — 80×80 symbols.
- **`nds_infographic57` / `58` / `169` / `185` / `247` / `248`** — 80×80 frames, each slice + `object`.
- **`nds_infographic151`** (`72500:3637`), **`nds_nmoji141`** (`72500:3641`), **`nds_nmoji128`** (`72500:3646`),
  and a loose frame `object` (`72500:3638`).
- **A battery-icon design exploration in progress** — text `🔋` (`72500:3627`); raster imports
  `battery_1f50b 1`, `battery_1f50b (1) 1` … `battery_1f50b (4) 1` (`72500:3629`–`3633`), 54×54 and 29×29,
  arranged in a comparison grid; and `스크린샷 2026-03-04 오후 3.35.07 1` (`72500:3628`, 83×80) beside them.
  **Read plainly: someone was comparing candidate battery glyphs on 2026-03-04.**
- **Three pasted CPU/circuit-board photographs** — `스크린샷 2026-02-27 오후 2.29.21 1` (154×108),
  `…2.31.02 1` (224×136), `…2.30.59 1` (236×144) (`72500:3634`–`3636`). Screenshotted: stock photos of a CPU die
  held in a gloved hand, a circuit board, and a "CHARGING" battery graphic. **Reference imagery for an
  infographic in progress — not spec.**

## Conflicts for LEDGER

### 1. Recency contradicts the "Archive" label — **⚠ CONTESTED, and it generalises**

> **`nds-lib-emoji-nmoji-infographic-archive` (NDS_Library `71611:7011`) carries pasted screenshots filename-dated
> 2026-02-27 and 2026-03-04 — ~4 months before the 2026-07-16 learn date — making it the most recently touched
> page in the Archive group.** It has no `Last update` stamp, no title frame, no headings and no usage rules; it
> is structurally a **scratchpad**, not a spec page.
>
> **This is the third independent instance of the same pattern in this file**, and the pattern is now the
> finding:
> - `Search bar Archive` (`10:1347`) hosts a `테스트중` keypad WIP area + a `확장 활용안` proposal marked `사용시 문의요망`
> - `Illusts Archive` (`46732:1202`) hosts a `디자인작업용 🎨 컴포넌트` pension-screen working area
> - `Emoji & Nmoji / Infographic Archive` (`71611:7011`) hosts an in-progress battery-glyph exploration dated 2026-03
>
> **In NDS_Library, "Archive" does not mean "retired". It means "the page we park things on."** Consequence:
> **the Archive-group page names predict neither status nor subject matter**, and an Archive page may hold work
> newer than the live pages. Any future pass that triages this file's Archive group by name — in *either*
> direction — will be wrong. This extends `sources/nds-library.md`'s existing "probe every page, never skip on
> the name alone" warning from *page enumeration* to *status inference*.

### 2. Live rivals exist for BOTH halves of this page's subject — **unresolved, and I could not test it**

> This page covers **Emoji & Nmoji** *and* **Infographic**. **Both have live pages in the same file**:
> `    - Emoji & Nmoji` (`15422:15275`) and `    - Infographic` (`19888:18193`). **Both are outside my batch and
> neither was read**, so I cannot say whether this page holds an older rival, a newer draft, or an overflow
> spillover of either.
>
> **The recency evidence makes "older rival" the *least* likely of the three** — a 2026-03 edit is hard to
> reconcile with "superseded long ago" — which is exactly why this must not be assumed either way.
> **Concrete test for whoever holds those two pages:** does the live `    - Emoji & Nmoji` page's `nds_nmoji`
> grid run to **150**? This page's does (`nds_nmoji01`–`nds_nmoji150`, with `42` missing). If the live page stops
> lower, **this archive page is the *newer* one** and the "archive" label is actively misleading. Also check
> whether the live page has the **caption grid this page lacks**.

### 3. `nds_nmoji42` missing; `nds_nmoji128` duplicated — inventory integrity, not a conflict

> The `nds_nmoji` grid on `71611:7011` runs `01`–`150` but **skips `42`** (`nds_nmoji41` → `nds_nmoji43`), and
> **`nds_nmoji128` appears twice** (`72500:3646` in the scratch cluster, `74675:451` in the grid). Filed as an
> inventory-integrity note so a future pass does not read the gap as a failed extraction. **Whether `42` is
> retired, renumbered, or never existed is not determinable from this page** — there is no caption grid to check
> it against.

## CORE — componentKeys found

**None captured — deliberately.** `get_metadata` + `get_screenshot` only; no `get_design_context` /
`importComponentSetByKeyAsync` calls were made, so no 40-hex key was read.

**This is the page where that restraint matters most, and the reason is worth stating.** The `nds_nmoji01`–`150`
grid is a clean, complete-looking, ~150-asset inventory of genuine INSTANCEs — **the most promotable-looking
content in my whole batch.** It is exactly the thing a BUILD pass would want keys for. **It is also `unknown`,
sitting on a page whose live rival (`    - Emoji & Nmoji`, `15422:15275`) was never read.** Harvesting 150 keys
here would produce a large, authoritative-looking table that might be **the wrong generation entirely** — and its
size would lend it false weight. **Per the method: `unknown` status ⇒ no promotion, so no keys.** The correct next
move is not key extraction but the cheap comparison against `15422:15275` described in Conflicts #2.

**Confirmed for the record:** the `nds_nmoji*` nodes **are** true `<instance>` elements in the dump (not frames or
raster), so keys *would* be obtainable — the omission is a decision, not a failure. The `nds_infographic*` nodes
are a **mix** of `<symbol>` (`71572:2698`–`2700`, `72500:3637`) and `<frame>` (`72500:3591`, `:3600`, `:3605`,
`:3618`, `82058:10439`, `82074:11689`) — so any future extraction here **must not assume a uniform node type**,
and must label SET key vs variant COMPONENT key per node.

## Gaps / unverifiable

- **The decisive comparisons were not run** — `    - Emoji & Nmoji` (`15422:15275`) and `    - Infographic`
  (`19888:18193`) are live pages in this same file, both outside my batch. See Conflicts #2 for the exact test.
- **The `nds_nmoji` artwork was inspected only at page zoom.** My page screenshot renders each glyph at ~40px,
  enough to see they are full-colour and undimmed, **not** enough to rule out subtle per-asset dimming or a
  strikethrough on an individual glyph. **No opacity data is present in the metadata dump**, so my "no dimming"
  statement for this grid is **partially verified only**.
- **`nds_infographic` numbering is sparse and unexplained** — 57, 58, 151, 169, 181–183, 185, 247, 248 present;
  everything else absent. Whether the missing numbers live on the live `    - Infographic` page is untested.
- **The four pasted screenshots were read only via the page-level screenshot**, not individually zoomed. I read
  them as reference imagery (CPU photos, battery glyph candidates); per the "rules live inside pasted screenshot
  images" warning, **that reading is not certain**. `스크린샷 2026-02-27 오후 2.31.02 1` (224×136) is the largest.
- **No frame was flagged `hidden="true"`** in the dump, so the blank-1×1 caveat did not apply — not re-confirmed
  node-by-node.
- **The `object` frame at `72500:3638`** (36.9×26.2, loose at x=702, y=54) has no parent infographic — an orphan
  slice child. Unexplained.
