# nds — designers' per-category guides

The **guide-kind** domain: reusable design-system rules + component facts, learned from NH's NDS Figma files.
Counterpart to the **project-kind** domains (`../asset` and future siblings), which own one shipped project's
deliverables each. A build pairs them: **nds says what the components are and what the rules say; the project
domain says how a real screen was actually assembled.**

## Read these, in this order — do not read this domain's history

| File | What it is | Read when |
|---|---|---|
| **`CORE.md`** | Always-on baseline. One row per component, **every** key sighted for it, full 40-hex. Build gotchas. | **BUILD step 1** — always |
| **`INDEX.md`** | topic → note. 103 topics / 119 notes, with ⚠/⛔ flags. | **BUILD step 2** — always |
| `projects/*.md` | one note per guide **page** — the actual rules, verbatim | BUILD step 3 — only the 1–2 INDEX points you at |
| **`LEDGER.md`** | contested / blocked / unresolved, + resolved history | BUILD **only when INDEX flags** ⚠/⛔ · VERIFY **always** |
| `sources/*.md` | per-Figma-file LEARN forensics + the 119 registry rows | LEARN/VERIFY of that file. **Never at build time.** |

> **Why this is split.** Until 2026-07-15 all of the above lived in this one file. At 3 Figma files learned it
> reached **~36,000 tokens — a single Read exceeded the cap**, so a BUILD pass physically could not read the file
> it was told to read first, and every new guide file made it worse. **Learning must compound, not collapse.**
> Now `CORE.md` grows with *distinct components* (sub-linear — a 4th file mostly **corroborates** existing rows),
> `INDEX.md` grows one line per note, `LEDGER.md` **shrinks as questions resolve**, and `sources/` is never read at
> build time. **BUILD's read cost is bounded no matter how much is learned.**

## Learned files

| Figma file | fileKey | Coverage | Forensics |
|---|---|---|---|
| NDS_UX Guide | `nEINCcmC7AVkWSqRkq60y1` | **18/18** content pages | `sources/nds-ux-guide.md` |
| NDS_M.web | `uVcmG6GgOl2J8EOlc22wob` | **20/20** | `sources/nds-mweb.md` |
| NDS_Templates | `1xE0qvn2yv3ZkQ9BwhKT1y` | **39/39** | `sources/nds-templates.md` |
| **NDS_Library** ⭐ | `72zrHgMLM4zhCjgSuTf7cC` | **42/42** content pages (of 51 total; 9 probed + skipped) | `sources/nds-library.md` |

All coverage measured against `figma.root.children` — see Mode 1.

