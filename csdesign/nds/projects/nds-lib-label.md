---
name: nds-lib-label
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=2283-12892"
learned_date: 2026-07-16
sections_studied:
  - "2283:12892 (page '    - Label (Tag)  라벨' — 18 top-level frames: 1 component page, 1 usage page, 1 상품별 page, and 13 per-product 라벨 catalogues)"
  - "2295:14076 (frame 'Label_usage' — on-canvas heading 'Label Usage'; the 사용 시 유의사항 rule block + Last update stamp)"
  - "12292:14937 (frame '1. Label' — on-canvas heading 'Label(Tag)'; the RISK and BASIC families with an RGB table)"
  - "7247:12332 (COMPONENT_SET 'label_risk', axis Lv, 6 variants — the code-library RGB family)"
  - "16349:15603 (COMPONENT_SET 'label_risk', axis Lv, 5 variants — the 컬러코드 적용 family; DUPLICATE NAME, different key)"
  - "16349:15752 (COMPONENT_SET 'label_basic', axis Type, 7 variants)"
  - "16360:15436 (frame '2. Label_상품별' — ~30 ss_img_sticker* raster instances)"
status: "live — Last update stamp '2023.06.20 구자영' (16349:15817), the most recent in this batch; all component sets resolve cleanly"
---

# NDS Library — Label (Tag) / 라벨

The NDS label (a.k.a. tag) family. Two structurally different things share this page and **must not be conflated**:

1. **`label_risk` / `label_basic`** — real Figma component sets, developed as labels.
2. **`ss_img_sticker*`** — ~30 **raster image instances**, one per product type, spread across 13 per-product frames. These are pictures of labels, not labels.

## The rule block, verbatim (`2295:14076`)

Heading: **사용 시 유의사항**. Transcribed from the rendered canvas.

> - 라벨 간 간격은 8px입니다.
> - BASIC 라벨의 여백은 좌우 12px, 상 6px, 하 4px 입니다.
> - 추가 케이스 생성은 최대한 지양합니다.
> - 라벨 최소 Width 값은 44px 입니다.
> - 라벨 Height 30이나 개발상 수치는 26 입니다.
> - ⭐️중요⭐ 이미지 추출 시 2x로 추출 후 tinypng.com 에서 용량 축소 필수!

**Decoded:**

- **Gap between labels: 8px.** (Contrast `nds-lib-precautions`, where the paragraph gap is 10px — these are different spacing systems.)
- **BASIC label padding is asymmetric and vertically top-heavy: L/R 12px, top 6px, bottom 4px.** The 6/4 split is deliberate optical centring for Korean glyphs; do not "fix" it to 5/5.
- **Do not create new cases.** 추가 케이스 생성은 최대한 지양합니다 — the label set is meant to be closed. If you need a new label, that's a conversation, not a component.
- **Minimum width 44px.**
- **⚠️ Height 30 in Figma, but 26 in code.** `라벨 Height 30이나 개발상 수치는 26 입니다` — the design canvas and the implementation **disagree by 4px on purpose**. The Figma frame is 30 tall; devs build 26. This is the single most load-bearing line on the page for BUILD work: **measuring a label off the canvas and shipping 30 is wrong.** The guide does not say where the 4px goes (2/2? all bottom?) — **blank at source**.
- **Export at 2x, then run through tinypng.com — marked ⭐️중요⭐ and 필수 (mandatory).** Note this is the **Label** export rule; `nds-lib-9-patch` mandates **x1** for nine-patches. Different asset classes, different multipliers — do not generalise either one.

**Character budget: 한글 8자 이상은 지양** (avoid ≥8 Korean characters). A soft limit, not a hard cap.

## RISK family (`12292:14937`)

On-canvas: **RISK — 상품 위험도 구분 시에만 사용합니다.** ("use ONLY when distinguishing product risk grade"). This is a **restricted-use family**, not a general colour palette.

The page splits it into two sub-families side by side, with different on-canvas captions:

### `tag_risk` — 코드 라이브러리에 RGB로 적용 (`7247:12332`)

"applied as RGB in the code library" — i.e. these six are **hard-coded RGB in code, not tokens.** Axis `Lv`, 6 variants. The on-canvas table gives 배경색 (bg) and 폰트색 (font) as literal RGB:

| Lv (rendered) | 배경색 | 폰트색 |
|---|---|---|
| 매우낮은위험 | `RGB(238,249,238)` | `RGB(66,159,64)` |
| 낮은위험 | `RGB(254,245,223)` | `RGB(141,114,26)` |
| 보통위험 | `RGB(254,245,223)` | `RGB(141,114,26)` |
| 다소높은위험 | `RGB(255,244,236)` | `RGB(238,91,24)` |
| 높은위험 | `RGB(255,244,236)` | `RGB(238,91,24)` |
| 매우높은위험 | `RGB(255,240,239)` | `238 (215,56,56)` |

**Three data-quality problems in this table, all verified against the rendered canvas:**

1. **낮은위험 and 보통위험 are byte-identical** — same bg, same font colour. Two risk grades that are legally distinct render identically.
2. **다소높은위험 and 높은위험 are byte-identical** — same again.
3. **매우높은위험's 폰트색 cell reads `238 (215,56,56)`** — malformed. It is not `RGB(...)` like every other cell. The `238` looks like a leftover from the row above (`RGB(238,91,24)`); the parenthesised `(215,56,56)` is presumably the real value. **Unresolved — do not guess.**

So the six-level risk scale collapses to **four distinct colour pairs**. Whether that is intentional (grades pair up visually) or a copy-paste slip is **not stated anywhere on the page**. Flagged for LEDGER.

### `label_risk` — 컬러코드 적용 (`16349:15603`)

