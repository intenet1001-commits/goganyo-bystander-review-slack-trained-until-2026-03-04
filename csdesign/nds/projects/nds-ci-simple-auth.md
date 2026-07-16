---
name: nds-ci-simple-auth
fileKey: KmpaYeoYh41F6nyIKvBQ7h
source_url: "https://www.figma.com/design/KmpaYeoYh41F6nyIKvBQ7h/NDS_CI?node-id=1251-2"
learned_date: 2026-07-16
sections_studied:
  - "1251:2 (page '간편인증기관' — canvas root; 120 nodes, 37 top-level children, 18 standalone COMPONENTs, 0 COMPONENT_SETs)"
  - "3905:2821 (page heading — reads '📌 공공기관', NOT '간편인증기관'; see the heading conflict below)"
  - "3905:2820 (grammar caption '기관코드.png' — governs the left half)"
  - "4793:300 (second on-canvas heading '📌 모바일 신분증인증 기관')"
  - "4793:260 (grammar caption 'ss_img_ci_appCode.png' — governs the right half)"
  - "1314:2 / 1314:3 (the '반영' / '미반영' status bands — the page's live/parked axis, encoded by POSITION ONLY)"
  - "1312:4 (the governance rule for code allocation — the load-bearing rule of this page)"
  - "3905:2833 / 4793:259 (the two code legends)"
status: "unknown — the 16 components under '반영' are local (remote:false) and populated, and there is no 👿 / deprecation marker / supersede pointer anywhere. BUT: this page carries NO date stamp of any kind (contrast the sibling '은행/증권/기관' page, which stamps both its sections '240328'). Per method, no stamp ⇒ recency unknown. Two components are explicitly parked under '미반영'. NOT inferred from the page name."
---

# NDS_CI — "간편인증기관" page

Small and dense: **120 nodes, 18 COMPONENTs, 19 TEXT nodes**, and — unusually for this file — **real rules stated in prose**. This page is worth reading line-by-line in a way the 3,810-node `은행/증권/기관` page is not.

It is **two half-pages side by side**, each with its own heading, its own grammar caption, and its own code system. **They share nothing.**

## ⛔ REFUTATION — "NDS_CI has 0 components on every inventory page" is **FALSE**

The batch context asserts NDS_CI is not a component library and that sibling batches found **0 components on every inventory page they touched**, with the contract being a CDN filename (`downloadcdn.nhqv.com/mts/ci/이미지명.png`) → 디폴트 CI on 404.

**Confirmed for `511:2` (0 COMPONENT, 0 COMPONENT_SET, verified by guarded `findAllWithCriteria`). REFUTED here.**

| Page | COMPONENT | COMPONENT_SET | Method |
|---|---|---|---|
| `511:2` 은행/증권/기관 | **0** | **0** | ✅ confirms the contract |
| **`1251:2` (this page)** | **18** | 0 | ⛔ **refutes "every page"** |
| `1255:2` 공공기관 | **6** | 0 | ⛔ **refutes "every page"** |

All 24 are real, local (`remote:false`), page-parented masters with full 40-hex keys — listed below. **This is not a metadata artifact**; I read them off the nodes.

**The generalisation must be narrowed to: `NDS_CI is not a *variant* library — 0 COMPONENT_SETs file-wide (verified across all 3 of my pages). But two of my three pages DO publish standalone COMPONENTs.`**

**⚠️ What this does NOT refute:** the CDN-filename contract itself. **I found no CDN URL anywhere in my batch.** I probed all 40 TEXT nodes across the three pages for `cdn|nhqv|http|.png|download` — the only hits are the three grammar captions (`ss_img_company_숫자.png`, `기관코드.png`, `ss_img_ci_appCode.png`) and two section labels (`CDN 은행증권 코드`, `히스토리 참고용 - CDN 은행증권`). **The string `downloadcdn.nhqv.com` appears nowhere in my pages.** The `.png` captions are consistent with a filename contract, and `CDN 은행증권 코드` names CDN explicitly — but **the URL pattern itself is not stated on any page I read.** It must come from a page outside my batch; **I can neither confirm nor contradict the path.**

**So both can be true at once, and I think they are:** the assets are consumed as CDN PNGs by filename, **and** these two pages also publish Figma components for design-time use. **The component keys are real and importable — but they are almost certainly NOT the production delivery path.** ⛔ **Do not let the presence of keys mislead a build into `importComponentByKeyAsync` when the runtime contract is a filename.** That is the trap this refutation exists to prevent.

