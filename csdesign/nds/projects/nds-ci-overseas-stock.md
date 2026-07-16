---
name: nds-ci-overseas-stock
fileKey: KmpaYeoYh41F6nyIKvBQ7h
source_url: "https://www.figma.com/design/KmpaYeoYh41F6nyIKvBQ7h/NDS_CI?node-id=1422-236"
learned_date: 2026-07-16
sections_studied:
  - "1422:236 (page '해외주식' — canvas root; 108 children, 1,572 nodes, 798 distinct ss_img_ci_* assets, ZERO components)"
  - "3720:921 / 3720:918 / 3720:920 / 3720:917 / 3720:919 (the naming-rule + CDN block — on-canvas heading '📌 해외주식', '이미지 네이밍 룰', 'CDN 주소'; THE load-bearing rule of this page)"
  - "3720:936 / 1427:718 (on-canvas heading '이미지 CI 리스트 (711)' + the 15,886-char manifest TEXT node it counts — the heading is EXACT for the manifest and STALE by 87 for the canvas)"
  - "3470:4 / 3470:5 / 3470:2 (the ss_img_ci_usafb → ss_img_ci_usameta rename record, stamped '큰손픽 _ 24.05.27')"
  - "5962:482 / 5962:512 (ss_img_ci_usaspcx, stamped '스페이스 x_ 26.06.12' — the newest asset on the page)"
status: "live — 798 distinct ss_img_ci_* assets present and populated; newest dated stamp '스페이스 x_ 26.06.12', 34 days before learned_date. NOT inferred from the page name. No `Last update` stamp; recency rests on the per-batch 큰손픽/서비스 date labels. See 'Gaps'."
---

# NDS_CI — "해외주식" page

Same species as `nds-ci-domestic-stock`: **a PNG export farm, not a component library.** 798 distinct `ss_img_ci_*` assets, **zero COMPONENTs, zero COMPONENT_SETs** (`findAllWithCriteria` → `[]`, both), **zero INSTANCEs**. Read it as (1) a naming grammar, (2) a CDN contract, (3) **a manifest that has drifted 87 assets behind its canvas**.

## Name-reliability verdict: RELIABLE FOR THE BASE TICKER, BROKEN FOR SHARE CLASSES

The convention is again **layer name = filename**. But this page has a defect the domestic page does not:

> **⚠️ Layer names silently DROP the `.a` / `.b` share-class suffix. The manifest keeps it. The manifest is authoritative.**

Proof — 6 rectangle names are duplicated on canvas, and each duplicate pair maps to two *distinct* manifest entries:

| Canvas layer name (×2) | Manifest entries (authoritative) | Real securities |
|---|---|---|
| `ss_img_ci_usabrk` | `ss_img_ci_usabrk.a` **+** `ss_img_ci_usabrk.b` | Berkshire Hathaway Class A / Class B |
| `ss_img_ci_usafb` | `ss_img_ci_usafb` **+** (see rename below) | Meta, pre/post rebrand |
| `ss_img_ci_usadisca` | `ss_img_ci_usadisca` **+** `ss_img_ci_usadisck` | Discovery Class A / Class K |
| `ss_img_ci_usafox` | `ss_img_ci_usafox` **+** `ss_img_ci_usafoxa` | Fox Class B / Class A |
| `ss_img_ci_usanws` | `ss_img_ci_usanws` **+** `ss_img_ci_usanwsa` | News Corp Class B / Class A |
| `ss_img_ci_usaua` | `ss_img_ci_usaua` **+** `ss_img_ci_usauaa` | Under Armour Class C / Class A |

And `ss_img_ci_usabf` on canvas ↔ `ss_img_ci_usabf.b` in the manifest (Brown-Forman Class B).

**Consequence: a name→asset lookup keyed on layer names loses 7 securities and returns the wrong logo for 6 more.** The corroborating evidence is on-canvas: the manifest carries `ss_img_ci_usabrk.a` **and** `ss_img_ci_usabrk.b`; the canvas carries `ss_img_ci_usabrk` twice. **Read the manifest, not the layer.**

