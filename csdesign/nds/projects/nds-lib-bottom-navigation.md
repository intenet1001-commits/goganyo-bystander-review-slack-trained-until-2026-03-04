---
name: nds-lib-bottom-navigation
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=338-6691"
learned_date: 2026-07-16
sections_studied:
  - "338:6691 (page '    - Bottom Navigation (Quickmenu)  퀵메뉴')"
  - "338:7028 (frame '1. Quick Menu' — on-canvas heading 'Bottom Navigation (Quickmenu)' / 'QV-NM Quick Menu Design Guide', carrying the '👿 NDS 추가 개발 해당없음' status badge)"
  - "370:7438 (COMPONENT_SET quickmenu_basic — on-canvas heading 'BASIC', '기본 퀵메뉴로 사용됩니다.')"
  - "367:7443 (COMPONENT_SET quickmenu_allmenu — on-canvas heading 'ALL MENU', '기본 퀵메뉴 내 햄버거 버튼 클릭 시 노출되는 메뉴')"
  - "2598:9948 (COMPONENT_SET quickmenu_ticker — on-canvas heading 'TICKER')"
  - "371:7270 (COMPONENT_SET quickmenu_nmpick — on-canvas heading 'NAMUHPICK', '나무멤버스에서 사용되는 퀵메뉴입니다.')"
status: "live but explicitly frozen for NDS purposes — the page's own on-canvas badge reads '👿 NDS 추가 개발 해당없음' ('not applicable for NDS additional development'). All four sets are structurally clean and render normally; nothing is deprecated. No `Last update` stamp on this page (verified: zero TEXT nodes contain 'Last update')."
---

# NDS_Library — Bottom Navigation (Quickmenu)

The quickmenu definitions in `NDS_Library` (`72zrHgMLM4zhCjgSuTf7cC`). Four local `COMPONENT_SET`s (`remote: false` — expected for the library file itself, **not** evidence of a doc re-creation). **All four are structurally clean** — no duplicate variants, all axes readable. This page is the healthy counterexample to the Header and Tab pages, both of which carry a broken set.

## ⭐ Finding 1 — the page declares itself out of NDS scope

The frame heading carries a badge instance (`8940:13826`, component `viviana`) whose TEXT reads, verbatim:

> **👿 NDS 추가 개발 해당없음**

("NDS — additional development not applicable.")

This is an **on-canvas, first-class status declaration sitting next to the page title** — not a stray annotation in a margin. It is the only page in this batch that carries one.

**Read it precisely.** It does *not* say deprecated, superseded, or do-not-use. The components render normally and are structurally sound. The most defensible reading: **the quickmenu is considered done — no further NDS work is planned for it.** So:

- The existing variants are what you get. **Expect no new ones**; don't wait for a missing case to be added.
- A gap here is unlikely to be an oversight that will be filled — it is more likely deliberate scope.
- **This is a scope declaration, not a technical claim**, and I have not verified what "NDS 추가 개발" formally covers in this org. Treat the *implications* above as reasonable inference; treat only the quoted string as fact. If a build depends on the distinction, ask a designer.

## ⭐ Finding 2 — `quickmenu_basic` is **hamburger + 5 TEXT labels**, not "5 icons"

Core documents `quickmenu_basic` as **"5 icons + hamburger"**. **The 5 are TEXT labels, not icons.** Read off the `Channel=NM, Type=normal` variant (`370:7436`, 540×74):

```
bg              RECTANGLE  x=0    w=540
icon_hamburger  INSTANCE   x=12   w=52    ← the only icon on the left
Frame 9000      FRAME      x=76   w=384   ← holds the 5 TEXT labels
icon_영역        GROUP      x=464  w=76    ← a 6th slot Core omits
```

The five labels, **verbatim** (each is two lines, `\n` shown):

