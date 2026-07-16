---
name: nds-lib-card
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=353-6951"
learned_date: 2026-07-16
sections_studied:
  - "353:6951 (page '    - Card  카드' — the canvas itself)"
  - "2407:19473 (frame '1. Card' — on-canvas heading 'Cards' / 'QV-NM Cards Design Guide')"
  - "7710:14724 (frame 'card_usage' — on-canvas heading 'Card Usage'; carries the 6 사용방법 rules, 유의사항, and the Last update stamp)"
  - "2436:12040 (section 'title_' — on-canvas 'DATA' / '1개의 상품, 또는 상품의 데이터만 들어가는 카드 UI입니다.')"
  - "7766:20568 (COMPONENT_SET 'card_data', 4 variants)"
  - "7741:16954 (section 'title_' — on-canvas 'SELECT' / '선택 컨트롤이 가능한 카드 uI 입니다. line setting이 일반 data component와 다릅니다.')"
  - "7766:20748 (COMPONENT_SET 'card_select', 6 variants)"
  - "2440:9897 (section 'title_' — on-canvas 'EMPHASIS' / '상단에서 정보를 강조할때 사용합니다.')"
  - "7741:17015 (COMPONENT_SET 'card_emphasis', 4 variants)"
  - "2440:10111 (section 'title_' — on-canvas 'SIMPLE LIST' / '간단한 리스트 형태의 카드 UI 입니다.')"
  - "7741:17483 (COMPONENT_SET 'card_simple list', 2 variants)"
  - "19343:534 (section 'title_' — on-canvas 'ACCORDION' / '카드형에서 상세정보를 보기 위한 펼치고 접을수 있는 UI 입니다.')"
  - "19461:3932 / 19483:21236 (COMPONENT_SETs 'card_accordion_center' / 'card_accordion_right')"
  - "23947:1338 (section 'title_' — on-canvas 'BANNER' / '배너처럼 좁은 영역의 카드 uI 입니다.')"
  - "79783:1912 (section 'title_' — on-canvas 'BLOCK' / '기관 선택할때 쓰입니다.')"
  - "7741:18872 (frame '99. Card_assets' — sub-component assets: title / title_select / colum)"
status: "live — page carries its own on-canvas stamp `Last update  2023.02.09  구자영` (7710:14736), a populated usage panel with six concrete build rules, and 12 component sets across 7 documented sections."
---

# NDS Library — Card (카드)

The card-container family for the **NDS_Library** file (`72zrHgMLM4zhCjgSuTf7cC`). Seven sections — DATA, SELECT, EMPHASIS, SIMPLE LIST, ACCORDION, BANNER, BLOCK — plus a `99. Card_assets` frame holding the sub-components cards are assembled from.

**This page is the highest-value of the five I studied for BUILD work**, because its usage panel states hard numbers (stroke token, margins, gaps) rather than prose.

## ⚠️ Name reliability on THIS page: MOSTLY RELIABLE — but the *property names* are booby-trapped

**Determined by screenshotting `7710:14724` and reading `variantGroupProperties` on all 12 sets.**

