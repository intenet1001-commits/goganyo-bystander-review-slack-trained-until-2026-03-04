---
name: nds-mweb-colors
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=303-16"
learned_date: 2026-07-15
sections_studied:
  - "303:16 (page '    - Colors' — two sibling sections: NM_color 1593:595, QV_color 1593:596. Structurally identical mirrors of each other.)"
  - "1593:595 (section 'NM_color' — on-canvas heading 'Namuh Colors - Essential' / 'Namuh Color table by gradation')"
  - "303:112 (NM 'Default' group, 6 swatches — text colors + white)"
  - "303:119 (NM 'Essential-grayscale' group, 7 swatches — backgrounds/surfaces)"
  - "303:132 (NM 'Essential-primary' group, 5 swatches — brand green ramp)"
  - "303:127 (NM 'Essential-line' group, 4 swatches — borders/dividers)"
  - "303:138 (NM 'Essential-others' group, 20 swatches — up/down/flat + 2022home accent ramps)"
  - "1593:596 (section 'QV_color' — on-canvas heading 'QV Colors - Essential' / 'QV Color table by gradation')"
  - "303:189 (QV 'Essential-primary' group, 5 swatches — the channel divergence proof: same slot numbers, orange instead of green)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen)
---

# NDS M.web — Colors (Namuh / QV Essential palettes)

The color foundation for the **NDS_M.web** library (`uVcmG6GgOl2J8EOlc22wob`). This is the single highest-value page learned so far for BUILD work, because it **decodes the cryptic NDS color-style naming scheme** that the domain's Core reference currently flags as undecodable ("names are cryptic numeric codes … Faster to sample colors directly off existing component instances than to decode style names"). In this file the style names carry Korean semantic suffixes and the on-canvas table gives a plain-Korean role description for every swatch.

The page is two mirrored sections — `NM_color` (나무/Namuh channel) and `QV_color` (QV channel) — with **identical structure, identical slot numbers, and different hex values**. This is the concrete meaning of the `Channel` variant property (`NM` / `QV`) that the Core reference notes appears across many components.

No frame-name/heading mismatch on this page: both section layer names (`NM_color`, `QV_color`) agree with their on-canvas headings ("Namuh Colors - Essential", "QV Colors - Essential").

## The style-name grammar (decoded)

Style names read directly off `get_design_context`:

```
<Channel>/<Group>/<SlotIndex>.<ColorNumber>(<Korean semantic name>)
```

Worked examples:

| Full style name | Hex |
|---|---|
| `NM/Default/2.023` | `#333333` |
| `NM/ESS/primary/2.022(대표컬러)` | `#84C13D` |
| `NM/ESS/line/3.025(리스트구분선)` | `#F0F0F0` |
| `QV/ESS/primary/2.022(대표컬러)` | `#FFAA1A` |

So the previously-opaque `NM/Primary/270.274` shape from the Core reference is **`<slot>.<colorNumber>`** — two different numbers, not one code. The **ColorNumber** (`022`, `023`, `274`…) is the stable, channel-independent identity the design team uses in conversation ("컬러넘버"); the **SlotIndex** is just this table's row order within its group. `ESS` = Essential.

**Critical**: the ColorNumber is **not** a hex. The same number resolves to different hexes per channel — `022` is `#84C13D` on NM and `#FFAA1A` on QV. A ColorNumber is only meaningful with a channel attached.

## NM (나무/Namuh) — Default group (`303:112`)

Text colors. On-canvas group label: "Default".

| Style name | Color# | Korean role (verbatim) | Hex |
|---|---|---|---|
| `NM/Default/1.004` | 004 | 글자 기본 | `#000000` |
| `NM/Default/2.023` | 023 | 글자 GrayDark | `#333333` |
| `NM/Default/3.013` | 013 | 글자 보조 | `#666666` |
| `NM/Default/4.024` | 024 | 글자 Gray Mid | `#999999` |
| `NM/Default/5.074(HintText)` | 074 | 글자 GrayLight | `#C5C5C5` |
| `NM/Default/6.063` | 063 | 기본글자색White | `#FFFFFF` |

