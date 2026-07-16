---
name: nds-ci-firm-banking
fileKey: KmpaYeoYh41F6nyIKvBQ7h
source_url: "https://www.figma.com/design/KmpaYeoYh41F6nyIKvBQ7h/NDS_CI?node-id=3368-19"
learned_date: 2026-07-16
sections_studied:
  - "3368:19 (page '펌뱅킹' — canvas root; 41 nodes, 0 COMPONENT/COMPONENT_SET, 1 INSTANCE)"
  - "3902:609 (TEXT — on-canvas heading '📌 펌뱅킹 CI')"
  - "3905:676 (TEXT — the naming grammar, on-canvas 'ss_img_bank숫자.png')"
  - "3905:2854 (TEXT — the 11-row 은행→파일명 mapping table; THE keying artifact of this page)"
  - "3905:671 (INSTANCE layer-named 'su' — real characters are a PROVENANCE rule; layer name is a lie)"
  - "6176:170 / 6176:202 / 6176:203 (TEXT — '히스토리 참고용' / '구 버전 CI' / '신규 버전 CI' — the 케이뱅크 CI-change history zone)"
status: "unknown — no `Last update` stamp anywhere on the page. The 11-row mapping table carries NO dates at all (contrast the sibling 언론사 page, which dates its additions). Recency is unlabeled; 'live' is NOT claimed. The page renders and every slot 01–11 is filled, but that is structure, not a freshness signal."
---

# NDS_CI — "펌뱅킹" (firm banking) page

Third-party **bank CI logos** for the firm-banking flow. **41 nodes total. Zero COMPONENTs, zero COMPONENT_SETs.** This is the single most important structural fact on the page and it generalises across all three NDS_CI pages I read: **the logo assets are not a Figma component library.** They are plain `FRAME`s carrying image fills, and the shipped contract is a **PNG filename convention resolved server-side** — not `importComponentByKeyAsync`.

## ⚠️ Third-party-logo usage rule: **NONE EXISTS** — and that absence is the finding

I swept every TEXT node's real `characters` on this page. **There is no usage rule, no permission statement, no attribution requirement, and no trademark notice of any kind** governing these eleven banks' marks. The page carries only NDS's own generic file-level IP notice (`상업적 이용 및 재배포를 엄격히 금지… 사내 업무 용도로만`), which is NDS asserting rights over its *own* library — **it says nothing about 농협/신한/하나/KB/IBK's marks, which are those companies' trademarks and are merely reproduced here.**

**I am stating this as an absence, not inferring a policy.** There is no "cleared for use", no "internal only", no expiry, no contact owner. A build that consumes these logos is consuming other companies' trademarks under **no recorded permission** — that gap is real and should be escalated to a human, not resolved by me.

The only governance-adjacent sentence on the entire page is about **file provenance**, not permission — see below.

## 🔍 The one real rule — and `get_metadata` renders it as the word "su"

Node `3905:671` is an `INSTANCE` whose **layer name is `su`**. Its actual rendered characters:

> `새로 제작한 06번만 로고 원본파일`
> `(나머지는 서버 다운로드 받은 png)`

**Translation of consequence:** only `ss_img_bank06` (iM은행) is an NDS-authored vector original. **All ten others are PNGs downloaded from a server** — NDS did not draw them and does not hold the source. This is a *provenance* statement, and it is the closest thing to a rights-relevant fact on the page: it confirms these are foreign assets pulled in, which sharpens the missing-permission gap above.

This is **invisibility mechanism #4 (INSTANCE OVERRIDE)** in its textbook form: the layer name `su` is meaningless — a truncated fragment — while the payload lives in overridden characters. **A structure-only read of this page returns the string `su` and loses the only rule on it.** I recovered it by screenshot.

Corroborating structure: `ss_img_bank06` (`3368:410`) is the **only** bank frame with **zero children** — every other bank frame contains a `rounded-rectangle` child holding the image fill. Its structure is genuinely different, exactly as the note claims.

