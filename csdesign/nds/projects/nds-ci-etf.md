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

**All 128 INSTANCEs resolved.** 17 distinct mains — the full census:

| Instance | Main COMPONENT key (40-hex) | Parent SET key (40-hex) | KIND to import | `remote` | × | Tier |
|---|---|---|---|---|---|---|
| **`ss_img_ci_etc`** (`5718:285`) | `df7e19380ea3c116d0c05de088bea42c1764f0ac` (`Country=usd(미국)`) | **`f3a7b6ed87a9914c0dca2f1f87d2c77cd9164dc4`** | **COMPONENT_SET** → `importComponentSetByKeyAsync` | **`false`** | 1 | **(a) source, home file** |
| `nds_flag` | `7d31624cb9404a2506dd8c2b5022f2540dc43fbd` (`Type=Square, Country=USD(미국)`) | **`d81573482ffbff1e5076384753d483a3072d775f`** | COMPONENT_SET | `true` | 12 | (b) — ⭐ **key matches `nds-lib-icons.md`** |
| `nds_icon_arrow` | `d0ec4c9777b1f8ce1bec480f25a1f72c2d962aa1` (`Color=05, Type=right, Height=h24`) | **`dde648604e4d08cc6b99c44dda81ec73ccbb4b15`** | COMPONENT_SET | `true` | 8 | (b) — ⭐ **key matches `nds-lib-icons.md`** |
| `nds_icon_delet` | `b3488a5164e3a5c1ae8ae80dbd52bcaa25267ba5` (`Color=5, Height=h30`) | **`74eac710a62949cb0702187de2b05bd9d206f105`** | COMPONENT_SET | `true` | 1 | (b) — ⭐ **key matches `nds-lib-icons.md`** (the `delet` typo set) |
| `btn_container_regular` | `b4c29be637082d22f9ac89482efa9f855b39b79c` (`Strength=4(line)-R, Height=h40, Status=normal`) | `fd0a4e2fd7b3c49612b27963bd8bf41f1580910b` | COMPONENT_SET | `true` | 42 | (b) |
| `contents_card` | `9df72d5e04329d08ba9997ec04731553b45132c4` (`Type=국내종목`) | `7ffbb0995364c7ab909efdee3edb624bd611fdbb` | COMPONENT_SET | `true` | 21 | (b) |
| `feature` | `51b76877af1fbc85d8da6e4bd24c3e5254683f53` (`Property 1=⭐️ 특정종목90`) | `827394efded65b2474ff3e74a2dc028f7a404519` | COMPONENT_SET | `true` | 14 | (b) |
| `tab_line_21pt` | `a7cb76aa05b9f6e5b3e80918dde04957a77d3a5f` (`Type=swipe, Active=on,Channel=NM`) | `f82db6566e1b3a8a8e879b7f3e926911a2af7b11` | COMPONENT_SET | `true` | 9 | (b) — ⚠️ axis value `Active=on,Channel=NM` **contains a comma**, i.e. two axes collapsed into one value |
| `icon_triangle` | `7e0bc43daf2c79a562cb023476b6a2c7c6cbb871` (`Type=increase, Gray=false`) | `8de9dbda1ecc745436ac40b774767fd53cde1f9b` | COMPONENT_SET | `true` | 7 | (b) — mirrors `rate_home`'s `Type/Gray` axes in `nds-lib-icons` |
| `label` | `8046757c426a3392f263f67d9b9fcb965b801cd3` (`Property 1=normal`) | `10153ec2a923e77ea568f3a712a9218a18def445` | COMPONENT_SET | `true` | 5 | (b) |
| `label_risk` | `953e11d13f03c9335b25995916527108db800db2` (`Type=stroke, Lv=비보장`) | `d71897c636a71e92ebef7e6075bb797aa3572b09` | COMPONENT_SET | `true` | 3 | (b) |
| `card_stock` | `090b770f0342c89843423f17238194a5c5c31e53` (`Property 1=해외`) | `286c5366acc3dd1631fe5334c485c1a57d7c1548` | COMPONENT_SET | `true` | 1 | (b) |
| `statusbar` | `e5e2a9f9fc56a1b50a96ab0569e8f9a3dd7649cf` (`Type=NM, Dark mode=false`) | `b4d07422e1eedeb9f1ae4b831e905357e54b01a6` | COMPONENT_SET | `true` | 1 | (b) |
| `search_header_input` | `51ad65c98cfcd71450cbd262aec4b31c3702f80d` (`Property 1=input`) | `289a99ce52df180d574a3e592492f88896668bc3` | COMPONENT_SET | `true` | 1 | (b) |
| `00_통합검색03_결과04_메뉴특정` (`5718:1328`) | `89590df752efa727b3b1292cfe915d3a6bbbd1a8` | **none — `parent` is `null`** | **COMPONENT** → `importComponentByKeyAsync` | `true` | 1 | (b) — full-screen template, likely `NDS_Templates` |
| `label/lv3` | `f93baa92c21301afaad69ec820f839800908288f` | **none — `parent` is `null`** | **COMPONENT** → `importComponentByKeyAsync` | `true` | 1 | (b) — ⚠️ **slash in the name**; a standalone, unlike its `label` sibling |

⭐ **Three independent key confirmations against `nds-lib-icons.md`** — `nds_flag`, `nds_icon_arrow`, `nds_icon_delet` all resolve byte-for-byte to the SET keys recorded there. **That is three-way corroboration of that note's key table from a different file, via a different method (`getMainComponentAsync` rather than reading `.key` off the set).**

⚠️ **All 14 remote SETs above are `remote: true` and 13 of the 16 mains come from ONE pasted mockup** (`00_통합검색…`). They document what NDS_Templates/NDS_Library ship, **not what the ETF page designs.** Do not read them as ETF rules.

