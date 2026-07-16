---
name: nds-ci-etf
fileKey: KmpaYeoYh41F6nyIKvBQ7h
source_url: "https://www.figma.com/design/KmpaYeoYh41F6nyIKvBQ7h/NDS_CI?node-id=3179-310"
learned_date: 2026-07-16
sections_studied:
  - "3179:310 (page 'ETF' — canvas root; 74 children, 1,475 nodes, 34 distinct ss_img_ci_* names, ZERO components but 128 INSTANCEs)"
  - "3775:648 (SECTION '국내 ETF' — on-canvas heading '국내ETF', rule 'ss_img_ci_종목코드(숫자).png'; screenshotted — the grammar is COLOUR-CODED, invisible to get_metadata)"
  - "3775:658 (SECTION '해외ETF' — on-canvas heading '해외ETF', rule 'ss_img_ci_국가티커(알파벳).png', exemplar ss_img_ci_usaaapl; screenshotted)"
  - "5718:190 (TEXT '필수 ETF는 아래와 같아요.' — the 11-ETF priority list, 해외 6 / 국내 5)"
  - "5725:1066 / 5725:1123 (frames 'ss_img_ci_etf' → child 'ss_img_ci_kor_etf' — the composite index-ETF icon pattern consuming NDS_Library's nds_flag)"
  - "5718:285 (instance 'ss_img_ci_etc' — resolves to a COMPONENT_SET remote:false LOCAL TO NDS_CI but on NO page in this assignment; the NDS_StockIcon_CI lead)"
status: "unknown — the asset frames are populated and 27 운용사 CIs render, but this page is visibly a WORKING SURFACE, not a published inventory: 21 pasted phone screenshots (IMG_74xx), a pasted 원티드-class reference raster, an external URL, an unfinished '삼성자산운용 - ' label, and a composite-icon design exploration in progress. No Last update stamp, no dated batch labels. Recency UNKNOWN. NOT inferred from the page name."
---

# NDS_CI — "ETF" page

**The smallest and the least finished of the three CI pages, and the only one that carries a *design rationale* rather than just an inventory.** 1,475 nodes, **34 distinct `ss_img_ci_*` names**, **zero COMPONENTs / zero COMPONENT_SETs**, but **128 INSTANCEs** — the only one of my three pages that consumes components at all.

⚠️ **Do not read this page as an inventory.** It is a working surface. Alongside the 27 운용사 (asset-manager) CIs sit 21 pasted phone screenshots, a reference raster, a live external URL, an unfinished label, and an in-progress icon exploration. **The rules here are real; the completeness is not.**

## 🔥 THE load-bearing rules — and they are COLOUR-ENCODED, invisible to `get_metadata`

Two `SECTION` nodes carry this page's contract. **This is the only place in NDS_CI where the naming grammar is presented as a designed artifact rather than loose text**, and *how* it is presented is itself the finding.

### `국내 ETF` (SECTION `3775:648`)
> heading `국내ETF` (`3775:649`)
> rule **`ss_img_ci_종목코드(숫자).png`** (`3775:650`)
> exemplar frame `이미지명` (`3775:651`) — renders the **KODEX** logo

### `해외ETF` (SECTION `3775:658`)
> heading `해외ETF` (`3775:659`)
> rule **`ss_img_ci_국가티커(알파벳).png`** (`3775:660`)
> exemplar frame **`ss_img_ci_usaaapl`** (`3775:661`) — renders the **Apple** logo

**⭐ Screenshotted both. The rule strings are colour-coded, and the colours ARE the token boundaries:**

| Segment | Colour | Meaning |
|---|---|---|
| `ss_img_` | white | fixed prefix |
| `ci_` | **cyan** | the CI namespace marker |
| `종목코드(숫자)` / `국가티커(알파벳)` | **yellow** | **the variable slot** |
| `.png` | white | fixed extension |

**`get_metadata` returns only `name` and `characters` — the colour split is nowhere in the structure.** Reading names alone gives you an undifferentiated string; the screenshot gives you the grammar. **This is the layout/colour-encoded-meaning case, confirmed on this page.** Promote the decoded grammar, not the raw string.