## NM — Essential-grayscale group (`303:119`)

Surfaces and backgrounds.

| Style name | Color# | Korean role (verbatim) | Hex |
|---|---|---|---|
| `NM/ESS/grayscale/1.296(홈상단배경)` | 296 | 2022home_상단배경 | `#2C363B` |
| `NM/ESS/grayscale/2.298(탭활성화)` | 298 | 2022home_tab활성화배경 | `#2C363B` |
| `NM/ESS/grayscale/3.245(다크블루그레이)` | 245 | 3단홈_글자_GrayDark3 | `#4E5255` |
| `NM/ESS/grayscale/5.297(bg배경)` | 297 | 2022home_컨텐츠배경 | `#EBEDF1` |
| `NM/ESS/grayscale/6.066(테이블헤더배경)` | 066 | 테이블헤더배경색 | `#F7F7F7` |
| `NM/ESS/grayscale/7.051(그레이박스)` | 051 | 그리드셀블록배경색 | `#F9F9F9` |
| `NM/ESS/grayscale/8.299(탭비활성화)` | 299 | 2022home_tab비활성화배경 | `#FFFFFF` @ 80% (`#FFFFFF:80`) |

**Gotchas in this group:**
- **Slot 4 is missing** — the group runs 1,2,3,**5**,6,7,8. Either a retired token or a numbering slip; either way don't assume slot indices are contiguous.
- **Slots 1 and 2 are the same hex** (`#2C363B`) under different ColorNumbers (296 vs 298) and different roles (홈상단배경 vs 탭활성화배경). They are distinct *tokens* that currently happen to share a value — bind to the right semantic one, don't dedupe them.
- **Slot 8's swatch label is `#FFFFFF:80`** — the guide's own notation for "this hex at 80% opacity". Expect the `<hex>:<alpha%>` convention throughout this file.

## NM — Essential-primary group (`303:132`)

The brand green ramp.

| Style name | Color# | Korean role (verbatim) | Hex |
|---|---|---|---|
| `NM/ESS/primary/1.272(강조텍스트)` | 272 | Mydata_필수타이틀 색상 | `#3C9800` |
| `NM/ESS/primary/2.022(대표컬러)` | 022 | QV_Nm (Yellow-Green) | `#84C13D` |
| `NM/ESS/primary/3.107(버튼비활성화)` | 107 | QV_Nm (Yellow-Green) 비활성 글자색 | `#84C13D` @ 60% (`#84C13D:60`) |
| `NM/ESS/primary/4.100(중간강조)` | 100 | QV_Nm Light 배경 | `#F0FAE5` |
| `NM/ESS/primary/5.273(툴팁배경)` | 273 | Mydata_툴팁 배경색 | `#F9FDF4` |

**`NM/ESS/primary/2.022(대표컬러)` = `#84C13D` is the canonical brand green** — "대표컬러" literally means "representative colour". This **independently confirms** the Core reference's sampled value (`rgb(0.518, 0.757, 0.239)` ≈ `#84C13D`) and, better, gives it a real name and style path instead of a sampled approximation.

Note the disabled-button token is **not a separate grey** — it's the brand green at 60% (`3.107`). Same for QV (at 70%, see below): the alpha differs per channel.

## NM — Essential-line group (`303:127`)

Borders and dividers. This group's Korean roles are the most directly actionable in the whole page.

| Style name | Color# | Korean role (verbatim) | Hex |
|---|---|---|---|
| `NM/ESS/line/1.016(테이블상단구분선)` | 016 | 테두리 Gray Mid | `#ADADAD` |
| `NM/ESS/line/2.017(박스테두리)` | 017 | 테두리 Gray Mid Light | `#E0E0E0` |
| `NM/ESS/line/3.025(리스트구분선)` | 025 | 테두리 Gray Light | `#F0F0F0` |
| `NM/ESS/line/4.087(섹션구분선)` | 087 | 그리드선택배경색 | `#F5F5F5` |

