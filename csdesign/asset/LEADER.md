# asset — shipped projects' deliverables

A **project-kind** domain: real NH투자증권 Figma projects, learned so a new screen reads as *"designed by NH's own
team"* rather than generic AI output. **It holds MANY projects and is expected to keep growing.**

Counterpart to the **guide-kind** domain (`../nds`), which owns reusable design-system rules + component facts.
A build pairs them: **nds says what the components are and what the rules say; this domain says how a real screen
was actually assembled and shipped.**

## Read these, in this order — do not read this domain's history

| File | What it is | Read when |
|---|---|---|
| **`COMMON.md`** | Cross-project baseline — patterns confirmed across **≥2** projects | **BUILD step 1** — always |
| **`INDEX.md`** | screen/feature → project. **One line per project.** | **BUILD step 2** — always |
| `projects/*.md` | one **build-facing** note per project: anatomy, flow, components, takeaways | BUILD step 3 — the 1 INDEX points you at |
| **`LEDGER.md`** | contested / blocked / unresolved across projects | BUILD **only when INDEX flags** ⚠/⛔ · VERIFY **always** |
| `sources/*.md` | per-project LEARN/VERIFY forensics: page coverage, 디자인검수, 기획안 decks, page verdicts | LEARN/VERIFY of that project. **Never at build time.** |

> **Why this is split (2026-07-15).** The single project note had reached **62KB — 40% of a BUILD pass's entire read**,
> while only its anatomy sections were load-bearing; the rest was VERIFY forensics. The registry table put **~1,800
> characters in one cell per project**. Both curves are fatal once projects accumulate — `../nds` hit exactly this
> wall at ~36k tokens and became unreadable. **Learning must compound, not collapse.** Now `COMMON.md` grows only
> when a pattern clears the ≥2 bar (sub-linear), `INDEX.md` grows **one line per project**, `LEDGER.md` **shrinks as
> questions resolve**, and `sources/` is never read at build time. **BUILD's read cost stays bounded as projects
> multiply.** Structure mirrors `../nds` deliberately — same kind of problem, same shape of answer.

---

## Mode 2 — BUILD (start here; this is the common case)

Generate a new screen/prototype that matches how NH actually ships.

1. **Read `COMMON.md`.** Cross-project baseline — safe to assume anywhere.
2. **Read `INDEX.md`**, pick the closest project. **Closest ≠ same** — take the *pattern*, not the content. If a row
   is flagged **⚠/⛔, read that `LEDGER.md` anchor before building.** If nothing is close, **say so** and build from
   `COMMON.md` + `../nds` alone — **don't silently invent conventions**, and don't force a bad match.
3. **Read that project note.** Reuse its information architecture, interaction patterns, and component choices.
4. **Then the guide domain**: `../nds/CORE.md` → `../nds/INDEX.md` → the note it names. (Not `../nds/LEADER.md`, and
   never `../nds/sources/*`.)
5. Load `figma-use` / `figma-generate-design`. Validate with `get_screenshot` — check for clipped text and overlap.

