---
name: nds-lib-illusts
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=1165-16606"
learned_date: 2026-07-16
sections_studied:
  - "1165:16606 (page '    - Illusts' — canvas root; 296 COMPONENTs, 1 COMPONENT_SET, 7 SECTIONs)"
  - "74388:5388 (COMPONENT_SET 'nds_illust' — 280 variants = 140 illustrations x NM/N2 on/off)"
  - "64681:2458 (frame 'illustration Asset Usage' — on-canvas heading '(NEW) illustration Asset Usage'; carries 'Last update 2025.10.24 유상엽' — the FRESHEST stamp in the file)"
  - "64681:43 / 64681:44 / 65196:2261 (the 25.06~ new-illustration-source rules; on-canvas '카테고리별 신규 제작 일러스트 소스(25.06~)')"
  - "28451:194 (TEXT 'Tax(참고불가)' — an explicit do-not-reference marker over the tax illustration group)"
  - "20810:999 (TEXT '📌 nds_illust ( X1배수 전달 )' — the legacy nds_illust export rule, CONTRADICTS the new usage card)"
status: "live — FRESHEST page in my set: 'Last update 2025.10.24 유상엽', plus an explicitly (NEW)-badged usage card and a 25.06~ new-source programme. 296 local (remote:false) source COMPONENTs. NOT inferred from the page name."
---

# NDS_Library — "    - Illusts" page

The 80–200px asset class (per the `🌈 Graphic asset` index: `QV/NM BI를 고려한 비주얼 일러스트 입니다. / 추천 사이즈 : 80 ~ 200`). **This is the most actively-maintained page I studied** — and the only one where a **newer process visibly supersedes an older one on the same canvas.** That supersession is the headline finding.

## Name-reliability verdict: MIXED — three coexisting generations of naming

The page holds **at least three naming generations side by side**, and telling them apart is the whole job:

1. **`nds_illust##`** — the current canonical set (140 illustrations, one COMPONENT_SET). **RELIABLE.**
2. **`ss_img_com_qv_illust##` / `QV/ss_img_693j_illust13` / `nds_img_tax_##` / `QV|NM/nds_img_account_top`** — **legacy**, channel-prefixed, inconsistent. Ten `ss_img_com_qv_illust32`–`41` survive. **Names are reliable-as-identifiers but the scheme is dead.**
3. **`기본/_illust126`…`기본/_illust145`** — TEXT *labels*, **not components**, using a third scheme (`기본/_illust###`) that matches nothing else on the page. **UNRELIABLE — do not read these as component names.**

Plus the usual noise: `moana`, `viviana`, `su`, `sia`, `ys` INSTANCEs are **designer avatar/handle stamps, not assets**; `퍼블렉시티` ("Perplexity", misspelled), `_레이어_1`, `모양 38/39` are hidden Illustrator-import residue.

**Rules are NOT embedded in pasted screenshot images** — all rule text is live TEXT. But once again the `Last update` line is **low-contrast dark-on-dark** and required a render to read. **Third page in a row where meaning hides behind fill color.**

## Verbatim rules

### `(NEW) illustration Asset Usage` (`64681:2458`) — screenshot-transcribed, THE current process

On-canvas heading `(NEW) illustration Asset Usage`, subtitle `QV-NM Infographic Usage` **[sic — see LEDGER]**, under `사용방법`:

> 1. `복사 후 필요한 사이즈에 맞춰 사용`
> 2. `유닛 일러스트, 배리에이션 요소는 필요에 따라 조합하여 사용 가능`
> 3. `파일명은 이미지 네이밍 룰을 기준으로 최종 산출물 목적에 맞춰 변경`
> 4. `필요 배수로 추출 후 Tiny.png에서 압축해 개발전달`

Footer: **`Last update  2025.10.24  유상엽`**

