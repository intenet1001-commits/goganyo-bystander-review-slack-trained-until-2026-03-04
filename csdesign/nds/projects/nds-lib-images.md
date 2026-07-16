---
name: nds-lib-images
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=2283-9975"
learned_date: 2026-07-16
sections_studied:
  - "2283:9975 (page '    - Images' — 42 SECTION nodes, ~200k chars of metadata)"
  - "52671:2534 (section '쉐도우 그라데이션' — shadow/gradient asset catalog; the most rule-bearing section on the page)"
  - "26210:991 (section '개발전달용 ⚡️ 상품 위험ㆍ안내' — the risk-grade table assets, incl. the _old deprecation pattern)"
  - "52738:971 (section '주문')"
  - "54011:648 / 54336:30233 (sections '야간선물옵션' — two sections, IDENTICAL name, different node IDs)"
  - "70461:2173 (section '확인서 스탬프'); 70461:2254 (text '2026.01.26' — the page's only date)"
  - "18667:17916 (section '개발전달용 ⚡️ 월간나무' — the largest delivery section, 3809×7394)"
  - "42328:23664 (section '개발전달용 ⚡️ 이미지 에셋')"
  - "45802:24540 (section '개발전달용 ⚡️ 뉴스인사이트' — contains the hidden nds_img_noimg02/03 nodes)"
status: "live — carries a bare '2026.01.26' date stamp (70461:2254) on the '확인서 스탬프' section, the most recent date across the four pages learned in this batch. NOTE: this is a bare date with no 'Last update' label and no author, unlike the naming-rule and Lottie pages. It may date that one section rather than the page."
---

# NDS Library — Images

The **shipped image-asset registry** for NDS: ~2,000 asset labels across **42 sections**, organised primarily by *delivery batch* rather than by asset type. This is the page that answers "does an image for X already exist, and what is it called?"

It is the **applied counterpart to `nds-lib-img-naming-rule.md`** — that page defines the grammar, this page is the corpus. Every label here is an instance of that grammar, which makes this page the practical place to verify a name before inventing one.

## The organising principle: `개발전달용 ⚡️` (for-dev-delivery)

**33 of the 42 sections are named `개발전달용 ⚡️ <업무명>`** — "for development delivery, \<business-unit name\>". The page is a **hand-off manifest sliced by project**, not a taxonomy. Sections observed (verbatim, in canvas order):

`클라우드인증서` · `월간나무` · `미성년자 계좌게설` · `PLCC 혜택 대상 확인` · `로보 어카운트` · `GPT 뉴스레터` · `나의 자산진단` · `나무PLCC 캐시백계좌설정` · `종목탐험 - 서비스 종료` · `시세포착` · `연금TFT` · `미국주식차트주문` · `PLCC혜택관리` · `2024투자카드` · `물타기계산기` · `공통인증수단` · `적립식 서비스` · `환전하기` · `연말정산` · `비대면실명확인(모바일신분증)` · `쿠폰통합` · `상품 위험ㆍ안내` · `대출신용` · `나무팡` · `모바일계좌개설` · `홈개편 퀵윈2차` · `미국주식 주간거래 타임딜 이벤트 (타이머)` · `퇴직연금실물이전` · `이미지 에셋` · `나무고객 투자상담` · `뉴스인사이트`

Note `미성년자 계좌게설` — **`게설` is a typo for `개설`** (as `모바일계좌개설` spells it correctly). Reproduced verbatim; relevant if you ever search these section names by string.

The remaining 9 sections are type-organised: `쉐도우 그라데이션`, `주문`, `야간선물옵션` (×2), `확인서 스탬프`, and others.

**Consequence for BUILD:** to find an asset you must know *which project shipped it*, not what it depicts. There is no cross-cutting index. `개발전달용 ⚡️ 이미지 에셋` (`42328:23664`) sounds like it might be a general asset library but is just another delivery batch.

## `쉐도우 그라데이션` (`52671:2534`) — the highest-value section

The gradient/shadow overlay assets. This is the one section whose contents generalise beyond a single project.

