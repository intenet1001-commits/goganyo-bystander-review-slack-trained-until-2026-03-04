---
name: nds-mweb-label-tag
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=642-3946"
learned_date: 2026-07-15
sections_studied:
  - "642:3946 (page canvas '    - Label (Tag)' — the ENTIRE page holds exactly one frame; see 'Page is nearly empty' below)"
  - "642:3973 (frame '1. Label', 1363×921 — the whole guide)"
  - "642:3974 (frame 'Title' — on-canvas heading 'Label(Tag)' / subtitle 'QV-NM Label Design Guide')"
  - "642:3981 (frame 'title_' — on-canvas section heading renders 'BASIC' though the TEXT layer is named 'basic'; carries the usage rule)"
  - "642:4001 (frame 'title' — the 'tag_basic' / '라벨로 개발' spec line; note it is named 'title', its sibling is 'title_')"
  - "642:4014 (COMPONENT_SET 'label_risk' — the actual component; internal name does NOT match the on-canvas 'tag_basic' label, see gotcha)"
  - "642:4015 / 642:4017 / 642:4023 (the three Type variants — 강조-NM / 기본 / 강조-QV)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen)
---

# NDS M.web — Label (Tag)

Part of the NDS_M.web file's "🌈 Graphic asset" page group — but unlike its three siblings (Nmoji/Emoji, Infographics, Illusts), this is **not a static asset library**. It documents a real, reusable, variant-driven UI component. That makes it the one page in this group that produces a genuine componentKey + variant-axis fact for the shared Core reference.

Header: **"Label(Tag)"** / subtitle **"QV-NM Label Design Guide"** — i.e. the guide's stated scope is explicitly the QV↔NM channel split, which is exactly what the component's variant axis encodes.

## Page is nearly empty — this is the real state, not a fetch failure

`get_metadata` on the page node `642:3946` returns **one** child frame (`642:3973`), which contains **one** component set with **three** variants. That's the entire page. There is no second section, no do/don't pair, no size table, no dark-mode row. The frame is titled **"1. Label"**, implying a "2. …" was planned, but nothing else exists on the canvas. Treat this guide as **a stub** — accurate as far as it goes, but it does not document states (hover/pressed/disabled), sizing, max text length, or placement rules. Don't infer those from silence; they're genuinely unspecified here.

## The usage rule (verbatim)

Section heading renders on canvas as **BASIC**, with the rule text beside it:

> **BASIC** — "상품 설명, 강조 등에 사용합니다."

That is the **only** stated usage rule on the page. It scopes the component to product descriptions and emphasis — nothing about status, filtering, categorisation, or counts (all common "tag" uses elsewhere). If a screen needs a tag for something other than 상품 설명 / 강조, this guide doesn't authorise it.

Below it, a spec line:

> **tag_basic**   라벨로 개발

**"라벨로 개발"** = "develop as a label" — an explicit implementation instruction to development: render this as a semantic label element, not as a button/chip. Worth carrying forward; it's a hand-off constraint, not a visual note.

## The component: `label_risk` (COMPONENT_SET)

**Key: `e319d3e50229e83b5e39afbf57250f771cf1d289`**

Single variant axis: **`Type`**, with exactly three values — **`강조-NM`**, **`강조-QV`**, **`기본`**.

| Variant | componentKey | Size | Text sample | Font | Stroke (border) | Text color |
|---|---|---|---|---|---|---|
| `Type=기본` | `1c8b4ff792b487ae6dad3be83ea4c2c221a2c8ed` | 51×19 | `일반라벨` | Pretendard Medium **10** | `#E0E0E0` (rgb 0.878×3), opacity **1** | `#666666` (rgb 0.4×3) |
| `Type=강조-NM` | `7928cd0bc780fb1e7b0d7bc0ba0020590dbdd6d9` | 55×23 | `강조형` | Pretendard Medium **15** | `#84C13D` (rgb 0.518/0.757/0.239), opacity **0.6** | `#3C9800` (rgb 0.235/0.596/0) |
| `Type=강조-QV` | `dfd57d78e704a588f45576f53a82f351e2cd91ba` | 55×23 | `강조형` | Pretendard Medium **15** | `#FFAA1A` (rgb 1/0.667/0.102), opacity **0.7** | `#FC6E00` (rgb 0.988/0.431/0) |

