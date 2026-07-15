---
name: figma-learn-all-pages
description: Use when given a Figma file URL and asked to learn, study, 학습, or document it — especially "all pages", "모든 페이지", "다 학습해", "전체 학습". Also use when auditing or claiming coverage of an already-learned Figma file ("다 학습된 거 맞아?", "빠진 페이지 없어?"), or when a coverage count needs verifying.
risk: safe
---

# Learning every page of a Figma file

## Overview

A Figma file's page list is not what the obvious tools report. Learning "all pages" fails at **enumeration** long before it fails at comprehension — you confidently learn 17 pages of an 18-page file and report 100%.

**Core principle: coverage claims require `figma.root.children`. Nothing else counts.**

## The Iron Law

```
NEVER certify coverage from get_metadata's page list or from a file's own table of contents.
```

Both are wrong in ways that fail *silently* — they return a plausible, tidy, incomplete answer. Verified on the NDS_UX Guide (`nEINCcmC7AVkWSqRkq60y1`), 2026-07-15:

| Method | Reported | Truth |
|---|---|---|
| `get_metadata` (no `nodeId`) | **1 page** | 28 |
| The file's own Welcome/TOC index | **17 topics** | 18 content pages |
| `figma.root.children` | **28 pages** | ✅ 28 |

The TOC omitted `- Principles` — the *foundational* page every other guide depends on. A TOC-driven audit shipped "17/17 complete." It was 17/18.

**Why they fail:** `get_metadata` reports only pages loaded in the desktop session. A TOC is hand-maintained documentation — it drifts, and nobody updates it when a page is added.

## Step 1: Enumerate (always first, never skipped)

Load `figma-use` first (mandatory before any `use_figma` call), then:

```js
// use_figma — the ONLY authoritative page enumeration
return figma.root.children.map((p,i) => `${i+1}. ${p.id} | ${p.name}`).join("\n");
```

**Persist this list verbatim as the work manifest** before learning anything. It is the denominator of every later coverage claim, and a future session that re-derives it the obvious way will silently see fewer pages.

### Triage the list

Files organize pages with non-content entries. Classify every page before starting:

| Kind | Typical name | Action |
|---|---|---|
| Content | `    - 색상 명도대비` (indent + `- ` prefix) | **Learn** |
| Section header | `🎨 Accessibility 접근성` | Skip — but probe one cheaply to confirm it's empty |
| Separator | `------`, `----------` | Skip |
| Welcome / cover | `👋 Welcome_____` | Skip (but read its TOC — useful for *grouping*, never for coverage) |

Naming conventions vary per file. Derive the pattern from the actual list; don't assume `- ` prefixes exist. **Never skip a page because a TOC omitted it** — that's the exact failure this skill exists to prevent.

## Step 2: Learn each content page

Fan out — one `use_figma`/read per page, issued **in parallel in a single message**. Never loop `setCurrentPageAsync` inside one script.

For each page:

1. `get_metadata(nodeId)` → frame tree, cheap, reveals structure.
2. **`get_screenshot` every frame that carries rules.** Not optional — see below.
3. **Write notes at the granularity the DOMAIN's Mode 1 specifies** — not a fixed rule of this skill. **guide-kind** domains → one note per page (`nds/` has 77). **project-kind** domains → **one project note covering all pages** (`asset/`'s single note covers 6 pages / 26 screens — its pages are steps of one flow, not independent categories). **Fan out reads per page regardless; only the write granularity differs.** Write as you go, not batched at the end.

### Layer names lie — screenshot or you learn nothing

Two independent, verified failure modes:

- **Frame layer names ≠ on-canvas section numbers.** Confirmed on *every* page of the NDS_UX Guide. The frame named `02` displays heading `01`. Two different frames were both named `13`. A frame named `5.` exists; `5` doesn't. **Node ID is the only stable handle.**
- **TEXT node names can be pure placeholder.** On the Principles page, *every* text node is named `6개월간 4500시간 단축` — unrelated to its content. A metadata-only read of that page yields literally nothing true.

Rules also live **inside pasted screenshot images** (nodes named like `스크린샷 2026-01-12 오후 2.47.50 1`). No text extraction reaches those. Transcribe them at learn time or the notes have silent holes.

**Quote copy verbatim. Never paraphrase.** Approximated rule text is a future correction waiting to happen.

Decide before starting: are you transcribing screenshot-embedded rules? Answer yes. Discovering this midway means re-doing pages.

### Hidden frames

`hidden="true"` frames render as a blank 1×1 PNG. Their text-node names may look like high-value rules — **do not quote them as rules**. Record them as unverified with a note to unhide and re-check.