Note step 2: **unit illustrations and variation elements may be COMBINED as needed** — illustrations are compositional here, unlike icons/emoji which are atomic. And step 4 says **`필요 배수`** (whatever multiple you need) — deliberately *not* a fixed multiplier, unlike Infographic's `80*80을 2배수` or Nmoji's `40에 2배수`.

### The `25.06~` new-source programme (verbatim)

> `카테고리별 신규 제작 일러스트 소스(25.06~)` (`64681:43`)
> `기존 NDS 일러스트 에셋과 별도 구분 사용(nds_img_~)` (`64681:44`)

→ **New illustrations from 2025.06 onward are a separate, category-organised source, to be kept distinct from the legacy `nds_img_~` assets.**

### The hard constraint (`65196:2261`) — highest-consequence rule on the page

> `일러스트 비율 / 컬러 임의 변경 X 이미지 공통으로 사용될 경우 NDS 일러스트로 등록 후 사용 필요 (디자인팀 문의 필수 담당자 유상엽)`

→ **Do NOT arbitrarily change an illustration's ratio or color.** If an image is to be used commonly, it **must be registered as an NDS illustration first**. **디자인팀 문의 필수**, owner **유상엽**. (The ` ` is a line-separator character in the source string.)

**This directly constrains any BUILD pass: illustrations are not free to recolor or restretch.** Contrast icons, which are explicitly color-parameterised via 컬러넘버.

### The legacy export rule (`20810:999`)

> `📌 nds_illust ( X1배수 전달 )`

→ **`nds_illust` assets deliver at ×1**, not ×2.

### The do-not-reference marker (`28451:194`)

> `Tax(참고불가)`

→ The **Tax illustration group is explicitly marked "참고불가" (cannot be referenced/consulted)**. It sits above `nds_img_tax_02`, `nds_img_tax_03`, and `ss_img_com_qv_illust32`–`41`. **⛔ Whatever the reason (licensing? deprecation? client-specific?), the source says do not use these as reference.** A BUILD pass must treat the Tax group as off-limits.

## Inventory — exact counts (from `.length`)

| | Count |
|---|---|
| All COMPONENTs | **296** |
| **COMPONENT_SETs** | **1** (`nds_illust`) |
| Variants inside `nds_illust` | **280** = 140 illustrations × 2 |
| Legacy standalone COMPONENTs | **16** (10 × `ss_img_com_qv_illust32–41`, 2 × `nds_img_tax_02/03`, `QV|NM/nds_img_account_top`, `QV|NM/ss_img_693j_illust13`) |

**7 SECTIONs**, and note **every category name appears twice** (once per channel/mode grouping):
`이벤트, 혜택 관련` (×2) · `디지털 디바이스, AI, 투자 정보 관련` (×2) · `자산 관련` (×1) · `국내 해외 투자 관련` (×2)

A `2D` label (`64813:8010`) marks a style grouping.

**Semantic labels** (verbatim sample): 주식 + 금융상품 · 세무상담 · 국세청 · 대주주 해당종목 · 절세자산 현황/비과세 종합저축 · 상담예약 · tax캘린더 · ISA · 청년형 장기펀드 · 공모투자 전용계좌 · 금융투자 소득세 · 급상승 · 데이터 · 청년 · 자산진단 · 로그인 · 선물 · 선물 열림 · 데이터 없음, 비어있음, 제안 · 세계 최고가 주식, 내 계좌에 저장!

## CORE — componentKeys found

**All `remote: false` → tier (a) published-library source components in their home file.**

### ⭐ The SET (use `importComponentSetByKeyAsync`)

| Set | Full SET key (40-hex) | KIND | Variants | Axes |
|---|---|---|---|---|
| `nds_illust` (`74388:5388`) | `0ec614d9667c2ae11fd9887cc3aa571c85546dca` | **COMPONENT_SET** | 280 | `NM/N2=[on\|off]` (2) × `No=[nds_illust01 … nds_illust140]` (140) |

