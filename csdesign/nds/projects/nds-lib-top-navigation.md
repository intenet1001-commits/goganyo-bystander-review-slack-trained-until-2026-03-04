---
name: nds-lib-top-navigation
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=0-1"
learned_date: 2026-07-16
sections_studied:
  - "0:1 (page '    - Top Navigation (Header)  헤더' — the library file where headers are DEFINED, not documented)"
  - "8901:13893 (frame '1. Top Navigation_Header' — on-canvas heading 'Top Navigation (Header)' / 'QV-NM Top Navigation (Header) Design Guide')"
  - "8901:13953 (COMPONENT_SET header_basic #1 — on-canvas heading 'BASIC', '기본 화면, 풀팝업에서 쓰이는 헤더입니다.')"
  - "8901:13980 (COMPONENT_SET header_basic #2 — on-canvas heading 'OPTIONAL', '헤더에 원하는 아이콘을 선택할수 있습니다.' — SAME LAYER NAME, DIFFERENT SET)"
  - "8901:13894 (COMPONENT_SET header_stock — on-canvas heading 'STOCK', '현재가, 주문 등의 트레이딩 화면에서 사용합니다.')"
  - "9864:16724 (COMPONENT_SET header_title_txt — the BROKEN set; root cause of the header_basic instancing failure)"
  - "9599:17639 / 10602:15520 (frames '99. Header_assets' — sub-asset sets: tit, header_order_switcher)"
status: "live — no deprecation/superseded marking anywhere on canvas; all three headings render normally and header_stock/header_basic sets are structurally clean. NOTE: page carries NO `Last update` stamp (verified: zero TEXT nodes containing 'Last update' on this page), so recency is unknown."
---

# NDS_Library — Top Navigation (Header)

This is **the source-of-truth page where headers are actually defined** (`NDS_Library`, `72zrHgMLM4zhCjgSuTf7cC`). Everything here is a **local `COMPONENT_SET` (`remote: false`)** — that is expected and correct for the library file itself, and is **not** evidence of documentation re-creation. Publish state was judged by structure, not by `remote`.

The page's headline finding overturns a standing LEDGER conclusion and **solves the `header_basic` "broken" mystery with a concrete root cause**.

## ⭐ Finding 1 — `header_basic` is a REAL name collision, not a SET-vs-variant confusion

LEDGER `#header-basic-keys` records that rival keys for `header_basic` "turned out to be a **SET-key vs variant-COMPONENT-key confusion**, not a real conflict."

**That resolution is contradicted by the source.** There are **two genuinely distinct `COMPONENT_SET` nodes, both named exactly `header_basic`, on the same page, siblings under the same parent frame**, with different SET keys and *different variant axes*:

| # | node id | on-canvas heading | SET key (40-hex) | variant axes |
|---|---|---|---|---|
| 1 | `8901:13953` | **BASIC** | `c95043e94317fde7230298017f42dd8099e1cbdc` | `Channel` (NM, N2, clear 밝은배경, clear 어두운배경) × `Left Icon` (on/off) × `Right Icon` (off/on) |
| 2 | `8901:13980` | **OPTIONAL** | `07fb2e569ac9d8cd9e31b49cf8770209df58c089` | `Channel` (NM, N2) × `Type` (버튼, 아이콘 1개, 아이콘 2개) |

Both are `KIND: COMPONENT_SET`. Neither key is a variant-component key. The axes don't overlap. **This is a real collision** — two different components sharing one layer name. Core's `header_basic` row (`c95043…`) is the **BASIC** one; the **OPTIONAL** set is a separate component Core does not currently record.

The name is genuinely ambiguous at the source: **`header_basic` alone never identifies a component in this file.** Always qualify by axes or by the on-canvas heading (BASIC vs OPTIONAL).

## ⭐ Finding 2 — root cause of `"Component set for node has existing errors"`

Core records `header_basic` as **"Broken as of 2026-07"**: `importComponentSetByKeyAsync` succeeds but instancing throws `"Component set for node has existing errors"`.

**The observation is correct; the attribution is wrong. `header_basic` itself is clean.** Both `header_basic` sets read `key`, `remote`, and `variantGroupProperties` without error, and neither has duplicate variants.

The error comes from a **nested dependency**: `header_title_txt` (`9864:16724`), which **both** `header_basic` sets instance inside their variants. That set is broken:

