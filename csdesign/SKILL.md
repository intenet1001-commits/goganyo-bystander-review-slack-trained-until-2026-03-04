---
name: csdesign
description: "Entry point for NH투자증권 design work across topic domains — Figma-based `asset` (production MTS screens: structure, interaction, flow) and `nds` (NH Design System: component keys, variants, tokens), plus live-website domains `nhsec-production` (nhsec.com, main site) and `nhnamuh-production` (mynamuh.com, 나무/namuh sub-brand site: nav structure, color palette). Routes any design request — learn a new project, verify/re-check an already-learned project against source, or build/prototype a screen/page — to the right domain folder(s), and coordinates when a request needs more than one domain together. Use whenever a design request mentions NH투자증권, 나무/namuh, nhsec.com, mynamuh.com, Figma, NDS, MTS 화면, asks to learn/verify/재검토/build a screen or page, and doesn't already point at a specific project file."
risk: safe
---

# csdesign

Single entry point for NH투자증권 design knowledge, organized as one topic/domain folder per category under this skill. Each domain folder owns one knowledge area and persists what it learns as per-project files under its own `projects/` folder.

## Domains

| Domain | Folder | Owns | Learns | Source type | Projects folder |
|---|---|---|---|---|---|
| Production assets | `asset/` | Real NH투자증권 production Figma projects — screen structure, interaction/behavior patterns, flow conventions | One shipped/production Figma file per project | Figma (`figma-use`) | `asset/projects/` |
| NDS | `nds/` | NH Design System — library/component keys, variants, tokens, guide-file rules | One NDS guide/library Figma file per project | Figma (`figma-use`) | `nds/projects/` |
| nhsec.com (production) | `nhsec-production/` | NH투자증권 main website (`nhsec.com`) — nav/menu tree, color palette, layout conventions | One learned page/section per project | Live website (Chrome `use_browser`) | `nhsec-production/projects/` |
| namuh (production) | `nhnamuh-production/` | 나무/namuh sub-brand website (`mynamuh.com`) — nav/menu tree, color palette, layout conventions | One learned page/section per project | Live website (Chrome `use_browser`) | `nhnamuh-production/projects/` |

(Add a row here whenever a new domain folder is created, so routing stays accurate — and extend this skill's `description` above with the new domain's trigger keywords, since this is the only registered skill in the family.)

**Four distinct visual identities exist under one company** — don't conflate them: the NDS/MTS app is green (`#84C13D`), nhsec.com is blue (`#1171D2`/`#1692E8`), namuh is teal (`#00A5BD`/`#0A808C`). When a request doesn't clearly say which property it targets, ask rather than assuming one skin fits all.

## Routing

1. **Identify the domain(s) the request touches.**
   - Mentions a specific NH product/feature screen, a shipped file, or "이 프로젝트 학습해" with a production-flow Figma link → `asset/`.
   - Mentions NDS, a design-system/guide/library file (e.g. "NDS_UX Guide"), component specs, tokens, or "이 NDS 프로젝트 학습해" → `nds/`.
   - Mentions `nhsec.com` or NH's main website (menu/nav/color learning, not Figma) → `nhsec-production/`.
   - Mentions `mynamuh.com`/나무/namuh's website (menu/nav/color learning, not Figma) → `nhnamuh-production/`.
   - Asks to **re-check, verify, or re-review** an already-learned project ("이거 제대로 학습된 거 맞는지 봐줘", "다시 검토해줘", "재검토", "검증해줘") → same domain as the project being checked; use that domain's **Mode 3 (VERIFY)**, not Mode 1.
   - Asks to build/prototype a new screen → almost always **both** `nds/` (component/token baseline) and `asset/` (closest-matching learned flow), for MTS-app work; for website work, the matching production-site domain alone usually suffices.
   - Names a domain that doesn't exist yet → say so, propose creating a new `<domain>/LEADER.md` following the same LEARN/VERIFY/BUILD three-mode pattern (see any existing domain's `LEADER.md` as the template — Figma-based domains use `figma-use`, website domains use a browser tool per `nhsec-production/LEADER.md`'s Tooling note), and update the Domains table (and this skill's `description`) once created.
2. **Read the matched domain's `LEADER.md`** directly (plain file read — these are reference files, not separate skills) and follow its Mode 1 (LEARN), Mode 2 (BUILD), or Mode 3 (VERIFY) instructions.
3. **For BUILD requests spanning both Figma domains**: read `nds/LEADER.md`'s Core reference first (component/token baseline), then `asset/LEADER.md`'s matching project file (flow/interaction baseline), then build. Component facts come from NDS; screen structure/behavior comes from the asset domain's project notes. If they conflict, the more specific (asset domain's project-level, shipped-production) note wins over the generic NDS guide.
4. **Don't duplicate a domain's stored knowledge here.** This file stays thin — routing table + dispatch logic only. Domain facts live in each domain's own `LEADER.md` and `projects/` files.
