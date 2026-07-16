---
name: nds-ci-advisory
fileKey: KmpaYeoYh41F6nyIKvBQ7h
source_url: "https://www.figma.com/design/KmpaYeoYh41F6nyIKvBQ7h/NDS_CI?node-id=5482-2131"
learned_date: 2026-07-16
sections_studied:
  - "5482:2131 (page '자문사' — canvas root; 113 nodes, 12 top-level, 0 COMPONENT/COMPONENT_SET, 0 INSTANCE, 3 TEXT)"
  - "5482:2244 (TEXT — on-canvas heading '📌 자동투자상품 자문사'; note: the PAGE is named '자문사' but the heading says '자동투자상품 자문사')"
  - "5482:2246 (TEXT — the naming grammar, on-canvas '자문사코드.png')"
  - "5482:2248 (TEXT — scope: '[사용 메뉴] 퇴직연금 로보어드바이저 / 자문투자 > 자문사서비스'; opacity 0.7)"
  - "9 logo FRAMEs: FAA07/11/13/19/21/27/28, OAR01/02 — full subtree read, code→firm mapping recovered"
status: "unknown — no `Last update` stamp, no dates of any kind anywhere on the page. Highest node id in the file (5482:2131) → structurally the NEWEST page, and its 9 firms are all fully drawn vectors with zero deprecation markers. But newest-by-node-id is a creation-order signal, NOT a freshness signal: a page created last can still be the most stale. Recency is unlabeled; 'live' is NOT claimed."
---

# NDS_CI — "자문사" (advisory firms) page

Third-party **investment-advisory firm CI logos** for the robo-advisor / advisory service. **113 nodes, 12 top-level, 9 logo frames. Zero COMPONENTs, zero COMPONENT_SETs, zero INSTANCEs.** Same contract as its siblings: plain `FRAME`s with vector children, shipped as **PNG filenames resolved server-side**, not an importable Figma library.

**Scope, verbatim** (`5482:2248`):

> `[사용 메뉴]`
> `퇴직연금 로보어드바이저`
> `자문투자 > 자문사서비스`

Two consuming surfaces. Note this node renders at **`opacity: 0.7`** — the file's ghosting convention, applied here at its mildest.

## 📅 Dating: the "newest page" hypothesis — tested, and it does NOT hold

`5482:2131` is the **highest node id in NDS_CI**, so this page was **created last**. That much is solid. But the brief's inference — *newest page ⇒ likely newest content* — **does not survive contact with the evidence:**

- **This page carries no date at all.** Not a `Last update` stamp, not an inline `(추가)` annotation, nothing.
- **The sibling 언론사 page — created EARLIER (`3618:27`) — carries dated edits as recent as `26.03.24`.**

→ **An earlier-created page has more recent recorded activity than the "newest" page.** Node id orders *creation*, not *maintenance*. **A page created last and never touched since is stale, not fresh.** I record the node-id fact as real and the freshness inference as **refuted for this page.**

The one soft recency signal: **`FAA28` = 쿼터백자산운용** and **`OAR01` = 인텔리퀀트**, both active robo-advisory names — and the `OAR` prefix's very existence implies a second product generation. Suggestive of a modern vintage; **not dated evidence, and I am not treating it as such.**

## ⚠️ Third-party-logo usage rule: **NONE EXISTS** — and that absence is the finding

I read all three TEXT nodes' real `characters` — **this page has only three, and I read every one.** **There is no usage rule, no licence, no permission record, no attribution requirement, and no trademark notice** for any of these nine advisory firms' marks. The page carries only NDS's own file-level IP notice (`상업적 이용 및 재배포를 엄격히 금지… 사내 업무 용도로만`), which is NDS asserting rights over **its own** library — it says nothing about 디멘젼투자자문, 골든트리투자자문, 쿼터백자산운용, or 뉴지스탁's marks, which belong to those firms.

**Stated as an absence, not inferred.** No "cleared", no "licensed", no rights contact, no expiry.