```
header_title_txt  9864:16724
  ├─ "2depth 메뉴표시=on,  어두운배경=off"   9864:16723
  ├─ "2depth 메뉴표시=on,  어두운배경=on"    9867:16992
  ├─ "2depth 메뉴표시=off, 어두운배경=off"   9864:16725   ← duplicate
  ├─ "2depth 메뉴표시=off, 어두운배경=off"   50853:16826  ← duplicate (same variant combo!)
  └─ "2depth 메뉴표시=off, 어두운배경=on"    9867:16999
```

**Two variants declare the identical variant combination.** Figma rejects the set: reading `header_title_txt.variantGroupProperties` throws `"Component set has existing errors"`, and reading any child's `variantProperties` throws `"Component set for node has existing errors"` — *the exact string Core recorded*.

Nesting proves the cascade (each `header_basic` variant instances `header_title_txt`):

| set | nests `header_title_txt`? | nests `nds_icon_header` | instancing outcome |
|---|---|---|---|
| `header_basic` BASIC `8901:13953` | **yes** (12 instances) | 16 | throws (cascade) |
| `header_basic` OPTIONAL `8901:13980` | **yes** (6 instances) | 12 | throws (cascade) |
| `header_stock` `8901:13894` | **no** | 36 | works |

This explains the whole pattern Core observed — **`header_basic` broken, `header_stock` fine** — with no appeal to deprecation. `header_stock` doesn't touch `header_title_txt`; both `header_basic` sets do.

**Implications:**
- `header_basic` is **not deprecated, not superseded, not broken by design.** There is zero on-canvas evidence of deprecation (see Finding 3). It is blocked by one fixable upstream defect.
- The fix is a **one-line design edit** — rename or delete one of the two duplicate `header_title_txt` variants. It is not a key problem, and re-keying `header_basic` would not help.
- **The bug is upstream of the key.** Any component that nests `header_title_txt` will throw regardless of which key you import.
- I could not verify the fix: **writes are out of scope** for this read-only session, and `importComponentSetByKeyAsync` throws in read-only sessions anyway. All keys below are therefore **`unverified`**.

The same defect shape appears independently on the Tab page (`nds_img_tab_gradation`, two variants named `Type=nds_img_tab_gradation01`) — see `nds-lib-tab.md`. Across all three pages in this batch the correlation is **exact and 1:1**: *duplicate variant name ⇔ set-has-errors*, zero exceptions. That is a reliable diagnostic signature, not a coincidence.

## componentKeys — SET keys vs variant COMPONENT keys

**Every key below is the full 40-hex string. `importComponentSetByKeyAsync` needs the SET key.**

### SET keys (`KIND: COMPONENT_SET`) — use these for import

| name | SET key | axes | status |
|---|---|---|---|
| `header_basic` (**BASIC**, `8901:13953`) | `c95043e94317fde7230298017f42dd8099e1cbdc` | Channel × Left Icon × Right Icon | set clean; **instancing blocked** by nested `header_title_txt` |
| `header_basic` (**OPTIONAL**, `8901:13980`) | `07fb2e569ac9d8cd9e31b49cf8770209df58c089` | Channel × Type | set clean; **instancing blocked** (same cause) |
| `header_stock` (`8901:13894`) | `28c77263cb49ee32b6dc3ab6df216e5887659855` | Channel × country × Type | **clean and usable** |
| `header_title_txt` (`9864:16724`) | `3adbf2e221ffa7d8421e52a8e1b6cb51b0bb7e47` | ⚠️ unreadable — set has errors | **BROKEN — duplicate variants** |
| `tit` (`52863:33418`) | `c8f9c55cd64cbb8cd3101d64028c075079053a61` | `\bLine` (1줄, `\b`2줄) — see warning | clean |
| `header_order_switcher` (`70716:3094`) | `201081a13664d076948028592c941252b1083a35` | Channel × Type (일반/소수점) | clean |

### variant COMPONENT keys (`KIND: COMPONENT`) — NOT importable as sets

`header_stock` `28c77263…` variants:

