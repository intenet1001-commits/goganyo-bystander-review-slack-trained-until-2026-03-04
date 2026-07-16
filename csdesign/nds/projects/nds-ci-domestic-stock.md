---
name: nds-ci-domestic-stock
fileKey: KmpaYeoYh41F6nyIKvBQ7h
source_url: "https://www.figma.com/design/KmpaYeoYh41F6nyIKvBQ7h/NDS_CI?node-id=109-25310"
learned_date: 2026-07-16
sections_studied:
  - "109:25310 (page '국내주식' — canvas root; 249 children, 22,500 nodes, 2,948 ss_img_ci_* nodes, ZERO components)"
  - "3720:909 / 3720:935 / 3720:903 / 3720:904 / 3720:911 (the naming-rule + CDN block — on-canvas heading '📌 국내주식', '이미지 네이밍 룰', 'CDN 주소'; THE load-bearing rule of this page)"
  - "502:2 (frame '기존 ' — 27,152×4,446 legacy bulk grid holding the 코스피/코스닥 inventory)"
  - "6178:1715 / 6178:1737 / 6178:1738 (the 구 버전 → 신규 버전 CI-replacement comparison pattern)"
  - "5592:496 (frame 'ss_img_ci_218410' — the 구버전로고 hidden-layer + '업데이트로 삭제' retirement pattern)"
status: "live — 2,948 ss_img_ci_* asset nodes present and populated; the most recent dated stamp is 'SFA넥셀 종목 CI 교체 (26.06.29)', 17 days before learned_date. NOT inferred from the page name. No `Last update` stamp in this file's own convention — recency rests on the rolling 신규상장/교체 date labels. See 'Gaps'."
---

# NDS_CI — "국내주식" page

**This is not a component library. It is a PNG export farm.** 2,948 `ss_img_ci_*` nodes, **zero COMPONENTs, zero COMPONENT_SETs** (`findAllWithCriteria({types:['COMPONENT','COMPONENT_SET']})` → `[]`, both). Every domestic stock CI is a plain 200×200 `FRAME` with a PNG export setting, published to a CDN — not imported into Figma consumers via `importComponentByKeyAsync`. Read this page as (1) a naming grammar, (2) a CDN contract, (3) a rolling dated inventory.

## Name-reliability verdict: RELIABLE AS THE PRIMARY KEY — with 7 malformed exceptions that will break any exact-name lookup

This page's convention is **the layer name IS the filename**, minus `.png`. That makes names load-bearing here in a way they are not on `NDS_Library` pages — a `ss_img_ci_005930` frame exports to `ss_img_ci_005930.png`. **Trust the names, but sanitize them.**

Three sub-conventions coexist:

1. **Asset frames — RELIABLE.** `ss_img_ci_<종목코드>`, 200×200, `exportSettings: [{format:'PNG', constraint:{type:'SCALE', value:1}, contentsOnly:true}]`. **2,791 of 2,908 distinct names are clean 6-digit codes.**
2. **Company-name child frames — RELIABLE AS CONTENT, NOT AS IDENTIFIERS.** Inside each asset frame sits a frame named for the company (`에스엔시스`, `이노에이엑스`, `더본코리아`). These are documentation, not keys. **11 of them are the literal placeholder `종목명` — never filled in** (`4212:1099`, `4212:993`, `4212:1035`, `4212:1291`, `4212:1958`, …). Blank at source IS the finding.
3. **Container frames — UNRELIABLE, ignore.** `Frame 1`…`Frame 6` (`109:35105`–`109:35134`), `Group 9689`. Auto-generated.

### ⚠️ U+0008 (`\b`) control characters are present, in company-name frames

Confirmed by reading names off the API byte-for-byte. **11 frames begin with a literal U+0008 backspace:**

`\x08유라클` · `\x08쓰리에이로직스` · `\x08뱅크웨어글로벌` · `\x08와이제이링크` · `\x08웨이비스` · `\x08탑런토탈솔루션` · `\x08케이쓰리아이` · `\x08티엑스알로보틱스` · `\x08대진첨단소재` · and 3× `\x08종목명`

