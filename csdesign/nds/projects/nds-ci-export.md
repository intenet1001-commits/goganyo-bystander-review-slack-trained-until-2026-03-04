---
name: nds-ci-export
fileKey: KmpaYeoYh41F6nyIKvBQ7h
source_url: "https://www.figma.com/design/KmpaYeoYh41F6nyIKvBQ7h/NDS_CI?node-id=825-4"
learned_date: 2026-07-16
sections_studied:
  - "825:4 (page 'export' — 13 top-level FRAMEs, 209,573 descendants; the whole page is one repeated artboard)"
  - "825:5 (frame '코스피01' — the canonical board, 2,533 children; ALL 12 sibling frames are name-set-identical to it)"
  - "825:5 on-canvas headings (14 TEXT nodes: 5× '코스피  No. …', 8× '코스닥  No. …', + 1 stray '원준')"
  - "825:862 (FRAME 'ss_img_ci_053590' — the ONLY FRAME among 2,491 assets; clipsContent:true)"
  - "825:866 (TEXT '9bcc3d' inside ss_img_ci_053590 — a hex colour left as live text; clipped, does not ship)"
  - "825:5535 (TEXT '원준' — company name for ticker 382840, annotating the badge 80px away; not a designer)"
  - "825:8348 (GROUP 'ss_img_ci_030200' — 49×49, the sole geometry violation)"
  - "825:17180 area / ss_img_ci_017180 (GROUP with a second, stranded Bitmap at dx+400)"
status: "unknown — the page carries NO date stamp of any kind. A sweep of all 442 TEXT nodes for /last update|업데이트|수정일/ returned zero hits. There is no author, no version, no 제작중/deprecated marker anywhere on the page. Liveness cannot be established from the page itself; the x2 export settings are live and internally consistent, which is the only positive evidence."
---

# NDS_CI — export

**This is not a spec page and not a delivery staging area. It is a live export rig.**

The page is a single artboard of **2,457 circular corporate-identity badges**, one per Korean stock ticker, each wired with its own PNG export setting. You do not read rules off this page — you *press Export* on it. The reusable knowledge is the **naming grammar**, the **multiplier**, and the **geometry contract**, all three of which are machine-readable from `exportSettings` rather than written down anywhere on the canvas.

And it answers the domain's contested multiplier question — see below.

## The shape of the page

| Metric | Exact value (via `.length` / `findAllWithCriteria`) |
|---|---|
| Total descendants | **209,573** |
| Top-level children | **13** (all `FRAME`) |
| `VECTOR` | 83,226 |
| `GROUP` | 51,454 |
| `ELLIPSE` | 42,757 |
| `RECTANGLE` | 25,779 |
| `FRAME` | 3,055 |
| `BOOLEAN_OPERATION` | 2,860 |
| `TEXT` | 442 |
| `COMPONENT` / `COMPONENT_SET` / `INSTANCE` / `SLICE` | **0** |

**Zero components. Zero instances. Zero slices.** Every badge is raw flattened geometry. This is why the page is 11M chars of metadata: 209k vector nodes with no instancing to compress them.

### The 13 frames are byte-identical duplicates

| Frame | Node ID | Size | Children |
|---|---|---|---|
| `코스피01`–`코스피05` | `825:5`, `825:16126`, `825:32247`, `825:48368`, `825:64489` | ~1770–1820 × 4275 | 2,533 each |
| `코스닥01`–`코스닥08` | `825:80610` … `825:193457` | ~1781–1838 × 4275 | 2,533 each |

I compared the child **name sets** of all 12 siblings against `코스피01` (`825:5`). **Every diff is empty — 0 missing, 0 extra, in all 12.** Same 2,533 names, same join-length (42,882 chars), same first (`Ellipse 11`) and last (`홍콩`) entry.

**The frame names lie about their contents.** A frame named `코스닥08` does **not** contain KOSDAQ batch 8. It contains the complete set — every 코스피 *and* every 코스닥 badge, exactly like every other frame. Each frame internally carries all 13 section headings (`코스피 No. 000000~003545`, `코스닥 No. 331380~950220`, …), so the market/batch partition the names promise exists *inside* each frame, not *across* them.

The naming reads as an **abandoned partition plan**: someone duplicated the board 13 times intending to trim each copy down to its named batch, and never did. The consequence is a **13× redundancy — 209,573 nodes where 16,121 would do** — and a live trap: exporting `코스닥08` gives you the entire corpus, not batch 8.

> **Do not treat the 13 frames as a work-split.** They are 13 copies of one thing. Read or export exactly one (`825:5`); the other twelve are dead weight.