| variant | COMPONENT key |
|---|---|
| Channel=NM, country=국내, Type=현재가 | `81f8f9de695255f74d8ba233df019415bdb71ffd` |
| Channel=N2, country=국내, Type=현재가 | `62205116ea4febfec9db8e9b496909048097bf5a` |
| Channel=NM, country=해외, Type=현재가 | `903c70de006957f9bb947619fd4472d22bfce105` |
| Channel=N2, country=해외, Type=현재가 | `2c722b4b582e10c2e434c9ef6495d9d47a4e5f47` |
| Channel=NM, country=국내, Type=주문 | `953b368850a8985e8c72bb6c0d817a55845b58ca` |
| Channel=N2, country=국내, Type=주문 | `41d9745749e14ad989beb99bc29f8044f342db20` |
| Channel=NM, country=해외, Type=주문 | `c9aa592b2edf334c12a18d16fadeeb5079453818` |
| Channel=N2, country=해외, Type=주문 | `be2638bf2aa269725d0098a1095cc606aadb2ce6` |
| Channel=NM, country=국내, Type=차트 | `e6d1af3ed9267e13cb3a7a1341f5376175b4813c` |
| Channel=N2, country=국내, Type=차트 | `e7973f2a271a0c14f59a8560892788a3eed93c2c` |

`header_basic` **BASIC** `c95043…` variants:

| variant | COMPONENT key |
|---|---|
| Channel=NM, Left Icon=on, Right Icon=off | `c7706f72a18d458759548113071367745adc8d96` |
| Channel=NM, Left Icon=on, Right Icon=on | `f3856f3362229d169e328d4d6639599672e83348` |
| Channel=NM, Left Icon=off, Right Icon=on | `400dc4ebbe4d63cdfe75a217b0cd24bda1ca1fe9` |
| Channel=N2, Left Icon=on, Right Icon=off | `bc3df2ff817ebe6249a8f0b8a31b9f11d428e7b4` |
| Channel=N2, Left Icon=on, Right Icon=on | `a2686b3cf0d4498b96eb40fa43929bbe5b8b58ee` |
| Channel=N2, Left Icon=off, Right Icon=on | `1544d4122d8e46e5ee50605cc5dcb7b7bb8612a6` |
| Channel=clear 밝은배경, Left Icon=on, Right Icon=off | `d1272833c39f5742fe5bf00145b9dee66a06c1ef` |
| Channel=clear 밝은배경, Left Icon=on, Right Icon=on | `4cc7afbbf7f44365a1f5f575f1f233d47ad73edd` |
| Channel=clear 밝은배경, Left Icon=off, Right Icon=on | `c6d77f3bcbeb1a0855a5b01513fc9a72d1a06b04` |
| Channel=clear 어두운배경, Left Icon=on, Right Icon=off | `fd559e4ba26f0dc8b3e4c38fad628c6f18c02168` |
| Channel=clear 어두운배경, Left Icon=on, Right Icon=on | `86e38e7895619ae838aeb26a038f1c20d6aa4340` |
| Channel=clear 어두운배경, Left Icon=off, Right Icon=on | `36e58977a609ec6bdb18af1e19171ee8926dbe1f` |

`header_basic` **OPTIONAL** `07fb2e…` variants:

| variant | COMPONENT key |
|---|---|
| Channel=NM, Type=버튼 | `9bed545556c756f4a47ec396a2a68ef4ee2e91f8` |
| Channel=NM, Type=아이콘 1개 | `eedc6cc695a52eec84c867cec8f00f45f8615bd8` |
| Channel=NM, Type=아이콘 2개 | `6d69db90a28b49fb14fe737d2189005eb732111e` |
| Channel=N2, Type=버튼 | `458315984157cdf73d52f91c5c31fd33277c69c0` |
| Channel=N2, Type=아이콘 1개 | `24d7870633f19de1eaf587d420f58964d4e151f8` |
| Channel=N2, Type=아이콘 2개 | `56a5b3ffb333e9d36d8d292a065d2aa5cc59dd77` |

`header_title_txt` `3adbf2…` variants — keys readable, `variantProperties` **not** (set has errors):

| variant (layer name) | COMPONENT key |
|---|---|
| 2depth 메뉴표시=on, 어두운배경=off | `b666d2de31adf20941164e8e5d7965aa0385fd0b` |
| 2depth 메뉴표시=on, 어두운배경=on | `c89753aff497c3e7e3372a20ba185e3f592b8e5b` |
| 2depth 메뉴표시=off, 어두운배경=off ⚠️dup | `2fa6ed355ef4465f68a5378d1eef537bbe37fff7` |
| 2depth 메뉴표시=off, 어두운배경=off ⚠️dup | `eebf9408f1a9ecd5946deff29352981b128bc0f7` |
| 2depth 메뉴표시=off, 어두운배경=on | `3baa653b3652b0fc020894004596f6a719d12380` |