> ⭐ **NDS_Library is the source of truth, not another opinion.** It is the file the `NDS_Library` libraryKey points
> at and that NDS_Templates subscribes to — the other three files **describe** or **consume** these components.
> Learning it (2026-07-16) resolved three standing LEDGER entries (`#radio-keys-never-sighted`,
> `#header-basic-keys` incl. the **root cause** of the `header_basic` breakage, `#tab-2depth-chip-source`),
> corroborated one ⛔ a fourth time (`#search-bar-states`), and **corrected `CORE.md`'s font claim**
> (labels/body are NanumBarunGothic, not Pretendard). **When this file and a guide/template disagree about what a
> component IS, this file wins.** (It does **not** win on what a screen should *do* — that is the project domains'.)
>
> ⚠️ **Triage by page name does NOT work in this file** — `sources/nds-library.md` documents it in full. Two
> underscore-padded "headers" hold real rules (`📖 Justify` = 119k chars; `🌈 Graphic asset` = the sizing rules),
> two identical-looking ones are genuinely empty, and the **blank-named last page** holds the `guide_parent` set and
> the library's ordering rationale. **Probe every page; a name-driven pass would have shipped "38/38" against a
> true 42.**

---

## Mode 2 — BUILD (start here; this is the common case)

Triggered when the user, or a project-kind domain's Mode 2, needs to build a screen/component/prototype.

1. **Read `CORE.md`.** Real componentKeys and variant names only — **never invent a component**.
2. **Read `INDEX.md`** and find the topic. **This hop is mandatory** — there are 119 notes; scanning them is not a
   plan. If a row is flagged **⚠/⛔, read that `LEDGER.md` anchor before building** — ⛔ means the guide **cannot be
   satisfied** with the current library, and you must escalate rather than fake it.
3. **Read the 1–2 notes INDEX names.** Those hold the verbatim rules.
4. Build/validate per `figma-use` / `figma-generate-design`.
5. **When paired with a project-kind domain**: component facts come from here; **screen structure/behaviour comes
   from the project note, and on conflict the project note (shipped production) wins.** Canonical wording:
   `csdesign/SKILL.md` routing step 3.

**Two standing hazards** (details in `CORE.md`): most keys are `unverified` — read off a live instance but never
round-tripped through `importComponentSetByKeyAsync`, because every session so far has been **read-only**, where
that call throws. And **time/interaction rules are systematically blank** across this design system — if you need a
duration, a trigger, or a dismissal rule, it is probably not in Figma. Escalate; don't infer it from a mockup.

## Mode 1 — LEARN (register a guide Figma file)

**Granularity: one note per content page.** (Project-kind domains use one note per *file* — that is their Mode 1's
call, not this one's.)

1. **Invoke the `figma-learn-all-pages` skill.** It owns enumeration and coverage integrity. **Coverage claims come
   from `use_figma` → `figma.root.children` and nothing else** — `get_metadata` with no nodeId returns only
   session-loaded pages (it reported **1 page** on a 28-page file), and a file's own table of contents drifts (the
   UX Guide's TOC omits `- Principles`, its foundational page; a TOC-driven audit shipped "17/17 complete" when the
   truth was 17/18). **Persist the enumeration as a manifest before learning anything** — it is the denominator.
   ⚠️ `p.children.length` is **unreliable for non-current pages** (Figma lazy-loads): 5 of 6 pages in one file
   falsely reported `children=0` or `=2` while holding hundreds of nodes. Sizes come from `get_metadata(nodeId)`.
2. Load `figma-use` before any Figma call.
3. Per page: `get_metadata(nodeId)` — **one call**. It overflows on large pages and is auto-saved; read the saved
   file with a **python line/indent parser**. **Not ElementTree** — the dump is non-strict XML (an unescaped `&`
   breaks it). **Never loop narrower requests.**
4. **Screenshot every rule-bearing frame.** **Layer names lie, and the convention is per-PAGE, not per-file** — one
   file produced all three outcomes: reliable, mixed (placeholder demo copy), and unreliable (5 TEXT nodes named
   after a *different page*; four section titles all named `\x08title`). **Rules also live inside pasted screenshot
   images** that no text extraction reaches. Confirm the convention per page and report it.
5. **Quote verbatim. Blank at source IS the finding** — escalate, never invent.
6. Write `projects/<kebab>.md` with frontmatter `name`, `fileKey`, `source_url`, `learned_date`,
   `sections_studied`, `status`.
7. **Register — learning without registering is a no-op.** Add the row to `sources/<file>.md`, a line to
   `INDEX.md`, any new component to `CORE.md`, any new conflict to `LEDGER.md`. **When the Figma file is new to this
   domain, also add a row to `## Learned files` above** (fileKey, `N/N` coverage, its `sources/` path) — that table is
   the domain's file-level manifest and nothing else updates it. **A note nothing links to does not exist**: on
   2026-07-15, 17 notes existed and 3 were registered — the other 14 were unreachable to every consumer.
8. **Report componentKey KIND.** A COMPONENT_SET and each of its variant COMPONENTs carry **different keys**;
   `importComponentSetByKeyAsync` needs the **SET** key. Confusing them manufactured a phantom "conflict" — see
   `LEDGER#header-basic-keys`. Also **confirm the node is even an INSTANCE**: the same name can be a remote instance
   on one page and a keyless local FRAME on another.
9. **Keys are full 40-hex or absent.** An ellipsis is invalid — six keys sat unusable until 2026-07-15.
10. **Classify components into three tiers** before trusting a key: published library component (`remote: true`) ·
    page-local documentation re-creation (name matches, key and structure don't) · unpublished export scaffolding.
    *"Key differs from Core" is not a finding — the classification is.*

**Promotion bar: this domain has none, deliberately.** NDS is a single canonical library, so **one confirmed
observation from the real subscribed file is authoritative** — there is no second implementation to cross-check
against. (`../asset` requires ≥2 projects, because it covers independently-built screens that may each do things
their own way. The difference is intentional, not an inconsistency.)

**The orchestrator writes `CORE.md` / `INDEX.md` / `LEDGER.md` / `sources/*.md` single-threaded.** Subagents return
rows as text and **never edit them** — that discipline stopped a Core corruption on 2026-07-15, when five agents
independently reported "key differs from Core" and none turned out to be promotable.

## Mode 3 — VERIFY (re-check a learned file against source)

1. **Read `LEDGER.md` first — it is the worklist.**
2. Read the existing note(s) in full: those are the claims to check, not a blank slate.
3. **Re-run enumeration (Mode 1 step 1) regardless** — a page may have been added since.
4. **Prioritise claims naming a literal string, count, or key.** Those drift, or were mistranscribed. Structural
   claims are comparatively stable — spot-check with 1–2 screenshots rather than re-verifying exhaustively.
5. **Hunt for the designer's own annotation text.** Frequently the highest-value find of a pass.
6. **Update in place, never by silent overwrite.** Stamp every change `corrected <date>` / `added <date>` citing
   old → new, and bump `reviewed_date`. A verified-clean pass still gets a stamp — a stale date must not read as
   "never checked".
7. 🔴 **File every cross-file conflict into `LEDGER.md`.** Splitting the registry into `sources/*.md` removed the
   single cross-file table that used to surface conflicts by accident (that is how the Search Bar and `header_basic`
   contradictions were found). **If you note a contradiction only in a project file, it is lost.** This is the
   known weak point of the split — it depends on discipline, not structure.

## Session note

`whoami` shows multiple plans on this account. For NH-internal work the right org is usually **NHIS Digital
Platform** (`organization::1445250327526291914`), not the personal `chunsung's team` plan.
