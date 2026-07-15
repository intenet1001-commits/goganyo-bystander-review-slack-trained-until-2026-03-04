---
name: nds-tpl-tooltip
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=13604-20760"
learned_date: 2026-07-15
sections_studied:
  - "13604:20760 (page '    - Tooltip 툴팁' — one canvas, two sub-guides: 'Tooltip' and 'Guide Tooltip', each NM/QV + light/dark screen mocks)"
  - "13605:22703 / 13605:22706 (title frames: on-canvas 'Tooltip' / 'Guide Tooltip', both subtitled 'QV-NM Template Guide')"
  - "13612:21410 (tooltip_nm — NM screen mock: '?' trigger icon + composed tooltip bubble + caret)"
  - "13612:21423 (tooltip_qv — QV counterpart, same layout, orange theme)"
  - "18182:4624 (guide_tooltip variant — black/dark tooltip bubble with emoji copy, same '?' trigger anchor)"
  - "17012:6717 ('다크모드시' — dark-mode home screen with a third, hand-drawn tooltip shape anchored to a banner, not a caret-component instance)"
status: internal NDS component-library guide (Templates file — usage-example gallery, tooltip bubble is hand-composed, not a reusable component)
---

# NDS Templates — Tooltip 툴팁

Single-page usage gallery (two on-canvas headers: **"Tooltip" / "QV-NM Template Guide"** and **"Guide Tooltip" / "QV-NM Template Guide"**) showing a `?`-icon-triggered tooltip composed into full screen mocks, in NM/QV and light/dark. Unlike the Table page, there is no `tooltip` component/component-set anywhere on this page — the tooltip bubble (title + body text) is a raw, hand-built `FRAME` in every example, confirmed by directly checking node type (`13731:1991`, `16977:2577`, `13731:5816`, `16977:2589`, `18182:4673` — all `type: "FRAME"`, not `INSTANCE`).

## Layer-name convention — confirmed reliable

Frames named `tooltip_nm`/`tooltip_qv` do hold tooltip content, and the `title` frames' text matches their described header role ("Tooltip"/"QV-NM Template Guide", "Guide Tooltip"/"QV-NM Template Guide") — structurally reliable naming on this page. Note: the on-canvas **nav-bar title inside the screen mock itself reads "타이틀"** (generic placeholder "Title"), unrelated to the page's own "Tooltip" heading elsewhere on canvas — don't confuse the two different "title" texts.

## ANSWER — no `tooltip` component exists on this page; the bubble is hand-composed every time

Resolved via `getMainComponentAsync()` on 8 sampled live instances (explicit node IDs; page-wide sweep not attempted per method):

| Instance sampled | role | variant (`main.name`) | `main.key` (COMPONENT) | `remote` | `parent.name` | `parent.key` (COMPONENT_SET) |
|---|---|---|---|---|---|---|
| `13731:1995` | caret inside NM tooltip bubble | `Type=up, Channel=NM` | `53c69b67c0416d7ce085bd5fa46bd4991d1d3a5a` | true | `Polygon` | `7e28641b217609cff5e353cc7f29d33851c8b2d0` |
| `16977:2581` | caret (2nd NM copy) | `Type=up, Channel=NM` | (same) | true | `Polygon` | (same) |
| `13731:5820` | caret inside QV tooltip bubble | `Type=up, Channel=QV` | `d23385917c6109aff93c711a90b2670024639dec` | true | `Polygon` | (same) |
| `18182:4613` | full black-theme tooltip (Guide Tooltip section) | `Type=up, Color=black` | `a3b83865aefb8f1168017cd21874adb9174dc14a` | true | `guide_tooltip` | `80538a1c120ffbe7e5fbe22f02d127273efa92db` |
| `18182:4780` | full black-theme tooltip | `Type=down, Color=black` | `78bd0379aba7fc0f715837c5291d29294728db20` | true | `guide_tooltip` | (same) |
| `18182:4785` | full black-theme tooltip | `Type=down, Color=black` | (same) | true | `guide_tooltip` | (same) |
| `18182:4674` | caret only, inside a *detached* guide_tooltip FRAME | `Type=up, Color=01` | `939b6ab04405f403e2aa9c3308b5a307c7420019` | true | `nds_img_guidepolygon` | `86cf784d7f2090f9410d51d815f3132418b0f7a9` |
| `13612:21413` | `?` trigger icon | `Type=01` | `2f406dde16651eb4a4bed0d2a8d628d48542fa6c` | true | `nds_icon_tooltip` | `7e414339b7619b81d964facd6b7faf2a3f814135` |

**Four distinct, all-`remote: true` COMPONENT_SETs surface on this page — none is named `tooltip`:**
1. `Polygon` (`7e28641b21…`) — small caret glyph, axes `Type`(up/down) × `Channel`(NM/QV). Same set already documented from `nds-mweb-tooltip.md`'s reused market up/down glyph — plausibly the same shared asset family, but keys weren't resolvable there (M.web hit read-only) so this can't be confirmed as an exact-key match, only a same-role match.
2. `guide_tooltip` (`80538a1c12…`) — a **complete tooltip bubble** (not just a caret), axes `Type`(up/down) × `Color`(`black` sampled; other values unconfirmed). This is the closest thing to a real reusable "tooltip" component on this page, but it is a different named component with a different variant-axis vocabulary than M.web's.
3. `nds_img_guidepolygon` (`86cf784d7f…`) — a third caret-only set, axes `Type`(up) × `Color`(`01`), found substituted into a *detached* copy of the `guide_tooltip` frame — same "layer name says X, but the live component is Y" trap already seen on the Data Table page.
4. `nds_icon_tooltip` (`7e414339b7…`) — the `?` trigger icon, axis `Type`(`01` sampled).

