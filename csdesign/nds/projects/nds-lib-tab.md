---
name: nds-lib-tab
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=1935-15771"
learned_date: 2026-07-16
sections_studied:
  - "1935:15771 (page '    - Tab  탭')"
  - "3683:8431 (frame '1. 1depth' — on-canvas heading 'Tab_1depth' / 'QV-NM Tab Design Guide'; section 'LINE', '가장 기본적인 탭입니다.')"
  - "3683:8902 (frame '2. 1.5depth' — on-canvas heading 'Tab_1.5depth'; section 'LINE', '화면 중간에 배치하며, 대표적으로 현재가, 주문, 잔고에서 쓰입니다.')"
  - "3683:14608 (frame '3. 2depth' — on-canvas heading 'Tab_2depth'; sections SWITCH / BUTTON / Txt)"
  - "3826:8989 (frame 'Tab_usage' — on-canvas heading 'Tab Usage'; the only stated rules in this batch; carries the Last update stamp)"
  - "2028:16537 (frame '99. Tab_assets' — the atomic per-cell sets behind the composed tabs)"
  - "14449:15313 (COMPONENT_SET nds_img_tab_gradation — BROKEN, duplicate variants)"
status: "live — carries an explicit `Last update  2025.12.18 박의정` stamp (3826:9001), the ONLY dated page in this batch. Rules are current as of that date. One asset set (nds_img_tab_gradation) is broken; the Txt section is dimmed to 30% opacity (see finding)."
---

# NDS_Library — Tab

The tab definitions in `NDS_Library` (`72zrHgMLM4zhCjgSuTf7cC`). All sets are local `COMPONENT_SET`s (`remote: false` — expected for the library file, **not** evidence of doc re-creation).

This is the **only page in the batch with stated usage rules and a date stamp** — the Header and Quickmenu pages have neither. It is organised as three *composed* depth frames plus a `99. Tab_assets` frame holding the **atomic per-cell** sets the composed tabs are built from. Both layers are published; know which one you want.

## ⭐ The stated rules (verbatim, from `Tab_usage` `3826:8989`)

Rendered as **live TEXT**, not a pasted screenshot image — transcribed here verbatim, Korean kept in Korean.

**사용방법**
1. `계층구조에 맞는 적절한 탭을 가져다 사용합니다.`
2. `케이스별 properties를 확인합니다.`

**사용 시 유의사항**
- `제공된 라이브러리 이외의 탭은 사용을 지양합니다.`
- `Assets 수정은 디자이너와 협의가 필요합니다.`
- `(for designer) 예외케이스는 해당하는 templates에 추가하도록 합시다.`
- `안드로이드에서는 탭 버튼 안에 Center dot (·)특수기호를 넣게 될 경우,  Text Align이 아래로 떨어지는 현상 있음. (/)로 적용하길 권장`

> **`Last update  2025.12.18 박의정`** (`3826:9001`)

The last bullet is a **real, platform-specific engineering constraint** and the most directly actionable line on the page: **on Android, a center-dot `·` inside a tab button drops the text alignment downward — use `/` instead.** Note this is already violated in the shipped artwork: the `Easy` quickmenu (sibling page) renders `주식 잔고·손익` with a `·`. Not this page's problem, but worth knowing the rule isn't universally applied.

## ⭐ Finding 1 — `nds_img_tab_gradation` is broken, same root cause as `header_basic`

`nds_img_tab_gradation` (`14449:15313`) **has two variants with the identical name**:

```
Type=nds_img_tab_gradation01   14449:15312   ← duplicate
Type=nds_img_tab_gradation01   14449:15319   ← duplicate (same combo!)
Type=nds_img_tab_gradation02   24440:2058
```

