---
name: nds-tpl-coach-mark
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=19746-6495"
learned_date: 2026-07-15
sections_studied:
  - "19746:6495 (page '    - Coach mark 코치마크' — one canvas, two labeled sub-guides 'Step 단계형 코치마크' and 'Highlight 하이라이트 강조형 코치마크', plus 4 unlabeled '해외주식 주문_*' screen mocks lower on canvas that separately demonstrate a masked-spotlight coach mark and a guide_tooltip feature-announcement bubble)"
  - "19746:8070 (title frame — on-canvas 'Coach mark' / 'QV-NM Template Guide')"
  - "19746:8413/8454/8471 (coachmark_step_01/02/03 — sequential spotlight-circle + hand-pointer + caption + 3-dot indicator + full-width CTA)"
  - "19746:8430 (coachmark_highlight_01 — simultaneous multi-callout overlay, arrow-button bubbles + one floating tooltip-shaped card, single dismiss CTA, no dots)"
  - "22426:5751/5822/5852 (해외주식 주문_하락 x2 + 주문_데이_상승 — 3-step 'coach mark mask' dim+cutout sequence over a real 현재가 screen, dots 1-3, no hand-pointer, no bubble component)"
  - "22426:5786 (해외주식 주문_데이_상승 — separately holds a hand-composed 'guide_tooltip' FRAME: 💡 feature-announcement bubble anchored below header, ✕ dismiss, no dim overlay, no CTA, not part of the mask sequence)"
status: internal NDS component-library guide (Templates file — usage-example gallery; three distinct hand-composed construction methods, no single reusable coach-mark component)
---

# NDS Templates — Coach mark 코치마크

Single-page usage gallery (title on-canvas **"Coach mark" / "QV-NM Template Guide"**) with two explicitly labeled sub-types — **"Step 단계형 코치마크"** (sequential) and **"Highlight 하이라이트 강조형 코치마크"** (simultaneous) — plus a third, unlabeled construction ("coach mark mask") found lower on the same canvas inside real 현재가(주식) screen mocks. A fourth artifact, a `guide_tooltip`-named hand-composed bubble, sits on the same canvas but is a feature-announcement tooltip, not a coach mark.

## Layer-name convention — screenshot-confirmed for this page: mixed/mostly reliable

`coachmark_step_01/02/03` and `coachmark_highlight_01` frame names correctly describe their on-canvas content (verified by screenshot). One data defect matching the domain's known `\b`-backspace pattern (seen previously in `account_apply`'s `레이블표시` on `nds-tpl-account-controller`): both `coachmark_step_01` and `coachmark_highlight_01`'s raw node names carry a literal `\b` backspace character prefix (`\bcoachmark_step_01`), confirmed via direct `node.name` read. Cosmetic in the UI, but a second sighting of the same source-data defect. The unlabeled `22426:*` frames are named after the underlying screen (`해외주식 주문_하락`/`_데이_상승`), not their coach-mark purpose — those names do **not** describe the coach-mark content and must not be trusted for that.

## Three distinct construction methods — no single reusable "coach mark" component

1. **Step-type** (`coachmark_step_01/02/03`): full-screen dim + a white spotlight circle behind the target UI + `nds_icon_handpointer` animated-pointer instance + a caption text pair + a 3-dot progress indicator (`Frame 481776`, reordered per step) + full-width bottom CTA (`다음` steps 1-2, `시작하기` on the last). Close `✕` (`nds_icon_header` Type=close) top-right on every step. One target highlighted at a time, advanced by the CTA — genuinely sequential/step-driven.
2. **Highlight-type** (`coachmark_highlight_01`): full-screen dim with **multiple simultaneous** callouts on one screen — two `btn_txt_arrow` instances forming a 2-option tooltip bubble anchored to a filter row, plus a separate floating "새롭게 개편되었어요!" card with its own caret — dismissed together by one bottom CTA (`시작하기`). No dots, no `nds_icon_handpointer`, no per-target sequencing — everything is shown and dismissed at once.
3. **Mask-type** ("coach mark mask" — `22426:5770`/`5843`/`5864`, all type `GROUP`, unlabeled sub-guide, found lower on the same canvas inside 3 `해외주식 주문_*` frames): dim overlay + a spotlight **cutout rectangle** (2 stacked `rounded-rectangle`s, no caret/pointer glyph) directly around the target UI region (price card, market-type row, etc.) + caption text below + 3-dot indicator + bottom CTA (`다음`/`시작하기`). Structurally close to Step-type (dots + CTA + sequential) but built from raw rectangles, no `nds_icon_handpointer`, no bubble component — a third, independently hand-built variant of the same idea.

None of the three reuses a shared "coachmark" component — every dim overlay, spotlight shape, dot indicator, and CTA button is composed fresh per screen (only shared leaf primitives like icons/arrows are real instances).

## Component keys — sampled via explicit node IDs (read-only did not throw this pass)

