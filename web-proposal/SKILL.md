---
name: web-proposal
description: Generate an NH desktop-website feature proposal deliverable — a PPT 기획서 (slide deck) plus a 화면 흐름 개요 (screen flow diagram) — in the current live brand style of 나무증권/mynamuh.com and NH투자증권/nhsec.com (currently the same site), built from live-site-derived layout/color/nav facts recorded in nhdesign3. Trigger: "/web-proposal <feature/area>", or any request to make a "기획서", "화면흐름개요", "웹버전 기획서", "웹 화면흐름도" for a 나무증권/mynamuh/nhsec.com desktop website feature. For mobile app or mobile-web (NDS) requests, use `nds-proposal` instead.
---

# web-proposal

Website-brand sibling of `nds-proposal`. Produces the **same two-part deliverable shape** — a
**PPT 기획서** slide deck and a **화면 흐름 개요** flow diagram, both structured per the pattern
learned from `zRrojC3HnGljRiRYMFiCjX` — but for NH's **desktop website** properties (나무증권 /
mynamuh.com and NH투자증권 / nhsec.com), not the mobile NDS design system.

The one structural difference that matters: NDS has a real Figma component library to import
instances from. **The desktop websites do not.** Their design facts were learned by live browser
inspection (Chrome `use_browser`), not Figma. Every mockup in this skill's output must be built
as plain Figma frames/rectangles/text reproducing the recorded nav structure, colors, and layout
— never NDS component instances.

This skill is a thin orchestrator, same as `nds-proposal`. It hands off to `nhdesign3` for DB
access and to `figma-use` for everything about writing Figma. Load `nhdesign3` first, always.

## 0. Load prerequisites (mandatory, in order)