**Both rules are verbatim-identical to their sibling pages'** (`3720:911` domestic, `3720:920` overseas). **ETF reuses the stock namespace wholesale — there is no `etf`-specific prefix.** Consequence: **국내 ETF CIs and 국내 stock CIs share one flat CDN namespace keyed only by 종목코드.** No collision is possible (KRX codes are unique across stocks and ETFs) but nothing in the naming *prevents* one either.

⚠️ **The 해외ETF exemplar is `ss_img_ci_usaaapl` — Apple, which is a US *stock*, not an ETF.** The section documenting overseas-ETF naming illustrates it with a non-ETF. Consistent with the rule (both use `국가티커`) but a confusing choice at source. Preserved as found.

⚠️ **The 국내ETF exemplar frame is named `이미지명`** — the literal placeholder "image name", never renamed, though it renders a real KODEX logo. **Blank at source.** Contrast the 해외ETF exemplar, which *is* properly named `ss_img_ci_usaaapl`. The two sections were finished to different standards.

## Export spec — read off `exportSettings`, documented nowhere

```
{format: 'PNG', suffix: '', contentsOnly: true, colorProfile: 'DOCUMENT', constraint: {type: 'SCALE', value: 1}}
```
at **200×200**. Verified on `ss_img_ci_kodex` (`3775:6`) and `ss_img_ci_rise` (`3775:51`). **1×, no @2x/@3x, no suffix.** Identical to the domestic page. **No TEXT node states this** — it exists only as node config.

## The naming grammar — verbatim, and this page adds FOUR forms the stock pages don't have

The two documented rules cover 종목코드 and 국가티커. **The page then ships four undocumented name shapes:**

| Name | Kind | Note |
|---|---|---|
| `ss_img_ci_<운용사>` | 27 frames | ⚠️ **UNDOCUMENTED.** `kodex` `tiger` `rise` `sol04` `plus` `kosef` `hanaro` `timefolio` `koact` `kcgi` `vita` `ace` `ishares` `franklinftse` `alphadex` `vaneck` `kraneshares` `victoryshares` `Amplifyetfs` `pimcoetfs` `Columbiaetfs` `globalx` `vanguard` `invesco` `spdr` `schwabetfs` `jpmorganetfs` — **brand slugs, neither 종목코드 nor 국가티커.** Neither rule describes them. |
| `ss_img_ci_etf` / `ss_img_ci_kor_etf` | composite frames | ⚠️ generic; the in-progress index-icon exploration |
| `ss_img_ci_etc` | **INSTANCE** | ⚠️ the fallback — **and a COMPONENT_SET elsewhere. See below.** |
| `ss_img_ci_oversea_etc` | — | ⚠️ **spelling: `oversea`, not `overseas`** `[sic]`. The overseas *page* uses `usa`; this uses `oversea`. **Three different words for the same concept across one file.** |

### ⚠️ Case inconsistency in the 운용사 slugs — three are Capitalised, 24 are not

`ss_img_ci_Amplifyetfs` · `ss_img_ci_Columbiaetfs` — **capital A and C**, against `ss_img_ci_vanguard`, `ss_img_ci_invesco`, `ss_img_ci_spdr` etc. **Any case-sensitive CDN lookup breaks on exactly these two.** (`ss_img_ci_kcgi` is lowercase despite KCGI being an initialism, confirming lowercase is the intent.)

⚠️ **`ss_img_ci_sol04` carries a numeric suffix** — `04` — unique among the 27. Undocumented; no `sol01`–`03` exist on this page. **A numbering hole with no visible series.**

## ⭐ The composite index-ETF icon — an undocumented pattern built from NDS_Library

11 frames named `ss_img_ci_etf`, each wrapping a child `ss_img_ci_kor_etf`, each composed of:
- a `boolean-operation` named `Subtract` (the badge silhouette), plus
- **TEXT** naming the index — `나스닥`+`100`, `S&P`+`500`, `코스피`+`200`, `배당`+`다우존스`, plus
- an **INSTANCE of `nds_flag`** pinned at `x:140, y:140, 60×60` (bottom-right corner).

