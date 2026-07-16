---
name: nds-ci-media
fileKey: KmpaYeoYh41F6nyIKvBQ7h
source_url: "https://www.figma.com/design/KmpaYeoYh41F6nyIKvBQ7h/NDS_CI?node-id=3618-27"
learned_date: 2026-07-16
sections_studied:
  - "3618:27 (page '언론사' — canvas root; 27 top-level nodes, 0 COMPONENT/COMPONENT_SET, 2 INSTANCEs)"
  - "3902:610 (TEXT — on-canvas heading '📌 언론사')"
  - "3902:611 (TEXT — the naming grammar, on-canvas 'ss_img_press숫자.png')"
  - "3622:1134 (TEXT — scope: '[사용 메뉴] 현재가 > 뉴스/공시 뉴스인사이트')"
  - "3622:611 (TEXT — the 21-row 언론사→파일명 mapping table; carries the page's only dates)"
  - "3627:1138 (INSTANCE layer-named 'kale' — real characters are a PRODUCTION rule; layer name is a lie)"
  - "5680:218 (INSTANCE layer-named 'sia' — real characters record the press20 name collision; layer name is a lie)"
status: "live — and it is the ONLY one of my three pages with dated evidence. The mapping table timestamps its own additions inline: `(25/2/6 추가)` for press19 and `(26.03.24 추가)` for press21, plus an attributed `(26.03.24 유유리 팀장님)` review note. Most recent evidence 2026.03.24. NOT a `Last update` stamp in the file's usual sense — no stamp node exists; recency is inferred from in-table annotations, which is weaker but is real dated evidence."
---

# NDS_CI — "언론사" (media outlets) page

Third-party **news-outlet CI logos** for the news feed. **27 top-level nodes. Zero COMPONENTs, zero COMPONENT_SETs** — same as its siblings: these are plain `FRAME`s with image fills, shipped as **PNG filenames resolved server-side**, not an importable Figma library.

**Scope, verbatim** (`3622:1134`):

> `[사용 메뉴]`
> `1. 현재가 > 뉴스/공시`
> `2. 뉴스인사이트`

Two consuming surfaces, named. This is tighter scoping than the sibling 펌뱅킹 page offers (which names no menu at all).

## ⚠️ Third-party-logo usage rule: **NONE EXISTS** — and that absence is the finding

I read every TEXT node's real `characters` on this page. **There is no usage rule, no licence, no permission record, no attribution requirement, and no trademark notice** for any of these twenty-one news organisations' marks. Only NDS's own file-level IP notice (`상업적 이용 및 재배포를 엄격히 금지… 사내 업무 용도로만`) exists, and that is NDS asserting rights over **its own** library — it says nothing about 연합뉴스, 매일경제, 조선비즈, or Benzinga's marks, which belong to those publishers.

**Stated as an absence, not inferred.** Nothing says "licensed", "cleared", "with permission", or names a rights contact.

**This page raises the stakes above its siblings**, and I want to be precise about why rather than dramatic: the one production rule that *does* exist (`kale`, below) **instructs designers to hand-set a publisher's name as text when no logo file is available.** That is NDS *manufacturing* a wordmark for a third party. Whether that is benign (plain-text attribution) or a trademark concern (a fabricated wordmark standing in for a real one) is **a question for a human with legal context — I am flagging it, not adjudicating it.** The relevant fact for the record: **the file contains an instruction to synthesise third-party name treatments and contains no permission framework of any kind.**

## 🔍 The two real rules — both hidden behind meaningless layer names

Both are `INSTANCE`s (memo bubbles) whose **layer names are lies** — invisibility mechanism #4, twice on one page:

### 1. `3627:1138`, layer-named **`kale`** — the production rule

> `로고 없을 경우 텍스트로 제작`
> `ex. 15번 타임앤포인트 참고`

**"If there is no logo, produce it as text — see #15 타임앤포인트 for reference."** This is the page's **fallback authoring rule**, and it is genuinely load-bearing: it tells you `ss_img_press15` is not a real CI at all but an NDS-set text treatment, and that it is the **canonical template** for every future logo-less outlet. Screenshot-confirmed: 타임앤포인트 renders as plain grey lettering, visibly unlike its logo-bearing neighbours.

### 2. `5680:218`, layer-named **`sia`** — the collision record

> `벤징가가 20번 이름 사용 중`

**"Benzinga is using the #20 name."** See conflict #1 — this is the page's live numbering defect, and the file knows about it.

**Neither `kale` nor `sia` means anything.** They are truncated fragments (`kale`←?, `sia`←아시아?). **A structure-only read of this page returns `kale` and `sia` and loses both rules.** Recovered by screenshot.

