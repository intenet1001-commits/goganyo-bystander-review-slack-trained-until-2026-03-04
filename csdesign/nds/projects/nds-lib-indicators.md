---
name: nds-lib-indicators
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=2846-8724"
learned_date: 2026-07-16
sections_studied:
  - "2846:8724 (page '    - Indicators (pagination, step)' — 4 top-level frames; note TWO are layer-named '2. Step')"
  - "2846:8725 (frame '1. Indicator' — on-canvas heading 'Indicator'; PAGINATION family)"
  - "4122:7363 (frame '2. Step' — on-canvas heading 'Step Indicator'; the Step dot family + a 완료/현재/미래 progress rail)"
  - "7458:12063 (frame '2. Step' — on-canvas heading 'Step gauge'; the gauge/bar family. DUPLICATE layer name with 4122:7363)"
  - "4122:7544 (frame 'Step_usage' — on-canvas heading 'Step Usage'; the rule block + Last update stamp)"
  - "2283:15401 / 13421:14219 (COMPONENT_SETs pagination01 / pagination02, axis Step)"
  - "4122:7364 (COMPONENT_SET 'Step', axes Channel × Total × Step, 28 variants)"
  - "7458:12247 (COMPONENT_SET 'gauge', axes Channel × 총단계 × 현재순서, 36 variants)"
  - "be9d70861f0510a5ea083d0c20360aafae7f4c56 (COMPONENT_SET 'nds_icon_step', axes Channel × Step, 30 variants — reached via instance 36500:3460)"
status: "live — Last update stamp '2022.11.08 구자영' (4122:7558); all sets resolve cleanly. But see the two 기획논의필요 (needs planning discussion) markers below: parts of this page are explicitly UNRESOLVED at source."
---

# NDS Library — Indicators (pagination, step)

Three unrelated indicator families live on this page: **PAGINATION** (carousel dots), **STEP** (numbered progress dots), and **gauge** (a progress bar). Only the Step family has a usage page.

## The rule block, verbatim (`4122:7544`)

⚠️ **This is the `Step_usage` page — it governs Step only. There is no usage page for pagination or gauge.**

Heading **사용방법**:
> 1. 상품 매수, 서비스 신청 등 페이지 이동 순서가 필요할 때 상단에 쓰입니다.
> 2. 단계별 properties를 확인합니다.

Heading **사용 시 유의사항**:
> - 제공된 라이브러리 이외의 스텝 표기는 지양합니다.
> - (for designer) 예외케이스는 해당하는 templates에 추가하도록 합시다.
> - 영역이 잡힌 하기의 템플릿을 사용합니다.   **Go to templets →**
> - 2 Step 이상일때만 사용가능합니다. (최소몇개? 최대몇개?) **기획논의필요**
> - 완료는 단계에 포함하지 않습니다. **기획논의필요**

**Decoded:**

- **Placement is fixed: 상단 (top of page).** Steps are for multi-page flows — 상품 매수 (product purchase), 서비스 신청 (service application).
- **Closed set.** 제공된 라이브러리 이외의 스텝 표기는 지양합니다 — don't invent step notations. Exceptions go into the relevant **template**, not into an ad-hoc component.
- **Minimum 2 steps.** But — see below.

### ⚠️ Two rules are explicitly UNRESOLVED at source

Both are annotated **기획논의필요** ("planning discussion required") in red on the canvas. **This is not me failing to find the answer — the guide itself says the answer does not exist yet:**

1. **`2 Step 이상일때만 사용가능합니다. (최소몇개? 최대몇개?) 기획논의필요`** — "usable only at 2+ steps. (minimum how many? maximum how many?)". The author wrote the floor as 2, then immediately questioned their own floor **and** the ceiling. **The component sets themselves cap at Total=5 (Step) and 총단계=6 (gauge)** — but that is what was built, not a stated rule.
2. **`완료는 단계에 포함하지 않습니다. 기획논의필요`** — "완료 (completion) is not counted as a step". Also unresolved. This directly contradicts the on-canvas progress rail at the bottom of `4122:7363`, which renders four labelled positions **완료 / 현재 / 미래 / 미래** — i.e. 완료 *is* shown as a position there.

**Do not resolve these by picking the more plausible reading.** Both are open questions carrying a red flag from the design owner. Flagged for LEDGER.

