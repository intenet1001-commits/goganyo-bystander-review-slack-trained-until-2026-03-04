---
name: nds-ci-banks-brokerages-archive
fileKey: KmpaYeoYh41F6nyIKvBQ7h
source_url: "https://www.figma.com/design/KmpaYeoYh41F6nyIKvBQ7h/NDS_CI?node-id=2827-323"
learned_date: 2026-07-16
sections_studied:
  - "2827:323 (page '은행/증권/기관 Archive' — canvas root; 5,616 nodes, 1,495 top-level, only 13 TEXT nodes in the entire page)"
  - "2827:2358 / 2887:6893 (on-canvas heading '🏷 CDN 은행증권 코드  230705' — screenshotted, read in pixels)"
  - "2887:6895 (on-canvas heading '🏷 SVN 마이데이터 기관코드  240320' — screenshotted, read in pixels)"
  - "2827:1260 (text '개발에 적용된 이미지' — 'images applied in development')"
  - "2827:1261 … 2827:2342 / 2887:5795 … 2887:6876 (the two numbered institution grids, '002. 산업은행' … '294. 한국포스증권', 200×200 each)"
  - "2827:324 … (1,020 top-level rounded-rectangles named with 10-char asset codes, e.g. a1aaad0000, 180×180)"
  - "2827:750 … 2827:828 (79 ss_img_sb_NNN savings-bank assets, 90×90)"
  - "511:2 in the SAME file (live '은행/증권/기관' — read for CROSS-PAGE comparison; not part of this page)"
status: "superseded — NOT inferred from the page name. Established by CROSS-PAGE comparison with the live `은행/증권/기관` (511:2), which (a) carries the SAME two labelled code sheets stamped 240328/240328 against this page's 230705/240320, (b) ships the NEW K bank monogram in its main grid — byte-identical PNG hash to its own `신규 버전 CI` exemplar — while THIS page's `089. 케이뱅크` holds the OLD 'Kbank' wordmark, and (c) labels that very wordmark `구 버전 CI` using node ids (2887:2805 / 2887:5440) from THIS page's own id generation. There is NO deprecation marker on this page itself. See 'Status verdict' for the exact limits."
---

# NDS_CI — "은행/증권/기관 Archive" page

## ⭐ THE EVIDENCE — the live page quotes this page's generation and calls it `구 버전 CI`

**This is the strongest form the cross-page test can take, and it is not an inference from the page name.**
The live `은행/증권/기관` (`511:2`) contains two small **history blocks**, each an old-vs-new **pair of the same
asset**, verbatim on canvas:

| Live history block | Contents (left → right) |
|---|---|
| `히스토리 참고용 - SVN 마이데이터` (`6011:183`) | `구 버전 CI` (`6011:202`) → **`a1aajb0000` `2887:2805`** ∥ `신규 버전 CI` (`6011:203`) → `a1aajb0000` `6011:184` |
| `히스토리 참고용 - CDN 은행증권` (`6176:1662`) | `구 버전 CI` (`6176:1694`) → **`ss_img_company_089` `2887:5440`** ∥ `신규 버전 CI` (`6176:1695`) → `ss_img_company_089` `6176:1696` |

**`히스토리 참고용` = "for historical reference".** I screenshotted all four and compared PNG bytes:

| Render | MD5 | What it is |
|---|---|---|
| live `구 버전 CI` (both blocks) | `7cfbf2e75bd5d72dbf999544755060b8` | **dark-navy circle, "Kbank" wordmark** |
| live `신규 버전 CI` (both blocks) | `74a04d00c4280c55d38b7bffe3aae098` | **bright-blue circle, "K" monogram** |
| live **main grid** `ss_img_company_089` (`6014:204`) | `74a04d00c4280c55d38b7bffe3aae098` | **byte-identical to 신규 버전** |
| live **main grid** `a1aajb0000` (`6011:164`) | `74a04d00c4280c55d38b7bffe3aae098` | **byte-identical to 신규 버전** |
| **THIS page** `089. 케이뱅크` (`2827:1894`, `2887:6428`) | `eb53d67e4b3ea974d26d534ce3727511` | **the OLD "Kbank" wordmark** (visual match to `구 버전 CI`) |