## Naming grammar (verbatim)

On-canvas, node `3902:611`, with `press숫자` colour-highlighted in the source:

> `ss_img_press숫자.png`

- `숫자` is **zero-padded 2-digit** (`01`…`21`).
- **Outlets are keyed by ordinal number only** — no press code, no domain, no publisher ID. The mapping table is the sole bridge, and it is a **hand-written TEXT blob**: not machine-readable, not a component property, not a variable. **A build must hard-code it.**
- Numbering is **arbitrary/append-order**, not alphabetical — new outlets take the next free integer (`19`→뉴스1 in 2025, `21`→딜사이트 in 2026). This makes the number a **stable ID**, which is the one genuinely good property of the scheme.

## The mapping table (`3622:611`) — transcribed verbatim, 21/21

| # | 언론사 | 파일명 | 비고 (verbatim) |
|---|---|---|---|
| 1 | 이데일리 | `ss_img_press01` | |
| 2 | 머니투데이 | `ss_img_press02` | |
| 3 | 연합뉴스 | `ss_img_press03` | |
| 4 | 한경닷컴 | `ss_img_press04` | |
| 5 | 인포스탁 | `ss_img_press05` | |
| 6 | 매일경제 | `ss_img_press06` | |
| 7 | 아시아경제 | `ss_img_press07` | |
| 8 | 뉴스핌 | `ss_img_press08` | |
| 9 | 파이낸셜 | `ss_img_press09` | |
| 10 | 이투데이 | `ss_img_press10` | |
| 11 | 헤럴드경제 | `ss_img_press11` | |
| 12 | 조선경제 | `ss_img_press12` | |
| 13 | 서울경제 | `ss_img_press13` | |
| 14 | NSP통신 | `ss_img_press14` | |
| 15 | 타임앤포인트 | `ss_img_press15` | ← the `kale` rule's reference example (text-set, not a logo) |
| 16 | IR GO | `ss_img_press16` | |
| 17 | 데이터투자 | `ss_img_press17` | |
| 18 | 씽크풀 | `ss_img_press18` | |
| 19 | 뉴스1 | `ss_img_press19` | `(25/2/6 추가)` |
| 20 | — | **no filename given** | `벤징가 이미지가 20번 이름 사용 중으로 확인 (26.03.24 유유리 팀장님)` |
| 21 | 딜사이트 | `ss_img_press21` | `(26.03.24 추가)` |

**Row 20 is not a mapping — it is a defect report.** The table's own row 20 names no outlet and no file; it records that the slot is taken. Verbatim, unabridged:

> `벤징가 이미지가 20번 이름 사용 중으로 확인 (26.03.24 유유리 팀장님)`

**Exact counts — `.length` vs the table:**
- Mapping-table rows: **21** (numbered 1–21, no gaps).
- **Actual outlets mapped to a file: 20**, because row 20 supplies no filename.
- **Press frames on canvas: 21** (`press01`…`press21`) — I enumerated all 21 from the `get_metadata` dump; **no numbering holes, no duplicate frames.**
- **⚠️ But `ss_img_press20` (`5680:208`) renders EMPTY.** The frame exists at x=2400 and is 200×80 like every sibling — and nothing draws in it. Screenshot-confirmed: the slot is blank, with the `sia` callout parked directly beneath it. **So: 21 frames, 21 rows, but only 20 usable assets.** The canvas and the table agree on the count and *both* over-state the deliverable by one.
- **No heading on this page states a count** → **no stale-heading conflict to report** (unlike the `Nmoji: 142개`→152 class). The table is the count.

**Taxonomy note:** `IR GO`(16), `데이터투자`(17), `씽크풀`(18), `인포스탁`(5) are **not news outlets** — they are IR/data/analytics vendors. As with 펌뱅킹's `bank` prefix, `press` is a loose label for "news-feed content source", not an accurate type. Don't infer type from the prefix.

**Naming drift in the table itself:** `조선경제`(12) renders as **ChosunBiz** (조선비즈) and `파이낸셜`(9) renders as **파이낸셜뉴스** — the table's Korean labels are **abbreviated/stale relative to the actual marks**. Minor, but it means the table's 언론사 column is a nickname field, not a legal name field. Do not use it for attribution.

## Name-reliability verdict: **MIXED — asset frames RELIABLE, both rule-bearing nodes LIE**

Per-page convention:

1. **Press asset frames — RELIABLE.** `ss_img_press01`…`ss_img_press21` are real, hand-maintained filenames matching the grammar. **Trust these.** Some inner frames additionally carry the outlet name (`서울경제`, `NSP통신`) — a genuine redundant keying, but **inconsistently applied** (most frames have no such child), so it cannot be relied on as a lookup.
2. **`3627:1138` = `kale` and `5680:218` = `sia` — LIES.** Meaningless fragments concealing the page's only two rules. **The two highest-value nodes on the page, and their names tell you nothing.**
3. **`5678:190` named `news1` — a LIE, and an actively misleading one.** It sits **inside `ss_img_press21` (딜사이트)** and is **`hidden="true"`**. The 딜사이트 frame was **copy-pasted from the 뉴스1 frame**; the old `news1` layer was hidden rather than deleted, and the real asset is its sibling `d_logo_black_573130 1`. **A name-based search for "news1" returns a node inside 딜사이트.**
4. **`Layer_1` / `Group 46208` / `d_logo_black_573130 1` — auto-generated junk.** Never key off them. (`d_logo_black_573130 1` does leak one useful fact: 딜사이트's asset is the **black** logo variant — see below.)

### Invisibility mechanisms found on this page: **2 of 5 confirmed, 2 unverifiable, 1 partial**

| # | Mechanism | Status here |
|---|---|---|
| 1 | **Fill matching background** | ✅ **CONFIRMED — and it is systemic on this page, not a one-off.** The canvas is near-black, and multiple outlets ship **black/dark wordmarks** that render as **near-invisible**: `press07` 아시아경제, `press19` 뉴스1, and most starkly **`press21` 딜사이트 ("DealSite"), which is barely legible against the canvas.** The layer name `d_logo_black_573130 1` confirms 딜사이트's asset is deliberately the *black* variant. **These logos are present and correct — they are simply unreadable on this page's own background.** Any reviewer eyeballing this canvas would conclude slots 07/19/21 are empty. They are not. **This is exactly the mechanism the method warns about, and here it hides assets rather than rules.** |
| 2 | `STRIKETHROUGH` | ⚠️ **UNVERIFIABLE — see Gaps.** `getStyledTextSegments` could not be run. **This is the page where it matters most:** row 20 is a retired/blocked slot, and a strikethrough on it would be the natural way to mark it. **I could not check.** |
| 3 | `opacity` ghosting | ⚠️ **UNVERIFIABLE — see Gaps.** `get_metadata` cannot see opacity; `use_figma` was blocked. **A logo inventory is a prime ghosting candidate and I could not run the check.** The empty-looking `press20` is a live suspect: it may be `opacity: 0` rather than genuinely blank — **I cannot distinguish those two states**, and they mean different things. |
| 4 | **INSTANCE OVERRIDE** | ✅ **CONFIRMED ×2 — `kale` (`3627:1138`) and `sia` (`5680:218`).** Both rules on the page hide here. |
| 5 | **`hidden="true"`** | ✅ **CONFIRMED — `5678:190` (`news1`, inside 딜사이트).** Not a blank 1×1 and **not quoted as a rule** — it is copy-paste residue. Recorded as a name-collision hazard only. |

**`👿` / `제외` / `해당없음` / `구버전` / `이전` / `미사용` / `deprecated` / `백업` / `폐기` / `중단` sweep: ZERO hits.** No `👿` anywhere. **Nothing on this page is marked deprecated** — including slot 20, which is *defective* but is described neutrally as "in use by 벤징가", not retired.

## Provenance of pasted images

**Clean.** Every raster is a news-outlet CI consistent with the page's purpose. **No Highcharts docs, no 원티드 conference-talk material, no foreign content** of the kind found on sibling pages. Nothing here poses as a rule that isn't one.

## CORE — componentKeys found

**NONE. Zero COMPONENTs and zero COMPONENT_SETs** — confirmed from the `get_metadata` dump (only `frame`, `text`, `instance`, `rounded-rectangle` elements).

**Tier: not applicable.** Nothing to import by key. **The 21 press logos are FRAMEs with image fills** — unreachable via `importComponentByKeyAsync`. The build contract is the filename (`ss_img_press15.png`) against the app's asset server.

The page's **two** `INSTANCE`s (`kale`, `sia`) are **memo/sticky-note bubbles**, not logo assets. **Their componentKeys are `unresolved` — `getMainComponentAsync()` could not be called (see Gaps). Not truncated, not guessed: no key is recorded.**

## Conflicts / LEDGER candidates

1. **⛔ `ss_img_press20` — the slot is claimed but undelivered.** The file's own words (`sia`, and table row 20, both dated **26.03.24**, attributed to **유유리 팀장님**): `벤징가가 20번 이름 사용 중` / `벤징가 이미지가 20번 이름 사용 중으로 확인`. **Benzinga occupies the `ss_img_press20` filename somewhere outside this page**, while the frame *on* this page is empty and the table gives no outlet for row 20. **Consequences:** (a) `ss_img_press20` resolves to a Benzinga logo that this page does not show and does not map; (b) **the next outlet added must NOT take 20** — the table looks like it has a free slot and it does not; (c) NDS_CI is **not the single source of truth** for the `ss_img_press*` namespace — something else writes into it. **This is the page's principal build hazard and it is already escalated to a 팀장 in-file.**
2. **Three assets are invisible-by-fill on the page's own background** (`press07` 아시아경제, `press19` 뉴스1, `press21` 딜사이트 — all black wordmarks on near-black canvas). Not a data defect; **a review hazard.** Anyone auditing this canvas visually will mis-report them as missing.
3. **`5678:190` (`news1`) is hidden inside `ss_img_press21` (딜사이트)** — copy-paste residue from the 뉴스1 frame. A name search for `news1` hits the wrong outlet. Low severity; zero visual impact; **flagged against bulk-unhide** (which would render 뉴스1's mark on top of 딜사이트's).
4. **The 언론사 column carries nicknames, not names:** `조선경제`→ChosunBiz(조선비즈), `파이낸셜`→파이낸셜뉴스. **Do not use this column for attribution or display.**
5. **`press` is a category lie** for `press05` 인포스탁, `press16` IR GO, `press17` 데이터투자, `press18` 씽크풀 — data/IR vendors, not press. Defeats type inference. (Same defect class as 펌뱅킹's `bank` prefix — **file-wide pattern, worth a CORE note**: *NDS_CI prefixes name the consuming surface, not the institution type.*)
6. **`ss_img_press15` (타임앤포인트) is not a CI.** Per the `kale` rule it is NDS-set text. **It is nonetheless indistinguishable from a real logo asset in the table, in the filename, and in the frame structure.** A consumer cannot tell a real mark from a manufactured one. Relevant to the rights gap above.
7. **Dating convention is inconsistent *within one table*:** `(25/2/6 추가)` vs `(26.03.24 추가)` — **two different date formats two rows apart** (`YY/M/D` vs `YY.MM.DD`). Rows 1–18 carry **no date at all**. Per the method (`Last update: independent per page, several conventions, many absent`) — **confirmed, and here the drift is intra-page, not just cross-page.**

## Gaps / unverifiable

- **⛔ `use_figma` could NOT read this page at all.** Every attempt — `setCurrentPageAsync`, `page.loadAsync()`, and `getNodeByIdAsync` on any *child* node — failed with `Operation attempted to modify the file while in read-only mode`. Only the bare page node (`{name, type}`) was reachable. **Correlates exactly with INSTANCE presence:** 자문사 (0 instances) read fine; this page (2) and 펌뱅킹 (1) both hard-fail. Hypothesis: **hydrating remote-component instances on page load counts as a file mutation.** Correlation is 3-for-3; not proven.
- **Consequences I am naming rather than papering over:**
  - **`STRIKETHROUGH` was never checked.** Most costly here of all three pages — **row 20 is precisely the kind of line that gets struck through**, and I could not run `getStyledTextSegments(['textDecoration'])`. My row-20 transcription is from a screenshot, which would show a strikethrough at the resolution used; I saw none. **Weak evidence, not the check.**
  - **`opacity` was never read.** `get_metadata` is blind to it. **`press20`'s emptiness is therefore ambiguous: genuinely blank vs. `opacity: 0` vs. a ghosted asset.** These mean different things and I cannot separate them. Given the file-wide ghosting convention and that a defunct/blocked outlet is a textbook ghosting target, **this is a real open question, not a formality.**
  - **U+0008 (`\b`) control characters could not be byte-checked** in layer names. The `get_metadata` XML shows none; that dump is not byte-faithful.
  - **`kale`/`sia` componentKeys unresolved** — `getMainComponentAsync()` blocked. **Recorded as `unresolved`, not guessed.**
- **Everything rests on `get_metadata` + screenshots.** Counts (27 top-level, 21 press frames, 21 rows, 20 usable assets, 0 components) come from the metadata dump — authoritative for structure and type, **blind to opacity, text decoration, and keys.**
- **`press20`'s real occupant is off-page and unverified.** The file asserts Benzinga holds the name; **I did not verify that** and this page cannot tell me where. Needs a file-wide `ss_img_press20` search.
- **Re-check when write access is available:** opacity + `textDecoration` sweep, resolve `press20`'s true state, resolve the two callout keys. Until then this page is **structurally mapped and rule-complete, but not invisibility-cleared.**
