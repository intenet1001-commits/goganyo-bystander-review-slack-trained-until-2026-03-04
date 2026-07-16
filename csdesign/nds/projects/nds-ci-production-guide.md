---
name: nds-ci-production-guide
fileKey: KmpaYeoYh41F6nyIKvBQ7h
source_url: "https://www.figma.com/design/KmpaYeoYh41F6nyIKvBQ7h/NDS_CI?node-id=2581-296"
learned_date: 2026-07-16
sections_studied:
  - "2581:296 (page '⭐️CI 제작 가이드⭐️' — canvas root; 913 nodes, 93 TEXT, 8 COMPONENT_SETs, 35 COMPONENTs, 32 INSTANCEs)"
  - "2581:320 (frame 'Button_usage' — on-canvas heading 'CI Guide' / 'QV-NM Button Usage'; the 7-rule 제작방법 list. THE load-bearing frame)"
  - "3867:7889 (frame 'Button_usage' — on-canvas heading 'CI Initials Guide' / 'QV-NM Button Usage'; the 3-rule initials 제작방법 + 기존→변경 migration)"
  - "2585:336 (frame 'scale guide' — on-canvas label '스케일 참고'; the clear-space/safe-area template, rendered-only)"
  - "2581:297 / 2581:308 (frames 'ss_img_company_012' / 'ss_img_company_023' — on-canvas labels '기본형' / '화이트 배경'; the two background treatments)"
  - "2628:871, 2628:872, 2628:890, 2629:915, 2673:310, 2629:956, 3368:353, 3718:369 (8 sections under on-canvas heading '📌 샘플' — the naming grammar, one rule per asset class)"
  - "3867:7820 + 8 sections (on-canvas heading '📌 종목 없을 시 디폴트 이미지' — the default/fallback CI sets)"
  - "5377:475 / 5377:474 (on-canvas heading 'MTS 종목 로고 노출 정책' + the CDN fallback flow)"
  - "2628:888 / 3720:872 (on-canvas heading 'CDN 주소' + the CDN URL pattern)"
status: "live — 8 COMPONENT_SETs all resolve local (remote:false) in their home file; TWO independent `Last update` stamps, latest 2024.08.30 Viviana, Moana; zero deprecation markers (no 👿/제외/해당없음/구버전/미사용), zero STRIKETHROUGH segments across all 93 TEXT nodes. NOT inferred from the page name."
---

# NDS_CI — "⭐️CI 제작 가이드⭐️" page

The **production rulebook** for NH투자증권's corporate-identity asset library — third-party institution logos (banks, brokerages, public agencies, media, advisories) and stock/ETF CI. **Not a UI component library.** This page answers: how do you draw a new CI, what do you call the file, how big, and what happens when the asset doesn't exist.

**913 nodes, but the rules live in exactly two frames.** Everything else is samples and default-image sets.

## Name-reliability verdict: RELIABLE — with one systematic, well-understood exception

**This page's convention: TEXT layer names are auto-synced to their own `characters`.** Of 93 TEXT nodes, 80 have `name === characters` byte-for-byte. This is the *good* end of the range the method doc warns about — far more trustworthy than the sibling `NDS_Library` pages. **But do not generalise it**; it held here and must be re-tested per page.

The 13 mismatches split into two harmless classes and **one real trap**:

1. **Newline flattening (harmless).** Multi-line bodies have names with `\n` collapsed to a space — e.g. `2581:324`, `3867:7892`. Content identical; only whitespace differs. Both `Last update` stamps also carry a **double space** after `update` in `characters` that survives into the name.
2. **⭐ INSTANCE OVERRIDES — mechanism #4, CONFIRMED PRESENT (the trap).** **Eleven** TEXT nodes are named `국내주식` while their actual `characters` are something else entirely:

   | node | layer name | actual characters |
   |---|---|---|
   | `3867:7370` | `국내주식` | `코스피` |
   | `3867:7398` | `국내주식` | `코스닥` |
   | `5160:626` | `국내주식` | `선물옵션` |
   | `5160:632` | `국내주식` | `펀드` |
   | `5161:759` | `국내주식` | `채권` |
   | `5161:861` | `국내주식` | `외화` |
   | `5161:896` | `국내주식` | `신탁` |
   | `3867:7888` | `국내주식` | `기타` |

   These are label texts inside instances of the default-CI sets; `국내주식` is the **stale main-component name**, never re-synced after override. **A layer-name walk reports eight assets all called `국내주식`.** Only `characters`/screenshot recovers the truth. This is precisely the documented failure mode, reproduced in this file.

