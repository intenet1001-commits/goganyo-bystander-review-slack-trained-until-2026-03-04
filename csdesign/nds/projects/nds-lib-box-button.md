---
name: nds-lib-box-button
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=45-621"
learned_date: 2026-07-16
sections_studied:
  - "45:621 (page '    - Box Button  버튼')"
  - "56:770 (section '1. Bottom' — on-canvas heading 'Bottom Button' / 'QV-NM Button Design Guide')"
  - "2385:10414 (section '2. Container' — on-canvas heading 'Container Button'; subsections large / regular / exception)"
  - "1928:15566 (section '3. Text button' — on-canvas heading 'Text Button')"
  - "83:1671 (section '4. Order (Buy&Sell)' — on-canvas heading 'Order Button')"
  - "3578:8018 (section '99. Button_assets' — the underlying asset component sets)"
  - "3673:7877 (section 'Button_usage' — on-canvas heading 'Button Usage' / 'QV-NM Button Usage'; the 사용방법 + 사용 시 유의사항 rules)"
  - "2387:10928 (COMPONENT_SET 'btn_container_large', 24 variants — screenshotted to determine name reliability)"
  - "3578:7763 (COMPONENT_SET 'btn_container_regular', 72 variants — the largest set in my batch; contains 10 hidden legacy h50 variants)"
status: "live — 'Last update  2022.10.31  구자영' (3673:7902), rendered and legible in the screenshot of 3673:7877. Oldest stamp of my four pages; the h50→h46 migration visible in the file post-dates it, so treat the stamp as a floor, not a guarantee."
---

# NDS Library — Box Button

**This page settles the domain's `#button-stub` open question: the UX Guide's button topic may be a stub, but the _library's_ button coverage is the opposite of a stub.** It is the largest, most elaborated topic in my batch — 18 component sets, ~200 variants, four usage rules, and a full asset layer. `#button-stub` should be reclassified: the *guide* is thin, the *library* is authoritative. BUILD should source button facts here, not from the UX Guide.

## Page conventions (determined by screenshotting)

- **Layer names: RELIABLE for structure, with two concrete corruptions** (documented below — both are real defects, not naming style). Section layer names match on-canvas headings exactly: `1. Bottom`→"Bottom Button", `2. Container`→"Container Button", `3. Text button`→"Text Button", `4. Order (Buy&Sell)`→"Order Button".
- **Demo copy: placeholder.** Every button reads `버튼명` ("button name"). One overflow-test variant reads `버튼명최대스물한글자입니다너무길면안돼요웅` — a deliberate max-length probe, not copy. Do not lift any of it.
- **Rules embedded in screenshot images: NO.** The usage rules are live text nodes in `Button_usage`; I screenshotted to confirm.
- **`hidden="true"` frames present: YES** — 10 in `btn_container_regular` (all `Height=h50`). Per the standing warning I did **not** quote them as live rules; see "The h50 retirement" below.

## The usage rules (verbatim, `3673:7877`)

**사용방법** (how to use):
1. `상황에 맞는 적절한 버튼을 가져다 사용합니다.`
2. `케이스별 properties를 확인합니다.`

**사용 시 유의사항** (cautions) — from `3673:7901`:
```
제공된 라이브러리 이외의 버튼은 사용을 지양합니다.
Assets 수정은 디자이너와 협의가 필요합니다.
(for designer) 예외케이스는 해당하는 templates에 추가하도록 합시다.
페이지 하단 '매수 버튼'이 상품에 사용될 때 1:2 버튼을 사용합니다.
페이지 하단 '이전 다음 버튼'이 투자설명서에 사용될 때 1:1 버튼을 사용합니다.
```

The last two are **hard, specific BUILD rules**:
- 매수 (buy) button at page bottom, in a **product** context → use the **1:2** split.
- 이전/다음 (prev/next) at page bottom, in an **투자설명서 (prospectus)** context → use the **1:1** split.

⚠ **The "1:1 button" named in the rule does not exist as a variant.** The `Type` axis offers `1-btn | 1:2-btn | 2-btn` — no `1:1-btn`. Reading the geometry, `2-btn` *is* the equal-split two-button layout, i.e. what the prose calls "1:1". **The rule's vocabulary and the axis vocabulary disagree.** Logged as a conflict below.