## ⚠️ Third-party-logo usage rule: **NONE EXISTS**

**Stated as a finding; not inferred.** I read `characters` on all 19 TEXT nodes (not layer names). The page carries **네이버, 카카오, 토스, 삼성, KB, 신한, NH, PAYCO, 뱅크샐러드, 하나은행, PASS(통신3사), 정부24** — some of Korea's most aggressively protected trademarks, plus **the Korean government's 정부상징 (Taegeuk) mark**.

**Not one TEXT node states a usage, permission, attribution, licensing, clear-space, or sizing rule.** There is **no IP notice on this page**. The only governing text in the file is NDS_Library's Welcome-page notice, which asserts **NH투자증권's** rights and is silent on the third parties' own marks.

**⛔ The 정부상징 case deserves separate flagging.** `ss_img_ci_100` (정부24앱) and the three 태극 marks on the sibling `공공기관` page reproduce the ROK government symbol, whose use is governed by statute (정부기 및 정부상징 규정) independently of any private agreement. **The page offers no evidence anyone checked.** Absence of a rule is not a grant of one.

## ⛔ The heading is WRONG — and it collides with a real sibling page

**The page is named `간편인증기관`. Its on-canvas heading (`3905:2821`) reads, verbatim:**

> `📌 공공기관`

**`공공기관` is the name of a different, real page in this same file — `1255:2`** — whose heading (`3902:607`) is *also* verbatim `📌 공공기관`. **Two pages, two identical headings, different contents.**

I rendered the page to confirm this is not a metadata artifact. It is not: the canvas visibly reads **공공기관** in large gold type over the 간편인증 logos.

The second heading (`4793:300`) is correct and distinct:

> `📌 모바일 신분증인증 기관`

**Verdict: `📌 공공기관` on this page is a stale copy-paste from `1255:2`.** Evidence: this page's left half is entirely 간편인증 providers (네이버/카카오/토스/PASS…) with `ZY/ZV/ZW`-prefixed codes, while `1255:2` is entirely government bodies with `PB`-prefixed codes. **The contents do not match the heading; they match the page name.** Trust the page name. **LEDGER-worthy — an agent keying off on-canvas headings will merge two unrelated pages.**

## Name-reliability verdict: **RELIABLE — component names ARE the codes** (with one shipped defect)

Same inversion as the sibling page: there are no captions-describing-components here. **The COMPONENT's name IS the institution code**, and it is the primary key.

- **COMPONENT names — RELIABLE.** All 18 are institution codes. Trust them. **One exception, below.**
- **TEXT layer names — reliable as content**, and here they are genuine documentation (legends + a governance rule), not phantom components. **Read `characters`, not names** — the names are Figma's flattened auto-derivation and **lose all line breaks**.
- **No container-frame junk on this page** — all 18 components are parented directly to the PAGE (`parentType: "PAGE"`).

**⚠️ The shipped defect — a trailing space in a component name:**

> **`ZYAAEO0000 `** (`1271:71`) — **name ends with a space.** `JSON.stringify` → `"ZYAAEO0000 "`.

And the legend agrees with the bug — `3905:2833` line 6 is verbatim `KB스타뱅킹 - ZYAAEO0000 `, **also trailing-space**. So the typo is consistent across both places, which makes it *harder* to notice and *easier* to propagate. **Any exact-name lookup (`name === 'ZYAAEO0000'`) silently misses this component.** This is the same defect class as the sibling file's `\bms_btn_calendar` U+0008 corruption — **confirmed present here as a plain trailing space.** I found **no U+0008** on this page.

## ⭐ THE load-bearing rule: `미반영` is encoded by POSITION ONLY

**This is the highest-value structural fact on the page, and no name, no opacity, and no marker carries it.**

Two bare TEXT bands split the left half:

| Band | node | y | Components below it | Meaning |
|---|---|---|---|---|
| **`반영`** | `1314:2` | −13 | the 9 `ZY…` at y=**105** | applied / shipped |
| **`미반영`** | `1314:3` | 433 | the 2 at y=**551** | **NOT applied / parked** |

**The two parked components:**

