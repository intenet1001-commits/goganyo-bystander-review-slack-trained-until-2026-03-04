---
name: nds-ci-archive
fileKey: KmpaYeoYh41F6nyIKvBQ7h
source_url: "https://www.figma.com/design/KmpaYeoYh41F6nyIKvBQ7h/NDS_CI?node-id=3323-345"
learned_date: 2026-07-16
sections_studied:
  - "3323:345 (page 'Archive' — canvas root; 13,669 nodes, 317 top-level, spanning x≈2,257→48,838 and y≈-5,443→43,924)"
  - "3323:360 (frame '현재 파일명 기준' — on-canvas heading '국가코드' / '구분'; the ss_img_ci_국가코드_구분.png naming key. Screenshotted, transcribed in full)"
  - "3762:346 (frame 'guide' — the no-CI fallback spec, '기존 → 변경'; Pretendard/Semibold/#FFFFFF/20px, bg #333333. Screenshotted, transcribed)"
  - "3641:42 + 3862:617 (TWO COMPONENT_SETs both named 'nds_icon_bullet_etf', different keys, byte-identical renders — see Conflicts #1)"
  - "3641:58 (COMPONENT_SET 'nds_icon_bullet_null')"
  - "6456:5371 (section '디자인 테스트', 4985×4831 — on-canvas headings '컬러 테스트' / '프리텐다드' / '산돌 격동고딕'. ACTIVE font A/B test. Screenshotted)"
  - "6419:5845 (section '자동완성 주요 화면', 4580×2826 — on-canvas headings '[나무] 자동완성 입력' / '[N2]' / '[나무] 다크모드 (폼디용 아님)'; notes dated (7/13). Screenshotted)"
  - "3179:310 in the SAME file (live 'ETF' — read for CROSS-PAGE comparison; not part of this page)"
  - "109:25310 in the SAME file (live '국내주식' — read for naming-rule comparison; not part of this page)"
status: "unknown at page level, and DELIBERATELY not 'deprecated' — the page name is the ONLY thing suggesting archival and it is contradicted by the contents. NO deprecation marker exists (all keyword hits are false positives; opacity sweep found NO ghosting; 0 strikethrough; NO Last update). The page splits cleanly into TWO id generations with a gap: 88 top-level nodes from the 3xxx era (original deposit, possibly superseded) and 229 from the 6xxx era — and the 6xxx work POSTDATES the entire live ETF page (max id block 5735), carrying screenshots filename-dated 2026-06-23/06-24/07-08 and notes dated (7/13), i.e. THREE DAYS before learning. This page is a PARKING LOT hosting the newest ETF-CI work in the file. JUDGE PER FRAME, NOT PER PAGE."
---

# NDS_CI — "Archive" page

## ⭐ THE HEADLINE — this "Archive" holds the NEWEST work in its page group, not the oldest

**The page name is not merely unhelpful here; it is actively misleading, and the file's own node ids prove it.**

Figma allocates node-id blocks monotonically, so the id block dates the *creation batch*. Measured:

| Page | Max id block | What that means |
|---|---|---|
| live **`ETF`** (`3179:310`) | **5735** | every node on the live ETF spec page |
| live **`국내주식`** (`109:25310`) | **6178** | |
| **THIS "Archive" page** (`3323:345`) | **6508** | **newer than both** |

**229 of this page's 317 top-level nodes are from the 6xxx era — later than every single node on the live `ETF`
page.** The shared `필수 ETF는 아래와 같아요` note exists on both: `5718:190` on live ETF, **`6059:3412` here.**
**This page's copy is the newer one.**

### The id-block gap is the real evidence — this page was deposited, went dormant, then was REOPENED

| Generation | Top-level nodes | y-range |
|---|---|---|
| **3xxx** (original deposit) | **88** | −5,443 → 3,505 |
| **4xxx** | **0** | — |
| **5xxx** | **0** | — |
| **6xxx** (new work) | **229** | −2,693 → 43,924 |

