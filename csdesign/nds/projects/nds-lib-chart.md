---
name: nds-lib-chart
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=17535-15607"
learned_date: 2026-07-16
sections_studied:
  - "17535:15607 (page '    - Chart  차트(그래프)' — the canvas itself; get_metadata OVERFLOWED at 79,803 chars and was auto-saved, parsed with a python indent parser)"
  - "24496:9081 (frame 'Chart_color usage' — on-canvas heading '🔥 필수 🔥 차트 쓰실 디자이너들! 확인하세요!' — THE most important section on the page: the 18-swatch chart palette)"
  - "23756:3683 (frame '1. Pie Chart' — on-canvas heading 'Pie Chart'; DONUT / semi circle donut / pie)"
  - "24523:11562 (frame '2. Line Chart' — on-canvas 'Line Chart'; line graph / area graph)"
  - "30225:5881 (frame '3. Bar Chart' — on-canvas 'Bar Chart'; bar graph / column graph)"
  - "30225:6198 (frame '4. Stock Chart' — LAYER SAYS 'Stock Chart', ON-CANVAS HEADING SAYS 'Combination'; candlestick / column graph)"
  - "75827:27433 (frame '5. Tree Map' — on-canvas 'Tree Map'; carries the 7-band 등락 diverging scale)"
  - "24523:11781 (frame '99. Legend' — on-canvas 'Legend 범례'; bottom / icon / Side / List)"
  - "24512:11475 (COMPONENT_SET for gauge — parented to the PAGE, not to any section)"
status: "live — 12 component sets across 6 documented sections, a 🔥필수🔥-flagged palette section, and a fully-specified Tree Map colour scale. NO `Last update` stamp and NO usage panel exist on this page; freshness is unverifiable from the page itself. Node ids up to 81858:* indicate edits well after the 2023-02 stamps on List/Card."
---

# NDS Library — Chart (차트/그래프)

The charting family for the **NDS_Library** file (`72zrHgMLM4zhCjgSuTf7cC`). Six sections: **Pie**, **Line**, **Bar**, **Stock (Combination)**, **Tree Map**, **Legend** — plus a gauge set orphaned at page level and a mandatory colour-palette section.

`get_metadata` on this page **overflowed (79,803 chars)** and was auto-saved; I parsed the dump with a Python line/indent parser (not ElementTree — the dump is non-strict XML and contains unescaped `&`).

## ⚠️ Name reliability on THIS page: MIXED — every section subtitle is a lie

**Determined by screenshotting `24496:9081`, `75827:27433`, and the embedded images.**

| Tier | Reliable? | Evidence |
|---|---|---|
| **Section subtitles** | **NO — all five are identical copy-paste** | Pie, Line, Bar, Stock, and Legend **all** carry the subtitle **`QV-NM Filter Select Box Design Guide`**. The whole page was cloned from a Filter/Select-Box page. |
| **`4. Stock Chart` frame name** | **NO** | Layer says `Stock Chart`; the on-canvas heading renders **`Combination`**. |
| **`3. Bar Chart` / `4. Stock Chart` section descriptions** | **NO** | Both `title_` blocks say `line` / `일정 기간에 따른 데이터 추세를 표시할때 사용합니다.` — a **Line-chart** description sitting on the Bar and Stock pages. Copy-paste, never rewritten. |
| Palette swatch names | **YES — verified** | Screenshotted: every swatch's rendered colour matches its `FF5252`-style layer name and its `(255,82,82)` rgb caption. |
| Tree Map band colours | **YES — verified twice** | Layer-name rgb captions match the fills I sampled directly. |
| Set names | **MOSTLY** | Two defects: an auto-named `Frame 125473`, and **three distinct sets all named `Line_chart01`**. |

**⚠️ Rules ARE embedded in pasted screenshot images on this page — but they are NOT NDS rules.** Five `스크린샷 2024-03-26/04-02`-named images are pasted in (`32784:5666`, `32784:5668`, `32784:5670`, `32784:5671`, `32784:5672`, `33041:6364`, `33041:6366`). I screenshotted them: they are **third-party Highcharts.com documentation captures** ("Major trophies for some English teams", "Column chart with negative values"), complete with Highcharts branding and their own blue/purple/green palette that **does not match the NDS chart palette at all**. They are developer reference material, not design rules. **Do not transcribe their colours or treat them as NDS guidance.**

## 🔥 The chart palette (`24496:9081`) — the page's headline

On-canvas heading, verbatim: **`🔥 필수 🔥 차트 쓰실 디자이너들! 확인하세요!`** ("🔥 MANDATORY 🔥 Designers using charts! Check this!")

Nine primary categorical colours, in canvas order:

| # | Hex | RGB (as captioned) |
|---|---|---|
| 1 | `#FF5252` | (255,82,82) |
| 2 | `#FF7F3E` | (255,127,62) |
| 3 | `#FBBE2C` | (251,190,44) |
| 4 | `#52C750` | (82,199,80) |
| 5 | `#008B8B` | (0,139,139) |
| 6 | `#0093FF` | (0,147,255) |
| 7 | `#4247D8` | (66,71,216) |
| 8 | `#9270DA` | (146,112,218) |
| 9 | `#DA6FD6` | (218,111,214) |

Then a divider and the label **`다음 컬러셋 opacity 60%`** ("next colour set: opacity 60%"), followed by nine more:

| # | Hex | RGB (as captioned) |
|---|---|---|
| 10 | `#66BEFF` | (102,190,255) |
| 11 | `#66B9B9` | (102,185,185) |
| 12 | `#97DD96` | (151,221,150) |
| 13 | `#FDD880` | (253,216,128) |
| 14 | `#FFB28B` | (255,178,139) |
| 15 | `#FF9797` | (255,151,151) |
| 16 | `#E9A9E6` | (233,169,230) |
| 17 | `#BEA9E9` | (190,169,233) |
| 18 | `#8E91E8` | (142,145,232) |

Closing note, verbatim (`24496:9122`, a 😈-marked card): **`이 컬러셋을 벗어나서 추가로 컬러가 더 필요하면 논의 후 추가하도록 합시다.`** ("If you need colours beyond this set, let's discuss before adding.")

### The second set is the first set at 60% over white — and the order is REVERSED

The label says "opacity 60%" but gives **pre-flattened hexes**. I verified the arithmetic for all nine (`0.6·c + 0.4·255`), and every one is exact:

| Primary | @60% over white | = Secondary | Secondary index |
|---|---|---|---|
| #6 `#0093FF` | 0.6·(0,147,255)+102 → (102,190,255) | `#66BEFF` | 10 |
| #5 `#008B8B` | → (102,185,185) | `#66B9B9` | 11 |
| #4 `#52C750` | → (151,221,150) | `#97DD96` | 12 |
| #3 `#FBBE2C` | → (253,216,128) | `#FDD880` | 13 |
| #2 `#FF7F3E` | → (255,178,139) | `#FFB28B` | 14 |
| #1 `#FF5252` | → (255,151,151) | `#FF9797` | 15 |
| #9 `#DA6FD6` | → (233,169,230) | `#E9A9E6` | 16 |
| #8 `#9270DA` | → (190,169,233) | `#BEA9E9` | 17 |
| #7 `#4247D8` | → (142,145,232) | `#8E91E8` | 18 |

**The mapping is 6,5,4,3,2,1,9,8,7 → 10..18 — not 1→10, 2→11.** So "the 60% version of primary #1" is **secondary #15**, not #10. Don't assume positional correspondence.

**Two ways to use it, and they are not equivalent:** you can set `opacity: 0.6` on the primary paint (renders identically *only over white*), or use the flattened hex (renders identically over *any* background). Over the blue-grey card background the two diverge. **Prefer the flattened hex.**

### ⚠️ The chart palette is NOT the up/down palette

Chart red `#FF5252` ≠ 상승 `#D73838`. Chart blue `#0093FF` ≠ 하락 `#247EF2`. Chart green `#52C750` ≠ 보합 `#009F83`.

**These are categorical series colours — they carry no market-direction semantics.** Using `#FF5252` for a rising series is fine; using it *because* it's red and the number is up is a category error. The only place on this page where colour encodes direction is the Tree Map.

## 🚨 Tree Map (`75827:27433`) — a 7-band diverging 등락 scale that CONTRADICTS the domain's 보합

On-canvas: **`TREE MAP`** / `구성 비율을 직관적으로 비교할 때 사용합니다. 적용 예시 : 지수상세 - 상위구성 종목`

I read the rgb captions **and** sampled every band's actual fill via read-only `use_figma`. They agree exactly:

| Band (verbatim) | Caption | Sampled fill | Domain equivalent |
|---|---|---|---|
| `+30% ~ (상한가)` | RGB 163/44/48 | **`#A32C30`** | — |
| `+10% ~ +29.99%` | RGB 204/69/73 | **`#CC4549`** | — |
| `+1% ~ +9.99%` | RGB 237/92/95 | **`#ED5C5F`** | — |
| `-0.99% 0.00% +0.99%` | RGB 166/169/183 | **`#A6A9B7`** | ❌ **domain says 보합 = `#009F83` (green)** |
| `-9.99% ~ -1%` | RGB 2/145/255 | **`#0291FF`** | ≠ `#247EF2` |
| `-29.99% ~ -10%` | RGB 2/123/217 | **`#027BD9`** | — |
| `~ -30% (하한가)` | RGB 3/89/156 | **`#03599C`** | — |