| # | characters |
|---|---|
| 1 | `홈` |
| 2 | `관심\n그룹` |
| 3 | `주식\n현재가` |
| 4 | `국내주식\n주문` |
| 5 | `국내주식\n잔고/손익` |

So the true anatomy is **hamburger (icon) + 5 two-line text labels + `icon_영역` (a trailing icon slot)** — seven elements, not six. Core's row is imprecise in two ways: the 5 are text, and the trailing `icon_영역` is missing entirely. Layout is fixed-position (explicit `x`), not auto-layout.

## ⭐ Finding 3 — Core's row omits the `Easy` (간편홈) variant

`quickmenu_basic`'s `Type` axis has **three** values: `normal`, `pressed`, **`Easy`**. Core's "5 icons + hamburger" describes `normal` only. The on-canvas label for the Easy row is **`간편홈`** ("simple home").

`Channel=NM, Type=Easy` (`69161:1553`) is **structurally different**, not a restyle:

```
bg                          RECTANGLE  x=0    w=540
icon_hamburger              INSTANCE   x=12   visible=FALSE   ← hamburger turned OFF
Frame 9000                  FRAME      x=75   w=407
ss_img_quickbar_menu_easy   INSTANCE   x=0    w=75            ← replaces the hamburger
ss_img_quickbar_normal_easy INSTANCE   x=468  w=72            ← replaces icon_영역
```

**In `Easy`, the hamburger is hidden and both end caps are swapped for `ss_img_quickbar_*_easy` images** whose rendered labels are `메뉴` (left) and `퀵버튼` (right). So the "hamburger + 5 labels" description **does not hold for `Easy` at all** — it's a labelled-menu-button + 5 labels + a labelled quick-button.

## Name reliability verdict — **SPLIT: set/frame names reliable; TEXT layer names FULLY UNRELIABLE**

Determined by screenshotting this page specifically. This page is a **live example of the "layer names lie" failure** — and the unreliability is concentrated in exactly one place.

**Reliable:** every `COMPONENT_SET` name matches its on-canvas heading (`quickmenu_basic`→BASIC, `quickmenu_allmenu`→ALL MENU, `quickmenu_ticker`→TICKER, `quickmenu_nmpick`→NAMUHPICK). Variant names match rendered appearance.

**Fully unreliable — TEXT node *names* inside the `Easy` variant.** The names are stale copies from the `normal` variant; the actual `characters` are completely different:

| TEXT layer **name** | actual `characters` |
|---|---|
| `국내주식 잔고/손익` | `주식 잔고·손익` |
| `국내주식 잔고/손익` | **`이체`** |
| `국내주식 잔고/손익` | **`뉴스 인사이트`** |
| `국내주식 잔고/손익` | **`지수 환율`** |
| `국내주식 잔고/손익` | **`환경 설정`** |
| `국내주식 잔고/손익` | **`로그인`** |
| `국내주식 잔고/손익` | **`편집`** |
| `HOME` | **`메뉴`** |
| `HOME` | **`퀵버튼`** |

Nine TEXT nodes, two distinct names, nine different strings. **Anyone reading layer names here would conclude the Easy quickmenu has seven copies of "국내주식 잔고/손익".** It does not. The designer duplicated nodes and never renamed them.

**Rule: on this page, read `characters`, never the TEXT node's `name`.** The set-level names are safe; the leaf text names are worthless. Note this also means `Easy` exposes menu items (`이체`, `뉴스 인사이트`, `환경 설정`, `로그인`, `편집`) that exist in **no** other variant.

**Rules are rendered as live TEXT, not pasted screenshot images** — no image-embedded rules found on this page, nothing required transcription from a bitmap.

**No `hidden="true"` frames** obstructed reading on this page. (`icon_hamburger` in the `Easy` variant has `visible: false`, but that is a component-internal toggle, not a hidden documentation frame, and it is a *finding* — see Finding 3.)

## componentKeys — SET keys vs variant COMPONENT keys