> **Pairing contract — canonical wording lives in `csdesign/SKILL.md` routing step 3; sync on edit.**
> **Component facts come from `../nds`. Screen structure and behaviour come from this domain's project note. If they
> conflict, this note (shipped production) wins.** Restated here because a task may load this LEADER without
> `csdesign/SKILL.md`, and the pair would silently lose its rule.
>
> **⛔ Precedence does NOT apply — escalate instead of picking a winner:** when `../nds` reports an unresolved
> collision **with itself** (two real components sharing a name — precedence can't tell you which key to import);
> when the disagreement is a **reliability** claim ("does this import work?") rather than a design claim — both can
> be true, re-test in the target file; or when **both domains are silent** on a value. See `LEDGER.md`.

**Within this domain**: a project note beats `COMMON.md` — the specific, shipped case wins over the general pattern.

## Mode 1 — LEARN (register a project)

**Granularity: ONE note per Figma FILE**, not per page. A project's pages are steps/views of one feature whose
deliverable is one coherent note. (`../nds` uses one note per *page* — its pages are independent reusable rule
categories. The difference is intentional; each domain's Mode 1 decides, and `figma-learn-all-pages` defers to it.)

1. **Invoke the `figma-learn-all-pages` skill.** It owns enumeration and coverage integrity. **Coverage comes from
   `use_figma` → `figma.root.children` and nothing else.** ⚠️ `p.children.length` is **unreliable for non-current
   pages** (Figma lazy-loads): on this domain's first project, **5 of 6 pages falsely reported `children=0` or `=2`
   while holding hundreds of nodes** — including a design-review page full of numbered fix tickets that was nearly
   skipped as empty. Sizes come from `get_metadata(nodeId)`. Persist the enumeration as a manifest first.
2. Load `figma-use` before any Figma call.
3. **Screenshot every rule-bearing frame.** **Layer names lie, per-PAGE.** On this domain's first project the
   convention was *reliable* (node names == displayed copy, 10/10) — **the opposite of `../nds`'s UX Guide, where
   every TEXT node on one page was a placeholder.** **Confirm per page; never carry a verdict across files.**
4. **Hunt the designer's annotations and the prototype graph.** On the first project these were the highest-value
   finds and the first pass missed both: margin notes stating real rules (*"카드 view 항목 최대 6개"*, *"테이블 헤더
   sticky 되게"*) and **9 `trigger --> destination` edges** encoding the screen flow. Beware: ~48 more `-->` nodes
   were Figma boolean-op auto-names (`Vector --> Rectangle`) — geometric artifacts, not edges.
5. **Quote verbatim. Blank at source IS the finding** — escalate, never invent.
6. Write **`projects/<kebab-project-name>.md`** — build-facing only: screen inventory, anatomy, flow graph,
   annotations, component names, takeaways. Frontmatter: `name`, `fileKey`, `source_url`, `learned_date`,
   `screens_studied`, `status`. Put page coverage, design-review tickets, planning decks, page verdicts, and
   read-only gotchas in **`sources/<kebab>.md`**.
7. **Register — learning without registering is a no-op.** One line in `INDEX.md`; new conflicts to `LEDGER.md`.
   **A note nothing links to does not exist.**
8. **Promotion bar: ≥2 independently-learned projects.** A claim from one project stays in that note tagged
   `[candidate-common]`. **Do not promote a one-off to `COMMON.md`** — that turns one project's quirk into a fake
   rule. (`../nds` has no bar, deliberately: it's a single canonical library with no second implementation to
   disagree. The asymmetry is intentional.)
9. **Component names here are NOT key-checked.** Resolve real keys via `../nds/CORE.md`; if a name here has no key
   there, say so rather than inventing one.

**The orchestrator writes `COMMON.md` / `INDEX.md` / `LEDGER.md` / `sources/*.md` single-threaded.** Subagents return
rows as text and never edit them.

## Mode 3 — VERIFY (re-check a learned project against source)

1. **Read `LEDGER.md` first — it is the worklist.**
2. Read the existing note in full: those are the claims to check, not a blank slate.
3. **Re-run enumeration (Mode 1 step 1) regardless** — pages may have been added.
4. **Prioritise claims naming a literal string, count, or key.** The first VERIFY pass on this domain found the note
   claimed **"42 top-level frames"** when the truth was **77**, and that a takeaway ("two-button pattern reserved
   strictly for irreversible confirmations") was **too narrow** — a non-destructive filter sheet uses it too.
5. **Update in place, never by silent overwrite.** Stamp every change `corrected <date>` / `added <date>` citing
   old → new, and bump `reviewed_date`. A verified-clean pass still gets a stamp.
6. 🔴 **File cross-project conflicts into `LEDGER.md`.** With N projects, nothing else looks across them — a
   contradiction noted only in one project's note **is lost.**