Same corruption class as `\bms_btn_calendar` in `nds-lib-icons`. **Confirmed present in this file too.** Any exact-name match on these silently misses.

## 🔥 THE load-bearing rule: the naming grammar + CDN contract

Five loose page-level TEXT nodes at ~`x=510` form the rule block. Verbatim:

> `📌 국내주식` (`3720:909`)
> `이미지 네이밍 룰` (`3720:935`)
> **`ss_img_ci_종목코드(숫자).png`** (`3720:911`)
> `CDN 주소` (`3720:903`)
> **`downloadcdn.nhqv.com/mts/ci/이미지명.png`** (`3720:904`)

**Promote both lines to Core.** Together they are the entire consumption contract for domestic stock CI:

```
https://downloadcdn.nhqv.com/mts/ci/ss_img_ci_<6자리종목코드>.png
```

`이미지명` in the CDN line is a placeholder that resolves to the 네이밍 룰 line — the two TEXT nodes only mean something **read together**; neither is self-sufficient. On the sibling ETF page this same rule is rendered **colour-coded** (`ss_img_` white / `ci_` cyan / `종목코드(숫자)` yellow / `.png` white), i.e. the token boundaries are **layout- and colour-encoded, invisible to `get_metadata`**. I recovered that by screenshot.

**Export multiplier is 1× at 200×200** — read off `exportSettings`, not documented in any TEXT node. `contentsOnly: true`. There is **no @2x/@3x variant** anywhere on this page.

## The naming grammar — verbatim, with the exceptions that matter

Canonical (`3720:911`):

> `ss_img_ci_종목코드(숫자).png`

`(숫자)` is the placeholder token, not a literal name part. Actual distribution across **2,908 distinct names** (`.length`, not a heading):

| Form | Count | Verdict |
|---|---|---|
| `ss_img_ci_` + 6 digits — e.g. `ss_img_ci_005930` | **2,791** | canonical |
| `ss_img_ci_` + 6 **alphanumeric** — e.g. `ss_img_ci_0004Y0`, `ss_img_ci_33626K` | **55** | ⚠️ **grammar says `(숫자)`; these are NOT digits.** KRX codes for 우선주 / 신주인수권증서 / 전환사채 legitimately contain letters. **The documented grammar is wrong at source** — quoted verbatim above with the contradiction preserved. |
| `ss_img_ci_ 064400` — **leading space** | **54** | ⚠️ malformed |
| `ss_img_ci_455180 ` — **trailing space** | **1** | ⚠️ malformed |
| malformed / other | **7** | see below |

**The 55 alphanumeric codes are a real, load-bearing exception, not typos.** Full list:

`0004Y0` `0007C0` `00088K` `0008Z0` `0009K0` `00104K` `0010V0` `0013V0` `0015G0` `0015N0` `0015S0` `00279K` `0030R0` `0037T0` `0041B0` `0041J0` `0041L0` `0044K0` `00499K` `0054V0` `00680K` `0068Y0` `0071M0` `0072Z0` `00781K` `00806K` `0088D0` `0091W0` `0093G0` `0096B0` `0096D0` `0097F0` `0098T0` `0099W0` `0099X0` `0101C0` `0105P0` `0120G0` `0126Z0` `02826K` `03473K` `03481K` `08537M` `26490K` `28513K` `33626K` `33637K` `33637L` `35320K` `36328K` `37550K` `37550L` `38380K` `45014K` `45226K` — plus ` 33626L` (leading space, so 56 in truth).

### The 55 leading-space names are a CDN trap

54 names match `ss_img_ci_ <6digits>` — e.g. `ss_img_ci_ 064400`, `ss_img_ci_ 475400`. **A space in a filename becomes `%20` in the CDN URL.** Either the export step strips it (and the name lies about the artifact) or the CDN holds `ss_img_ci_%20064400.png`. **I cannot determine which read-only.** Recorded as unverified. **Notably there are ZERO whitespace collisions** — no clean `ss_img_ci_064400` exists alongside `ss_img_ci_ 064400`, so the padded name is that asset's *only* name. That makes this more likely a systematic export-time strip than a duplicate.