The style-name suffix gives a clean line hierarchy: **table top rule (016, darkest) → box border (017) → list row divider (025) → section divider (087, lightest)**.

Note slot 4's two names disagree: the style suffix says `섹션구분선` (section divider) but the on-canvas role says `그리드선택배경색` (grid selected-row *background*). Same token, border-vs-fill descriptions. Treat `#F5F5F5` as usable for both, but be aware the guide is internally inconsistent about which.

## NM — Essential-others group (`303:138`)

20 swatches: market up/down/flat semantics, then four 3-step accent ramps for the "2022home" surface.

| Style name | Color# | Korean role (verbatim) | Hex |
|---|---|---|---|
| `NM/ESS/others/1.238` | 238 | 3단홈_상승_Red | `#D73838` |
| `NM/ESS/others/2.239` | 239 | 3단홈_하락_Blue | `#247EF2` |
| `NM/ESS/others/3.003` | 003 | 보합 | `#009F83` |
| `NM/ESS/others/4.056` | 056 | 배경 RedLight | `#FFF8F9` |
| `NM/ESS/others/5.057` | 057 | 배경 BlueLight | `#F4F9FF` |
| `NM/ESS/others/6.303` | 303 | 2022home_BG_origin | `#008E7E` |
| `NM/ESS/others/7.304` | 304 | 2022home_BG_medium | `#73D1A8` |
| `NM/ESS/others/8.305` | 305 | 2022home_BG_light | `#DCFBD9` |
| `NM/ESS/others/9.306` | 306 | 2022home_OP_origin | `#FFA569` |
| `NM/ESS/others/10.307` | 307 | 2022home_OP_medium | `#FFCD96` |
| `NM/ESS/others/11.308` | 308 | 2022home_OP_light | `#FFF0E0` |
| `NM/ESS/others/12.309` | 309 | 2022home_purple_origin | `#7762DE` |
| `NM/ESS/others/13.310` | 310 | 2022home_purple_med | `#B5B3F2` |
| `NM/ESS/others/14.311` | 311 | 2022home_purple_light | `#EEEBF5` |
| `NM/ESS/others/15.312` | 312 | 2022home_skyb_origin | `#6FADFF` |
| `NM/ESS/others/16.313` | 313 | 2022home_skyblue_med | `#ADD1FF` |
| `NM/ESS/others/17.314` | 314 | 2022home_skyblue_light | `#E8F2FF` |
| `NM/ESS/others/18.315` | 315 | 2022home_copink_origin | `#FF7D80` |
| `NM/ESS/others/19.316` | 316 | 2022home_copink_med | `#FDB2AC` |
| `NM/ESS/others/20.317` | 317 | 2022home_copink_light | `#FFEDEC` |

**This group has no Korean semantic suffixes on its style names** (just `NM/ESS/others/1.238`, no parenthetical) — unlike every other group. The on-canvas role text is the only semantic source here, which makes `get_design_context` on `303:138` mandatory rather than optional for these.

**Market-direction colors (238/239/003) corroborate `nds-ux-guide-updown-notation`** from the sibling file: 상승 = red, 하락 = blue, 보합 = a green/teal. This is the Korean-market convention (reversed vs US). That note recorded the convention qualitatively; this page pins the exact hexes: **상승 `#D73838`, 하락 `#247EF2`, 보합 `#009F83`**. Paired tinted backgrounds exist for up/down only (056 RedLight / 057 BlueLight) — **there is no flat/보합 background tint**, so don't invent one.

The four accent ramps (`BG` teal-green, `OP` orange, `purple`, `skyb`/`skyblue`, `copink`) are each a consistent **origin → medium → light** triple. Naming is sloppy across them — `skyb_origin` vs `skyblue_med`, `purple_med` vs `OP_medium` — so match by ColorNumber, not by string-matching the role text.

## QV channel (`1593:596`)

Structurally an exact mirror: same five groups, same slot indices, same ColorNumbers, same Korean role text — **different hexes**. Verified on the primary group (`303:189`):