## Step 3: Register — learning without registering is a no-op

**This is the step that gets skipped.** On 2026-07-15, 17 project files existed and 3 were registered. The other 14 were invisible to every consumer. The learning was real; the knowledge was unreachable.

After writing notes files:

1. Add the entry to **the domain's registry — wherever its Mode 1 step 7 says that is.** For `csdesign`'s split domains (`nds/`, `asset/`) that is **`INDEX.md`**, not `LEADER.md`; for its single-file domains it is `LEADER.md` → "Registered projects". **Check; don't assume.**
2. State coverage as **N/N against the `figma.root.children` denominator**, not against a TOC.
3. Promote cross-cutting findings (a decoded variant axis, a corrected token) into the domain's always-on reference section, not just the per-page file.

A notes file that nothing links to does not exist. **Registry sync is part of learning, not a follow-up.**

### Record per page

| Field | Why |
|---|---|
| `nodeId` + page name | Re-open without re-running discovery |
| Page's own `Last update` / Update History | Detect drift later; pages carry independent versions |
| Gaps found at source | Blank specs must be escalated, never invented |

## Step 4: Report honestly

- Coverage as `N/M content pages`, with the method named (`figma.root.children`).
- Pages skipped **and why** (separator/header/empty).
- Anything unverifiable (hidden frames) called out, not quietly omitted.
- Specs blank at the source reported as blank. If a guide literally says `논의` ("under discussion") or leaves a value empty, **that is the finding**. Do not fill it in.

## Red Flags — STOP

- "`get_metadata` returned the page list, that's the count" → It returns 1. Use `figma.root.children`.
- "The file's index lists the pages, I'll go by that" → It omitted the most important page. Enumerate.
- "The layer is named `02`, so it's section 02" → It displays `01`. Screenshot it.
- "The text node name shows the content" → Sometimes. On some pages, never. Screenshot it.
- "Metadata had no rules text, so the page is empty" → Rules live in screenshot images.
- "Files are written, done" → Not registered = not learned. Do Step 3.
- "17 of 17, complete" → Against *what* denominator? If it's a TOC, it's wrong.

## Common mistakes

| Mistake | Reality |
|---|---|
| Enumerating with `get_metadata` | Returns only session-loaded pages (often 1) |
| Trusting the file's TOC | Hand-maintained, drifts, omits pages |
| Batching notes to the end | Context runs out; earlier pages get thin |
| Assuming one-note-per-page | That's the **guide-kind** convention. Project-kind domains write ONE note per file. Read the domain's Mode 1. |
| Looping `setCurrentPageAsync` in one script | Reloads the file each time. Fan out in parallel instead |
| Paraphrasing rule copy | Verbatim or it's not evidence |
| Skipping registry sync | The single highest-impact failure — knowledge exists but is unreachable |
| Inventing a missing spec | Blank at source = escalate, don't guess |

## For csdesign work

This skill owns **enumeration, fan-out, and coverage integrity**. Domain-specific learning rules live elsewhere:

- **Route via `csdesign/SKILL.md`'s Domains table, by KIND — never by folder name.** A design-system guide/library file → the **guide-kind** domain. Production screens → the **matching project-kind** domain, chosen with that table's tiebreaker (fileKey already registered wins; else Owns-scope match; else **ask** — never default to the oldest project folder). More project folders are expected.
- Follow that domain's `LEADER.md` **Mode 1 (LEARN)** for note structure, frontmatter, **and write granularity** — the domain decides per-page vs per-file, not this skill.
- **Register per Step 3 — into whatever files that domain uses. `LEADER.md` is NOT always the registry.** Read the domain's **Mode 1 step 7** and do exactly what it says. Two shapes exist today:
  - **Split domains** (`nds/`, `asset/` — they accumulate): the registry is **not** in `LEADER.md`. A line goes to `INDEX.md`, cross-file/cross-project conflicts to `LEDGER.md`, and the always-on baseline (`CORE.md` for guide-kind, `COMMON.md` for project-kind) gets new components/patterns. `nds/` additionally files per-page rows into `sources/<file>.md`. **Writing to `LEADER.md` here registers nothing** — those sections no longer exist.
  - **Single-file domains** (the `website` pair — one site, one page, no accumulation): registry stays in `LEADER.md`.
  **Never assume from the folder name or from a sibling domain — a domain gets split the moment it grows, and the skill won't be updated in the same breath.**
- Re-checking an already-learned file is that domain's **Mode 3 (VERIFY)**, not a fresh learn — but re-run Step 1 regardless, since a page may have been added since.