**140 illustrations × 2 channel states. The `No` axis carries the illustration identity; `NM/N2` carries the channel.** Numbering `nds_illust01`–`nds_illust140` is **complete — no gaps, no duplicates** (the only clean sequence across all my pages).

### ⚠️ SET key vs variant key — the exact trap the brief warned about, demonstrated

Three **different** 40-hex keys for what a careless read calls "nds_illust33":

| What | Full key | KIND |
|---|---|---|
| The SET `nds_illust` | `0ec614d9667c2ae11fd9887cc3aa571c85546dca` | **COMPONENT_SET** ← `importComponentSetByKeyAsync` |
| Variant `NM/N2=on, No=nds_illust33` | `99978570aeaffe8ba2fad314bdd09e1db8d6fb24` | COMPONENT (variant) ← `importComponentByKeyAsync` |
| Variant `NM/N2=off, No=nds_illust33` | `5cc72bcb8b79ef85accd99065830d50c7659a674` | COMPONENT (variant) ← `importComponentByKeyAsync` |
| Variant `NM/N2=on, No=nds_illust35` | `d47d852048859d80af833539cff4e9f648f43ec4` | COMPONENT (variant) |

**Passing a variant key to `importComponentSetByKeyAsync` will throw. Passing the SET key to `importComponentByKeyAsync` will throw.** Recording all four so the distinction is unambiguous in Core.

### Legacy standalone COMPONENTs (use `importComponentByKeyAsync`)

| Component | Full key (40-hex) | KIND | Note |
|---|---|---|---|
| `QV/nds_img_account_top` | `ac27b7f4796aa8712ee530f799c3039930c8345f` | COMPONENT (standalone) | legacy, channel-prefixed |
| `NM/nds_img_account_top` | `0f99ab4ef61e3addc7296213c0ed6b92774fc164` | COMPONENT (standalone) | legacy; **channel as a name prefix, not an axis** |
| `QV/ss_img_693j_illust13` | `161033e32314c0e5286a1596d5e5a1b0107b917f` | COMPONENT (standalone) | legacy |
| `nds_img_tax_02` | `0df010c9059f3782080fd59686b7875b6698c388` | COMPONENT (standalone) | **⛔ under `Tax(참고불가)`** |
| `nds_img_tax_03` | `3cf5b891264f6ba5872847c077ce4a2718be014a` | COMPONENT (standalone) | **⛔ under `Tax(참고불가)`** |
| `ss_img_com_qv_illust32` | `41876a80bf5f72459198ae61a6bd6148a2165fe2` | COMPONENT (standalone) | **⛔ under `Tax(참고불가)`** |
| `ss_img_com_qv_illust33` | `5f6ef00aba827ac827df9a4b203cd3b7ae46baac` | COMPONENT (standalone) | **⛔ under `Tax(참고불가)`** |
| `ss_img_com_qv_illust34` | `0984fbbed9211f207c426970f97b8ac8140dfcc0` | COMPONENT (standalone) | **⛔ under `Tax(참고불가)`** |

**Verification status: `unverified`** for all — read-only session, no import round-trip. Expected norm.

## Conflicts / LEDGER candidates

1. **🔴 EXPORT MULTIPLIER CONTRADICTION — the sharpest conflict I found anywhere.** On this one page:
   - `📌 nds_illust ( X1배수 전달 )` (`20810:999`) — deliver at **×1**
   - `(NEW) illustration Asset Usage` step 4: `필요 배수로 추출 후 Tiny.png에서 압축해 개발전달` — deliver at **whatever multiple you need**

   The `(NEW)`-badged card is stamped `2025.10.24`; the `📌` rule is undated. **The (NEW) card almost certainly supersedes the ×1 rule — but the ×1 rule is still on the canvas, unmarked, and a reader will hit it first** (it sits at y=-6350, far above the usage card). ⛔ **Do not encode "illustrations export at ×1" into Core without resolving this with 유상엽.**