`header_order_switcher` `201081…`: NM/일반 `b4c4055170c464b9ddd33ddf0034a61dc1e206a1` · NM/소수점 `606202b1460c44b37ace1bd5a086392cd01b81c4` · N2/일반 `32db2aa0f2eb7838aa61a89f06adf94756719382` · N2/소수점 `d6e40e48dd640d12e5836e580e3648d6951fe8d0`

`tit` `c8f9c5…`: Line=1줄 `ae37d9a221cc62e9627b9686416e72c52c950a88` · Line=2줄 `ace3db24a7df284889074eee75dcdaab77886fa3`

### ⚠️ `tit` contains a literal backspace character in its axis name

`tit`'s axis is **not** `Line` — it is `"\bLine"` (U+0008 BACKSPACE prefix), and its 2줄 value is `"\b2줄"`. String-matching `Line` or `2줄` will silently miss. This is invisible in the Figma UI and in the metadata dump. Copy the escape exactly if you ever set this property.

## ⭐ Finding 3 — fonts: labels are **NanumBarunGothic**, NOT Pretendard

**Sampled `fontName` verbatim off the actual header component instances** (not from style names). Full font census of every TEXT node on this page:

| fontName (verbatim) | count |
|---|---|
| `NanumBarunGothic Regular` | 66 |
| `NanumBarunGothic Bold` | 15 |
| `Roboto Medium` | 14 |
| `Roboto Regular` | 9 |
| `Roboto Bold` | 5 |
| `Pretendard SemiBold` | **4** |
| `Pretendard Regular` | **2** |
| `Roboto SemiBold` | 1 |
| `Inter Regular` | 2 |

**Core's "labels/body = Pretendard" is CONTRADICTED for headers.** The header title (`화면 타이틀명`) is `{family: "NanumBarunGothic", style: "Regular"}`, size 24, textStyleId `S:8f495becd2e654e73222b3810581b05003540c` — identical in both NM and N2 (only the fill differs: `#000000` vs `#FFFFFF`). Every component label on this page is NanumBarunGothic. Documentation prose is Roboto.

**But "zero Pretendard in the library" is also too strong.** Pretendard is present — I traced all 6 nodes:

- **4× `Pretendard SemiBold`, characters `" 통합"`** — inside `nds_img_market_switcher`, an INSTANCE nested in `header_stock` variants (국내 현재가/주문, both NM and N2). Ancestry: `header_stock > Channel=NM, country=국내, Type=현재가 > nds_img_market_switcher > txt`. **This is real component content, not an annotation.**
- **2× `Pretendard Regular`** — inside `su` and `loopy` annotation sticky notes (`Comment` TEXT nodes: `nds_icon_header_drop_black`, `해상도 이슈로 버튼 개발로 진행 (이미지X)`). Designer notes, not components.

**Precise verdict for the tiebreak:** header/tab **labels are NanumBarunGothic**, so Core's Pretendard claim (sampled from instances elsewhere) does not hold here. The Typography page's "zero Pretendard" is right about *styles* but Pretendard **is** used as a raw font in at least one published asset (`nds_img_market_switcher`). Both prior claims are partly wrong; these are the measured numbers.

## Finding 4 — channel background fills (measured)

Sampled from the **component node's own `fills`** (not children — `header_basic` variants have no backing rectangle; the fill lives on the component itself, which is why a naive child-scan finds nothing):

| Channel | `header_basic` self-fill | `header_stock` `box` fill |
|---|---|---|
| `NM` | `#FFFFFF` | `#FFFFFF` |
| `N2` | `#0E2A3F` | `#0E2A3F` |
| `clear 밝은배경` | **`[]` — no fill at all** | — |
| `clear 어두운배경` | **`[]` — no fill at all** | — |

**`N2` = `#0E2A3F`** consistently across both header families. **`clear *` is literally an empty fills array** — fully transparent, confirming these are transparency variants whose name only declares what sits behind. The two `clear` variants differ **only** in their icon/text colors, not their background.