## Section taxonomy and on-canvas guidance

| Section | On-canvas description (verbatim) |
|---|---|
| **bottom** | `페이지/팝업 하단에 쓰이는 기본 버튼입니다.` |
| **container / large** | `화면 중간 혹은 박스(컨테이너) 내에 쓰이는 cTA 버튼으로 시각적 계층구조에 맞게 사용합니다.` |
| **container / regular** | `기본적인 버튼입니다. 콘텐츠 밸런스에 맞게 사용합니다. (Bluegray 버튼은 화면 배경색이 297일때만 사용해 주세요.)` |
| **container / exception** | `예외적인 버튼입니다. 꼭 필요한 상황에서만 사용합니다.` |
| **text / txt** | `부가적으로 사용되는 Quaternary Button` |
| **text / txt icon** | `기능 버튼 : 아이콘 우정렬 / 영역 설명 : 아이콘 좌정렬` |
| **text / txt arrow** | `'더보기' 텍스트는 사용하지 않습니다.` |
| **text / txt only** | `특별한 경우에만 사용합니다. (ex. 박스 전체가 터치영역)` |
| **order / regular** | `매수/매도 기본 버튼입니다.` |
| **order / list** | `리스트, 박스(컨테이너) 등 내에 사용합니다.` |
| **exception / Stock plus** | `관심그룹 화면 하단에 들어가는 예외 케이스` |
| **exception / Keyword** | `삭제가 가능한 키워드형 버튼입니다. 검색어, 필터 등에서 사용합니다.` |

⭐ **Two of these are directly actionable and easy to miss:**
- **`Bluegray 버튼은 화면 배경색이 297일때만 사용해 주세요.`** — the bluegray button is legal **only** when the screen background is colour-number **297**. Cross-references `nds-mweb-colors` exactly: `NM/ESS/grayscale/5.297(bg배경)` = `#EBEDF1` (`2022home_컨텐츠배경`). So bluegray buttons belong on the 2022home content background and nowhere else.
- **`'더보기' 텍스트는 사용하지 않습니다.`** — the literal string "더보기" (More) is **banned** as arrow-button copy.

Also note **`txt icon` encodes a semantic rule in icon position**: icon **right**-aligned = a *function* button; icon **left**-aligned = an *area description*. Same component, opposite meaning by alignment.

## ⚠ Conflict 1 — `btn_bottom_page` has a corrupted variant axis

`btn_bottom_page` (`3234:8470`) reports:
```
Channel: [NM | N2 | btn_bottom_layerpopup]
Type:    [1-btn | 1:2-btn | 2-btn | btn_bottom_page]
Status:  [normal | disabled | NM]
```
`btn_bottom_layerpopup` is not a channel. `btn_bottom_page` is not a type. `NM` is not a status. All three pollutions come from **one malformed variant**, `3234:8466`, whose layer name is literally `Channel=btn_bottom_layerpopup, Type=btn_bottom_page, Status=NM` — a frame name that Figma parsed as variant properties. Someone pasted a component in and Figma absorbed its name into the axis vocabulary.

**Consequence for BUILD:** enumerating `Channel` on this set yields a phantom value. Filter `3234:8466` out, or the set will appear to have a third channel. The other 11 variants are well-formed.

## ⚠ Conflict 2 — the `N2` / `QV` channel split

- `btn_bottom_page` (`3234:8470`) → `Channel: NM | N2`
- `btn_bottom_layerpopup` (`3234:9061`) → `Channel: NM | QV`

**Two sibling sets on the same page, same concept, different spelling of the same channel.** My `- Tooltip` page corroborates independently: its `Type=QV` variants render on-canvas as `N2 툴팁 타이틀`. **`N2` ≡ `QV`.** `nds-mweb-colors` documents only `NM | QV` and never mentions `N2`; a build that string-matches `"QV"` will silently miss every `N2` component.

## ⚠ Conflict 3 — control character in a property name