| Asset name (verbatim) | Node | Geometry |
|---|---|---|
| `nds_img_popup_gradation01` | `59888:1045` | 540×16 |
| `nds_img_popup_gradation01_black` | `59888:1046` | 540×16 |
| `nds_img_popup_gradation/nds_img_popup_gradation02` | `56991:2474` (**symbol**) | 540×16 |
| `nds_img_monthly_gradation` | `27344:696` | 540×540 |
| `nds_list_shadow` | `28886:5779` | 540×16 |
| `nds_img_monthly_player01` | `37372:998` | 540×100 |
| `nds_img_tab_gradation01` | `27344:698` / `63027:34795` | 84×39 |
| `nds_img_tab_gradation02` | `44806:493` | 84×39 |
| `nds_img_tab_gradation03` | `45153:485` | 50×68 |
| `nds_img_tab_gradation04` | `45153:486` | 50×68 |
| `nds_img_tab_gradation05` | `49161:1691` | 50×50 |
| `nds_img_tab_gradation06` | `49161:1692` | 50×50 |
| `nds_img_tab_gradation07` | `52671:2514` | 70×40 |
| `nds_img_tab_gradation08` | `52671:2511` | 70×40 |
| `nds_img_tab_gradation09` | `63027:34930` | 70×40 |
| `nds_img_tab_gradation10` | `63027:34927` | 70×40 |
| `nds_img_tab_gradation07_black` | `56119:30116` | 70×40 |
| `nds_img_tab_gradation08_black` | `56119:30113` | 70×40 |
| `nds_img_tab_gradation09_black` | `56119:30101` | 70×40 |
| `nds_img_tab_gradation10_black` | `56119:30099` | 70×40 |

**Two conventions worth extracting:**

1. **`_black` is the dark-mode suffix, carried in the filename — not a Figma variant.** Confirmed across `nds_img_popup_gradation01_black` and `nds_img_tab_gradation07–10_black`. **This matches the Lottie page exactly** (`nds_lottie_enteraiaq_nm_black.json`), so `_black` is a **file-wide NDS convention**, not a local quirk. There is no `Darkmode` variant axis on these — you swap the *asset*, not a property.
2. **Only `07`–`10` have `_black` pairs.** `01`–`06` do not. The dark-mode coverage of the tab-gradation set is **partial**. Do not assume `nds_img_tab_gradation03_black` exists.

`nds_img_tab_gradation01`–`10` split cleanly by geometry into four shape families: `01`/`02` (84×39), `03`/`04` (50×68), `05`/`06` (50×50), `07`–`10` (70×40). Each of `07`–`10` is a frame wrapping a `Rectangle 10955` plus an `nds_icon_arrow` instance — so the tab gradations are **arrow-bearing overlays**, and only that family got dark-mode variants.

## `상품 위험ㆍ안내` (`26210:991`) — the `_old` deprecation pattern

The risk-grade table assets. Read verbatim from the caption texts:

**Category headings**: `펀드, 신탁형 ISA` · `디폴트옵션` · `채권(외화채권, 장외채권, 단기사채), RP` · `발행어음`
**Table headings**: `투자성향별 투자하기 적합한 상품 (디폴트옵션 전용)` · `투자성향별 투자하기 적합한 상품 (상품공통)`

| Current | Deprecated |
|---|---|
| `nds_img_risktable01` … `nds_img_risktable11` | `nds_img_risktable01_old` … `nds_img_risktable06_old` |

**The `_old` suffix is the deprecation convention.** Assets `01_old`–`06_old` sit alongside live `01`–`11`. One caption states the reason verbatim:

> `(위험등급 개정으로 nds_img_risktable01 와 동일)`
> *("identical to nds_img_risktable01 due to the risk-grade revision")*

So `risktable07` is now byte-identical to `risktable01` after a regulatory revision, but **both are retained under distinct names.** Do not dedupe NDS assets by visual identity — as with the colour tokens in `nds-mweb-colors` (slots 1 and 2 sharing `#2C363B`), **two assets that look identical are still two tokens.**

Note `_old` is a **third** naming convention not documented on the Img Naming Rule page (which covers `nds`/`ms`/`ss`/`biz`/`squad`/`lottie` prefixes and `sn`/`nn`/`sd`/`nd` suffixes, but **not `_old` or `_black`**). See Conflicts.

## Name-reliability verdict: **MIXED**

Determined for this page specifically:

- **Asset-identifier layers are RELIABLE.** `nds_img_tab_gradation07`, `nds_img_risktable01_old`, `nds_img_roboaccount11` etc. are accurate and conform to the Image Naming Rule grammar. You can trust these from metadata.
- **Caption/heading TEXT nodes are UNRELIABLE — 36 of them are literally named `title`.** Their real contents, read via `characters`, range from meaningful (`투자성향별 투자하기 적합한 상품 (디폴트옵션 전용)`, `nds_img_popup_gradation01`) to pure noise (**`🥳`** at `18674:1156`, **`😱`** at `18674:1157`). The layer name `title` carries zero information.
- This is the **same placeholder-`title` corruption as the Lottie page** — but here it coexists with a reliable asset-name layer set, which is why the verdict is *mixed* rather than *unreliable*.

**Rules embedded in screenshot images?** **No.** Swept for `스크린샷` / `Screenshot` node names across the full ~200k-char dump: **zero hits.** This page is built from real vector/frame/text nodes throughout — a genuinely favourable case, and a correction to the expectation that pasted images would be involved.

## ⚠️ Hidden nodes — recorded as unverified, NOT quoted as rules

**7 nodes carry `hidden="true"`.** Per the hazard, these render as blank 1×1 PNGs and their names must **not** be quoted as live rules:

| Node | Name | Section |
|---|---|---|
| `36619:4322` | `nds_infographic13` | `개발전달용 ⚡️ 모바일계좌개설` |
| `36619:4335` | `nds_infographic11` | `개발전달용 ⚡️ 모바일계좌개설` |
| `36619:4364` | `nds_infographic74` | `개발전달용 ⚡️ 모바일계좌개설` |
| `36619:4365` | `nds_infographic29` | `개발전달용 ⚡️ 모바일계좌개설` |
| `45802:24602` | `nds_img_noimg03` | `개발전달용 ⚡️ 뉴스인사이트` |
| `45802:24656` | `nds_img_noimg02` | `개발전달용 ⚡️ 뉴스인사이트` |
| `45802:24657` | `nds_img_noimg03` | `개발전달용 ⚡️ 뉴스인사이트` |

`nds_img_noimg02` / `nds_img_noimg03` look like **empty-state / no-image placeholder assets** — plausibly high-value. **Their existence and status are unverified.** Action: unhide and re-check `45802:24656`, `45802:24657`, `45802:24602` before relying on any no-image placeholder. Note `nds_img_noimg03` appears **twice** (`45802:24602` as TEXT, `45802:24657` as a rounded-rectangle) — likely a label/asset pair, both hidden together.

The four hidden `nds_infographic*` nodes are the same infographic components catalogued on the Lottie page — hidden here, presumably an abandoned layout.

## componentKeys

**No new keys captured for CORE from this page.** The instanced components here are almost entirely `nds_infographic*` — the same `remote: false` **master** components already inventoried in `nds-lib-lottie-animation.md`, with the same keys. Re-listing them would duplicate, not add.

> **Corrected.** An earlier draft described the `remote: false` components below as "page-local documentation artifacts". **That framing was wrong** — `NDS_Library` is the home library, so `remote: false` means **master defined here**, not doc re-creation. See `nds-lib-layout.md` §componentKeys for the full corrected classification rule (including the fact that this file **subscribes to itself**, which makes some `remote: true` entries stale snapshots of its own components).

The page's own content is overwhelmingly **not components**: it is TEXT labels, `rounded-rectangle` asset stand-ins, `vector`s and `frame`s. Two `symbol` (COMPONENT) nodes were observed in the shadow-gradient section — `remote: false`, i.e. masters defined in this file:

| Name | Node | KIND |
|---|---|---|
| `nds_img_popup_gradation/nds_img_popup_gradation02` | `56991:2474` | COMPONENT |
| `ss_btn_interest` | `59686:661`, `59686:662` | COMPONENT |

**I did not run a `use_figma` component sweep across all 42 sections** — see Gaps. Any keys quoted above are `unverified` (read-only session).

`ss_btn_interest` is notable for a different reason: it uses the **deprecated `ss` prefix** that the naming rule says is `앞으로는 사용하지 않는` (not for future use), yet it is present as a live component. Consistent with the rule's own carve-out (`이전에 이미 반영된 이미지에 한하여 유지합니다`).

## Conflicts (for LEDGER)

