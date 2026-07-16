---
name: nds-lib-9-patch
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=77050-8664"
learned_date: 2026-07-16
sections_studied:
  - "77050:8664 (page '    - 9-patch 나인패치' — two sibling frames, both layer-named '제작가이드')"
  - "77050:8665 (frame '제작가이드' — on-canvas heading '9-patch Image / Guide'; the entire ruleset: *Export, 파일 제작 규칙, Guide Image, 이미지 확인 방법)"
  - "77050:16125 (frame '제작가이드' — on-canvas heading 'Example Usage / Guide'; Button → 9-patch asset mapping)"
  - "77050:8670 (RECTANGLE 'Stack 2018-05-08 오후 5.08.56' — the pasted screenshot image carrying the stretch/content-region diagram)"
status: "unknown — NO Last update stamp and NO Update History anywhere on the page (unlike every sibling page in this batch, which all carry one). The embedded guide image is a 2018-dated screenshot. Age unverified; treat the x1/x3 conflict below as unresolved."
---

# NDS Library — 9-patch (나인패치)

The Android **NinePatch** (`*.9.png`) asset-production convention for NDS. This is a **producer's guide for designers handing assets to Android developers**, not a Figma component page — there are **zero COMPONENT or COMPONENT_SET nodes on it**. Everything here is a rule, a raster, or a naming convention.

Two frames, both layer-named `제작가이드` ("production guide"), distinguished only by their on-canvas headings: **9-patch Image** (`77050:8665`, the rules) and **Example Usage** (`77050:16125`, the mapping table).

## ⚠️ Read this page from pixels, not from the tree

**This page has the worst name reliability in the batch — layer names are not merely vague, they actively contradict the canvas.** Verified failures:

| Node | Layer name | What it actually renders |
|---|---|---|
| `77050:8667` | `*기존 이미지의 3배 사이즈로 컷팅` ("cut at 3× the original size") | **`*Export : 이미지의 x1배 추출`** ("Export: extract at x1") |
| `77050:8666` | `1. 보통 이미지 앞단에 bg / i` | the whole **파일 제작 규칙** bullet list |
| `77050:16123`, `77050:16151`, `77050:16136`, `77050:16138` | `1. 보통 이미지 앞단에 bg / i` (all four identical) | four completely different blocks (`Guide Image` label, `이미지 확인 방법` numbered list, `Button`, `9-patch`) |
| `79149:563`, `79149:566`, `79149:569`, `79149:570` | `*기존 이미지의 3배 사이즈로 컷팅` (all four identical) | the diagram's four labels: `여백(패딩)`, `나인패치로 늘릴 영역`, `컨텐츠 영역` |
| `77050:8668`, `77082:359` | `2. normal = n , pres` | truncated stubs of the filename-suffix legend |

The pattern: **every TEXT node on this page was duplicated from one of two ancestor nodes and its content replaced, but Figma retained the original auto-name.** So the names are a fossil record of a *previous version of this page* — one that said "cut at 3× size". The current canvas says **x1**.

**⚠️ LEDGER-worthy conflict: `3배` (layer names, ×8 nodes) vs `x1배 추출` (rendered canvas).** These are not reconcilable by reading harder. The rendered text is newer and is what the guide *shows*; but with **no Last update stamp on this page** there is no evidence for how stale either is. The x1-vs-3x question materially changes what a designer exports. **Do not act on this without asking the design owner.** Note the sibling `nds-lib-label` page independently mandates **2x** export for labels — so the file contains at least three different export multipliers for three different asset classes, and none of them is 3x.

## The ruleset (transcribed from the rendered canvas of `77050:8665`)

Heading: **`*Export : 이미지의 x1배 추출`**

### 파일 제작 규칙 (file production rules)

> - 파일명예시 : `ms_btn_radio_nn/sn/nd/sd.9`   `n = normal, s = seleted, d = disable`
> - 이미지명 끝에 `.9`표시   `nds_combo_nn.9`
> - 아이콘 x2배수
> - 라인두께 x2배수
> - 그림자효과 x2배수

**Decoded — the filename suffix grammar.** The suffix is **two letters, `<state><state>`**, drawn from a 3-letter alphabet whose legend is given as `n = normal, s = seleted, d = disable` (**`seleted` is misspelled at source — transcribed verbatim; it means `selected`**):

| Suffix | Reading |
|---|---|
| `_nn` | normal + normal |
| `_sn` | seleted + normal |
| `_nd` | normal + disable |
| `_sd` | seleted + disable |

This matches the assets on the Example Usage frame: `nds_combo_nn.9` / `nds_combo_nd.9`, `ms_img_tab_sn.9` / `ms_img_tab_nn.9`. The **`.9` suffix before the extension is mandatory** — it is what makes Android parse the 1px border as patch data.

**The x1 / x2 split is the subtle rule and it is easy to get backwards:**
- The **image itself exports at x1**.
- But **icons, line thicknesses, and shadow effects inside it must be authored at x2**.

