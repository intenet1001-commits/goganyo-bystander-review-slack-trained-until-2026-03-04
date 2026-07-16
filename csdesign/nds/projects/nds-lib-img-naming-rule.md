---
name: nds-lib-img-naming-rule
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=39-58"
learned_date: 2026-07-16
sections_studied:
  - "39:58 (page '    - Img Naming Rule' — exactly two top-level frames, both layer-named 'Image_Naming_Rule')"
  - "16735:15409 (frame — ON-CANVAS heading '공통 규칙' / subtitle 'QV-NM Image Naming Rule'. The 3 universal rules. Carries 'Last update 2023.06.26 우채희'.)"
  - "16735:15509 (frame — ON-CANVAS heading 'Image Naming Rule' / subtitle 'QV-NM Image Naming Rule'. The 6 prefix grammars: nds / ms / ss / biz / squad / lottie.)"
  - "16735:15434 (text — 'Last update 2023.06.26 우채희')"
status: "live — the authoritative naming spec, cited by name from the Lottie page ('*이미지 네이밍 룰에 따름', 2025-11-11 policy). Its own stamp reads 2023.06.26, but sections dated later (biz, squad, lottie) were appended without bumping it — see Conflicts."
---

# NDS Library — Image Naming Rule

The **authoritative filename grammar for every image, icon, illustration and Lottie asset in NDS.** This page is load-bearing well beyond its own scope: the `- Lottie animation` page explicitly defers to it (`25.11.11 이후 전달되는 로띠 파일명은 *이미지 네이밍 룰에 따름`), and the `- Images` page's asset labels are all instances of this grammar.

**The whole spec is live editable text — not a pasted screenshot.** This is worth stating because `- Img Naming Rule` is exactly the page type where the entire spec is usually a pasted image. It is not, here. Everything below was read from real TEXT nodes and confirmed against a screenshot.

## The 3 universal rules (`16735:15409`, on-canvas heading `공통 규칙`)

Under the sub-heading `공통 네이밍 규칙`, transcribed **verbatim**:

> 1. `'_' (언더바)는 5개를 넘지 않도록 한다.`
> 2. `영문대문자, '-'(하이픈), 특수문자, 국문 사용 금지`
> 3. `⭐️중요⭐`
>    `신규 리소스 네이밍이 규칙에 어긋날 경우, 디자인팀에 검수 요청!`

In English, for BUILD use — but **always emit the Korean-sourced rule, never a paraphrase, when quoting to a designer**:

1. No more than **5 underscores**.
2. **Forbidden**: uppercase Latin letters, hyphens (`-`), special characters, and Korean characters. → filenames are **lowercase ASCII + digits + underscore only**.
3. If a new resource's name breaks the rules, **request review from the design team**.

Rule 2 is the one most likely to be violated silently by code generation. Note it bans **국문** (Korean) in filenames — even though every *label* on these pages is Korean.

## The 6 prefix grammars (`16735:15509`, on-canvas heading `Image Naming Rule`)

Each prefix gets a title row, a rationale, a slot grammar, and an `ex)` block. Transcribed cell by cell.

### `nds` (기본) — default

> `디폴트 네이밍 룰.`
> `* 새로이 추가되는 이미지에는 nds를 사용하여 기존 이미지(ss)와 구분합니다.`

Two sub-grammars, distinguished by the second slot:

**`icon` — `텍스트옆에 들어가가나, 단독으로 사용되어 버튼 역할을 하는 이미지`** (images placed beside text, or used alone as a button):

```
nds _ icon _ example _ type ...
             (업무명, 아이콘명)   ((컬러넘버)(방향)(크기))
```

**`img` — `업무단위로 사용되는 일러스트 혹은 icon에 포함되지 않는 이미지들`** (illustrations used per business unit, or images not covered by `icon`):

```
nds _ img _ example _ ...
            (업무명(구분)(넘버링))
```

**Prefix substitutions** (verbatim, these replace `nds` — they do **not** stack):

| Replacement | Rule (verbatim) |
|---|---|
| `ndsw` | `웹화면 전용 이미지는 nds 대신 ndsw로 사용합니다.` |
| `ex` | `외부프로젝트는 nds 대신 ex로 사용합니다.` |
| `event` | `이벤트 이미지는 nds 대신 event로 사용합니다.` |

`ex)` block — transcribed by column:

| `기본` | `사이즈, 색상, 방향 구분 있는 경우` | `기본` (img) |
|---|---|---|
| `nds_icon_filter` | `nds_icon_shopping_h34` | `nds_img_account_top` |
| `nds_icon_account01~08` | `nds_icon_arrow05_l24` | `nds_illust01` |
| `ndsw_icon_account01~08` | `ndsw_btn_check_sn/nn` | |
| `ex_tax_intro01` | | |
| `event_olyimpic_intro01` | | |

