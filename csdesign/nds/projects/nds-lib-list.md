---
name: nds-lib-list
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=2283-9978"
learned_date: 2026-07-16
sections_studied:
  - "2283:9978 (page '    - List  리스트' — the canvas itself)"
  - "2407:15340 (frame '1. List' — on-canvas heading 'Lists' / 'QV-NM Lists Design Guide')"
  - "7535:12368 (frame 'list_usage' — on-canvas heading 'List Usage'; carries 사용방법 / 사용 시 유의사항 and the page's Last update stamp)"
  - "7535:12384 (section 'title_' — on-canvas 'STOCK' / '종목이 리스트로 나올 때 사용합니다.')"
  - "7535:12390 (COMPONENT_SET 'list_stock', 12 variants)"
  - "7570:13008 (section 'title_' — on-canvas 'ACCOUNT' / '계좌가 리스트로 나올 때 사용합니다.')"
  - "7576:12779 (COMPONENT_SET 'list_account', 12 variants)"
  - "50814:2511 (section 'title_' — on-canvas 'ICON' / '리스트에서 아이콘 또는 인포그래픽과 같이 나올때 사용합니다.')"
  - "50814:2516 (COMPONENT_SET 'list_icon' — 17 children, HAS FIGMA ERRORS: duplicate variant)"
  - "7570:12725 (section 'title_' — on-canvas 'BOARD' / '기본적인 텍스트 리스트가 리스트로 나올 때 사용합니다. (주로 게시판 형태)')"
  - "7525:12502 (COMPONENT_SET 'list_board', 6 variants)"
  - "7609:13880 (section 'title_' — on-canvas 'PRODUCT' / '상품마다 화면에서의 UI가 다르기 때문에 디자이너와 협의가 필요합니다.')"
  - "7609:14101 / 7609:14193 / 7609:14221 (COMPONENT_SETs 'list_product01/02/03' — ELS/DLS, 펀드, 채권)"
status: "live — page carries its own on-canvas stamp `Last update  2023.02.07  구자영` (7535:12380), a populated usage panel, and 5 documented families with 45+ variants. One family (`list_icon`) is in a Figma error state (see LEDGER)."
---

# NDS Library — List (리스트)

The row/list component family for the **NDS_Library** file (`72zrHgMLM4zhCjgSuTf7cC`). Five families keyed by *what the row is about*, not by how it looks: **STOCK** (종목), **ACCOUNT** (계좌), **ICON**, **BOARD** (게시판), **PRODUCT** (상품).

This is the best-documented of the five view pages I studied — it has a real usage panel, a dated stamp, and every section heading agrees with its layer name.

## ⚠️ Name reliability on THIS page: MIXED — reliable at the top, lies at the leaves

**Determined by screenshotting `7535:12368` and `7535:12390`.** The convention splits cleanly by tier:

| Tier | Reliable? | Evidence |
|---|---|---|
| Frame / section / heading names | **YES** | `1. List` → renders "Lists"; `list_usage` → "List Usage"; `title_` children `STOCK`/`종목이 리스트로 나올 때 사용합니다.` render verbatim. Every one checked matched. |
| Variant names | **YES** | Match `variantProperties` exactly — except inside the broken `list_icon` set. |
| **TEXT leaf names** | **NO — they are stale hardcoded values** | See table below. |

**The TEXT-leaf lie, verified by reading `characters` vs `name`:**

| Layer `name` | Actual `characters` |
|---|---|
| `58,500` | **`60,600`** |
| `200` | **`70`** |
| `201` | **`0.34%`** |

The TEXT nodes are named after an *older* set of demo numbers that were later edited on canvas without renaming the layers. **Never quote a numeric TEXT layer name from this page as a value.** Read `characters`.

**No rules are embedded in pasted screenshot images on this page** — all guidance is live text. (Contrast the Chart page.)

## The usage panel — verbatim (`7535:12368`)

On-canvas heading **`List Usage`** / subtitle `QV-NM List Usage`.

