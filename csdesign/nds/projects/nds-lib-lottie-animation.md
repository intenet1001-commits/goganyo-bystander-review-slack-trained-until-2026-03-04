---
name: nds-lib-lottie-animation
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=59389-2505"
learned_date: 2026-07-16
sections_studied:
  - "59389:2505 (page '    - Lottie animation' — the whole canvas, 1,184 nodes)"
  - "59455:2438 (frame layer-named 'infographic_Lottie' — ON-CANVAS heading reads 'Infographic Lottie: 4개' / subtitle 'QV-NM Infographic'. NM channel.)"
  - "59455:2754 (frame layer-named 'infographic_Lottie', x=1601 — the QV mirror of the above)"
  - "66561:25648 (section '📌 nds_lottie_~.json' — the main asset catalog: 차분이 / 커서 / N2 로딩 인디케이터 / CS 아이콘 / 오디오웨이브 / 하트(현재가 헤더) / 터치 포인터 / 시킹알파 게이지 / 완료·실패 애니메이션 / 연금스쿼드 / 온보딩스쿼드 / AI스쿼드)"
  - "52671:2535 (section '📌 event_lottie_~.json')"
  - "59455:3076 (text — 'Last update  2025.11.14  유상엽')"
status: "live — carries its own 'Last update 2025.11.14 유상엽' stamp (59455:3076), and a dated policy note '25.11.11 이후 전달되는 로띠 파일명은…' (65676:7109). The most recently-updated page of the four learned in this batch."
---

# NDS Library — Lottie animation (asset catalog, NOT a motion spec)

**Headline finding — this settles a standing domain-level claim.**

This page contains **no timing or easing values whatsoever**. The domain's recorded claim that time/interaction/animation rules are *systematically blank across NDS* is **CONFIRMED**, and this page is now the strongest evidence for it: the one page in the file whose name promises animation specs delivers a **file-delivery catalog** instead.

This is a **blank-at-source finding, not a gap in my reading.** Method and result, so it can be re-checked rather than re-litigated:

- One `get_metadata` on `59389:2505` returned **1,184 nodes** (overflowed to file, parsed with a Python line/indent parser).
- Regex sweep of **every node name** for `ms`, `sec`, `초`, `duration`, `easing`, `ease`, `fps`, `frame`, `cubic`, `bezier`, `delay`, `loop`, `반복`, `속도`, `시간`, `재생`, `linear`, `in-out` → the **only** semantic hits were `- 로딩 반복` (×2) and the false positives `ms_btn_wontoggle` (the `ms` = *multi status* naming prefix) and `Frame 482528`-style default names.
- Second sweep over the **verbatim `characters`** of every TEXT node (not just names) with `/(\d+\s?(ms|fps|초|s\b))|ease|cubic|bezier|linear|duration|delay|반복|loop/i` → **2 hits, both the same string**: `- 로딩 반복`.

**`- 로딩 반복` ("loading repeats") is the entire animation-behaviour specification on this page.** It is qualitative — no duration, no iteration count, no easing curve. There is no `논의`/`제작중` placeholder either; the fields simply **do not exist**. Nobody wrote them and nobody marked them as pending.

**Consequence for BUILD:** timing/easing for NDS Lottie is **not recoverable from Figma**. It lives inside the `.json` files themselves, which are hosted **outside Figma** behind the `로띠링크👉` hyperlinks. To get a real duration you must download the JSON and read its `fr` (framerate) / `ip` / `op` (in-point / out-point) fields. **Do not invent easing or duration values for NDS motion work** — and do not expect a future NDS page to supply them; the team's workflow deliberately treats the JSON as the source of truth.

## What the page actually is

A **delivery manifest**. Every entry follows the same three-line shape:

```
<Korean asset name>
<filename>.json
로띠링크👉          ← hyperlink out to the downloadable JSON
```

