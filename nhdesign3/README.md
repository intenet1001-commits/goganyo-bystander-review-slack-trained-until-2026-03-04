# nhdesign3 — Supabase-backed NDS design knowledge store & build pipeline

An agent skill that learns NH투자증권's **NDS design system** from Figma into queryable
Postgres (Supabase), then drives **BUILD** sessions that aim to produce screens
indistinguishable from the work of NH's human designers ("vibe parity").

This is the relational sibling of the file-based [`csdesign`](../csdesign/) skill — same
learn methodology (enumerate via `figma.root.children`, screenshot every rule-bearing frame,
transcribe verbatim, report N/M coverage honestly), different storage backend. It exists to
test whether Postgres beats markdown files at scale, and the answer so far is yes on
retrieval ergonomics: GIN-indexed bilingual keyword search + full-text fallback across 180+
pages of verbatim rules, no 36k-token file-read ceiling.

## Contents

| Piece | What it is |
|---|---|
| [SKILL.md](SKILL.md) | The pipeline: LEARN / BUILD / VERIFY modes, storage rules, scope snapshot |
| [supabase/migrations/](supabase/migrations/) | Schema + applied repair scripts (documentation; applied via `db query -f`, never `db push`) |
| `nhdesign3_*` tables | Live store in Supabase project `portmanagement`: sources, pages, components, topics, ledger |

## Knowledge coverage

All six NDS guide files fully learned, plus shipped human deliverables and synthesis rules:

- **Guides**: NDS_UX Guide (28p) · NDS_M.web (30p) · NDS_CI (16p) · NDS_Templates (39p) ·
  NDS_Library (38p) · NDS_PPT Templates (2p)
- **Projects** (human-made, the "vibe" reference corpus): 공개매수청약 · 국내주식 권리 ·
  채권권리 행사 · 해외주식의결권 BUILD lessons
- **Websites**: mynamuh.com / nhsec production records
- **Synthesis**: vibe rubric, app-side token/font port, component-defect diagnostics, copy-tone rule

## Audit results (2026-07-17, 6-agent audit)

A six-auditor workflow (content depth, live-Figma accuracy, project-vibe coverage, pipeline
design review, blind build probe, prior-output review) measured the store and pipeline:

- **Storage accuracy is real**: 53/54 specific visual claims in stored pages verified against
  fresh Figma screenshots (the 1 miss: a single-character transcription typo, since fixed).
- **Blind reproduction probe**: an agent rebuilt a shipped 국내주식 권리 screen from the DB
  alone — copy accuracy ~9/10, layout structure ~9/10, overall fidelity 7.4/10. The deficit
  was concentrated in in-context visual surface (colors, chrome, density), which drove the
  repair passes below.
- **Verdicts**: storage/accuracy strong · content knowledge strong · visual surface weak
  (repaired) · pipeline design weak (rewritten) · prior output weak (root-caused).

## What was repaired after the audit

1. **Visual-surface knowledge**: ported csdesign's instance-sampled app-side tokens
   (#84C13D brand green, #333333 ink, NanumBarunGothic — *not* Pretendard, which is
   M.web-only), the 540px canvas rule, and component-defect diagnostics into the store;
   targeted Figma re-learning passes filled component-internal geometry, the shipped
   MASTER screens, and clipped variant sheets.
2. **Pipeline (BUILD Mode 2) rewritten**: mandatory vibe-rubric read, mandatory
   reference-first step (pick a named human screen before building), anti-invention
   escalation, and a two-part quality gate (rubric checklist + screenshot compare vs the
   named human reference).
3. **Operational lesson**: parallel agents must never call the supabase CLI concurrently
   (shared login-role credential race) — fan-outs use dump-then-read with serial SQL apply.

## Storage safety rules

The store lives in a shared Supabase project with unrelated migration history. All
reads/writes go through `supabase db query --linked` (inline or `-f file.sql`) from this
directory. **Never** `db push`, `db reset`, or `migration repair` here. Files under
`supabase/migrations/` are records of applied SQL, not a pending migration queue.
