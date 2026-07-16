---
name: nds-ci-public-agencies
fileKey: KmpaYeoYh41F6nyIKvBQ7h
source_url: "https://www.figma.com/design/KmpaYeoYh41F6nyIKvBQ7h/NDS_CI?node-id=1255-2"
learned_date: 2026-07-16
sections_studied:
  - "1255:2 (page '공공기관' — canvas root; 49 nodes, 9 top-level children, 6 standalone COMPONENTs, 0 COMPONENT_SETs)"
  - "3902:607 (page heading '📌 공공기관' — matches the page name; but see the collision with page 1251:2)"
  - "3902:606 (grammar caption '기관코드.png')"
  - "1255:30 (the sole code legend — 6 lines, ORDERED-list formatted)"
status: "unknown — all 6 components are local (remote:false), populated, fully visible, and carry no 👿 / deprecation marker / supersede pointer / parking band. BUT the page carries NO date stamp of any kind (contrast the sibling '은행/증권/기관' page, which stamps both sections '240328'). Per method, no stamp ⇒ recency unknown. NOT inferred from the page name."
---

# NDS_CI — "공공기관" page

**The smallest page in my batch: 49 nodes, 6 COMPONENTs, 3 TEXT nodes.** It is a clean, internally-consistent, single-system page — the only one of my three with **zero internal contradictions**. Everything of interest about it is either (a) what it does *not* say, or (b) how it collides with its neighbour.

Read it in five minutes; the value is in the two findings below, not the inventory.

## ⚠️ Third-party-logo usage rule: **NONE EXISTS**

**Stated as a finding; not inferred.** The page has exactly **3 TEXT nodes**. I read `characters` on all three. In full, they are: the legend (`1255:30`), the grammar caption `기관코드.png` (`3902:606`), and the heading `📌 공공기관` (`3902:607`). **That is the entire text content of the page.**

**None of them states a usage, permission, attribution, licensing, clear-space, or sizing rule.** There is **no IP notice**. The only governing text in the file is NDS_Library's Welcome-page notice asserting **NH투자증권's** rights — silent on these marks.

**⛔ And on this page the gap is at its sharpest, because these are not ordinary corporate logos.**

I rendered the page. **Three of the six components — `PBAAVJ0000` (국세청), `PBAAVK0000` (관세청), `PBAAVL0000` (행정안전부) — reproduce the ROK 정부상징 (the Taegeuk government symbol).** Its use is governed by **statute** (정부기 및 정부상징에 관한 규정) independently of any private agreement, with prescribed colour, proportion, and clear-space rules. The remaining three — 국민건강보험공단, 국민연금공단, 공무원연금공단 — are statutory public corporations with their own CI manuals.

**The page reproduces all six with no colour spec, no clear-space spec, no proportion spec, and no citation of any CI manual.** ⛔ **Absence of a rule is not a grant of one.** Treat as an open legal question. This is the single highest-consequence gap across my three pages, and it is a gap of **silence**, not of contradiction.

## ⛔ Heading collision with page `1251:2` — this page is the *victim*

This page's heading (`3902:607`) is verbatim:

> `📌 공공기관`

**This is correct here** — the page is named `공공기관` and its contents are six government bodies. **But the sibling page `1251:2`, named `간편인증기관`, carries the byte-identical heading `📌 공공기관`** while containing 간편인증 providers (네이버/카카오/토스/PASS…).

**Two pages in this file render the same `📌 공공기관` heading over unrelated contents.** Evidence this page is the original and `1251:2` is the stale copy: this page's heading matches its page name and its `PBAAVx0000` codes are a coherent single system; `1251:2`'s does not match its name and its codes are `ZY/ZV/ZW` + `ss_img_ci_*`.