The two policy notes state the workflow verbatim (transcribed exactly, `\n` = line break in the source):

> **`65676:7109`** and **`66561:25647`** (identical text, one per section):
> `25.11.11 이후 전달되는 로띠 파일명은 *이미지 네이밍 룰에 따름`
> `GIF는 미리보기용(사용X), 각 URL 링크를 통해 JSON 파일로 다운로드 후 전달`

> **`59463:13732`** (the older note, on the infographic section):
> `파일 넘버링은 베이스가 되는 인포그래픽을 따름`
> `GIF는 미리보기용, 각 URL 링크를 통해 JSON 파일로 다운로드 후 전달`

> **`59463:14002`** (on the `NMnds_img_target_banner(Lottie)` section):
> `파일명은 원본인 일러스트와 동일하며 확장자로 구분 : PNG <-> JSON`
> `GIF는 미리보기용(사용X), 각 URL 링크를 통해 JSON 파일로 다운로드 후 전달`

Three rules fall out of these, and they matter more than any missing easing curve:

1. **`GIF는 미리보기용(사용X)`** — the GIFs on this canvas are **preview only, explicitly not for use**. Never export a GIF off this page and ship it. Download the JSON via the link.
2. **Since 2025-11-11, Lottie filenames follow the Image Naming Rule** (see `nds-lib-img-naming-rule.md`) — i.e. `nds_lottie_<example>_...json`. Before that date, numbering followed the base infographic. **Two eras coexist on this page.**
3. **A Lottie and its source illustration share a filename, differing only by extension** (`PNG` ↔ `JSON`). So `nds_infographic66` (PNG) ↔ `nds_lottie_infographic66.json`.

## The "4개" finding — only 4 infographics are Lottie

The frame layer-named `infographic_Lottie` has the **on-canvas heading `Infographic Lottie: 4개`** ("4 items"). The screenshot resolves what the metadata alone hides: the canvas shows a grid of **~130 infographic thumbnails, almost all greyed out**, with exactly **four rendered in full colour**:

| On-canvas label (verbatim) | Node | componentKey (local) |
|---|---|---|
| `전구` | `nds_infographic66` | `942477a9062f5715c550f1e394b24b16179e324e` |
| `궁금한 눈` | (in grid, greyed neighbours) | — see inventory note below |
| `쌓인돈` | — | — |
| `날아가는 돈(공통)` | — | — |

**This is the single most load-bearing fact on the page for BUILD.** The metadata lists ~130 `nds_infographicNN` instances; a naive read of node names would conclude that 130 Lotties exist. **Four do.** The greyed-out ~126 are the *static illustration* set shown for context — they are **not** available as Lottie. The `nds_lottie_infographic66.json` example in the Image Naming Rule page corroborates this: `66` is `전구`, one of the four.

The `4개` count is maintained by hand — a tooltip inside the `moana` instance reads `인포그래픽 로띠 에셋 추가 시 업데이트` ("update when infographic Lottie assets are added"), so the number is a manual counter and may lag reality.

## Asset inventory (from screenshot transcription of `66561:25648`)

Rules and labels here were read **off the rendered canvas**, because the layer names are unreliable (see verdict below).

| On-canvas label (verbatim) | Filename (verbatim) |
|---|---|
| `차분이` | `chartai_btn.json` |
| `커서` | `cursor.json` |
| `N2 로딩 인디케이터` | `loading.json` |
| `CS 아이콘(ELS/DLS, 채권, 펀드 - 게이트 헤더)` | `nds_icon_header_cs~` |
| `오디오웨이브` | `audiowave.json` |
| `하트(현재가 헤더)` | `nds_lottie_header_heart.json` |
| `터치 포인터` | `nds_lottie_touch_point.json` |
| `시킹알파 게이지` | `graph_weeknees/healty_v1.json` |
| `연금스쿼드` | `nds_lottie_pensionsq01~.json` |
| `온보딩스쿼드` | `nds_lottie_onboardingsq01~.json` |
| `AI스쿼드` | `nds_lottie_ai~.json` |

