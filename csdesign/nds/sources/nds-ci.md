# LEARN forensics — NDS_CI

- **fileKey**: `KmpaYeoYh41F6nyIKvBQ7h`
- **source_url**: https://www.figma.com/design/KmpaYeoYh41F6nyIKvBQ7h/NDS_CI?node-id=2581-296
- **learned_date**: 2026-07-16
- **Enumeration method**: `use_figma` → `figma.root.children` (the only authoritative source)
- **Total pages**: **16**
- **Content pages (denominator)**: **13**
- **Skipped**: 3 — all three `---` separators, **each probed and confirmed genuinely empty** (`<canvas … />`, no children)

> **What this file is:** NH투자증권's **corporate-identity / logo asset library** — third-party institution logos
> (banks, brokerages, public agencies, media, advisories) plus stock/ETF CI, organised by institution type.
> It is **not** a UI component library like `NDS_Library`. Expect asset inventories + a production guide, not
> component specs.
>
> **It fills a known coverage hole:** `LEDGER` recorded `NDS_StockIcon_CI` as "a named library outside the learned
> set". `CORE.md` Gotcha 14 also carries a brand rule sourced from NDS_Library's Icons page —
> `브랜드 로고의 메인 컬러는 Deep Blue 입니다. Deep Blue(#002A41)는 바탕색으로 사용하지 않습니다. 필요한 경우
> Dark Blue(#064367) 를 대신 사용합니다.` — whose authoritative home is plausibly **this file's
> `⭐️CI 제작 가이드⭐️` page**. Cross-check it; a contradiction there is a LEDGER item.

## Triage notes — what the probes actually showed

Unlike `NDS_Library` (where name-based triage failed in three directions), **this file's separators are honest**:

| Page | Probe result | Action |
|---|---|---|
| `---` ×3 (`3720:905`, `3720:906`, `3720:908`) | `<canvas … />` — **zero children** | ✅ skip, confirmed empty |
| `export` (`825:4`) | **11,113,062 chars** — `get_metadata` overflowed by ~100× | **learn** — the largest page in this domain to date |

**Still probed rather than assumed.** NDS_Library's blank-named page looked like a separator and held the
`guide_parent` set + the library's ordering rationale. The cost of probing is one call; the cost of assuming was
nearly a 4-page miss. **Do the same on any future pass.**

⚠️ **`export` at 11.1M characters is ~93× the size of NDS_Library's biggest page (119k).** A single
`get_metadata` cannot be read back naively — it must be parsed from the auto-saved dump in chunks with a python
line/indent parser (**not ElementTree** — non-strict XML; an unescaped `&` breaks it). **Do not loop narrower
`get_metadata` requests** to work around it.

## Page manifest (verbatim from `figma.root.children`, 2026-07-16)

| # | nodeId | Name | Class | Note |
|---|---|---|---|---|
| 1 | `2581:296` | `⭐️CI 제작 가이드⭐️` | **content** | ⭐ the rules page — highest value |
| 2 | `3720:905` | `---` | skip | probed: empty |
| 3 | `109:25310` | `국내주식` | **content** | domestic-stock CI |
| 4 | `1422:236` | `해외주식` | **content** | overseas-stock CI |
| 5 | `3179:310` | `ETF` | **content** | |
| 6 | `3323:345` | `Archive` | **content** | status must be evidenced, never inferred from the name |
| 7 | `3720:906` | `---` | skip | probed: empty |
| 8 | `511:2` | `은행/증권/기관` | **content** | bank/brokerage/institution logos |
| 9 | `1251:2` | `간편인증기관` | **content** | simple-auth providers |
| 10 | `1255:2` | `공공기관` | **content** | public agencies |
| 11 | `3368:19` | `펌뱅킹` | **content** | firm banking |
| 12 | `3618:27` | `언론사` | **content** | media outlets |
| 13 | `5482:2131` | `자문사` | **content** | advisory firms |
| 14 | `3720:908` | `---` | skip | probed: empty |
| 15 | `2827:323` | `은행/증권/기관 Archive` | **content** | archive — evidence, not the name |
| 16 | `825:4` | `export` | **content** | ⚠️ **11.1M chars** |

**Coverage: 13 content pages. 3 skipped, each probed.**

## Registry rows

_(filled in as notes land — one row per learned page)_