**KIND discipline:** `ss_img_ci_etc` and `nds_flag` are **SET** keys (import via `importComponentSetByKeyAsync`); `00_통합검색03_결과04_메뉴특정` is a **standalone COMPONENT** with `parent === null` (import via `importComponentByKeyAsync`). **Mixing these is the exact error the method warns about** — I verified each `parent.type` explicitly rather than inferring from the metadata tag.

### ⛔ `ss_img_ci_etc` ≠ `ss_img_ci_etf` — do not merge these in the LEDGER

The guide page reportedly carries a **`ss_img_ci_etf`** SET with two live keys (`e1782bf9…` visible / `b2862b1a…` occluded). **That is a different component from mine.** `etc` (etcetera — the fallback) and `etf` (the product) differ by one character and are separate sets:

| Name | SET key | Where |
|---|---|---|
| **`ss_img_ci_etc`** | `f3a7b6ed87a9914c0dca2f1f87d2c77cd9164dc4` | instanced on **my** ETF page (`5718:285`) |
| `ss_img_ci_etf` | `e1782bf94b991624a579f9c58c156277fd95080e` / `b2862b1a740d8f3864c8003c98cbc5192324f566` | guide page — **not referenced from my page** |

**Answer to "does your ETF page instance either `ss_img_ci_etf` key?" — NO, neither.** I resolved **all 128 INSTANCEs** on the page via `getMainComponentAsync()`; the full set of distinct mains is enumerated above and **`ss_img_ci_etf` is not among them.** The 11 nodes named `ss_img_ci_etf` on my page are **plain `FRAME`s, not instances** — they are a hand-built exploration that *duplicates the name* of a real component set without instancing it.

⭐ **That is itself the finding: my page reinvents `ss_img_ci_etf` by hand instead of using the published set.** The composites are drawn from a `Subtract` boolean + raw TEXT + an `nds_flag` instance — not from `e1782bf9…`. **A third artifact now shares the name `ss_img_ci_etf`** (guide set ×2 keys + my 11 frames), and mine is the only one that is not a component.

⚠️ **Note the axis mismatch that follows:** the guide's `ss_img_ci_etf` uses `kr|us|global`, but my composites carry **`nds_flag` `Country=USD(미국)` / `Country=KRW(한국)`** — i.e. my page expresses the same kr/us distinction through **a different component with a currency-coded axis.** Two incompatible encodings of one concept.

⚠️ **`ss_img_ci_etc`'s axis value is `Country=usd(미국)` — lowercase `usd`**, whereas `nds_flag` uses **uppercase `USD(미국)`**. **Two sets, same concept, different casing.** A fourth casing convention in one file.

**Verification: `unverified` for all three.** Read-only; `importComponentSetByKeyAsync` would throw. Keys read off the resolved main components — authoritative for identity, not a round-trip test.

## 🚨 The 프리텐다드 vs 산돌 격동고딕 A/B did NOT land here — this page is the "before"

`Archive` (`3323:345`) reportedly holds a **newer** ETF pass with an undecided 프리텐다드 vs 산돌 격동고딕 A/B. **My page does not close that decision — the node IDs prove it is the earlier state.** My composites are block `5725`–`5735`; Archive's shared `필수 ETF` note is `6059:3412` vs mine at `5718:190`. **Mine is older. An older page cannot resolve a question raised later.**

Full font census (`getStyledTextSegments(['fontName'])`, all 188 TEXT nodes):

| Font / style | Segments | Used for |
|---|---|---|
| `NanumBarunGothic / Regular` | 91 | pasted mockup (`00_통합검색…`) |
| `Roboto / Regular` | 45 | pasted mockup — numerals |
| `NanumBarunGothic / Bold` | 16 | pasted mockup |
| **`Sandoll GyeokdongG2 / 06 Hv`** | **13** | ⭐ **the `ss_img_ci_etf` composites — `나스닥` `100` `S&P` `코스피` `배당` `다우존스`** |
| `Roboto / Medium` | 13 | pasted mockup — prices |
| `Pretendard / Bold` | 3 | SECTION headings `국내ETF` / `해외ETF` |
| `Pretendard / Regular` | 2 | the two rule captions |
| `Inter / Bold` | 2 | loose labels `국내 ETF` / `미국 ETF` |
| `Inter / Regular` | 2 | the arirang URL, `삼성자산운용 - ` |
| `Noto Sans KR / Bold` | 1 | the `필수 ETF` brief |

**On this page the composites use `Sandoll GyeokdongG2 / 06 Hv` exclusively — zero Pretendard on any composite.** Pretendard appears here **only on section chrome** (headings + rule captions), never on an icon.

⭐ **So the two fonts were never A/B'd against each other on this page — they never touched the same element.** 산돌 was simply *the* composite font. The A/B is a **later** question, raised in Archive against this page's 산돌 baseline. **Reading my page as "산돌 won" would invert the chronology.**

**Verdict: `LEDGER#ci-archive-is-the-newest-work` is CORROBORATED, not closed.** My page supplies the missing half — **what Archive is testing *against*: 산돌 격동고딕 G2 / 06 Hv.** The decision remains open, and Archive is the authority.

⚠️ Also note **five font families for chrome alone** (Pretendard, Inter, Noto Sans KR + the mockup's NanumBarunGothic/Roboto). `국내ETF` (SECTION heading) is **Pretendard/Bold** while `국내 ETF` (loose label `3775:2`) is **Inter/Bold** — **near-identical strings, different fonts, 8px apart in meaning.** Corroborates that this page is a working surface, not a finished spec.

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