**Verdict for a consumer: read `characters`, never `name`, for any text on this page.** For frames/components, names are reliable and are themselves load-bearing (rule 6 below makes the frame name *be* the shipped filename).

### Invisibility mechanisms — what I found and what I ruled out

| # | Mechanism | Found here? |
|---|---|---|
| 1 | Fill matching background | **Not as a rule-hider.** Both `Last update` stamps are low-contrast grey-on-dark (`#555`-ish on `#333`) — legible in render, but easy to miss by eye. Several sample frames carry `visible:false` white fills — benign, no text hidden. |
| 2 | `STRIKETHROUGH` | **NO.** Ran `getStyledTextSegments(['textDecoration'])` over all 93 TEXT nodes. Zero struck segments, zero errors. No rule was silently retired this way. |
| 3 | `opacity` ghosting | **NO — and beware a false positive.** Only two nodes are sub-1.0: `2581:330` / `3867:7896`, both `Line 49` at `0.55` — decorative header rules. Separately, the scale-guide safe-area rectangles use `#FF0000` **fill-level** `opacity: 0.10`. That is a **deliberate diagram tint, NOT the file-wide parked/superseded convention.** Node-level opacity there is `1`. Do not read those as deprecated. |
| 4 | **Instance overrides** | **YES — 11 nodes.** See table above. The dominant risk on this page. |
| 5 | `hidden="true"` | **YES — 16 nodes.** Two are meaningful: `3867:7003` (`Property 1=kor_etc`) and `3867:7035` (`Property 1=oversea_etc`), both COMPONENTs inside set `ss_img_ci_etc` (`3867:7002`). Per method I do **not** quote their contents as rules. The other 14 are hidden `nds_flag` INSTANCEs and one rectangle — flag badges toggled off per variant, routine. |
| **6** | **⭐ FULL OCCLUSION BY A SELF-NESTED DUPLICATE SECTION** | **YES — a mechanism not in the warning list.** See the ETF conflict below. `get_metadata` shows both; the canvas shows one. |

**Deprecation sweep: clean.** Zero hits for `👿` / `제외` / `해당없음` / `구버전` / `이전` / `미사용` / `deprecated` / `백업` / `폐기` / `중단` / `제작중` across all node names and all TEXT characters. This page carries no scope markers at all.

## ⭐ The Deep Blue cross-check: **ABSENT**

**Verdict: ABSENT — not "same", not "contradicting", not "extended".**

I searched every one of the 93 TEXT nodes' `characters` for `Deep Blue`, `Dark Blue`, `002A41`, `064367`, and `브랜드 로고`. **Zero hits.** The CORE.md Gotcha 14 rule —

> `브랜드 로고의 메인 컬러는 Deep Blue 입니다. Deep Blue(#002A41)는 바탕색으로 사용하지 않습니다. 필요한 경우 Dark Blue(#064367) 를 대신 사용합니다.`

— **does not appear anywhere on this page.**

**This matters more than a contradiction would.** The brief's premise was that NDS_CI is the more authoritative home for the brand-logo colour rule. **It is not — the rule is not here at all.** `NDS_Library` › Icons › `39114:271` remains its **sole** attested source. Two readings, and I cannot separate them from this page alone:

- **(a) Scope mismatch — most likely.** Gotcha 14 governs **NH's own brand logo**. This page governs **third-party institution/stock CI** — assets whose colours are dictated by the *other* company's brand (농협 `#00B259`, SC제일은행, 애플, 이데일리 red). NH's Deep Blue has no jurisdiction over 애플's logo. Under this reading the two documents are **complementary, not competing**, and the absence is correct.
- **(b) A genuine coverage gap** — the CI guide should restate it and doesn't.

**Evidence tilts to (a):** this page's colour rules are entirely about *background treatment and containers* (유색배경 / 화이트배경 + `017` ring / `#333333` initials), never about a foreground brand mark's own colour. **Recommendation: keep Gotcha 14 sourced to `39114:271` and do not re-home it here.** Recording as an observation, **not** a LEDGER contradiction — nothing on this page contradicts it.

## 🔥 THE load-bearing rule: 제작방법 (`2581:320`, on-canvas heading `CI Guide`)

Frame `Button_usage`, subheading `QV-NM Button Usage`, stamped `Last update  2024.02.27 Moana`. Body `2581:324`, **verbatim, all seven items** (rendered as a numbered list; colour emphasis noted — it is doing real work):