⚠️ **Note the two competing share-class encodings** — dotted (`usabrk.a`, `usabf.b`, `usalen.b`) vs concatenated (`usafoxa`, `usanwsa`, `usauaa`, `usadisck`, `usallyva`/`usallyvk`, `usalsxma`/`usalsxmk`). **Both ship. Neither is documented.** `ss_img_ci_usalen.b` exists as a canvas frame with the dot intact, so the dot is not universally stripped — only the duplicated pairs lost it.

Sub-conventions:
1. **Asset nodes — RELIABLE (modulo share class).** 200×200. Two structural generations coexist (see below).
2. **`ss_img_ci_국가티커(알파벳).png` (`3720:920`)** — a **caption**, not an asset. A naive `startsWith('ss_img_ci_')` sweep counts it.
3. **TEXT node `1427:718` is named with its own 15,886-character body** — its layer name is the entire 711-line manifest concatenated. **This single node inflates every name-based sweep.** It is the worst name-vs-`characters` divergence I found; the `name` and `characters` differ only in that the name flattens `\r\n` to spaces.

## 🔥 THE load-bearing rule: the naming grammar + CDN contract

Five loose page-level TEXT nodes at `x=510` (no wrapping frame — `parent` is the PAGE). Verbatim:

> `📌 해외주식` (`3720:921`)
> `이미지 네이밍 룰` (`3720:918`)
> **`ss_img_ci_국가티커(알파벳).png`** (`3720:920`)
> `CDN 주소` (`3720:917`)
> **`downloadcdn.nhqv.com/mts/ci/이미지명.png`** (`3720:919`)

**Identical CDN host and path to the domestic page** — `downloadcdn.nhqv.com/mts/ci/` serves domestic and overseas from one flat namespace, disambiguated only by the code shape. Resolved contract:

```
https://downloadcdn.nhqv.com/mts/ci/ss_img_ci_<국가><티커>.png
```

**`국가티커` is ONE concatenated token, not two.** The rule writes it as a single placeholder, and the ETF page's exemplar frame proves the split: `ss_img_ci_usaaapl` = `usa` + `aapl`. **Every one of the 798 assets on this page is `usa`-prefixed** — no other country code appears, despite the grammar promising `국가`. **The `국가` slot is real but currently single-valued.**

On the ETF page the same rule renders **colour-coded** (`ss_img_` white / `ci_` cyan / `국가티커(알파벳)` yellow / `.png` white) — the token boundary is **colour-encoded and invisible to `get_metadata`**. Recovered by screenshot.

⚠️ **`(알파벳)` is contradicted by its own inventory**, just as `(숫자)` is on the domestic page: `ss_img_ci_usaabc2`, `ss_img_ci_usaleg2`, `ss_img_ci_usalvb1` carry **digits**, and `usabrk.a` / `usabf.b` / `usalen.b` carry **dots**.

## ⭐ Exact counts (`.length`) vs the heading — the heading is EXACT for one thing and STALE for another

On-canvas heading (`3720:936`), verbatim:

> `이미지 CI 리스트 (711)`

| Measure | Value | Method |
|---|---|---|
| Manifest lines in `1427:718` | **711** | `characters.split(/\r?\n/).filter(Boolean).length` |
| Manifest **distinct** entries | **711** | `new Set(...).size` — **zero duplicates in the manifest** |
| **Distinct `ss_img_ci_*` assets on canvas** | **798** | `new Set(names).size`, non-TEXT, **Plugin API** |
| `ss_img_ci_*` non-TEXT nodes | **809** | `.length`, Plugin API |
| — of which `RECTANGLE` (legacy `기존 ` block) | **712** (706 distinct) | `.length` |
| — of which `FRAME` (post-manifest additions) | **91** | `.length` |
| — of which `GROUP` / `VECTOR` | **5** / **1** | `.length` |
| All `ss_img_ci_*` nodes incl. caption TEXT | **813** | `.length` |

> ✅ **Recounted via the Plugin API after `get_metadata` was proven lossy on the domestic page** (it drops `GROUP`s; see `nds-ci-domestic-stock.md`). **This page survives the correction intact — 798 both ways** — because only 5 of its assets are `GROUP`s. **The XML happened to be safe here; that was luck, not reliability.**