| Tier | Reliable? |
|---|---|
| Frame / section / heading names | **YES** — `1. Card`→"Cards", `card_usage`→"Card Usage", every `title_` matches its rendered text. |
| Set names | **MOSTLY** — one set is named `Frame 123792` (Figma's auto-name); see below. |
| **Variant PROPERTY names** | **NO — three contain a literal `\x08` backspace.** This is the worst instance of the `\x08` pathology in the file. |
| TEXT leaf names | **N/A** — they are the placeholder copy. |

### 🚨 The `\x08` variant-property trap — read this before any `setProperties` call

Three sets have a **U+0008 BACKSPACE character inside the property name**. It is invisible in the Figma UI and invisible in this document. It will make an exact-match `setProperties({Fold: 'on'})` **fail**:

| Set | Property name as stored | Looks like | Actually is |
|---|---|---|---|
| `card_accordion_center` (`19461:3932`) | `\x08Fold` | `Fold` | **`"Fold"`** — leading backspace |
| `card_accordion_right` (`19483:21236`) | `Fold` | `Fold` | `"Fold"` — **clean** |
| `card_guide` (`23947:1321`) | `Type\x08` | `Type` | **`"Type"`** — trailing backspace |
| `financial_boxlist_nm` (`79783:1896`) | `\x08Select` | `Select` | **`"Select"`** — leading backspace |

**The accordion pair is the nastiest case: two sibling sets documenting the same concept, one with the corrupt name and one without.** `card_accordion_center` needs `"Fold"`; `card_accordion_right` needs `"Fold"`. Identical-looking code will work on one and throw on the other.

**Rule: never hand-type a property name for these sets. Read `variantGroupProperties` at runtime and use the returned key verbatim.** Logged to LEDGER.

## The usage panel — verbatim (`7710:14724`)

On-canvas heading **`Card Usage`** / subtitle `QV-NM List Usage` *(sic — says **List**, a copy-paste artifact from the List page)*.

**사용방법** — transcribed with the on-canvas numbering exactly as rendered:
1. `기본 배경(white)위에는 stroke(017)이 필요합니다.`
2. `블루그레이 배경에는 라인없는 박스를 사용합니다.`
3. `기본 마진은 좌우상하 30px입니다. (데이터가 많을 땐 마진 24px를 사용합니다.)`
4. `item 간격은 기본적으로 10px입니다.`
3. `상황에 맞는 적절한 카드를 가져다 사용합니다.`
4. `케이스별 properties를 확인합니다.`

**⚠️ The numbering is broken at source: it runs 1, 2, 3, 4, 3, 4.** Two separate lists were merged and the second pair kept its own numbering. Six distinct rules, not four. Verified on the screenshot — this is not a transcription slip.

**사용 시 유의사항**
- `제공된 라이브러리 이외의 카드는 사용을 지양합니다.`
- `Assets 수정은 디자이너와 협의가 필요합니다.`
- `(for designer) 예외케이스는 해당하는 templates에 추가하도록 합시다.`

**Stamp:** `Last update  2023.02.09  구자영` (`7710:14736`) — two days newer than the List page's stamp.

### `stroke(017)` decodes cleanly — and validates the colors note

Rule 1 says white-background cards need `stroke(017)`. **`017` is a NDS ColorNumber**, and `nds-mweb-colors` already decoded it:

```
NM/ESS/line/2.017(박스테두리)  =  #E0E0E0     ← "box border"
```

The Korean semantic suffix on that style is literally **박스테두리 (box border)** — exactly what rule 1 asks for. This is strong mutual corroboration: the Card guide references colours by bare ColorNumber, precisely as the colors note predicted ("the ColorNumber is the stable, channel-independent identity the design team uses in conversation").

**Note the channel caveat still applies.** `017` alone is ambiguous; on QV it resolves to the QV table's slot-2 line colour. Qualify it as `NM 017` unless the surface is QV.

## Component sets

All keys are **SET keys**. Full 40-hex, none truncated.

### Under `1. Card`

| Set | SET key | Axes | n |
|---|---|---|---|
| `card_data` | `170051996853f22c1def7a5dfe908edd62586ae0` | `Type`(basic 1줄 / basic 2줄 / division / variation) | 4 |
| `card_select` | `9394b487f176e081e611dd5fe7d657b59a0ae989` | `Type`(basic / division / variation) × `Active`(on/off) | 6 |
| `card_emphasis` | `5703be1ed7a4ec1e30bff7e69594186da04b75ca` | `Type`(amount / feature) × `BTN`(1-btn / 2-btn) | 4 |
| `card_simple list` | `df5a4578ee783f19f6e1135e67562a3a0a07d236` | `Type`(basic / rate) | 2 |
| `card_accordion_center` | `8b496be7bbf096ddecab51fe273be5a53fbe4751` | **`\x08Fold`**(on/off) ⚠️ | 2 |
| `card_accordion_right` | `c6951f62cf98cd9ac5f4e49841317fd798bf9009` | `Fold`(on/off) | 2 |
| `card_guide` | `a027ac0b3104f7c3cbaf4cce2abd81daa65f95ae` | **`Type\x08`**(1-btn / 2-btn) ⚠️ | 2 |
| **`Frame 123792`** ⚠️ | `1a82768d0a686095b9a813425c56d5a05e941eef` | `Arrow`(on/off) | 2 |
| `financial_boxlist_nm` | `31e1057ab082a346e5b2e713a0a7fca72e6e3317` | **`\x08Select`**(on/off) ⚠️ | 2 |

### Under `99. Card_assets` (sub-components, not standalone cards)

| Set | SET key | Axes | n |
|---|---|---|---|
| `title` | `44c1bad0877b0bfba113a8fcc5a9da75aa127fb4` | `Type`(basic 1줄 / basic 2줄 / ticker / with Sub txt) × `label`(on/off) | 8 |
| `title_select` | `23fcdeb3f7f96de9913dcb68150be6a463a0e3db` | `Type`(basic / ticker / with Sub txt) | 3 |
| `colum` | `c355ddcba3cd13f902b9ff2d9a678498b0ca119c` | `단분할`(on/off) | 2 |

> `colum` (sic — one `m`) and its Korean property `단분할` ("column split"). The property name is Korean while every sibling uses English — match the string exactly.

### ⚠️ `Frame 123792` — an unnamed set doing real work

`23976:1420` is a genuine COMPONENT_SET (`Arrow=on`/`Arrow=off`, 492×64 banner rows) that **still carries Figma's auto-generated frame name**. It sits under the on-canvas heading `txt` (`23976:1385`) in the BANNER section. It is documented on canvas but nameless in the layer tree.

Classification: **(a) published library component with a naming defect** — it's section-documented and axis-complete, it just never got named. Refer to it by key `1a82768d…`, never by name. Logged to LEDGER.

### The BANNER section duplicates its own description

Both banner sub-headings carry the **identical** description text:
- `23976:1385` — `txt` / `상품 최상단 투자가이드에서 사용합니다.`
- `23947:1343` — `guide` / `상품 최상단 투자가이드에서 사용합니다.`

One of the two is a copy-paste that was never rewritten. The components differ (`Frame 123792` = a 64px text row with a chevron; `card_guide` = a 104px row with 1 or 2 buttons), so **the descriptions do not distinguish them — go by structure.**

## Placeholder copy — do NOT record as product strings

Every string in the card demos is lorem-ipsum:

| String (verbatim) | Status |
|---|---|
| `레이블` | **Pure placeholder** — literally "label". |
| `100,000원` | Filler amount. |
| `정보` | Filler ("info"). |

The `card_display_basic` examples in the usage panel (`7710:14737`, `7710:14748`) render three `레이블 / 100,000원` rows and one `레이블 / 정보` row. **There is no real product copy on this page.**

## How this feeds BUILD mode

- **Apply the six usage rules literally — they are the most actionable thing on any of these five pages:**
  - White bg → **1px stroke `NM/ESS/line/2.017` `#E0E0E0`**. Blue-grey bg → **no stroke at all.**
  - **Padding 30px** on all four sides; **24px** when the card is data-dense. (This is the same 24/30 split `list_icon` exposes as a `Margin` variant — the two pages agree.)
  - **Item gap 10px** — set `itemSpacing: 10` on the auto-layout, don't eyeball it.
- **Pick the section by intent**: single product/data → `card_data`; selectable → `card_select` (note its section text warns *"line setting이 일반 data component와 다릅니다"* — its border rules deliberately differ from `card_data`); top-of-page emphasis → `card_emphasis`; compact rows → `card_simple list`; expand/collapse → `card_accordion_*`; narrow strip → BANNER; 기관 선택 → `financial_boxlist_nm`.
- **Never hardcode `Fold` / `Type` / `Select` for the four `\x08` sets.** Read `variantGroupProperties` first and pass the returned key back verbatim:
  ```js
  const set = await figma.importComponentSetByKeyAsync('8b496be7bbf096ddecab51fe273be5a53fbe4751')
  const propName = Object.keys(set.variantGroupProperties)[0]   // "Fold" — do NOT type "Fold"
  ```
- **`card_accordion_center` vs `_right`** differ only in where the expand affordance sits (centre-bottom vs right). Both `Fold=off` are short (90–226px); `Fold=on` expands to 351–366px.
- Keys are `unverified` for publish state (read-only session). `remote: false` is expected — this *is* the library file. Judge by structure: all 12 are section-documented and axis-complete → **(a) published library components**, with `Frame 123792` carrying a naming defect and four carrying property-name corruption.