**사용방법**
1. `상황에 맞는 적절한 리스트을 가져다 사용합니다.` *(sic — `리스트을` is a typo for `리스트를`; transcribed verbatim)*
2. `케이스별 properties를 확인합니다.`

**사용 시 유의사항**
- `제공된 라이브러리 이외의 리스트는 사용을 지양합니다.`
- `Assets 수정은 디자이너와 협의가 필요합니다.`
- `(for designer) 예외케이스는 해당하는 templates에 추가하도록 합시다.`

**Stamp:** `Last update  2023.02.07  구자영` (`7535:12380`).

## The five families

All keys below are **SET keys** (for `importComponentSetByKeyAsync`). Full 40-hex, none truncated.

| Family | SET key | Axes | n |
|---|---|---|---|
| `list_stock` | `09fd4ecabbb4e3db2151a55b00396e49a05693e7` | `Type`(기본 / 등락률 강조 / 심플(요약)) × `CI`(on/off) × `in Card`(on/off) | 12 ✅ complete |
| `list_account` | `13d1fd192e1910377c11012c4752f91e3236b3dd` | `Type`(타행포함 / 당행만 / 당행상태표시) × `BTN`(on/off) × `in Card`(on/off) | 12 ✅ complete |
| `list_icon` | `d15c808ac3325366f72303f3d20929dfadd05799` | `Type`(아이콘 / 인포그래픽) × `Line`(single/multi) × `Margin`(24/30) × `Arrow`(on/off) | 17 ⚠️ **BROKEN** |
| `list_board` | `d4853f1f0a6138bd17f603b51706282ca6ae6da9` | `Type`(기본 / 상태표시 / 뉴스공시형) × `in Card`(on/off) | 6 ✅ complete |
| `list_product01` (ELS/DLS) | `6db1192378fdca34d642e0ca27dd509c55331cc5` | `in Card`(on/off) | 2 |
| `list_product02` (펀드) | `6389ba3054630e15446ea5b6204ea865ef46e734` | `in Card`(on/off) | 2 |
| `list_product03` (채권) | `6eb8cdb388e2ffdf8be7688c9f040597c289db80` | `in Card`(on/off) | 2 |

**`in Card` — note the space.** The property is literally `in Card`, not `inCard` or `in_card`. Same on every family that has it.

### ⚠️ `list_icon` is in a Figma error state — do not trust it

Reading `variantGroupProperties` on `50814:2516` **throws**:

```
Error: in get_variantGroupProperties: Component set has existing errors
```

Cause, found by enumerating its children: **two components share the identical variant name**

```
50855:17337  "Type=인포그래픽, Line=multi, Margin=30, Arrow=off"
81858:762    "Type=인포그래픽, Line=multi, Margin=30, Arrow=off"   ← duplicate, overlapping at x=1911,y=130
```

17 children = 16 legitimate combinations (2 Type × 2 Line × 2 Margin × 2 Arrow) **+ 1 duplicate**. Screenshotting the set confirms it: the 인포그래픽 columns render **ghosted/faded**, which is Figma's conflict rendering.

The axis matrix is otherwise *complete* — this is purely the stray `81858:762` (a much later node id, i.e. pasted in long after the set was built). **Consequence for BUILD: `importComponentSetByKeyAsync` on `d15c808a…` may fail or resolve the duplicated combination nondeterministically. Import the specific variant COMPONENT by id/key instead, or flag for a designer to delete `81858:762`.** Logged to LEDGER.

## What each family renders (from screenshots)

**`list_stock`** — a securities row. Left: name (+ optional circular CI logo, `CI=on`). Right: price + change. Three types:
- `기본` — name 21px, `KOSPI | 005930` ticker line beneath in 15px `#999999`; price 24px `#000000`; change `▲ 70  0.34%` 18px red.
- `등락률 강조` — no ticker line; name 24px bold; price 24px **red**; the rate gets a solid **red pill** (`percent_box`) with white 21px text.
- `심플(요약)` — name prefixed `*` (e.g. `*삼성전자`); price 24px black; rate 18px red beneath. No ticker line.