## `touch area` frames — checked, NOT a defect

The `touch area` nodes contain **red (`#FF0000`) rectangles at 30% opacity**. I checked whether any ship visible: **none do.** Every red rect either has `visible: false` itself or sits inside a `touch area` GROUP whose `parentVisible` is `false`. These are the standard hidden tap-target overlays. **Not a bug — do not report as one.** (Recorded because a naive `fills` scan surfaces bright red and looks alarming.)

Tap-target geometry remains **unverified** per the hidden-frame rule — hidden frames render as blank 1×1 PNGs, so the sizes are not quotable as rules.

## Finding 5 — `nds_icon_header` corroborated exactly

Core's row is **confirmed on all three counts**, read off the set itself (`2034:18150`, which lives on the sibling page `    - Icons`, not this one — but both `header_basic` sets and `header_stock` depend on it):

- SET key `19619c9f1fd2e3c2e6515542d0484e651f3f30c6` ✅ exact match
- **81 variants** ✅ exact match
- axes `Type` × `Color` × `Darkmode` ✅ exact match

Full axis values now recorded (Core has only the axis names). `Type` has 37 values: `close, mic, back, stock, bell, gift, kebab, setting, cs, my, search, share, tooltip, ranking, calendar, ms_btn_pwopen_nn, ms_btn_pwopen_sn, ms_btn_pwsave_nn, ms_btn_pwsave_sn, ss_btn_pwnosave, home, alamset, info, recharge, bellnew, guide, history, make, mynew, Table, Easy, ms_btn_heart_nn, ms_btn_heart_sn, filter, filternew, cs02, searchnew`. `Color` = `2` | `6`. `Darkmode` = `false` | `true`.

The set is **clean** (no duplicate variants, axes readable) — so `nds_icon_header` is directly usable even while `header_basic` is blocked.

**`Color` is `2`/`6`, not a hex or a channel name.** Observed binding from the nesting scan: **NM headers use `Color=2`, N2 headers use `Color=6`**. Those two numbers are the ColorNumbers from the `nds-mweb-colors` grammar (`<Channel>/<Group>/<Slot>.<ColorNumber>`) — but the icon set exposes the *number* only, so the channel must be chosen by you. Picking `Color=2` on an N2 header is silently wrong, not an error.

## Structure and channels (from screenshot `8901:13893`)

Three sections, top to bottom. On-canvas headings are rendered **uppercase**; layer names are lowercase and one is mis-cased (`sToCK`).

| on-canvas heading | verbatim Korean description | layer name |
|---|---|---|
| **BASIC** | `기본 화면, 풀팝업에서 쓰이는 헤더입니다.` | `basic` |
| **OPTIONAL** | `헤더에 원하는 아이콘을 선택할수 있습니다.` | `optional` |
| **STOCK** | `현재가, 주문 등의 트레이딩 화면에서 사용합니다.` | `sToCK` ⚠️ |

**Channel rendering (visually confirmed):**
- `NM` — white background, dark text/icons
- `N2` — **dark navy background**, white text/icons. N2 is a *dark* channel here, not a hue swap. Do not assume the NM/QV green-vs-orange relationship from `nds-mweb-colors` applies — **this file's header axis is `NM`/`N2`, and `QV` does not appear on it at all.**
- `clear 밝은배경` / `clear 어두운배경` — transparent header over a light / dark page background; dark text on 밝은배경, white text on 어두운배경. These are **not colors**, they are *transparency + a declaration of what sits behind*.

`header_stock` columns are labelled `NM`, `N2`, `해외주식`. Note the third label is a **country**, not a channel — the `country` axis (국내/해외) is orthogonal to `Channel`, and the canvas layout collapses them into one row of columns. The four NM/N2 × 국내/해외 combinations all exist as variants.

## Name reliability verdict — **MIXED (structural names reliable, TEXT content is placeholder)**

Determined by screenshotting this page specifically, per the per-page rule.

- **Component/set/frame layer names: reliable.** Every `COMPONENT_SET` name matches its on-canvas section, and all variant names match their rendered appearance. `sToCK` vs "STOCK" is a casing slip, not a wrong name.
- **TEXT node content: placeholder demo copy — do NOT quote as rules.** Rendered copy is `화면 타이틀명` (lit. "screen title name"), and the stock headers show `NH투자증권`, `테슬라`, `*NAVER`, `국내`. These are filler, not specified strings.
- One genuine rule *is* embedded as demo copy, in the OPTIONAL section's button: the pill reads **`최대4자`** ("max 4 characters") — a real constraint on the header's optional text button. It renders inside the component, not as annotation.