| Code | Institution | Key |
|---|---|---|
| `ZVAAES0000` | 하나은행 (`4712:282`) | `68024319b8b34607ddfe6eb0bd7a5b837322939c` |
| `ZWAACP0000` | NH인증서 (`4712:283`) | `eee9e58691db7a88fc49d2b5ac7850275ee1612f` |

**⛔ A build that imports all 18 keys ships two auth providers the app does not support.** `ZVAAES0000` and `ZWAACP0000` are `remote:false`, `visible:true`, `opacity:1`, fully populated, and **structurally indistinguishable from the live nine**. The ONLY thing marking them dead is that their `y` is 551 instead of 105, and that a text node 118px above reads `미반영`.

> **⭐ File-convention note, and it is a warning:** the sibling `- Illusts` page parks assets with **`opacity: 0.10/0.30/0.5` ghosting** (65 of 153). The sibling `은행/증권/기관` page parks them as **`visible:false` GROUP siblings**. **This page uses NEITHER — it uses spatial bands.** Three pages, three different parking conventions, none of them named. **There is no single "is this asset live?" check that works file-wide.** Verified here: **0 nodes with `opacity < 1`, 0 `visible:false` nodes, 0 STRIKETHROUGH segments.**

**The prefix corroborates the bands** — and this is the only reason to half-trust the codes over the layout:

| Prefix | Count | Band |
|---|---|---|
| `ZY` | 9 | **반영** |
| `ZV` | 1 | 미반영 |
| `ZW` | 1 | 미반영 |

**But the page never states that `ZY` = 반영.** It is a 9/9 + 2/2 correlation across 11 samples — suggestive, **not a documented rule**. Do not build on it; build on the bands, and read them by render.

## ⭐ THE governance rule, verbatim (`1312:4`)

The only prose rule on the page. Verbatim, line breaks preserved:

> `추가 되는 사업자도 마이데이터 사설인증기관 기관코드명으로 관리`
>
> `PASS 인증은 통신사마다 기관코드가 있어서 ZYAAATPASS`
> `삼성PASS는 마이데이터 사설인증기관 미참여 기관이라 ZYAAASPASS`

Three separate things, and all three matter:

1. **`추가 되는 사업자도 마이데이터 사설인증기관 기관코드명으로 관리`** — **the allocation policy.** New auth providers are keyed by their **마이데이터 사설인증기관 기관코드** (the official MyData private-certification-body code), *not* by an NDS-local identifier. **The registry is external.** NDS does not mint these codes; it mirrors them. **This is the single most important sentence on the page for a build** — it tells you where the source of truth actually lives, and that this Figma page is a *cache* of it.
2. **`PASS 인증은 통신사마다 기관코드가 있어서 ZYAAATPASS`** — PASS has a code **per telecom carrier**, so a **single collapsed code** `ZYAAATPASS` stands in for all of them. **`ZYAAATPASS` is an aggregate, not an institution.** A build must not expect 1 code = 1 company here.
3. **`삼성PASS는 마이데이터 사설인증기관 미참여 기관이라 ZYAAASPASS`** — 삼성PASS **does not participate** in the MyData private-cert scheme, so it has **no official code**, and `ZYAAASPASS` is an **NDS-minted exception**.

**⭐ Read together, (1)+(3) define the grammar's two tiers, and this is the reusable knowledge:**

> **`ZYAA` + `<2-letter official code>` + `0000`** — a real 마이데이터 기관코드 (7 of 9).
> **`ZYAA` + `<mnemonic>`** — an NDS-minted exception where no official code exists (`ZYAAATPASS`, `ZYAAASPASS`).

**The `0000` suffix is the tell.** `…PASS`-suffixed codes are *locally invented*; `…0000`-suffixed codes are *externally sourced*. **Both exceptions on this page are exactly the two cases the rule text calls out** — the rule and the data agree, which is rare in this file and worth trusting.

## ⭐ REFUTATION — `zyaaqh0000` on both 마이데이터 and 간편인증기관 is **BY DESIGN, not copy-paste debris**

It was put to me that the `마이데이터` and `간편인증기관` sections are byte-identical including the exemplar frame name `zyaaqh0000`, and that this is *likely copy-paste debris, since a real 간편인증기관 code exactly equalling a 마이데이터 code is implausible.*

**I refute the reasoning. The premise "implausible" is exactly backwards, and this page states why in prose.**

The governance rule (`1312:4`), verbatim:

> `추가 되는 사업자도 마이데이터 사설인증기관 기관코드명으로 관리`

