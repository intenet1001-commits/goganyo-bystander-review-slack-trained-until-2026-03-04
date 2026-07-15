---
name: csdesign
description: "Entry point for NH투자증권 design work. Domains come in three kinds: **guide** — `nds` (NH Design System: component keys, variants, tokens, per-category rules); **project** — one folder per shipped production project, currently `asset` (MTS screens: structure, interaction, flow), more to come; **website** — `nhsec-production` (nhsec.com) and `nhnamuh-production` (mynamuh.com: nav, colors). Routes any design request — learn, verify/재검토, or build/prototype — to the right domain(s), and pairs guide+project for builds. Use whenever a request mentions NH투자증권, 나무/namuh, nhsec.com, mynamuh.com, Figma, NDS, MTS 화면, or asks to learn/verify/build a screen or page. To learn EVERY page of a Figma file or audit its coverage, use `figma-learn-all-pages` first — it enumerates, this one routes."
risk: safe
---

# csdesign

Single entry point for NH투자증권 design knowledge, organized as one topic/domain folder per category under this skill. Each domain folder owns one knowledge area and persists what it learns as per-project files under its own `projects/` folder.

## Domains

| Kind | Domain | Folder | Owns | Learns | Source type | Projects folder |
|---|---|---|---|---|---|---|
| **project** | Production assets | `asset/` | Real NH투자증권 production Figma projects — screen structure, interaction/behavior patterns, flow conventions | One shipped/production Figma file per project | Figma (`figma-use`) | `asset/projects/` |
| **guide** | NDS | `nds/` | NH Design System — library/component keys, variants, tokens, guide-file rules | One NDS guide/library Figma file per project | Figma (`figma-use`) | `nds/projects/` |
| **website** | nhsec.com (production) | `nhsec-production/` | NH투자증권 main website (`nhsec.com`) — nav/menu tree, color palette, layout conventions | One learned page/section per project | Live website (Chrome `use_browser`) | `nhsec-production/projects/` |
| **website** | namuh (production) | `nhnamuh-production/` | 나무/namuh sub-brand website (`mynamuh.com`) — nav/menu tree, color palette, layout conventions | One learned page/section per project | Live website (Chrome `use_browser`) | `nhnamuh-production/projects/` |

**Kinds — the routing rules below refer to KINDS, not folder names.**
- **guide** — reusable design-system rules + component facts. Grows by learning more guide files. Currently only `nds/`.
- **project** — ONE shipped project's deliverables. **Expect more project rows over time** — this is the row type that multiplies.
- **website** — live-site conventions, learned via a browser rather than Figma.

**Adding a domain** = one table row + the trigger keywords in this skill's `description` above (it's the only registered skill in the family, so the loader matches on it). **Nothing else** — the routing rules and `figma-learn-all-pages` name kinds, not folders, so they don't need touching. A new **project** folder should be named after its project (`asset/` predates this convention; its name is historical, its kind is what counts).

**Four distinct visual identities exist under one company** — don't conflate them: the NDS/MTS app is green (`#84C13D`), nhsec.com is blue (`#1171D2`/`#1692E8`), namuh is teal (`#00A5BD`/`#0A808C`). When a request doesn't clearly say which property it targets, ask rather than assuming one skin fits all.

## Routing

0. **Is it "learn ALL pages of this Figma file" (or a coverage audit of one)?** — e.g. a bare Figma URL + 학습/learn, "모든 페이지", "다 학습해", "다 학습된 거 맞아?", "빠진 페이지 없어?" → **invoke the `figma-learn-all-pages` skill first**, then come back here for domain routing (step 1) and follow that domain's Mode 1 per content page.

   That skill owns page **enumeration and coverage integrity**, which this file does not: a Figma file's page list cannot be obtained from `get_metadata` (returns 1 page) or from the file's own table of contents (drifts, omits pages) — only from `use_figma` → `figma.root.children`. Certifying coverage any other way has already produced a wrong "complete" claim in this repo. A single-page/single-section learn doesn't need it; anything claiming "all" does.