## ⭐ The export multiplier — this page settles it, for CI assets

The sweep across all 209,573 nodes for `exportSettings`:

| Setting | Node count | Share |
|---|---|---|
| `PNG`, `contentsOnly:true`, `SCALE 2` | **32,747** | 99.0% |
| `PNG`, `contentsOnly:true`, `SCALE 4` | 286 | 0.9% |
| `PNG`, `contentsOnly:true`, `SCALE 1` | 39 | 0.1% |
| `PNG`, `useAbsoluteBounds:false`, `SCALE 2` | 13 | — |
| **Total carrying export settings** | **33,085** | of 209,573 |

**The asset-level convention is unambiguous: PNG @ 2x.** The `SCALE 2` setting sits on the `ss_img_ci_<ticker>` GROUP — the export unit — and on 2,514 of the 2,533 direct children of each frame (32,747 ≈ 2,514 × 13).

**The `SCALE 4` is a different thing and must not be confused with it.** All 13 top-level frames carry `SCALE 4` — 13 of the 286. Exporting a *frame* at 4x yields a 7080×17100 contact sheet of the whole board. **Frame-level 4x = proof sheet; asset-level 2x = the deliverable.** The two multipliers coexist because they export different objects at different granularities.

### What this does and does not resolve for the LEDGER

**Resolves:** CI badge assets ship at **x2**, stated not in prose but in 32,747 live `exportSettings`. This is the strongest form of evidence available — it is what Figma will actually emit, not a claim about what someone should do. It **agrees with** the sibling file's Label convention (`2x`) and **disagrees with** `📌 nds_illust ( X1배수 전달 )` and the 9-patch `x1`.

**Does not resolve:** this is evidence for **one asset class (CI badges)**, not a domain-wide rule. The page contains no prose statement of a multiplier convention, so it cannot adjudicate the 9-patch or illustration contradictions. It **strengthens the reading that the multiplier is per-asset-class, not global** — which is precisely why `(NEW) illustration Asset Usage` step 4 says `필요 배로 추출` ("extract at the required multiplier") rather than naming a number. That instruction is not vague; it is **correct**, and the undated `X1배수 전달` note is the thing out of step with it.

## The naming grammar

**Canonical form: `ss_img_ci_<6-digit ticker>`** — 2,457 of 2,491 `ss_img_ci_*` groups (98.6%) match `/^ss_img_ci_\d{6}$/` exactly.

Note the prefix: **`ss_`**, one of the prefixes the sibling `- Img Naming Rule` page documents (`nds/ndsw/ex/event/ms/ss/biz/squad/lottie`). This page is a large, consistent corpus of `ss_` in the wild. But it uses **none** of the `sn/nn/sd/nd` mode infixes that grammar defines — the CI set is mode-less.

### Special (non-ticker) names — the full set, all `PNG@2x`

Asset-class buckets rather than tickers:

| Name (verbatim) | Meaning (from its embedded TEXT) |
|---|---|
| `ss_img_ci_000000` | `국내\n코스피` — domestic KOSPI fallback |
| `ss_img_ci_999999` | `국내\n코스닥` — domestic KOSDAQ fallback |
| `ss_img_ci_knx` | `국내\n코넥스` — domestic KONEX |
| `ss_img_ci_etc` | `국내\n기타` **and** `기타` (two groups, same name) |
| `ss_img_ci_global_etc` | `해외\n기타` |
| `ss_img_ci_global_stock.png` | `해외\n주식` — **carries a `.png` extension in the layer name** |

`000000` and `999999` are **sentinel tickers**, not real ones — the placeholder badge shown when a KOSPI/KOSDAQ stock has no CI. Ten further groups named for countries (`일본`, `홍콩`, `중국`, `독일`, `영국`, `호주`, `인도네시아`, `베트남`, …) plus `국내 ETF` / `해외 ETF` / `국내 ETN` / `해외 ETN` all carry `해외\n주식`-style TEXT and sit **outside** the `ss_img_ci_` grammar entirely — they are named in Korean, not by the convention.

### Malformed names — 34 of 2,491, every one live at `PNG@2x`

These are **not** cosmetic. The layer name *is* the exported filename, so each one ships broken:

| Defect | Instances (verbatim) |
|---|---|
| **Leading space in ticker** | `ss_img_ci_ 080420`, `ss_img_ci_ 241840`, `ss_img_ci_ 338100`, `ss_img_ci_ 33626L` |
| **Doubled `ci_` infix** | `ss_img_ci_ci_001380`, `ss_img_ci_ci_000180` |
| **Stray `#`** | `ss_img_ci_#025900` |
| **Empty ticker** | `ss_img_ci_` |
| **Extension in name** | `ss_img_ci_global_stock.png` |