**All keys are the full 40-hex string. `importComponentSetByKeyAsync` needs the SET key.** All four sets are clean — axes readable, no duplicate variants. Keys are **`unverified`**: `importComponentSetByKeyAsync` throws in read-only sessions, and no writes were attempted.

### SET keys (`KIND: COMPONENT_SET`)

| name | SET key | axes |
|---|---|---|
| `quickmenu_basic` (`370:7438`) | `9c5dd3cd3e714255914cf288f442fad7c3ac76dd` | `Channel` (NM, N2) × `Type` (normal, pressed, **Easy**) |
| `quickmenu_allmenu` (`367:7443`) | `306256ff8cf9f31da5c059d6c1237d6ffe36c095` | `Type` (login, logout) |
| `quickmenu_ticker` (`2598:9948`) | `04062068328db463acde622df2d88d51ba3063aa` | `Type` (매매동향, 환율, news) |
| `quickmenu_nmpick` (`371:7270`) | `ffbda22a2ba9199d3c7b16937c585fbf7c9c27b8` | `Type` (today, levelup, pick, membership) |

### variant COMPONENT keys (`KIND: COMPONENT`)

`quickmenu_basic` `9c5dd3…`:

| variant | COMPONENT key |
|---|---|
| Channel=NM, Type=normal | `0b75c3c90ea55d51fd61cbd25802aa23a530f0e4` |
| Channel=N2, Type=normal | `aa3b9e35e040584f51d48ff4a393dd5264f4ca24` |
| Channel=NM, Type=pressed | `634badd32ef59a548edda5bb2d3d41e9f9adfe55` |
| Channel=N2, Type=pressed | `dd42644e355763fab65854d48ad50e35258d1e35` |
| Channel=NM, Type=Easy | `d15d4bc9a3219bcfc38e3fa508ed424de7800796` |
| Channel=N2, Type=Easy | `5384b592efaeba1c2490c64aed2eb1b150941625` |

`quickmenu_allmenu` `306256…`: Type=login `9e9f6c4ffd76df343cbb7a91e0d625e109c63023` · Type=logout `f71c8446b5ce89de6914def5358b8dfeef69e96d`

`quickmenu_ticker` `040620…`: Type=매매동향 `5df0659e015e256c80aab86509e7575074c4d82e` · Type=환율 `8808760972bdd69cbee0ef1fd0196cc64df50a94` · Type=news `c8ffb7c3216a243a50cd1fe6f985b77efd815f91`

`quickmenu_nmpick` `ffbda2…`: Type=today `bdb6f2b74a80ef557d520090791fc8a320689f04` · Type=levelup `9c6c2a3acb11eb62a8a1055f4d5cd2959cddcaf2` · Type=pick `dcc560599807c27df8705a5dfc822b5f3f8f2045` · Type=membership `e768735ede675ff12cc6aaef8511b4911741ec19`

## Sections (verbatim on-canvas copy)

| heading | verbatim Korean description | layer name |
|---|---|---|
| **BASIC** | `기본 퀵메뉴로 사용됩니다.` | `basic` |
| **ALL MENU** | `기본 퀵메뉴 내 햄버거 버튼 클릭 시 노출되는 메뉴` | `all menu` |
| **TICKER** | `기본 퀵메뉴 내 '티커' 메뉴 클릭 시 노출되는 내용입니다.` | `ticker` |
| **NAMUHPICK** | `나무멤버스에서 사용되는 퀵메뉴입니다.` | `Namuhpick` |

Note the descriptions encode a **navigation graph**, which is the one behavioral thing this page does specify:

```
quickmenu_basic ──[hamburger tap]──> quickmenu_allmenu
quickmenu_basic ──[티커 tap]───────> quickmenu_ticker
```

`quickmenu_nmpick` is scoped to **나무멤버스 (Namuh Members)** — a separate surface, not reachable from `quickmenu_basic`.

