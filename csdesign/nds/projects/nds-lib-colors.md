---
name: nds-lib-colors
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=2283-9973"
learned_date: 2026-07-16
sections_studied:
  - "2283:9973 (page '    - Colors' — the entire page. On-canvas heading: 'NDS_Colors 별도 라이브러리'. Contains exactly 3 nodes.)"
  - "2283:9974 (TEXT 'NDS_Colors 별도 라이브러리' — the whole spec, 538×194)"
  - "2278:11795 (FRAME 'Group 1' → TEXT 'GO ->' — a signpost link, 219×97)"
status: "live, but a SIGNPOST page — not a spec. Evidence: the page renders (not hidden, screenshot returns real pixels), and its only content is a pointer to another library. Independently corroborated by the sibling Typography page, whose 사용방법 step 1 tells designers to enable a separate asset toggle named `00_Colors`."
---

# NDS Library — Colors (a signpost, not a spec)

**The finding is that there is no color spec here.** The `    - Colors` page of `NDS_Library` (`72zrHgMLM4zhCjgSuTf7cC`) is a three-node placeholder that redirects to a different Figma file. Do not go looking for swatches, tokens, or hex values on this page — there are none, and their absence is deliberate, not an oversight.

The page in its entirety:

| Node | Type | Verbatim content |
|---|---|---|
| `2283:9974` | TEXT | `NDS_Colors 별도 라이브러리` |
| `2278:11795` → `2278:11786` | FRAME → TEXT | `GO ->` |

Rendered: white heading **"NDS_Colors 별도 라이브러리"** on a near-black surface, with a coral/salmon **"GO →"** link underlined beneath it. That is the whole page.

Translation of the heading: **"NDS_Colors — a separate library."**

## What this means

`NDS_Library` **does not own its color foundation.** Colors are factored out into a distinct Figma library called `NDS_Colors`. This page exists solely so that a designer browsing `NDS_Library`'s page list doesn't conclude the colors are missing — it tells them where to go instead.

This is **corroborated independently** by the sibling `    - Typography` page (see `nds-lib-typography.md`), whose 사용방법 (usage) instructions read:

> `Assets ‣ [icon] ‣ 00_Library, 00_Colors 토글 켜기`

("Assets ▸ … ▸ turn on the `00_Library`, `00_Colors` toggles.")

So two independent pages in this file agree: **`00_Library` and `00_Colors` are two separate asset libraries that must both be enabled**, and color lives exclusively in the latter. The Colors page's claim is not a stale note — the Typography page's workflow depends on it being true.

## Where the color spec actually is

**Not resolved from this page.** The `GO ->` link's destination is not readable from the node tree — it is a text label inside a plain FRAME, not a hyperlink node, so no target URL is exposed via metadata or the Plugin API. The page names the destination library (`NDS_Colors`) but **does not carry its fileKey**.

Known related color sources already learned in this domain, for orientation — **none of these is confirmed to be the `NDS_Colors` library this page points to**:

- `nds-mweb-colors.md` — the `NDS_M.web` file (`uVcmG6GgOl2J8EOlc22wob`), which *does* carry a full two-channel (NM / QV) Essential palette with decoded style names. This is a **different file** and is a `M.web` palette, not necessarily the `NDS_Colors` library.

Resolving `NDS_Colors` to a fileKey is **open work** — it needs either a designer to click the `GO →` link, or a Figma team-file listing. Do not assume it is the same palette as `nds-mweb-colors.md` without checking.

## Name-reliability verdict

**Reliable.** Both text layers are named with their exact on-canvas string (`NDS_Colors 별도 라이브러리`, `GO ->`). The only mild mismatch is the wrapper FRAME named `Group 1`, which is a generic Figma default rather than a lie. Nothing on this page is named after a different page, and nothing carries placeholder demo copy.

**No rules are embedded in screenshot images on this page** — there are no image fills at all. The screenshot confirms the rendered page matches the node tree exactly, with no additional pasted content.

## Gaps / unverifiable

- **The `GO ->` destination is unresolved.** No URL, no fileKey, no node-id. The link target is not encoded in any readable property — it is very likely a Figma prototype interaction or a manually-followed convention. **Unverified; needs a human to click it or a team-file listing to resolve `NDS_Colors` → fileKey.**
- **No `Last update` stamp on this page.** Unlike the sibling Typography page (which carries `Last update 2022.10.12 구자영`), this page has no version stamp and no Update History. Its age is therefore unknown — it could predate or postdate the split it describes. Treat the "colors are separate" claim as current only because Typography's 2022.10.12 instructions independently repeat it.
- **No componentKeys, no styles, no variables** on this page. Zero components (`COMPONENT`/`COMPONENT_SET`/`INSTANCE` count = 0) and zero local paint styles reachable from it. There is nothing here to classify as remote/local/scaffolding.
- **Whether `NDS_Colors` is published as a real Figma library** (vs. just a file someone opens) is not evidenced by this page. The Typography page's "토글 켜기" (turn on the toggle) phrasing implies it *is* a published, enable-able library — but that is inference from a sibling page, not proof from this one.
- This session is **read-only**; no `importComponentSetByKeyAsync` verification was possible. Not applicable here anyway, since the page exposes no keys.

## How this feeds BUILD mode

- **Never source a color from `NDS_Library`.** It has none. Reach for `NDS_Colors` (once resolved) or, for `M.web` work specifically, the decoded palette in `nds-mweb-colors.md`.
- **When setting up a Figma workspace for NDS work, enable BOTH toggles** — `00_Library` *and* `00_Colors`. Enabling only `00_Library` will leave every color style unresolvable, which is the concrete failure this page exists to prevent.
- **Do not treat this page's emptiness as a gap to fill.** If a future pass finds swatches added here, that is a *conflict* with the split, not an improvement — flag it rather than merging it.