### `Go to templets →` is a dead link

`4122:7556`, rendered in red as a call to action. **`templets` is misspelled at source** (should be `templates`). It is a plain TEXT node with **no prototype action and no hyperlink** — there is nothing to follow. The templates it points at are **not on this page and not identified**. Blank at source.

The `step_header` set (`45936:3681`, axis `Property 1` = `Default` | `flowing`) sits directly under this text and is presumably "the template with the area marked out" (영역이 잡힌 하기의 템플릿). It renders `스텝명` (Default) and `텍스트가 범람하면 흐르는 애니메이션 효과가 들` (flowing) — the latter is **truncated mid-word at source** (`…효과가 들`, cut off). It documents an **overflow marquee animation** for long step names; the copy describing it is itself overflowing. The animation's timing/direction are **not specified anywhere**.

Note `Property 1` is Figma's **default auto-generated axis name** — nobody renamed it. Low-polish signal.

## PAGINATION (`2846:8725`)

On-canvas: **PAGINATION — 카드, 배너 등에 사용되는 기본 인디케이터** ("the basic indicator used for cards, banners, etc."). Carousel dots — the active dot renders as a stretched pill, the rest as circles.

Two component sets, **both with axis `Step` only, 3 variants each (`Step=2|3|4`)**:

| Set | Key | Rendered on |
|---|---|---|
| `pagination01` (`2283:15401`) | `1f8a2fec…` | light background |
| `pagination02` (`13421:14219`) | `323d44bc…` | **dark background** |

**`Step` here means *total dot count*, not the active index.** `Step=4` renders 4 dots with the 1st active; `Step=2` renders 2. The active dot is always first and **is not parameterised** — there is no way to select dot 3 of 4. If a carousel needs to show progress past the first slide, **this component cannot express it**. Blank at source.

**`pagination01` vs `pagination02` is a light/dark pair, but neither is named for it** — no `Channel`, no `Theme` axis, just two sets with numeric suffixes. You must know that 01=light, 02=dark. Flagged for LEDGER.

**The rest of the PAGINATION frame is empty.** `2846:8725` is 1200×1597 and everything below y≈718 is blank. **Blank at source is the finding** — there is no pagination usage guide, no dot-size spec, no spacing spec, no max-dot-count rule.

Four stray nodes float at page level near `(1033–1087, 1058)`: a `Rectangle 7` and three `switcher_table_asset` instances, each **6×3 px**. They are outside every frame and are not referenced by anything. Debris.

## STEP (`4122:7363`)

On-canvas: **STEP — 스텝에만 사용되는 인디케이터** ("the indicator used only for steps"). Numbered dots: the active step is a filled circle with its number; inactive steps are small grey dots.

**`Step` (`4122:7364`)** — key `2f04e96b200a3ec5cd0610378fb714fb23ab7461`, **axes `Channel` × `Total` × `Step`**, 28 variants.

- `Channel` = `NM` | `QV` — and it behaves exactly as `nds-mweb-colors` predicts: **NM renders the active dot green, QV renders it orange/amber.** Visually confirmed on canvas.
- `Total` = `2` | `3` | `4` | `5` — total step count.
- `Step` = `1`…`Total` — the active index.

**The matrix is complete but asymmetric: 28 = NM(2+3+4+5=14) + QV(14).** Every (Total, Step) pair exists for both channels. **`Total=2` exists** — consistent with the "2 Step 이상" floor. **There is no `Total=6+`.**

### ⚠️ A separate, mislabelled progress rail

At the bottom of the frame (`36500:3459`) sits a **different** widget: a horizontal rail of 4 circles joined by lines, labelled **완료 / 현재 / 미래 / 미래**. Its instances resolve to a component set **`nds_icon_step`** (key `be9d70861f0510a5ea083d0c20360aafae7f4c56`, **axes `Channel` × `Step`, 30 variants**) — *not* to the `Step` set above.

`nds_icon_step`'s `Step` axis vocabulary is: **`01`–`07`, `next01`–`next07`, `pre`** (× NM/QV). So: `01`–`07` = numbered/current, `next*` = future, `pre` = completed.