**5-digit + letter suffix (`K`/`L`/`M`) — 21 instances, and these are legitimate:** `ss_img_ci_00088K`, `00104K`, `00279K`, `00499K`, `00680K`, `00781K`, `00806K`, `02826K`, `03473K`, `03481K`, `08537M`, `26490K`, `28513K`, `33626K`, `33637K`, `33637L`, `35320K`, `36328K`, `37550K`, `37550L`, `38380K`. These are **preferred shares** — the Korean convention appends `K`/`L`/`M` to a 5-digit stem (e.g. `00088K` = 우선주 of `000880`). They break the `\d{6}` pattern by design, not by error. **Do not "fix" them.**

### Duplicate tickers — 16, and 2,440 unique of 2,457

`uniquePure` = **2,440**; `pureTickerCount` = **2,457**. Seventeen duplicate entries across 16 tickers:

`000000` (**×3**) · `180640` · `383220` · `096760` · `030200` · `025530` · `035510` · `019170` · `009540` · `009150` · `008770` · `005380` · `005300` · `003920` · `001510` · `000720`

Most are **adjacent twins** — same `y`, `x` differing by exactly 183 (the column pitch), identical child structure (`Oval/Oval/Bitmap`). That is a copy-paste artefact sitting one slot over, not a variant pair. **Two duplicate layer names ⇒ two files with the same name ⇒ one silently overwrites the other on export.** This is the same duplicate-key failure mode `NDS_Library` exhibits, reproduced here at asset level.

`000000` is the interesting one: **3 copies with genuinely different innards** — `825:5409` (`Ellipse 6`), `825:5415` (`Ellipse 28`), `825:15986` (`Ellipse 210/국내주식`, the one that actually carries the `국내\n코스피` label). Only the third is the real sentinel; the other two are empty circles squatting on its name.

`009540` differs structurally too (`Ellipse 28/ss_img_009540` vs `Oval/Oval/Bitmap`) — note the inner layer `ss_img_009540`, **missing the `ci_` infix**.

## The geometry contract

Every badge is **50×50**. Size histogram of the 2,514 exported direct children of `825:5`:

| Size | Count |
|---|---|
| 50×50 | **2,512** |
| 150×20 | 1 |
| 49×49 | 1 (`ss_img_ci_030200`, `825:8348`) |

So: **50×50 @ 2x → 100×100 px PNG.** Two violations, both live and both exporting. `030200` at 49×49 emits a 98×98 file — one pixel short in each axis, and it is one of the duplicated tickers.

**The export unit is a GROUP — with exactly one exception.** Type histogram across the 2,491 `ss_img_ci_*` assets in `825:5`:

| Type | Count |
|---|---|
| `GROUP` | **2,490** |
| `FRAME` | **1** — `ss_img_ci_053590` (`825:862`), `clipsContent: true` |

**Two construction patterns**, both landing on 50×50:

```
# Masked (737 of 2,491)
ss_img_ci_<ticker>      GROUP 50×50        ← PNG @2x (the export unit)
├── Oval                ELLIPSE 50×50      ← the coloured disc
├── Oval  [isMask=true] ELLIPSE 50×50      ← circular mask
└── Bitmap              RECTANGLE ~51–74px ← oversized art, clipped to the circle

# Unmasked (1,754 of 2,491)
ss_img_ci_<ticker>      GROUP 50×50
├── Ellipse             ELLIPSE 50×50      ← the coloured disc
└── <logo artwork>      RECTANGLE/FRAME ~24–40px  ← pre-fitted mark
```

**The mask is load-bearing and explains an apparent defect.** I found **40 assets whose children render outside their parent's 50×50 box** (e.g. `ss_img_ci_225190`'s `Bitmap` is 74px at dx −12). These are **not defects** — the `Oval[MASK]` clips them, so the group's `absoluteBoundingBox` stays exactly 50×50 and the export is unaffected. A group's bbox would normally be the union of its children; the mask is what holds the contract. **Do not "fix" oversized bitmaps inside masked badges.**

One of the 40 *is* a genuine defect: **`ss_img_ci_017180` has two `Bitmap` children** — one correctly masked, one stranded at dx +400, dy +136. It sits below the mask in the layer order, so it is clipped and does not ship. Debris, not a live break.

The logo child keeps its **source filename** verbatim, never normalised: `logo-225 1`, `INFINITT Healthcare CI 1`, `ko_logo 1`, `아이에스이커머스 1`, `j1-removebg-preview 1`, `Bitmap`, `Object`, `741`. **`j1-removebg-preview 1` is a remove.bg output shipped as-is.** Only the *asset* name matters for export; the children are unmanaged.