**The finding is the disagreement — and it is subtler than "stale by N".**

- **The heading is EXACT for the manifest: 711 = 711.** Unlike `Nmoji: 142개`→152 and `Emoji IMG : 80개`→91 in the sibling file, **this heading was not left to rot against its own list.**
- **But the canvas has moved on: 798 distinct assets — 87 more than the manifest documents.** 94 canvas assets are absent from the manifest; 7 manifest entries have no canvas asset under that exact name (the share-class losses above).
- **So the heading is accurate about the manifest and misleading about the page.** The manifest froze; the canvas kept growing. Anyone reading `(711)` as "this page holds 711 CIs" is wrong by 87.

**The 94 canvas-only assets** are the post-manifest batches, and they carry their own dated labels (below). Sample: `usaarm` (ARM), `usaqqq`, `usaspy`, `usanvda`-era additions, `usameta`, `usafig` (Figma), `usaspcx` (SpaceX), `usaduol`, `usaonon`, `usawbd`, `usastla`, `usapara`, `usanu`, `usatko`, `usavici`, `usaubs`, `usabp`, `usadeo`, `usajd`, `usagds`, `usalilak`, `usalbrdk`, `usalsxma`/`usalsxmk`, `usallyva`/`usallyvk`, `usaqrtea`, `usaczoo`, `usabrze`, `usaeurn`, `usaewj`/`usaewjv`, `usaiusg`, `usavgt`, `usaphys`, `usasblk`, `usasbsw`, `usaskyw`, `usasnse`, `usaabcl`, `usaacad`, `usaacgl`, `usaalgm`, `usabah`, `usabig`, `usabnre`, `usacccs`, `usacohr`, `usacomp`, `usacp`, `usacrgy`, `usacsgp`, `usafds`, `usaflex`, `usafrcb`, `usagenk`, `usagrov`, `usah`, `usahhh`, `usahpp`, `usahrow`, `usakbh`, `usakbr`, `usaknsl`, `usamir`, `usamkl`, `usamrvl`, `usamtn`, `usancno`, `usantra`, `usanxst`, `usanycb`, `usaonon`, `usaovv`, `usapcor`, `usapds`, `usaqsr`, `usareal`, `usargen`, `usarh`, `usasb`, `usasig`, `usasiri`, `usastne`, `usateck`, `usatxg`, `usavrt`, `usavst`, `usavtle`, `usavts`, `usawwd`, `usazi`, `usaewjv`, `usalen.b`, `usabf`, `usabrk`, `usaspcx`, plus `ss_img_ci_etc`.

⚠️ **`ss_img_ci_etc` appears in the canvas-only set** — it is the fallback/unknown-issuer asset and is **the one name on this page that is also a COMPONENT_SET elsewhere in NDS_CI** (see below).

## The naming grammar — verbatim

Canonical (`3720:920`):

> `ss_img_ci_국가티커(알파벳).png`

Observed forms across **798 distinct** names:

| Form | Example | Note |
|---|---|---|
| `ss_img_ci_usa<ticker>` | `ss_img_ci_usaaapl` | canonical; **all 798 are `usa`** |
| `ss_img_ci_usa<ticker><digit>` | `usaabc2` `usaleg2` `usalvb1` | ⚠️ digits, vs `(알파벳)` |
| `ss_img_ci_usa<ticker>.<class>` | `usabrk.a` `usabrk.b` `usabf.b` `usalen.b` | ⚠️ dotted share class |
| `ss_img_ci_usa<ticker><class>` | `usafoxa` `usanwsa` `usauaa` `usadisck` `usallyva` `usallyvk` `usalsxma` `usalsxmk` | ⚠️ concatenated share class — **competing convention** |
| `ss_img_ci_etc` | — | fallback; **not `usa`-prefixed, breaks the grammar** |

### ⭐ Is the country prefix fixed 3-width? — TESTED. Yes today, undocumented, and one asset proves the ambiguity is real.

Measured across **798 distinct names** (Plugin API):

| Test | Result |
|---|---|
| names prefixed `usa` | **797** |
| names NOT prefixed `usa` | **1** — `ss_img_ci_etc` |
| distinct country prefixes in evidence | **1** (`usa`) |