Note `event_olyimpic_intro01` — **`olyimpic` is a typo for `olympic` in the guide's own example.** It is reproduced here verbatim as required; do not "fix" it when matching existing assets, but do not propagate it to new ones either.

The `type` slot decodes as `(컬러넘버)(방향)(크기)` — colour-number / direction / size. `nds_icon_arrow05_l24` = arrow, colour-number `05`, `l` direction, size `24`. **`컬러넘버` is the same ColorNumber concept decoded in `nds-mweb-colors`** — channel-dependent, not a hex. `h34` in `nds_icon_shopping_h34` is a height.

### `ms` (버튼) — multi status

> `여러 상태값이 존재하는 이미지에 사용하는 네이밍 룰`
> `* ms : multi status`

```
ms _ btn _ example _ sn/nn/sd/nd
           (업무명, 아이콘명(타입))
```

The **status suffix table**, transcribed verbatim — this is the highest-value grid on the page:

> `sn = select normal : 선택된 활성화`
> `nn = non-select normal : 디폴트 일반값`
> `sd = select disable : 선택된 비활성화`
> `nd = non- select disable :선택되지 않은 비활성화`

(The source's spacing irregularities — `non- select`, the missing space after `:` — are reproduced as-is.)

| Suffix | Expansion | Korean (verbatim) | Meaning |
|---|---|---|---|
| `sn` | select normal | `선택된 활성화` | selected + enabled |
| `nn` | non-select normal | `디폴트 일반값` | **the default** |
| `sd` | select disable | `선택된 비활성화` | selected + disabled |
| `nd` | non-select disable | `선택되지 않은 비활성화` | unselected + disabled |

**`nn` is the default state** — stated outright (`디폴트 일반값`). When you need one asset from an `ms_` set and have no state information, reach for `nn`.

Prefix substitution: `ndsw` — `웹화면 전용 이미지는 ms 대신 ndsw로 사용합니다.` (note: replaces **`ms`**, not `nds`, in this section).

`ex)`: `ms_btn_sharetype01_sn` / `ms_btn_sharetype01_nn` / `ms_btn_favsolid07_sn` / `ms_btn_favsolid07_nn` / `ms_btn_cart_sn` / `ms_btn_cart_nn`.

Every example ships as an `sn`/`nn` **pair** — `sd`/`nd` are defined but never exemplified.

### `ss` (기존) — legacy, single status

> `앞으로는 사용하지 않는 네이밍 룰입니다. 이전에 이미 반영된 이미지에 한하여 유지합니다.`
> `* ss : single status`

**Deprecated.** Not for new work; retained only for already-shipped images.

`ex)`: `ss_img_com_nm_illust01` / `ss_img_menu_speed` / `icon_comm_power_line6_h34`.

The third example, `icon_comm_power_line6_h34`, has **no prefix at all** — it predates even `ss`. Expect bare `icon_*` names in old code.

### `biz`

> `카카오뱅크 채권, 트래블월렛 rp 등 제휴서비스에서 사용하는 네이밍 룰입니다.`

For partner/affiliate services (KakaoBank bonds, TravelWallet RP, etc.).

`ex)`: `biz_img_` — **the example is a bare stub with nothing after the second underscore.** Blank at source; recorded as such.

### `squad`

> `온보딩, 고객가치향상, 연금 스쿼드 등에서 사용하는 네이밍 룰입니다.`

Squad-owned assets. The `ex)` block is a two-column mapping, transcribed row by row:

| Squad (verbatim) | Pattern (verbatim) |
|---|---|
| `통검 스쿼드` | `nds_img_searchsq01~` |
| `금연성장 스쿼드` | `nds_img_productsq01~` |
| `고객가치향상 스쿼드` | `nds_img_valuesq01~` |
| `온보딩 스쿼드` | `nds_img_onboardingsq01~` |

The convention is `nds_img_<squad-slug>sq<NN>` — the literal `sq` marker plus two-digit numbering. Note the slug does **not** transliterate the Korean name (`금연성장` → `product`, `고객가치향상` → `value`) — **you cannot derive the slug from the squad name; use this table.**

### `lottie`

> `로띠에서 사용하는 네이밍 룰입니다.`

```
nds _ lottie _ example _ ...
```

Prefix substitution: `event` — `이벤트 로띠는 nds 대신 event로 사용합니다.`

`ex)` (`로띠형식`): `nds_lottie_target_banner_~.json` / `nds_lottie_infographic66.json` / `nds_lottie_pensionsq01~.json` / `event_lottie_hidden01~.json`.

**This section is the pivot cited by the Lottie page's 2025-11-11 policy.** `nds_lottie_infographic66.json` corroborates the Lottie page's `4개` finding — `66` is `전구`, one of only four animated infographics.

## Name-reliability verdict: **RELIABLE**

Determined for this page by screenshotting `16735:15409` and `16735:15509` and comparing against the metadata dump. Layer names **exactly match** their rendered text, including the long rule strings (`'_' (언더바)는 5개를 넘지 않도록 한다.` is both the layer name and the content) and the Korean labels. There is **no** placeholder-`title` corruption, **no** `\x08` corruption, and **no** demo copy.

**This makes `- Img Naming Rule` the one page of the four in this batch that can be trusted from metadata alone.** It is the exception, not the pattern — `- Layout`, `- Lottie animation` and `- Images` all lie in different ways.

**Rules embedded in screenshot images?** **No.** Swept for `스크린샷` / `Screenshot` node names: zero hits. The whole spec is live text. This contradicts the prior expectation that this page's spec would be a pasted image — recorded as a correction.

## componentKeys

**None.** This page contains no `INSTANCE`, `COMPONENT`, or `COMPONENT_SET` nodes — it is entirely TEXT, FRAME, LINE and ROUNDED-RECTANGLE. Nothing to import.

## Conflicts / internal inconsistencies

1. **The `Last update` stamp is stale relative to its own content.** `16735:15434` reads `Last update  2023.06.26  우채희`, but that stamp sits on the `공통 규칙` frame (`16735:15409`). The main grammar frame (`16735:15509`) has **no stamp of its own** and demonstrably contains later additions: the `lottie` section is referenced by a **2025-11-11** policy on the Lottie page, and `biz` / `squad` / `lottie` occupy node-ID ranges (`59517:*`, `63385:*`, `65538:*`, `66561:*`) far above the 2023-era `16735:*` block. **Sections were appended without bumping the stamp.** Do not read `2023.06.26` as this page's real currency.
2. **`Lottie` vs `lottie` case mismatch.** The layer name of the section title is `Lottie` (`65538:34625`), but the rendered on-canvas text is lowercase `lottie`. Trivial in itself — but rule 2 bans uppercase in filenames, and the section titles `nds`/`ms`/`ss`/`biz`/`squad` are all lowercase. `Lottie` (layer) is the odd one out. The **rendered** text is consistent; only the layer name deviates.
3. **`squad` section title vs prefix.** The on-canvas title reads `squad` / `Squad` (layer name `Squad`, `63385:2155`), but **no asset in the `ex)` table actually uses a `squad_` prefix** — they all use `nds_img_...sq01~`. So `squad` names a *convention*, not a prefix slot, unlike `nds`/`ms`/`ss`/`biz`/`lottie` which are literal prefixes. **The section is misleadingly titled**; treat `squad` as "the squad numbering convention within `nds_img_`".
4. **`biz` example is an unfinished stub** (`biz_img_`). Blank at source.
5. **The guide's own example contains a typo**: `event_olyimpic_intro01` (should be `olympic`).

## Gaps / unverifiable

- **The `...` slot terminator** appears in the `nds_icon`, `nds_img`, and `nds_lottie` grammars (`16755:16588`, `16755:16590`, `66561:25826`). It signals "further optional slots" but **is never enumerated**. The `type` slot is annotated `(컬러넘버)(방향)(크기)` but the closing `...` beyond it is undefined. Blank at source.
- **`sd` / `nd` have no examples** anywhere in the `ms` block — defined but unexemplified. Whether any `sd`/`nd` asset actually ships is unverified.
- **The 5-underscore limit (rule 1) is not obviously enforced.** `nds_lottie_target_banner_~.json` has 4; `nds_lottie_enteraiaq_nm_black.json` (from the Lottie page) has 4. I did not sweep the `- Images` page's ~2,000 asset labels against the limit. **Unverified** whether any shipped asset violates rule 1.
- **Rule 2 bans uppercase**, yet the Lottie page carries a section heading `📌 NMnds_img_target_banner(Lottie)` (`59463:14001`) containing `NM` and parentheses. That string is a **Figma annotation label, not a filename**, so it is very likely not a violation — but I could not confirm the underlying asset's real filename. Flagged as low-confidence, not a conflict.
- No `hidden="true"` nodes on this page.

## How this feeds BUILD mode

- **Filenames are lowercase ASCII + digits + underscore. Always.** No uppercase, no hyphens, no Korean, no special characters, ≤5 underscores.
- **Pick the prefix by asset role first**: `nds` (default) → `ms` (multi-state button) → `lottie` (animation) → `biz` (partner) → `ss` (**never for new work**).
- **Then apply the substitution, which replaces the prefix rather than stacking**: web-only → `ndsw`; external project → `ex`; event → `event`.
- **For `ms_` assets with unknown state, use `nn`** — the guide names it `디폴트 일반값`.
- **Squad slugs are not derivable from squad names** — use the table (`금연성장` → `product`, `고객가치향상` → `value`).
- **A Lottie and its source illustration share a stem, differing by extension** (`nds_infographic66` → `nds_lottie_infographic66.json`).
- **When a name doesn't fit the grammar, the guide's own instruction is to escalate**: `신규 리소스 네이밍이 규칙에 어긋날 경우, 디자인팀에 검수 요청!` — do not invent an extension to the grammar.