## Naming grammar (verbatim)

On-canvas, node `3905:676`, with `bank숫자` colour-highlighted in the source:

> `ss_img_bank숫자.png`

- `숫자` is **zero-padded 2-digit** (`01`…`11`) — confirmed by all 11 rows.
- **Institutions are keyed by ordinal number, NOT by bank code and NOT by name.** There is no 은행코드 (no 011/020/088 standard bank codes) anywhere on this page. The mapping table is the *only* bridge from a bank to its asset, and it is a hand-written TEXT blob — **not machine-readable, not a component property, not a variable.** A build must hard-code this table.
- The number is **positional/arbitrary** — it is not alphabetical, not by market share, not by bank code. `01`=농협 and `02`=지역농축협 lead because this is NH투자증권's own file.

## The mapping table (`3905:2854`) — transcribed verbatim, 11/11

| # | 기관 | 파일명 |
|---|---|---|
| 1 | 농협은행 | `ss_img_bank01` |
| 2 | 지역농축협 | `ss_img_bank02` |
| 3 | 신한은행 | `ss_img_bank03` |
| 4 | 하나은행 | `ss_img_bank04` |
| 5 | SC은행 | `ss_img_bank05` |
| 6 | iM은행 | `ss_img_bank06` |
| 7 | 새마을금고 | `ss_img_bank07` |
| 8 | 우체국 | `ss_img_bank08` |
| 9 | IBK 기업은행 | `ss_img_bank09` |
| 10 | 케이뱅크 | `ss_img_bank10` |
| 11 | 국민은행 | `ss_img_bank11` |