**The `국가` slot is real but has exactly one value on this page.** So a fixed-3 parse (`slice(0,3)` = country, remainder = ticker) is **correct today for 797 of 798** — `ss_img_ci_etc` being the sole break.

**But the ambiguity the guide never resolves is live, and here is the proof:**

> **`ss_img_ci_usaa` = `usa` + `a`** — Agilent Technologies, whose ticker is the single letter **`A`**.

**`usaa` is simultaneously readable as a 4-char country prefix and as `usa`+`a`.** Nothing in the filename disambiguates it; **only the out-of-band knowledge that the country slot is 3 wide** makes it parseable. **17 single/double-letter tickers make this a systematic exposure, not a one-off:** `a` `ba` `bb` `be` `bf` `bk` `bp` `br` `c` `cb` `ce` `cf` `ci` `cl` `cp` `d` `dd` `de` `dg` `ea` `ed` `eh` `el` `es` `ew` `f` `fb` `fe` `fl` `gd` `ge` `gl` `gm` `gs` `h` `hd` `ip` `ir` `it` `j` `jd` `k` `ko` `kr` `l` `lh` `li` `lw` `ma` `mo` `ms` `mu` `ni` `nu` `o` `pg` `ph` `pm` `qs` `re` `rf` `rh` `rl` `sb` `so` `sq` `t` `tt` `u` `ua` `v` `vz` `wm` `wu` `wy` `zi` `zm` (77 of them ≤2 chars).

⚠️ **`ss_img_ci_usakr` = `usa` + `kr`** (Kroger). **A naive reader sees the country codes `usa` and `kr` concatenated.** Likewise `ss_img_ci_usako` (Coca-Cola, `KO`) and `ss_img_ci_usajd` (JD.com). **The moment a second country prefix ships, these become genuinely undecidable without a width rule.**

**Recommendation for CORE: state the width rule explicitly — `국가` is fixed 3 chars, lowercase; the remainder is the ticker.** It is true, load-bearing, and **written down nowhere.**

⚠️ And the same country/currency confusion as `nds_flag`: **the filename grammar uses the country code `usa`, while `ss_img_ci_etc`'s variant axis uses the *currency* code `Country=usd(미국)`.** Same concept, one place says `usa`, the other says `usd`, and the axis is *labelled* `Country`. **Identical class to `nds_flag` shipping ISO-4217 under a `(국가코드)` caption** (`nds-lib-icons`). **This is now a three-site pattern in NDS — it is a house habit, not an accident.**

## 🔥 Invisibility mechanisms found on this page — 2 of the 5, and 3 conclusively absent

Enumerated by API. `get_metadata` sees none of these.

1. **`opacity` ghosting — CONCLUSIVELY ABSENT.** `all.filter(n => n.opacity < 1)` → **`[]`, zero nodes.** Despite the file-wide ghosting convention (65/153 illusts in `nds-lib-illusts`; 2 assets on the domestic page at 0.10/0.20), **this page uses none of it.** A meaningful negative: retirement here is expressed by the manifest, not by opacity.
2. **`hidden` — CONFIRMED, only 2 nodes.** `image 29` (`3279:1703`, RECTANGLE) and one `scale guide` (`5962:496`). Not rule-bearing; not quoted.
3. **`STRIKETHROUGH` — CHECKED, NONE.** `getStyledTextSegments(['textDecoration'])` across all 21 TEXT nodes → `NONE` on every segment, **including the 15,886-char manifest**. ⭐ **This matters: if any of the 711 manifest lines had been struck through, that would silently retire an asset. None are.** The manifest is wholly live.
4. **Fill-matching / invisible text — CHECKED, none.** All 21 TEXT nodes `visible: true, opacity: 1`.
5. **INSTANCE overrides — N/A.** **Zero INSTANCEs on this page.**

### Retirement vocabulary: NONE

Swept `👿` / `제외` / `해당없음` / `구버전` / `이전` / `미사용` / `deprecated` / `백업` / `폐기` / `중단`. **Zero hits.** No `👿` anywhere. **This page has no deprecation marker of any kind** — the only supersession signal is the `usafb`→`usameta` rename record.