| Instance | role | variant (`main.name`) | main key | remote | parent SET name | parent SET key |
|---|---|---|---|---|---|---|
| `19746:8418` | hand-pointer (Step-type) | `Property 1=Default` | `5d61b884c24b993a13615665585079f31ffc2cec` | true | `nds_icon_handpointer` | `8f429dd817e2cfcf9bf6cb30090d5e732fd6eb51` |
| `19746:8427` | close ✕ icon | `Type=close, Color=6, Darkmode=false` | `07554f026aade08d7789f1ab857d6c0caff81f20` | true | `nds_icon_header` | `19619c9f1fd2e3c2e6515542d0484e651f3f30c6` (= Core exactly) |
| `19746:8435` | callout arrow-text btn (Highlight-type) | `Type=18pt` | `1ba950291fbc70787b8f727e88c26d8c71f0cad5` | true | `btn_txt_arrow` | `bc0399bb33f9213ff99482a43345a0aaaa3e070c` |
| `22426:5779` | up/down rate glyph (mask-type caption) | `Type=up, Height=12, White=true` | `c1e674da725945538e5db1640cbd00012ebeb3dc` | true | `rate` | `6b15826624212f3b4d3a280c37f7181209ec45f5` |
| `22426:5752` | `header_stock` (underlying screen chrome) | `channel=NM, country=해외, 줄갯수=1줄` | `94668db7f2e578fdd5bcf8d8463b241c3e13dbdd` | true | `header_stock` | `2037ab888a257dbeea9b16918462252701a5563c` (≠ Core's `28c77263…` — new/contested key, not investigated further here) |
| `22426:5815` | caret inside the hand-composed `guide_tooltip` FRAME | `Type=up, Color=01` | `939b6ab04405f403e2aa9c3308b5a307c7420019` | true | `nds_img_guidepolygon` | `86cf784d7f2090f9410d51d815f3132418b0f7a9` **(exact key match to `nds-tpl-tooltip.md`'s finding on the Tooltip page)** |

All 6 sampled = `remote: true`. Keys = confirmed this pass (not `unverified — read-only session`; `getMainComponentAsync()` succeeded on every call).

## ANSWERS to the cross-file question

- **Do `guide_tooltip` / `nds_img_guidepolygon` appear on this page?** Yes, both — and the finding is identical in shape to the Tooltip page's: `22426:5814`, literally named `guide_tooltip`, is a **hand-composed `FRAME`** (confirmed via direct `node.type` check — not an `INSTANCE`), containing a real `nds_img_guidepolygon` caret **instance** (key `86cf784d7f…`, exact match to `nds-tpl-tooltip.md`'s sampled key) swapped in for the caret. No instance of the actual `guide_tooltip` COMPONENT_SET (`80538a1c12…`, per the Tooltip page) appears anywhere on this page.
- **Is a coach mark built from the same components as a tooltip, or different?** **Different, and the two UI patterns don't overlap on this page at all.** The three coach-mark constructions (Step/Highlight/Mask) use `nds_icon_handpointer`, `btn_txt_arrow`, raw dim rectangles, and dot-indicator frames — none of which appear on the Tooltip page. The one node on this page literally named `guide_tooltip` is **not part of any coach-mark flow** — it sits in a separate frame (`22426:5786`) as a standalone feature-announcement bubble (💡 "현재가가 새롭게 바뀌었어요" + ✕), anchored below the header with **no dim overlay, no CTA button, no dots** — visually and structurally it is a tooltip use-case (single-target, lightweight, ✕-dismiss), not a coach mark (full-screen onboarding sequence). The name `guide_tooltip` is accurate to what it is: a "guide"-style tooltip, distinct from both the coach-mark family on this page and the plain field-help tooltip on the Tooltip page.
- **Does this page state the usage rules the Tooltip page lacked** (trigger / dismissal / sequencing across multiple marks / once-per-user persistence)? **No — zero prose rules found anywhere on this page.** Every text node scanned is on-screen demo copy (captions, button labels, section headers) or the two sub-type labels ("Step 단계형 코치마크" / "Highlight 하이라이트 강조형 코치마크") — no rule text about when a coach mark triggers, how many times it shows, what dismisses it beyond the visible CTA/✕, or how the two types should be chosen. **This is now the third file/page with zero prose usage rules for this UI family** (Tooltip page in this file, `nds-mweb-tooltip.md`, and now Coach mark) — the absence is thrice-confirmed and is itself the finding.

## Blanks / gaps

- No page-wide instance sweep attempted — 6 explicit-ID instances sampled; other `Frame 481776` dot-indicator variants, `nds_icon_handpointer` other Property-1 values, and the Highlight-type's second floating card were not individually key-verified.
- `header_stock` key sampled here (`2037ab888a…`) differs from Core's (`28c77263cb…`) — flagged, not investigated; consistent with this domain's recurring "same name, multiple real published keys" pattern (Gotcha 5b) but not confirmed as that vs. a genuine variant-context difference.
- Whether the Step/Highlight/Mask split maps onto any prose taxonomy elsewhere in NDS (e.g. NDS_UX Guide) was not checked — out of scope for this pass.