**Zero 4xxx and zero 5xxx nodes at top level.** The page was created in the 3xxx era, **lay untouched through the
entire 4xxx and 5xxx eras — exactly when the live `ETF` page (max 5735) was being built** — and was then
**reopened as a working canvas in the 6xxx era**. That is not decay; that is a page being *archived and then
recommissioned*.

**Freshness, from the pixels and filenames:**
- `스크린샷, 2026-07-08 오후 5.44.12 1` (`6349:4129`), `…오후 6.37.07 1` (`6349:4130`), `…오후 6.17.16 1`,
  `…오후 5.44.12 2`, `…오후 6.37.07 2` — **filename-dated 2026-07-08, EIGHT DAYS before learning.**
- `스크린샷, 2026-06-23 오후 2.30.53 1`/`2`, `스크린샷, 2026-06-24 08.41.19 1` — **2026-06.**
- On-canvas note text `…없음 (7/13)` and `…하지 않음 (7/13 기획회의)` — **July 13, THREE DAYS before learning**,
  and `기획회의` = "planning meeting". **Someone was working here this week.**

> **This is the lead's "PARKING LOT, not retired" warning in its strongest form yet.** The sibling NDS_Library
> archives hosted WIP *alongside* superseded specs. **Here the WIP is the majority of the page and is the most
> recent material in its entire page group.** **Judge per frame.**

## Status verdict — `unknown`, and I am refusing to guess in BOTH directions

**There is NO deprecation marker on this page.** Searched the full 13,669-node dump, the real `characters` of all
2,465 TEXT nodes, and screenshots for: `구버전`, `이전`, `미사용`, `deprecated`, `old`, `백업`, `폐기`, `중단`,
`👿`, `제외`, `해당없음`, `사용금지`, `임시`, `보류`, `legacy`/`LEGACY`, `삭제`, `레거시`, strikethrough, dimming,
and a `→ 이동` pointer to a replacement page. **`👿` appears ZERO times. `구버전`/`미사용`/`deprecated`/`제외`/
`해당없음` appear ZERO times.**

### ⚠️ All three keyword hits are FALSE POSITIVES. A grep would get this page exactly wrong.

| Hit | Node | What it actually is |
|---|---|---|
| **`old`** ×1 | `3762:386` | **The substring inside `Semibold`** — `글자 : Pretendard, Semibold, #FFFFFF, 20px…`. **I confirmed this visually in the screenshot of `3762:346`.** The exact false positive `nds-lib-search-bar-archive` logged. |
| **`중단`** ×3 | `3862:4628`, `3867:3840`, `3862:6003` | **A news headline inside a mockup**: `법원의 판매 금지 중단! 애플워치 미국 시장에서 다시볼 수 있다` — "Court **halts** sales ban! Apple Watch returns to the US market". **Dummy article copy in a news-card component.** `중단` is the *subject matter*, exactly as `기본/중단_illust30` was on the Illusts archive. |
| **`이전`** ×1 | `6419:5880` | `[나무] 자동완성 입력 이전 검색 날짜 표시 (히스토리) 없음 (7/13)` — "no display of search date **prior to** autocomplete input". **`이전` = "prior to", not "previous version"** — the same trap as `65세 이전` on the Illusts archive. **And this node is dated 7/13 — it is the newest kind of content on the page.** |

**Every keyword hit is either a font name, a fake news headline, or a three-day-old spec note.**

### Why not `superseded`, given the 3xxx half looks like a leftover?

**Because I could not establish it, and the honest answer is per-frame.** The 3xxx deposit (88 nodes,
y −5,443→3,505) *looks* like the original archive drop. But:
- **Its naming-rule card documents a scheme that is still LIVE** (see below) — so it is not obviously stale.
- **No live page defines itself against this one.** I checked `ETF` (`3179:310`) and `국내주식` (`109:25310`):
  neither contains a `구 버전`/`legacy`/pointer callout aimed at this page. **Contrast the sibling
  `은행/증권/기관 Archive`, where the live page explicitly labels the archive generation `구 버전 CI`** — that
  mechanism exists in this file, and **its absence here is meaningful.**