`btn_container_except_stockplus` (`85:1229`) has an axis whose name begins with a literal **backspace (U+0008)**: `"\bHeight"`, not `"Height"`. Setting `componentProperties` with the key `"Height"` on this set will fail with no obvious cause. Every other set spells it `Height`.

## The h50 retirement (hidden variants)

`btn_container_regular` (`3578:7763`) contains **10 `Height=h50` variants marked `hidden="true"`** (`3578:7864`, `3602:7739`, `3602:7682`, `3602:7741`, `3578:7866`, `3826:8878`, `3602:7743`, `3826:8898`, `3578:7876`, `3602:7745`, `3578:7900`, `3602:7747`). They render as blank 1×1 PNGs; I did not quote them.

They are **positioned at exactly the same coordinates as the visible `h46` variants** (x/y `24,234`, `465,234`, …) — h46 was laid directly on top of h50 and h50 hidden. The on-canvas height ruler confirms the live ladder: **60, 54, 46, 40, 32** (`3602:7662`, `3607:7925`, `3602:7664`, `3602:7665`, `6061:10419`) — **h50 is absent from the ruler.**

**`Height=h50` is retired in `btn_container_regular`. Do not use it.** But note the axis still advertises it, and — importantly — **`btn_order_container` (`86:1681`) still uses `h50` as a live, visible variant.** So h50 is retired in the container-regular family only, not file-wide. This retirement post-dates the 2022.10.31 usage stamp.

## componentKeys — Box Button page (all 18 SETs)

Read-only session → **all keys `unverified`**. Components are LOCAL (`remote: false`) — expected in the library file; not evidence of non-publication. **All 18 are COMPONENT_SET keys** (for `importComponentSetByKeyAsync`), tier (a) published library component unless noted. Page has **zero** loose components — everything is in a set, which is a sign of a well-maintained page.

| Name | SET key (40-hex) | Axes | n |
|---|---|---|---|
| `btn_bottom_page` | `accfb243ce752fd894af2b6db081b1074022a39d` | `Channel: NM\|N2\|⚠btn_bottom_layerpopup` × `Type: 1-btn\|1:2-btn\|2-btn\|⚠btn_bottom_page` × `Status: normal\|disabled\|⚠NM` | 12 |
| `btn_bottom_layerpopup` | `c2adcc07146493541681ee77243a945154819866` | `Channel: NM\|QV` × `Type: 1-btn\|2-btn` × `Status: normal\|disabled` | 8 |
| `btn_bottom_page_assets` | `0fc4758ec4ab4c83ad6052748c3dabf76d0542e8` | `Channel: NM\|QV` × `Type: 1-btn\|2-btn\|1:2-btn` × `Status: normal\|disabled` | 12 |
| `btn_bottom_layerpopup_assets` | `eb685bf3d8051457f3e50e5d48afa7a5aea44dc7` | `Channel: NM\|QV` × `Type: 1-btn\|2-btn` × `Status: normal\|disabled` | 8 |
| `btn_bottom_page_assets_gray` | `873d1a7bbe44364aef31c19bbf15f19d7d457265` | `Type: 2-btn\|1:2-btn\|1:2-btn(icon)\|2-btn(icon)` × `Status: normal\|disabled` | 6 |
| `btn_bottom_layerpopup_assets_gray` | `7567af95b516801ce9ebc89afd1188fb81a86f0d` | `Type: 2-btn` × `Status: normal\|disabled` | 2 |
| `btn_bottom_order_assets` | `fb5f7a6b9f05a152f5fffb10f3240432786a7fc3` | `Order: buy\|sell` × `Type: 2-btn\|1:2-btn\|1-btn` × `Status: normal\|disabled` | 12 |
| `btn_bottom_orderlist_assets` | `cd017bc838e670889508932b4226686741f3d4bf` | `Color: buy\|sell\|primary-NM\|primary-QV\|기본-gray039\|기본-gray101\|강조-gray245\|비강조-white063` | 8 |
| `btn_order_container` | `e0295f49cd39a6a06726326fce920a386f176b78` | `Order: sell\|buy` × `Height: h50\|h54\|h74` × `Status: disabled\|normal` | 12 |
| `btn_order_bottom` | `c63a8e998ab5f4eaee9dbfc87038a959c15c0dfe` | `Order: buy\|sell` × `Type: 1-btn\|1:2-btn\|2-btn` × `Status: normal\|disabled` | 12 |
| `btn_order_container_list` | `66d9401ae65b8e1d796dfa5e34abfdb90c8336e4` | `Type: 3-btn\|2-btn 우정렬\|2-btn` | 3 |
| `btn_txt_icon` | `7f77fc34cc78af7c4fd8d837be6027e7f6cd5345` | `TXT Size: 18pt\|21pt` × `icon location: left\|right` | 4 |
| `btn_txt_arrow` | `bc0399bb33f9213ff99482a43345a0aaaa3e070c` | `Type: 18pt\|21pt` | 2 |
| `btn_txt_only` | `23cbbc8e39f7fb29f448b242aa001da15057f32f` | `Property 1: Default` ⚠ unnamed axis | 1 |
| `btn_container_large` | `a036bcc5e212e779d94e08d4ba9c701217fca1dc` | `strength: 1\|2-NM\|2-QV\|3-gray\|3-bluegray\|4(line)` × `Status: normal\|disabled` × `Location: in box\|in page` | 24 |
| `btn_container_regular` | `fd0a4e2fd7b3c49612b27963bd8bf41f1580910b` | `Strength: 1\|2-gray\|3-gray\|3-bluegray\|4(line)\|4(line)-R` × `Height: h60\|h54\|h50†\|h46\|h40\|h32` × `Status: normal\|disabled` | 72 |
| `btn_container_except_stockplus` | `17cfe05094c76cf66aae80d4886825875fbdc08b` | `⚠"\bHeight": h70\|h50` (leading U+0008) | 2 |
| `btn_container_except_keyword` | `5b06ee2e4d2f19e3234ff997f3e1f2c291b57055` | `Type: squre\|line` ⚠ "squre" is a typo for "square", preserved verbatim | 2 |