**The absence is starker here than on either sibling page**, and precisely because the page is so small: **three TEXT nodes total.** On 펌뱅킹 or 언론사 one could argue a rule was lost in a long table. Here there is nowhere for a rule to hide — **I read 100% of the page's text.** The page consists of a heading, a filename convention, a menu path, and nine other companies' logos. **Nothing governs their use.**

Sharpening it: **these are the most reconstructible marks of the three pages.** The 은행/언론사 logos are flat image fills (downloaded PNGs, per the 펌뱅킹 provenance note). **These nine are fully-drawn vector artwork** — `Vector`, `Ellipse 280`, `Polygon 1`, `Union`, `Vector 345 (Stroke)` — meaning **someone at NDS redrew each firm's mark by hand in Figma.** Redrawing a third party's trademark as editable vectors, under no recorded permission, is a materially different act from embedding a supplied PNG. **I am flagging that distinction for a human with legal context; I am not adjudicating it.**

## Naming grammar (verbatim)

On-canvas, node `5482:2246`, with `자문사코드` colour-highlighted in the source:

> `자문사코드.png`

**This is the file's only fully abstract grammar — and it is the most build-hostile.** Compare:

| Page | Grammar | Key |
|---|---|---|
| 펌뱅킹 | `ss_img_bank숫자.png` | ordinal (`01`…`11`) |
| 언론사 | `ss_img_press숫자.png` | ordinal (`01`…`21`) |
| **자문사** | **`자문사코드.png`** | **an external firm code** |

- **No `ss_img_` prefix.** This page **breaks the file's own filename convention** — its two siblings both prefix `ss_img_`. Whether shipped files are `FAA07.png` or `ss_img_FAA07.png` **cannot be determined from this page.** The grammar literally says the filename *is* the code.
- **`자문사코드` is a placeholder in a grammar, not a literal name part** — same class as `(컬러넘버)` / `(크기)` in `nds-lib-icons`. It resolves to `FAA07`, `OAR01`, etc.
- **⛔ Institutions are keyed by an EXTERNAL code that this page does not define.** `FAA` and `OAR` are **never expanded anywhere on the page.** There is no legend, no mapping table, no note. **The code's authority lives outside NDS_CI** — presumably 퇴직연금/로보어드바이저 back-office systems. **This is the deepest gap of my three pages:** the other two are self-contained (their tables fully define the key); **this one is not, and cannot be resolved from Figma.**

## The code→firm mapping — recovered from frame subtrees, 9/9

**⚠️ There is NO mapping table on this page.** Unlike both siblings, no TEXT node maps code→firm. **I recovered this by reading each logo frame's child group name** via `use_figma` — the firm name is carried as a **layer name**, not as content:

| Code | 자문사 (from layer name) |
|---|---|
| `FAA07` | 디멘젼투자자문 |
| `FAA11` | 골든트리투자자문 |
| `FAA13` | 플레인바닐라투자자문 |
| `FAA19` | 한국wm투자자문 |
| `FAA21` | 얼터너티브투자자문 |
| `FAA27` | 지비투자자문 |
| `FAA28` | **쿼터백자산운용** ← not an 투자자문 (see conflict #3) |
| `OAR01` | 인텔리퀀트 |
| `OAR02` | 뉴지스탁 |

**Caveat, per method — layer names lie, and this page is the one where I had to trust them anyway.** These nine names are **layer names**, not `characters`. On my sibling pages, layer names were unreliable exactly where they mattered (`su`, `kale`, `sia`). Here they are the **only** firm identifier that exists, and they corroborate against the rendered logos (screenshot-verified: `plain vanilla` wordmark under `FAA13`, `DIMENSION` under `FAA07`, `KWM` under `FAA19`). **Cross-checked and consistent — but this mapping is reconstructed evidence, not a documented contract, and it is exactly the kind of thing that drifts silently.**

## Exact counts — `.length` vs headings

- **Logo frames: 9** (`.length` on `page.children` filtered to FRAME = 9). Total page nodes: **113**. Top-level: **12** (9 frames + 3 TEXT).
- **No heading on this page states a count** → **no stale-heading conflict to report** (unlike the `Nmoji: 142개`→152 class). **There is also no table to disagree with the canvas** — because there is no table. **The canvas IS the inventory.** Nothing can drift because nothing is written down; **this is not a strength, it is the absence of a contract.**

**⚠️ Numbering holes — massive and unexplained:**

- **`FAA`: 7 present** — `07, 11, 13, 19, 21, 27, 28`. **Missing: 01–06, 08, 09, 10, 12, 14–18, 20, 22–26 = 21 codes absent.** Present codes run to 28 → **only 7 of 28 (25%) are on this page.**
- **`OAR`: 2 present** — `01, 02`. Contiguous from 1, **no holes.**

**The `FAA` holes are the page's defining feature and the file offers zero explanation.** Reading them honestly, the plausible causes are: (a) the codes are **externally assigned** and NH only ever onboarded these 7; (b) 21 firms were dropped/merged and their assets deleted; (c) the assets exist elsewhere. **The page contains no evidence for any of these** — no `👿`, no `제외`, no 구버전 zone, no ghosted parked logos, no note. **Contrast 펌뱅킹, which preserves a superseded 케이뱅크 CI under `히스토리 참고용`.** This page preserves nothing. **Whatever happened to FAA01–06 etc., it left no trace here** — and per method, **blank at source IS the finding.** I am not inventing a retirement story.

That `OAR01`/`OAR02` start cleanly at 01 while `FAA` starts at 07 suggests **`OAR` is a newer, separate scheme** — consistent with two product generations sharing one page. Inference, flagged as such.

## Name-reliability verdict: **RELIABLE — the only clean page of my three**

Per-page convention (and it genuinely differs from its siblings):

1. **Logo frame names — RELIABLE.** `FAA07`…`OAR02` are real, hand-maintained external codes matching the stated grammar. **Trust these.**
2. **Inner group names — RELIABLE AND LOAD-BEARING.** `디멘젼투자자문`, `골든트리투자자문`… are accurate firm names, screenshot-corroborated. **This is the page's only code→firm bridge.** Unusually, the layer names here are the *most* valuable data on the page — the inverse of 언론사, where they were worthless.
3. **`symbol` — a consistent, meaningful structural convention.** Every one of the 9 frames nests `firmName > Ellipse 4 > symbol > Oval Copy 21 > firmName > [vectors]`. **9/9 identical.** Rare structural discipline in this file, and it means a walker *can* reliably locate the artwork here (unlike 펌뱅킹, where `bank06` breaks the pattern).
4. **`Ellipse 4` / `Oval Copy 21` / `Vector` / `Polygon 1` / `Group 1261157957` — auto-generated junk.** Never key off them. (`Oval Copy 21` appearing in all 9 betrays a copy-paste-from-Sketch lineage.)

**No node on this page lies.** Zero INSTANCEs → **zero instance-override traps.** This is the only one of my three pages where `get_metadata` alone would not have lost a rule — **because there are no rules to lose.**

### Invisibility mechanisms found on this page: **1 of 5 confirmed, 4 RULED OUT — and unlike my siblings, these are real negatives**

**This page was fully readable via `use_figma`** (0 INSTANCEs → no read-only block), so **I ran the actual checks** rather than reporting them unverifiable:

| # | Mechanism | Status here |
|---|---|---|
| 1 | Fill matching background | ❌ **RULED OUT — verified by render.** All 9 marks sit on **white/coloured circular plates** (`Ellipse 4`), which insulate them from the dark canvas. **This is precisely the defect that plagues 언론사** (black wordmarks vanishing into a black canvas) — **this page's circular-plate convention structurally prevents it.** Worth promoting as the file's one good pattern. |
| 2 | `STRIKETHROUGH` | ❌ **RULED OUT — actually checked.** `getStyledTextSegments(['textDecoration'])` ran on all 3 TEXT nodes: **`NONE` on every segment.** No retired rule is hiding here. |
| 3 | `opacity` ghosting | ✅ **CONFIRMED — 1 node, and it is benign.** Full-page sweep for `opacity < 1` returned **exactly one hit**: `5482:2248` (the `[사용 메뉴]` note) at **`opacity: 0.699999988079071`**. **Critically: all 9 logos are `opacity: 1`. Zero ghosted logos.** I ran this check specifically because the brief flagged a logo inventory as a prime ghosting candidate (a merged/defunct firm being exactly what gets ghosted) — **checked, and it is clean. The 21 missing FAA codes were not parked at low opacity; they are simply absent.** This is a **real negative**, not an unverified assumption. |
| 4 | INSTANCE OVERRIDE | ❌ **RULED OUT — 0 INSTANCEs on the page.** Structurally impossible. |
| 5 | `hidden="true"` | ❌ **RULED OUT — actually checked.** Full-subtree `visible === false` sweep across all 113 nodes: **zero hits.** Nothing hidden anywhere. |

**`👿` / `제외` / `해당없음` / `구버전` / `이전` / `미사용` / `deprecated` / `백업` / `폐기` / `중단` sweep: ZERO hits** across all 113 node names and all 3 TEXT bodies. **No `👿`. No deprecation marker of any kind.**

**The 0.7 opacity is NOT a deprecation signal** — reading the sentence as the method demands, it is a live `[사용 메뉴]` scope note, de-emphasised for visual hierarchy. **It tells you where the assets are used; it does not park them.** The file-wide ghosting convention (0.10/0.30/0.5 for superseded assets) is **not in play on this page** — 0.7 is a different value serving a different purpose. Do not read it as retirement.

## Provenance of pasted images

**Clean — and verifiably so.** There are **no pasted rasters at all.** All 9 marks are **native Figma vectors** (`Vector`, `Ellipse`, `Polygon`, `Union`, `Vector 345 (Stroke)`). **No Highcharts docs, no 원티드 conference-talk material, no screenshots posing as rules** — the sibling-page hazard cannot occur here, because nothing on this page is a raster. The `Oval Copy 21` naming does indicate a **Sketch-era import lineage**, but the content is consistent with the page's stated purpose throughout.

## CORE — componentKeys found

**NONE. Zero COMPONENTs and zero COMPONENT_SETs** — **verified directly**, not just from metadata: `page.findAllWithCriteria({types:['COMPONENT','COMPONENT_SET']})` returned **`[]`**, and `INSTANCE` likewise **`[]`**.

**Tier: not applicable.** Nothing to import by key. **The 9 advisory logos are FRAMEs of raw vectors** — unreachable via `importComponentByKeyAsync`. The build contract is the filename (`FAA07.png`) against the app's asset server, keyed by an **externally-owned code this page never defines.**

**No key is recorded for this page — not truncated, not guessed. There are none to record.**

## Conflicts / LEDGER candidates

1. **⛔ `FAA` numbering is 75% holes with zero explanation.** 7 of 28 present (`07, 11, 13, 19, 21, 27, 28`); **21 codes absent**, no `👿`, no 제외 note, no history zone, no ghosted parking. **Cause unknown and unknowable from this page.** A build cannot tell whether `FAA12` is unassigned, retired, or merely missing its asset — **and this page will not tell it.** The single biggest unknown across my three pages.
2. **⛔ `FAA` / `OAR` are never expanded.** No legend anywhere. **Two prefixes, zero definitions.** The key's authority is external (back-office systems), so **NDS_CI is not the source of truth for its own filenames on this page.** Same defect class as 언론사's `press20`-claimed-by-Benzinga: **the `ss_img_*` namespace has writers outside this file.** File-wide pattern worth a CORE note.
3. **⚠️ `FAA28` = 쿼터백자산운용 is a category violation.** Every other `FAA` is an **투자자문** (advisory); 쿼터백**자산운용** is an **asset manager** — a different regulated entity type. It nonetheless carries an `FAA` code. **Either the code scheme is broader than "자문사", or this is a misfile.** Compounding it, the page heading says **`자동투자상품 자문사`** while the **page name is just `자문사`** — the heading's broader "자동투자상품" (automated investment products) framing actually **accommodates** 자산운용, suggesting the page name is the narrow/wrong one. **Same defect class as 펌뱅킹's `bank` prefix (covering 우체국/새마을금고) and 언론사's `press` prefix (covering IR/data vendors).** → **File-wide finding: NDS_CI prefixes name the consuming surface, not the institution type. Never infer entity type from an NDS_CI prefix.**
4. **⚠️ This page breaks the file's filename convention.** Siblings use `ss_img_bank숫자.png` / `ss_img_press숫자.png`; **this page says `자문사코드.png` — no `ss_img_` prefix.** Whether shipped assets are `FAA07.png` or `ss_img_FAA07.png` **is undetermined.** A build guessing wrong gets a 404 on every advisory logo. **Unresolved and consequential.**
5. **⚠️ No mapping table exists.** Both siblings ship a code→institution TEXT table; **this page ships none.** The mapping survives **only as layer names**, which are documented-as-unreliable file-wide and are trivially broken by a careless rename. **The page's most important data is stored in its least durable field.**
6. **`한국wm투자자문` — inconsistent casing.** Lowercase `wm` where the rendered mark reads **`KWM`** (uppercase). Cosmetic; defeats exact-name matching.
7. **No dates anywhere** — despite being the file's newest-created page. See the dating section: **created-newest ≠ freshest**, and the sibling 언론사 page (created earlier) demonstrably carries more recent edits. Cross-page `Last update` convention is inconsistent, as the method predicts.

## Gaps / unverifiable

- **✅ This page was FULLY readable** via `use_figma` — the only one of my three. Its **0 INSTANCEs** meant no read-only block (both siblings, having 1 and 2 instances respectively, hard-failed with `Operation attempted to modify the file while in read-only mode` on any page load — hypothesis: **remote-instance hydration counts as a file mutation**; correlation 3-for-3, unproven). **Consequently the opacity / `textDecoration` / `hidden` / component-key results above are real checks with real negatives, not assumptions.** This page's invisibility clearance is genuine; its siblings' is not.
- **What I could NOT resolve, and it is not a tooling limit:**
  - **`FAA` / `OAR` expansions — absent at source.** Not hidden, not ghosted, not struck through. **They are simply not written down.** No amount of Figma access recovers them; this needs the 퇴직연금/로보어드바이저 back-office owner.
  - **The 21 missing `FAA` codes — absent at source.** I verified they are not hidden (0 hidden nodes) and not ghosted (0 logos below opacity 1). **They were never on this page or were hard-deleted without trace.** Per method: **blank at source IS the finding.** I did not invent a retirement narrative.
  - **The shipped filename prefix (`FAA07.png` vs `ss_img_FAA07.png`) — undetermined.** Needs the app's asset manifest, not Figma.
- **The code→firm mapping is reconstructed, not documented.** It rests on layer names (cross-checked against renders and consistent 9/9), but **it is not a contract** and carries no guarantee against silent drift.
- **U+0008 (`\b`) control characters:** I read all 113 node names via `use_figma` and saw no `\b` in the returned strings. Given this file's siblings **do** carry U+0008 in real names, and JSON round-tripping can normalise, **I record this as "none observed", not "none present".**
- **Re-check trigger:** if any advisory firm merges or exits, watch whether its asset is **deleted without trace** (this page's apparent convention) or **preserved under a history zone** (펌뱅킹's convention). **The file has two contradictory retirement conventions and this page follows the lossy one.**