- **The page carries no `Last update` stamp of any kind** (0 hits for `Last update`/`업데이트`/`수정일` across
  2,465 TEXTs) — so the 3xxx half cannot be dated even approximately, let alone ordered against a live sheet.

**So: `unknown` for the 3xxx half, plainly `live WIP` for the 6xxx half, `unknown` for the page.**
**Consequence for BUILD: promote nothing from this page.** Not because it is dead — parts of it are the freshest
work in the file — but because **the 6xxx half is unresolved exploration** (a font A/B test with no verdict) and
**the 3xxx half is undated with no successor callout.** Neither state is promotable.

## ⭐ OPACITY SWEEP — explicit result: 48 dimmed of 13,669, and NOT ONE is a ghosted CI asset

**Ran the sweep the method demands** (`use_figma` + `findAll` + `node.opacity`). **Note: `try/catch` is mandatory
— `SLICE` nodes throw `TypeError: node.opacity: no such property 'opacity' on SLICE node`** (7 slices here). My
first attempt died on exactly this.

| Metric | Result |
|---|---|
| Nodes swept | **13,669** |
| Nodes with opacity < 1 | **48** (0.35%) |
| Opacity histogram | **`{0: 1, 0.05: 3, 0.1: 15, 0.3: 13, 0.4: 6, 0.5: 4, 0.8: 6}`** |
| `struckCount` (over all 2,465 TEXTs) | **0** |
| `Last update` hits (real `characters`) | **0** |

### The verdict on ghosting: the file-wide 0.10 convention is ABSENT here. The 0.1 hits are a decoy.

**15 nodes sit at exactly 0.1 — the convention's value — and NONE of them is a ghosted asset.** Every one is an
ordinary UI element inside a phone mockup:

- **`0.1`** ×15 — all named `Line` / `Line Copy` / `Line Copy 2…4`, and all are **nested instance-internal ids**
  (`I3862:4912;930:22323;0:1017` …). **They are chart gridlines inside three copies of the same mockup**
  (`3862:4912`, `3867:4124`, `3862:6287`). **Faint gridlines, not marked assets.**
- **`0.3`** ×13 — `종목 검색` placeholder text ×3 (`3862:4919`, `3867:4131`, `3862:6294`), chart `Vector`s, and
  **`ETF_메인_테마` (`6461:8422`) — a whole FRAME at 0.3** (see below).
- **`0.05`** ×3 — `Rectangle` background tints. **`0.4`** ×6, **`0.5`** ×4, **`0.8`** ×6 (`상품몰` labels) — styling.
- **`0`** ×1 — `Rectangle 5961` (`I6335:6364;3683:14886;3683:14852`), a fully-transparent hit-area rect.

**The decisive test is selectivity, and it fails:** the 0.10 convention on NDS_Library was **selective within
peer groups** (2 of 10 `투자종류/`, 3 of 6 `프로필/`) — that is what made it a signal. Here, **not a single
`ss_img_ci_*` asset is dimmed at any value.** The 0.1 nodes are three identical copies of the same gridline set.
**This is styling, not marking.** For a logo library that is a real negative: **no institution/ETF mark on this
page is ghosted.**

> **One dimmed node IS worth flagging, and it is not a CI asset:** **`ETF_메인_테마` (`6461:8422`, 540×2,387) — an
> entire top-level frame at opacity 0.3.** This is the same *whole-block dimming* mechanism found on
> `nds-lib-search-bar-archive` (the `확장 활용안` keypad proposal, dimmed as a unit at 0.5). **A 6xxx-era frame,
> dimmed as a unit — reads as parked/not-yet-approved.** **Its meaning is unstated on canvas. Not guessing.**