**Direction agrees with the domain (up = red, down = blue — the Korean convention). Magnitude is encoded by darkness. But 보합 is GREY `#A6A9B7`, not green `#009F83`.**

This is a **genuine contradiction of the domain's recorded `보합=green #009F83`**, and it is deliberate, not a slip: in a treemap the flat band is a large neutral area, and a saturated green would read as a third *category* rather than as "no change". Rendered proof on canvas: `*SK하이닉스 -0.41%` sits in the flat band and renders grey.

**Resolution: `보합 = #009F83` holds for list/row/text contexts (where the colors page defines it). Tree Map overrides it with `#A6A9B7`. Neither is wrong — the convention is context-scoped.** None of the seven Tree Map hexes appear in the `nds-mweb-colors` NM palette; this scale is Tree-Map-local. Logged to LEDGER.

## Component sets

All keys are **SET keys**. Full 40-hex, none truncated.

| Set | Section | SET key | Axes | n |
|---|---|---|---|---|
| `chart_donut_240` | 1. Pie Chart | `37223b19d81f1a1f965ee72efac073983cd17c5d` | `Percent`(on/off) × `Legend`(4/6) × `Tooltip`(off/on) | 6 |
| `chart_donut_160` | 1. Pie Chart | `b67ce0f14a2784fc9c451634c8dcd909214d245c` | `tooltip`(off/on) | 2 |
| `chart_semidonut_240` | 1. Pie Chart | `ab7e251e09d6d3dba203b95a74d2099549fd48e2` | `Tooltip`(off/on) | 2 |
| `chart_pie_240` | 1. Pie Chart | `21d7ed9fe21e781b68718f8c9c4efb1c20744669` | `Property 1`(Default/Variant2) ⚠️ | 2 |
| **`Frame 125473`** (gauge) ⚠️ | **page-level** | `590b5533f19ea8dba190a7f616f1ddef4d3da1f5` | **`\x08Type`**(detailed/full) ⚠️ | 2 |
| `nds_img_chart_legend` | 99. Legend | `0c88e552434f9421e26f574d5801486ce92a853c` | `Color`(01…06, 00, Color8) ⚠️ | 8 |
| `Line_chart02` | 2. Line Chart | `329f948c5da2f3937a12eb305c59e3978dfdfece` | `tooltip`(off/on) | 2 |
| **`Line_chart01`** (a) | 2. Line Chart | `57fbb0a6b49a524a6ae2014ffc43e62706661333` | `tooltip`(off/on) | 2 |
| **`Line_chart01`** (b) | 2. Line Chart | `9017fe3434fdf7e41f2c907248ebe8f8480dc32c` | `tooltip`(on/off) | 2 |
| **`Line_chart01`** (c) | 2. Line Chart | `75046997c6f7d52f5551925b0faad5798e04ad1d` | `tooltip`(off/on) | 2 |
| `chart` | 4. Stock Chart | `f45dc0d7828eac3bf2452abd9879524edbf6e6c2` | `tooltip`(off/on) | 2 |
| `treemap` | 5. Tree Map | `505f28ccaf6fc631b9aed97e10e34a18237b0eed` | `Property 1`(Multiple/Single) ⚠️ | 2 |

### Naming defects worth knowing before you import