Full leading-space list: ` 064400` ` 080420` ` 240550` ` 241840` ` 303810` ` 33626L` ` 338100` ` 380540` ` 450950` ` 452450` ` 456070` ` 457370` ` 457600` ` 458650` ` 459100` ` 461300` ` 462980` ` 463480` ` 464280` ` 464500` ` 464580` ` 465480` ` 466100` ` 466410` ` 473980` ` 474170` ` 475400` ` 475460` ` 475560` ` 475580` ` 475660` ` 475830` ` 475960` ` 476060` ` 476080` ` 478780` ` 482520` ` 482630` ` 482680` ` 482690` ` 484130` ` 484870` ` 486630` ` 487360` ` 487720` ` 487830` ` 488060` ` 489210` ` 489480` ` 489730` ` 489790` ` 492220` ` 493790` ` 496070` ` 499790`

### The 7 malformed names — each is a distinct defect

| Layer name (verbatim) | Node | Defect |
|---|---|---|
| `ss_img_ci_` | — | **empty code.** Nothing after the prefix. |
| `ss_img_ci_#025900` | — | stray `#`. `025900` is the real code. |
| `ss_img_ci_026960_backup250425` | `109:36984` | **`_backup250425` suffix** — a dated backup parked in the live grid. `026960` = 동서. |
| `ss_img_ci_ci_000180` | — | **doubled `ci_` prefix.** |
| `ss_img_ci_ci_001380` | — | **doubled `ci_` prefix.** |
| `ss_img_ci_455180 ` | — | trailing space. |
| `ss_img_ci_종목코드(숫자).png` | `3720:911` | **not an asset — this is the rule caption TEXT node.** Do not count it as an asset; a naive `startsWith('ss_img_ci_')` sweep does. |

## ⚠️ 30 duplicate codes — a name→asset lookup WILL collide

30 codes appear more than once (`222080` ×3, `000240` ×3, `003780` ×3; the rest ×2):

`000000`(×2) `000240`(×3) `000720` `000950` `001510` `003780`(×3) `003920` `005300` `005380` `008770` `009150` `009540` `019170` `022100` `025530` `030190` `030200` `035510` `042660` `054220` `066970` `090460` `096760` `100090` `108320` `180640` `222080`(×3) `296640` `363260` `383220`

**Not all duplicates are errors — read the sentence, not the marker.** The dated 교체 (replacement) pattern deliberately places old and new side-by-side:

- `ss_img_ci_222080` (×3) — SFA넥셀, per `SFA넥셀 종목 CI 교체 (26.06.29)` (`6178:1714`), with `구 버전` (`6178:1737`) and `신규 버전` (`6178:1738`) labels.
- `ss_img_ci_296640` (×2) — 이노에이엑스, per `이노에이엑스 종목 CI 교체 (26.04.28)` (`5775:487`).

**But `ss_img_ci_000000` (×2) is not a real KRX code at all** — `000000` is a placeholder/template. And the 코스피 section heading reads `코스피  No. 000000~003545`, i.e. **the placeholder is inside the documented range.** Unresolved.

## 🔥 Invisibility mechanisms found on this page — 4 of the 5

`get_metadata` missed all of them. Enumerated by API, not by eye.

1. **`opacity` ghosting — CONFIRMED, 9 nodes.** `get_metadata` cannot see opacity at all.
   - **`ss_img_ci_267080` @ `opacity: 0.10`** (`2626:833`) — the file-wide 10% parked/superseded convention, exactly as warned. **This asset is retired but still named and still in the grid.**
   - **`ss_img_ci_078340` @ `opacity: 0.20`** (`109:27443`) — a second ghosted asset, different value.
   - `scale guide` frames at `0.5` / `0.4` / **`0`** (`5522:1543` is fully transparent) — these are guides, not assets; the varying opacity is not semantic.
   - `Group` @ `0.38` (`2626:650`), two `Vector` @ `0.4`.
   - ⚠️ **Only 2 of the 9 are asset-level ghosts.** The 0.10 / 0.20 split means there is **no single ghosting value** on this page — do not filter on `=== 0.1`.