**K bank rebranded** (wordmark → monogram). **The live page ships the new mark and explicitly labels the old one
`구 버전 CI`. This page holds the old one.** That is supersession, evidenced, in the direction claimed.

> **The sharpest detail:** the live page's `구 버전 CI` exemplars are node ids **`2887:2805`** and **`2887:5440`** —
> the **`2887:` id block, which is this archive page's own generation** (this page's grids run `2887:5795`–`2887:6876`).
> **The live page is not merely newer; it quotes nodes from this page's creation batch as "the old version".**
> An id-generation observation, but a pointed one.

**Honest limit:** the `eb53d67e…` hash differs from `7cfbf2e7…` because this page's node is a **captioned 200×200
frame** and the live exemplar is a bare asset frame — so the match is **visual, not byte-exact**. I read both
images; they are the same navy "Kbank" wordmark. A VERIFY pass can confirm by rendering `2827:1894`'s inner
asset in isolation.

## ⭐ THE DATE ORDERING — same two code sheets, same vocabulary, this page is 8 months behind

**Both pages label their content with the same two code-system headings.** Read in pixels, verbatim:

| Code sheet | THIS archive page | Live `은행/증권/기관` (`511:2`) |
|---|---|---|
| **`CDN 은행증권 코드`** | **`230705`** (`2827:2359`/`:2360`, `2887:6893`/`:6894`) | **`240328`** (`2887:9335`/`:9336`) |
| **`SVN 마이데이터 기관코드`** | **`240320`** (`2887:6896`/`:6897`) | **`240328`** (`2827:5054`/`:5055`) |

**Both live stamps postdate both archive stamps.** `230705` → `240328` is ~9 months; `240320` → `240328` is 8 days.
**These are not `Last update` stamps** — they are dated *revisions of the code sheet itself*, which is stronger:
they date the **content**, not the page's last touch.

> **Note the tell in `240320` → `240328`:** the SVN sheet was superseded **eight days after** this archive copy
> was stamped. That is a revision cadence, not an abandonment — consistent with "this page holds the previous
> revision", not "this page holds a dead idea".

## ⭐ SET-DIFFERENCE — the archive holds assets the live page dropped, and the live page dropped nothing else

Computed by name-set comparison (`use_figma`, `findAll`) between `511:2` (live) and `2827:323` (this page):

| Family | Live `511:2` | This archive | Only in archive | Only in live |
|---|---|---|---|---|
| 10-char codes (`a1aaad0000`-style) | **167** | **317** | **150** | **0 — empty set** |
| `ss_img_company_NNN` | 67 | 66 | **1** (`ss_img_company_000`) | **2** (`ss_img_company_030`, `ss_img_company_221`) |
| `ss_img_sb_NNN` (savings banks) | **0** | **79** | **79 — the entire family** | 0 |
| `ss_img_ci_*` | 0 | 1 | 1 | 0 |

**`codes_onlyInLive` is the empty set — every one of the live page's 167 codes is also on this page.** For the
10-char SVN code family the live sheet is a **strict subset** of this archive. The archive holds **150 codes the
live page does not**, spanning whole prefix families absent from live (`b1`/`b2`/`b4`/`d1`/`d2`/`d3`/`e1`/`f1` —
live carries essentially only `a1`/`a2`/`a3`). **This directly answers the lead's question: yes, the archive holds
logos the live page dropped.**

> **⚠️ Precision, because the tempting summary is wrong:** this is **NOT** a strict superset overall. The live
> page has **2 `ss_img_company_*` the archive lacks** (`_030`, `_221`) — so the live sheet **added** two
> institutions while dropping others. The relationship is *subset for codes, overlapping for company*.
> **Do not report "the archive contains everything live has".**

**What the 150 dropped codes MEAN is not stated on canvas.** Retired institutions? A narrower live scope? The
live page has a `보험/캐피탈` ("insurance/capital") label the archive lacks, which hints the *scoping* changed —
**but I did not verify that and am not guessing.** Flagged in Gaps.