## The one rename record on the page

Three nodes at `x≈1306, y≈4274` form a before/after pair — verbatim:

> `큰손픽 _ 24.05.27` (`3470:2`)
> `ss_img_ci_usafb` (`3470:4`) — TEXT label
> `ss_img_ci_usameta` (`3470:5`) — TEXT label

with a live `ss_img_ci_usafb` RECTANGLE (`3470:3`) beside them. **Facebook → Meta.** ⚠️ **Both names still ship** — `usafb` is in the manifest and on canvas; `usameta` is on canvas only. **The old name is not retired, struck, or ghosted.** A consumer resolving Meta's CI has two valid-looking answers and no on-canvas rule saying which wins. **Unresolved; the `24.05.27` stamp implies `usameta` is the intent.**

`not image` (`3279:1816`) — a bare TEXT label with no attached asset. Blank at source; not interpreted.

## Dated batch labels — this page's recency convention

**No `Last update` stamp.** Instead, per-batch labels (verbatim), each marking a tranche of additions:

| Label | Node |
|---|---|
| `큰손픽_24.05.10` | `3193:328` |
| `큰손픽_24.05.27` | `3279:1807` |
| `큰손픽 _ 24.05.27` | `3470:2` |
| `미국 주식 월배당 서비스 _ 24.10.21` | `4010:288` |
| `피그마 FIG _ 25.08.01` | `4829:267` |
| `스페이스 x_ 26.06.12` | `5962:512` |

⚠️ **The label format is unstable across all six**: `큰손픽_24.05.10` (no spaces) vs `큰손픽 _ 24.05.27` (spaces both sides) vs `스페이스 x_ 26.06.12` (space before, none after). **Two labels share the date `24.05.27` with different spacing** — `3279:1807` and `3470:2`. Not a duplicate; two separate batches on one day.

**`26.06.12` (`ss_img_ci_usaspcx`, SpaceX) is the newest evidence of life.** ⚠️ `usaspcx` appeared **twice** in the raw name sweep (`5962:482` frame + a nested node) — it is the page's newest asset and already has a duplicate-name shadow.

## Structure: two generations

- **`기존 ` (legacy)** — note the **trailing space** in the name, same as the domestic page's `502:2`. Holds **712 `RECTANGLE`s** (image-fill rasters), `exportSettings: []` — **the legacy block has NO export settings at all.** These are the ~711 manifest assets.
- **Post-manifest additions** — **91 `FRAME`s** at page top level, each 200×200 with **exactly 1 export setting**. Same shape as the domestic page's frames.

⭐ **The generational split explains the drift.** The legacy rasters were exported once and enumerated into the manifest; the new frames each carry their own export config and **were never added to the manifest**. **The manifest is a snapshot of the RECTANGLE generation only.**

## CORE — componentKeys found

**NONE. Zero COMPONENTs and zero COMPONENT_SETs on this page** — `findAllWithCriteria` returned `[]` for both. **Zero INSTANCEs**, so no key is even indirectly resolvable from this page.

**Verification: `unverified` / not applicable.** There is nothing to verify.

## The `NDS_StockIcon_CI` relationship — PARTIALLY RESOLVED

`get_libraries({fileKey: 'KmpaYeoYh41F6nyIKvBQ7h'})`:

- **Subscribed** (`libraries_added_to_file`): `NDS_Templates`, `NDS_Library`, `NDS_Darkmode Colors`, `NDS_Colors`. **No `NDS_StockIcon_CI`.**
- **Available** (`libraries_available_to_add`): 5 community kits (Material 3, Simple Design System, iOS/iPadOS 26 & 27, watchOS/visionOS/macOS 26 & 27) + 4 org libraries (`가이드 ⚙️ EMS`, `운영 ⚙️ EMS`, `NDS_M.web`, `가이드 ⚙️ 홈페이지`). **No `NDS_StockIcon_CI`.** `libraries_available_to_add_next_offset: null` — **the list is complete, not paginated short.**

**`NDS_StockIcon_CI` does not exist as a library visible from NDS_CI.** This page publishes nothing.