2. **`hidden="true"` — CONFIRMED, 287 occurrences.** Overwhelmingly `scale guide` (a per-asset 200×200 registration guide, hidden by design — **not** a deprecation signal) and `구버전로고 (~26/01)` (`5592:497`, inside `ss_img_ci_218410`). Per method I do **not** quote hidden-frame contents as rules.
3. **Fill-matching / dark-on-dark — CHECKED, none found.** All 35 TEXT nodes returned `visible: true, opacity: 1`.
4. **`STRIKETHROUGH` — CHECKED, NONE.** `getStyledTextSegments(['textDecoration'])` on all 35 TEXT nodes → `NONE` for every segment. **No silently-retired rules on this page.**
5. **INSTANCE overrides — N/A here.** 165 INSTANCEs, but they are `guide` overlays, not rule-bearing text. (This mechanism *does* fire on the ETF page — see `nds-ci-etf.md`.)

### The retirement vocabulary on this page is DATED LABELS, not `👿`

Swept for `👿` / `제외` / `해당없음` / `구버전` / `이전` / `미사용` / `deprecated` / `백업` / `폐기` / `중단`. **Zero `👿` on this page.** Hits:

- `구버전로고 (~26/01)` (`5592:497`) — hidden, inside `ss_img_ci_218410`.
- `ss_img_ci_026960_backup250425` (`109:36984`) — a `백업`-class marker in an asset name.
- `업데이트로 삭제` (`5592:495`), verbatim `업데이트로\n삭제` — **"deleted by update"**, a live TEXT label sitting next to `ss_img_ci_218410`.

**`ss_img_ci_218410` is the fully-worked retirement example** and worth reading as the template: the frame holds a hidden `구버전로고 (~26/01)` child, a live `에스엔시스` child, and a hidden `scale guide`; a `업데이트로 삭제` label and a `RFHIC 종목 CI 교체 (26.01.29)` stamp sit beside it. ⚠️ **Note the contradiction: the frame's live child is named `에스엔시스` but its hidden legacy child is `rfhic-logo 1` and the stamp says RFHIC.** Code `218410` was RFHIC, now 에스엔시스. The name is correct; the stamp records the history.

## Dated inventory sections — this page's recency convention

**There is no `Last update` stamp** in the `NDS_Library` sense. Instead, rolling date-ranged section labels (verbatim):

| Label | Node |
|---|---|
| `신규상장종목 (~23.11.20)` | `1998:2` |
| `신규상장종목 (23.11.21~24.03.13)` | `2626:843` |
| `신규상장종목 (24.03.14~24.05.17)` | `3192:310` |
| `신규 상장 종목 CI (24.08.07~25.02.06)` | `4212:610` |
| `신규 상장 종목 CI (25.02.06~25.05.07)` | `4485:1133` |
| `신규 상장 종목 CI (25.05.08~25.08.11)` | `4950:577` |
| `신규 상장 종목 CI (25.08.12~26.01.12)` | `5522:1742` |

⚠️ **Two defects in this ledger:**
- **A gap: `24.05.18 ~ 24.08.06` is unlabelled.** ~11 weeks of listings with no section.
- **An overlap: `…~25.02.06` and `25.02.06~…` share the boundary date**, so 25.02.06 belongs to both.
- The label wording drifts: `신규상장종목` (no spaces, first 3) → `신규 상장 종목 CI` (spaced, last 4).

Individual CI replacements are stamped separately: `RFHIC 종목 CI 교체 (26.01.29)` · `이노에이엑스 종목 CI 교체 (26.04.28)` · `SFA넥셀 종목 CI 교체 (26.06.29)`. **`26.06.29` is the newest evidence of life on this page.**

## The bulk grid: `기존 ` (`502:2`)

A single 27,152×4,446 frame — note the **trailing space in the name**, `'기존 '` — holding the legacy 코스피/코스닥 inventory in a numeric grid. 16 heading TEXT nodes partition it. **Read `characters`, not the name** — every heading's layer name collapses the double space:

| Layer name | `characters` (authoritative) |
|---|---|
| `코스닥 No. 051380~071460` | `코스닥  No. 051380~071460` |
| `코스피 No. 000000~003545` | `코스피  No. 000000~003545` |

**All 16 differ from their layer name by exactly one space.** Exactly the class of name-vs-characters divergence the method warns about — here it is systematic, and benign, but it proves the names are not byte-faithful.

Ranges present (from `characters`): 코스닥 `000250~033340` · `033500~051370` · `051380~071460` · `071670~100700` · `100790~170030` · `170790~240810` · `241520~330990` · `331380~950220`; 코스피 `000000~003545` · `003547~009440` · `009450~032640` · `032830~138490` · `138930~950210`. Plus three later top-level frames: `코스닥  No. 088280~464680` (`2323:838`), `코스피  No. 067370~450410` (`2323:1315`), `코스피  No. 030190~465770` (`2323:2095`).

⚠️ **The ranges overlap across frames** (e.g. 코스피 `030190~465770` subsumes `032830~138490`), so these are **not** a clean partition — they are accretion layers. Do not treat them as an index.

**A stray `9bcc3d` TEXT node (`109:26171`)** sits in the grid — a bare hex colour with no label, no swatch, no context. Blank at source; I am not inventing a meaning for it.

## CORE — componentKeys found

**NONE. Zero COMPONENTs and zero COMPONENT_SETs on this page** — verified via `findAllWithCriteria`, both returned `[]`.

The only key resolvable from this page is via its 165 INSTANCEs, which all resolve to one remote main:

| Instance name | Main key (40-hex) | KIND | remote | Tier |
|---|---|---|---|---|
| `guide` | `b3bfa852a721d6b9648186eac9fca884e7ab1e25` | **COMPONENT** (no parent SET — `parent` is `null`) | `true` | (b) consumed from another library, viewed from a subscribing file |

**KIND discipline:** `guide` is a standalone **COMPONENT**, not a SET → `importComponentByKeyAsync`, **not** `importComponentSetByKeyAsync`. Its `parent` is `null`, confirming there is no enclosing SET whose key could be mistaken for it.

**Verification: `unverified`.** Read-only session; no round-trip import test. Keys read directly off the nodes, authoritative for identity only.

## The `NDS_StockIcon_CI` relationship — PARTIALLY RESOLVED, and the answer reframes the LEDGER hole

`get_libraries({fileKey: 'KmpaYeoYh41F6nyIKvBQ7h'})` returns:

- **`libraries_added_to_file`** (what NDS_CI subscribes to): `NDS_Templates`, `NDS_Library`, `NDS_Darkmode Colors`, `NDS_Colors`. **No `NDS_StockIcon_CI`.**
- **`libraries_available_to_add`**: 5 Apple/Google/Figma community kits + 4 org libraries (`가이드 ⚙️ EMS`, `운영 ⚙️ EMS`, `NDS_M.web`, `가이드 ⚙️ 홈페이지`). **No `NDS_StockIcon_CI`.**

**No library named `NDS_StockIcon_CI` is visible from this file, in either list.** And this page publishes nothing — zero components.

**But the hole is not empty, it just isn't here.** On the sibling ETF page, an instance of `ss_img_ci_etc` resolves via `getMainComponentAsync()` to a **`COMPONENT_SET` with `remote: false`** — SET key `f3a7b6ed87a9914c0dca2f1f87d2c77cd9164dc4`. `remote: false` means **local to NDS_CI**, yet the set is on **none of my three pages**. **NDS_CI therefore DOES contain at least one published component set, on a page outside my assignment.** That set — not this page — is the plausible `NDS_StockIcon_CI` referent.

**Verdict: `NDS_StockIcon_CI` is unidentified as a *library name* — it does not exist as a subscribable library from NDS_CI's vantage point.** The LEDGER entry is most likely describing **NDS_CI's own component-bearing page(s)**, which my three pages are not. See `nds-ci-etf.md` for the key and the evidence. **Recommend: sweep NDS_CI's remaining pages for the home of `ss_img_ci_etc`.**

