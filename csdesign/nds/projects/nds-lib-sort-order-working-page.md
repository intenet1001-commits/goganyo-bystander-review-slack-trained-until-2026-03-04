---
name: nds-lib-sort-order-working-page
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=3408-8605"
learned_date: 2026-07-16
sections_studied:
  - "6288:11452 + 6288:11458 + 6288:11453/11454 (TEXT '정렬 순서' over a DOUBLE-HEADED vertical arrow, '기획/디자인의 첫 단계 (Framework)' at TOP, '기획/디자인의 마무리단계 (Detail)' at BOTTOM — the ordering axis)"
  - "6288:11430 (frame 'Frame 2' — the column under the on-canvas 'V1' label; 16 items, Banner-first)"
  - "6288:11391 (frame 'Frame 1' — the column under the on-canvas 'V2' label; 18 items, Header-first)"
  - "6288:11410 (frame 'Frame 13' — the column under the on-canvas 'V3' label; 19 items, Header-first)"
  - "5088:9003 (COMPONENT 'guide_parent' — the index card used 20× on the Welcome page; standalone COMPONENT, NOT a variant set)"
  - "5079:9653 (COMPONENT_SET 'Component 1' — 22 'Property 1=…' thumbnail variants; a SEPARATE component from guide_parent)"
  - "6288:11459 ('스크린샷 2022-12-13 오전 10.10 1' — a pasted YouTube screen-capture of an EXTERNAL 원티드(Wanted) talk; rules live inside this image)"
  - "6288:11385/11387/11388/11389/11390 (five ' 스크린샷 2022-11-29' captures — an external design-system component catalogue)"
status: "working-draft — evidenced. See 'Why working-draft' below: the page is blank-named, sits last, contains pasted external YouTube/benchmark captures with a visible video scrubber, holds three competing superseded orderings, and carries an empty 'Paste your design here' placeholder. Its ordering rationale is HISTORICAL. But it also DEFINES guide_parent, which the live Welcome page consumes 20× — so the page is not inert and must not be deleted or ignored."
---

# NDS Library — the blank-named page (`" "`, page 51 of 51)

A page named with a single space, sitting last in the file, omitted from the Welcome TOC. A separator-heuristic would skip it. **It should not be skipped:** it defines `guide_parent` — the card component the live Welcome page renders 20 times — and it is the only record of *why the component library is ordered the way it is*.

## Why `working-draft` — the evidence

Judged on evidence, not on the blank name:

| Evidence | Reading |
|---|---|
| Six pasted **external** screen-captures, `스크린샷 2022-11-29` ×5 and `스크린샷 2022-12-13` ×1 | Reference gathering, not authored spec |
| `6288:11459` shows a **YouTube player with a visible scrubber reading `15:29 / 20:24`** and a mouse cursor mid-frame | Someone was *watching a talk and screenshotting it*. This is unambiguously a scratch artifact. |
| **Three** competing orderings (V1/V2/V3) shown side by side | Deliberation in progress — a sanctioned page would show one |
| `6288:11448` `Frame 9003` contains an INSTANCE literally named **`Paste your design here`** | An unfilled placeholder from a mockup plugin |
| Frames named `Frame 1`, `Frame 2`, `Frame 13`, `Component 1`, `Group 9193` | Default auto-generated names — nothing was tidied |
| Page is blank-named, positioned last, and absent from the TOC | Not meant to be navigated to |
| **Counter-evidence:** `guide_parent` (`5088:9003`) is defined here and instanced 20× on the **live** Welcome page | The page is load-bearing despite being scratch |

**Verdict: a designer's working page that accidentally became structural.** The ordering rationale on it is **historical** — it records how the decision was reached, and V3 is not necessarily what shipped (see the reconciliation check below). But `guide_parent` is live. **Do not treat V1/V2/V3 as sanctioned specification; do treat `guide_parent` as a real component.**

## Name reliability — UNRELIABLE for frames, reliable for authored text

**The V-column frames are named in a way that actively misleads:**

| On-canvas label | Actual frame | Position |
|---|---|---|
| **V1** | `Frame 2` (`6288:11430`) | x=839 |
| **V2** | `Frame 1` (`6288:11391`) | x=1933 |
| **V3** | `Frame 13` (`6288:11410`) | x=3336 |