| Style name | Color# | Hex (QV) | Hex (NM, for contrast) |
|---|---|---|---|
| `QV/ESS/primary/1.272(강조텍스트)` | 272 | `#FC6E00` | `#3C9800` |
| `QV/ESS/primary/2.022(대표컬러)` | 022 | `#FFAA1A` | `#84C13D` |
| `QV/ESS/primary/3.107(버튼비활성화)` | 107 | `#FFAA1A:70` (70%) | `#84C13D:60` (60%) |
| `QV/ESS/primary/4.100(중간강조)` | 100 | `#FFF4E5` | `#F0FAE5` |
| `QV/ESS/primary/5.273(툴팁배경)` | 273 | `#FFF9F0` | `#F9FDF4` |

**QV's brand colour is orange `#FFAA1A`, not green.** This is the single most important fact on the page for BUILD work: picking the wrong `Channel` doesn't just shift a hue slightly, it changes the entire brand identity of the screen.

**Copy-paste artifact (confirmed)**: QV's on-canvas role text for slot 2 still reads **"QV_Nm (Yellow-Green)"** even though the swatch is orange `#FFAA1A`. The role text was copied wholesale from the NM table and never updated. Same for `107` ("QV_Nm (Yellow-Green) 비활성 글자색") and `100` ("QV_Nm Light 배경"). **Trust the hex and the style-name suffix (`대표컬러`), not the role text, in the QV table.** Note the disabled alpha genuinely differs (70% vs NM's 60%) — that part is not a copy-paste slip.

## How this feeds BUILD mode

- **Decide the `Channel` first — NM or QV — before any color work.** `NM` = 나무/Namuh (green, `#84C13D`), `QV` = QV (orange, `#FFAA1A`). Core reference's "default to `NM` unless the target screen is explicitly a QV surface" still holds; this page shows what's at stake if you get it wrong.
- **The Core reference's "sample colors off instances rather than decode style names" workaround is no longer necessary for this file.** Style names here are `<Channel>/<Group>/<Slot>.<Number>(<Korean name>)` and are directly readable via `get_design_context`. Sampling is still the right move for `NDS_Library`/`NDS_Colors` in other files where the semantic suffix may be absent.
- **Reach for tokens by role, not by eyeballing a hex:**
  - Body ink → `NM/Default/2.023` `#333333` (matches Core reference's sampled "Body ink" exactly)
  - Secondary text → `NM/Default/3.013` `#666666`; hint/placeholder → `NM/Default/5.074(HintText)` `#C5C5C5`
  - Primary CTA fill → `NM/ESS/primary/2.022(대표컬러)` `#84C13D`; its disabled state → same green at **60%**, not a grey
  - List row divider → `NM/ESS/line/3.025` `#F0F0F0`; box border → `NM/ESS/line/2.017` `#E0E0E0`; table top rule → `NM/ESS/line/1.016` `#ADADAD`
  - Table header fill → `NM/ESS/grayscale/6.066` `#F7F7F7`; page/content bg → `NM/ESS/grayscale/5.297` `#EBEDF1`
  - 상승/하락/보합 → `#D73838` / `#247EF2` / `#009F83`, with tinted row backgrounds `#FFF8F9` / `#F4F9FF` for up/down only
- **Handle the `:NN` alpha notation explicitly.** `#84C13D:60` means the paint is `{type:'SOLID', color: <#84C13D in 0–1 range>, opacity: 0.6}` — opacity lives at the *paint* level, never as an `a` field inside `color` (see `figma-use` pre-flight checklist).
- **Never treat a ColorNumber as portable across channels.** "컬러넘버 022" is ambiguous on its own; always qualify it (`NM 022`).
- Contrast-check anything you build against `nds-ux-guide-color-contrast`'s 4.5:1 / 3:1 thresholds — note e.g. `#C5C5C5` hint text and the 60%-alpha disabled green will not pass 4.5:1 on white, which is expected for those roles but worth not accidentally reusing for body copy.