1. **Identify the domain(s) the request touches.**
   - Mentions a specific NH product/feature screen, a shipped file, or "이 프로젝트 학습해" with a production-flow Figma link → a **project-kind** domain. **Tiebreaker, in order:** (1) if the Figma `fileKey` is already registered in a project domain's `LEADER.md`, that domain wins outright; (2) else pick the row whose **Owns** scope names the product/feature; (3) else — including any brand-new project — **ask** whether it belongs to an existing project domain or needs a new folder. **Never default silently to `asset/`** just because it is the oldest project row.
   - Mentions NDS, a design-system/guide/library file (e.g. "NDS_UX Guide"), component specs, tokens, or "이 NDS 프로젝트 학습해" → `nds/`.
   - Mentions `nhsec.com` or NH's main website (menu/nav/color learning, not Figma) → `nhsec-production/`.
   - Mentions `mynamuh.com`/나무/namuh's website (menu/nav/color learning, not Figma) → `nhnamuh-production/`.
   - Asks to **re-check, verify, or re-review** an already-learned project ("이거 제대로 학습된 거 맞는지 봐줘", "다시 검토해줘", "재검토", "검증해줘") → same domain as the project being checked; use that domain's **Mode 3 (VERIFY)**, not Mode 1.
   - Asks to build/prototype a new screen → almost always **both** the **guide-kind** domain (`nds/` — component/token baseline) **and the matching project-kind domain** (closest-matching learned flow; pick it with the project-kind tiebreaker above), for MTS-app work. For website work, the matching website-kind domain alone usually suffices.
   - Names a domain that doesn't exist yet → say so, propose creating a new `<domain>/LEADER.md` following the same LEARN/VERIFY/BUILD three-mode pattern (see any existing domain's `LEADER.md` as the template — Figma-based domains use `figma-use`, website domains use a browser tool per `nhsec-production/LEADER.md`'s Tooling note), and update the Domains table (and this skill's `description`) once created.
2. **Read the matched domain's `LEADER.md`** directly (plain file read — these are reference files, not separate skills) and follow its Mode 1 (LEARN), Mode 2 (BUILD), or Mode 3 (VERIFY) instructions.
3. **For BUILD requests pairing a guide domain with a project domain** — read in this order:
   1. **`nds/CORE.md`** (always-on component/token baseline), then **`nds/INDEX.md`** to find the topic's note, then that note. Read `nds/LEDGER.md` only when INDEX flags the topic ⚠/⛔ — **⛔ means the guide cannot be satisfied with the current library; escalate rather than fake it.** (Do **not** read `nds/sources/*.md` — that's LEARN forensics.)
   2. Then the **matching project-kind** domain's `LEADER.md` + its project note (flow/interaction baseline).
   3. Then build.

   **⭐ Precedence — this is the canonical wording; project-kind LEADERs restate it in one line and point here:**
   **Component facts come from the guide domain. Screen structure and behaviour come from the project domain. If they conflict, the more specific note wins — project-level shipped-production beats the generic guide.**

   **⛔ Precedence does NOT apply to these — escalate instead of picking a winner:**
   - **The guide reports an unresolved collision with itself.** Two really-existing components sharing one name is **not** a conflict of claims — precedence cannot tell you which key to import. If `nds/LEDGER.md` marks a component ⚠ CONTESTED, **do not pick the incumbent, the first-listed, or the most-corroborated one.** Those are plausible tiebreakers the knowledge base does not endorse. **Say the component is contested and ask.**
   - **Reliability claims (does this import actually work?) vs design claims (what should this look like?).** Precedence settles design. It does **not** settle whether an API call succeeds — a project note saying "it instanced fine in our file" and the guide saying "instancing throws" can **both be true** (file- or branch-specific). Re-test in the target file; don't adjudicate from notes.
   - **Both domains silent.** If neither states a value (a spacing, a duration, a trigger), **you do not have it.** Do not infer it from a mockup. Escalate — the guide domain's Gotcha 6 documents that this system's time/interaction rules are systematically blank.
4. **Don't duplicate a domain's stored knowledge here.** This file stays thin — routing table + dispatch logic only. Domain facts live in each domain's own `LEADER.md` and `projects/` files.