**⛔ An agent that keys off on-canvas headings will merge these two pages.** LEDGER-worthy. Full analysis in `nds-ci-simple-auth.md` (conflict #3) — **recorded in both notes because the collision is only visible from either side.**

## Name-reliability verdict: **RELIABLE — and this page is the clean reference case**

- **COMPONENT names — RELIABLE.** All 6 are institution codes; the name IS the primary key. **No trailing spaces, no U+0008, no typos, no grammar breaks.** I checked with `JSON.stringify` on every name — all six round-trip clean. **This is the only page in my batch where that is true** (contrast `ZYAAEO0000 ` on `1251:2` and `O2저축은힝`/`c1aacs000a` on `511:2`).
- **Child GROUP names — RELIABLE AS DATA**, and they **corroborate the legend exactly** (table below). Zero disagreements.
- **TEXT layer names — reliable as content, but read `characters`.** The legend's layer name flattens all line breaks into one string.
- **No container junk** — all 6 components are parented directly to the PAGE.

**Every identifier on this page agrees with every other identifier on this page.** Use it as the baseline for what the other CI pages *should* look like.

## The naming grammar

Caption (`3902:606`), verbatim — the whole stated grammar:

> `기관코드.png`

Actual shape, from all 6 components:

> **`PBAA<xx>0000`** — 10 chars: literal `PBAA`, two uppercase letters, then `0000`

**`PB` is the 공공기관 class prefix.** All 6 share it; no other prefix appears. This slots into the file-wide pattern I can now see across my three pages:

| Prefix | Page | Class |
|---|---|---|
| `a1`/`a2`/`a3`/`a4` | `511:2` 은행/증권/기관 | 은행 / 외국계 / 저축은행 / 중앙회 |
| `c1` | `511:2` | 금융투자 |
| `ZY` / `ZV` / `ZW` | `1251:2` 간편인증기관 | 간편인증 (반영 / 미반영) |
| **`PB`** | **`1255:2` 공공기관** | **공공기관** |

**⚠️ Note the case split, which nothing documents:** `511:2`'s codes are **lowercase** (`a1aaad0000`); `1251:2`'s and this page's are **UPPERCASE** (`ZYAAQH0000`, `PBAAVN0000`). **Same 10-char `<class><AA><xx>0000` shape, opposite case, across pages of one library.** Any case-sensitive lookup that spans pages will fail. **Unstated at source** — I am reporting the observation, not a rule.

**⛔ `기관코드.png` is a non-discriminating caption.** The **byte-identical** string appears on `1251:2` (`3905:2820`) governing `ZY/ZV/ZW…` codes. It means only "these are institution codes" — it does not tell you the prefix, the case, the length, or the system. **Do not treat it as a grammar spec.** (Contrast `511:2`'s `ss_img_company_숫자.png`, which at least names its family.)

**The `<xx>` slot is a sparse alphabetic allocation, not a counter.** Observed: `VJ, VK, VL, VM, VN, VO` — a **contiguous `VJ`–`VO` run**, which is tempting and which you must not extrapolate from. **Do not iterate.** (Sibling-file precedent: iterating `01..N` 404s.)

## CORE — componentKeys found

**6 standalone COMPONENTs. Zero COMPONENT_SETs → no variant axes, no SET keys, nothing for `importComponentSetByKeyAsync`.** All **KIND = COMPONENT** (use `importComponentByKeyAsync`), all `remote: false`, all `parentType: PAGE`, all `opacity: 1`, all `visible: true`, all `180×180`, all at `y = −272`, **all with an empty `description`**.

Per method — **`remote: false` in a home library = MASTER; judge by structure, not the flag.** Structure agrees: page-level, populated, non-instance masters in the CI library's home file. **Tier (a): published-library source components.** Consuming files see `remote: true`.

| Code (name) | Full COMPONENT key (40-hex) | Institution | Child GROUP(s) |
|---|---|---|---|
| `PBAAVN0000` | `d748555458f89cf357bfc49a2833a11d84243d5a` | 국민건강보험공단 | `국민건강보험공단` |
| `PBAAVM0000` | `9806062b4418360b9523bfc845cdbfa0a2e14d1b` | 국민연금공단 | `국민연금공단` |
| `PBAAVJ0000` | `b136d0d9c49b43bd9e7bb3b0b3d6e65b2ddb296f` | 국세청 | `mask`, `국세청` |
| `PBAAVK0000` | `5ea941dd5e55b8dd429e9125d025c808666431e5` | 관세청 | `관세청` |
| `PBAAVL0000` | `ccf48e19e6a3fba2d57f3c660ea2287232443858` | 행정안전부 | `행정안전부` |
| `PBAAVO0000` | `540ec3e0cadcf587f27dd1d2b67158a237210232` | 공무원연금공단 | `공무원연금공단` |

**Verification: `unverified` for all 6 — expected.** Read-only session; `importComponentByKeyAsync` would throw. Keys are read directly off the COMPONENT nodes — authoritative for identity, not a round-trip import test.

**Not applicable, stated so nobody re-checks:** `variantGroupProperties` / duplicate-variant-name ⇔ set-has-errors — **no COMPONENT_SETs exist**. `getMainComponentAsync()` — **0 INSTANCEs on the page**.

**Note `PBAAVJ0000` (국세청) is the only component with two children** (`mask` + `국세청`). `mask` is artwork plumbing, not a second logo — **not a hidden variant**, and `visible: true`. Recorded only so the child-count asymmetry does not read as a defect later.

## ⭐ Three codes, ONE visual — the finding a structure-only read cannot reach

**I rendered the page, and this is what the render bought:**

**`PBAAVJ0000` (국세청), `PBAAVK0000` (관세청), and `PBAAVL0000` (행정안전부) are visually IDENTICAL** — all three are the same 태극 정부상징 on a white circle. **No text, no agency name, no distinguishing mark of any kind in the artwork.**

Three distinct components, three distinct 40-hex keys, three distinct codes, three distinct GROUP names — **rendering to the same picture.**

**⛔ Consequences a build must handle:**
- **The code is the ONLY carrier of meaning.** Lose the code and the asset is unidentifiable — you cannot tell 국세청 from 관세청 by looking.
- **A visual-dedupe or asset-hashing pass will collapse these three into one and silently destroy the mapping.** This is a realistic failure: they are almost certainly byte-identical exports.
- **Any UI showing one of these logos MUST render the agency name alongside it**, or the user cannot tell which agency they are dealing with. **The page states no such rule** — this is my inference from the render, and I flag it as an inference.

`get_metadata` reports six differently-named symbols and gives **no hint whatsoever** that half of them are the same picture. **This is precisely the class of thing the "render every rule-bearing frame" rule exists to catch** — and here it was caught not on a rule frame but on the inventory itself.

## Exact counts vs the legend — **agreement, and it is the only page where I can say that**

All figures from `.length`. **The page states no `N개`-style count heading**, so there is no heading-vs-reality disagreement to report — the absence is itself worth stating, given the method's warning that heading counts in this domain are systematically stale (`Nmoji: 142개` → really 152).

| Measure | Count |
|---|---|
| Total nodes | **49** |
| Top-level children | **9** |
| TEXT | **3** |
| **COMPONENT** | **6** |
| **COMPONENT_SET** | **0** |
| INSTANCE | **0** |
| `opacity < 1` | **0** |
| `visible:false` | **0** |
| STRIKETHROUGH | **0** |

**Legend `1255:30` — verbatim `characters`:**

> `국민건강보험공단 - PBAAVN0000`
> `국민연금공단 - PBAAVM0000`
> `국세청 - PBAAVJ0000`
> `관세청 - PBAAVK0000`
> `행정안전부 - PBAAVL0000`
> `공무원연금공단 - PBAAVO0000`

**6 legend lines : 6 components : 6 GROUP names — three independent sources, all in exact agreement.** No missing entries, no orphan entries, no trailing spaces, no mixed line endings (clean `\n` throughout — contrast `1251:2`'s `\r\n`/`\n` mix). **This is the only page in my batch with no count or legend discrepancy.**

**⚠️ Rendering trap — the same one as `1251:2`:** the render shows this legend as a numbered list `1.`–`6.`, but **`characters` contains no digits**. `getStyledTextSegments(['listOptions'])` returns **`ORDERED`** for the whole node. **The numbering is Figma list formatting, not text.** Anyone transcribing from a screenshot will invent six numbers that do not exist in the data — and might then mistake them for codes. Confirmed by API, not by eye.

## Conflicts / LEDGER candidates

1. **⛔ `📌 공공기관` heading collides byte-for-byte with page `1251:2`'s heading** (which is named `간편인증기관`). **This page is the legitimate holder**; `1251:2`'s is the stale copy. Heading-keyed lookup merges two unrelated pages. Cross-recorded in `nds-ci-simple-auth.md` #3.
2. **⛔ `PBAAVJ0000` / `PBAAVK0000` / `PBAAVL0000` are visually identical** (정부상징). Code is the sole discriminator; visual dedupe destroys the mapping; UI must show the name. **Invisible to `get_metadata`.** (Detail above.)
3. **`기관코드.png` is a non-discriminating caption** — byte-identical string governs a different code system on `1251:2`. Useless as a grammar spec. Cross-recorded in `nds-ci-simple-auth.md` #6.
4. **Case inconsistency across pages, undocumented:** `511:2` uses lowercase codes (`a1aaad0000`), this page and `1251:2` use uppercase (`PBAAVN0000`). Same `<class><AA><xx>0000` shape. **Case-sensitive cross-page lookup will fail.**
5. **Box-size inconsistency across pages, undocumented:** this page and `1251:2` are **180×180**; `511:2` is **200×200**. **Two canonical CI box sizes in one library, neither stated.** Cross-recorded in `nds-ci-simple-auth.md`.
6. **No parking convention present here** — and that is worth noting rather than assuming safety. `511:2` parks via `visible:false` siblings; `1251:2` parks via `반영`/`미반영` spatial bands; `- Illusts` parks via `opacity: 0.10/0.30/0.5`. **This page uses none of the three.** So either nothing here is parked, **or this page simply has no mechanism to say so.** ⛔ **I cannot distinguish those two readings**, and with no date stamp (below) I will not guess. **There is no file-wide "is this live?" check.**

## Gaps / unverifiable

- **⛔ NO date stamp of any kind.** I swept all 3 `characters` for `Last update` / `update` / `ver.` / `버전` / 6-digit date patterns — **zero hits**. Direct contrast with `511:2`, which stamps **both** its sections `240328` in dedicated `🏷` frames. **Per method: no stamp ⇒ recency unknown.** The `status: unknown` rests on this. With only 6 agencies and no date, **I cannot tell whether this page is complete-and-current or an abandoned stub** — 6 is a plausible count for a real feature scope *and* a plausible count for "someone started this and stopped".
- **No sizing / clear-space / export-multiplier / colour rule** — despite three components being a **statutorily-regulated government mark** that has all four in its own official manual. All 6 are **180×180** (uniform, verified) but **the page never states it**, and the caption's `.png` implies raster export at an **unstated multiplier**. **⛔ The regulated marks are the ones with no spec.**
- **No `scale guide`** on this page (`511:2` has one, hidden, inside 카카오뱅크). Nothing here answers "how big should the logo be inside the 180×180 box".
- **No 👿 / 제외 / 해당없음 / 구버전 / 이전 / 미사용 / deprecated / 백업 / 폐기 / 중단 anywhere.** Swept all 3 `characters` and all 49 node names — **zero hits**. Genuinely absent, not overlooked.
- **No U+0008, no trailing spaces, no typos** — verified via `JSON.stringify` on every component name and every `characters` value. **Clean, and the only page in my batch that is.**
- **Provenance: clean.** No pasted-image/screenshot nodes; no foreign documents posing as rules (contrast the sibling pages' Highcharts docs and 원티드 talk). All 6 components are native artwork; all 3 TEXT nodes are native text.
- **Cross-system join: not attempted, because nothing to join to.** These `PB` codes appear on no other page in my batch. **Whether 공공기관 have a `ss_img_company_*` or `ss_img_ci_*` equivalent is unknown** — `511:2`'s CDN system runs `002`–`294` (banks/brokerages only) and `1251:2`'s appCode system runs `100`–`205` (wallet/gov/finance apps, including `ss_img_ci_100` 정부24앱). **`ss_img_ci_100` (정부24앱) is arguably the same government the `PB` codes serve, keyed in a completely different system with a completely different logo.** I did not resolve this; it is a real open question for a build.
- **I did not verify the 6 agencies against the real MyData/공공 API surface** — answerable only outside Figma.