**`hidden="true"`: 147 nodes** — high, but they are **component-internal optional layers** inside mockup instances
(`Oval Copy 2`, `line`, `한국/미국` toggle states, `GPT banner_NM`). **This is normal variant machinery, not
concealed rules.** `3323:362` (`Text`, 500×40, hidden) sits inside `3323:360`; **its content is not quoted
anywhere in this note.** Not individually transcribed — see Gaps.

## Layer-name convention on THIS page — mixed, and it lies in a specific, learnable way

**State it precisely, because the two halves differ:**

- **The 3xxx deposit: names are RELIABLE and machine-readable.** `ss_img_ci_<국가코드>_<구분>` —
  `ss_img_ci_aus_stock`, `ss_img_ci_kor_etf`, `ss_img_ci_oversea_etn`, `ss_img_ci_kor_stock_ksp`,
  `ss_img_ci_knx`, `ss_img_ci_etc`. **These match the on-canvas naming card exactly** (see below). Trustworthy.
- **The 6xxx work: names are DEBRIS.** `IMG_2847 1`, `IMG_9963 1`, `IMG_0121 1` (~90 pasted phone screenshots),
  `image 7`/`image 515`–`519`, `Rectangle 10956` ×2 (**duplicated name**), `Rectangle 10957`, `Group 1410120651`
  /`…652`/`…655`, `Frame 482759`, `Frame 2147237866`, and **`frame id="6363:6175" name=" "` — a name that is a
  single SPACE character. Blank at source; quoted as found.**
- **TEXT layer names are the full sentence, not a label** — e.g. a node literally named
  `현재 CDN 에는 100px 사이즈로 반영되어 있습니다. 신규 추가시 200px (1배수) 로 작업해 주세요.` **This is the file's
  convention for TEXT and it means layer names and `characters` coincide *for TEXT only*.** Do not generalise it
  to frames.
- **`ss_img_ci_etf` is used as a name by ~25 DIFFERENT frames at different sizes** (200×200, 50×50, 40×40) across
  the 6xxx area. **The name identifies the asset *class*, not a unique node.** A name-keyed lookup would collide.

**The page name itself is the biggest lie on the page** — see the headline section.

## What's actually on the page (inventory — page status `unknown`, nothing for BUILD)

**317 top-level nodes, two disjoint halves.**

### Half A — the 3xxx deposit (88 top-level, y −5,443→3,505). Real spec material, undated.

1. **`현재 파일명 기준` (`3323:360`, 678×604)** — **screenshotted and transcribed in full.** The naming key:
   > **`국가코드`** — `국내(한국) : kor` · `해외 : oversea` · `호주 : aus` · `중국 : chn` · `독일 : deu` ·
   > `영국 : gbr` · `홍콩 : hkg` · `인도네시아 : idn` · `일본 : jpn` · `미국 : usa` · `베트남 : vnm`
   > **`구분`** — `주식 : stock` · `ETF : etf` · `ETN : etn` · `기타 : etc` · `코스피 : ksp` · `코스닥 : ksq` ·
   > `코넥스 : knx`
2. **The naming/call cards** (`3323:346`, `:348`, `:349`, `:351`) — verbatim:
   > `네이밍룰 :` `ss_img_ci_국가코드_구분.png`
   > `호출 예시 :` `downloadcdn.nhqv.com/mts/ci/ss_img_ci_aus_stock.png`
   > `[사용 메뉴] 큰손 PICK` (`3323:352`)
3. **`현재 CDN 에는 100px 사이즈로 반영되어 있습니다. 신규 추가시 200px (1배수) 로 작업해 주세요.` (`3323:330`)** —
   verbatim: "The CDN currently reflects 100px; when adding new ones, work at 200px (1×)." **A live production
   constraint.** Corroborated by the assets themselves: **`ss_img_ci_usa_stock` (`3323:332`) is 100×100 while
   every sibling is 200×200** — the one un-migrated asset, [sic].