1. **`_black` and `_old` are undocumented naming conventions.** The Img Naming Rule page (`39:58`) is presented as the complete grammar and defines prefixes (`nds`/`ndsw`/`ex`/`event`/`ms`/`ss`/`biz`/`lottie`) and the `sn`/`nn`/`sd`/`nd` status suffixes. It **does not mention `_black`** (dark mode) or **`_old`** (deprecated), yet both are in active, systematic use here *and* `_black` is used on the Lottie page. **The naming spec is incomplete relative to the shipped corpus.**
2. **Two sections share the name `야간선물옵션`** — `54011:648` (338×282) and `54336:30233` (338×328). Different node IDs, different sizes, identical names, adjacent on canvas. One is probably superseded, but **neither is marked `_old`**, so there is no way to tell which from the page. Same failure mode as the duplicated `line_section` publish on the Layout page.
3. **`nds_img_risktable07` is documented as byte-identical to `nds_img_risktable01`** (`위험등급 개정으로 nds_img_risktable01 와 동일`) while retaining a distinct name. Intentional, but a hazard for any asset-dedupe tooling.
4. **The date stamp is anomalous in form.** `2026.01.26` (`70461:2254`) is a **bare date** — no `Last update` label, no author. Contrast `- Img Naming Rule` (`Last update  2023.06.26  우채희`) and `- Lottie animation` (`Last update  2025.11.14  유상엽`), which both follow a `Last update <date> <author>` convention. It also sits on the `확인서 스탬프` section rather than a page header. **It may date that section, not the page.** Recorded as the page's status evidence with that caveat rather than treated as an equivalent stamp.
5. **Section-name typo**: `개발전달용 ⚡️ 미성년자 계좌게설` — `게설` should be `개설`.
6. **`ss_btn_interest` uses the deprecated `ss` prefix** as a live component. Permitted by the rule's legacy carve-out, but worth flagging if `ss` is ever swept for removal.

## Gaps / unverifiable

- **I did not read all ~2,000 asset labels.** The `get_metadata` dump is ~178k chars / 1,828 lines across 42 sections; I read the full top-level section inventory and drilled into `쉐도우 그라데이션` (`52671:2534`) and `상품 위험ㆍ안내` (`26210:991`) in detail, plus swept every TEXT node's verbatim `characters` for `title`-named nodes and date stamps. **The other 40 sections are inventoried by name only.** Their individual asset lists are unread. This is a deliberate scope call — the page is a per-project delivery log and the conventions generalise; the individual project batches largely do not.
- **No section was screenshotted.** Name reliability was established from the `characters`-vs-`name` comparison (36 nodes named `title` with divergent content), which is decisive on its own, and the `스크린샷`-sweep ruled out pasted-image specs. But **the visual content of the assets themselves is unverified** — I know their names and geometry, not what they depict. `쉐도우 그라데이션`'s asset appearances in particular are asserted from names + dimensions only.
- **The 7 `hidden="true"` nodes are unverified** (see table above). `nds_img_noimg02`/`03` are the ones worth unhiding.
- **componentKey sweep not run across all 42 sections.** A `use_figma` pass over the whole page would likely surface published (`remote: true`) assets I have not catalogued. If CORE needs image-asset keys, that sweep is the next step.
- **Whether the `2026.01.26` stamp dates the page or only `확인서 스탬프` is unresolved.** No other date exists on the page to triangulate against.
- **Underscore-limit compliance unverified.** The naming rule caps underscores at 5; `nds_img_popup_gradation/nds_img_popup_gradation02` contains a `/` (a Figma component-path separator, not part of the filename) and several labels approach the limit. I did not sweep the corpus against rule 1.

## How this feeds BUILD mode

- **Check this page before inventing an image name.** ~2,000 assets already exist; the odds that your asset is already drawn are good.
- **Search by project, not by subject.** The organising key is `개발전달용 ⚡️ <업무명>`. There is no subject index.
- **`_black` = dark mode, `_old` = deprecated — both are filename suffixes, not variant properties.** You swap the asset file; there is no property to set. Neither is in the naming spec, so don't expect the spec to confirm them.
- **Dark-mode coverage is partial.** `nds_img_tab_gradation07`–`10` have `_black` pairs; `01`–`06` do not. Verify a `_black` sibling exists before assuming it.
- **Never dedupe NDS assets by visual identity** — `risktable07` ≡ `risktable01` by pixels but not by identity. Same principle as the colour tokens sharing `#2C363B`.
- **Standard overlay geometry is 540 wide** (`nds_img_popup_gradation01` 540×16, `nds_list_shadow` 540×16) — consistent with the 540×987 screen from `nds-lib-layout.md`. The 16px gradient height is the house shadow/fade depth.
- **Treat `nds_img_noimg02`/`03` as the likely empty-state assets, but confirm first** — they are hidden and unverified.