Reading `variantGroupProperties` throws **`"Component set has existing errors"`** — the same failure Core attributes to `header_basic`. Almost certainly `gradation01`/`gradation02`/**`gradation03`** was intended and one variant never got renamed.

**This independently confirms the root cause established on the Header page** (`nds-lib-top-navigation.md`): *duplicate variant name ⇒ set has errors ⇒ instancing throws.* I audited every `COMPONENT_SET` across all three pages in this batch; the correlation is **exact and 1:1, zero exceptions**:

| page | set | duplicate variant names | axes readable? |
|---|---|---|---|
| Header `0:1` | `header_title_txt` `9864:16724` | `2depth 메뉴표시=off, 어두운배경=off` ×2 | ❌ errors |
| Header `0:1` | all 5 other sets | none | ✅ |
| Quickmenu `338:6691` | all 4 sets | none | ✅ |
| Tab `1935:15771` | `nds_img_tab_gradation` `14449:15313` | `Type=nds_img_tab_gradation01` ×2 | ❌ errors |
| Tab `1935:15771` | all 16 other sets | none | ✅ |

Two independent instances of the same defect in one file. **`"Component set has existing errors"` means "look for a duplicate variant name", not "the key is wrong".** Both are one-line design fixes.

Unlike `header_basic`, **no tab set nests `nds_img_tab_gradation`** — it's a standalone decorative image asset in `99. Tab_assets`. So the breakage is **contained**: every actual tab set on this page is clean and usable. Only `nds_img_tab_gradation` itself is unusable.

## ⭐ Finding 2 — the `Txt` section is dimmed to 30% opacity

The `Txt` section's title frame (`3683:15217`) has **`opacity: 0.30`**. Its siblings `switch` (`3683:14614`) and `button` (`3683:15160`) are both at `opacity: 1.0`. Confirmed programmatically, and visible in the screenshot as a washed-out heading.

This is **deliberate de-emphasis, not a rendering artifact** — a single section dimmed while its siblings are at full strength. The most likely reading is a **soft deprecation** of the `Txt` tab: on its way out, kept for reference.

**I am flagging this as evidence, not as a verdict.** The section is not struck through and carries no "deprecated" label, and I found no on-canvas text confirming intent. `tab_2depth_txt` (`be7fdd67…`) is structurally clean and has a single `Property 1=default` variant. **Before using `tab_2depth_txt`, confirm its status with a designer** — a 30% heading is a signal worth honoring, but the dimming is the only evidence and I could not corroborate it.

Its description still reads normally: `화면 중간에 배치하며, 구분라인이 있습니다. 스와이프 불가합니다.` Rendered demo: `Tab1 | Tab2 | Tab3 | Tab4 | Tab5` with `Tab1` active in green.

## ⭐ Finding 3 — a real length rule hides inside demo copy

The `1depth` `fixed` 2-col demo renders, verbatim:

> **`한글기준최대열두글자요`**  |  `너무 길게 쓰면 안됩니다`

("Max twelve characters based on Korean" | "Don't write it too long"). The string is **self-demonstrating** — `한글기준최대열두글자요` is itself exactly 12 Korean characters.

**This is a genuine rule embedded as placeholder copy**, in exactly the way the domain warns about. It is not in `Tab_usage`; the only place it exists is inside the component's demo text. **The 2-col line tab's label limit is 12 Korean characters.**

No equivalent limit is stated for 3col/4col/5col — and their demo copy (`일이삼사오육칠`, `일이삼사오`) is generic filler that shrinks with column count but **states no rule**. Do not infer per-column limits from the filler lengths; the only *stated* limit is the 12-char one for 2col.

## Structure — composed tabs vs atomic assets

The page has **two parallel layers**. Both are published sets, so it's easy to import the wrong one.

- **Composed** (frames `1. 1depth`, `2. 1.5depth`, `3. 2depth`) — a whole tab bar, 540px wide, cells included. **This is what you want for screens.**
- **Atomic** (frame `99. Tab_assets`) — a *single cell* (`tab_line_24pt`, `tab_txt_21pt`, `tab_switch`, `tab_btn`, …), each with an `Active=on|off` axis. These are the building blocks. **The composed sets have no `Active` axis** — active state is baked into their internals.

**Rule of thumb: if the set name has a `pt` size or an `Active` axis, it's an atomic cell, not a tab bar.**

### Depth hierarchy (verbatim descriptions)

| frame | heading | section | verbatim Korean |
|---|---|---|---|
| `3683:8431` | Tab_1depth | **LINE** | `가장 기본적인 탭입니다.` |
| `3683:8902` | Tab_1.5depth | **LINE** | `화면 중간에 배치하며, 대표적으로 현재가, 주문, 잔고에서 쓰입니다.` |
| `3683:14608` | Tab_2depth | **SWITCH** | `화면 중간에 배치하여 콘텐츠 전환을 위해 사용합니다. 스와이프 불가합니다.` |
| `3683:14608` | Tab_2depth | **BUTTON** | `라운드 버튼형 탭으로. 스와이프 가능합니다.` |
| `3683:14608` | Tab_2depth | **Txt** ⚠️30% | `화면 중간에 배치하며, 구분라인이 있습니다. 스와이프 불가합니다.` |

**Swipe capability is explicitly stated per type** — the one behavioral rule this page does give:

| type | swipe |
|---|---|
| `tab_1depth_line` (Type=swipe) | ✅ (a variant) |
| `tab_1.5depth_line` (Type=swipe / swipe-btn) | ✅ (variants) |
| `tab_2depth_switch` | ❌ `스와이프 불가합니다` |
| `tab_2depth_button` | ✅ `스와이프 가능합니다` |
| `tab_2depth_txt` | ❌ `스와이프 불가합니다` |

## componentKeys — SET keys vs variant COMPONENT keys

**All keys are the full 40-hex string. `importComponentSetByKeyAsync` needs the SET key.** Keys are **`unverified`** — `importComponentSetByKeyAsync` throws in read-only sessions; no writes attempted.

### SET keys (`KIND: COMPONENT_SET`) — composed tab bars

| name | SET key | axes |
|---|---|---|
| `tab_1depth_line` (`3683:8573`) | `7bf9b1cbc3bada9a2d4e323ae51efcc74e60f611` | `Colum` (2col,3col,4col,swipe) × `Type` (fixed,swipe) |
| `tab_1.5depth_line` (`3683:8975`) | `2f49321faa92cdc291d2b5f8af2622368f271c35` | `Type` (fix-2col,fix-3col,fix-4col,swipe,swipe-btn) |
| `tab_2depth_switch` (`3683:14718`) | `4961e0c0950fd478f853317c3166c123731fe74c` | `BG color` (white,bluegray) × `Colum` (2col,3col,4col) |
| `tab_2depth_button` (`3683:15203`) | `959d30222ef4ce00cdf1bcf14471c21587a15ba5` | `Channel` (NM,QV) |
| `tab_2depth_button_dark` (`14449:15244`) | `5fbdbbb8ee39d2a1587cfa53957fbb4cd9c30882` | `Channel` (NM,QV) |
| `tab_2depth_txt` (`4568:8947`) | `be7fdd67cbb96e30af5172d3d4afb349c005e1c5` | `Property 1` (default) — ⚠️ section at 30% opacity |
| `tab_2depth_chip` (`7513:13045`) | `0f20528265a3c598e42e30f6ae422be67e941c10` | `Property 1` (Default, Variant2) — ⚠️ no on-canvas heading |

### SET keys — atomic cells (`99. Tab_assets`)

| name | SET key | axes |
|---|---|---|
| `tab_line_24pt` (`153:3118`) | `5a3be1e8bc71ce66e0c7f4e4464f03bd8d8d2ec4` | `Type` (fix-2col,fix-3col,fix-4col,swipe) × `Active` (on,off) |
| `tab_line_21pt` (`2997:8594`) | `f82db6566e1b3a8a8e879b7f3e926911a2af7b11` | `Type` (fix-2col,fix-5col,swipe) × `Active` × `Channel` (NM,QV) |
| `tab_txt_21pt` (`158:4393`) | `cad03c0740112ad9ccec4113606b549296c0d9ae` | `Type` (1.5dep-2col,1.5dep-3col,2dep-2col) × `Active` |
| `tab_switch` (`158:4652`) | `5ca4c628a4fd8b4b13fc5047585675262560b1ef` | `Type` (2col,3col,4col) × `BG color` × `Active` |
| `tab_btn` (`1572:27222`) | `8b9291be5269c538b8ae486354c4cdcab547b796` | `Channel` (NM,QV) × `Active` |
| `tab_btn` (`7513:12955`) | `f667a0f6f11f7727f3c7769aa3dc88e5e759d5fe` | `Active` only ⚠️ |
| `tab_btn` (`14449:15237`) | `d83a44d52a7c754dc456dff6dcd4ce04aa233f5c` | `Channel` (NM,QV) × `Active` ⚠️ |
| `tab_icon_arrow` (`2488:12652`) | `76fdae74515be14156a3e25ab73b92abba509b30` | `Type` (left,down,up) |
| `Text_Flex` (`1847:23917`) | `eda0a8e0a62ef17714713b4078464fa1471c3f39` | `Height` (h22) × `Active` |
| `nds_img_tab_gradation` (`14449:15313`) | `3b21c3c00f45d9d1b58527c1a04ea64dde00daa1` | ⚠️ **unreadable — set has errors** |

### ⚠️ `tab_btn` is a THREE-way name collision

**Three distinct `COMPONENT_SET`s are all named exactly `tab_btn`**, all inside `99. Tab_assets`, with three different SET keys and three different axis signatures:

| id | SET key | axes | on-canvas context |
|---|---|---|---|
| `1572:27222` | `8b9291be5269c538b8ae486354c4cdcab547b796` | Channel × Active | under **BUTTON / 버튼형**, labelled NM/QV, 97×50 |
| `7513:12955` | `f667a0f6f11f7727f3c7769aa3dc88e5e759d5fe` | **Active only** | unlabelled, 105×40 |
| `14449:15237` | `d83a44d52a7c754dc456dff6dcd4ce04aa233f5c` | Channel × Active | under **DARK BG**, 97×39 |

This is the **same class of defect as `header_basic`** (two sets, one name) — and here it's *three*. **`tab_btn` alone never identifies a component.** Always qualify by key or axes. `14449:15237` is the dark-BG one (`나의자산진단 전용`); `1572:27222` is the standard light one.

### variant COMPONENT keys — `KIND: COMPONENT`, not importable as sets

`tab_1depth_line` `7bf9b1…`: 2col/fixed `5f693621dc20496a7812cbcdbed0063353aadee3` · 3col/fixed `dab728a1b18cda2e0c3ecf119d71717dd444fc1b` · 4col/fixed `c315618f59f6d075b984d2c2b0d620c6f976bd71` · swipe/swipe `04df62ecc64ec73659bbd18f57fd3023bf00d863`

`tab_1.5depth_line` `2f4932…`: fix-2col `8d0facf9be69973af13e102d0e073a96f491c7fd` · fix-3col `4e79c9e0d918aeed8ee134f53b527a55200020ba` · fix-4col `1bf1b804b84822402e66f2d6408c0545b3bcf302` · swipe `7e55d1056d10f6c847806538a212b117cf059760` · swipe-btn `7279603a9fbb3cce16d4ef760b9565511e49f877`

`tab_2depth_switch` `4961e0…`: white/2col `680c5d95652da08f977737e0e99eba029e706904` · white/3col `03ba8076c022824536617eb9256259ef75165d0c` · white/4col `1ea1f215f368c4b37169ff7d0c273f144072246a` · bluegray/2col `447bcb9fcc00ce43b0e619c39e829f7beb2773ba` · bluegray/3col `d09154164ce773cb76a1d928ca3d6ed69937dc44` · bluegray/4col `1b54c0aefa048ae993457086694af21570c50cff`

`tab_2depth_button` `959d30…`: NM `1e2782891ce56f6e23fa02da8a9a94ff86573927` · QV `d8e2621a876659411bfc6f14968b9fa06c9cc84a`
`tab_2depth_button_dark` `5fbdbb…`: NM `d45ba704b869d469b748ff204258ca384be17f41` · QV `2fd306aa51b895b366beec0a7203461372c04e74`
`tab_2depth_txt` `be7fdd…`: default `b4a04c04805f17bc1633d633e7315b5ef356f58d`
`tab_2depth_chip` `0f2052…`: Default `c3c3eea1265c5d2861c008e38efc8556eada91b3` · Variant2 `0ff1ee0331f9a859bc535b4fb4800c49e97ea523`
`tab_icon_arrow` `76fdae…`: left `4d5f0d3c465302793fa3792549b4695456646686` · down `9c31de5e64b6da42c35a69c12a09def4e6b2f25e` · up `74ed1767f85995012e5bdf782d2a733193bc531b`
`tab_btn` `8b9291…`: NM/on `571366897c15dd7d2ec3a06c74e5e717ca2dc262` · NM/off `201e73daf1699171ec7b0d1bfc171349b09eb870` · QV/on `aa51c17d6d5fb8fd1f0415b8c0c46e989c4f2503` · QV/off `95360ed780566fe4f3fbe52b365ee952aaddfb97`
`tab_btn` `f667a0…`: on `a1c581e8a32002c3cd21045345cb5cbacb3f4c03` · off `6e9590321500da7286981671ce108cae52c3da06`
`tab_btn` `d83a44…`: NM/on `7eae4f10e10080e945b4ae17d9b876891d200cb1` · NM/off `115b290143c088d1b445ff4a10ade1ee8524c9c9` · QV/on `087ee342c6a160578de14122e0691e41cdc937c1` · QV/off `1f8d50aa991d62beb43b2cee5dbdb848cae87532`
`nds_img_tab_gradation` `3b21c3…` (variant keys readable, `variantProperties` not): `2fffc40b8d5accc6b403f55db690af75650e9a64` (01⚠️dup) · `c176e3e8d73ead138493a7319250791a085d479e` (01⚠️dup) · `e4a9e2e1efbd8ae516f40b1f01ea39f691a7f855` (02)

Remaining atomic variant keys (`tab_line_24pt`, `tab_line_21pt`, `tab_txt_21pt`, `tab_switch`, `Text_Flex`) were captured in full and are available on request — omitted here only for length; **none are truncated in the source data.**

## ⭐ `tab_2depth_chip` — SOURCE IDENTIFIED (resolves `#tab-2depth-chip-source`)

**`tab_2depth_chip` is DEFINED HERE.** It is a genuine local `COMPONENT_SET` on this page — not an instance, not a re-creation:

| field | value |
|---|---|
| KIND | **`COMPONENT_SET`** |
| node id | `7513:13045` |
| **SET key** | `0f20528265a3c598e42e30f6ae422be67e941c10` |
| `remote` | `false` (local — expected in the library file) |
| parent frame | `3. 2depth` |
| position | `x=1058, y=1260` (beside `tab_2depth_button`) |
| axes | `Property 1` = `Default` \| `Variant2` |
| `description` | **empty** |
| `documentationLinks` | **empty** |

Variant COMPONENT keys: `Property 1=Default` → `c3c3eea1265c5d2861c008e38efc8556eada91b3`; `Property 1=Variant2` → `0ff1ee0331f9a859bc535b4fb4800c49e97ea523`.

Both variants contain a single child FRAME (also named `tab_2depth_chip`) rendering six chips. TEXT, verbatim:

- `Property 1=Default` → `국내주식`, `해외주식`, `해외주식`, `해외주식`, `해외주식`, `해외주식`
- `Property 1=Variant2` → `해외주식`, `국내주식`, `해외주식`, `해외주식`, `해외주식`, `해외주식`

So **`Property 1` selects which chip is active** — position 1 in `Default`, position 2 in `Variant2`. (Inferred from the copy pattern; the axis name `Property 1` is a Figma default and states nothing.)

**Why it was contested across all three files:** it is **defined but never used**. I scanned every INSTANCE on this page — **zero instance anywhere in the file resolves to this set**. It has no on-canvas heading, no description, and no documentation link. It is an **orphan: published, undocumented, uninstanced.**

**Verdict: the source is `NDS_Library` → page `    - Tab  탭` → frame `3. 2depth` → `7513:13045`, SET key `0f20528265a3c598e42e30f6ae422be67e941c10`.** Searching for a *usage* to explain it will keep failing — there isn't one. Its purpose is genuinely undocumented at source; **that blank is the finding.** Don't infer intent from the chip copy.

## ⭐ Channel axis: this page uses `NM`/`QV` — the other two use `NM`/`N2`

A **file-internal inconsistency worth flagging.** On the Tab page, `Channel` = `NM` | `QV` (`tab_2depth_button`, `tab_btn`, `tab_line_21pt`). On the **Header and Quickmenu** pages, `Channel` = `NM` | `N2` (plus `clear *` on headers). **`QV` appears nowhere on those pages; `N2` appears nowhere on this one.**

Whether `N2` and `QV` denote the same channel under two names, or two genuinely different channels, **is not stated anywhere in this file**. **No component in this batch carries both `N2` and `QV` on the same axis**, so no direct comparison is possible — the axes are strictly disjoint per page.

**Measured fills (sampled, not inferred):**

| axis value | component | measured hex |
|---|---|---|
| `NM` | `header_basic` self-fill | `#FFFFFF` |
| `N2` | `header_basic` self-fill | `#0E2A3F` |
| `N2` | `header_stock` `box` | `#0E2A3F` |
| `NM` | `tab_2depth_button` active pill | `#2C363B` |
| `QV` | `tab_2depth_button` active pill | `#0E1A49` |

**Adjudication of the sibling batches' `N2 ≡ QV` claim: NOT CONFIRMED, NOT REFUTED — evidence is mixed.**

- *Consistent with* the claim: the axes never co-occur (each page uses one spelling), and both `N2` and `QV` render as **dark navy-family** colors while `NM` is the light/neutral one. That's the same structural role.
- *Against a naive reading*: the sampled hexes are **not equal** — `N2` `#0E2A3F` vs `QV` `#0E1A49`. They are close but distinct navies. This may just be different component families using different tokens, so it is **weak** evidence.
- **Important**: `QV` here is **`#0E1A49` (dark navy), NOT orange.** This **contradicts** `nds-mweb-colors`'s `QV/ESS/primary/2.022(대표컬러)` = `#FFAA1A`. Note that note is a **different file** (`NDS_M.web`, `uVcmG6GgOl2J8EOlc22wob`), so the two are not necessarily in conflict — but **`QV` does not mean "orange" in `NDS_Library`.**
- Also note `NM`'s tab pill `#2C363B` is exactly `NM/ESS/grayscale/1.296(홈상단배경)` from `nds-mweb-colors` — so that file's ColorNumbers *do* reach this one, which makes the QV divergence more notable, not less.

**Verdict: report as UNRESOLVED. Do not merge `N2` and `QV` into one channel on this evidence, and do not carry the "QV = orange" fact into `NDS_Library`.**

## Name reliability verdict — **RELIABLE (with three name-collision caveats)**

Determined by screenshotting this page specifically.

- **Set/frame/variant layer names: reliable.** Every set name matches its on-canvas section; variant names match rendered appearance; `Active=on/off` matches the bolded/greyed rendering.
- **TEXT content: placeholder filler** (`일이삼사오육칠`, `Tab1…Tab5`, `카카오`, `삼성전자`, `NH투자증권`, `매도가능 주식 수량확인`, `국내주식`/`해외주식`) — **except** the `한글기준최대열두글자요` string, which is a real rule (Finding 3). No mismatch between TEXT node *names* and their `characters` was found here — unlike the Quickmenu page, where that failure is rampant.
- **Caveat — names are not unique:** `tab_btn` ×3, and `nds_img_tab_gradation`'s duplicate variant. A name is reliable as a *description* here but **not as an identifier**. Use keys.
- **`tab_2depth_chip` has no on-canvas heading** — it sits beside `tab_2depth_button` with no label or description. Its purpose is **undocumented**; `Property 1=Default|Variant2` is a Figma default name carrying no meaning. Recorded as unknown rather than guessed.

**Rules are rendered as live TEXT, not pasted screenshot images.** `Tab_usage` is real text and was read directly — nothing on this page required transcription from a bitmap.

**Strikethrough audit — CLEAN.** Sibling batches found a popup rule (`최대 높이 850`) silently retired via a STRIKETHROUGH text segment invisible to `get_metadata`. I ran `getStyledTextSegments(["textDecoration"])` over **every rule-bearing TEXT node on this page** — all four `Tab_usage` bullets, both 사용방법 steps, the `Last update` stamp, and all five section descriptions. **Every segment returns `textDecoration: "NONE"`.** No rule on this page is silently retired; the transcriptions above are safe to trust as live.

**Control-character audit — CLEAN on this page.** Scanned every SET name, variant name, axis name, and axis value for U+0008 and friends: **zero hits on the Tab page.** (The Header page's `tit` set is the one that carries `\bLine` — see `nds-lib-top-navigation.md`.)

**Font sampling — no Pretendard on this page.** Rule prose is `{family: "Roboto", style: "Regular"}` (the `Last update` stamp is `Roboto Bold`); every section description and component label is `{family: "NanumBarunGothic", style: "Regular"}`, e.g. the tab cell label `카카오` at size 21. **Zero Pretendard nodes on the Tab page** — corroborating the Typography batch and contradicting Core's "labels/body = Pretendard".

**`hidden="true"` frames present:** `3683:8440` and `3683:8903`, both named `Tab_2depth_swipe`, inside the `1depth` and `1.5depth` frames. Both render as blank — **not screenshot-verified, names not quoted as rules.** Recorded as unverified: the name hints at a swipe demo that was never finished or was superseded. Note both sit at `y=3303`, far outside their parent frames' bounds — consistent with abandoned scaffolding.

## Interaction / timing rules — **PARTIALLY BLANK**

The best-documented page in the batch, and still:

- ✅ **Swipe capability IS specified** per tab type (table above). This is the one real interaction rule in the whole batch.
- ✅ **A dated stamp exists**: `Last update  2025.12.18 박의정`.
- ✅ **A platform constraint exists**: the Android center-dot bug.
- ❌ **No durations, no easing, no transition curves** for tab switching, the swipe gesture, or the active-indicator underline slide.
- ❌ **No swipe threshold / velocity** for the `swipe` variants.
- ❌ **No rule for default active index** on mount.
- ❌ **No overflow rule** for `swipe` tabs — how many cells before scrolling, whether the active cell auto-scrolls into view.

**Report the blanks; do not infer them from the mockups.** "스와이프 가능합니다" tells you the gesture is allowed, **not how it should feel.** If a build needs the animation spec, that is an open question for the designer.

## How this feeds BUILD mode

- **Pick by depth first, then by type** — the guide's own rule #1: `계층구조에 맞는 적절한 탭을 가져다 사용합니다`. 1depth = page-level, 1.5depth = mid-screen (현재가/주문/잔고), 2depth = content switching.
- **Use the composed sets** (`tab_1depth_line`, `tab_1.5depth_line`, `tab_2depth_*`) for screens. Reach into `99. Tab_assets` only when building a custom bar — and note rule #2: `제공된 라이브러리 이외의 탭은 사용을 지양합니다`.
- **`tab_btn` is ambiguous — always use the key.** Three sets share the name.
- **`nds_img_tab_gradation` is unusable** until a designer renames the duplicate `gradation01`. Every actual tab set is fine.
- **Confirm `tab_2depth_txt` before using it** — its section is dimmed to 30%.
- **2-col line tab labels: max 12 Korean characters.** The only stated length limit.
- **On Android, never put `·` inside a tab label — use `/`.** Stated rule, real bug.
- **`Assets 수정은 디자이너와 협의가 필요합니다`** — this page explicitly forbids unilateral asset edits. That covers the two duplicate-variant fixes named above: **report them, don't fix them yourself.**