## Name reliability + invisibility sweep

**Name-reliability verdict: SPLIT — and the split is the useful part.**

- **Group names (`ss_img_ci_*`): AUTHORITATIVE.** They are the export filenames. Read them byte-for-byte; the 34 malformed ones are real defects, not display artefacts.
- **Frame names (`코스피01`…`코스닥08`): FALSE.** They claim a partition that does not exist. Verified by exhaustive set-diff.
- **Child/artwork names: MEANINGLESS.** Source-file residue.
- **TEXT layer names: reliable here** — I compared `name` vs `characters` on all 442 and found no override divergence, except that `name` drops the double-space (`코스닥 No.` vs characters `코스닥  No.`).

**Explicit sweep results for all five invisibility mechanisms:**

| Mechanism | Result |
|---|---|
| **(a)** Fill-matching-background | **Not found.** Both anomalous TEXTs (`9bcc3d`, `원준`) are `#333333` on the grey board — visible. |
| **(b)** `STRIKETHROUGH` | **Zero.** `getStyledTextSegments(['textDecoration'])` across every TEXT in `825:5` returned no strikethrough segment. |
| **(c)** ⭐ **Opacity ghosting** | **Swept — NOT the convention here.** Exactly **26 nodes** have `opacity < 1`, all `0.4`, all leaf `VECTOR`s **inside** logo artwork. 26 ÷ 13 frames = **2 per frame** — i.e. two logos use 40% opacity as *artwork*. **No group, no asset, no frame is opacity-parked.** The file-wide "parked/superseded" convention is **absent from this page** — consistent with it being a machine rig, not a curated board. |
| **(d)** Instance overrides | **N/A — there are zero INSTANCE nodes on the page.** |
| **(e)** `hidden="true"` | **390 hidden nodes** = **30 per frame**. All are *inside* asset groups (`Bitmap`, `logo-315 1`, `쿠콘 1`, `브이원텍 2`, `동아화성1 1`, `프럼파스트1 1`, `코웰패션1 1`, `Group 37`, …) — superseded source artwork left switched off. **No `ss_img_ci_*` group is itself hidden**, so nothing is hidden from export. |

**`👿` / deprecation sweep: ZERO hits.** Regex `/👿|제외|해당없음|구버전|이전|미사용|deprecated|백업|폐기|중단|삭제|보류|제작중/i` across all 209,573 node names returned **nothing**. No scope declarations, no exclusions.

**U+0008 control chars: ZERO.** Swept all names for `/[\x00-\x1F]/` — clean. The malformed names here use **ordinary U+0020 spaces** (`ss_img_ci_ 080420`), which is a different defect from the `\b` problem elsewhere in the domain.