**However** — the ETF page's `ss_img_ci_etc` instance resolves to a **`COMPONENT_SET`, `remote: false`, SET key `f3a7b6ed87a9914c0dca2f1f87d2c77cd9164dc4`**, i.e. **local to NDS_CI but on a page outside my three.** `ss_img_ci_etc` also appears on *this* page as a plain node. **NDS_CI does host component sets — just not on 국내주식/해외주식/ETF.**

**Verdict: `NDS_StockIcon_CI` unidentified as a library name.** The LEDGER's "named library outside the learned set" most likely refers to **NDS_CI's own component-bearing page(s)**, which remain unlearned. See `nds-ci-etf.md`.

## Conflicts / LEDGER candidates

1. **⛔ Zero components across 798 assets — the CDN URL is the only integration path.** Same verdict as the domestic page. **A BUILD pass cannot import an overseas stock CI as a component.**
2. **⭐ Layer names drop share-class suffixes; the manifest keeps them.** 6 duplicate canvas names ↔ 13 distinct manifest entries. **7 securities are unreachable by layer name.** The highest-consequence defect on this page.
3. **Two competing share-class encodings ship simultaneously** — dotted (`usabrk.a`) and concatenated (`usafoxa`). Neither documented.
4. **The `(711)` heading is exact for the manifest, stale by 87 for the canvas.** ⚠️ **Contrast the sibling-file pattern** (`Nmoji: 142개`→152): those headings were wrong about their own list. **This one is right about its list and wrong about its page.** Different failure mode — worth distinguishing in the LEDGER, because "heading counts are systematically stale" is *not* the right lesson here.
5. **`(알파벳)` contradicted by shipped names** carrying digits (`usaabc2`, `usaleg2`, `usalvb1`) and dots (`usabrk.a`). Mirrors the domestic page's `(숫자)` vs 55 alphanumeric codes. **Both grammars under-describe their inventories — a file-wide pattern, not a one-off.**
6. **`ss_img_ci_usafb` and `ss_img_ci_usameta` both live.** Rename recorded (`24.05.27`), old name never retired.
7. **`ss_img_ci_etc` breaks the `usa` grammar** and is the one name here that is a COMPONENT_SET elsewhere in NDS_CI. **Cross-page conflict: same name, two node kinds.**
8. **Zero opacity ghosting on this page** while the domestic page has 0.10/0.20 ghosts and `nds-lib-illusts` has 65. **The ghosting convention is NOT file-wide within NDS_CI.** A sweep assuming it is will report false clean.
9. **Batch-label format unstable** across all six labels; two share `24.05.27`.
10. **Cross-file corroboration (NOT a conflict):** `ss_img_` = shipped-asset namespace, consistent with `nds-lib-icons`'s `ss_img_quickbar` / `ss_img_filter` and with the domestic page. **Zero `nds_` names here** — consistent with zero components.

## Gaps / unverifiable

- **`usanvda` (Nvidia) is in the manifest but has no `RECTANGLE` under that name** — it resolves only when I widen the sweep to all non-TEXT nodes. It is present, but its node kind differs from its neighbours'. Not chased further.
- **Whether `usafb` or `usameta` is canonical** — the `24.05.27` stamp implies `usameta`; no on-canvas rule says so. Unresolved.
- **Whether the 94 canvas-only assets are actually on the CDN** — the manifest is the only evidence of what was published, and it predates them. **Undeterminable read-only.** Needs an HTTP probe of e.g. `downloadcdn.nhqv.com/mts/ci/ss_img_ci_usaspcx.png`.
- **The legacy `기존 ` RECTANGLEs have `exportSettings: []`** — so the export config that produced the 711 PNGs is **not recorded in the file**. The 200×200 / PNG / 1× spec is read off the *new* frames and assumed to apply retroactively. **Assumption, not evidence.**
- **I did not transcribe all 798 tickers** — per method, the grammar + exact counts + exception classes are the deliverable. Both the manifest and the canvas name list are recoverable from the saved dump.
- **`not image` (`3279:1816`)** and `image 29` (hidden) — uninterpreted.
- **No `Last update` stamp.** Recency rests on `26.06.12`. **No stamp ⇒ recency inferred, not asserted.**
</content>