## Status verdict — `superseded`, by cross-page evidence, with the limit stated

**On this page itself there is NO deprecation marker.** Searched the full 5,616-node dump **and** the real
`characters` of all 13 TEXT nodes **and** screenshots for: `구버전`, `이전`, `미사용`, `deprecated`, `old`,
`백업`, `폐기`, `중단`, `👿`, `제외`, `해당없음`, `사용금지`, `임시`, `보류`, `legacy`/`LEGACY`, `삭제`, `레거시`,
strikethrough, dimming, and a `→ 이동` pointer to a replacement. **None appear on this page.**

**The only keyword family that hits is `구.` — and it is NOT a status marker:**

| Hit | Node | What it actually is |
|---|---|---|
| `226. KB증권(구.KB투자증권)` | `2827:1982`, `2887:6516` | A **former corporate name recorded inside the institution's own label** — "KB Securities (formerly KB Investment & Securities)". Documents a **merger**, not a deprecated asset. |
| `230. 미래에셋대우(구. 미래에셋증권)` | `2827:1997`, `2887:6531` | Same pattern — "Mirae Asset Daewoo (formerly Mirae Asset Securities)". |

**`구.` here means "formerly known as", describing the *institution*; it never marks the *asset*.** A pass that
grepped `구` and reported "2 deprecation markers" would be confidently wrong. **This is the same class of trap the
sibling archives hit with `중단`/`이전`.**

**On on-canvas evidence alone this page would be `unknown`.** What lifts it to `superseded` is the cross-page
chain above — the K bank 구 버전/신규 버전 pair plus the 230705/240320 → 240328/240328 ordering, **both anchored in
the live page's own explicit labels**, not in this page's name.

**Consequence for BUILD: do not use any asset from this page.** Not "unknown, so hold" — *superseded, so don't*.
The live source is `은행/증권/기관` (`511:2`). **Specifically: `089. 케이뱅크` on this page is a known-wrong logo
— K bank's mark changed and the live page says so.**

## ⭐ OPACITY SWEEP — explicit result: ZERO. The file-wide ghosting convention does NOT appear here.

**Ran the sweep the method demands** (`use_figma` + `findAll` + `node.opacity`, `try/catch`-guarded because
**SLICE nodes throw `no such property 'opacity'`** — 134 slices on this page):

| Metric | Result |
|---|---|
| Nodes swept | **5,616** |
| **Nodes with opacity < 1** | **0** |
| Opacity histogram | **`{}` — empty** |
| `struckCount` (`getStyledTextSegments(['textDecoration'])` over all 13 TEXTs) | **0** |

**Uniformly zero, not selectively zero.** The `opacity: 0.10` ghosting convention confirmed on two NDS_Library
pages (65/153 components) has **no instance whatsoever** on this page. **I checked precisely because a merged or
defunct institution's logo is exactly what would get ghosted — and nothing is.** That is a real negative finding:
**this page's supersession is recorded by the LIVE page's labels, not by any in-page marking.** Whoever maintains
this file did not ghost the archive; they annotated the successor.

**`hidden="true"`: 3 nodes** — `신용회복위원회 1` (`2887:7383`), `img 1` (`2887:8437`), `DS투자증권 1` (`2887:8986`).
All are **raster layers hidden inside asset frames** (an underlay beneath the vector art), not hidden rules.
**No text was recovered from them and none is quoted as a rule.**

## Layer-name convention on THIS page — reliable, and unusually so. State it precisely.

**Names on this page are trustworthy — the rare case.** Four disjoint, machine-readable conventions coexist, and
each says what it is:

1. **10-char asset codes** — `a1aaad0000`, `b2aacl0000`, `f1aaok0000` … (**1,020 top-level**, 180×180
   `rounded-rectangle`s). The **SVN 마이데이터 기관코드** namespace. Opaque but consistent.
2. **`ss_img_sb_NNN`** — `ss_img_sb_002` … `ss_img_sb_658` (**79**, 90×90). Savings banks (`sb`); a
   `savings bank` text node (`2887:8150`) sits over the block confirming it.
