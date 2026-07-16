---
name: nds-lib-title
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=50814-3570"
learned_date: 2026-07-16
sections_studied:
  - "50814:3570 (page '    - Title  타이틀' — the canvas itself)"
  - "50819:7265 (frame LAYER-NAMED '1. List' but whose ON-CANVAS heading is 'Title' / subtitle 'QV-NM Lists Design Guide' — the actual title guide)"
  - "50819:7351 (section 'title_' — on-canvas heading 'DEFAULT' / '기본적인 타이틀일때 사용합니다.')"
  - "50819:7374 (COMPONENT_SET 'Title_default' — 10 variants; the only real component set on this page)"
  - "50819:7312 / 50819:7345 (column headings 'BASIC 기본형' and 'INFOGRAPHIC 아이콘/인포그래픽 강조형')"
  - "50852:16314 (standalone COMPONENT 'Title_default/<0x08>강조형/off' — parented to the PAGE, not to any set)"
status: "live — sole COMPONENT_SET `Title_default` (50819:7374) is a well-formed 3-axis set with 10 populated variants and a clean on-canvas DEFAULT guide section. NO `Last update` stamp and NO usage panel exist on this page (unlike the sibling List/Card pages), so freshness is unverifiable from the page itself."
---

# NDS Library — Title (타이틀)

The section-title component for the **NDS_Library** file (`72zrHgMLM4zhCjgSuTf7cC`). One component set, `Title_default`, covers every in-page section heading: a text label at one of three sizes, optionally preceded by an icon/infographic and optionally followed by a tooltip button or a chevron.

## ⚠️ Name reliability on THIS page: MIXED — and the top-level frame name is a lie

**Determined by screenshotting `50819:7265`.** Verdict per layer tier:

| Tier | Reliable? | Evidence |
|---|---|---|
| The guide frame's own layer name | **NO** | Layer is named **`1. List`**; the on-canvas heading renders **`Title`**. The subtitle renders `QV-NM Lists Design Guide` — still says *Lists*. This page was cloned from the List page and the frame name + subtitle were never updated. |
| Section / column headings | **YES** | `title_` → "DEFAULT", `Basic`/`기본형`, `Infographic`/`아이콘/인포그래픽 강조형` all match their rendered text. |
| Variant names | **YES** | `Type=Basic24, Tooltip=off, Arrow=off` etc. match `variantProperties` exactly (verified via read-only `use_figma`). |
| TEXT leaf names | **N/A — they ARE the copy** | The demo strings *are* the layer names here, and they are placeholders (see below). |
| The standalone component name | **NO — contains a control character** | See the `\x08` section below. |

**Do not cite `1. List` or `QV-NM Lists Design Guide` as evidence of anything.** They are stale artifacts of a page duplication.

**No rules are embedded in pasted screenshot images on this page.** Everything rule-bearing is live vector/text. (This is unlike the Chart page, which is full of pasted images.)

## The one component set

`Title_default` — **COMPONENT_SET**, id `50819:7374`.

```
SET key: 494ca307ba3ee737a4d274136ccbba1d7bea380b   ← use this for importComponentSetByKeyAsync
```

Three variant axes (read off `variantGroupProperties`, so these are exact):

| Axis | Values |
|---|---|
| `Type` | `Basic21`, `Basic24`, `Basic26`, `icon21`, `icon24`, `icon26` |
| `Tooltip` | `on`, `off` |
| `Arrow` | `on`, `off` |

**The number in `Type` is the font size in px.** Verified directly: variant `Type=Basic21` (`50819:10584`) contains a single TEXT node with `fontSize: 21`. So `Basic21`/`icon21` = 21px, `24` = 24px, `26` = 26px. The `Basic` vs `icon` prefix selects whether a 32–40px icon/infographic instance precedes the label.

### The set is SPARSE — 10 of 24 combinations exist

6 × 2 × 2 = 24 possible; only **10** components are populated. This matters: asking for a combination that doesn't exist will not resolve.

| Type | Tooltip=off, Arrow=off | Tooltip=off, Arrow=on | Tooltip=on, Arrow=off | Tooltip=on, Arrow=on |
|---|---|---|---|---|
| `Basic21` | ✅ `1ee95a9d9324eedaec2ceb0db32b4b5215b21967` | ✅ `7a1a9986f1fd4a6f731c1224ca85040ec7523d13` | ✅ `1c2669385da0ad538900ae078f06f90ef0a8e1a4` | ❌ |
| `Basic24` | ✅ `c6c7546e04a89f6432b1436467f01cff1c069277` | ✅ `f2277e391bf4e6d72e3f8372ba54435036f3831c` | ❌ | ❌ |
| `Basic26` | ✅ `051ee976fc7cbd99d696f8939932fb455785197a` | ✅ `8513fbf8922432268dcc0e96f8f0c8bdf73593c9` | ❌ | ❌ |
| `icon21` | ✅ `b757092bd87656587263be6789fb9d0eafdc97ea` | ❌ | ❌ | ❌ |
| `icon24` | ✅ `57a6f151307e80f6a0b959a49758d1a83c077b89` | ❌ | ❌ | ❌ |
| `icon26` | ❌ | ✅ `56539b79725207ee5f4a17df2b299635d8a2c985` | ❌ | ❌ |