**"Newly added providers are likewise managed under their 마이데이터 사설인증기관 기관코드 name."** A 간편인증기관 code **equalling** a 마이데이터 code is not a coincidence to be explained away — **it is the stated allocation policy.** 간편인증기관 are keyed *by* their MyData private-certification-body code. **Identical codes across the two sections are the rule working, not debris.**

The confusion is resolvable, and the resolution is that **마이데이터 has TWO distinct code families**, which my batch happens to span both of:

| Family | Governs | Prefix | Where I see it |
|---|---|---|---|
| **마이데이터 기관코드** | financial institutions | `a1`/`a2`/`a3`/`a4`/`c1` (**lowercase**) | `511:2`, label `SVN 마이데이터 기관코드` |
| **마이데이터 사설인증기관 기관코드** | private cert bodies | `ZY`/`ZV`/`ZW` (**UPPERCASE**) | **this page** |

`ZYAAQH0000` (네이버) belongs to the **second** family. A 마이데이터 page showing the same code is showing **the same registry**, correctly.

**⚠️ What I cannot rule out:** whether the two sections are *byte-identical in layout* (genuinely duplicated blocks) is a separate question from whether the *code* is shared — and I cannot see the 마이데이터 page. **A shared code is not evidence of duplication.** If the sections are truly identical node-for-node, that may still be debris; **but `zyaaqh0000` must not be cited as the evidence for it.** Re-test on layout, not on the code.

**⛔ And the casing in that report does not match my page — see below.**

## ⚠️ CASING — confirmed, and it is NOT as reported. Nothing specifies it.

The exemplar was given to me as **`zyaaqh0000` (lowercase)** for 마이데이터 + 간편인증, vs `PBAAVN0000` (uppercase) for 공공기관.

**On this page it is UPPERCASE.** Verified with `JSON.stringify` on all 18 component names — not eyeballed:

> `"ZYAAQH0000"` — `name.trim() === name.trim().toUpperCase()` → **true** for all 11 `기관코드` components.

**The full picture across my batch, all verified by `JSON.stringify`:**

| Page | Family | Case | Verified |
|---|---|---|---|
| `511:2` | `a1aaad0000`, `c1aacq0000` | **lowercase** | ✅ |
| **`1251:2` (this page)** | **`ZYAAQH0000`, `ZVAAES0000`** | **UPPERCASE** | ✅ |
| `1251:2` | `ss_img_ci_100` | lowercase (different family) | ✅ |
| `1255:2` | `PBAAVN0000` | **UPPERCASE** | ✅ |

**So: `511:2` lowercase; both auth/agency pages UPPERCASE.** The lowercase/uppercase split is **not** 간편인증-vs-공공기관 as reported — **it is `511:2`-vs-everything-else**, i.e. it tracks the *financial-institution* family vs the *cert-body/agency* families.

**Is it specified? NO.** Neither caption (`기관코드.png` here, `기관코드.png` on `1255:2`, `ss_img_company_숫자.png` on `511:2`) says one word about case. **No page in my batch states a casing rule.**

**⛔ And your failure analysis is right, which is what makes this dangerous:** the contract is a CDN filename → **404 falls through to the 디폴트 CI**. A case-wrong filename produces a *plausible-looking default logo*, not an error. **Nobody sees the bug.** On `511:2` that default even has a name: **`ss_img_company_null`** — the grey `⋯` circle. A case bug and a genuinely-unknown institution are **visually identical in production**.

**If the report's `zyaaqh0000` is a faithful transcription of the 마이데이터 page, then the same code is cased differently on two pages of one library — and exactly one of them resolves.** That is a live LEDGER item and worth more than the debris question.

## The naming grammar — TWO systems, verbatim captions

### Left half — `기관코드.png` (`3905:2820`)

The caption is the whole stated grammar. It says **only the filename**, not the code shape:

> `기관코드.png`

Actual shape, from 11 components:

> `Z<V|W|Y>AA<xx>0000` — 10 chars — **or** `ZYAA<mnemonic>` for the two exceptions

⚠️ **Same caption string (`기관코드.png`) appears on `1255:2` governing `PBAAVx0000` codes.** So `기관코드.png` is a **generic label for "these are institution codes"**, not a per-page grammar. It has **no discriminating power** — it does not tell you the prefix, the length, or the system. **Do not treat it as a spec.**