3. **`ss_img_company_NNN`** — the **CDN 은행증권 코드** namespace, numbered to match the institution codes.
4. **`NNN. <기관명>`** — `002. 산업은행`, `088. 신한은행`, `247. NH투자증권`, `294. 한국포스증권` … The **captioned**
   200×200 frames. **These are the human-readable index and they match their contents.**

**The one thing names do NOT tell you is status** — which is the whole point of this batch. Compare
`nds-lib-illusts-archive`'s refuted `ss_img_` hypothesis: **in this file, status comes from labels and dates,
never from prefixes.** That lesson holds here exactly.

### ⚠️ Two genuine name defects, quoted as found — blank/duplicated at source IS the finding

- **`247. NH투자증권` is DUPLICATED at identical coordinates** — `2827:2093` and `2827:2100` (both x=1466,
  y=14720), and again `2887:6627` / `2887:6634` (both x=1466, y=21586). **Two frames stacked exactly on top of
  each other, same name, in both grids.** Not reconciled; quoted as found. (NH투자증권 is the file owner's own
  institution — a plausible reason for a hand-placed override, but **that is speculation and I am not asserting
  it.**)
- **`a1aaqe0000 1` (`2827:829`)** — a stray Figma-style ` 1` copy suffix, the only code-named node carrying one.
- **`225. IBK투자증권 ` (`2827:1967`)** — **trailing space, [sic]**, preserved verbatim.
- **`061.비엔피파리바은행` / `090.카카오뱅크`** — **missing the space after the period**, [sic], unlike every sibling
  (`060. 뱅크오브아메리카(BOA)`). Preserved verbatim.

## What's actually on the page (inventory only — SUPERSEDED, not for BUILD)

**1,495 top-level nodes. Only 13 TEXT nodes in 5,616 — this page is almost pure asset grid.** Structure, in
on-canvas order:

1. **The 10-char code grid** (`2827:324` …, y≈5,556 onward) — 1,020 × 180×180 assets, the SVN 마이데이터 namespace.
2. **The `ss_img_sb_*` block** (`2827:750`–`2827:828`, y≈7,016–7,646) — 79 × 90×90 savings-bank marks.
3. **`Rectangle 1` (`2827:1259`, 15,500×3,173)** + heading **`개발에 적용된 이미지`** (`2827:1260`) — verbatim,
   "**images applied in development**". A full-width band framing the numbered grid below it. **This label is the
   page's own claim that its contents shipped** — which is precisely why "superseded" (it *did* ship, then was
   replaced) is the right word and "never built" is not.
4. **Numbered institution grid #1** (`2827:1261`–`2827:2342`, y≈13,760–15,160) — `002. 산업은행` → `294. 한국포스증권`,
   under **`🏷 CDN 은행증권 코드  230705`** (`2827:2358`).
5. **`[사용 메뉴]` card** (`2827:2361`) — verbatim, the menus these logos appear in:
   > `[사용 메뉴]`
   > `이체`
   > `오픈뱅킹 - 다른 은행/증권계좌 등록 - 나의자산현황 > NH투자증권 > 채우기 - 다른 은행/증권 - 다른 은행/증권 > 보내기 > 직접입력`
   > `마이데이터_등록/금융투자`
   > `입금계좌지정서비스`
   > `비대면계좌개설 > 1원 역이체 (본인인증)`
6. **Numbered institution grid #2** (`2887:5795`–`2887:6876`, y≈20,626–21,826) — **the same institution list again**,
   under **`🏷 SVN 마이데이터 기관코드  240320`** (`2887:6895`) with headings `은행` (`2887:8636`) / `금융투자` (`2887:8637`).
