---
name: nds-lib-illusts-archive
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=46732-1202"
learned_date: 2026-07-16
sections_studied:
  - "46732:1202 (page '    - Illusts Archive' — canvas root, the largest page in this batch: 2,743 nodes, ~180 top-level nodes, spanning y≈17,781 to y≈56,000 and x≈-7,388 to x≈7,528)"
  - "20835:85 (text 'ss_img_com_illust' — the only heading-like label on the illustration grid; NOT a framed title bar)"
  - "1165:16853 … 4986:9221 (the 기본/ · 투자종류/ · 프로필/ illustration symbol grid, illust01–illust146, 400×400 each, with a Korean caption text node above each)"
  - "1165:16857 … 10712:15467 (the QV/illust01–illust29 symbol grid, 400×400 each)"
  - "51906:6880 (section '디자인작업용 🎨 컴포넌트', 6620×6553 — a designer working area of 연금/pension screen mockups; NOT illustrations)"
  - "51906:6645 / 51906:6698 / 51906:6753 / 51906:6876 (sections '원형' / '라인' / '막대' / '막대' — chart-style working sections)"
status: "superseded (page) + 65 of 153 components INDIVIDUALLY GHOSTED at opacity 0.10 with captions at 0.30 — a real, selective, per-asset marking convention whose MEANING is unstated on canvas (retired? migrated?) and is UNRESOLVED. Page verdict from comparison against live `    - Illusts` (1165:16606, `nds-lib-illusts.md`, `Last update 2025.10.24 유상엽`, consolidated COMPONENT_SET nds_illust = 140 illustrations x NM/N2, no gaps) vs this page's loose pre-consolidation grid with NO Last update stamp. NO strikethrough anywhere (struckCount 0, verified). The two keyword hits (중단, 이전) are BOTH false positives — illustration SUBJECT MATTER. ⚠️ CORRECTIONS: (1) this note originally claimed 'no dimming' — WRONG, see the CORRECTION section; (2) an inference that `ss_img_` is a legacy prefix was REFUTED by `nds-lib-icons.md`."
---

# NDS_Library — "    - Illusts Archive" page

## 🔴 CORRECTION — I said "no dimming". THAT WAS WRONG. 65 components are ghosted at opacity 0.10.