2. **The `(NEW) illustration Asset Usage` card's subtitle reads `QV-NM Infographic Usage`** (`64681:2471`) — **copy-pasted from the `- Infographic` page's usage card and never corrected.** Cosmetic, but it means a subtitle-based search for "Infographic Usage" returns the *Illustration* card. Actively misleading.
3. **⛔ `Tax(참고불가)`** — an entire illustration group (≥7 components) explicitly marked do-not-reference, with **no stated reason and no replacement pointer**. Highest-severity unknown on the page.
4. **Three coexisting naming generations** (`nds_illust##` / `nds_img_~` + `ss_img_com_qv_illust##` / `기본/_illust###` labels) with **no on-canvas statement of which is authoritative** beyond the `25.06~` note saying new work is `별도 구분`. The `25.06~` rule says keep new separate from `기존 NDS 일러스트 에셋 (nds_img_~)` — **but the current SET is named `nds_illust`, not `nds_img_`**, so it is genuinely unclear whether `nds_illust` is the "기존" or the "신규". **Unresolved and consequential.**
5. **`NM/N2=[on|off]` is a semantically broken axis.** `NM/N2` is a *channel pair*, but its values are the boolean `on`/`off`. **Which channel is `on`?** Unknowable from the axis alone. Contrast the Icons page, which does this correctly with `Channel=[NM|N2]`. **A BUILD pass cannot safely pick a channel here without rendering both.**
6. **Cross-page darkmode/channel modelling is now three-way inconsistent** across the library: Icons uses `Channel=[NM|N2]` + `Darkmode=[on|off]` axes; Infographic uses a **separate parallel frame**; Illusts uses `NM/N2=[on|off]`. Three strategies, one library.
7. **Legacy channel-as-prefix** (`QV/nds_img_account_top` vs `NM/nds_img_account_top`) — two separate components where the modern approach would be one set with a Channel axis.
8. **`퍼블렉시티`** is a misspelling of `퍼플렉시티` (Perplexity) on three hidden frames.
9. **NOT a conflict:** `추천 사이즈 : 80 ~ 200` (index, placement) vs `필요 배수` (here, export). Different concerns.

## Gaps / unverifiable

- **14 `hidden="true"` nodes** on this page: `nds_illust95` (×2, as `rounded-rectangle` — `64813:17259`, `65132:2997`), `퍼블렉시티` (×3), `_레이어_1` (×2), `Group` (×2), `Vector` (×3), `모양 38`, `모양 39`. Per method, **none quoted as rules**. The two hidden `nds_illust95` rounded-rects are the notable ones — **`nds_illust95` also exists as a live variant in the SET**, so these are likely export scaffolding or a masked-out revision. Recorded as **unverified + "unhide and re-check"**. The rest read as Illustrator-import residue.
- **The `Tax(참고불가)` reason is unknown.** Not stated anywhere on canvas. This is the most important open question on the page — an unexplained prohibition on ~7 shipped components.
- **The ×1-vs-필요배수 export conflict (item 1) is NOT resolved.** I can date the (NEW) card (2025.10.24) but the `📌` rule carries no date, so "newer wins" is an inference, not evidence.
- **The component↔label spatial join was not extracted** (same gap as `- Infographic`): I have 140 `nds_illust##` identities and ~397 Korean labels, but not the mapping. "Which number is 자산진단?" is unanswered.
- I did **not** enumerate all 280 variant keys — only the 4 shown, deliberately, per method (pattern + SET key + counts is the deliverable).
- `기본/_illust126`–`145` labels reference an `_illust###` numbering in the 126–145 range that **overlaps** `nds_illust126`–`140` — possibly the same assets under an older label, possibly not. **Unverified; do not assume `기본/_illust128` == `nds_illust128`.**
- The 7 SECTIONs' duplicate names (each category appearing twice) were not investigated — presumably light/dark or NM/N2 pairs, but **not confirmed**.
</content>