**`Frame 1` is V2 and `Frame 2` is V1.** Anyone mapping by frame name gets V1 and V2 backwards. The mapping above was established by **x-coordinate containment** (each `V` label sits inside its column's x-range) and then **confirmed by screenshot** (the leftmost column visibly begins with `Banner`; V2 and V3 begin with `Header`).

Authored TEXT (`정렬 순서`, `V1`/`V2`/`V3`, the Framework/Detail labels, and every list item) **is** truthfully named — `name === characters` except for line breaks. **`Rules embedded in screenshot images: YES` — six of them; transcribed below.**

## The ordering axis — `정렬 순서`

`6288:11452` renders **`정렬 순서`** ("sort order"), heading a **double-headed vertical arrow** (`6288:11458`, 4657px tall) with, verbatim:

- **TOP** (`6288:11453`): `기획/디자인의 첫 단계\n(Framework)`
- **BOTTOM** (`6288:11454`): `기획/디자인의 마무리단계\n(Detail)`

Confirmed by screenshot: the arrow is **vertical and double-headed**, Framework at top, Detail at bottom. The V1/V2/V3 columns are vertical lists sharing that y-range.

> **The rationale, stated plainly: the component library is ordered by *when you reach for the component during the design process*, not alphabetically and not by visual similarity.** You lay down the Framework first (Header, Quickmenu, Tabs — the screen's skeleton), and you finish with Detail (snack bar, tooltip, Labels — the garnish). Every one of the three orderings obeys this: all three start with page-level chrome and all three end with `Labels`.
>
> This is a genuinely opinionated, non-obvious IA decision and it explains the page order of the *entire* NDS_Library file. It also dovetails with `nds-lib-justify`'s thesis (information first, ornament last). **It is the single most reusable idea on this page** — and it is recorded nowhere else in the domain.

## The three orderings — transcribed in full

Verbatim, top→bottom (= Framework→Detail). ⟵ **read the columns as a sequence of drafts.**

| # | **V1** (`Frame 2`, 16 items) | **V2** (`Frame 1`, 18 items) | **V3** (`Frame 13`, 19 items) |
|---|---|---|---|
| 1 | Banner | Header | Header |
| 2 | Bottom navigation | Quickmenu | Bottom Navigation (Quickmenu) |
| 3 | Bottom sheet | Buttons - Bottom / Common | Box Button |
| 4 | Box button | Tabs - Top / Common | Text button |
| 5 | Capsule button | Select Box(Combo) - Line / Date / Combo / Text | Tab |
| 6 | Text Fields(input) | Account - Line / Combo / Text | Combo Box |
| 7 | Account | Text Fields(input) - Line / Combo | Date Picker |
| 8 | Popups | Bottom sheet | Text Field(Input box) |
| 9 | Data Table | Layer popup | Bottom sheet |
| 10 | Cards | Data Table | Layer popup |
| 11 | Lists | Cards | Data Table |
| 12 | Search bars | Lists | Cards |
| 13 | Controls (toggle, check, radio) | Search bars - Line / Round | Lists |
| 14 | Indicator (pagination, switch, step) | Controls (toggle, check, radio, switch) | Search bars - Line / Round |
| 15 | Dialog(snack bar, tooltip) | Indicator (pagination, step) | Controls (toggle, check, radio, switch) |
| 16 | Labels | snack bar | Indicator (pagination, step) |
| 17 | | tooltip | snack bar |
| 18 | | Labels | tooltip |
| 19 | | | Labels |

(Trailing spaces preserved in source on V2's `Buttons - Bottom / Common `. V1's `Capsule button`, `Banner` and V2's `Quickmenu` are verbatim.)

### What changed, and why it matters

**V1 → V2 — the pivot from a borrowed inventory to NDS's own.**
- **`Banner` is dropped entirely** and never returns. `Bottom navigation` → **`Quickmenu`**, `Popups` → **`Layer popup`**. This is the moment the list stops using generic industry names and starts using **NH's internal vocabulary** — precisely the "명칭을 통일" goal the Welcome page states as the Component Guidelines' purpose.
- **`Header` appears for the first time and takes position 1**, displacing `Banner`. The framework-first axis is being applied more strictly: a Header is more foundational than a Banner.
- Ordering is re-sorted to put **navigation + buttons + inputs (framework)** above **containers (Data Table/Cards/Lists)** above **indicators/dialogs (detail)**.
- `Dialog(snack bar, tooltip)` is **split into `snack bar` + `tooltip`** as separate entries.
- Items acquire **variant suffixes** (`- Line / Round`, `- Line / Combo`, `- Top / Common`) — the list is starting to describe an actual component library rather than a wishlist.
- `switch` migrates from `Indicator (pagination, switch, step)` → `Controls (toggle, check, radio, switch)`. **A genuine taxonomy correction:** a switch is an input control, not an indicator.

**V2 → V3 — normalisation and disaggregation.**
- Names are **regularised to Title Case**: `Quickmenu` → `Bottom Navigation (Quickmenu)`, `Buttons - Bottom / Common` → `Box Button`, `Tabs - Top / Common` → `Tab`, `Select Box(Combo) - …` → `Combo Box`.
- **`Text button` and `Date Picker` are broken out as first-class entries** (previously folded into `Buttons - Bottom / Common` and `Select Box(Combo) - Line / Date / …`). Net +1 item.
- **`Account` is dropped** from the list — though an `    - Account Contoller  계좌 컨트롤러` page exists in the live file **[sic — `Contoller`]**. So V3 is *not* a faithful picture of the final file either.
- Inputs are pulled **above** Bottom sheet/Layer popup; overlays sink toward Detail.

> **Trajectory: V1 is a borrowed catalogue; V2 is NDS asserting its own vocabulary; V3 is NDS tidying that vocabulary into shippable component names.** Each step moves further from the pasted reference sheets and closer to the live file's page list.

### Reconciliation: did V3 ship? — **No, not exactly**

Compared against the live file's real 51-page list (`Components` section), V3 is **close but superseded**:

- V3 order **Header → Bottom Navigation (Quickmenu) → Box Button → Text button → Tab → Combo Box → Date Picker → …**
- Live page order: **Top Navigation (Header) → Bottom Navigation (Quickmenu) → Tab → Box Button → Popup → Tooltip → Dialog → Title → List → Card → Data Table → Chart → Pulldown (Select) → Text Field → Account Contoller → Search bar → Controls → Label → Indicators → …**

Differences: the live file **restores `Account`** (which V3 dropped), **adds `Chart`, `Title`, `유의사항`, `Number Keypad`, `Security Keypad`, `9-patch`** (none in any V), **moves `Tab` above `Box Button`**, uses **`Pulldown (Select)`** rather than V3's `Combo Box`, and has **no `Date Picker` page at all** despite V3 promoting it (the Welcome TOC also lists a phantom `Date Picker` — see `nds-lib-welcome.md`; **the two phantoms are almost certainly the same drift, and this page is plausibly its origin**).

**Conclusion: there is an unrecorded V4+ that this page never captured.** The live file's grouping-by-`📍`-section largely honours the Framework→Detail axis, so **the *principle* survived; the *specific orderings* did not.** Treat V1/V2/V3 as history.

## CORE — componentKeys (read-only session ⇒ all `unverified`)

> ⚠️ **Correcting the briefing's assumption.** The task brief stated that `Component 1` is *"a COMPONENT_SET whose variants are the `guide_parent` cards"*. **That is not what the file contains — they are two separate components.** Verified via the Plugin API: `guide_parent` (`5088:9003`) is a **standalone `COMPONENT`** whose `parent` is the PAGE (`variantProperties: null`); `Component 1` (`5079:9653`) is a **separate `COMPONENT_SET`**. The Welcome page's card at `5144:10284` was resolved with `getMainComponentAsync()` → its main component is **`5088:9003` (`guide_parent`)**, *not* any variant of `Component 1`. Conflating them would send a BUILD pass to the wrong key **and the wrong import function.**

### 1. `guide_parent` — the card used 20× on the live Welcome page

| Field | Value |
|---|---|
| **KIND** | **`COMPONENT`** (standalone; **not** a variant set, **not** a set member) |
| **componentKey** | `965da57e41718e449483f3e85afe510b30695d3b` |
| Node id | `5088:9003` · `remote: false` · parent = PAGE |
| **Import with** | **`importComponentByKeyAsync()`** — ⚠️ **NOT** `importComponentSetByKeyAsync()`; it has no set |
| Size | 550×558 |
| Confidence | **`unverified`** — read-only session; key read off the node, never round-tripped through an import |

Renders as: thumbnail panel over an underlined linked Korean title + English label + 2-line description (screenshot-confirmed).

### 2. `Component 1` — COMPONENT_SET (the thumbnail artwork)

| Field | Value |
|---|---|
| **KIND** | **`COMPONENT_SET`** |
| **SET key** | `63dad438b76acef52f178928763cb34708cc377e` |
| Node id | `5079:9653` · `remote: false` · single property `Property 1` · 22 variants |
| **Import with** | **`importComponentSetByKeyAsync()`** (SET key above) |
| Confidence | **`unverified`** — read-only session |

**All 22 variant COMPONENT keys** (each is a member `COMPONENT` — use `importComponentByKeyAsync()` for an individual variant; **variant keys ≠ the SET key above**). Names verbatim, typos preserved:

| `Property 1` | Variant COMPONENT key (40-hex) | Node id |
|---|---|---|
| `Header` | `64f6296c7bb0f16bd6d53b26ba44a6203ebebee6` | `5079:9644` |
| `Bottom Navigation` | `d4801e4906367f00e1f7e6c4bc4125dfa2da2ee3` | `5079:9645` |
| `Box Button` | `34c66aaa5207d2a9426e61323648e6dead9a0ff6` | `5079:9646` |
| `Text Button` | `8ea3a0900a89683fecea1aeae1456655574819ee` | `5123:9878` |
| `Tab` | `a4963849b6c07fe43a9f05b0269d3259ea54d53d` | `5079:9648` |
| `Combo Box` | `3438e2e883e02acd1a0fc7db20d48f12da8493a7` | `5079:9649` |
| `Date Picker` | `e48ed3361e38350c5828afb78b81a3f45ccdf87c` | `5079:9650` |
| `Text Field(Input)` | `d1aefae718a1c6db2e28c2b95ea70ff7a8686623` | `5079:9651` |
| `Bottom Sheet` | `99580c0c4f1b4fd416b62f86fc61efb40a5a5fa0` | `5123:9986` |
| `Layer Popup` | `e31a83a2e42206197e2413adcdf6369fdd9d6b27` | `5123:9970` |
| **` Full Popup`** **[sic — leading space in the value]** | `8304a78b602ffa1c0e249fb8cd953497429b50b6` | `5913:10288` |
| `Data Table` | `92b16e44b0da0a232e15cd73155fc5211dd327d4` | `5079:9652` |
| `Card` | `90e5201bb5e5abe4758e58ac58f3b5b97e81ce04` | `5144:9269` |
| `List` | `e984d63cb8fa78bd211f4097d7b6172bbb46e38d` | `5144:9304` |
| `Search Bar` | `9446f4b94e846fe1e3dfba49ad3cc797206a59ed` | `5144:9380` |
| `Account` | `3c2cd1e3e03a6d3f88e14ed943a2882a469b1ac0` | `7229:11440` |
| `Control` | `e8777e8be243304808168b79355bba3a59aecff3` | `5144:9423` |
| `Indicator` | `c114731c0b724ba209fd59c87d97e7e9c1aaa4e6` | `5144:9493` |
| **`Lable`** **[sic — misspelling of "Label"]** | `89e538ae0e5c96f09e0982bbb1d74664cfbcd011` | `5144:9878` |
| `Snack Bar` | `6a1a4ea000466871675328710c1b1d18c12a35c3` | `5144:9833` |
| `Tooltip` | `4cc83b60a727c2fad8e49ae801eb58a69c3fb7a4` | `5144:9848` |
| **`Variant20`** **[sic — default auto-generated name, never renamed]** | `e13407a0709cbdc42fcff1f661501e48495159ff` | `5191:9421` |

**Typos are real and load-bearing** — `Property 1=Lable` and `Property 1= Full Popup` (leading space) are the **actual string values** a `setProperties()` call must pass. Do not "fix" them in code. **`Variant20`** is an unnamed leftover and its content is unidentified.

> The variant list is essentially **V3's ordering** (Header, Bottom Navigation, Box Button, Text Button, Tab, Combo Box, Date Picker, Text Field(Input), Bottom Sheet, Layer Popup, …) — corroborating that V3 was the ordering in force when this artwork set was built, and that `Component 1` and the V-columns are the same decision at two levels of finish.

## The six pasted screenshots — rules inside images, transcribed

Text extraction is blind to these. All six are **external reference material, not NDS rules.**

### `6288:11459` — `스크린샷 2022-12-13 오전 10.10 1` (2048×1152)

**A screen-capture of a YouTube video** — player scrubber visible reading **`15:29 / 20:24`**, mouse cursor mid-frame. Slide heading, verbatim:

> **3. 원티드 컴포넌트로 알아보는 피그마 신기능 도입 사례**
> **수준별로 인지하기 쉽게 배포**
> **배포된 컴포넌트 배경색 각주**

A colour-coded **component-maturity legend**, verbatim:

| Swatch | Label |
|---|---|
| 🔵 blue | 디자인 & 개발 배포 완료 |
| 🟢 green | 디자인 그룹 내 배포 완료 |
| 🟡 yellow | 테스트, 피드백 받는중 but 활용 가능한 수준 |
| 🔴 red | 아직 정규배포 안함. 매우 불안정 |
| ⚪ grey | 그 외 신경쓰지 않은 배경색<br><sub>UI가 아닌것들 혹은 레거시 컴포넌트</sub> |

Right half (partly cropped) shows the scheme applied — component frames on orange/teal backgrounds labelled `Button / Action`, `Button / Round`, `Button / Template`, `Button / Text B…`, headed `실제 적용 예시`.

> 🚨 **This is 원티드(Wanted)'s convention, from a conference talk — NOT NH's.** It is the most misquotable thing in this batch: a five-colour component-status scheme, in Korean, sitting inside an NH file. **No evidence was found that NDS ever adopted it** — no such colour-coding appears on the Welcome page's index or anywhere else observed. **Do not record this as an NDS rule.** Its presence here is evidence of *what the designer was researching*, which is exactly why the page reads as a scratch page.

### `6288:11385` + `6288:11387/11388/11389/11390` — `스크린샷 2022-11-29 오전 10.55/10.56` (~1031×1102 each)

A screenshotted **component catalogue from an external Korean design system** (green accent; card layout = thumbnail + bold English name + 2-line Korean description). Transcribed sample (`6288:11385`, top row), verbatim:

> **Banner** — Banner는 특정 이벤트나 프로모션 등을 강조하기 위해 사용하는 이미지 컴포넌트입니다.
> **Bottom navigation** — 하단 내비게이션은 앱 내 주요 피쳐들로 구성되어 사용자가 쉽고 빠르게 접근할 수 있도록 합니다.
> **Bottom sheet** — Bottom sheet는 화면 하단에 고정되어 기존 화면과 관련있는 내용이 포함된 표면입니다.

Full inventory visible across the five captures: `Banner`, `Bottom navigation`, `Bottom sheet`, `Box button`, `Capsule button`, `Floating action button`, `Icon Button`, `Text button`, `Chips`, `Checkbox`, `Radio button`, `Switch`, `Snackbar`, `Toast overlay`, `Tooltip`, `Empty`, `Input`, `List header`, `Search bar`, `Pagination`, `Popup`, `Profile`, `Progress indicator`, `Spinner`, `Tabs`, `Top navigation`, `Video player`, `Card`, `Image grid`, `List`.

> **These two findings connect, and together they explain the whole page.**
>
> 1. **This catalogue is V1's source.** V1 opens `Banner → Bottom navigation → Bottom sheet → Box button → Capsule button …` — the reference sheet's own order, including `Banner` and `Capsule button`, both of which NDS later dropped. **V1 was a transcription of someone else's library.** V2 and V3 are the record of NDS replacing borrowed structure with its own.
> 2. **This catalogue is `guide_parent`'s source.** The card layout — thumbnail panel over bold name over a 2-line Korean description — is the layout `guide_parent` renders on the live Welcome page. **The NDS component index was modelled on this benchmark.**
>
> So the page is coherent: *watch a talk on component systems → screenshot a benchmark library → copy its inventory (V1) → argue it into NH's own vocabulary (V2, V3) → build the card component (`guide_parent`) → ship the index to Welcome.* **Scratch page, real output.**

**Source of the catalogue: unidentified.** The 원티드 talk in the sibling capture makes Wanted a candidate, and the two captures are two weeks apart — but the sheets carry no visible wordmark, and the green accent is not conclusive (NH/NAMU is also green). **Not guessed.**

## Other content on the page

- `6288:11448` `Frame 9003` → `Screen` → INSTANCE **`Paste your design here`** (111×103) — an **unfilled placeholder** from a device-mockup plugin. Blank at source.
- `6288:11447` `Body` (vector, 120×257) and `6288:11386` `Group 9193` (a container for four of the 11-29 captures) — no rule content.

## Gaps / unverifiable

- **All keys are `unverified`** — read-only session; no `importComponentByKeyAsync` / `importComponentSetByKeyAsync` round-trip was performed. Keys were read directly off `node.key` with `remote: false`.
- **`Property 1=Variant20`** — unnamed variant; its artwork was not individually screenshotted. Content unknown.
- **The V-columns' relationship to the arrow is inferred, not annotated.** The arrow sits at x≈-4300; the V-columns at x=839–4295. They share a y-range and the top→bottom reading is self-evidently Framework→Detail (all three end in `Labels`), but **no connector line ties them together.** Confidence: high, but it is a reading.
- **The five `2022-11-29` captures were not all individually transcribed** — `6288:11385` was read at full resolution; the other four were read from a page-level render and their inventory listed, but their body copy was not transcribed line-by-line. They appear to be the same catalogue paginated.
- **No `Last update` stamp** anywhere on this page. The `2022-11-29` / `2022-12-13` screenshot filenames date the *research*, not the page.
- The catalogue's origin, and whether NDS ever adopted the Wanted maturity-colour scheme, are both **open**.