**⭐ Cross-file corroboration — CONFIRMED, exact key match.** `getMainComponentAsync()` on `5725:1072`:

| | |
|---|---|
| main | `Type=Square, Country=USD(미국)` |
| main COMPONENT key | `7d31624cb9404a2506dd8c2b5022f2540dc43fbd` |
| parent SET | `nds_flag` |
| **SET key** | **`d81573482ffbff1e5076384753d483a3072d775f`** |
| `remote` | `true` |

**That SET key is byte-identical to the `nds_flag` SET key already recorded in `nds-lib-icons.md`.** Independent confirmation that (a) `nds-lib-icons`'s key is correct, (b) NDS_CI consumes NDS_Library as a subscriber (`remote: true`, matching `get_libraries`), and (c) `nds_flag`'s `Country` axis really does use **ISO-4217 currency codes** — the instances resolve to `Country=USD(미국)` and `Country=KRW(한국)`, i.e. **currency codes standing in for countries**, exactly the trap `nds-lib-icons` flagged.

The nested `SLICE` names confirm the export naming: `nds_flag_square_usd` (×5), `nds_flag_square_krw` (×6) — **lowercased**, unlike the `USD`/`KRW` axis values. **A third casing convention.**

⚠️ **These composites use `Type=Square` only** — no `Circle` instance anywhere, though the stock CIs are all circular. **Undocumented divergence: 종목 CI = circle, index-ETF badge flag = square.**

⚠️ **The pattern is UNFINISHED.** 11 frames all named `ss_img_ci_etf` — **one name, eleven different artifacts** (나스닥100 ×3, S&P500 ×4, 코스피200 ×2, 배당다우존스 ×2). **Zero of them have a real filename.** This is an exploration, not a shipped set. **Do not treat `ss_img_ci_etf` as a resolvable CDN asset.**

## 🔥 Invisibility mechanisms found on this page — 3 of the 5

1. **`opacity` ghosting — CONCLUSIVELY ABSENT.** `all.filter(n => n.opacity < 1)` → **`[]`.** Same as the overseas page. ⚠️ **`SECTION` nodes have no `opacity` property at all** — an unguarded `n.opacity` filter **throws** `TypeError: node.opacity: no such property 'opacity' on SECTION node`. I hit this and had to guard with `'opacity' in n`. **Worth recording: the standard ghosting sweep crashes on any page containing a SECTION.**
2. **`hidden` — CONFIRMED, ~85 nodes.** Two distinct populations:
   - **`scale guide` frames (~22)** — per-asset registration guides, hidden by design. **Not deprecation.**
   - **`White_bg` / `bg` ELLIPSEs (~20)** — ⭐ **a real design mechanism.** Each 운용사 CI carries *both* a `White_bg` and a `bg` ellipse, and **exactly one is hidden per asset.** `ss_img_ci_franklinftse` hides `bg` (→ white backing); `ss_img_ci_alphadex` hides `White_bg` (→ coloured backing). **This is a per-brand light/dark backing switch, expressed entirely through visibility.** `get_metadata` shows both ellipses and cannot tell you which is live. **Undocumented; recoverable only by reading `visible`.**