### `Type=pressed` is the expanded overlay, not a button state

`pressed` variants are **532px tall** vs 74px for `normal` — they are not a pressed *button*; they are the **full expanded menu overlay**. Rendered items (from the screenshot, verbatim):

`오늘의 투자점` · `퀵메뉴 등록` · `해외전용메뉴` · `티커` · `챗봇` · `최근화면`

The N2 `pressed` variant swaps `퀵메뉴 등록` → **`퀵메뉴 해제`** (register → unregister) with a filled star, and the bottom bar's trailing control becomes an **✕**. So `pressed` bundles *both* the overlay and its dismiss affordance.

### `quickmenu_allmenu` and `quickmenu_ticker`

- `allmenu`: `login` shows `← | 홈 | 설정 | 로그인`; `logout` shows `← | 홈 | 설정 | 로그아웃`. Only the last item differs.
- `ticker`: three Types with placeholder market data — `[코스피] 외 +164,68 개 -281,595 기 +108,18`, `[코스닥 종합] 754.23 2.43 ▼0.36%`, and a news string `고용노동부 "불법 쟁의행위에 대한 면책을 법률로 명시한 해외…`. **All placeholder** — do not quote as content rules. Each ticker carries a trailing ✕ (dismissible).
- `nmpick`: 4 Types (`today`/`levelup`/`pick`/`membership`), rendering as a 4-tab bar `나무투데이 | 나무레벨업 | 나무PICK | MY멤버십` with the active tab bolded. **The `Type` axis selects which tab is active** — it is not four different components.

## Interaction / timing rules — **BLANK AT SOURCE**

**Reporting the blank as the finding, per the domain rule.** The page names *triggers* in prose but specifies **no** timing or dismissal mechanics:

- **No `Last update` stamp on this page.** Verified programmatically. Recency unknown — do not borrow the Tab page's `2025.12.18`.
- **No usage frame.** Unlike the Tab page (which has `Tab_usage` with 사용방법 / 사용 시 유의사항), this page has **no** stated do's/don'ts and no exception policy.
- **Triggers named, mechanics absent.** "햄버거 버튼 클릭 시 노출" and "'티커' 메뉴 클릭 시 노출" name *what* opens the overlay. **No animation, duration, easing, or direction** is given for the 74px→532px expansion.
- **Dismissal is unspecified.** The ✕ affordances exist in the artwork (`pressed`, `ticker`) but **no dismissal rule is written** — no tap-outside behavior, no auto-dismiss timeout, no persistence rule for the ticker.
- **No rule for which 5 labels appear.** `퀵메뉴 등록`/`퀵메뉴 해제` implies the bar is **user-customizable**, but the five labels are hardcoded in every variant and **no rule governs the default set, the max count, or overflow.**

Do not infer any of the above from the mockups. If a build needs the expand animation or the dismissal rule, that is an **open question for the designer** — and given the `NDS 추가 개발 해당없음` badge, it may never be answered in this file.

## How this feeds BUILD mode

- **All four sets are usable.** This is the only clean page in the batch — no `"Component set has existing errors"` blocker (contrast `header_basic` and `nds_img_tab_gradation`). Keys `unverified` (read-only).
- **Correct Core's `quickmenu_basic` row**: it is hamburger + **5 two-line TEXT labels** + a trailing `icon_영역` slot, and the `Type` axis has a **third value, `Easy`**, which hides the hamburger and swaps both end caps.
- **Read `characters`, never TEXT layer names, on this page.** The `Easy` variant has nine mislabeled TEXT nodes. This is the single highest-risk trap here.
- **`Type=pressed` is the expanded overlay** (532px), not a button press state. Don't reach for it to show a tap-down.
- **`Channel`: NM / N2 only** — no `QV` on this page, same as the Header page.
- **Treat the badge as scope, not as a defect.** Nothing here needs fixing; it just isn't going to grow. If a case is missing, escalate rather than wait.