### Right half — `ss_img_ci_appCode.png` (`4793:260`)

> `ss_img_ci_appCode.png`

Actual shape, from 7 components:

> `ss_img_ci_<appCode>` — appCode is a **3-digit, non-zero-padded** integer (`100`, `101`, `201`…`205`)

**Note the family collision:** the sibling page uses `ss_img_company_<숫자>`; this uses `ss_img_ci_<appCode>`. **Same `ss_img_` namespace, different second token, different code universe.** `ss_img_ci_101` (삼성월렛) and `ss_img_company_101` are unrelated. **A build must key on the full prefix, never on the trailing number.**

## CORE — componentKeys found

**18 standalone COMPONENTs. Zero COMPONENT_SETs → no variant axes, no SET keys, nothing for `importComponentSetByKeyAsync`.** All are **KIND = COMPONENT** (use `importComponentByKeyAsync`), all `remote: false`, all parented to the PAGE, all `opacity: 1`, all `visible: true`, **all with an empty `description`**.

Per method — **`remote: false` in a home library = MASTER; judge by structure, not the flag.** Structure agrees: these are page-level, populated, non-instance masters in the CI library's own home file. **Tier (a): published-library source components.** Consuming files see `remote: true`.

### 반영 (live) — `기관코드` system, y=105

| Code (name) | Full COMPONENT key (40-hex) | Institution (from legend) |
|---|---|---|
| `ZYAAQH0000` | `34a07e607231d35e29d45eda3f6863084377f365` | 네이버 |
| `ZYAAASPASS` | `d55dde969b42904f79bf5b361473a9003815f4df` | 삼성패스 — **NDS-minted exception** |
| `ZYAAER0000` | `f5f7c16f0752f2ef5f100ccc68906762a97db80c` | 신한인증서 |
| `ZYAAPC0000` | `09528e1bcb7f828099fb3435f6f62778efff01f6` | 카카오톡 |
| `ZYAAIE0000` | `cebbdbe1558097562396adba84f1ab7a09476469` | 페이코 |
| **`ZYAAEO0000 `** ⚠️ trailing space | `3527191139eae0274691731f2f28a9c374378ae4` | KB스타뱅킹 |
| `ZYAAATPASS` | `1878c076148fc3b574a65a4ec29fbb7e14fc8ff1` | PASS인증 — **aggregate of all 통신사** |
| `ZYAADV0000` | `2c70601c1a8f5303ab655cd3bafd098eea2efa6a` | 토스 |
| `ZYAABN0000` | `6024a4a37212b4ec5e062fbc578278f69d85de69` | 뱅크샐러드 |

### 미반영 (PARKED — ⛔ do not ship), y=551

| Code (name) | Full COMPONENT key (40-hex) | Institution |
|---|---|---|
| `ZVAAES0000` | `68024319b8b34607ddfe6eb0bd7a5b837322939c` | 하나은행 |
| `ZWAACP0000` | `eee9e58691db7a88fc49d2b5ac7850275ee1612f` | NH인증서 |

### 모바일 신분증인증 기관 — `ss_img_ci_appCode` system, y=105

| Code (name) | Full COMPONENT key (40-hex) | On-canvas label (y=341) |
|---|---|---|
| `ss_img_ci_100` | `d4aefae71456530346efd62845f698201c2ecbae` | 정부24앱 ⚠️ **see conflict #1** |
| `ss_img_ci_101` | `44a99f28ea6b34696cf9fc3bcc1d5991a528ae93` | 삼성월렛 |
| `ss_img_ci_201` | `f4cd6d510efe20273dd17f42b6f9f7c87fb69ad4` | 카카오뱅크 |
| `ss_img_ci_202` | `50840e2361dae76e79d8aafc28149758f5828453` | 네이버 |
| `ss_img_ci_203` | `f93468d9c8c736d7dce2c426eeec16cd8b5f446b` | 토스 |
| `ss_img_ci_204` | `da0f01e688a095fbeab2892ae3b320102b33939c` | NH올원뱅크 |
| `ss_img_ci_205` | `7d4c5bd121c7767211418101397a9294afe4f848` | KB국민은행 ⚠️ **see conflict #2** |

