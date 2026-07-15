# nhsec-production

Domain knowledge for the **live production website** at `https://www.nhsec.com/` (NH투자증권's main corporate/retail website — distinct from the NDS-based MTS app covered by `../asset` and `../nds`, and distinct from the `../nhnamuh-production` sub-brand site). This is a **running website, not a Figma file** — LEARN mode uses a browser tool, not `figma-use`.

Goal this domain serves: when asked to add a new feature/menu/page to this site (or one styled to match it), the output should follow the site's **current** nav structure and color identity, not a generic redesign — see the shared `csdesign` goal of matching how NH's own team already built things.

This domain has three modes. Detect which one applies from the user's request; don't ask unless genuinely ambiguous.

## Tooling note (applies to both production-site domains)

This site is **iframe-based**: the outer document at `/` is just a frameset shell; the real page (nav, content) lives inside `<iframe name="iflg_body" src=".../main.html">`. Any DOM query must go through `document.getElementById('iflg_body').contentDocument`, not the top document — querying the top document directly returns 0 links and looks broken.

The site also opens a **notice popup as a separate top-level tab/window** on first load (e.g. "홈페이지 국내주식 거래 종료 안내"). A plain `browser_navigate`/`page.goto()` call can hang or return the popup's content instead of the homepage. Workflow that works: navigate, then list open tabs/pages, find the one whose title is the site's own name (not the popup's), and operate on that tab specifically (by index/id) for every subsequent screenshot/eval call.

Recommended tool: the `mcp__plugin_superpowers-chrome_chrome__use_browser` Chrome tool (`navigate` → `list_tabs` → operate on the non-popup tab index via `eval`/`screenshot` with explicit `tab_index`). Playwright's `browser_navigate` has been observed to hang indefinitely on this specific site (repeated 30s timeouts) — if that happens, switch tools rather than retrying the same call.

## Mode 1 — LEARN (register the site's current structure/style)

Triggered when the user gives this (or a matching) production URL and asks to learn/study it (e.g. "nhsec.com 학습해").

Steps:
1. Navigate to the homepage; resolve the popup-tab issue above to get to the real homepage tab. Set a desktop-width viewport (e.g. 1440×900) before screenshotting — the site's nav collapses/wraps at narrow widths and a cramped screenshot undercounts visible nav items.
2. `screenshot` (full page) the homepage for a visual reference of layout, hero treatment, and color usage.
3. `eval` inside the `iflg_body` iframe's `contentDocument` to extract the **nav tree**: the top-level GNB categories live in `ul.mn_list > li`; each category's quick-links panel is `.mn_sub dl > dd > a` (not plain nested `ul/li` — this site's mega-menu uses `<dl>/<dt>/<dd>` markup, not `<ul>/<li>`, past the top level). Record the full top-level list and each one's quick-link items.
4. `eval` to sample the **color palette**: iterate `body *` computed `backgroundColor` values and rank by frequency to surface the site's real section/surface colors (not guesses) — this reliably surfaces the light neutral section background, white/off-white surfaces, and the 1-2 saturated brand accent colors actually in use. Cross-check visually against the screenshot (e.g. logo color, primary CTA button, nav underline/accent bar) since some brand colors appear only on a handful of elements and won't dominate a frequency count.
5. Write one file: `projects/<kebab-name>.md` with frontmatter `name`, `url`, `learned_date`, `pages_studied`, then: nav tree (verbatim labels), color palette (as rgb + hex, with what each color is used for), font-family, and any structural gotchas (iframe/popup quirks, template patterns shared with sibling production sites).
6. If a structural pattern (iframe shell, `ul.mn_list`/`.mn_sub dl` markup, popup-tab behavior) is shared with `../nhnamuh-production`, note it in both files rather than only one — these two sites run the same underlying template with different skins/content, and a future LEARN pass on either should be able to reuse the other's tooling notes.
7. **Check for promotion to "Common patterns" below.** This domain has two separate promotion buckets — don't conflate them:
   - **Within-domain** (§ "Common across pages of this site"): only relevant once a **2nd project** exists in `nhsec-production/projects/` — skim the other registered project(s) for overlapping structural claims (not campaign content) and promote what's independently confirmed by both.
   - **Cross-domain** (§ "Shared with `../nhnamuh-production`"): compare this project's findings against `../nhnamuh-production`'s registered project(s) directly — a fact confirmed on *both sibling sites* (e.g. shared markup, shared neutral-background tokens) belongs here immediately, it doesn't need a 2nd project within this domain first, since the sibling site already serves as the second data point.

## Mode 2 — BUILD (add/update a feature matching current site style)

Triggered when asked to design or spec a new menu item, page, or feature that should fit this site's existing look, not a generic one.

Steps:
1. Read "Common patterns" below first (both subsections), then the matched `projects/<name>.md` file for anything more specific.
2. Place any new top-level nav item consistent with the existing GNB pattern (6 categories, utility bar above with 로그인/인증센터/개인정보수정/전자민원접수/금융소비자보호/상품공시실/회사소개/검색/전체메뉴) — don't invent a 7th top-level slot without checking whether it truly needs one or belongs as a sub-item.
3. Use the site's actual sampled colors (brand accent, neutral section background, surface white) for any new UI — don't default to NDS app colors (`../nds`'s green `#84C13D`) or the sibling site's palette; this is a different visual identity even though it's the same corporate group.
4. If uncertain which is the closer reference — this site vs. `../nhnamuh-production` vs. the MTS app (`../asset`/`../nds`) — ask, since these are three genuinely distinct design languages under the same NH umbrella, not interchangeable skins.

## Mode 3 — VERIFY (re-check a learned site against the live page)

Triggered when asked to re-review/verify/재검토 an already-learned production-site project. Production sites drift **more** than a static Figma file — campaigns, notices, and seasonal banners change on a normal schedule, so a VERIFY pass here should expect more legitimate change than a Mode-3 pass on a Figma file, and needs to distinguish "this changed because the site was updated" from "this was wrong in the first place."

Steps:
1. Read the existing `projects/<name>.md` note in full first.
2. Re-navigate and re-extract the nav tree + colors using the same steps as Mode 1.
3. **Diff against the note**: nav-tree category labels and the underlying template/markup pattern (iframe shell, `ul.mn_list`/`.mn_sub dl`) should be stable — if those changed, it's a real correction. Homepage hero copy, promotional banners, and specific campaign CTAs are expected to change often — don't flag those as "wrong," just refresh them and note the observation date.
4. Update the project file in place with `corrected <date>` / `refreshed <date>` markers, same convention as the Figma-based domains' Mode 3, and bump `reviewed_date` in frontmatter.
5. **If the correction touches a claim already promoted to "Common patterns" below** (either subsection), correct it there too with the same dated convention, and re-check whether it still clears that subsection's promotion bar (a correction to one supporting project/site can knock a "confirmed" claim back down).

## Common patterns

### Common across pages of this site (needs ≥2 projects within `nhsec-production`)

**Status as of 2026-07-15**: only 1 project (`nhsec-com-homepage`) is registered — nothing here yet. Once a second page/section of nhsec.com is learned, check its findings against the homepage project for overlap (e.g. does every page carry the same utility bar / GNB / footer?) before promoting anything.

### Shared with `../nhnamuh-production` (confirmed the moment both sibling sites agree — doesn't need a 2nd project within this domain)

- **Iframe-shell architecture**: real content lives in `iflg_body` iframe (`main.html`), plus a `ticker.html` sub-frame for the market ticker. Confirmed identically on both `nhsec.com` and `mynamuh.com` (2026-07-15).
- **Notice-popup-opens-its-own-tab** behavior on page load. Confirmed on both sites (2026-07-15).
- **Mega-menu markup**: `ul.mn_list > li` for top-level GNB categories, `.mn_sub dl > dd > a` for quick-link items (not plain `ul/li` nesting past the top level). Confirmed identically on both sites (2026-07-15).
- **Shared neutral section-background tokens**: `#F0F3F8` (section fill), `#FFFFFF` (surface), `#FBFCFD` (off-white surface) are pixel-identical computed values on both sites. Only the **brand accent color** differs per site (this site: blue `#1171D2`/`#1692E8`; namuh: teal `#00A5BD`/`#0A808C`) — confirms both run the same underlying template/design system for layout scaffolding, with only the accent swapped per brand. Confirmed 2026-07-15.
- **Font**: `Dotum, 돋움, sans-serif` on both sites. Confirmed 2026-07-15.

## Registered projects

(Populated as pages are learned via Mode 1 — see `projects/` for the individual files.)

| Project | URL | Learned | Last reviewed | Notes |
|---|---|---|---|---|
| [nhsec-com-homepage](projects/nhsec-com-homepage.md) | `https://www.nhsec.com/` | 2026-07-15 | — | Main corporate/retail website. GNB: 금융상품·뱅킹/계좌정보·주식/파생상품안내·투자정보·연금자산·고객센터. Brand palette is a blue family (`#1171D2`/`#1692E8`), distinct from the NDS app's green and from namuh's teal. |