† `h50` variants are hidden/retired in this set — see above.

**Note the axis-name casing split:** `btn_container_large` uses lowercase **`strength`**; `btn_container_regular` uses capitalised **`Strength`**. Same concept, and the two sets do not even share a value list (`2-NM`/`2-QV` vs `2-gray`). Property keys are case-sensitive — do not reuse one set's props object on the other.

## The strength hierarchy

Visual weight ladder, corroborated by the `btn_container_large` screenshot:

| strength | Renders as |
|---|---|
| `1` | dark charcoal fill, white text — strongest |
| `2-NM` / `2-QV` | light brand tint (NM pale green / QV pale orange) |
| `2-gray` *(regular only)* | light grey fill |
| `3-gray` | grey fill |
| `3-bluegray` | blue-grey fill — **only on background 297** |
| `4(line)` | white fill, outlined |
| `4(line)-R` *(regular only)* | outlined, rounded |

`Location: in box | in page` on `btn_container_large` is a **width** axis, not a style axis: `in page` = 492 wide, `in box` = 432 wide. Same look, different container inset.

## How this feeds BUILD mode

- **Source button facts from this page, not the UX Guide** — `#button-stub` reflects the guide's thinness, not the library's.
- **Decide bottom vs container vs text vs order first**, then Channel (NM/QV — **and check for `N2`**), then Type/Strength/Height/Status.
- **Honour the two prose rules**: product 매수 at page bottom → `1:2-btn`; prospectus 이전/다음 at page bottom → the equal split (axis calls it `2-btn`; the prose calls it "1:1").
- **Bluegray only on background 297** (`#EBEDF1`). Anywhere else it is a spec violation.
- **Never ship the string "더보기"** on an arrow button.
- **Avoid `Height=h50` in `btn_container_regular`** (hidden/retired); it remains valid in `btn_order_container`.
- **Filter variant `3234:8466`** out of any `btn_bottom_page` enumeration, and set `btn_container_except_stockplus`'s height prop using the exact `"\bHeight"` key including the backspace.
- Disabled states are **prebuilt variants** — use `Status=disabled`, don't hand-roll opacity. (Consistent with `nds-mweb-colors`: the disabled token is the brand colour at 60% NM / 70% QV, not a grey.)