Shared across all three variants:
- **`fills: []`** — the label is **transparent-filled, outline-only**. There is no background color on any variant. A filled/solid tag is not part of this component.
- **`cornerRadius: 666`** — i.e. fully rounded (pill). 666 is the designer's "effectively infinite" sentinel; treat it as `border-radius: 999px` / full pill, not a literal 666px.
- Font family is **Pretendard Medium** on every variant (not NanumBarunGothic — that's the headers/buttons font per the Core reference).

### Reading the variant axis correctly

The axis is **not** the usual NDS `Channel` (`NM`/`QV`) property seen elsewhere in NDS_Library. It's a single `Type` axis that **fuses emphasis and channel**:

- **`기본`** = the neutral/default label. It is **channel-agnostic** — there is no `기본-NM` / `기본-QV`. Gray outline, gray text, smaller (10pt text, 19px tall).
- **`강조-NM`** = emphasis label on the **NM** (나무) channel → **green** (the NM brand green `#84C13D`, matching the Core reference's sampled brand primary exactly).
- **`강조-QV`** = emphasis label on the **QV** channel → **orange** (`#FFAA1A` border / `#FC6E00` text).

So the practical rule: pick `기본` for a plain label regardless of channel; pick `강조-NM` or `강조-QV` **only** when emphasising, and then the channel decides the color. Do not try to set a `Channel` property on this component — it doesn't have one; encode the channel in the `Type` value.

Note also that emphasis isn't only a color change — **강조 variants are physically larger** (55×23 with 15pt text vs 기본's 51×19 with 10pt text). That's a 50% jump in font size. Emphasis here means "bigger and colored", not "same box, different color".

## Gotchas

1. **The component set's internal name is `label_risk`, but the on-canvas spec label reads `tag_basic`.** This is the frame-name-vs-visible-heading mismatch already documented in `nds-ux-guide-color-contrast` and `nds-ux-guide-touch-area` — confirmed again here, and it's the worst instance yet, because "risk" and "basic" carry *opposite* connotations. There is nothing risk-related on this page; the only stated use is 상품 설명/강조. `label_risk` is almost certainly a stale name from an earlier iteration. **Search for it by key, not by name** — a name-based lookup for "tag_basic" will find nothing, and finding "label_risk" and assuming it's a risk-disclosure component would be a real error.
2. **Sibling frames named `title_` and `title`.** `642:3981` (`title_`) is the BASIC/usage-rule block; `642:4001` (`title`) is the tag_basic/라벨로 개발 block. The trailing underscore is the only thing distinguishing them, and neither name describes its content. Use node IDs.
3. **`cornerRadius: 666` is a sentinel, not a measurement.** Don't transcribe "666px" into a spec.
4. **No fill on any variant.** If a design shows a solid/filled pill tag, it is not this component.
5. The guide documents **no** disabled/pressed/selected state and **no** dark-mode variant. If a screen needs one, it's undefined by this source — flag it rather than inventing it.

## Candidate for the shared Core reference

This page yields one genuine, verified component-key row (reported to the lead rather than written into `LEADER.md` directly):

| Component | key | Variant axes | Notes |
|---|---|---|---|
| `label_risk` | `e319d3e50229e83b5e39afbf57250f771cf1d289` | `Type` (`기본` / `강조-NM` / `강조-QV`) | Outline-only pill tag (`fills: []`, full radius), Pretendard Medium. Named `label_risk` but on-canvas spec calls it `tag_basic` — nothing risk-related about it. `Type` fuses emphasis + channel: `기본` is channel-agnostic gray/10pt/51×19; `강조-NM` green `#84C13D`/text `#3C9800`; `강조-QV` orange `#FFAA1A`/text `#FC6E00`; both 강조 are 15pt/55×23. Guide states use is 상품 설명/강조 only, and "라벨로 개발" (implement as a label element). From NDS_M.web (`uVcmG6GgOl2J8EOlc22wob`), not NDS_Library — confirm which library a BUILD target subscribes to before relying on the key. |

Two cross-checks against the existing Core reference, both consistent:
- The `강조-NM` border `#84C13D` (rgb 0.518/0.757/0.239) is a **byte-for-byte match** for the Core reference's sampled "Brand primary green (NM channel button fill)". Independent confirmation of that token from a second file.
- The `NM` = 나무 / `QV` = QV channel split noted in Core reference holds here too, just expressed through `Type` values instead of a `Channel` property.

## How this feeds BUILD mode

When generating or reviewing NH MTS M.web screens (via `csdesign` → `nds/LEADER.md` Mode 2) that need a tag/label:

- Import `label_risk` by key `e319d3e50229e83b5e39afbf57250f771cf1d289` (component **set**), then pick the child by `Type=<value>` — the same pattern the Core reference's manual-header workaround uses (`iconSet.children.find(c => c.name === "Type=...")`).
- **Choose the variant by emphasis first, channel second**: plain label → `Type=기본` (no channel choice to make). Emphasised label → `Type=강조-NM` on 나무 surfaces, `Type=강조-QV` on QV surfaces. Defaulting to `NM` matches the Core reference's stated default.
- **Only use it for 상품 설명 / 강조.** For status chips, filters, or counts, this guide gives you no authority — check `tab_2depth_chip` or build manually and flag it.
- Expect an **outline pill with no background** — if your render shows a filled tag, you've either overridden `fills` or grabbed the wrong component.
- Override the label text via the nested TEXT node (named `일반라벨` on `기본`, `강조형` on both 강조 variants — the node name mirrors the sample copy, so it changes per variant; find by type, not by name: `findAllWithCriteria({types:["TEXT"]})`).
- Hand off to development as **"라벨로 개발"** — a label element, not a button/chip.
- Don't shrink the text: the sizes are fixed per variant (10pt on `기본`, 15pt on 강조). There is no size axis.