> 1. `기본적으로 유색배경으로 제작합니다.`
> 2. `심볼은 벡터형식으로 제작하나, 불가피 할시 이미지로 넣습니다.`
> 3. `흰색배경으로 제작해야할 시 라인은 017 컬러코드 2pt 두께입니다.`  ← *`라인은 017 컬러코드 2pt 두께` in **red***
> 4. `기존 제작되어 있는 이미지 크기와 상관없이  앞으로 제작되는 사이즈는 200x200 1배수 제작합니다.`  ← *second line in **yellow**; note the **double space** after `상관없이`, verbatim*
> 5. `200x200 1배수로 추출합니다. (Tiny PNG 필수!!!)`  ← *entirely **yellow***
> 6. `이미지명을 프레임명으로 제작하며, 그룹 네이밍을 기관 및 종목 명칭으로 적용합니다.`
> 7. `개발 담당자: 임성수 차장님, 최기현 대리님`  ← *entirely **yellow***

Decoded into actionable terms:

- **Background:** coloured by default (기본형). White only when unavoidable, and then **a `017` colour-code ring at 2pt** is mandatory.
- **Symbol format:** vector first; raster only when vector is impossible.
- **Size:** `200×200 @1x`. Legacy assets at other sizes are explicitly grandfathered (`기존 ... 크기와 상관없이`) — **this is a go-forward rule, not a retro-fix mandate.**
- **Export:** `200×200 @1x` PNG. **`Tiny PNG 필수!!!`** — compression is not optional; three exclamation marks are at source.
- **⭐ Export multiplier: `1배수` ONLY.** There is **no @2x/@3x ladder on this page.** Do not invent one. The CDN serves a single 200×200 PNG per asset; density scaling is the client's problem.
- **Naming:** the **frame name IS the filename**; the **group name is the 기관/종목 명칭** (human-readable, Korean).

### `017` decoded — measured, not stated

**The page never writes `017`'s hex.** But the two 화이트 배경 exemplars both ring their white ellipse with a stroke I read directly off the API:

- `2581:310` (`ss_img_company_023` › `Ellipse 4`) — `strokeWeight: 2`, `SOLID #E0E0E0`
- `2628:846` (`이미지명` › `종목명` › `Ellipse`) — `strokeWeight: 2`, `SOLID #E0E0E0`

→ **`017` 컬러코드 ⇒ `#E0E0E0`, at 2pt.** Flagged **inferred-from-exemplar, not stated**: two independent samples agree and the weight matches rule 3 exactly, but the token→hex mapping itself is *not written on this page*. Confirm against the NDS colour-token table before treating as canon.

### The two background treatments, side by side

| on-canvas label | node | exemplar | treatment (read off the API) |
|---|---|---|---|
| `기본형` | `2581:297` | `ss_img_company_012` (group `012. 지역 농축협`) | Coloured disc — `#00B259` fill, **no ring**. The institution's own brand colour fills the circle. |
| `화이트 배경` | `2581:308` | `ss_img_company_023` (group `023. SC은행`) | `#FFFFFF` fill **+ `#E0E0E0` 2pt stroke**. Symbol is `image 3`, an `IMAGE` fill at 72×114 — **a live instance of rule 2's "불가피 할시 이미지로 넣습니다" escape hatch.** |
| `스케일 참고` | `2585:336` | — | The clear-space template. Next section. |

Note the group names `012. 지역 농축협` / `023. SC은행` — **`NN. 기관명`**. The numeric prefix mirrors the filename's `숫자`, so the group name doubles as a cross-check on the filename. Rule 6 only asks for `기관 및 종목 명칭`; the `NN. ` prefix is **observed convention beyond the written rule**.

## ⭐ Clear-space / safe-area (`2585:336`, on-canvas label `스케일 참고`)

**This rule exists ONLY as geometry. There is not one word of text.** `get_metadata` renders it as an empty `<frame>` — a structure-only read finds *nothing*. I recovered it by reading child coordinates off the API. Canvas `200×200`, fill `#F3F3F3`. All guides `#D5D5D5` @ `0.4pt`.

**Concentric guide squares** (centred; margin = inset per side):

| rect | size | inset | fraction of 200 |
|---|---|---|---|
| `Rectangle 5` | `168×168` @ (16,16) | 16 | 84% |
| `Rectangle 6` | `120×120` @ (40,40) | 40 | 60% |
| `Rectangle 7` | `72×72` @ (64,64) | 64 | 36% |

**Symbol safe-areas** — three red `#FF0000` @ 10% fill tints, one per symbol aspect:

| rect | size | position | reading |
|---|---|---|---|
| `Rectangle 2` | `104×104` | (48,48) | **square symbol → 104×104 max (52%)**, 48px clear space each side |
| `Rectangle 4` | `88×120` | (56,40) | **portrait symbol → 88 wide × 120 tall (44%×60%)** |
| `Rectangle 3` | `120×88` | (40,56) | **landscape symbol → 120 wide × 88 tall (60%×44%)** |

→ **The rule: at 200×200, a symbol never exceeds 120px on its long axis and never exceeds 104px if square.** The union of the three tints is a plus/cross-shaped envelope — corners are always clear, which is what keeps the mark optically inside the circle. **Promote this table to CORE: it is the only clear-space spec in the file and it is invisible to every non-geometric read.**

## The naming grammar (`📌 샘플`, `2628:855`) — one rule per asset class

Eight sections, each stating a filename pattern verbatim with a worked exemplar. **The grammar is per-asset-class, not global — there is no single `ss_img_ci_*` rule.**

| section (layer name = on-canvas heading) | node | pattern (verbatim) | exemplar frame | size |
|---|---|---|---|---|
| `국내주식` | `2628:871` | `ss_img_ci_종목코드(숫자).png` | `이미지명` (placeholder) | 200×200 |
| `해외주식` | `2628:872` | `ss_img_ci_국가티커(알파벳).png` | `ss_img_ci_usaaapl` | 200×200 |
| `은행/증권/기관` | `2628:890` | `ss_img_company_숫자.png` | `ss_img_company_002` | 200×200 |
| `마이데이터` | `2629:915` | `기관코드.png` | `zyaaqh0000` | 200×200 |
| `간편인증기관` | `2673:310` | `기관코드.png` | `zyaaqh0000` | 200×200 |
| `공공기관` | `2629:956` | `기관코드.png` | `PBAAVN0000` (group `국민건강보험공단`) | 200×200 |
| `펌뱅킹` | `3368:353` | `ss_img_bank숫자.png` | `ss_img_bank06` | **180×87** ⚠️ |
| `언론사` | `3718:369` | `ss_img_press숫자.png` | `ss_img_press01` | **200×80** ⚠️ |

Reading the grammar:

- **`ss_img_ci_`** = tradeable instruments (stock/ETF/ETN). `국내` keys on **종목코드 (numeric)**; `해외` concatenates **국가 + 티커, lowercase alphabetic, no separator** — `usaaapl` = `usa` + `aapl`. **The concatenation is unseparated: parsing back out requires knowing the 3-letter country prefix is fixed-width.** A `usa`+`a`-ticker collision is structurally possible; the page does not address it.
- **`ss_img_company_`** = 은행/증권/기관, zero-padded 3-digit (`002`, `012`, `023`).
- **`ss_img_bank`** / **`ss_img_press`** = 펌뱅킹 / 언론사, `숫자` (`06`, `01` — 2-digit in every exemplar, **width not stated**).
- **`기관코드.png` (bare, no prefix)** = 마이데이터 · 간편인증기관 · 공공기관. **Three classes share one pattern and no prefix** — the filename is the raw institution code (`zyaaqh0000`, `PBAAVN0000`). **Note the case is inconsistent between exemplars: `zyaaqh0000` lowercase vs `PBAAVN0000` uppercase.** The page never states whether 기관코드 is case-sensitive. See LEDGER.
- **⚠️ 펌뱅킹 (180×87) and 언론사 (200×80) violate rule 4's `200x200`.** I rendered both: they are **wordmark lockups on transparent ground — no circle, no disc, no ring.** `ss_img_bank06` is the NH wordmark; `ss_img_press01` is 이데일리's red logotype. **These are a structurally different asset class that the written 제작방법 does not cover.** Rule 4's grandfather clause (`기존 ... 크기와 상관없이`) may absolve them, or they may be a genuine unwritten exception. Unresolved — see LEDGER.

### The frame-name↔filename contract, illustrated