4. **`guide` (`3762:346`, 2177×1082)** — **screenshotted and transcribed.** The no-CI fallback rule, presented as
   **`기존` → `변경`** (existing → changed): a grey `기타` chip becomes a **dark circle bearing the stock name's
   first character** (shown: `S`, `앨`). Spec verbatim:
   > `글자 : Pretendard, Semibold, #FFFFFF, 20px(40x40 기준)`
   > `배경 : #333333`
   > `align center 상하좌우`
   Titled by `종목CI가 없는 경우 종목명의 첫글자로 표시 하는 예` (`3762:392`). **This is a change proposal with an
   arrow — its approval state is unstated.**
5. **Section headings, verbatim** — **`📌 기타` (`3323:314`)**, **`📌 바꿀까?` (`3862:6938`, "shall we change
   it?")**, **`테스트중` (`3633:216`, "being tested")**, **`📌 개선 참고용` (`3450:27`, "for improvement
   reference")`. **Note `테스트중` — the identical WIP marker found on `nds-lib-search-bar-archive`.**
   **`📌` is this page's section-marker convention; it is NOT a deprecation marker.**
6. **The `ss_img_ci_*` asset pairs** — each country/type asset appears **twice**, at y≈−4,210/−3,948 and again at
   y≈−3,270/−2,970 (e.g. `ss_img_ci_aus_stock` `3323:339` and `3862:6939`). **A before/after pair under
   `📌 바꿀까?`.** Not reconciled.
7. **Eight `디폴트 국내주식` / `디폴트 해외주식` SECTIONs** (`3862:5534`, `:5544`, `:5556`, `:5568`, `:5580`,
   `:5607`, `:5618`, `:5628`) — "default domestic/overseas stock". **Six share the name `디폴트 국내주식`;
   two share `디폴트 해외주식`. Duplicate section names, unresolved.**

### Half B — the 6xxx ETF-CI / 자동완성 working area (229 top-level, sprawling to x≈48,838, y≈43,924). ACTIVE.

8. **`디자인 테스트` section (`6456:5371`, 4985×4831)** — **screenshotted.** An **unresolved A/B test**:
   - **`컬러 테스트`** — `RISE(kb자산운용)` and `SOL(신한)` marks in yellow vs blue-vs-white variants, `2X`/`2x`
     badges in competing colourways. Note verbatim: **`bg 컬러 있는 로고 못찾음`** ("couldn't find a logo with a
     bg colour").
   - **`프리텐다드`** vs **`산돌 격동고딕`** — **the same ETF list screens rendered in two different typefaces,
     side by side.** A font decision in progress. Sub-columns `레버리지`, `2줄 테스트`, `테마`, `통합검색`,
     `국기 구분`, and **`ETF검색 : CI 넣을건지 체크`** ("ETF search: check whether to include CI").
   **No verdict is recorded on canvas.**
9. **`자동완성 주요 화면` section (`6419:5845`, 4580×2826)** — **screenshotted.** Autocomplete screens for
   **`[나무]`**, **`[N2]`**, and **`[나무] 다크모드 (폼디용 아님)`** ("dark mode (not for 폼디)"). Notes dated
   **`(7/13)`** and **`(7/13 기획회의)`**; one in orange: `메뉴, 테마, 종목 혼합시 무조건 메뉴가 최상단`
   ("when menus, themes and stocks are mixed, the menu is always at the top"). **Three days old.**
10. **Asset-manager CI research** — `ss_img_ci_kodex`, `ss_img_ci_tiger`, `ss_img_ci_ace`, `ss_img_ci_sol04`,
    `ss_img_ci_koact`, plus a text list `KODEX(삼성증권)` / `TIGER(미래에셋)` / `ACE(한국투자신탁운용)` /
    `RISE(kb자산운용)` / `SOL(신한)` / `HANARO(농협)` / `하나원큐` (`6443:6918`–`:6924`).
11. **Verbatim research notes** (`6067:3498`, `6095:2281`, `6095:2283`, `6095:2285`, `6059:3412`, `6335:5317`,
    `6225:5048`) — e.g. `필수 ETF는 아래와 같아요. 🌍 해외 (6개) SPY → S&P500 …`, and
    `- 신규 ETF메인 기준 레버리지, 인버스 페이지만 로고가 들어간 리스트형으로 나옴 …`. **Open questions, not rules**
    — one is literally `채훈형?` (`6071:3502`).
12. **~90 pasted phone screenshots** (`IMG_2438`–`IMG_2488`, `IMG_9926`–`IMG_9997`, `IMG_0113`–`IMG_0137`,
    `IMG_7407`–`IMG_7415`, `IMG_2847`) — competitor/reference captures. **Not transcribed** (see Gaps).

## CORE — componentKeys found

**12 COMPONENT/COMPONENT_SET nodes exist on this page** (`findAllWithCriteria`). **`variantGroupProperties` was
read under `try/catch` per the method; it succeeded for all three SETs — no duplicate-variant-name errors.**

**⛔ EVERY KEY BELOW IS NOT-FOR-PROMOTION** — the page's status is `unknown`, and two of the three SETs are
**same-named rivals** (Conflicts #1). **Inventory only. Do not put any of these in `CORE.md`.**

| Key (full 40-hex) | Kind | Name | Node |
|---|---|---|---|
| `c1c1bb7815a5cb37dd02f0c4facce81e86189936` | **SET** (axis: `Type`) | `nds_icon_bullet_null` | `3641:58` |
| `0895709d6f69f45f80bb73586ebaa7d759cd2389` | VARIANT | `Type=01` | `3641:59` |
| `a6a305255d27dd54b3fb4dc26c14f781ac72714d` | VARIANT | `Type=02` | `3641:66` |
| **`88f608455b8748933faf181b7e2483671894ce8d`** | **SET** (axis: `Type`) | **`nds_icon_bullet_etf`** ⚠ **rival A** | `3641:42` |
| `4c3da8a50186fb32e8cac6ecd404bac6048c3e75` | VARIANT | `Type=2x` | `3641:43` |
| `058865cc53cfd609087f3c5334005bdd7756e81c` | VARIANT | `Type=3x` | `3641:48` |
| `002a2f9a91793fd1c039cbc64b8109a2f50a8d93` | VARIANT | `Type=etf` | `3641:53` |
| **`53e076897835655ab0fc596cc4f3d2a42b68dd2a`** | **SET** (axis: `Type`) | **`nds_icon_bullet_etf`** ⚠ **rival B** | `3862:617` |
| `af09e09ee10cfb32c46fe9aeca15439c2a0ad4b9` | VARIANT | `Type=2x` | `3862:618` |
| `468b1ebbb0119d153ddd6a001216fb02fa1ae9df` | VARIANT | `Type=3x` | `3862:623` |
| `a54d599b383a1851daa0162f2ed9fae13e1825f9` | VARIANT | `Type=etf` | `3862:628` |
| `05f1cb516af8c3cfe4ab2066210b9dc50c302339` | COMPONENT (**bare — no SET**) | `2x` | `6400:4598` |

**No `ss_img_ci_*` asset is a component.** As on the sibling banks archive, the CI assets are plain frames shipped
**via CDN by filename** (`downloadcdn.nhqv.com/mts/ci/…`) — **there is no key to promote for any logo in this
file.**

## Conflicts for LEDGER

### 1. ⚠️ **TWO published COMPONENT_SETs named `nds_icon_bullet_etf`, different keys, byte-identical renders — and they are the ONLY definitions in the file** — ⚠ CONTESTED, actionable

> **`nds_icon_bullet_etf` exists TWICE on this page**: `3641:42` (key
> `88f608455b8748933faf181b7e2483671894ce8d`) and `3862:617` (key `53e076897835655ab0fc596cc4f3d2a42b68dd2a`).
> **Same name. Same axis (`Type`). Same variants (`2x`/`3x`/`etf`). Same size (217×80).** I screenshotted both:
> **the PNGs are byte-identical (`f84e83f160909b225a2a025db8b5210c`)** — three grey pills reading `ETF 2X`,
> `ETF 3X`, `ETF`. **Indistinguishable duplicates with distinct published keys.**
>
> **And there is no live rival to prefer:** `findAllWithCriteria` on the live **`ETF`** page (`3179:310`) returns
> **zero COMPONENTs** and zero bullet instances. **These two SETs, plus `nds_icon_bullet_null`, are the only
> `nds_icon_bullet_*` definitions anywhere in the stock-CI page group — and they live on the "Archive" page.**
>
> **Consequence:** anything importing `nds_icon_bullet_etf` **by name** has two equally-valid candidates and no
> on-canvas tiebreaker. **`3862:617` is the newer id block, but that orders creation, not preference** — and both
> sit in the *older* 3xxx/3862 deposit, not the active 6xxx area.
> **Do not promote either key.** **The question for a designer is sharp and answerable:
> *which `nds_icon_bullet_etf` is canonical, and why is the file's only ETF bullet component on the Archive
> page?*** Note `variantGroupProperties` read cleanly on both — **the duplicate is at the SET level, not a
> broken-variant error**, so Figma will not flag it.

### 2. **The "Archive" page holds the file's newest ETF-CI work, and it is unresolved** — ⚠ CONTESTED

> **`nds-ci-archive` (`3323:345`) is not behind the live `ETF` page (`3179:310`) — it is ahead of it.** Max id
> block **6508** vs **5735**; the shared `필수 ETF` note is `6059:3412` here vs `5718:190` there. The page carries
> screenshots filename-dated **2026-07-08** and notes dated **(7/13 기획회의)**, and hosts two large working
> sections — **`디자인 테스트`** (an undecided **프리텐다드 vs 산돌 격동고딕** font A/B for ETF CI lists, plus
> `컬러 테스트` and `ETF검색 : CI 넣을건지 체크`) and **`자동완성 주요 화면`** (`[나무]`/`[N2]`/dark-mode
> autocomplete).
>
> **The live `ETF` page cannot be treated as the current state of ETF CI design.** An in-flight redesign is
> parked on the Archive page and **no verdict is recorded on canvas**. Additionally **`ETF_메인_테마`
> (`6461:8422`) is dimmed to opacity 0.3 as a whole frame** — the same "parked block" mechanism seen on
> `nds-lib-search-bar-archive`'s `확장 활용안`. **Meaning unstated. Not guessing.**
> **This is a live-work-in-the-wrong-place finding, not a deprecation finding.**

### 3. **Two incompatible `ss_img_ci_` naming schemes coexist across pages — but BOTH are live** — ⚠ resolve before citing either

> | Source | Naming rule | Example |
> |---|---|---|
> | **`nds-ci-archive`** (this page, `3323:346`) | **`ss_img_ci_<국가코드>_<구분>.png`** — by **country + type** | `ss_img_ci_aus_stock`, `ss_img_ci_kor_etf` |
> | live **`국내주식`** (`3720:911`, heading `이미지 네이밍 룰`) | **`ss_img_ci_<종목코드>(숫자).png`** — by **numeric stock code** | — |
> | live **`ETF`** (`3179:310`) | **both** `ss_img_ci_종목코드(숫자).png` **and** `ss_img_ci_국가티커(알파벳).png` | — |
>
> **Do NOT read this as one scheme superseding the other.** The live `ETF` page still carries
> **`ss_img_ci_etc`, `ss_img_ci_oversea_etc`, `ss_img_ci_etf`, `ss_img_ci_kor_etf`** — i.e. **this archive page's
> country/type scheme is still in use on a live page.** The two schemes are **complementary**: per-stock CI by
> code, **falling back** to a generic country/type mark. **The archive's naming card documents the still-live
> fallback layer** — which is a substantial reason *not* to write this page off.
> **Recording it because the tempting inference (old scheme → dead) is wrong**, and it is the same prefix-based
> reasoning error that `nds-lib-illusts-archive` had to retract.

### 4. **A 100px/200px migration is incomplete, and the page says so** — ✅ concrete

> `3323:330` verbatim: **`현재 CDN 에는 100px 사이즈로 반영되어 있습니다. 신규 추가시 200px (1배수) 로 작업해 주세요.`**
> — the CDN serves 100px; new assets must be authored at 200px. **On this page 21 of 22 `ss_img_ci_*` country/type
> assets are 200×200, but `ss_img_ci_usa_stock` (`3323:332`) is 100×100** — and it is a `rounded-rectangle`, not a
> `frame`, unlike every sibling. **The one un-migrated asset, and it is the USA one — the highest-traffic market.**
> Filing as a concrete, checkable defect. **I did not verify what the CDN actually serves today.**

## Gaps / unverifiable

- **The live `ETF` page (`3179:310`) is the decisive comparison and I only sampled it.** I read its texts,
  component list (zero), CI families (34), opacity (0 dimmed) and id range (max 5735) — **I did not screenshot it
  or compare its frames to this page's `디자인 테스트` proposals.** Whoever holds `ETF` should check **whether the
  프리텐다드/산돌 격동고딕 decision landed there**. That would convert Conflict #2 from open to closed.
- **~90 pasted phone screenshots were NOT transcribed** (`IMG_2438`–`IMG_2488`, `IMG_9926`–`IMG_9997`,
  `IMG_0113`–`IMG_0137`, `IMG_7407`–`IMG_7415`, `IMG_2847 1`, and the five `스크린샷, 2026-06/07-*` captures).
  Per the method's "rules live inside pasted screenshot images" warning **these could hold rules**, and the
  2026-07-08 ones are the freshest artefacts on the page. **Unread. This is the largest hole in this note.**
  **Provenance caution:** they appear to be **competitor/other-app captures** (the `디자인 테스트` section shows
  Toss/KODEX-style list UIs) — **third-party material posing as reference, exactly the trap flagged for the
  sibling pages. Do not mistake any of them for NDS rules.**
- **`3323:362` (`Text`, 500×40, `hidden="true"`, inside `3323:360`)** was **not** made visible or read. Per the
  method it renders blank; **no rule is quoted from it.** One of 147 hidden nodes, the rest being component-
  internal variant machinery.
- **The `테스트중` (`3633:216`), `📌 바꿀까?` (`3862:6938`) and `📌 개선 참고용` (`3450:27`) regions were located
  but not individually screenshotted** — I screenshotted `3323:360`, `3762:346`, `6456:5371` and `6419:5845`.
  The `📌 바꿀까?` before/after asset pairs (y≈−3,270/−2,970) are therefore **inventoried but not visually
  compared** — I cannot say how the two rows differ. **A VERIFY pass should screenshot y≈−4,300→500 at x≈3,900–7,000.**
- **`ETF_메인_테마` (`6461:8422`) at opacity 0.3** — the whole-frame dimming is confirmed, **its meaning is not.**
- **The `기존 → 변경` fallback proposal (`3762:346`) has no approval state on canvas** — it is a change arrow, not
  a ratified rule. **Do not implement it from this note.**
- **The two `nds_icon_bullet_etf` SETs were not checked for downstream usage.** I confirmed the live `ETF` page
  has no instances of them; **I did not sweep the other 13 pages of this file or other files.** If one rival has
  instances and the other does not, that settles Conflict #1 cheaply.
- **`frame id="6363:6175" name=" "`** (1,990×2,140, at x≈26,527) — a frame named with a single space, not opened.
</content>