| Page | Note | Status (+ evidence) |
|---|---|---|
| `⭐️CI 제작 가이드⭐️` | nds-ci-production-guide.md | **live** — two per-frame stamps: `Last update  2024.02.27 Moana`, `Last update  2024.08.30 Viviana, Moana` [sic, double space]. ⚠️ **No page-level stamp**; node-id stratigraphy (4709:/5160:/5377:/5855:/6313: all ≫ 3867:) proves later edits no stamp covers |
| `국내주식` | nds-ci-domestic-stock.md | live |
| `해외주식` | nds-ci-overseas-stock.md | live |
| `ETF` | nds-ci-etf.md | live — ⚠️ **but NOT the current state of ETF design**; the `Archive` page holds newer work |
| `Archive` | nds-ci-archive.md | **unknown** — refused `deprecated` in BOTH directions. Contents are **newer** than live ETF (node block 6508 vs 5735; screenshots 2026-07-08; notes 7/13). No live page defines itself against it — and that mechanism exists in this file, so its absence is meaningful |
| `은행/증권/기관` | nds-ci-banks-brokerages.md | live — content revision stamps `240328` |
| `간편인증기관` | nds-ci-simple-auth.md | live |
| `공공기관` | nds-ci-public-agencies.md | live |
| `펌뱅킹` | nds-ci-firm-banking.md | **unknown** — zero dates anywhere; even the 케이뱅크 CI *change* is undated |
| `언론사` | nds-ci-media.md | **live** — inline `(25/2/6 추가)`, `(26.03.24 추가)`, `(26.03.24 유유리 팀장님)`. ⚠️ **invisibility UNCLEARED** — page unreadable via Plugin API read-only |
| `자문사` | nds-ci-advisory.md | **unknown** — zero dates. ⚠️ Highest node id = created LAST, but **node id orders creation, not maintenance** — hypothesis tested and refuted |
| `은행/증권/기관 Archive` | nds-ci-banks-brokerages-archive.md | **superseded** — three independent strands: live quotes it as `구 버전 CI`; live's 구 버전 exemplars are this page's node generation; content dates 230705/240320 < live 240328/240328 |
| `export` | nds-ci-export.md | **unknown** — NO stamp of any kind; all 442 TEXTs swept for `last update|업데이트|수정일` → **zero**. Absence verified, not merely unfound. Only liveness evidence: 32,747 internally-consistent x2 export settings |

## What this pass changed in the domain

**New CORE gotchas** — **17** (`get_metadata` silently omits children — undermines a method step) · **18**
(invisibility mechanism #6: full occlusion by a self-nested duplicate) · **19** (prefixes name the surface, not the
entity; names aren't unique keys) · **20** (`node.opacity` throws on SLICE; `node.screenshot()` blocked read-only;
`findAll` can trip the read-only guard where `findAllWithCriteria` succeeds).
**New CORE sections** — NDS_CI in the Libraries table (**not a component library**); the 8 default CI sets; the CI
production rules, layer-stack contract, clear-space spec, and per-asset-class naming grammar.
**Refuted, and left alone** — **NDS_CI is NOT the home of the Deep Blue brand rule** (Gotcha 14). Zero hits for
`Deep Blue`/`002A41`/`064367`/`브랜드 로고` across all 93 TEXTs. **Scope mismatch, not a gap:** every colour rule
here governs *background/container* treatment, and **not one governs a foreground mark's own colour** — because
these are *third-party* logos whose colour belongs to 농협/애플, not NH. **Gotcha 14 stays sourced to NDS_Library
`39114:271`; there is no firsthand source to promote it to.**
**Cross-file proof** — NDS_CI **consumes** NDS_Library: its `nds_flag` instance resolves via
`getMainComponentAsync()` → parent SET `d81573482ffbff1e5076384753d483a3072d775f`, matching `nds-lib-icons.md`
byte-for-byte. First time that relationship was demonstrated rather than assumed.

## Method notes for the next pass on this file

- **`get_metadata`-empty ≠ empty.** See Gotcha 17. Confirm with the Plugin API before skipping anything.
- **Guard opacity sweeps with try/catch** — `node.opacity` throws on SLICE (Gotcha 20).
- **Prefer `findAllWithCriteria` over `findAll(predicate)`** — the latter tripped the read-only guard on 펌뱅킹
  where the former succeeded. **언론사 is genuinely unreadable read-only either way.**
- **Keyword greps get the archive pages exactly wrong.** Every hit was a false positive: `old` inside **`Semibold`**;
  `중단` inside **a fake news headline in a mockup**; `이전` meaning "prior to" — *in the newest content on the page*.
  **Status came from cross-page comparison, never from self-marking or greps.**
- **Named gaps, not papered over:** 언론사 + press20 invisibility uncleared · ~90 pasted phone screenshots on
  `Archive` unread (**provenance caution — they look like competitor captures, Toss/KODEX-style**) · the 150 dropped
  bank codes not chased to the 4 sibling institution pages (**cheap next step, settles
  `#ci-banks-dropped-codes`**) · 2,457 badges not visually verified (`node.screenshot()` blocked read-only) · the
  K bank match is visual, not byte-exact.
- **Open question for whoever owns live `ETF` (`3179:310`): did the 프리텐다드 vs 산돌 격동고딕 decision land?**
  That closes `#ci-archive-is-the-newest-work`.