**Rules on this page are rendered as live TEXT, not pasted screenshot images.** No image-embedded rules were found — nothing needed transcription from a bitmap. (Contrast with the Tab page, which is the same.)

**`hidden="true"` frames present:** `72282:2671` (`touch area`, inside the loose `header_stock` frame `72282:2665`) and its two children. Per the blank-1×1-PNG rule these were **not** screenshot-verified and their names are **not** quoted as rules here. Recorded as unverified: the layer names suggest tap-target padding of ~42px and ~46px wide over the left/right icons within a 520px-wide strip, but **this is an unverified reading of layer names on a hidden frame, not a stated rule.**

## Loose / uncategorized nodes on this page (classification)

These sit directly on the canvas outside the two main frames — **page-local scaffolding, not published components**:

- `72282:2665` `header_stock` — a plain **`FRAME`** (not a `COMPONENT_SET`, not an `INSTANCE`), keyless. This is a **page-local re-creation/scratch copy** of a stock header, at `(800, 2781)` well outside the documented frames. It has the same name as the real set `8901:13894` — a third name collision. Do not mistake it for the component.
- `10678:15518` / `24671:786` — `viviana` instances = **sticky annotation badges**, content: `👿 nds_img_header_btn01` and `👿 txt color no. 188`. These are designer to-do notes naming assets, not components.
- `39107:1010`, `39107:1115`, `58720:30491`, `58720:30508`, `70716:3271` (`su`, `loopy`) — loose instances/annotations, unclassified scaffolding.

## Interaction / timing rules — **BLANK AT SOURCE**

**Reporting the blank as the finding, per the domain rule.** This page specifies **no** interaction behavior whatsoever:

- **No `Last update` stamp exists on this page.** Verified programmatically — zero TEXT nodes contain "Last update". The Tab page has one (`2025.12.18 박의정`); this page does not. **Header recency is unknown.** Do not borrow the Tab page's date.
- **No usage frame.** The Tab page has a `Tab_usage` frame with 사용방법 / 사용 시 유의사항. **The header page has no equivalent** — there are no stated do's/don'ts, no "consult a designer" clause, no exception policy.
- **No transition, duration, easing, or trigger rules** for header appearance, the `clear` channels' scroll behavior, or the `header_order_switcher` toggle.
- **No dismissal rule** for the optional icons or the 최대4자 button.

The `clear 밝은배경`/`clear 어두운배경` variants strongly *imply* a scroll-over-content pattern, and `header_order_switcher` (일반/소수점) *implies* a toggle. **Neither is specified.** Do not infer either from the mockups — if a build needs the scroll threshold or the switcher's default state, that is an **open question for the designer**, not something to read off this page.

## How this feeds BUILD mode

- **`header_stock` (`28c77263cb49ee32b6dc3ab6df216e5887659855`) is the one header you can use today.** Clean set, clean deps, Channel × country × Type. Keys `unverified` (read-only session).
- **Both `header_basic` sets will throw on instancing until `header_title_txt` is fixed.** Don't burn time re-importing or hunting for a "correct" key — there isn't one. Either (a) get a designer to de-duplicate the two `2depth 메뉴표시=off, 어두운배경=off` variants, or (b) build the header from `nds_icon_header` + `tit` + a frame by hand.
- **Never write `header_basic` unqualified.** Say `header_basic (BASIC, c95043…)` or `header_basic (OPTIONAL, 07fb2e…)`. Two real sets, one name.
- **Pick `Channel` before anything else.** `NM` = light, `N2` = dark navy, `clear *` = transparent-over-background. Getting this wrong inverts the whole header's contrast, and there's no runtime fallback.
- **Match icon `Color` to the channel by hand** — `Color=2` for NM, `Color=6` for N2. The icon set won't stop you from mixing them.
- **Diagnostic to reuse:** when a set throws `"has existing errors"`, list `children.map(c => c.name)` and look for duplicates *before* suspecting the key. Confirmed 1:1 across every set in this batch.