Two pasted images sit beside the samples. **Provenance checked — both are internal Figma layers-panel captures of this very file, not foreign material.** (The method doc's warning about Highcharts docs / 원티드 talk screenshots does not bite here.)

- `2629:993` (`image 6`) — generic: `이미지명` (frame) → `종목명` (group) → `symbol` → `Ellipse`
- `2629:991` (`image 5`) — **worked**: `ss_img_ci_017860` (frame) → `DS단석` (group) → `symbol` → `Ellipse`

→ **The canonical layer stack is `<filename> / <종목·기관명> / symbol / Ellipse`.** `ss_img_ci_017860` + `DS단석` is rule 6 in one line: frame = filename, group = human name, and the 종목코드 `017860` ties them. This structure is reproduced exactly in the live sample `2628:844`.

## CI Initials Guide (`3867:7889`, on-canvas heading `CI Initials Guide`)

**The fallback when no CI image exists.** Stamped `Last update  2024.08.30 Viviana, Moana` — **the most recent artifact on the page.**

`제작방법` (`3867:7892`), verbatim:

> 1. `글자 : Pretendard, Semibold, #FFFFFF, 20px(40x40 기준)`
> 2. `배경 : #333333`
> 3. `align center 상하좌우. `

*(trailing space at source)*

- **Font: `Pretendard Semibold`.** ⚠️ **Written `Semibold`, one word.** The Figma API style string is `"Semi Bold"` (two words) — the documented footgun. **A build must not pass `Semibold` to `loadFontAsync`.** Recording the source spelling verbatim; the API name is the two-word form.
- **`20px(40x40 기준)`** — the type size is **relative to a 40×40 render**, not to the 200×200 production canvas. → **ratio 20/40 = 50% of the container.** At 200×200 that implies 100px. The page does **not** state this scaling; I flag the 50% ratio as **derived, not stated**.
- Background `#333333`, white text, centred both axes.

**The `기존 → 변경` migration** (`3867:7870`, rendered-only — the arrow `->` at `3867:7884` is a TEXT node, the semantics are spatial):

| | 기존 | 변경 |
|---|---|---|
| render | pale grey disc, text `기타` | dark `#333333` disc, text `S` · dark disc, text `앨` |

→ **Policy change: the generic `기타` placeholder was replaced by a per-item first-character initial.** Latin `S` and Hangul `앨` are both shown — **the initial is the item's actual first character in its own script, not a transliteration.** This is confirmed by set `noimage_initials` carrying exactly `Property 1=[English|Korean]`.

**⚠️ Caption-name trap:** the two 변경 discs live in frames named **`nds_icon_bullet_etf`** (`3867:7871`, `3867:7878`) — a name borrowed wholesale from an unrelated NDS_Library icon set. And the 기존 disc's text node `3867:7888` is named `국내주식` while reading `기타`. **All three names are meaningless here.** This is the instance-override class again, plus copy-paste debris.

## Default / fallback CI (`📌 종목 없을 시 디폴트 이미지`, `3867:7820`)

Eight sections of default images for when a real CI is unavailable. **All 8 COMPONENT_SETs are `remote: false` → masters in their home file** (per method: judged by structure + local resolution, **not** by the `remote` flag alone — these sets are populated, referenced by on-page instances, and have no upstream).

| on-canvas heading | section | set name | node | axes |
|---|---|---|---|---|
| `종목 첫글자 이니셜` (`종목 CI 이미지가 없을 시 개발 처리`) | `3867:7802` | `noimage_initials` | `3867:7098` | `Property 1=[English\|Korean]` |
| `기타` (`종목 이미지/이니셜 아무것도 없을때`) | `3867:7805` | `ss_img_ci_etc` | `3867:7002` | `Property 1=[etc\|kor_etc\|oversea_etc\|research_etc]` |
| `주식` (`종목 이미지/이니셜 아무것도 없을때`) | `3867:7808` | `ss_img_ci_etc` | `3867:7454` | `Country=[usd(미국)\|aus(호주)\|chn(중국)\|deu(독일)\|gbr(영국)\|hkg(홍콩)\|idn(인도네시아)\|jpn(일본)\|vnm(베트남)]` |
| `코스피, 코스닥, 코넥스` | `3867:7811` | `ss_img_ci_etc` | `3867:7316` | `Property 1=[ksp\|ksq\|knx]` |
| `계좌잔고 라벨` | `5160:618` | `ss_img_ci` | `5164:1014` | `Property 1=[bond\|dls\|els\|foreign\|fund\|mmw\|option\|rp\|trust\|ima]` |
| `ETF` | `3867:7821` | `ss_img_ci_etf` | `3867:7824` | `Property 1=[kr\|global]` ⚠️ occluded |
| `ETF` (nested dup) | `3867:7814` | `ss_img_ci_etf` | `3867:7121` | `Property 1=[kr\|global\|us]` ⚠️ |
| `ETN` | `3867:7817` | `ss_img_ci_etn` | `3867:7175` | `Property 1=[kr\|global]` |

- **`Country=usd(미국)`** — ⚠️ **`usd` is a *currency* code where every sibling is an ISO-3166 *country* code** (`aus`, `chn`, `deu`, `gbr`, `hkg`, `idn`, `jpn`, `vnm`). Should be `usa`. **And the 해외주식 exemplar is `ss_img_ci_usa` + `aapl` — the filename grammar uses `usa`, the variant axis uses `usd`.** Direct internal inconsistency. Note `4709:302` (the `usd(미국)` variant) has a far higher node id than its siblings (`3867:74xx`) → **added later**, consistent with a late hand-typed slip. Mirrors the `nds_flag` ISO-4217 confusion already recorded in `nds-lib-icons`.
- **`ima`** in `ss_img_ci` (`6313:5255`) is likewise a late addition (id `6313:` vs siblings `5160–5161:`).
- **`3867:7003` (`kor_etc`) and `3867:7035` (`oversea_etc`) are `hidden:true`.** Their contents are **not quoted as rules**. Their existence is recorded for the collision analysis only.
- `5855:183` — INSTANCE `ss_img_ci_etc_black`, main = `Property 1=etc` of set `6df9754d…`. **A black variant that exists only as an overridden instance, never promoted into the set.** Layer name suggests a variant that isn't one.

## CDN + runtime fallback policy

**`CDN 주소`** (`2628:888`) → `3720:872`, verbatim:

> `downloadcdn.nhqv.com/mts/ci/이미지명.png`

**`MTS 종목 로고 노출 정책`** (`5377:475`) → flow `5377:474`, verbatim (whitespace and the stray `- >` are at source):

> `CDN 서버에 CI 이미지 요청 -> CDN서버에 정상으로 있다고 전달 - > 화면에 CDN에 있는 CI  표시                                            ㄴ CDN서버에 이미지가 없다고 전달 -> 디폴트 CI  표시`

Decoded — a two-branch runtime contract:

1. Client requests the CI from CDN.
2. **Present** → render the CDN image.
3. **Absent** → render the **디폴트 CI** (the 8 sets above).

This is what makes the default sets load-bearing rather than decorative: **they are the wired fallback, not a design suggestion.** It also explains `종목 CI 이미지가 없을 시 개발 처리` on the initials section — **initials are generated at runtime by development, not drawn by design.** Design ships the *spec* (Pretendard Semibold / #FFFFFF / #333333 / centred), dev ships the render. **Do not expect per-item initial assets to exist as files.**

## CORE — componentKeys found

**8 COMPONENT_SETs, all `remote: false`, all local masters in NDS_CI. KIND = COMPONENT_SET for every row → use `importComponentSetByKeyAsync`.** `variantGroupProperties` succeeded on **all 8** (guarded with try/catch; **zero** `Component set has existing errors` — unlike the 7 throwing sets in NDS_Library. The set-errors↔duplicate-variant-name diagnostic does not fire here).

| Set name | Full SET key (40-hex) | KIND | Node | Variants | Tier |
|---|---|---|---|---|---|
| `ss_img_ci` | `1e5ac724199f6a6910c9c7de5a0d8c8e3f1591fc` | COMPONENT_SET | `5164:1014` | 10 | (a) local master |
| `ss_img_ci_etc` | `f3a7b6ed87a9914c0dca2f1f87d2c77cd9164dc4` | COMPONENT_SET | `3867:7454` | 9 | (a) local master |
| `ss_img_ci_etc` | `6df9754dd059b28f1944788478c8084590ca4820` | COMPONENT_SET | `3867:7002` | 4 | (a) local master ⚠️ dup name |
| `ss_img_ci_etc` | `b4665cca504f745b79265bd96065cb79067088ba` | COMPONENT_SET | `3867:7316` | 3 | (a) local master ⚠️ dup name |
| `ss_img_ci_etf` | `e1782bf94b991624a579f9c58c156277fd95080e` | COMPONENT_SET | `3867:7121` | 3 | (a) local master ⚠️ dup name — **the VISIBLE one** |
| `ss_img_ci_etf` | `b2862b1a740d8f3864c8003c98cbc5192324f566` | COMPONENT_SET | `3867:7824` | 2 | (a) local master ⚠️ dup name — **OCCLUDED** |
| `ss_img_ci_etn` | `5b7982db65feff2bf690c64d1ad7029ba4017d45` | COMPONENT_SET | `3867:7175` | 2 | (a) local master |
| `noimage_initials` | `52de7493c27ff680a71ac3097bd0e373ef0dea0f` | COMPONENT_SET | `3867:7098` | 2 | (a) local master |

**Imported from elsewhere (tier (b) — consumed, not owned here):**

| Set name | Full SET key (40-hex) | KIND | Evidence |
|---|---|---|---|
| `nds_flag` | `d81573482ffbff1e5076384753d483a3072d775f` | COMPONENT_SET | `remote: true`; resolved via `getMainComponentAsync()` on instance `3867:7067` → main `Type=Circle, Country=Global(디폴트)` → parent SET. **Key matches `nds-lib-icons.md` byte-for-byte** — cross-file corroboration that NDS_CI *consumes* NDS_Library's flag set. |

**KIND discipline:** every key above is a **SET** key, obtained from the `COMPONENT_SET` node itself (local sets) or via `getMainComponentAsync()` → `.parent` (the remote one). The **35 variant COMPONENTs each carry a different key**, deliberately not captured — they would fail `importComponentSetByKeyAsync`. **0 standalone COMPONENTs** on this page (35 = 10+9+4+3+3+2+2+2, all set members — exact, from `.length`).

**Verification: `unverified` for all 9 — expected.** Read-only session; no `importComponentSetByKeyAsync` round-trip was attempted. Keys are read directly off the nodes (authoritative for identity, not an import test).

## Conflicts / LEDGER candidates

1. **⭐ `ss_img_ci_etf` — a section nested inside ITSELF, hiding a second set with a different key.** Section `3867:7821` (`디폴트 ETF`) contains section `3867:7814` (**also** `디폴트 ETF`) at `x=0, y=0, 447×1045` — **exactly its parent's bounds, so it completely covers it.** Outer holds set `b2862b1a…` (`kr|global`); inner holds `e1782bf9…` (`kr|global|**us**`). **The canvas renders only the inner 3-variant set — I confirmed by screenshot that the outer 2-variant set is invisible.** Both `Property 1` and both `제작방법`-less. Reading: someone duplicated the section to add `us`, and the stale 2-variant original was never deleted, only buried. **`e1782bf9…` (3-variant, with `us`) is live; `b2862b1a…` is dead-but-importable.** ⛔ **A name→key lookup on `ss_img_ci_etf` will collide and may silently pick the ETF set that has no US variant.** Highest-severity item on this page. **Novel invisibility mechanism — occlusion by self-nested duplicate; add to the method doc.**
2. **`ss_img_ci_etc` — THREE sets, same name, three different keys, three incompatible axis vocabularies.** `f3a7b6ed…` (`Country=` 9 countries) · `6df9754d…` (`Property 1=` etc/kor_etc/oversea_etc/research_etc) · `b4665cca…` (`Property 1=` ksp/ksq/knx). **Not duplicates — a genuine three-way fork** serving 주식/기타/지수 respectively. All three are live and reachable. **The shared name is a trap; key off the node, never the name.**
3. **`usd(미국)` vs `usa` — the file contradicts itself on the US code.** Variant axis `Country=usd(미국)` (`4709:302`, set `f3a7b6ed…`) uses the **currency** code; the 해외주식 filename exemplar is `ss_img_ci_**usa**aapl`, using the **country** code. Every other variant (`aus`/`chn`/`deu`/`gbr`/`hkg`/`idn`/`jpn`/`vnm`) is ISO-3166. **Either the variant is a typo for `usa`, or filenames and variants use different codebooks — the page never says.** Node-id evidence (`4709:` ≫ `3867:`) says it was added later than its siblings. Same failure class as `nds_flag`'s ISO-4217-labelled-as-국가코드 (`nds-lib-icons.md`).
4. **`기관코드.png` case is inconsistent across exemplars.** `zyaaqh0000` (마이데이터 `2629:949`, 간편인증 `2673:313`) is **lowercase**; `PBAAVN0000` (공공기관 `2629:977`) is **UPPERCASE**. The pattern text is identical (`기관코드.png`) for all three sections. **Case-sensitivity of the CDN path is unspecified and the exemplars disagree.** A lookup that normalises case will work; one that doesn't may 404 → silently fall through to 디폴트 CI (per the policy above), so **this fails invisibly.**
5. **`마이데이터` and `간편인증기관` are byte-identical sections.** Same pattern (`기관코드.png`), same exemplar frame name (`zyaaqh0000`), differing only in heading. Either the two classes genuinely share a namespace (and one section is redundant), or `간편인증기관` was copy-pasted from `마이데이터` and never given its own exemplar. **Unresolved — the exemplar is almost certainly copy-paste debris**, since a real 간편인증기관 code would be unlikely to equal a 마이데이터 code exactly.
6. **펌뱅킹 (180×87) and 언론사 (200×80) contradict rule 4's `200x200 1배수`.** Rendered as transparent-ground wordmarks with no circle/ring — a class the written 제작방법 never mentions. Rule 4's grandfather clause may cover them, but **both sections sit under `📌 샘플` as go-forward exemplars, not as legacy.** Unresolved: either 제작방법 needs a wordmark clause, or these exemplars are stale.
7. **`Pretendard, Semibold` (one word) is not the Figma API font style.** The API string is `"Semi Bold"`. Verbatim source spelling retained above; **a BUILD pass must translate**, or `loadFontAsync` throws. Low severity, certain consequence.
8. **`nds_icon_bullet_etf` frames (`3867:7871`, `3867:7878`) are copy-paste debris** inside the CI Initials 기존→변경 diagram — the name belongs to an unrelated NDS_Library icon set (key `1f598ef7…` per `nds-lib-icons.md`), and these frames are not instances of it. **A name-based cross-file join would produce a phantom link between NDS_CI's initials guide and NDS_Library's ETF bullet icon.**
9. **`ss_img_ci_etc_black` (`5855:183`) exists only as an overridden INSTANCE**, never promoted to a variant of set `6df9754d…`. If a dark-mode `etc` default is expected, **it is unshippable as-is** — there is no key to import.
10. **Deep Blue rule (CORE Gotcha 14) is ABSENT here — recorded as an observation, NOT a contradiction.** Nothing on this page contradicts it. See the cross-check section: scope mismatch (NH's own brand mark vs third-party CI) is the likely and benign explanation. **Do not re-home Gotcha 14 to this file.**

## Gaps / unverifiable

- **No page-level `Last update` stamp.** Recency is carried **per-frame, by two independent stamps**: `2581:332` = `Last update  2024.02.27 Moana` (CI Guide) and `3867:7897` = `Last update  2024.08.30 Viviana, Moana` (CI Initials Guide). **The 📌 샘플 sections, the 디폴트 이미지 sections, the CDN block, and the MTS 노출 정책 block carry NO stamp at all** — and those are exactly where the unresolved conflicts (2, 3, 4, 5, 6) live. **Their recency is unknown and must not be inferred from the 2024.08.30 stamp**, which governs only the initials frame. Node-id stratigraphy (`4709:`, `5160:`, `5377:`, `5855:`, `6313:` all exceed `3867:`) proves **edits landed after 2024.08.30 that no stamp covers.**
- **`017` → `#E0E0E0` is inferred from two exemplars, not stated.** The page names the token; only the samples carry the hex. Confirm against the NDS colour-token table.
- **The initials' `20px(40x40 기준)` → 50%-of-container scaling is derived, not stated.** The page gives one datum point (40×40) and never says how it scales to 200×200. **Blank at source is the finding — do not invent a 100px value for the production canvas.**
- **No do/don't section exists.** I looked specifically. There are no ✅/❌ pairs, no 금지 examples, no misuse gallery — **unlike most NDS guide pages.** The rules are stated positively only. **The absence is the finding; do not synthesise prohibitions from the 제작방법 list.**
- **No clear-space rule in words.** `2585:336` is geometry-only (recorded above). Its *interpretation* — that the red tints are max symbol bounds rather than, say, minimum sizes — is **my reading of an unlabelled diagram.** The three-aspect structure (square/portrait/landscape) makes "max bounds" overwhelmingly the natural reading, but no text confirms it.
- **`hidden:true` COMPONENTs `3867:7003` (`kor_etc`) / `3867:7035` (`oversea_etc`)** — contents **not quoted as rules** per method. Recorded **unverified + "unhide and re-check"**. Note their set (`6df9754d…`) declares them as live variant values in `Property 1`, so **the axis advertises two options the canvas won't show you.**
- **All 9 component keys are `unverified`** — read-only session, no import round-trip.
- **`ss_img_bank06`'s and `ss_img_press01`'s `숫자` field width is unstated.** Both exemplars are 2-digit; `ss_img_company_` is demonstrably 3-digit zero-padded. Whether `bank`/`press` are 2-digit by rule or by coincidence (only ~10 exist) is unknown.
- **The 해외주식 `국가티커` concatenation has no stated separator rule.** `usaaapl` parses only if you know the country prefix is exactly 3 chars. Not stated.
- **`U+0008` sweep: clean on this page.** I read all names off the API byte-for-byte; no control characters found in any of the 913 node names — unlike the sibling `NDS_Library` file where `\bms_btn_calendar` and `\bexchange` are confirmed. **Absence here does not weaken the file-wide warning**; it is a per-page result.