## ANSWERS to the cross-file question

- **Was a `tooltip` componentKey found here?** No — and there **is no `tooltip`-named component or component-set on this page at all**. The bubble (title + body, NM/QV, notitle/normal/complex-shaped copy) is a raw composed `FRAME`, confirmed by direct `node.type` check, not an `INSTANCE`. This is a stronger negative than M.web's "read-only blocked resolution" — here resolution wasn't blocked, there is simply nothing to resolve.
- **Is it the same component as M.web's 6-variant `tooltip` set?** **No — not the same component, and not confirmably even the same *family*.** M.web's `tooltip` had axes `Type=NM/QV` × `Status=notitle/normal/complex`. The nearest analog here, `guide_tooltip`, uses axes `Type=up/down` × `Color=black`(+ unconfirmed other values) — a completely different axis vocabulary describing caret direction and theme, not channel and content-density. Since NDS_Templates subscribes to the real NDS_Library (per Q4), and this file shows **no `tooltip` component exists in the live library at all**, the most likely reading is that M.web's `tooltip` set is a **page-local doc mockup that was never published to Core** — consistent with the M.web/Table precedent where page-local symbol sheets diverged from the real library.
- **Does this page state any usage rule the M.web page lacked?** **No formal prose rule either** — same absence confirmed a second time across two files. However, this page does show (not state) one thing M.web's isolated swatches didn't: a concrete **trigger + anchor example** — a `?`-icon (`nds_icon_tooltip` component) sits next to a label; tapping/showing it renders the tooltip bubble anchored just below-left of the icon, caret pointing up at the icon, consistent across NM/QV/light/dark screenshots. This is visual precedent, not written guidance — no trigger-event (tap vs hover), dismiss, or timing text appears anywhere.

## Screenshots transcribed

- `13612:21410` (NM): nav title "타이틀", label "텍스트를 입력해주세요." + `?` icon, tooltip below: title **"나무 툴팁 타이틀"**, body **"툴팁에 들어가는 내용이에요.툴팁에 들어가는 내용이에요.툴팁에 들어가는 내용이에요.툴팁에 들어가는 내용이에요. 3줄까지"** (green fill, matches `NM/ESS/primary/5.273(툴팁배경)` `#F9FDF4` from `nds-mweb-colors`).
- `13612:21423` (QV): identical layout, title **"N2 툴팁 타이틀"**, same body copy, orange/cream fill.
- `18182:4624` (Guide Tooltip, black): body copy **"새로운 계좌를 찾았어요 🔎 지금 바로 연결할 수 있어요!"** — dark bubble, same `?`-icon anchor pattern, different copy/tone (feature-announcement style vs. generic field-help style).
- `17012:6717` (다크모드시 / dark-mode home): a **third, hand-drawn tooltip shape** (`boolean-operation` "Union" of a rounded-rect + vector caret, not a component instance at all) reading **"다른 증권사에 있는 내 주식도 확인 가능해요!✌️"**, anchored to a promo banner — yet another one-off construction method for the same UI pattern.

## Findings summary

- **The "tooltip" UI pattern has at least four different construction methods on this single page**: (1) raw FRAME bubble + `Polygon` caret instance, (2) `guide_tooltip` full COMPONENT_SET instance, (3) `guide_tooltip`-shaped FRAME with a swapped-in `nds_img_guidepolygon` caret instance (detached), (4) a hand-drawn boolean-operation shape with no instance at all. No single canonical `tooltip` component is used consistently — reinforcing this domain's recurring finding (also seen on the Table page) that Templates' composed screens don't reliably demonstrate "the" library component.
- "3줄까지" (up to 3 lines) appears again as placeholder-embedded copy, same non-formalized hint already noted in `nds-mweb-tooltip.md`.
- The `?`-icon trigger + below-anchor + up-pointing-caret pattern is consistent across every NM/QV/light/dark example on this page — the closest thing to an implicit anchor rule, but never stated as prose.

## Blanks / gaps

- No page-wide instance sweep attempted (per method — explicit-ID sampling only); other `guide_tooltip`/`Polygon`/`nds_img_guidepolygon` variant values (e.g. non-`black`/non-`01` `Color` values) are not exhaustively confirmed.
- No dismiss, trigger-event (tap vs. long-press vs. hover), auto-hide timing, or explicit anchor-positioning rule found in prose anywhere on this page — same absence as `nds-mweb-tooltip.md`. Two files, zero prose usage rules for tooltip — this absence is itself the finding.
- Whether `guide_tooltip` (`80538a1c12…`) is published/discoverable as "the" NDS tooltip component (e.g. via `search_design_system`) was not tested — only resolved via live-instance `getMainComponentAsync()`.