1. Invoke the `nhdesign3` skill. Do not skip this even if it was loaded earlier in the session.
2. Load `figma-use` before any `use_figma` call.
3. Pull the slide/flow template pattern and every website source row in one query:

   ```sql
   select s.name, p.node_id, p.page_name, p.content_md from nhdesign3_pages p
   join nhdesign3_sources s on s.id = p.source_id
   where s.file_key = 'zRrojC3HnGljRiRYMFiCjX'
      or s.kind = 'website'
   order by s.name, p.page_name;
   ```

   This returns: the slide-deck pattern (`ppt-proposal-slide-pattern`), the flow-overview
   pattern (`screen-flow-overview-pattern`) — both shared verbatim with `nds-proposal`, reused
   as-is, not re-derived — plus every `website`-kind row (`nhnamuh-production`,
   `nhsec-production`; 6 rows total as of the 2026-07-17 VERIFY expansion: each site's homepage,
   plus 4 category-landing captures — 뱅킹/계좌정보, 주식/파생상품안내, 고객센터, and a flagged
   `unreliable`-status quirk page for 금융상품, which routes to a mobile guide instead of a
   desktop landing — read that one's caveat before using it). The template rows describe *shape*;
   the website rows describe *substance* (real nav labels, real colors, real layout).

4. **Also read the ledger row `mynamuh-nhsec-rebrand-flap-2026-07`** — mandatory, not optional:

   ```sql
   select title, description from nhdesign3_ledger where anchor = 'mynamuh-nhsec-rebrand-flap-2026-07';
   ```

   This is the single most important fact for this skill: the two domains' redirect direction
   and brand palette **flipped once within about 24 hours** (2026-07-16 → 2026-07-17). Whatever
   the DB's last-recorded state says, treat it as a snapshot, not a steady state — see step 1.

## 1. Resolve which brand you're building (mandatory live check, do not skip)

nhsec.com and mynamuh.com currently converge on **one live site** — but which domain redirects
to which, and which brand (teal 나무 vs. blue NH투자증권) is live, has already reversed once in
one day (ledger `mynamuh-nhsec-rebrand-flap-2026-07`). As of the last VERIFY pass (2026-07-17):
mynamuh.com redirects to nhsec.com, and the live brand is blue NH투자증권 (nav: 금융상품,
뱅킹/계좌정보, 주식/파생상품안내, 투자정보, 연금자산, 고객센터; colors #1171D2/#1692E8, bg
#F0F3F8-family) — the OPPOSITE of the 2026-07-16 finding (nhsec→mynamuh redirect, teal brand).

**Do not build against the DB's last-recorded palette/nav without a fresh live check.** Before
finalizing any color or nav decision:

1. Load the live site with the Chrome `use_browser` tool (not Playwright `browser_navigate` —
   it has hung on this template family), confirm current redirect direction and brand via a
   full-document computed-style frequency scan (see `nhsec-production`'s stored VERIFY note for
   the exact method — sample every element's `background-color`/`color`, tally by hex, trust the
   high-frequency values over a handful of manually-inspected elements).
2. State back to the user, explicitly, which brand/nav you found live and are building against —
   never silently assume the DB snapshot is still current.
3. If the user asks for a specific historical brand state (e.g. "예전 나무 teal 브랜드로", or "예전
   블루 브랜드로") instead of whatever's live, honor that explicitly and label the deliverable as
   using a non-current/historical brand snapshot.
4. Write the live-checked state back to the DB (`nhdesign3_pages`/`nhdesign3_sources` for
   whichever site row, `reviewed_date` bump) so the next run starts from a fresher snapshot —
   same write-back discipline as step 6 below.

## 2. Scope the feature

Same two cases as `nds-proposal`, adapted:

- **Feature already exists as recorded content**: read its page(s) from the DB (see the 6-row
  query in step 0.3) — fast path. Five of those six page rows are real captured category
  landings (뱅킹/계좌정보, 주식/파생상품안내, 고객센터, plus each site's homepage) with detailed
  layout/color/copy-tone notes written for exactly this use — read the matching one in full
  before building anything from scratch.
- **New/unbuilt page type, or a category with no capture yet**: sample the live site directly
  with `use_browser` before building any mockup that depicts it. Never invent a layout for an
  unsampled page — sample it, or flag the gap and ask whether to sample now. (금융상품 is a known
  special case — its own GNB quick-link routes to a mobile guide, not a desktop landing; read the
  `financial-products-guide-entry` page row's caveat and, if planning a new 금융상품 area, flag to
  the user that there are two competing patterns to choose from rather than picking one silently.)

Enumerate explicitly: the ordered list of primary-flow screens, and every popup/modal/drawer
reachable from any of them. This list drives both deliverables.

## 3. Build the 화면 흐름 개요 first

Same shape as `nds-proposal` step 2 — left-to-right compact-scale screen row, numbered-circle
step labels (①②③...), green `flow:` arrows (ellipse start-dot + vector + arrowhead), and a
`팝업·시트` section below with one Mockup frame per popup/modal, each linked back by a `branch:`
arrow (Scrim + centered/drawer overlay — desktop overlays are modals/drawers, not mobile bottom
sheets; no recorded desktop overlay pattern exists yet in the store, so sample one live before
building it, don't default to NDS's sheet-with-handle shape).

Building this before the slides surfaces missing states the same way it does for `nds-proposal` —
e.g. a mega-menu hover-open state, an empty-search-result state, a login-required gate. Flag any
state the feature clearly needs but has no recorded/sampled reference for, rather than omitting it
silently.

## 4. Build the PPT 기획서

Same three-part shape as `nds-proposal` step 3 — Cover / one content slide per primary-flow
screen (reusing the flow-overview instances, not rebuilding) / Closing — with bilingual
Korean+English header pairs on content slides, per the template pattern.

## 5. What must differ from `nds-proposal`'s BUILD step (the substance swap)

This is the core of the skill. Every mockup screen must be built as **plain Figma
frames/rectangles/text reproducing the live layout** — there is no desktop component library to
import instances from. Concretely:

- **No component-instance lookup step.** `nds-proposal` has a "BUILD-mode component lookup"
  phase against NDS's Figma library. Skip it entirely — build header/nav/hero/section/footer as
  raw frames, rectangles, and text nodes matching the recorded (or freshly live-checked)
  structure.
- **Canvas/viewport width**: only a sampled browser viewport (1440×900) is recorded — this is
  *not* a confirmed production design-canvas width. No confirmed container/grid width exists in
  the store. Sample it live (`getBoundingClientRect()` on the header/hero/section containers via
  `use_browser`) rather than inventing a number — flag any dimension you couldn't sample as an
  inference, not a confirmed fact.
- **Brand color palette**: use whatever step 1's live check confirmed — never NDS green, never
  the DB's last-recorded palette without that live check. The two known real palettes to
  recognize (not to default between without checking): blue NH투자증권 (bright #1692E8, deep
  #1171D2, muted text #607792/#666666, bg #F0F3F8-family) and teal 나무 (bright #00A5BD, deep
  #0A808C, muted text #61787B, bg #F0F3F8-family — same structural bg across both brands, only
  the accent family differs). Category-landing pages may use section-specific shade variants
  within the live brand's hue family (e.g. the stock landing's brighter azure vs. the customer
  center's deeper navy under the blue brand) — match the shade to the section's tone per the
  captured page rows, don't flatten to one fixed hex everywhere.
- **GNB nav pattern**: base any new nav entries or mega-menu mockups on whatever step 1 confirmed
  live — top-level `ul.mn_list > li`, `.mn_sub dl > dd > a` quick-link sub-items per category,
  plus the utility bar above (로그인 · 인증센터 · 개인정보수정 · 전자민원접수 · 금융소비자보호 ·
  ...). Do not invent a 7th top-level category or a differently-shaped mega-menu without flagging
  it as new. The category-landing captures also show a reusable solid-color breadcrumb pill
  directly under the GNB (🏠 icon + "{category} ⌄") — use it for any new category-landing mockup.
- **Font**: Dotum, 돋움, sans-serif — not NanumBarunGothic/Pretendard. No confirmed size/weight
  scale is recorded; if a slide needs a specific H1/H2/body size, sample it live or flag it as an
  assumed reasonable desktop scale, not a confirmed fact.
- **No quickmenu_basic.** There is no desktop analog of NDS's mobile quickmenu grid. The captured
  category landings show the real desktop equivalent instead: a right-rail slot whose content
  matches the section's purpose (a "자주 찾는 메뉴" icon-grid + hours box on 뱅킹/계좌정보, a
  tabbed report-list + download banner on 주식/파생상품안내, a support icon-grid + phone-number
  block on 고객센터) — reuse this "right-rail slot, content matched to section purpose" pattern
  rather than inventing a generic sidebar.
- **No iframe shell, no popup-tab replication.** The live sites use an `iflg_body`/`ticker.html`
  iframe shell and open notices in new tabs — these are scraping/automation implementation
  details of the live site, not things a Figma mockup should reproduce. Build a normal single-page
  desktop layout using the observed header/GNB/breadcrumb-pill/hero/section/sitemap-footer/global-
  footer structure (per the category-landing captures: hero → quick-menu/rail → in-page tabs or
  right-rail content → 3-up feature cards or promo cards → 주요서비스 5-column sitemap recap →
  global footer, then a sticky site-wide bottom market ticker bar).
- **Global footer**: not fully captured yet (only the 5-column "주요서비스" sitemap recap that sits
  above it is documented). Sample the live site's actual global footer via `use_browser` before
  including one in a mockup, or omit it and flag the gap.

## 6. Quality gate (mandatory, both deliverables)

Because the reference here is a **live website, not a Figma project file**, the fidelity check is
different from `nds-proposal`'s Figma-to-Figma screenshot compare:

- Screenshot-compare each mockup screen against a live screenshot of the actual site
  (`use_browser` screenshot, same viewport used for sampling) — colors, nav structure, section
  layout, spacing must visually match. This replaces the NDS vibe-rubric checklist item-for-item:
  correct brand palette per the step-1 live check (never NDS green/#EBEDF1, never an unchecked
  DB snapshot) / correct font (Dotum/돋움) / GNB structure matches `mn_list`/`mn_sub` / density
  matches the live reference, not an assumed one.
- Separately, screenshot-compare the finished flow overview and slide deck against the
  `zRrojC3HnGljRiRYMFiCjX` template file for the *deck/flow shape itself* (badge placement,
  화면경로/화면구분 box structure, arrow style) — this part is identical to `nds-proposal`'s
  step 4, since the deck/flow SHAPE is shared.
- A deliverable that skips either check — live-site visual fidelity, or template-shape fidelity —
  is not done.

Write back: if this run samples a new page, reconfirms or corrects the live brand/nav state (per
step 1.4), or confirms a previously-inferred dimension, update the `website`-kind
`nhdesign3_pages`/`nhdesign3_sources` rows for the relevant site — same write-back discipline
`nds-proposal` uses for BUILD lessons. If the brand/redirect state has flipped again since the
last VERIFY, update the `mynamuh-nhsec-rebrand-flap-2026-07` ledger row's description rather than
filing a new anchor, so the volatility history stays in one place.

## Non-goals

- Not for mobile app or mobile-web (NDS) requests — redirect those to `nds-proposal`. If a
  request is ambiguous about channel ("모바일에서도 이 화면 보여줘"), ask which channel before
  building, don't guess.
- Not a general slide-maker — always produces both parts (deck + flow), even if the user only
  asked for one. If the user explicitly wants only one part, say so back before dropping the
  other.
- Does not invent screens, copy, dimensions, footer content, or brand colors/nav the live site
  hasn't been sampled for THIS RUN. Anti-invention escalation is inherited from `nhdesign3`:
  sample it live, take it from a recorded reference row, or flag the assumption — never guess
  silently, and never trust a DB color/nav snapshot as current without the step-1 live check,
  given this site pair's demonstrated ~24h brand volatility.