AI-squad sub-assets, transcribed cell by cell from the `세줄요약` block:

- `nds_lottie_enteraiaq_nm.json`
- `nds_lottie_enteraiaq_nm_black.json`
- `nds_lottie_enteraiaq_n2.json`
- `nds_lottie_enteraiaq_n2_black.json`

Note the `_black` suffix pairs — a **dark-mode variant convention** carried in the filename, not a Figma variant property. Same for the `nm` / `n2` channel split. The AI-squad rows are annotated `- 로딩 시작` / `- 로딩 완료 시` (loading start / on loading complete) — again **state labels with no durations**.

The `완료/실패 애니메이션` (complete/fail animation) block carries `[LINK]`-prefixed text nodes rather than a spec:

- `[LINK] icon_comm_complete_lottie`
- `[LINK] icon_comm_warning_lottie`
- `[LINK] icon_comm_exclamation_lottie`
- `[LINK] icon_comm_complete_line01_lottie` / `..._line02_lottie`
- `[LINK] icon_comm_exclamation_line01_lottie` / `..._line02_lottie`

Their `_gif` sibling frames (`icon_comm_complete_gif`, `icon_comm_warning_gif`, …) are the **preview GIFs the note says not to use**.

One node is named **`🟢 Figma to Lottie ✨`** (`66561:25696`) — evidence the team uses a Figma→Lottie export plugin. That plugin, not this page, is where any timing would have been authored.

## componentKeys

**Classification: MASTERS defined in this file.** Every `nds_infographicNN` on this page is a **`COMPONENT` with `remote: false`**.