- **🚨 THREE distinct sets share the name `Line_chart01`** (`57fbb0a6…`, `9017fe34…`, `75046997…`), all in `2. Line Chart`, all with a `tooltip` axis. Their on-canvas labels distinguish them (`2 data` / `1 data`, two pairs), but **the name does not.** Name-based lookup will silently grab the wrong one. **Import by key.** Logged to LEDGER.
- **`Frame 125473`** (gauge, `24512:11475`) — auto-named, **and parented directly to the PAGE**, not to any section frame. Its only on-canvas label is the loose text `gauge` (`24512:10204`). Its property is **`\x08Type`** — a literal U+0008 backspace before `Type` (same pathology as the Card page's `\x08Fold` / `Type\x08` / `\x08Select`). **Never hand-type `Type` for this set** — read `variantGroupProperties` and use the returned key verbatim.
- **`Property 1`** on `chart_pie_240` and `treemap` — Figma's default unnamed-property placeholder, never renamed. `chart_pie_240`'s values `Default`/`Variant2` are also placeholders and say nothing about what differs.
- **`nds_img_chart_legend`'s `Color` values are `01, 02, 03, 04, 05, 06, 00, Color8`** — six clean two-digit values, plus a `00` and a `Color8` that break the scheme. 8 swatch components for an 18-colour palette; the mapping from `Color=NN` to a palette hex is **not documented on canvas — blank at source.**

## Section inventory (on-canvas headings, verbatim)

- **`1. Pie Chart`** → `Pie` / `전체 데이터중 구성 데이터를 서로 비교하는 목적으로 사용합니다.`
  - `DONUT graph` / **`00%이상의 범례에만 그래프 안에 퍼센트를 표시합니다.`** — ⚠️ note the literal `00%`: the threshold was **never filled in**. Blank at source. The rule ("show the in-graph percentage only for legend items above N%") exists but N is unspecified. Ask a designer.
  - Sub-labels: `DONUT` (240 and 160 sizes), `semi circle donut`, `pie`.
- **`2. Line Chart`** → `line` / `일정 기간에 따른 데이터 추세를 표시할때 사용합니다.`
  - `Line graph` / `범례 여러개를 동시에 보여주는 경우 툴팁이 상이합니다.`
  - `area graph` / same description.
  - Sub-labels: `2 data`, `1 data` (×2 pairs).
- **`3. Bar Chart`** → heading `Bar Chart`, but `title_` says `line` (copy-paste). `bar graph` and `column graph`, both / `데이터 갯수에 따른 툴팁 디자인이 상이합니다.`
  - ⚠️ **No component sets in this section** — only headings and two pasted Highcharts screenshots. **Bar/column charts are documented but not built.** Blank at source.
- **`4. Stock Chart`** → heading **`Combination`** / `title_` says `line` (copy-paste). `candlestick` and `column graph`, both / `데이터 갯수에 따른 툴팁 디자인이 상이합니다.` One set (`chart`, `f45dc0d7…`).
- **`5. Tree Map`** → see above.
- **`99. Legend`** → `Legend` / `상황/요건에 맞는 범례를 사용하세요`. Sub-labels: `bottom`, `icon`, `Side`, `List`.

**Recurring rule across Line/Bar/Stock:** tooltip design changes with the number of data points / simultaneous legend entries (`데이터 갯수에 따른 툴팁 디자인이 상이합니다`, `범례 여러개를 동시에 보여주는 경우 툴팁이 상이합니다`). That's why nearly every set carries a `tooltip` axis and why there are separate `1 data` / `2 data` sets.

## Placeholder copy — do NOT record as product strings

| String (verbatim) | Status |
|---|---|
| `키움불리오글로벌멀티에셋EMP 증권투자신탁(H)-혼합재간접Ce` | Real-shaped fund name used as a legend length-test. Demo. |
| `키움더드림단기채증권투자신탁[채권]C-e`, `SBI저축은행 정기예금-24개월` | Same — demo fund/deposit names. |
| `40%` / `30%` / `20%`, `14.5%` / `3.5%`, `연금리(세전)` | Filler figures. `연금리(세전)` ("annual rate, pre-tax") is a real label pattern. |
| `*삼성전자 +2.76%`, `*SK하이닉스 -0.41%`, `*현대차`, `*LG에너…`, `*기아` | Demo tickers. The `*` prefix is the abbreviation marker (same convention as `list_stock`'s `심플(요약)`). |
| `00%` (in the DONUT rule) | **Not placeholder copy — an unfilled spec.** See above. |

## How this feeds BUILD mode

- **Use the 🔥필수🔥 palette and nothing else.** Nine primaries in canvas order for series 1–9; the flattened 60% set for secondary/muted series. The page's own closing note requires discussion before adding a colour.
- **Never map the chart palette onto market direction.** `#FF5252` ≠ 상승. For direction, use `#D73838`/`#247EF2` (list/text contexts, confirmed on the List page) or the Tree Map's 7-band scale (treemap context).
- **Tree Map 보합 is grey `#A6A9B7`, not green.** Context-scoped override of the domain convention — apply it *only* in treemaps.
- **Import every chart set by KEY, never by name** — three sets share `Line_chart01`, and the gauge set is called `Frame 125473`.
- **Read `variantGroupProperties` at runtime for the gauge set** (`590b5533…`) — its property is `\x08Type`, not `Type`.
- **Bar/column charts do not exist as components.** Section 3 is headings + Highcharts reference images only. Don't hunt for a key.
- **The DONUT percent threshold (`00%이상`) is unspecified at source.** Don't invent a number.
- Keys are `unverified` for publish state (read-only session). `remote: false` is expected — this *is* the library file. Structurally: the sectioned sets are **(a) published library components**; `Frame 125473` (gauge, page-parented, auto-named, corrupt property) reads as **(c) unpublished scaffolding**; the pasted Highcharts images are **external reference material**, neither (a) nor (b) nor (c).