**⚠️ Verified name lie — instance overrides:** the instance at `36500:3460` is **layer-named `Channel=NM, Step=next01`**, but `getMainComponentAsync()` returns **`Channel=NM, Step=pre`**. The instance was swapped to `pre` (correctly — it sits under the **완료** label and renders a ✓ checkmark, not a number) and **Figma kept the old variant name as the layer name**. Three sibling instances are all named `Step=next02` yet render as `1`, `4`, and a plain dot.

**Consequence: on this page you cannot read variant state off instance layer names.** They are stale override fossils. This is the concrete mechanism behind the batch-wide "layer names lie" warning — and it's worth noting it's *Figma's* behaviour, not sloppiness: renaming happens at swap time only.

Note also that the rail renders **완료 as a ✓ (not a number)**, which is at least consistent with `완료는 단계에 포함하지 않습니다` — but that rule is 기획논의필요, so this is evidence, not confirmation.

## gauge (`7458:12063`)

On-canvas: **Step gauge — 상단 아래에 게이지 형태로 들어가는 스텝** ("a step that goes in below the top, in gauge form"). A 540×4px progress **bar**, not dots.

**`gauge` (`7458:12247`)** — key `221d620b9fdb17b67d6c623aeaaa5c6c93aa667a`, **axes `Channel` × `총단계` × `현재순서`**, 36 variants.

⚠️ **This set's axes are named in KOREAN** (`총단계` = total steps, `현재순서` = current position) while the sibling `Step` set uses **English** (`Total`, `Step`) for the identical concepts. **Same file, same page, two vocabularies.** Any code that generically drives "the step indicator" must branch on which set it holds. Flagged for LEDGER.

- `Channel` = `NM` | `QV`
- `총단계` = `3` | `4` | `5` | `6` — **note `2` is absent** (the `Step` dot set has `Total=2`; gauge starts at 3), **and `6` is present** (the dot set stops at 5). **The two families have different, non-overlapping step ranges and nothing on the page says why.** Flagged.
- `현재순서` = `1`…`총단계`

36 = NM(3+4+5+6=18) + QV(18). Complete.

On-canvas row labels read `3 step` / `4 step` / `5 step` / `6 step`. NM occupies the left column, QV the right.

## Name-reliability verdict for this page

**Mixed — the specific failure mode is INSTANCE layer names, which are stale variant fossils.**

- **TEXT node names: reliable.** `4122:7555`, `4122:7557`, `4122:7547` etc. match their renders exactly.
- **COMPONENT_SET names and variant names: reliable and load-bearing.** Trust `Channel=NM, Total=4, Step=2`.
- **INSTANCE names: unreliable — verified false.** `36500:3460` is named `Step=next01` and IS `Step=pre`. Always call `getMainComponentAsync()`.
- **FRAME names: unreliable.** **`2. Step` names two different frames** (`4122:7363` Step Indicator, `7458:12063` Step gauge). Route by on-canvas heading.

**Rules embedded in screenshot images: NO.** All prose is live text. Screenshots were needed to (a) discover the `기획논의필요` red flags, which are formatting not content, (b) confirm NM=green / QV=orange, and (c) establish that most of the PAGINATION frame is genuinely empty.

**No `hidden="true"` frames on this page.**

## How this feeds BUILD mode

- **Three families, three different components — pick deliberately:** carousel dots (`pagination01/02`), numbered step dots (`Step`), progress bar (`gauge`).
- **Step ranges differ and are not interchangeable:** `Step` supports Total 2–5; `gauge` supports 총단계 3–6. Need 2 steps → dots only. Need 6 → gauge only.
- **Axis vocabulary differs:** `Total`/`Step` (English) on the dot set, `총단계`/`현재순서` (Korean) on gauge. Same meaning.
- **`Channel` = NM (green) | QV (orange)** on `Step`, `gauge`, and `nds_icon_step`. **`pagination01/02` has NO Channel axis** — it's light/dark instead, chosen by set, not by variant.
- **Pagination cannot show a non-first active dot.** If the design needs that, this component is wrong; escalate.
- **Treat "min/max step count" and "does 완료 count as a step" as OPEN.** Both are 기획논의필요 at source. Don't ship an assumption — ask.
- **Steps go at 상단.** Gauge goes 상단 아래 (just below the top).
- **Never read variant state off an instance's layer name on this page.** Resolve the main component.