7. **A second `[사용 메뉴]` card** (`2887:6898`) — **near-identical to #5 but SHORTER: it drops the
   `마이데이터_등록/금융투자` line.** Quoted verbatim:
   > `[사용 메뉴]`
   > `이체`
   > `오픈뱅킹 - 다른 은행/증권계좌 등록 - 나의자산현황 > NH투자증권 > 채우기 - 다른 은행/증권 - 다른 은행/증권 > 보내기 > 직접입력`
   > `입금계좌지정서비스`
   > `비대면계좌개설 > 1원 역이체 (본인인증)`
   > **The live page's `[사용 메뉴]` (`1529:2`) is shorter still** — `이체 / 오픈뱅킹 / 입금계좌지정서비스 /
   > 비대면계좌개설 > 1원 역이체 (본인인증)`, dropping the whole `- 다른 은행/증권…` expansion. **Three generations
   > of the same card, monotonically shrinking.** Consistent with the date ordering; noted, not interpreted further.
8. **Strays**: `ss_img_ci_078020` (`3089:415`) — the **only `ss_img_ci_` node on the page**, an intruder from the
   stock-CI namespace; `ss_img_company_265` ×2 (`3087:65`, `3089:93`); `흥국` (`2887:8198`); one INSTANCE
   (`2887:8591`) of `bankName=산림조합`.

## CORE — componentKeys found

**`findAllWithCriteria({types:['COMPONENT','COMPONENT_SET']})` → `componentCount: 0`.**

**This page defines ZERO components.** Every asset is a raw `rounded-rectangle` / `frame` / vector — a flat image
library, not a component library. **There is no key on this page to promote or withhold.** That is itself worth
recording: the 은행/증권/기관 CI assets are **not componentised in Figma at all** in either generation; they ship
via CDN by filename (see the `[사용 메뉴]` and code-sheet cards). BUILD does not consume them through Figma keys.

**One key observed, NOT from this page and NOT for promotion:**

| Key (full 40-hex) | Kind | Name | Note |
|---|---|---|---|
| `a07e29e59598a09c7fe99dd231a0f5c7b839c249` | **VARIANT** (a member COMPONENT, **not** a SET key) | `bankName=산림조합` | The mainComponent of the page's single INSTANCE (`2887:8591`). **Its SET lives elsewhere — I did not resolve the SET or its key.** **NOT-FOR-PROMOTION**: reached from a superseded page; the SET key, variant axis, and full variant list are all unverified. |

## Conflicts for LEDGER

### 1. **The archive holds 150 institution codes + the entire `ss_img_sb_*` family that the live page dropped** — ⚠ CONTESTED, meaning unresolved

> The live `은행/증권/기관` (`511:2`, `CDN 은행증권 코드 240328` / `SVN 마이데이터 기관코드 240328`) carries **167**
> 10-char institution codes. `nds-ci-banks-brokerages-archive` (`2827:323`, stamped `230705` / `240320`) carries
> **317** — a **superset for this family**: `codes_onlyInLive` is the **empty set**. The archive holds **150 codes
> absent from live**, spanning prefix families (`b1`, `b2`, `b4`, `d1`, `d2`, `d3`, `e1`, `f1`) that live has
> essentially none of, plus **all 79 `ss_img_sb_*` savings-bank marks**, of which live has **zero**.
>
> **Whether those 150 are retired institutions or simply out of the live page's scope is NOT stated on canvas.**
> Two readings fit and I cannot separate them:
> - **(a) Retired** — institutions dropped from the product.
> - **(b) Re-scoped** — the live page carries a `보험/캐피탈` ("insurance/capital") heading (`5051:267`) this page
>   lacks, so the taxonomy demonstrably changed; the codes may have moved to a sibling page
>   (`간편인증기관` `1251:2`, `공공기관` `1255:2`, `펌뱅킹` `3368:19`, `자문사` `5482:2131`) rather than died.
>
> **Reading (b) is cheaply testable and I did not run it** (those pages are outside my batch): sweep the four
> sibling institution pages for the 150 missing codes. **If they turn up there, "dropped" is wrong.**
> **Do not act on reading (a).**
>
> **Counter-evidence worth recording:** live **added** `ss_img_company_030` and `ss_img_company_221`, which the
> archive lacks. **The live sheet is not merely a truncation of the archive** — it is a genuine revision with
> additions and removals, which weakens any simple "everything missing was killed" story.

### 2. **K bank's CI changed and the archive's copy is the known-wrong one** — ✅ RESOLVED, actionable

> **`089. 케이뱅크` / `ss_img_company_089` / `a1aajb0000`.** The live page (`511:2`) ships a **bright-blue "K"
> monogram** and carries two `히스토리 참고용` blocks that label the **dark-navy "Kbank" wordmark** `구 버전 CI`
> and the monogram `신규 버전 CI`. **`nds-ci-banks-brokerages-archive` holds the wordmark.**
> **Any surface still rendering the wordmark is displaying a retired brand mark.** The live asset is the one to
> use. This is the file's only explicit old→new CI callout that I found, and it is what dates this archive's
> generation as *previous* rather than *unknown*.
> **Note the mechanism for future passes:** the live page records CI history **on itself**, in a
> `구 버전 / 신규 버전` pair — **it does not mark the archive.** Looking only at archive pages for deprecation
> markers will find nothing. **The successor is where the evidence lives in this file.**

### 3. **`247. NH투자증권` is duplicated at identical coordinates in BOTH grids** — ⚠ minor, unexplained

> `2827:2093` + `2827:2100` (x=1466, y=14720) and `2887:6627` + `2887:6634` (x=1466, y=21586). **Two frames,
> same name, exactly stacked**, reproduced across both the CDN and SVN grids. Whatever this is, it was copied
> forward when the second grid was made. **Not present as a duplicate in my live-page read** (live's
> `ss_img_company_*` set has no duplicate). Filing so it is not mistaken for two distinct assets.

### 4. **The 은행/증권/기관 CI assets are not componentised** — informational, affects how BUILD consumes them

> **Zero COMPONENTs on this page; the live page's assets are plain FRAMEs too.** These logos are **not** delivered
> through Figma component keys — they ship via **CDN by filename**, governed by the two dated code sheets
> (`CDN 은행증권 코드`, `SVN 마이데이터 기관코드`) and the `[사용 메뉴]` cards. **`CORE.md` cannot hold keys for this
> asset class because none exist.** Any guide requirement phrased as "use the `<bank>` component" is
> unsatisfiable **by design**, not by omission. Worth stating before someone files it as a library gap.

## Gaps / unverifiable

- **The 150 missing codes were not chased to the four sibling institution pages.** This is the single cheapest
  test that would settle Conflict #1 and it is **outside my batch**. See Conflict #1 for the exact method.
- **The K bank match is visual, not byte-exact** — this page's `089. 케이뱅크` renders as a captioned frame
  (`eb53d67e…`) vs the live exemplar's bare asset (`7cfbf2e7…`). I read both images and they are the same navy
  wordmark. **Confirmable by rendering `2827:1894`'s inner asset in isolation.** Not done.
- **1,020 code-named assets were NOT individually inspected.** I screenshotted the two 🏷 headings and the K bank
  assets. The grid's *artwork* is unverified beyond the opacity sweep (which was uniform-zero across all 5,616
  nodes, so no asset is ghosted — but that is a marking check, not a correctness check). **Any of the other 1,019
  could be a stale brand mark like K bank's and I would not know.**
- **The 3 `hidden="true"` raster layers** (`2887:7383` 신용회복위원회, `2887:8437` img, `2887:8986` DS투자증권) were
  **not** made visible or transcribed. Per the method they render blank; **no rule is quoted from them.** Note
  `DS투자증권` and `신용회복위원회` are institution names that do **not** appear in the numbered grid — possibly
  abandoned additions. **Unverified.**
- **`ss_img_ci_078020` (`3089:415`)** — a lone stock-CI-namespace node on an institution page. Not explained.
- **No `Last update` stamp of the `nds-lib-*` kind exists on this page.** Its two `🏷` code-sheet stamps
  (`230705`, `240320`) are **content revision dates, not page-touch dates** — so *when this page was last edited*
  is genuinely unknown, even though *what revision it holds* is precisely dated. **Worth reporting as the method
  asks: the absence is real, but this page is better-dated than most despite it.**
</content>
</invoke>