**Verification: `unverified` for all 18 — expected.** Read-only session; `importComponentByKeyAsync` would throw. Keys are read directly off the COMPONENT nodes (authoritative for identity, not a round-trip import test). `variantGroupProperties` was **not applicable** — no COMPONENT_SETs exist, so the duplicate-variant-name ⇔ set-has-errors check has nothing to run against. `getMainComponentAsync()` **not applicable** — the page has **0 INSTANCEs**.

## Exact counts vs the legends — **the legends disagree with reality**

All figures below are `.length`. **The page states no `N개`-style count heading**, so the disagreement is *legend-vs-component*, not *heading-vs-reality* — but it is the same failure mode the method warns about, and it is **worse here because the legend is the thing a build would read.**

| Measure | Count |
|---|---|
| Total nodes | **120** |
| Top-level children | **37** |
| TEXT | **19** (one is empty — see Gaps) |
| **COMPONENT** | **18** |
| **COMPONENT_SET** | **0** |
| INSTANCE | **0** |
| `기관코드` components | **11** (9 반영 + 2 미반영) |
| `ss_img_ci_*` components | **7** |
| `opacity < 1` | **0** |
| `visible:false` | **0** |
| STRIKETHROUGH | **0** |

### ⛔ Legend `4793:259` vs the actual components — a 2-way mismatch

Legend, verbatim (`characters`; **note the out-of-order 205-before-204**):

> `appCode`
> `101 - 삼성월렛`
> `200 - 정부앱`
> `201 - 카카오뱅크 `
> `202 - 네이버`
> `203 - 토스`
> `205 - KB스타뱅킹`
> `204 - NH올원뱅크`

| appCode | In legend? | Component exists? | Verdict |
|---|---|---|---|
| **100** | ❌ **no** | ✅ `ss_img_ci_100` | **asset with no legend entry** |
| **200** | ✅ `200 - 정부앱` | ❌ **none** | **legend entry with no asset** |
| 101, 201–205 | ✅ | ✅ | consistent |

**The legend says the government app is `200`. The component is `ss_img_ci_100`. There is no `ss_img_ci_200` and no `ss_img_ci_100` legend line.** I rendered the page: the second logo in the row is labelled **`정부24앱`** on canvas, and it is `ss_img_ci_100` (x=1717, label at x=1767).

**So three sources give three answers for the government app: legend says `200 - 정부앱`, component says `ss_img_ci_100`, on-canvas label says `정부24앱`.** ⛔ **A build reading the legend requests appCode 200 and gets nothing.** Unresolved at source — I cannot tell whether `100` or `200` is the truth the backend uses.

Legend also carries a **trailing space** on `201 - 카카오뱅크 ` [sic].

### Legend `3905:2833` — consistent, but note the rendering trap

Verbatim (`characters`; **`\r\n` on lines 1–6, `\n` on 7–9 — mixed line endings [sic]**):

> `네이버 - ZYAAQH0000 `
> `삼성패스 - ZYAAASPASS `
> `신한인증서 - ZYAAER0000 `
> `카카오톡 - ZYAAPC0000 `
> `페이코 - ZYAAIE0000 `
> `KB스타뱅킹 - ZYAAEO0000 `
> `PASS인증 - ZYAAATPASS`
> `토스 - ZYAADV0000`
> `뱅크샐러드 - ZYAABN0000`

All 9 match the 9 `반영` components exactly — **including the `ZYAAEO0000 ` trailing space**. Lines 1–6 all carry a trailing space; 7–9 do not. **Cosmetic, but it is what makes the `ZYAAEO0000 ` bug invisible to a reviewer** — the space looks like every other line.

**⚠️ Rendering trap:** the render shows this legend as a numbered list `1.`–`9.`, but **`characters` contains no digits** — `getStyledTextSegments(['listOptions'])` returns `ORDERED`. **The numbering is Figma list formatting, not text.** Anyone transcribing from a screenshot will invent nine numbers that do not exist in the data. Same for `4793:259` (bulleted).

**Neither legend mentions the 2 `미반영` components.** The legend documents 반영 only — **so a build that trusts the legend as the inventory gets the right 9 by accident, not by design.**

## Conflicts / LEDGER candidates