3. **INSTANCE overrides — CONFIRMED, and this is the classic trap.** Inside the pasted UI mockup `00_통합검색03_결과04_메뉴특정` (`5718:1328`):
   - TEXT layer named **`005930`** with `characters` = **`005930`**, but **`visible: false`** — ×3.
   - TEXT layer named `*삼성전자`, ⚠️ **`characters` = `*삼성전자` with a leading asterisk** — not a plain company name.
   - ⭐ **TEXT layer named `005930`, sibling price node `characters` = `60,600` / `806,000` / `54,600`** — **exactly the "numeric TEXT layer name whose characters differ" pattern** the method warns about (`58,500` containing `60,600`). **Confirmed present in this file.** The layer names are stale component-template defaults; **`characters` is the only truth.**
   - Layer `삼성바이오로직스` sits on a node whose *name* is still `005930` (삼성전자's code). **The name lies.**
4. **`STRIKETHROUGH` — CHECKED, NONE.** `getStyledTextSegments(['textDecoration'])` across all 188 TEXT nodes → `NONE` on every segment. **No silently-retired rules.**
5. **Fill-matching — CHECKED, none.** All TEXT `opacity: 1`; the only invisible text is `visible: false` (mechanism 5, not fill-matching).

### Retirement vocabulary: NONE. Zero `👿`.

Swept `👿` / `제외` / `해당없음` / `구버전` / `이전` / `미사용` / `deprecated` / `백업` / `폐기` / `중단` → **zero hits.** No deprecation marker of any kind on this page.

## ⚠️ Provenance of pasted images — CHECKED, and this page is heavily contaminated

Per method, I checked. **This page carries more pasted raster than any of my three.**

| Node(s) | Name | Verdict |
|---|---|---|
| `5718:198`–`5718:235`, `5735:1163` | `IMG_7406 1` … `IMG_7434 2` (**21 rasters**, each 540×1174) | ⚠️ **Phone screenshots** — 540×1174 is a mobile viewport. Camera-roll filenames. **Provenance unattributable. NOT rules.** |
| `3775:694` | `스크린샷 2024-08-08 오후 2.10.17 1` (692×532) | ⚠️ **A pasted screenshot, exactly the class that hid Highcharts docs and a 원티드 talk on sibling pages.** Sits *on top of* the 국내 ETF section. **Not quoted as a rule.** |
| `5718:196` | `image 155` (1626×1358) | ⚠️ Large unattributed raster. |
| `5718:189` | `IMG_7406 1` (540×1174) | ⚠️ Phone screenshot adjacent to the 필수 ETF text. |
| `3411:326` | `http://m.arirangetf.com/html/arirangetf_bi_introduce.jsp` | ⚠️ **A live external URL as a TEXT node**, beside a frame named `ARIRANG` (`3411:317`). **A source citation for a third-party BI** — legitimate provenance, and the *only* attributed raster on the page. ⚠️ **Note `http://`, not `https://`.** |

**⭐ `ARIRANG` (`3411:317`) is an orphan.** It renders a 운용사 CI but is **named `ARIRANG`, not `ss_img_ci_arirang`** — it violates the naming rule its own page documents, and its child is the placeholder `종목명`. It sits at `x=-29` with the arirangetf.com URL above it, **outside** both SECTIONs. **An un-onboarded asset caught mid-import.** ARIRANG was Hanwha's ETF brand (since rebranded **PLUS**) — and **`ss_img_ci_plus` exists on this page**. ⚠️ **So `ARIRANG` is very likely superseded by `ss_img_ci_plus`, but nothing on canvas says so** — no ghost, no strike, no label. **Unresolved; inferred, not asserted.**

## The `필수 ETF` priority list — a genuine rule, verbatim

TEXT `5718:190`, the one piece of real design guidance on the page:

> `필수 ETF는 아래와 같아요.`
> `🌍 해외 (6개)`
> `SPY → S&P500`
> `VOO → S&P500`
> `QQQ → NASDAQ 100`
> `VTI → 미국전체시장(글로벌 아이콘)`
> `SCHD → 배당+안정(돈)`
> `SOXX → 반도체(하드웨어칩)`
> `🇰🇷 국내 (5개)`
> `KODEX 200 →코스피200/운용사`
> `TIGER 200 → 코스피200/운용사`
> `TIGER 미국S&P500 → S&P500`
> `TIGER 미국나스닥100 → NASDAQ 100`
> `TIGER 미국배당다우존스 → 배당+안정(돈)`

**Right-hand side = the icon *concept* to draw, not a filename.** This is the design brief behind the `ss_img_ci_etf` composites: `S&P500`, `NASDAQ 100`, `코스피200`, `배당+다우존스` map 1:1 onto the composite TEXT (`S&P`+`500`, `나스닥`+`100`, `코스피`+`200`, `배당`+`다우존스`).

### ⭐ Exact counts vs the heading counts — BOTH headings are correct, and the CANVAS is short

| Heading claim | Actual (`.length`) | Verdict |
|---|---|---|
| `🌍 해외 (6개)` | **6** listed | ✅ **heading correct** |
| `🇰🇷 국내 (5개)` | **5** listed | ✅ **heading correct** |
| — | **11 `ss_img_ci_etf` composites built** | — |

**Neither heading is stale** — a meaningful negative against the "heading counts are systematically stale" expectation. **The drift is elsewhere: the brief names 11 required ETFs and 11 composites exist, but they collapse to only 4 distinct designs** (S&P500 ×4, 나스닥100 ×3, 코스피200 ×2, 배당다우존스 ×2). **`VTI → 미국전체시장(글로벌 아이콘)` and `SOXX → 반도체(하드웨어칩)` have NO composite at all.** ⚠️ **2 of the 11 required icons are unbuilt.** The duplication is because 해외 SPY/VOO and 국내 TIGER 미국S&P500 all resolve to the same "S&P500" design — **which is the brief working as intended**, but it means 11 ≠ 11.

`삼성자산운용 - ` (`3905:2874`) — ⚠️ **`characters` = `삼성자산운용 - \n`, trailing hyphen, newline, nothing after.** **An unfinished sentence. Blank at source. I am not inventing the rest.**

## CORE — componentKeys found

**Zero COMPONENTs / COMPONENT_SETs live on this page** (`findAllWithCriteria` → `[]`, both). All keys below are resolved **through INSTANCEs via `getMainComponentAsync()`** — the only correct method, since `get_metadata` renders a SET as `<frame>` and a COMPONENT as `<symbol>`.

| Instance | Main COMPONENT key (40-hex) | Parent SET key (40-hex) | KIND to import | `remote` | Tier |
|---|---|---|---|---|---|
| **`ss_img_ci_etc`** (`5718:285`) | `df7e19380ea3c116d0c05de088bea42c1764f0ac` (`Country=usd(미국)`) | **`f3a7b6ed87a9914c0dca2f1f87d2c77cd9164dc4`** | **COMPONENT_SET** → `importComponentSetByKeyAsync` | **`false`** | **(a) source component, viewed from inside its home file** |
| `nds_flag` (`5725:1072`) | `7d31624cb9404a2506dd8c2b5022f2540dc43fbd` (`Type=Square, Country=USD(미국)`) | **`d81573482ffbff1e5076384753d483a3072d775f`** | COMPONENT_SET | `true` | (b) consumed from NDS_Library — **key matches `nds-lib-icons.md` exactly** |
| `00_통합검색03_결과04_메뉴특정` (`5718:1328`) | `89590df752efa727b3b1292cfe915d3a6bbbd1a8` | **none — `parent` is `null`** | **COMPONENT** → `importComponentByKeyAsync` | `true` | (b) consumed — a full-screen template, almost certainly from `NDS_Templates` |

**KIND discipline:** `ss_img_ci_etc` and `nds_flag` are **SET** keys (import via `importComponentSetByKeyAsync`); `00_통합검색03_결과04_메뉴특정` is a **standalone COMPONENT** with `parent === null` (import via `importComponentByKeyAsync`). **Mixing these is the exact error the method warns about** — I verified each `parent.type` explicitly rather than inferring from the metadata tag.

⚠️ **`ss_img_ci_etc`'s axis value is `Country=usd(미국)` — lowercase `usd`**, whereas `nds_flag` uses **uppercase `USD(미국)`**. **Two sets, same concept, different casing.** A fourth casing convention in one file.

**Verification: `unverified` for all three.** Read-only; `importComponentSetByKeyAsync` would throw. Keys read off the resolved main components — authoritative for identity, not a round-trip test.

## ⭐ The `NDS_StockIcon_CI` relationship — the LEDGER hole is REFRAMED, not closed

`get_libraries({fileKey: 'KmpaYeoYh41F6nyIKvBQ7h'})`:

- **Subscribed:** `NDS_Templates`, `NDS_Library`, `NDS_Darkmode Colors`, `NDS_Colors`. **No `NDS_StockIcon_CI`.**
- **Available to add:** 5 community kits + 4 org libraries (`가이드 ⚙️ EMS`, `운영 ⚙️ EMS`, `NDS_M.web`, `가이드 ⚙️ 홈페이지`). **No `NDS_StockIcon_CI`.** `libraries_available_to_add_next_offset: null` — **the enumeration is complete, not truncated.**

**No library named `NDS_StockIcon_CI` is visible from NDS_CI, in either list.**

**But this page produces the decisive evidence.** `ss_img_ci_etc` (`5718:285`) resolves to:

> **a `COMPONENT_SET` named `ss_img_ci_etc`, SET key `f3a7b6ed87a9914c0dca2f1f87d2c77cd9164dc4`, `remote: false`**

**`remote: false` = local to NDS_CI.** Yet **this set exists on none of my three pages** — all three returned `componentSets: []`. **Therefore NDS_CI contains at least one COMPONENT_SET on a page outside my assignment.**

⚠️ **Per method, judge by structure and publish state, not the flag.** The structural facts: the set is reachable by key from inside NDS_CI; it has a variant axis (`Country`); an instance of it is placed on this page; and `get_libraries` shows NDS_CI subscribing to four libraries but publishing none *that NDS_CI itself can see* (a file cannot list itself as a subscribable library). **`remote: false` + resolvable-by-key + variant axes + in-file instance ⇒ this is a MASTER set in its home file.** That is the same reasoning `nds-lib-icons` used for NDS_Library's 143 sets.

**Verdict: `NDS_StockIcon_CI` is UNIDENTIFIED as a library name — it does not exist as a subscribable library from NDS_CI's vantage point.** The LEDGER's "named library outside the learned set" is **most plausibly NDS_CI's own component-bearing page(s)** — the home of `ss_img_ci_etc` and whatever sits beside it.

**⭐ The hole is now a specific, cheap follow-up, not an open question:**
> **Sweep NDS_CI's remaining pages for the COMPONENT_SET `ss_img_ci_etc` (key `f3a7b6ed87a9914c0dca2f1f87d2c77cd9164dc4`). That page — not 국내주식 / 해외주식 / ETF — is the referent.**

I state this as **inference with named evidence**, not as fact. I did not visit the other pages; they were outside my assignment.

## Conflicts / LEDGER candidates

1. **⭐ NDS_CI DOES contain component sets — just not on the three CI inventory pages.** `ss_img_ci_etc`, SET key `f3a7b6ed87a9914c0dca2f1f87d2c77cd9164dc4`, `remote: false`. **This is the single highest-value finding of my three pages** and the concrete lead on the `NDS_StockIcon_CI` hole.
2. **⛔ ETF CIs are not importable as components.** 34 names, zero components. The CDN URL is the only path — same verdict as both stock pages.
3. **⭐ `nds_flag` SET key `d81573482ffbff1e5076384753d483a3072d775f` CONFIRMED by independent resolution**, matching `nds-lib-icons.md` byte-for-byte. **Cross-file corroboration, not a conflict.** Also confirms the ISO-4217-currency-code-as-country trap.
4. **⚠️ 27 운용사 slugs are undocumented.** Neither rule (`종목코드` / `국가티커`) describes `ss_img_ci_kodex`. **The page's own grammar does not cover its own majority inventory.**
5. **⚠️ Case inconsistency: `ss_img_ci_Amplifyetfs`, `ss_img_ci_Columbiaetfs`** capitalised against 25 lowercase siblings. **Case-sensitive CDN lookups break on exactly these two.**
6. **⚠️ FOUR casing conventions in one file:** `Country=usd(미국)` (`ss_img_ci_etc`) vs `Country=USD(미국)` (`nds_flag`) vs slice `nds_flag_square_usd` vs page prefix `usa`. Same concept, four spellings.
7. **⚠️ THREE words for "overseas" in one file:** `해외` (headings) / `usa` (overseas-page prefix) / `oversea` `[sic]` (`ss_img_ci_oversea_etc`).
8. **⚠️ 11 frames share the name `ss_img_ci_etf`** for 4 distinct designs, with **no real filename on any of them**. Unfinished. **Not a resolvable CDN asset.**
9. **⚠️ 2 of the 11 브리프-required icons are unbuilt** — `VTI → 미국전체시장(글로벌 아이콘)` and `SOXX → 반도체(하드웨어칩)` have no composite.
10. **⚠️ `ARIRANG` (`3411:317`) is an orphan** violating the page's own naming rule, with a `종목명` placeholder child, likely superseded by `ss_img_ci_plus` (ARIRANG→PLUS rebrand) — **but nothing on canvas says so.** No ghost, no strike, no label.
11. **⚠️ `ss_img_ci_sol04`'s `04` suffix** is unique and undocumented; no `sol01`–`03`. **A numbering hole with no series.**
12. **⚠️ `SECTION` nodes have no `opacity` property** — the standard ghosting sweep **throws** on them. **A method fix, not a file defect:** guard with `'opacity' in n`.
13. **⚠️ The `White_bg`/`bg` hidden-ellipse pair is an undocumented per-brand backing switch.** `get_metadata` shows both and cannot tell you which is live. **Only `visible` disambiguates.**
14. **⚠️ Zero opacity ghosting here and on the overseas page, but 0.10/0.20 on the domestic page.** **The ghosting convention is NOT uniform within NDS_CI** — a sweep assuming it is will report false clean on 2 of 3 pages.
15. **⚠️ Heavy pasted-raster contamination** — 21 phone screenshots + a `스크린샷 2024-08-08` raster laid over the 국내 ETF section. **Same class as the Highcharts/원티드 contamination on sibling pages. None quoted as rules.**
16. **Both `필수 ETF` heading counts (6개/5개) are CORRECT** — a meaningful negative against the stale-heading expectation.

## Gaps / unverifiable

- **⭐ The home page of COMPONENT_SET `ss_img_ci_etc` is unknown.** It is local to NDS_CI (`remote: false`) but on none of my three pages. **The single highest-value follow-up.** I did not visit other pages — outside assignment.
- **`ss_img_ci_etc`'s full variant axes were not enumerated.** I resolved one instance (`Country=usd(미국)`) and its parent SET key. **`variantGroupProperties` / `componentPropertyDefinitions` were NOT called** — the set is on another page, and per method those calls need a try/catch (duplicate variant name ⇔ set-has-errors). **Unverified whether this set has errors.**
- **Whether `ARIRANG` is superseded by `ss_img_ci_plus`** — inferred from the real-world ARIRANG→PLUS rebrand, **not stated anywhere on canvas.** Unresolved.
- **Whether the 11 `ss_img_ci_etf` composites ship at all** — no filename, no export setting checked on them, no CDN evidence. **Assume not shipped.**
- **The 21 `IMG_74xx` phone screenshots are unattributable.** Not read as rules. Whether they encode a rule is undeterminable.
- **`삼성자산운용 - `** — unfinished sentence, blank at source. Not invented.
- **`이미지명` (`3775:651`)** — the 국내ETF exemplar was never renamed. Blank at source.
- **`http://m.arirangetf.com/...` is a live external URL** cited as provenance. Not fetched; `http://`, not `https://`.
- **No `Last update` stamp and no dated batch labels** — unlike both stock pages, which carry rolling 신규상장/큰손픽 dates. **This page has NO recency signal whatsoever. Recency is UNKNOWN, and `status` says so.**
- **I did not enumerate the pasted mockup's full contents.** `00_통합검색03_결과04_메뉴특정` (`5718:1328`) is a `NDS_Templates`-class screen sample, not an ETF rule; I read it only for the INSTANCE-override analysis.
</content>