> **Corrected.** An earlier draft called these "page-local documentation re-creations, category (b)". **That was wrong.** `NDS_Library` is the **home library** — it is where these components are *defined*. A master always reads `remote: false` in its own file; `remote: true` only means "imported from elsewhere". So `remote: false` here = **master**, and these infographics are the canonical, importable definitions. (Proof of the general rule: on the Header page, `header_stock` is `remote: false` with the exact key CORE already records as verified — a re-creation cannot share the master's key.)

Sample of full 40-hex keys (read off `mainComponent`, KIND = **COMPONENT**, no COMPONENT_SET on this page — `findAllWithCriteria({types:['COMPONENT_SET']})` returned **`[]`**, so there are **no variant axes** on any of them):

| Name | componentKey (full 40-hex) | KIND | remote |
|---|---|---|---|
| `nds_infographic01` | `0bda223a2ff7da55698215e58c9d9ffffe2b17ee` | COMPONENT | false |
| `nds_infographic02` | `8b7337c5ce493847332bb2cec45219e53557303d` | COMPONENT | false |
| `nds_infographic03` | `623eab5f5968819204618b7e38389b7b9a6b8543` | COMPONENT | false |
| `nds_infographic66` (`전구` — a real Lottie) | `942477a9062f5715c550f1e394b24b16179e324e` | COMPONENT | false |

The **`remote: true`** components instanced on this page are **imports from other libraries** (or stale self-imports — `NDS_Library` subscribes to itself, see `nds-lib-layout.md` §componentKeys). They are decorative/borrowed, not Lottie assets, and are **not** this file's masters:

| Name | componentKey (full 40-hex) | KIND | remote |
|---|---|---|---|
| `NM_icon_basic` | `65f648260e271ca4972dfb5d30a6c70a5526fdaa` | COMPONENT | true |
| `QV_icon_basic` | `2f38c733807200f804ef250964d54968b891d925` | COMPONENT | true |
| `nds_icon_minus04_40` | `9643c00ae26f7574937ea773e1c9fa49f7bbd5b6` | COMPONENT | true |
| `nds_icon_plus04_40` | `889e10426cc9403d19ede7fc5c131888dc91d127` | COMPONENT | true |
| `sia` | `1cc7f456c42e36159f2e4439aa6ee63d9d05bb79` | COMPONENT | true |

All keys are **`unverified`** — this session is read-only, so `importComponentByKeyAsync` was not exercised. Keys were read off `getMainComponentAsync()`. This is the expected norm, not a shortfall.

## Name-reliability verdict: **UNRELIABLE**

Determined for this page specifically, by screenshotting:

- **Nine TEXT nodes are literally named `title`.** Their actual contents are `chartai_btn.json`, `cursor.json`, `graph_weeknees/healty_v1.json`, `audiowave.json`, and five separate nodes all reading `로띠링크👉`. The layer name carries **zero** information.
- **The frame layer-named `infographic_Lottie` has the on-canvas heading `Infographic Lottie: 4개`.** The layer name omits the `4개` — the single most important qualifier on the page.
- Asset-name layers (`nds_infographic66`, `icon_comm_complete_gif`) **are** accurate. So the page is unreliable *for headings and captions*, reliable *for asset identifiers*.

**Rules embedded in screenshot images?** No — unusually, no pasted-screenshot nodes exist on this page (swept for `스크린샷` / `Screenshot`: zero hits). But the **greyed-vs-coloured distinction that encodes the `4개` finding is purely visual** and appears nowhere in the metadata. Screenshotting was mandatory here for a different reason than usual: not to read pasted text, but to read **opacity as semantics**.

## Gaps / unverifiable

- **Timing/easing/duration: absent at source.** Not a reading gap. Verified by two independent regex sweeps (node names, then TEXT `characters`) across all 1,184 nodes. Recorded as **blank**, per instruction never to invent a value.
- **The `로띠링크👉` hyperlink targets were not resolved.** `get_metadata` does not expose hyperlink URLs, and this session is read-only. The actual JSON files — and therefore the actual durations — live behind those links. **To recover NDS motion timing, the next step is to follow these links and read the JSON `fr`/`ip`/`op` fields**, not to re-read Figma.
- **Only 4 of the ~130 infographics were confirmed as Lottie**, and I transcribed the four labels (`전구`, `궁금한 눈`, `쌓인돈`, `날아가는 돈(공통)`) from the rendered grid. I mapped only `전구` → `nds_infographic66` with confidence (corroborated by the naming-rule page's `nds_lottie_infographic66.json` example). **The node-ID mapping for `궁금한 눈`, `쌓인돈`, `날아가는 돈(공통)` is unverified** — re-check by screenshotting `59455:2438` at higher `maxDimension` and matching grid position to node ID.
- The `4개` count is **hand-maintained** (`인포그래픽 로띠 에셋 추가 시 업데이트`) and may lag the real asset set.
- The QV mirror frame (`59455:2754`) was **not screenshotted**; I assumed it mirrors the NM frame by analogy with the `nds-mweb-colors` NM/QV pattern. **Unverified** — the QV Lottie count may differ from `4개`.
- No `hidden="true"` nodes were encountered on this page, so no blank-render hazard applied here.

## How this feeds BUILD mode

- **Never author NDS Lottie timing from Figma.** The values are not there and were never there. Download the JSON via `로띠링크👉` and read `fr`/`ip`/`op`.
- **Never ship a GIF from this page** — `GIF는 미리보기용(사용X)` is explicit.
- **Assume an infographic is NOT animated unless it is one of the four.** The ~130 node names are illustrations, not Lotties.
- **Filename ↔ illustration parity**: to find the Lottie for a static image, swap the extension (`PNG` ↔ `JSON`); post-2025-11-11 assets additionally follow the Image Naming Rule.
- **`_black` / `_nm` / `_n2` suffixes are baked into filenames**, not Figma variant properties — there is no `Channel` or `Darkmode` variant axis to set on these (there are no COMPONENT_SETs at all on this page).