## Conflicts / LEDGER candidates

1. **⛔ NDS_CI is an asset file, not a component library — for domestic stock CI.** Zero components across 2,948 assets. **A BUILD pass cannot `importComponentByKeyAsync` a stock CI.** The only integration path is the CDN URL. This is the single most consequential fact on the page and it contradicts the framing that `NDS_StockIcon_CI` is a component library.
2. **The documented grammar is wrong at source.** `ss_img_ci_종목코드(숫자).png` says `(숫자)`, but **55 shipped codes are alphanumeric** (`0004Y0`, `33626K`, `08537M`). The rule under-describes its own inventory by 2%.
3. **30 duplicate codes** → name→asset lookup collides. Some are intentional 구/신 버전 pairs (`222080`, `296640`); `000000` is a placeholder that a range heading nonetheless documents.
4. **55 leading-space + 1 trailing-space names** → CDN URL correctness unverified. Zero whitespace collisions, so each is that asset's sole name.
5. **7 malformed names**, incl. two **doubled-prefix** (`ss_img_ci_ci_000180`, `ss_img_ci_ci_001380`), one **empty**, one `#`-prefixed, one `_backup250425`.
6. **U+0008 in 11 company-name frames** — same corruption class as `\bms_btn_calendar` (`nds-lib-icons`). **Confirmed file-wide, not just in NDS_Library.**
7. **Two ghosting values (0.10 and 0.20)** on asset frames. `nds-lib-illusts` recorded 0.10/0.30/0.5. **The convention is a family, not a constant** — a `=== 0.1` filter under-reports.
8. **The 신규상장 date ledger has a ~11-week gap (24.05.18–24.08.06) and a shared boundary date (25.02.06).**
9. **`ss_img_ci_218410` name/stamp mismatch** — live child `에스엔시스`, hidden child `rfhic-logo 1`, stamp `RFHIC`. Resolved as a legitimate ticker-reuse history, but it will read as a defect to anyone name-matching.
10. **Cross-file corroboration (NOT a conflict):** the `ss_img_` prefix here matches the `ss_img_` family already recorded in `nds-lib-icons` (`ss_img_quickbar`, `ss_img_2022home_morebank`, `ss_img_filter`). **`ss_` = the shipped-asset namespace, `nds_` = the component namespace.** This page is entirely `ss_`, consistent with it holding zero components. That is a coherent, file-spanning convention, not an accident.

## Gaps / unverifiable

- **`get_metadata` XML reports 2,941 `ss_img_ci_*` nodes; the Plugin API `findAll` reports 2,948.** A 7-node discrepancy. The XML omits some `GROUP`-wrapped nodes the API sees. **I report both; the API figure is authoritative** (`.length` off live nodes). Distinct-name count of **2,908** is computed from the XML dump and may therefore under-count by ≤7.
- **Whether the CDN strips the leading space** in the 55 padded names — undeterminable read-only. Needs one HTTP probe of `downloadcdn.nhqv.com/mts/ci/ss_img_ci_%20064400.png` vs `…ss_img_ci_064400.png`.
- **The `9bcc3d` TEXT node (`109:26171`)** — a bare hex value with no context. Not interpreted.
- **`ss_img_ci_000000` (×2)** — placeholder vs real asset unresolved.
- **The hidden `구버전로고 (~26/01)` frame (`5592:497`)** — contents read for the collision analysis only, **not quoted as a rule**. Recorded unverified + "unhide and re-check".
- **I did not transcribe the 2,908 individual codes** — per method, the grammar + exact counts + exception classes are the deliverable. The full code list is recoverable from the saved dump.
- **No `Last update` stamp** in this file's convention. Recency rests on the `26.06.29` 교체 label. **No stamp ⇒ recency is inferred, not asserted.**
- **11 company-name frames are the unfilled placeholder `종목명`** — blank at source, not invented.
</content>
</invoke>