"colour-code applied" — these five use colour styles rather than hard RGB. Axis `Lv`, 5 variants. Rendered: `원금보장형` (green), `원금비보장형` (red), `80%지급형` (blue), `⚠ 고난도` (pink/red, with a leading `!` icon). These are **capital-protection / complexity labels**, a different semantic axis from the 6-level 위험도 scale — despite sharing the layer name `label_risk`.

**⚠️ `label_risk` names TWO different component sets with different keys and different variant counts** (`7247:12332` = 6 variants; `16349:15603` = 5 variants). `importComponentSetByKeyAsync` by name is impossible here — **you must go by key**, and you must know which family you want. Flagged for LEDGER.

## BASIC family (`16349:15752`)

On-canvas: **BASIC — 상품 설명, 강조 등에 사용합니다.** ("used for product description, emphasis, etc.") — the general-purpose family. Caption: **`tag_basic` — 라벨로 개발** ("developed as a label", i.e. a real component, in contrast to the sticker rasters below).

Axis `Type`, 7 variants. Rendered: `강조형` (green outline), `강조형` (orange outline — **two variants render the same string `강조형` in different colours**, so the rendered text does not disambiguate them; go by `Type`), `일반라벨` (grey), `신용등급` (blue), `유망자산` (purple), `나무전용` (green), `N2 전용` (orange).

`나무전용` / `N2 전용` are **channel-exclusive labels** — 나무(Namuh) and N2 respectively. Note this is a *third* channel vocabulary: the rest of NDS uses `Channel=NM|QV` (see `nds-mweb-colors`), but these two labels name 나무 and **N2**, not NM/QV. Relationship unstated — **blank at source**.

Standalone components alongside: **`label_beta`** (`55331:30057`, renders `🧪 BETA`), **`list_warning`** (`51078:663`, renders `⚠ 사고`), plus icon components `nds_icon_label_check` (`17923:17246`) and `nds_icon_label_beta` (`17978:17239`), and instances `금융위인증` (a certification badge).

## 상품별 라벨 (`16360:15436` + 13 per-product frames)

Thirteen frames, one per product type: **펀드 / 통검 / ELS / ETN / 랩·로보랩 / 포폴마켓 / 장외채권 / 외화채권 / 단기사채 / 장내채권 / RP·외화RP**. Each holds a `Frame 123758` of `ss_img_sticker<N>` **instances — these are raster images, not label components.**

The numbering (`ss_img_sticker18`, `19`, `20`, `21`, `22`, `29`, `30`, `50`, `54`, `60`–`78`, `104`, `y04`–`y06`…) is **sparse and non-semantic** — sticker60 is not adjacent in meaning to sticker61. Treat the number as an opaque ID.

Scale suffixes appear on a few: `ss_img_sticker75_short`, `_76_long`, `_77_x2`, `_78_x3`, `_78_x05`, `_78_x25`. So sticker78 exists at **x3, x05, and x25** — i.e. `78_x3` and `78_x05` are separate nodes. This is an **export-scale suffix convention** (`_x2`/`_x3`/`_x05`/`_x25`), and it **conflicts with the page's own "2x로 추출" rule** — if everything is 2x, why do x3/x05/x25 variants exist? Unstated. Flagged for LEDGER.

**Two live to-do notes are pinned on the canvas** (verbatim):
- `현재 반영되어있는 ETN 이미지 라벨 12월 중 라벨로 개발수정 필요👇` (`26221:1316`) — "the currently-applied ETN image labels need to be reworked into real labels during December". **Year unstated.** So the ETN stickers are known tech debt.
- `장내채권라벨` appears **twice** as a frame name (`16441:15398` and `20347:398`) with different contents — the second also contains two `label_risk` sub-frames.

## Name-reliability verdict for this page

**Reliable for TEXT nodes — the best in this batch.** `2295:14090`'s layer name is the exact run-on concatenation of its rendered bullets, and `16349:15817`'s name (`Last update 2023.06.20 구자영`) matches its render byte-for-byte. Text can be read from the tree here.

**Unreliable for FRAME and COMPONENT_SET names**, in a way that will bite: `label_risk` names two different sets; `장내채권라벨` names two different frames; `Frame 123758` names ~11 different frames; `title_` names two. **Disambiguate by key/node-id, never by name.**

**Rules embedded in screenshot images: NO** — the 사용 시 유의사항 block and the RISK RGB table are live text. **But** the ~30 `ss_img_sticker*` labels ARE rasters: their *rendered wording* is pixels and cannot be extracted. Screenshot needed to read what any given sticker says.

**No `hidden="true"` frames on this page.**

## How this feeds BUILD mode

- **Height 30 in Figma → ship 26.** The most important line on the page. Don't measure-and-ship.
- **Gap 8px; BASIC padding 12/6/12/4 (L/T/R/B); min-width 44px; ≤7 Korean chars.**
- **RISK is restricted** — 상품 위험도 구분 시에만. Never reach for a risk colour just because it looks right.
- **Know which `label_risk` you mean.** 6-variant `Lv` = the 위험도 scale (hard RGB); 5-variant `Lv` = 원금보장/고난도 (colour-coded). Import by key.
- **`tag_risk` colours are hard RGB in code, not tokens** — the page says so explicitly (`코드 라이브러리에 RGB로 적용`). Don't expect to rebind them; and don't expect `nds-mweb-colors`' style-name grammar to cover them.
- **Export 2x → tinypng.** Mandatory, per the ⭐️중요⭐ line. (Not x1 — that's 9-patch.)
- **`ss_img_sticker*` are images.** If a product label isn't in `label_basic`/`label_risk`, it's a sticker raster: you can place it, not restyle it. ETN's are flagged for replacement.
- **추가 케이스 생성 지양** — if the label you need doesn't exist, escalate rather than author one.