Keys above are **variant COMPONENT keys** (for `importComponentByKeyAsync`), NOT the set key. All 40-hex, none truncated.

**Two consequences worth internalising:**
- **`Tooltip=on` exists ONLY on `Basic21`.** There is no 24px or 26px tooltip title, and no icon title with a tooltip at all. If a design calls for "26px title with a tooltip", the library does not have it — that is a genuine gap, not a lookup failure.
- **`icon26` has no `Arrow=off` variant** — it exists *only* with the arrow on. Conversely `icon21`/`icon24` exist only with the arrow *off*. So the icon row is inconsistent: you cannot get an arrow-less `icon26` or an arrowed `icon21`/`icon24` from this set.

## The `\x08` orphan component

`50852:16314` is a **COMPONENT** (not a set, not an instance) parented **directly to the PAGE**, sitting outside the guide frame entirely.

```
name: "Title_default/<0x08>강조형/off"      ← contains a literal backspace (U+0008) before 강조형
COMPONENT key: 3fdf3f4a7fe34cfa43278362d0aa963fb22bf40f
kind: standalone COMPONENT (has NO parent COMPONENT_SET — parent is the page)
```

Screenshotting it (540×78) renders: **🌱 주식 모으기** on the left, **123회차 ›** on the right — a 26px infographic title with a right-aligned round-counter, i.e. the "강조형" (emphasis) title.

Classification: **(c) unpublished export scaffolding / page-local orphan.** It duplicates the `Title_default` slash-namespace in its *name* but is not a member of the set, so `Title_default` cannot produce it via variant properties. Treat it as an un-adopted one-off. The `\x08` in its name means any string comparison against `"Title_default/강조형/off"` will silently fail — match on the key, never the name.

> This is the same `\x08` pathology the domain already recorded elsewhere in this file. On the **Card** page it appears in *variant property names* (`\x08Fold`, `Type\x08`, `\x08Select`), where it is far more damaging. See `nds-lib-card.md`.

## The demo copy is placeholder — do NOT record it as product strings

Every string inside the `Title_default` variants is lorem-ipsum:

| String (verbatim) | Why it's a placeholder |
|---|---|
| `21 타이틀` / `24 타이틀` / `26 타이틀` | Literally "21 title" — the size number as copy. Self-describing filler. |
| `주식 모으기` (orphan component) | A plausible product name, but it's demo content inside a doc component. |
| `123회차` (orphan component) | "123rd round" — sequential filler. |

There is **no real product copy on this page.** The page documents structure and size, not wording.

## Layout facts read off the canvas

- **Two width contexts are labelled on the right rail**: `normal (w:540)` at `50819:7370` and `in card (W : 492)` at `50819:7366`. 540 = full mobile width; 492 = 540 minus the card's 24px side margins.
- **⚠️ The `in card (W : 492)` rail label has NOTHING next to it.** The label renders (greyed) at y≈1057 but the `Title_default` set only populates the `normal` band. **Blank at source — the 492 in-card title row was never built.** Do not infer that in-card titles are unsupported; infer only that this page doesn't show them. (Contrast the List and Card pages, which *do* populate both `in Card=on`/`off`.)
- Variants are laid out in two columns inside the set: **BASIC at x≈20**, **INFOGRAPHIC at x≈960**.
- Basic21 = 50px tall, Basic24 = 54px, Basic26 = 58px, icon21 = 50px, icon24 = 64px, icon26 = 78px.

## How this feeds BUILD mode

- **Import by SET key `494ca307ba3ee737a4d274136ccbba1d7bea380b`**, then set `Type` / `Tooltip` / `Arrow`. Check the sparse-matrix table above *before* choosing a combination — 14 of 24 will not resolve.
- **Pick `Type` by required font size, not by vibe**: 21 / 24 / 26 px are the only three. Prefix `Basic` for a text-only heading, `icon` when an infographic must lead.
- **`Arrow=on` implies a touch target.** In the surrounding page examples (e.g. `50819:6583`) the chevron is wrapped in a `touch_area` frame of 38×38 with a 24×24 `nds_icon_arrow` inset at 7,7. Reproduce that padding rather than placing a bare 24px icon.
- **Don't reach for the `\x08강조형` orphan** (`3fdf3f4a…`) unless you specifically need the title-with-counter. It is not part of the set and is not variant-addressable.
- **Keys are `unverified` for publish state.** This was a read-only session; components in this file are `remote: false` because this *is* the library file — that is expected and is NOT evidence they're unpublished. `Title_default` has the structure of a real published set (clean 3-axis set, section-documented). The orphan does not.