**`_black` (dark mode): NOT USED as a convention on this page.** Two hits, both **coincidental source-filename residue inside artwork**, not asset names: `EnGIS_Logo_bg_black 1` and `symbol-ananti__black 1` (note the double underscore — a vendor's filename, not NDS grammar). **No `ss_img_ci_*` group carries `_black`.** → **The CI badge set has no dark-mode variants at all.** Given `_black` is a confirmed file-wide NDS convention (per `nds-lib-images.md` and the Lottie page), its total absence here is a **real finding**: CI badges are mode-invariant, presumably because the coloured disc supplies its own background in both themes.

**`_old` (deprecated): ZERO hits.** No deprecation marking on this page whatsoever.

## Stray content

### `825:5535` — TEXT `원준` — **a company, not a designer**

Settled by adjacency, not by inference. `원준` sits at absolute (37949, 24242). The nearest `ss_img_ci_*` asset is **`ss_img_ci_382840` at 80px** — and `382840` **is the real KOSDAQ ticker for 원준** (secondary-battery equipment). The badge **exists**; the text is a **human-readable annotation sitting beside it**.

It is the **only** such annotation among 2,491 assets — every other badge is labelled by ticker alone. So it is a one-off note, not a second naming layer. It sits at frame level (parented to `코스피01`, not to the asset), so it is outside every export bound and **does not ship**.

> Correcting my own earlier reading: this is **not** "a label never converted into a badge." I verified `has382840 = true`. The badge was made; the label is leftover scaffolding.

### `825:866` — TEXT `9bcc3d` — **a defect that does not ship, by accident**

A **hex colour left as live text inside an asset** — a designer noted the brand colour and left it in. **13 hits page-wide = exactly 1 per frame**, all in `ss_img_ci_053590`. So it is **one asset's defect, replicated by the 13× duplication** — not a pattern. A page-wide sweep of all 442 TEXTs for `/^#?[0-9a-fA-F]{6}$/` returns **only these 13**.

**Is it visible? Yes — `visible: true`, `opacity: 1`, `#333333`, 14px.** Not hidden, not ghosted, not white-on-white.

**Does it ship? No — and the reason is the single structural exception on the board.** The text sits at dx **−111**, dy **+86** — entirely outside its parent's 50×50 box. `ss_img_ci_053590` is the **only FRAME** among 2,491 assets, and its `clipsContent: true` clips the text away. Export bounds stay 50×50 → a clean 100×100 PNG.

**This is luck, not design.** Had `053590` been a `GROUP` like the other 2,490, the group's bbox would have expanded to the union of its children — roughly 161px wide — and the exported badge **would have carried the text `9bcc3d` baked into it**. The one asset with a stray text is also the one asset that happens to clip.

> **LEDGER-worthy as a latent trap, not a live break.** Converting `053590` to a group, or ungrouping/regrouping it, silently starts shipping the defect. Flag it; don't fix it blind.

Neither stray is hidden, struck through, or opacity-parked. Their survival across all 13 identical frames shows the duplication happened **after** they were introduced.

## ⚠️ What I could NOT cover

Naming these rather than papering over them:

1. **I did not read the 11M-char `get_metadata` dump — deliberately, and I did not need to.** The brief anticipated a dump-and-parse. Instead every number in this note comes from `use_figma` read-only aggregation (`findAllWithCriteria`, `.length`, direct property reads), which is both exact and orders of magnitude cheaper. **No line/indent parse was performed because no dump was taken.** If something is only visible in the XML serialisation and not via the Plugin API, I would have missed it — I am not aware of any such thing, but I cannot rule it out.
2. **I inventoried 2,491 asset names but did not visually verify 2,457 individual badges.** I rendered `825:5` whole (580×1400 for a 1770×4275 board — roughly 0.33×, badges ~16 px). **At that resolution I confirmed the grid, the disc-with-mark form, and the section banding, but could not judge individual mark quality, centring, or crop.** Any claim about a *specific* badge's artwork beyond the groups I opened structurally (`071460`, `071280`, `071200`, `070590`, `070300`, `069920`, `053590`, `017180`, `383220`) is unverified. **I could not render single badges at high zoom: `node.screenshot()` is blocked in read-only mode** (`Error: in screenshot: Can't call "screenshot" in read-only mode`), and `get_screenshot` on a 50×50 node was not worth 2,457 calls. The `9bcc3d` and `017180` conclusions therefore rest on **geometry + `clipsContent` + mask order**, which is deterministic, rather than on a pixel render.
3. **The `해외` country groups (일본/홍콩/중국/독일/영국/호주/인도네시아/베트남) — I read their names and embedded TEXT but did not open their structure.** They sit outside the `ss_img_ci_` grammar and may follow a different geometry contract than 50×50. Unchecked.
4. **The 12 duplicate frames — I verified name-set identity, not pixel identity.** Identical name sets with identical child counts and identical join-lengths is strong, but two frames could in principle differ in *geometry* or *fills* under identical names. I did not diff coordinates or paints across frames. **If the batches were ever meaningfully differentiated, it would be by a mechanism I did not test for** — though the presence of all 13 section headers inside each frame argues strongly against it.
5. **Deep node counts are page-wide; the per-type breakdown is not split by frame.** The 83,226 VECTORs etc. are the ×13 totals. Divide by 13 for the real corpus (~16,121 nodes).
6. **No `Last update`, no date, no author — verified absent, not merely unfound.** I swept all 442 TEXT nodes. The page cannot self-report its liveness. **`status: unknown` is therefore a measured result, not a shrug.**

## What to take away

1. **CI badge assets: `ss_img_ci_<6-digit ticker>`, 50×50, PNG @2x → 100×100.** The multiplier is enforced by 32,747 live `exportSettings`, not by prose.
2. **Frame-level 4x ≠ asset-level 2x.** Different granularity, different purpose. Don't quote the 4x as an asset convention.
3. **The 13 frames are one frame.** Use `825:5`; ignore the rest.
4. **No components, no keys, no dark mode, no deprecation markers, no dates.** This page is a rig, not a spec — and saying so is the honest deliverable.
5. **34 malformed names + 17 duplicate names are shipping today.** Layer name = filename; duplicates silently overwrite.
6. **The circular mask holds the 50×50 contract for 737 badges.** Oversized bitmaps inside them are correct by design. The one asset that clips via `clipsContent` instead (`053590`) is also the one hiding a defect — a coincidence worth knowing before anyone restructures it.