1. **⛔ appCode `100` vs `200` for the government app** — legend `200 - 정부앱`, component `ss_img_ci_100`, canvas label `정부24앱`. No `ss_img_ci_200` exists. **Unresolved; blocks any legend-driven build.** (Detail above.)
2. **`ss_img_ci_205`: legend says `KB스타뱅킹`, canvas label says `KB국민은행`.** Two different names for one component; the app and the bank are not the same entity. Minor but a real name-lookup hazard.
3. **⛔ `📌 공공기관` heading on a page named `간편인증기관`, colliding verbatim with page `1255:2`'s heading.** Stale copy-paste. (Detail above.)
4. **`ZYAAEO0000 ` has a trailing space in its component name**, propagated into the legend. Exact-name lookup fails silently. Same defect class as the sibling file's `\bms_btn_calendar`.
5. **`미반영` is encoded by y-position alone** — no opacity, no name marker, no `👿`, no hidden flag. **Third distinct parking convention in this file** (vs opacity-ghosting on `- Illusts`, vs hidden-sibling on `은행/증권/기관`). **No file-wide liveness check exists.**
6. **`기관코드.png` is a non-discriminating caption** — the identical string governs `ZY/ZV/ZW…0000` here and `PBAAVx0000` on `1255:2`. Useless as a grammar spec.
7. **`ss_img_ci_` vs `ss_img_company_` share the `ss_img_` namespace with incompatible code universes.** `ss_img_ci_101` ≠ `ss_img_company_101`. Key on the full prefix.
8. **Cross-page duplication of institutions across code systems** (NOT a conflict, recorded so nobody "dedupes" it): 네이버 = `ZYAAQH0000` (간편인증) **and** `ss_img_ci_202` (모바일 신분증); 토스 = `ZYAADV0000` **and** `ss_img_ci_203`; 카카오톡 = `ZYAAPC0000` vs 카카오뱅크 = `ss_img_ci_201` (**different entities — do not merge**); KB스타뱅킹 = `ZYAAEO0000 ` **and** `ss_img_ci_205`. **Same brand, different code, different asset, different purpose.** The overlap is by design; the naming does nothing to signal it.
9. **`ZYAAATPASS` is an aggregate, not an institution** (per rule text: PASS has a code per 통신사). **1 code ≠ 1 company.** Any code→company mapping is not injective here.
10. **`ss_img_ci_` numbering has holes by design** — `100, 101, 201, 202, 203, 204, 205`; no `102–200`. The `1xx`/`2xx` split is a **class boundary** (1xx = 지갑/정부 앱, 2xx = 금융사 앱), unstated but consistent across all 7. **Do not iterate `100..205`** — same trap as the sibling file's `01..N` 404s.

## Gaps / unverifiable

- **⛔ NO date stamp of any kind.** I swept all 19 `characters` for `Last update` / `update` / `ver.` / `버전` / 6-digit date patterns — **zero hits**. This is a direct contrast with the sibling `은행/증권/기관` page, which stamps **both** its sections `240328`. **Per method: no stamp ⇒ recency unknown.** The `status: unknown` above rests on this, not on structure. `미반영` tells us *something* here was pending as of some unknown date — **and a two-year-old "pending" is exactly the kind of thing that silently became "shipped" without anyone moving the component.** ⚠️ **Follow-up: the 반영/미반영 split MUST be re-confirmed against the live app before use.**
- **Empty TEXT node `1313:19`, layer name `Text`, `characters: ""`, at y=−729** — above everything else, where a title or a date stamp would sit. **Blank at source. I did not invent content for it.** Its position is suspicious (it is the only node in that band) but **it says nothing and I will not guess** whether it once held the missing date stamp.
- **No sizing / clear-space / export-multiplier rule.** All 18 components are **180×180** (uniform, verified) — but **the page never states this**, and the `.png` in both captions implies raster export at an **unstated multiplier**. Note the sibling page's frames are **200×200** — **180 vs 200 across two pages of the same library, neither documented.** ⚠️ Worth a LEDGER entry if a build needs one canonical CI box size.
- **No `scale guide` on this page** (the sibling page has one, hidden). Nothing here answers "how big should the logo be inside the 180×180 box".
- **Provenance: clean.** No pasted-image/screenshot nodes; no foreign documents posing as rules (contrast the sibling pages' Highcharts docs and 원티드 talk). All 18 components are native artwork; the 19 TEXT nodes are all native text.
- **I did not resolve which of `100`/`200` the backend actually uses** — that is answerable only outside Figma (API contract / app code). Recorded as an open question, not guessed.
- **The `ZY = 반영` prefix correlation (11/11) is observed, not documented.** I report it as evidence, not as a rule, and I did not build the liveness verdict on it.