That is: you draw the decorations at double weight, then export the whole thing at single scale. This is because a 9-patch is stretched by the OS at runtime, so it must ship at its natural density while its *details* need the extra pixels to survive. **Blank at source: the guide never states which Android density bucket x1 corresponds to** (mdpi? the design canvas's own scale?). Don't guess — ask.

### Guide Image (`77050:8670`)

**This is a pasted raster screenshot, layer-named `스크린샷 2018-05-08 오후 5.08.56`** — i.e. a macOS screengrab from **2018-05-08**. No text extraction reaches inside it; it was recovered by screenshot only. It shows the canonical NinePatch 3×3 grid:

- **Four corners → `여백(패딩)`** — fixed padding, never stretched.
- **The middle row and middle column → `나인패치로 늘릴 영역`** ("region to stretch with nine-patch") — these are the stretch axes, marked in the diagram as the blue vertical + horizontal bands.
- **The centre cell → `Contents 영역`** (pink) — the content box, additionally annotated `컨텐츠 영역` on the right edge and bottom edge.

The red guide lines in the image mark the stretch-region boundaries; the black edge ticks mark the content-region boundaries. **This is standard NinePatch semantics** (top/left border = stretch, right/bottom border = padding/content) — the guide is not inventing anything, it is restating the Android contract in Korean. It does **not** specify pixel offsets for any specific asset; those live in each asset's own 1px border.

### 이미지 확인 방법 (how to verify)

> 1. Android Studio 프로그램 설치
> 2. Android Studio에서 프로젝트를 엽니다.
> 3. 왼쪽 Project 패널에서 아래 경로로 이동합니다.
>    `app > src > main > res > drawable`
> 4. drawable 폴더에 제작한 나인패치 이미지를 추가합니다.
> 5. 미리보기 화면에서 이미지가 늘어났을 때 모서리와 테두리가 깨지지 않는지 확인합니다.

Drop the `.9.png` into `app/src/main/res/drawable` and use Android Studio's preview to confirm corners and borders don't break under stretch. **There is no Figma-side or automated check** — verification is manual, in the IDE.

## Example Usage (`77050:16125`) — which components are 9-patches

The frame maps a rendered **Button** to the **9-patch asset** it is built from:

| Button (rendered) | 9-patch asset |
|---|---|
| `📊 연금계좌 집중 분석 〉` (a nudge/toast pill) | `nds_nudge01.9` |
| `보통가(지정가) ▾` (combo, enabled) | `nds_combo_nn.9` |
| `시간외단일가` (combo, disabled/greyed) | `nds_combo_nd.9` |
| `실시간 조회수` (dark pill, selected) | `ms_img_tab_sn.9` |
| `상승률` (light pill, normal) | `ms_img_tab_nn.9` |

This is the page's most actionable content: it tells you **which NDS components are raster 9-patches rather than vector/native**, so you know their corners and borders come from a stretched PNG and cannot be restyled with a corner-radius token.

The `nn` / `nd` and `sn` / `nn` pairings confirm the suffix grammar above: **`nds_combo` varies on the 2nd letter (normal↔disable); `ms_img_tab` varies on the 1st (seleted↔normal).**

Note the on-canvas 9-patch thumbnails render as plain circles/rounded squares — the `.9` border strip is 1px and invisible at this zoom. `77050:8718` (`nds_combo_nn.9`) is a FRAME, not a component, and its four `Rectangle 1094x` children at `x=0/93` and `y=0/93` on a 94×94 frame **are** the 1px patch strips, drawn manually in Figma.

## Name-reliability verdict for this page

**Fully unreliable for TEXT nodes — actively misleading, not just uninformative.** Eight text nodes carry names that contradict their content, including a direct numeric contradiction (3배 vs x1배). **Asset/frame names are, by contrast, reliable and load-bearing** (`nds_combo_nn.9`, `ms_img_tab_sn.9` etc. are the real filenames and match the on-canvas legend).

**Rules embedded in screenshot images: YES — critically.** The entire stretch-region/padding/content diagram exists only as pixels inside a 2018 raster (`77050:8670`). Any tree-only read of this page recovers **none** of the actual nine-patch geometry semantics. This page is the batch's clearest proof of the "screenshot every rule-bearing frame" rule.

**No `hidden="true"` frames on this page.**

## How this feeds BUILD mode

- **Recognise a 9-patch before styling it.** If a component's name ends `.9`, its corners/borders are baked PNG. Corner radius, border colour, and shadow are **not** tokens you can rebind — they are pixels. Changing them means re-cutting the asset.
- **Filename grammar: `<prefix>_<state1><state2>.9`, `n`=normal, `s`=seleted[sic], `d`=disable.** Two letters, always.
- **Export x1; author icons/lines/shadows at x2.** Do not conflate this with the Label page's "2x export + tinypng" rule — different asset class, different rule.
- **Do not trust `3배` from the layer names.** Flagged as an unresolved conflict; the canvas says x1.
- Verification is Android Studio + `res/drawable` + eyeball the stretch. There is no shortcut.