**Exact counts — `.length` vs the table:**
- Mapping table rows: **11**
- Distinct asset numbers `bank01`…`bank11`: **11** — ✅ **no numbering holes, no gaps.**
- **Bank frames actually on canvas: 13, not 11.** The excess is `ss_img_bank10`, which appears **three times** (see conflict #1). **13 ≠ 11 — the canvas over-counts the contract by two.**
- No heading on this page states a count, so there is **no stale-heading conflict to report here** (unlike the `Nmoji: 142개`→152 class of error). The table itself is the count, and it is internally consistent.

**Taxonomy note the table quietly encodes:** `지역농축협`, `새마을금고` and `우체국` are **not banks** — they are a co-op federation, a credit union, and a postal service. The `bank` prefix is a convenience label for "firm-banking counterparty", not an accurate type. Do not build a type check off the prefix.

**`iM은행` is a live-rename tell.** iM은행 is the 2024 rebrand of 대구은행(DGB). The table already says `iM은행` and the note says 06 was newly drawn — consistent, and it means this table has been touched since ~2024 even though it carries no date.

## 🕰️ The 케이뱅크 CI change — and `hidden="true"` used as a version switch

A dedicated zone at far left (x ≈ −2520), headed:

> `히스토리 참고용` (`6176:170`)

with two labelled columns:

> `구 버전 CI` (`6176:202`) · `신규 버전 CI` (`6176:203`)

Screenshot-verified:
- **구 버전** (`6176:205`) — the old `K bank` wordmark (pink-outlined K + dark grey "bank" lettering).
- **신규 버전** (`6176:209`) — the new solid **blue circular K** mark.

**The switch mechanism is `hidden`, not deletion.** In both `6176:209` (신규 버전) and `6176:220` (the live main-row bank10), the inner frame named `케이뱅크` is **`hidden="true"`** and a sibling frame `Layer_1` renders the new mark instead. In `6176:205` (구 버전) the `케이뱅크` frame is **visible** — that is what makes it the old one.

→ **The old CI is still physically present inside the live asset, just hidden.** Per method I do **not** quote hidden content as a rule; I record it as the supersede mechanism and flag it. **A naive "unhide everything" pass on this file would resurrect a retired bank CI into production.** That is a real hazard worth writing down.

**This page is the only one of my three that documents a CI change at all.** It establishes the file's convention: superseded third-party CIs are **kept, labelled `히스토리 참고용`, and segregated spatially to negative-x** — not deleted, and *not* opacity-ghosted (see below).

## Name-reliability verdict: **MIXED — asset frames RELIABLE, the one rule-bearing node LIES**

Per-page convention, as the method warns:

1. **Bank asset frames — RELIABLE.** `ss_img_bank01`…`ss_img_bank11` are real, hand-maintained filenames matching the shipped grammar. **Trust these.** Their inner frames additionally carry the **Korean institution name** (`농협은행`, `국민은행`, `IBK 기업은행`…) — a genuine second, redundant keying that corroborates the mapping table. Useful.
2. **`3905:671` named `su` — a LIE.** The layer name is a meaningless fragment; the real content is the provenance rule. **This is the highest-value node on the page and its name tells you nothing.**
3. **`Layer_1` — auto-generated junk** (`6176:212`, `6176:223`). It is the *new* K-bank mark. Never key off it.

### Invisibility mechanisms found on this page: **2 of 5 confirmed, 2 unverifiable, 1 absent**

| # | Mechanism | Status here |
|---|---|---|
| 1 | Fill matching background | **Not on this page** as a rule-hider. But note the **구 버전 K-bank wordmark is dark-grey-on-dark** and reads as near-invisible in the canvas render — low-contrast, though not literally background-matched. |
| 2 | `STRIKETHROUGH` | ⚠️ **UNVERIFIABLE — see Gaps.** `getStyledTextSegments` could not be run on this page. |
| 3 | `opacity` ghosting | ⚠️ **UNVERIFIABLE — see Gaps.** `get_metadata` cannot see opacity and `use_figma` was blocked. **Notably, this page does NOT need opacity-ghosting: it supersedes via `hidden` + spatial segregation instead.** The sibling 자문사 page *does* use opacity (0.7). So the file-wide ghosting convention is **not applied uniformly** — this page opted out. |
| 4 | **INSTANCE OVERRIDE** | ✅ **CONFIRMED — `3905:671`, layer `su` → provenance rule.** The single most consequential find on the page. |
| 5 | **`hidden="true"`** | ✅ **CONFIRMED — and used *semantically*, not as junk.** `6176:210`, `6176:221` (`케이뱅크` old wordmark, hidden inside the new-CI frames). This is the retired-CI mechanism. **Contrast the method's blank-1×1 case: here hidden content is meaningful history, not noise.** |

**`👿` / `제외` / `해당없음` / `구버전` / `이전` / `미사용` / `deprecated` / `백업` / `폐기` / `중단` sweep:** the only hit is **`구 버전 CI`** (`6176:202`) — and reading the sentence as the method demands, **it does not deprecate an asset.** It labels the *left half of a two-column before/after comparison* under `히스토리 참고용`. The asset `ss_img_bank10` is emphatically **live**. No `👿` anywhere on this page.

## Provenance of pasted images

**Clean.** Every raster on this page is a bank CI consistent with the page's stated purpose. **No Highcharts docs, no conference-talk screenshots, no foreign material** of the kind found on the sibling pages. The `su` note (`서버 다운로드 받은 png`) is itself an honest provenance disclosure for ten of the eleven.

## CORE — componentKeys found

**NONE. Zero COMPONENTs and zero COMPONENT_SETs on this page** — confirmed from the `get_metadata` dump (only `frame`, `text`, `instance`, `rounded-rectangle` elements appear).

**Tier: not applicable.** There is nothing here to import by key. **The 11 bank logos are FRAMEs with image fills — they cannot be pulled via `importComponentByKeyAsync`.** The build contract is the filename (`ss_img_bank06.png`) against the app's asset server.

The page's **one** `INSTANCE` (`3905:671`, the `su` callout) is a **memo/sticky-note bubble**, not a logo asset. **Its componentKey is `unresolved` — `getMainComponentAsync()` could not be called (see Gaps). I am not truncating or guessing a key; none is recorded.**

## Conflicts / LEDGER candidates

1. **⚠️ `ss_img_bank10` — ONE name, THREE nodes.** `6176:205` (구 버전 CI, old mark, visible-`케이뱅크`), `6176:209` (신규 버전 CI, new mark), `6176:220` (**the live main-row asset**, new mark). **A name→asset lookup collides three ways and has a 2-in-3 chance of returning a history exhibit.** Disambiguator is **position only** (x ≈ −2520 / −2172 = history zone; x = 1155 = live row) — there is no flag, no label on the nodes themselves, no `_old` suffix. **This is the page's principal build hazard.** Canvas frame count (13) exceeds contract rows (11) entirely because of this.
2. **`ss_img_bank06` is structurally unlike its ten siblings** — zero children vs. a `rounded-rectangle` image-fill child. Explained and legitimised by the `su` note (06 = the only NDS-drawn vector original), so **not a defect** — but any code that walks `frame.children[0]` to find the logo **will break on 06 alone.**
3. **The retired 케이뱅크 wordmark survives inside the live asset as `hidden="true"`** (`6176:221`). Deletion never happened. Flagged as a resurrection risk under any bulk-unhide.
4. **The `bank` prefix is a category lie** for `bank02` (지역농축협, co-op), `bank07` (새마을금고, credit union), `bank08` (우체국, postal). Low severity; defeats type inference.
5. **No dates anywhere.** The sibling 언론사 page timestamps its additions inline (`(25/2/6 추가)`, `(26.03.24 추가)`). **This page does not** — despite documenting a CI *change*, the most date-worthy event a CI file can hold. **The 케이뱅크 CI switch is undated.** Cross-page inconsistency in the `Last update` convention, exactly as the method predicts (`independent per page, several conventions, many absent`).

## Gaps / unverifiable

- **⛔ `use_figma` could NOT read this page at all.** Every attempt — `setCurrentPageAsync`, `page.loadAsync()`, even `getNodeByIdAsync` on any *child* node — failed with `Operation attempted to modify the file while in read-only mode`. Only the bare page node (`{name, type}`) was reachable. **The trigger correlates exactly with INSTANCE presence:** the sibling 자문사 page (0 instances) read fine; this page (1 instance) and 언론사 (2 instances) both hard-fail. Hypothesis: **hydrating a remote-component instance on page load counts as a file mutation**, which read-only forbids. Not proven, but the correlation is 3-for-3.
- **Consequences I am naming rather than papering over:**
  - **`STRIKETHROUGH` was never checked** — `getStyledTextSegments(['textDecoration'])` was unrunnable. A struck-through retired rule on this page **would not have been caught.** Screenshots at the resolutions used would likely reveal a strikethrough on a short line, and I saw none — but that is weak evidence, not the check the method asks for.
  - **`opacity` was never read.** `get_metadata` cannot see it. Ghosted/parked assets on this page **would be invisible to my method.** The renders show no obviously faded logo, but the 0.10 end of the ghosting convention is hard to distinguish from absent in a thumbnail.
  - **U+0008 (`\b`) control characters could not be byte-checked** in layer names. The `get_metadata` XML shows none, but that dump is not byte-faithful.
  - **The `su` callout's componentKey is unresolved.** `getMainComponentAsync()` was blocked. **Recorded as `unresolved`, not guessed.**
- **Everything above rests on `get_metadata` + screenshots.** Counts (41 nodes, 13 bank frames, 11 table rows, 0 components) are read off the metadata dump, which is authoritative for structure and type but **blind to opacity, text decoration, and component keys.**
- **Re-check when write access is available:** run the opacity + `textDecoration` sweep and resolve the `su` instance key. Until then this page is **structurally mapped but not invisibility-cleared.**
- **The mapping table is one TEXT blob**, not 11 nodes. It cannot drift *within itself*, but it can drift from the canvas — and it already has (13 frames vs 11 rows).