**This is the most important thing on this page and my original pass missed it entirely.** I claimed no
greyed-out/low-opacity overlays existed. **I had no basis for that claim** — I read `get_metadata`, which does
**not encode opacity**, and I never screenshotted the illustration grid (I flagged that gap myself as "the single
largest hole in this note"). **The hole was exactly where the evidence was.** Verified now via
`use_figma` + `findAll` + `node.opacity`:

### The finding: a two-level, per-asset, selective ghosting convention

| | Count | Opacity |
|---|---|---|
| **Illustration COMPONENTs — ghosted** | **65** | **0.10** |
| Illustration COMPONENTs — normal | 88 | 1.00 |
| **Caption TEXTs — dimmed** | **67** | **0.30** |
| Caption TEXTs — normal | 58 | 1.00 |

**The two levels agree:** a ghosted component (0.10) has a dimmed caption (0.30). **This is a deliberate,
maintained marking convention, not a rendering artifact or a caption style.**

**It is selective *within* groups — which is what proves it is a signal, not styling:**

- **`투자종류/`** (10 illustrations): `안정적투자_illust08` and `스마트한투자_illust10` are **ghosted**;
  `illust01`–`07` and `illust09` are **solid**. 2 of 10.
- **`프로필/`** (6 illustrations): `계산적투자자_illust11`, `공격적투자자_illust12`, `안정형투자자_illust15`
  **ghosted**; `공부하는투자자_illust13`, `단기형투자자_illust14`, `장기형투자자_illust16` **solid**. 3 of 6 —
  **an even split inside a six-item set.**
- Rows interleave: y=24891 has **9 ghosted / 1 solid**; y=18341 has **2 ghosted / 18 solid**.
- **All 29 `QV/illust01`–`illust29` are solid.** The ghosting touches only the `기본/`·`투자종류/`·`프로필/` scheme.

**The 65 ghosted, verbatim:** `투자종류/안정적투자_illust08`, `투자종류/스마트한투자_illust10`,
`프로필/계산적투자자_illust11`, `프로필/공격적투자자_illust12`, `프로필/안정형투자자_illust15`, `기본/중단_illust30`,
`기본/알림_illust32`, `기본/카드_illust35`, `기본/보안_illust40`, `기본/발견_illust41`, `기본/티타임_illust43`,
`기본/공부_illust47`, `기본/공유_illust49`, `기본/혜택_illust53`, `기본/확인_illust59`, `기본/거절_illust60`,
`기본/구독_illust62`, `기본/원화_illust63`, `기본/외화_illust64`, `기본/대중교통_illust65`, `기본/랭킹_illust66`,
`기본/온라인쇼핑_illust69`, `기본/자산관리_illust70`, `기본/주문거래_illust73`, `기본/리테일_illust75`,
`기본/해외결제_illust76`, `기본/호기심_illust77`, `기본/세금_illust78`, `기본/경쟁대결_illust79`,
`기본/급상승_illust81`, `기본/긴급_illust82`, `기본/단계진행중_illust83`, `기본/만기도래_illust84`,
`기본/모니터_illust85`, `기본/모으다_illust86`, `기본/목표_illust87`, `기본/상담_illust89`, `기본/인기있는_illust92`,
`기본/장애물허들_illust93`, `기본/지표_illust94`, `기본/콘텐츠_illust95`, `기본/개인화_illust96`, `기본/검색_illust97`,
`기본/계산기_illust98`, `기본/계획_illust99`, `기본/돈상품찾기_illust101`, `기본/로딩대기_illust102`,
`기본/모바일터치_illust103`, `기본/바이오인증_illust104`, `기본/배달앱_illust105`, `기본/상품위험도_illust107`,
`기본/선물_illust108`, `기본/소비투자_illust110`, `기본/소통_2_illust111`, `기본/스마트워치_illust112`,
`기본/신분증_illust113`, `기본/자산비교_illust114`, `기본/잡화_illust115`, `기본/저축_illust116`,
`기본/전환_illust117`, `기본/위험도_illust118`, `기본/챌린저_illust119`, `기본/통신료_illust120`,
`기본/투자성향_illust121`, `ss_img_com_nm_illust123`.

### ⛔ What the ghosting MEANS is NOT stated anywhere. I am not guessing.

**There is no legend, key, or caption on this page explaining the convention.** Two readings fit the evidence
and I cannot separate them:

- **(a) Retired** — the 65 are withdrawn illustrations.
- **(b) Migrated** — the 65 are the ones already folded into the live `nds_illust` SET, ghosted as "done", with
  the 88 solid ones still pending.

**Evidence against (a):** every ghosted number (08…123) falls inside the live SET's complete `nds_illust01`–
`nds_illust140` range, so **none of them is missing from the live library** — hard to reconcile with "retired".
**Evidence against (b):** nothing on the page says "migrated" either, and reading (b) assumes a number-for-number
correspondence between `기본/중단_illust30` and `nds_illust30` that **is itself unverified**.

**Blank at source. Unresolved — and consequential**, because 65 assets' status hangs on it.

**The test that settles it** (cheap, for whoever holds `nds-lib-illusts.md` / page `1165:16606`): the live SET's
`No` axis is pure numbers. Check whether the live `nds_illust08` / `nds_illust30` / `nds_illust121` **depict the
same subjects** as the archive's `투자종류/안정적투자_illust08` / `기본/중단_illust30` / `기본/투자성향_illust121`.
Same subjects ⇒ reading (b), the numbering carried over. Different subjects ⇒ the numbering was reused and both
readings collapse.

> **Method note worth carrying forward:** the lead's warning was exactly right and I had dismissed it implicitly.
> **`get_metadata` cannot see opacity, and a page-zoom screenshot cannot see 0.10 vs 1.00 reliably at 40px.**
> Only `node.opacity` via `use_figma` surfaces this. **For any archive/deprecation hunt, the opacity sweep is not
> optional.** `struckCount` was **0** here — so on this page dimming was the *only* invisible mechanism in play,
> and it was carrying the entire signal.

---

## ⭐ RESOLVED — read this first (added after the original pass), and ONE OF MY INFERENCES WAS WRONG

**The live rival page has landed as `nds-lib-illusts.md` (page `1165:16606`, status `live`), and it does two
things: it settles the status, and it REFUTES a hypothesis I offered below. Both matter.**

### 1. Status: superseded

| | This archive page (`46732:1202`) | Live `    - Illusts` (`1165:16606`) |
|---|---|---|
| Structure | ~204 loose `<symbol>`s, `기본/<주제>_illustNN` | **1 COMPONENT_SET `nds_illust`** (`0ec614d9667c2ae11fd9887cc3aa571c85546dca`), **280 variants = 140 illustrations × NM/N2** |
| Numbering | sparse, gapped, 3 schemes | `nds_illust01`–`nds_illust140` — **complete, no gaps, no duplicates** |
| Date | **no `Last update` at all** | **`Last update 2025.10.24 유상엽`** — the freshest stamp in the file |
| Extra | — | an **`(NEW)`**-badged usage card + a `25.06~` new-source programme |

**The loose per-illustration symbol grid was consolidated into a single variant SET, and the live page is stamped
2025.10.24 against this page's *nothing*.** The archive grid is the pre-consolidation generation. **Superseded —
do not promote.**

### 2. ⚠️ My `ss_img_` hypothesis below is REFUTED — recording it rather than quietly deleting it

Below, in Conflicts #1, I hypothesised that **`ss_img_` is this file's legacy prefix**, reasoning from the Icons
Archive's `ss_img_flag_` being labelled `원형 구버전`. **I flagged it as "a hypothesis, NOT a finding — do not act
on it." That caution was warranted: the hypothesis is wrong.**

`nds-lib-icons.md` (the **live** Icons page) shows `ss_img_*` components that are **current and shipping** —
`ss_img_quickbar` (`80fc818618096f42616ee1ec5f8f6f45a5fb1a4b`, 8 variants), `ss_img_2022home_morebank`,
`ss_img_menu_speed`, `ss_img_ico_chatbot` — and explains the prefix outright:

> **`nds_img_` / `ss_img_` families — images, not icons**

**`ss_img_` is an ASSET-CLASS prefix meaning "image", not a version marker.** Some `ss_img_*` assets are live;
some are legacy. **The prefix predicts nothing about status.**

**So why is `ss_img_flag_` old?** Because the canvas **says so** — the literal text `원형 구버전` sits above it.
**The label was the evidence; the prefix never was.** My Icons Archive finding stands unchanged (it rested on the
label). This Illusts hypothesis, which rested only on the prefix, does not.

> **The lesson generalises and is worth more than the correction:** I inferred a naming *rule* from a single
> labelled instance, then reached across pages with it. `nds-lib-illusts.md` independently reports the same
> tangle — `ss_img_com_qv_illust32`–`41` **are** legacy there, but sit under a `Tax(참고불가)` marker, i.e. again
> **labelled**, not deduced. **In this file, status comes from labels, never from prefixes.**

**What this does NOT change:** three naming generations really do coexist here — that observation was
descriptive and holds. What collapses is my *ordering* of them by prefix.

---

## Status verdict (as originally written) — `unknown`, and the keyword hits are traps

**No deprecation marker exists on this page.** This is the same call `nds-mweb-archive.md` made, for the same
reason, and it is the honest one: the page name "Archive" is a **hint, not evidence**, and nothing on the canvas
corroborates it.

**What I searched for and did not find:** `구버전`, `이전`, `미사용`, `deprecated`, `old`, `백업`, `폐기`, `중단`,
`사용금지`, `임시`, `보류`, `제외`, `해당없음`, `👿`, strikethrough, greyed-out / low-opacity overlays, and any
`→ 이동` pointer to a replacement page — across the full 2,743-node metadata dump **and** screenshots.

> ### ⚠️ Both keyword hits are false positives. Do not let a grep decide this page's status.
> A keyword sweep returns two hits here. **Neither is a status marker. Both are illustration subject matter:**
>
> | Hit | Node | What it actually is |
> |---|---|---|
> | **`중단`** | text `1165:16636` + symbol `1165:16757` **`기본/중단_illust30`** | An illustration **named "중단" (halt/stop)** — one entry in a caption grid sitting between `기본/캘린더_illust29` and `기본/부동자산_illust31`. It is *a picture of stopping*, not a page marked stopped. |
> | **`이전`** | text `51906:7185` **`65세 이전`** | "**before** age 65" — a label inside a pension (연금) mockup. The word `이전` here means *prior to*, not *previous version*. |
>
> This is precisely the failure the method warns about. **A pass that greps `중단|이전` and reports "deprecated,
> 2 markers found" would be confidently wrong.** Every hit on this page must be opened and read in context.

**Additional finding — the absence is itself evidence.** This page has **no `Last update` stamp anywhere**. Its
two sibling archive pages both have one (`Search bar Archive`: `Last update 2022.10.21 이경은`; `Icons Archive`:
`Last update 2022.10.18 이경은`). **So the absence here is not a house convention — it is a gap specific to this
page.** Its freshness is genuinely unknown, not merely unlabeled. Worth reporting exactly as the method asks.

**Consequence for BUILD: `unknown` means nothing on this page may be promoted to `CORE.md` or used in a build.**
Not because it looks wrong — it looks clean and complete — but because *looking clean is not evidence of being
current*, and there is no evidence either way. Hold until a VERIFY pass compares it against the live
`    - Illusts` page (`1165:16606`), which is the decisive test I could not run (see Gaps).

## Layer-name convention on THIS page — reliable for the grid, absent elsewhere

**The convention is per-page, and this page's is unusually strict — for the top half only.**

- **The illustration grid follows a rigid, machine-readable pattern**: `<카테고리>/<주제>_illust<NN>`, e.g.
  `기본/캘린더_illust29`, `투자종류/글로벌투자_illust01`, `프로필/계산적투자자_illust11`, `QV/illust07`.
  Three category prefixes are in use — **`기본/`** (general, illust17–illust146), **`투자종류/`** (investment
  type, illust01–illust10), **`프로필/`** (investor profile, illust11–illust16) — plus a separate **`QV/`**
  channel grid (illust01–illust29). Each symbol has a matching Korean caption text node directly above it.
  **Reliable — the caption and the layer name agree everywhere I checked.**
- **Three names break the pattern** and are worth quoting verbatim rather than normalising:
  `ss_img_com_nm_illust123` (`9181:14955`) — carries an `ss_img_com_nm_` prefix instead of a category;
  `NM/nds_illust34` (`50407:637`) / `QV/nds_illust34` (`50407:695`) — an `nds_illust` naming with NM/QV channel
  prefixes; and `N2/nds_illust138` (`73656:7831`) / `NM/nds_illust138` (`73658:10650`, `73728:9147`) /
  `N2/nds_illust138` (`73728:9271`) — an **`N2/`** channel prefix appearing nowhere else in this batch.
  **Three naming generations coexist on one page** (`기본/…_illustNN`, `ss_img_com_*`, `<채널>/nds_illustNN`).
  That is a version-history smell — but **there is no on-canvas statement of which is current**, so I am not
  guessing. See Conflicts.
- **The lower half has no convention at all** — `Frame 123701`, `Vector` ×~90, `범례`, `post-it`,
  `Screenshot_20240129_103840_NH QV 1`. Debris.
- **`ss_img_com_illust` (`20835:85`)** is a bare text node, not a framed heading bar. **This page has no
  title-bar frame** of the `Icon` / `Flag` / `Search Bar` kind its sibling pages all have — another structural
  difference worth noting: it was never given the spec-page treatment.

## What's actually on the page (inventory only — status `unknown`, not for BUILD)

The page is **two unrelated halves**, exactly like `Search bar Archive`:

### Upper half (y ≈ 17,781–29,600) — the illustration inventory. This is the page's real subject.

- **`ss_img_com_illust` (`20835:85`)** — the grid's only label.
- **`투자종류/` — 10 illustrations** (`illust01`–`illust10`), captions verbatim: `글로벌 투자`, `현명한 투자`,
  `특별한 투자`, `통합적 투자`, `즐거운 투자`, `일상의 투자`, `알뜰한 투자`, `안정적인 투자`, `미래를 위한 투자`,
  `스마트한 투자`.
- **`프로필/` — 6 illustrations** (`illust11`–`illust16`), captions: `프로필 계산적인투자자`, `프로필 공격적인투자자`,
  `프로필 공부하는투자자`, `프로필 단기형투자자`, `프로필 안정형투자자`, `프로필 장기형투자자`.
  > **Caption/name mismatch to preserve**: caption reads `프로필 공격적인투자자` and `프로필 계산적인투자자`, but the
  > symbols are named `프로필/공격적투자자_illust12` and `프로필/계산적투자자_illust11` — **the captions carry an
  > extra `인`**. Quoted as found; not reconciled.
- **`기본/` — ~130 illustrations** (`illust17`–`illust146`). Captions verbatim, in grid order:
  `알람`, `영상`, `프리미엄`, `맞춤`, `지폐`, `일상`, `모바일`, `동전`, `뉴스`, `게임`, `통합`, `통장`, `캘린더`,
  **`중단`**, `부동자산`, `알림`, `비일상`, `주식`, `카드`, `투자`, `AI`, `마켓`, `데이터`, `티타임`, `문`, `보안`,
  `직장인`, `mts`, `발견`, `공부`, `영수증`, `공유`, `차트`, `분할`, `말풍선`, `혜택`, `상승`, `인증`, `글로벌`,
  `소통`, `분석`, `제안`, `확인`, `거절`, `교육`, `구독`, `원화`, `외화`, `대중교통`, `랭킹`, `마트`, `빅데이터`,
  `온라인쇼핑`, `자산관리`, `자산운용`, `노는돈`, `주문거래`, `탐색`, `리테일`, `해외결제`, `호기심`, `세금`,
  `경쟁대결`, `급등급락`, `급상승`, `긴급`, `단계진행중`, `만기도래`, `모니터`, `모으다`, `목표`, `반복`, `상담`,
  `상품추천`, `연금`, `인기있는`, `장애물,허들`, `지표`, `콘텐츠`, `개인화`, `검색`, `계산기`, `계획`, `기록`,
  `돈상품찾기`, `로딩대기`, `모바일터치`, `바이오인증`, `배달앱`, `배당`, `상품위험도`, `선물`, `성장`, `소비투자`,
  `소통_2`, `스마트워치`, `신분증`, `자산비교`, `잡화`, `저축`, `전환`, `위험도`, `챌린저`, `통신료`, `투자성향`,
  `연말정산`.
- **`QV/` — 29 illustrations** (`QV/illust01`–`QV/illust29`), a separate channel grid at x≈649–5,284. **No
  captions** — numbered only.
- **Stragglers** near y≈29,100–37,500: `NM/nds_illust34` / `QV/nds_illust34`; `nds_illust133` (`72880:5966`);
  `새싹+동전` (`72881:7836`); three `nds_illust` instances; the `N2/`+`NM/` `nds_illust138` set; and a cluster of
  ~90 raw `Vector` nodes (`73728:12535`–`73728:12652`) — an ungrouped, mid-edit illustration.

### Lower half (y ≈ 36,500–56,000) — a pension (연금) design working area. **Not illustrations at all.**

- **`디자인작업용 🎨 컴포넌트` (`51906:6880`, 6620×6553)** — verbatim: "**components for design work**". Screenshotted:
  dozens of 연금/pension screen mockups — asset totals (`32,600,000 원`, `10,000,000 원`), return-rate cards
  (`-15.24%`), stacked bar charts, candlestick charts, donut charts, empty-state cards, and product lists
  (`배당귀족ETF`-style rows). A **second** section with the same name (`51906:8849`) sits at x≈2,836.
- **Sections `원형` / `라인` / `막대` / `막대`** (`51906:6645`, `:6698`, `:6753`, `:6876`) — "circle / line / bar /
  bar", chart-style working sections. **Note two sections share the name `막대`** — unresolved duplication.
- **Full-screen pension frames**: `통합연금_MAIN_01`, `NH연금_수령중_01`, `NH연금_수령전_04_수익률_월간`,
  `연금목표 모니터링_이번년도` ×2, `02_디폴트옵션04_선정01_nm`, `02_디폴트옵션04_선정01_qv`,
  `나의자산현황_NH투자증권_상품별자산`, `[QV]시장국면_상승장` ×2, `Frame 123701`, `범례` ("legend").
- **Symbols**: `contents/NH연금/보유상품비중/현금성자산 유` (`23664:2866`) and
  `contents/NH연금/보유상품비중/현금성자산 무` (`23664:3057`) — a 유/무 (with/without) pair.
- **Debris**: `Screenshot_20240129_103840_NH QV 1` (a pasted Android screenshot, filename-dated **2024-01-29**)
  and a `post-it` instance.

> **The `_nm` / `_qv` suffix pair on `02_디폴트옵션04_선정01`** is the channel convention (NM = 나무, QV = QV)
> seen throughout this domain — consistent, noted, not contradictory.

## Conflicts for LEDGER

### 1. Three coexisting illustration naming generations — **⚠ CONTESTED, unresolved on canvas**

> The Illusts Archive page carries **three mutually inconsistent illustration naming schemes side by side**, with
> **no on-canvas statement of which is current**:
> 1. `<카테고리>/<주제>_illust<NN>` — e.g. `기본/캘린더_illust29`, `투자종류/글로벌투자_illust01` (the bulk, ~175 symbols)
> 2. `ss_img_com_*` — the grid label `ss_img_com_illust` (`20835:85`) and `ss_img_com_nm_illust123` (`9181:14955`)
> 3. `<채널>/nds_illust<NN>` — `NM/nds_illust34`, `QV/nds_illust34`, `N2/nds_illust138`, `NM/nds_illust138`
>
> **The `ss_img_` prefix is independently corroborated as an old-version marker elsewhere in this same file**:
> NDS_Library's Icons Archive labels its `ss_img_flag_(국가코드)` set **`원형 구버전`** verbatim
> (`nds-lib-icons-archive`, `8883:13039`). **If `ss_img_` is this file's legacy prefix, then scheme (2) is the
> oldest and scheme (3) — carrying the `N2/` channel absent from every other page in this batch — is likely the
> newest.**
> **This is a hypothesis from a prefix pattern, NOT a finding.** The Illusts page carries no `구버전` label of its
> own. Do not act on it. **It is a concrete, cheap question for VERIFY**: compare against the live
> `    - Illusts` page (`1165:16606`) and check which prefix it uses.

### 2. No `Last update` stamp — a freshness gap specific to this page

> `nds-lib-illusts-archive` has **no `Last update` stamp anywhere**, while both sibling archive pages in the same
> file carry one (`Search bar Archive` 2022.10.21 이경은; `Icons Archive` 2022.10.18 이경은). **The absence is
> therefore page-specific, not a file convention** — this page cannot be dated even approximately, and cannot be
> ordered against the live `    - Illusts` page by date. The most recent *indirect* timestamp is a pasted
> screenshot filename, `Screenshot_20240129_103840_NH QV 1` (**2024-01-29**), which is filename evidence only and
> dates the *paste*, not the illustrations.

### 3. `디자인작업용 🎨 컴포넌트` — a live designer working area parked on an "Archive" page

> The lower ~60% of the Illusts Archive page is **not illustrations** — it is a large 연금 (pension) screen design
> working area, self-labelled **`디자인작업용 🎨 컴포넌트`** ("components for design work") across two sections
> (`51906:6880`, `51906:8849`), containing full pension screens (`통합연금_MAIN_01`, `NH연금_수령중_01`,
> `연금목표 모니터링_이번년도`, `02_디폴트옵션04_선정01_nm`/`_qv`) and a 2024-01-29 pasted screenshot.
> **This is the same structural pattern found on `Search bar Archive`** (which hosts a `테스트중` keypad WIP area
> and a `확장 활용안` proposal). **In this file, "Archive" pages double as general-purpose scratch canvases.**
> Consequence: **the page name predicts neither status nor subject matter.** A pass looking for pension-screen
> designs would never think to look on the Illusts *Archive* page. Filing so the content is findable.

## CORE — componentKeys found

**None captured — deliberately.** `get_metadata` + `get_screenshot` only; no `get_design_context` /
`importComponentSetByKeyAsync` calls were made, so no 40-hex key was read for anything on this page.
**Given the `unknown` verdict, no key from this page is promotable to `CORE.md` or usable in a BUILD pass** —
per the method's rule, an `unknown` page's contents must not be promoted. Extracting keys would produce an
inventory every row of which is labelled "not for promotion, status unresolved". The cost is better spent on
the VERIFY comparison that would actually settle the status (see Gaps).

## Gaps / unverifiable

- **The decisive test was not run, and it is cheap.** The live `    - Illusts` page (`1165:16606`) sits in this
  same file and is **outside my batch**. Comparing the two would settle this page's status in one pass: if the
  live page re-states the same `기본/`·`투자종류/`·`프로필/` grid, this page is `deprecated`; if the live page holds
  a *different* set, this page may still be current. **Whoever holds `1165:16606` should run this.** Same applies
  to `    - Emoji & Nmoji` (`15422:15275`) and `    - Infographic` (`19888:18193`) for my sibling note.
  > Suspicious detail worth a look: the live `    - Illusts` page's nodeId is **`1165:16606`** and this archive
  > page's illustration symbols are numbered **`1165:16607`–`1165:16853`** — an *adjacent* id block. The two
  > pages' contents were plausibly created in the same session or split from one original. **An id-adjacency
  > observation only — it proves nothing about status.**
- **The illustration artwork itself was not visually inspected.** ~204 symbols at 400×400 across ~12,000px of
  canvas; I screenshotted the `디자인작업용` section and the `원형` section, **not** the illustration grid. **Per the
  method, visual deprecation signals (strikethrough, dimming) exist only in pixels — so my "no dimming"
  statement is NOT verified for the illustration grid itself.** It rests on the metadata dump, which does not
  encode opacity. **This is the single largest hole in this note.** A VERIFY pass should screenshot the grid at
  y≈18,000–29,000.
- **The ~90 raw `Vector` nodes (`73728:12535`–`73728:12652`)** are an ungrouped, apparently mid-edit
  illustration around `nds_illust138`. Not screenshotted; state unknown.
- **`Screenshot_20240129_103840_NH QV 1` (`51906:8680`, 540×1200) was not transcribed.** Per the "rules live
  inside pasted screenshot images" warning it may hold rules. **Unread.**
- **Two sections both named `막대`** (`51906:6753`, `51906:6876`) — duplication unexplained; contents of the
  second not screenshotted.
- **No frame was flagged `hidden="true"`** in the dump, so the blank-1×1 caveat did not apply — not re-confirmed
  node-by-node.
