# nhnamuh-production

Domain knowledge for the **live production website** at `https://www.mynamuh.com/` (NH투자증권's "나무(namuh)" discount/direct-trading sub-brand website — a sibling of `../nhsec-production`'s main site, built on the same underlying template but with its own nav content and color identity). This is a **running website, not a Figma file** — LEARN mode uses a browser tool, not `figma-use`.

Goal this domain serves: when asked to add a new feature/menu/page to this site (or one styled to match it), the output should follow the site's **current** nav structure and color identity, not a generic redesign — see the shared `csdesign` goal of matching how NH's own team already built things.

This domain has three modes. Detect which one applies from the user's request; don't ask unless genuinely ambiguous.

## Tooling note

Same underlying platform as `../nhsec-production` — read that file's "Tooling note" section first; it applies here verbatim (iframe shell via `iflg_body`, notice-popup-opens-a-separate-tab behavior, `ul.mn_list`/`.mn_sub dl` mega-menu markup, Playwright navigation hangs observed on this template → prefer the Chrome `use_browser` tool). Don't re-derive these from scratch; this file only tracks what's specific to namuh.

## Structure — deliberately NOT split (decided 2026-07-15)

This domain stays a **single `LEADER.md`**, unlike `../nds` (guide) and `../asset` (project), which were split into
`LEADER` + base + `INDEX` + `LEDGER` + `sources/`. **That asymmetry is intentional, not an oversight — don't
"harmonise" it.**

**Why they were split:** they *accumulate*. `../nds` reached ~36k tokens across 3 Figma files and a BUILD pass could
no longer read it at all; `../asset` will hold many projects. **Why this one isn't:** it owns **one site, one learned
page**, it doesn't accumulate the same way, and at this size it's read in one pass. Splitting it would be
over-engineering.

**Revisit only when measured, not on taste:** this file approaching ~25k tokens, or the registry growing a
cell-per-entry that no longer scans. Then apply `../nds`'s shape.

**`nhsec-production` and `nhnamuh-production` are kept as two separate domains** — different brands, different sites,
different palettes. The `### Shared with ../nhsec-production` subsection is a **maintained duplicate on purpose**: it's small,
and both sides need it at hand. **Sync it on edit; don't let the two copies drift.**

## Mode 1 — LEARN (register the site's current structure/style)

Triggered when the user gives this (or a matching) production URL and asks to learn/study it (e.g. "mynamuh.com 학습해").

Steps: same as `../nhsec-production` Mode 1 (navigate past the popup tab → screenshot at desktop width → extract `ul.mn_list`/`.mn_sub dl` nav tree from the `iflg_body` iframe → sample background-color frequency + cross-check visually for low-frequency brand accents → write `projects/<kebab-name>.md`). Additionally:
- **Compare the extracted nav tree against `../nhsec-production`'s registered project** and record both the overlap (shared categories) and the divergence (categories namuh adds/drops relative to the main site) — this contrast is itself a useful fact, since it tells you which categories are "core NH" vs. "namuh-specific."
- **Check for promotion to "Common patterns" below** — same two-bucket split as `../nhsec-production`:
  - **Within-domain** (needs a 2nd project inside `nhnamuh-production/projects/`): not reached yet, only 1 project registered.
  - **Cross-domain** (confirmed the moment this site and `../nhsec-production` agree on something): update the shared subsection immediately when true, in *both* domains' files — don't let the two copies drift apart.

## Mode 2 — BUILD (add/update a feature matching current site style)

Triggered when asked to design or spec a new menu item, page, or feature that should fit this site's existing look.

Steps:
1. Read "Common patterns" below (both subsections) first, then the matched `projects/<name>.md` file.
2. Use namuh's own sampled colors (teal-family accent, not the main site's blue or the NDS app's green) for any new UI on this site specifically.
3. Respect namuh's smaller/different top-level nav set — it is not simply "nhsec.com minus one category," it has its own distinct opening item (나무(namuh)란?) explaining the sub-brand, which the main site doesn't need. Don't copy nhsec.com's nav 1:1 onto namuh without checking whether the same category makes sense for this brand.
4. If uncertain which is the closer reference — this site vs. `../nhsec-production` vs. the MTS app (`../asset`/`../nds`) — ask.

## Mode 3 — VERIFY (re-check a learned site against the live page)

Same approach as `../nhsec-production` Mode 3: nav-tree categories and the underlying template/markup should be stable; homepage promo banners and campaign copy change often and aren't "errors" when they differ from a prior note — refresh them with a dated note rather than flagging as wrong. Update in place with `corrected <date>`/`refreshed <date>` markers and bump `reviewed_date`. If the correction touches a claim in "Common patterns" below (either subsection), fix it there too and re-check whether it still clears that subsection's promotion bar.

## Common patterns

### Common across pages of this site (needs ≥2 projects within `nhnamuh-production`)

**Status as of 2026-07-15**: only 1 project (`mynamuh-com-homepage`) is registered — nothing here yet.

### Shared with `../nhsec-production` (confirmed the moment both sibling sites agree — doesn't need a 2nd project within this domain)

- **Iframe-shell architecture**: real content lives in `iflg_body` iframe (`main.html`), plus a `ticker.html` sub-frame for the market ticker. Confirmed identically on both `mynamuh.com` and `nhsec.com` (2026-07-15).
- **Notice-popup-opens-its-own-tab** behavior on page load. Confirmed on both sites (2026-07-15).
- **Mega-menu markup**: `ul.mn_list > li` for top-level GNB categories, `.mn_sub dl > dd > a` for quick-link items (not plain `ul/li` nesting past the top level). Confirmed identically on both sites (2026-07-15).
- **Shared neutral section-background tokens**: `#F0F3F8` (section fill), `#FFFFFF` (surface), `#FBFCFD` (off-white surface) are pixel-identical computed values on both sites. Only the **brand accent color** differs per site (this site: teal `#00A5BD`/`#0A808C`; main site: blue `#1171D2`/`#1692E8`). Confirmed 2026-07-15.
- **Font**: `Dotum, 돋움, sans-serif` on both sites. Confirmed 2026-07-15.

## Registered projects

(Populated as pages are learned via Mode 1 — see `projects/` for the individual files.)

| Project | URL | Learned | Last reviewed | Notes |
|---|---|---|---|---|
| [mynamuh-com-homepage](projects/mynamuh-com-homepage.md) | `https://www.mynamuh.com/` | 2026-07-15 | — | 나무(namuh) discount-brokerage sub-brand site. GNB: 나무(namuh)란?·뱅킹/계좌정보·주식/파생상품안내·투자정보·금융상품·고객센터 (adds a brand-explainer item, drops 연금자산 vs. the main site). Brand palette is a teal family (`#00A5BD`/`#0A808C`), distinct from the main site's blue and the NDS app's green. |