**`list_account`** — bank/account rows; `타행포함` (other banks included) vs `당행만` (own bank only) vs `당행상태표시` (own bank + status). `BTN` toggles a trailing action button. Heights 94–104px.

**`list_icon`** — icon or infographic + title (+ optional sub-line when `Line=multi`) + optional chevron. `Margin` picks 24 vs 30 px side padding — this is the *only* family that exposes margin as a variant, and it lines up with the Card page's "기본 마진은 30px … 데이터가 많을 땐 24px" rule.

**`list_board`** — plain text/게시판 rows: `기본`, `상태표시`, `뉴스공시형`. 100px tall.

**`list_product01/02/03`** — 140px tall, one set per product class (ELS/DLS at `7609:14120`, 펀드 at `7609:14206`, 채권 at `7609:14249`). The section text says these differ per product and **require designer consultation** — treat as templates, not as a general-purpose component.

## Colour: corroborates the domain's 상승=red

Sampled directly off `list_stock` variants (fills read via read-only `use_figma`, not eyeballed):

| Role | Node | Hex | Matches domain? |
|---|---|---|---|
| 상승 price (등락률 강조) | `7535:13185` price TEXT | **`#D73838`** | ✅ exactly |
| 상승 change amount / rate | `7535:12389` TEXTs | **`#D73838`** | ✅ exactly |
| 상승 pill fill (`percent_box`) | INSTANCE | **`#D73838`** | ✅ |
| 상승 triangle (`▲` VECTOR) | `Triangle` | **`#D73838`** | ✅ |
| Body/name ink | name TEXT | `#000000` | — |
| Ticker line (`KOSPI`, `005930`) | 15px | `#999999` | = `NM/Default/4.024` |

**This page independently confirms 상승 = `#D73838`.** All four red-bearing nodes agree — text, pill, and triangle. Worth noting because the **Data Table** page does *not* keep that consistency (its triangle is `#EF2D26`; see `nds-lib-data-table.md`).

**No 하락/보합 examples exist on this page** — every demo row is a rise. The blue `#247EF2` and green `#009F83` are **not corroborated here; blank at source.** Don't read that as contradiction — read it as untested.

## Placeholder copy — do NOT record as product strings

| String (verbatim) | Status |
|---|---|
| `삼성전자` / `*삼성전자` | Demo issuer. The `*` prefix is part of the `심플(요약)` design (abbreviation marker), not the name. |
| `60,600`, `70`, `0.34%` | Filler numbers. |
| `KOSPI`, `005930` | Real-shaped ticker, but demo. |
| `리스트 타이틀`, `서브텍스트가 들어갑니다.` | **Pure lorem-ipsum** ("list title", "sub-text goes here"). |
| `전문가 투자상담`, `계좌개설` | Plausible menu labels used as icon-row demos — treat as demo. |

## How this feeds BUILD mode

- **Choose the family by the row's SUBJECT first** (종목 → `list_stock`; 계좌 → `list_account`; 게시판 → `list_board`; 상품 → `list_product0N`; icon-led → `list_icon`). The families are not visual variants of each other and are not interchangeable.
- **Set `in Card` to match the container**: `off` → 540px (full-bleed), `on` → 492px (inside a card's 24px margins). Getting this wrong produces a 48px overhang.
- **Avoid `list_icon` via set-key import until `81858:762` is deleted.** Import the individual variant COMPONENT instead.
- **`list_product0N` requires designer sign-off** per the page's own section text — don't self-serve.
- **Read `characters`, never numeric TEXT layer names** on this page.
- Keys are `unverified` for publish state (read-only session). `remote: false` on every set is expected — this *is* the library file — so judge by structure: all five families are section-documented, axis-complete (bar the `list_icon` dupe), and stamped, i.e. **(a) published library components**.
