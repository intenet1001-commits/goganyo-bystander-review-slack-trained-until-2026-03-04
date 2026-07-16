---
name: nds-lib-typography
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=208-2042"
learned_date: 2026-07-16
sections_studied:
  - "208:2042 (page '    - Typography' — two top-level frames: Typo_styleguide 2061:16320, Typo_usage 2278:11762)"
  - "208:2072 (frame 'Title_Typo' — on-canvas heading 'Typography' / subtitle 'QV-NM Typography Scale & Hierarchy')"
  - "2061:16738 (frame 'table header' — the 7 column labels: Typeface / Scale / Font / Size / Line height / Fix Height / Usage)"
  - "2061:16324 (frame 'nanum' — the NanumBarunGothic scale, 9 scale steps × Regular/Bold)"
  - "2263:10044 (frame 'roboto' — the Roboto scale, 9 scale steps × Regular/'Bold')"
  - "2278:11762 (frame 'Typo_usage' — on-canvas heading 'Typo Usage' / subtitle 'QV-NM Typography Font Usage'; carries 사용방법 + 사용 시 유의사항 + the page's Last update stamp)"
  - "36 local text styles enumerated via getLocalTextStylesAsync() — full keys, fonts, sizes, line heights, letter spacings"
status: "live. Evidence: on-canvas `Last update  2022.10.12  구자영` stamp at 2295:14228; all 36 text styles resolve as local (remote:false) with real font/size/lineHeight values; sample nodes render and are style-linked. Nothing hidden, nothing marked 논의/제작중."
---

# NDS Library — Typography (Nanum / Roboto scale, and the Fix Height rule)

The type foundation for **`NDS_Library`** (`72zrHgMLM4zhCjgSuTf7cC`). Unlike the sibling Colors page — which is an empty signpost (see `nds-lib-colors.md`) — **this page owns its spec outright**: a full 9-step scale in two typefaces, a usage protocol, and 36 backing local text styles.

The page is two frames side by side:

- **`Typo_styleguide` (`2061:16320`)** — heading **"Typography"**, subtitle **"QV-NM Typography Scale & Hierarchy"**. A 7-column table, rendered twice: once for `nanum`, once for `roboto`.
- **`Typo_usage` (`2278:11762`)** — heading **"Typo Usage"**, subtitle **"QV-NM Typography Font Usage"**. The how-to and the cautions. **Carries the page's only `Last update` stamp.**

Note both subtitles say **"QV-NM"** — one shared scale serves *both* channels. This is the opposite of the color foundation, where NM and QV diverge into separate palettes (`nds-mweb-colors.md`). **Type is channel-independent; color is not.** Worth internalising: there is no `Channel` axis to pick here.

## The `(-N)` notation — decoded

The single most important decode on this page. The Line-height column reads values like `48px(-4)` and `32px(-2)`, and the natural misreading is that `(-N)` is 자간 / letter-spacing.

**It is not.** Verified by reading the actual nodes and styles: **`letterSpacing` is `{unit:'PIXELS', value:0}` on every one of the 36 styles.** There is no letter-spacing anywhere in this system.

`(-N)` is **the delta between the Figma line-height and the Fix Height** — the guide's own shorthand for "set the text box N px shorter than the line height":

```
Fix Height = <line height> − N
```

Verified against every Nanum row:

| Scale | Line height | `(-N)` | Fix Height | 48−4 / lh−2 checks out |
|---|---|---|---|---|
| L | 48px | (-4) | 44px | ✓ |
| P1 | 44px | (-2) | 42px | ✓ |
| P2 | 38px | (-2) | 36px | ✓ |
| H | 38px | (-2) | 36px | ✓ |
| Title | 34px | (-2) | 32px | ✓ |
| Body | 32px | (-2) | 30px | ✓ |
| Notice | 26px | (-2) | 24px | ✓ |
| Info | 24px | (-2) | 22px | ✓ |
| Label | 20px | (-2) | 18px | ✓ |

Independently confirmed on-node: `2063:16316` (L Regular sample) has `lineHeight: 48`, `height: 44`, `textAutoResize: 'NONE'` — exactly `48 − 4`. `2228:13006` (Body Regular) has `lineHeight: 32`, `height: 30` — exactly `32 − 2`.

**Every Nanum step uses a delta of 2, except `L` which uses 4.**

## Nanum scale (`2061:16324`) — NanumBarunGothic

Typeface cell reads verbatim: `NanumBarunGothic`.

| Scale | Font | Size | Line height | Fix Height | Usage note (verbatim) |
|---|---|---|---|---|---|
| L | Regular / Bold | 40 | 48px(-4) | 44px | — |
| P1 | Regular / Bold | 32 | 44px(-2) | 42px | — |
| P2 | Regular / Bold | 30 | 38px(-2) | 36px | — |
| H | Regular / Bold | 26 | 38px(-2) | 36px | — |
| Title | Regular / Bold | 24 | 34px(-2) | 32px | — |
| **Body** 📌 | Regular / Bold | 21 | 32px(-2) | 30px | — |
| Notice | Regular / Bold | 19 | 26px(-2) | 24px | `기본 타입으로 일반적인 내용에 사용합니다.` |
| Info | Regular / Bold | 18 | 24px(-2) | 22px | — |
| Label | Regular / Bold | 15 | 20px(-2) | 18px | — |

**The 📌 pin marker sits on `Body` (21)** — the guide's own emphasis, matching the written rule that Body(21) is the default size.

**The Usage column is blank for 8 of 9 rows.** Only `Notice` carries text, and that text (`기본 타입으로 일반적인 내용에 사용합니다.` — "the default type, used for general content") **describes Body, not Notice** — Body is the pinned default, Notice is not. This is a misplaced cell, not a Notice spec. *Blank at source is the finding: there is no per-scale usage guidance in this table.*

## Roboto scale (`2263:10044`) — Roboto

Typeface cell reads verbatim: `Roboto`.

| Scale | Font | Size | Line height | Fix Height | Delta |
|---|---|---|---|---|---|
| L | Regular / Bold | 40 | 48px | 48px | 0 |
| P1 | Regular / Bold | 32 | 38px | 38px | 0 |
| P2 | Regular / Bold | 30 | 36px | 36px | 0 |
| H | Regular / Bold | 26 | 36px | 36px | 0 |
| Title | Regular / Bold | 24 | 32px | 32px | 0 |
| **Body** 📌 | Regular / Bold | 21 | 26px | 26px | 0 |
| Notice | Regular / Bold | 19 | **26px(-2)** | **24px** | **2** ⚠️ |
| Info | Regular / Bold | 18 | 22px | 22px | 0 |
| Label | Regular / Bold | 15 | 18px | 18px | 0 |

**Sizes are identical to Nanum (40/32/30/26/24/21/19/18/15) — line heights are not.** Roboto runs tighter at every step from P1 down (e.g. Body 26px vs Nanum's 32px).

**For Roboto, Fix Height == Line height on 8 of 9 rows** — the delta is 0, which is why Roboto rows carry no `(-N)`. This is the mechanical reason behind the Korean-only Fix Height rule below: Latin text needs no correction, Hangul does.

⚠️ **`Notice` is the sole Roboto row with a nonzero delta** (`26px(-2)` → 24px). I checked whether this was a copy-paste leftover from the Nanum table — **it is not.** Node `2263:10146` genuinely has `lineHeight: 26`, `height: 24`, `textAutoResize: 'NONE'`. The style `Notice/…Roboto/R/19` really is `lineHeight: 26` while the box is 24. It is a real, intentional-looking exception — but it is also the *same row* that carries the corrupted style name (below), so this row is the odd one out in two independent ways. **Treat Roboto/Notice as suspect and confirm with a designer before relying on it.**

## Typo Usage (`2278:11762`) — verbatim

### 사용방법 (How to use)

1. `Assets ‣ [icon] ‣ 00_Library, 00_Colors 토글 켜기`
2. `단축키 T나 도구바에서 [T icon] 로 텍스트박스 생성`
3. `우측 패널 Text에서 [∷ icon] 클릭 후 원하는 폰트 선택`
4. `⭐중요⭐ 한글(나눔바른고딕/Mixed) 사용 시` / `텍스트 박스를 좌측 대지에 있는 Fix Height 값으로 맞추기!`

Step 4 is the page's headline rule, styled bold with a red 중요 ("important") badge: **when using Korean (NanumBarunGothic / Mixed), set the text box to the Fix Height value from the left artboard.**

Step 1 independently corroborates the Colors page's claim that **`00_Colors` is a separate library** from `00_Library` — both toggles must be on. See `nds-lib-colors.md`.

### 사용 시 유의사항 (Cautions)

Verbatim, from `2295:12551`:

- `기본 폰트 사이즈는 Body(21)입니다. 특별한 경우를 제외하고는 그 이하의 작은 폰트 사용은 자제해주세요.`
  — *Default font size is Body(21). Except in special cases, refrain from using anything smaller.*
- `텍스트 박스 내 Aline은 top으로 유지해주세요.`
  — *Keep the alignment inside the text box as top.* (`Aline` is a typo for `Align` in the source — kept verbatim.)
- `Mixed 사용 시 Fixed hieght는 나눔바른고딕 기준입니다.`
  — *When using Mixed, the Fixed height follows the NanumBarunGothic baseline.* (`hieght` is a typo for `height` in the source — kept verbatim.)

**The third caution is the tie-breaker for mixed Korean+Latin text**: use the **Nanum** Fix Height column, not Roboto's. Since Roboto's delta is 0 and Nanum's is 2 (or 4 at L), a Mixed box built off the Roboto table will be 2px too tall at every step.

**Note the tension with `Info`(18) and `Label`(15):** the guide ships both, but its own caution says don't go below Body(21) except in special cases. Info and Label are therefore *exception-only* styles, not general-purpose ones.

### Last update

`Last update  2022.10.12  구자영` (`2295:14228`) — **the page's own stamp, on the Typo_usage frame.** The `Typo_styleguide` frame carries no independent stamp; treat 2022.10.12 as covering the whole page.

## Text style inventory — 36 local styles

**All 36 are `remote: false` — local styles defined in this file**, i.e. **tier (a) published library styles** if `00_Library` is the published library (which the 사용방법 toggle instruction implies), authored here rather than mirrored from elsewhere. None are documentation re-creations; each is bound to real sample nodes on-canvas.

**These are text-STYLE keys, not component keys.** There are **zero** `COMPONENT` / `COMPONENT_SET` / `INSTANCE` nodes on this page, so the SET-vs-variant distinction does not arise. `getStyleByIdAsync` returns them directly; there is no set/variant hierarchy for styles.

Style-name grammar:

```
<ScaleWord>/<Typeface>/<WeightLetter>/<Size>
```

### ⚠️ Style names do NOT match the table's scale labels

The table's abbreviations and the style paths use **different words** for three of nine steps:

| Table label | Style-path word |
|---|---|
| `L` | `Large` |
| `P1` | **`Point1`** |
| `P2` | **`Point2`** |
| `H` | **`Headline`** |
| `Title` | `Title` |
| `Body` | `Body` |
| `Notice` | `Notice` |
| `Info` | `Info` |
| `Label` | `Label` |

So `P1` is **not** "Paragraph 1" — it is **Point1**, and `H` is **Headline**. Do not string-match the table label against the style picker.

### ⚠️ Weight letter: Nanum `B` = Bold, Roboto `M` = Medium

**There is no Roboto Bold style in this file.** Every Roboto "Bold" row in the on-canvas table is backed by **Roboto Medium**:

| Style | Actual `fontName.style` |
|---|---|
| `Large/Nanum/B/40` | `Bold` |
| `Large/Roboto/M/40` | **`Medium`** |

The table renders the column header as `Bold` for both typefaces — **for Roboto that label is wrong; the shipped weight is Medium.** Trust the style's `fontName`, not the table's "Bold".

### Nanum styles (18)

| Style name | Font | Size | LH | Key (40-hex) |
|---|---|---|---|---|
| `Large/Nanum/R/40` | NanumBarunGothic Regular | 40 | 48 | `15e1a558b6a679361b51e9625a0984f50879a9e2` |
| `Large/Nanum/B/40` | NanumBarunGothic Bold | 40 | 48 | `f53c9094040aec4c451e72a3462023706cf50bef` |
| `Point1/Nanum/R/32` | NanumBarunGothic Regular | 32 | 44 | `c4a0fa9c87b2f51ce68ecc5851b261006904afa1` |
| `Point1/Nanum/B/32` | NanumBarunGothic Bold | 32 | 44 | `62b245f0cbcbea8a3081296e813a01a103dd7754` |
| `Point2/Nanum/R/30` | NanumBarunGothic Regular | 30 | 38 | `ed83f7ec2a71afcef878b0670c41f3944ceec4bb` |
| `Point2/Nanum/B/30` | NanumBarunGothic Bold | 30 | 38 | `ff87db70dbcc3fec12fbc5d0844900755c7e26dd` |
| `Headline/Nanum/R/26` | NanumBarunGothic Regular | 26 | 38 | `86a8ca53d92bdd182efafdd94c8bd30e5968a9fb` |
| `Headline/Nanum/B/26` | NanumBarunGothic Bold | 26 | 38 | `b0e07c972100844a4ed9975b5bd7704f15d6d289` |
| `Title/Nanum/R/24` | NanumBarunGothic Regular | 24 | 34 | `8f495becd2e654e73222b3810581b05003540ca6` |
| `Title/Nanum/B/24` | NanumBarunGothic Bold | 24 | 34 | `5a65055e874ff80354c1bc305d0b186eaa70d78f` |
| `Body/Nanum/R/21` 📌 | NanumBarunGothic Regular | 21 | 32 | `ed49c3c5092a93d4751286cd9082a367e6bfd7e6` |
| `Body/Nanum/B/21` 📌 | NanumBarunGothic Bold | 21 | 32 | `3cfe2c419cbde81a5449b29bfa3e967d4a5c5c33` |
| `Notice/Nanum/R/19` | NanumBarunGothic Regular | 19 | 26 | `c789f3fee0b17da15176868eef3499338bb92222` |
| `Notice/Nanum/B/19` | NanumBarunGothic Bold | 19 | 26 | `14073cbc541c9c97d42768995c0a6b96219e12c2` |
| `Info/Nanum/R/18` | NanumBarunGothic Regular | 18 | 24 | `43d97b4aa93431034469726a110950b3827e9246` |
| `Info/Nanum/B/18` | NanumBarunGothic Bold | 18 | 24 | `c4bf3f5037ec41521bc69ec29f3e4913ccfa0bab` |
| `Label/Nanum/R/15` | NanumBarunGothic Regular | 15 | 20 | `30a749dafb35c73635f62f34326c258edb50b28f` |
| `Label/Nanum/B/15` | NanumBarunGothic Bold | 15 | 20 | `067406a8ff127a1f1f8492fc27371e974510ae65` |

### Roboto styles (18)

| Style name | Font | Size | LH | Key (40-hex) |
|---|---|---|---|---|
| `Large/Roboto/R/40` | Roboto Regular | 40 | 48 | `efe3035ee6253d79d0f22deb5919843930c170ae` |
| `Large/Roboto/M/40` | Roboto **Medium** | 40 | 48 | `ab670bfe109d01fbbc6ceaf7aedd1b968e5223c8` |
| `Point1/Roboto/R/32` | Roboto Regular | 32 | 38 | `35a3d2ae5b3a50943c99fdc5e3fc40b456601b2d` |
| `Point1/Roboto/M/32` | Roboto **Medium** | 32 | 38 | `fdb98143dd783d4267b4e39312dae7212b250a61` |
| `Point2/Roboto/R/30` | Roboto Regular | 30 | 36 | `dfcedb7f89a4dd2668665d5dcf68855234c47ba1` |
| `Point2/Roboto/M/30` | Roboto **Medium** | 30 | 36 | `5918b1df387351323ca50e05778c2eb872f91c76` |
| `Headline/Roboto/R/26` | Roboto Regular | 26 | 36 | `56326ed3fb1dfb8d4e01f92a0b6a835eecfe7b9b` |
| `Headline/Roboto/M/26` | Roboto **Medium** | 26 | 36 | `4b1a775700eed1fefc76ff325e1146a096a68bff` |
| `Title/Roboto/R/24` | Roboto Regular | 24 | 32 | `90464b2a41b8dab29da77a6d3eae5c229ee80f90` |
| `Title/Roboto/M/24` | Roboto **Medium** | 24 | 32 | `3e8dfc27c79dfcab53efa43648f6c80e98916034` |
| `Body/Roboto/R/21` 📌 | Roboto Regular | 21 | 26 | `d296b4f250c4df2a0053567d14666b6b15fa296f` |
| `Body/Roboto/M/21` 📌 | Roboto **Medium** | 21 | 26 | `f8676bf0475bf8fcf6add8ad452c8d4807aeb605` |
| `Notice/`**`\b`**`Roboto/R/19` ⚠️ | Roboto Regular | 19 | 26 | `c4112ea69a3d7aa6f0d87c4f018340c68c4e117f` |
| `Notice/`**`\b`**`Roboto/B/19` ⚠️ | Roboto **Medium** | 19 | 26 | `58f3332efd7beeb19e88edc565a027dce70d695f` |
| `Info/Roboto/R/18` | Roboto Regular | 18 | 22 | `3a849639087bc0ec93b364482776dbd13d848e3c` |
| `Info/Roboto/M/18` | Roboto **Medium** | 18 | 22 | `73a5b2350784b97224b0e6172147b44c8f4a0bf5` |
| `Label/Roboto/R/15` | Roboto Regular | 15 | 18 | `41144f2c59b1f2922f94034d672bf4720f3b2e64` |
| `Label/Roboto/M/15` | Roboto **Medium** | 15 | 18 | `4cc271e2cad37c523391c043e5caa61abc277ba1` |

### ⚠️ The two corrupted Notice/Roboto style names

Both Roboto Notice styles contain a **literal `\b` backspace control character (U+0008)** embedded in their name, immediately after `Notice/`:

```
JSON.stringify(name) === "\"Notice/\\bRoboto/R/19\""
JSON.stringify(name) === "\"Notice/\\bRoboto/B/19\""
```

This is the **same corruption class** the orchestrator warned about (`\x08title`). Consequences for BUILD:

- **These two styles will not be found by an exact string match on `Notice/Roboto/R/19`.** You must match on the key, or on a control-char-stripped comparison.
- They break the `<Scale>/<Typeface>/<Weight>/<Size>` grammar that all 34 other styles follow.
- **`Notice/\bRoboto/B/19` uses the letter `B` but its font is Roboto `Medium`** — so it is inconsistent even with the Roboto `M` convention that the other 8 Roboto pairs follow. It is the *only* Roboto style using `B`.

These two styles are the single worst landmine on the page. Reach for them **by key**, never by name.

## Name-reliability verdict

**Reliable for on-canvas layers; UNRELIABLE for style names.** This page splits cleanly in two, and the distinction matters:

- **Layer names: reliable.** Every TEXT layer on both the styleguide and usage frames is named with its exact rendered string (`한 줄 일때 이런느낌`, `48px(-4)`, `기본 폰트 사이즈는 Body(21)입니다…`). Screenshots of `2061:16324`, `2263:10044` and `2278:11762` confirm the node tree matches the canvas with no drift. No placeholder demo copy, no layers named after a different page.
- **Style names: unreliable in three specific ways** — (1) the `\b` control char in both Notice/Roboto styles, (2) scale words that differ from the table's labels (`P1`→`Point1`, `H`→`Headline`), (3) the weight letter `B` on `Notice/\bRoboto/B/19` denoting Medium, not Bold. **Verify against `fontName` and the key; do not trust the style path string.**

**Rules embedded in screenshot images: YES, but they are non-load-bearing.** The `Typo_usage` frame contains three pasted screenshot nodes (`스크린샷 2022-10-12 오후 12.47 1`, `…12.50 1`, `…12.52 1`). I screenshotted and inspected all three: they are **tiny Figma UI chrome icons** (the Assets-panel icon, the `T` text-tool icon, the `∷` font-picker icon) inlined into the numbered steps. **They carry no rules or values** — each step's actual instruction is in an adjacent real TEXT node, which is fully transcribed above. Nothing was lost to image-only content on this page.

## Gaps / unverifiable

- **`Notice/Roboto`'s 26px line height against a 24px Fix Height is unexplained.** It is the only nonzero Roboto delta and it sits on the same row as the `\b` corruption. Real on-node (verified: `lineHeight:26`, `height:24`), but plausibly an authoring accident rather than intent. **Needs a designer to confirm.**
- **The Usage column is blank for 8 of 9 Nanum rows and all 9 Roboto rows.** *Blank at source is the finding* — there is no per-scale semantic guidance (when to reach for `Point1` vs `Headline`, etc.). The only Usage text present describes Body but sits in the Notice row. Do not invent role assignments for these scales.
- **The Roboto Usage column's rightmost cells contain `example sentence blackpink in your area`** (`2263:10151`, `2263:10153`) — placeholder demo copy occupying the slot where Nanum has its one real usage sentence. Confirms the Usage column was never filled in for Roboto.
- **`Bold` sample nodes are not all style-linked.** `2063:16325` (Nanum L Bold sample) returns `textStyleId` → `null` — it is raw `NanumBarunGothic Bold 40`, not bound to `Large/Nanum/B/40`. The demo cells are partially hand-set. This doesn't affect the style definitions, but means you cannot enumerate the scale by walking the sample nodes' styles.
- **Zero-width artifact nodes**: every row contains a TEXT node literally named `Text` with `width: 0, height: 50.56`. These are empty leftovers, not spec. Ignore them.
- **`Mixed` is named but never defined.** Both the 사용방법 step 4 (`한글(나눔바른고딕/Mixed)`) and the third caution (`Mixed 사용 시…`) reference a "Mixed" font mode, but **no `Mixed` typeface, style, or table row exists on this page.** Presumably it means a Korean+Latin text run. **Unverified — the term is used as if already understood.**
- **No `Notice/Roboto` clean-named style exists** to compare the corrupted pair against, so I cannot tell whether the `\b` pair replaced an earlier correct pair or was always malformed.
- **Whether these 36 styles are actually *published*** (vs. merely local) is not directly verifiable — `remote:false` proves they're defined here, not that the library is published. The 사용방법 `00_Library 토글 켜기` instruction implies publication. **Inference, not proof.**
- This session is **read-only**. Style keys were read off local style objects via `getLocalTextStylesAsync()`, which is authoritative for *these* keys — but no `importByKeyAsync` round-trip was attempted, so **cross-file resolution of these keys is unverified**, as expected for a read-only session.

## How this feeds BUILD mode

- **Type has no `Channel` axis.** Both frame subtitles read "QV-NM" — one scale serves NM and QV alike. Unlike color (`nds-mweb-colors.md`), you do not pick a channel before doing type work.
- **Default to `Body` (21).** The guide pins it (📌) and states it in writing. `Info`(18) and `Label`(15) exist but the page's own caution says don't go below 21 except in special cases — treat them as exception-only.
- **Korean text: set the box height to Fix Height, not line height.** `Fix Height = lineHeight − 2` for every Nanum step except `L`, where it's `− 4`. Concretely: `Body/Nanum/R/21` has `lineHeight: 32` → **box height 30**.
- **Mixed Korean+Latin: use the Nanum Fix Height, not Roboto's.** The guide says so explicitly. Roboto's delta is 0, so building a Mixed box off Roboto's column leaves it 2px too tall at every step.
- **Latin-only Roboto: no correction needed** — Fix Height == line height on 8 of 9 steps. `Notice` is the lone exception and is suspect.
- **Keep text-box align = top.** Stated caution.
- **`textAutoResize`**: Nanum samples are `'NONE'` (fixed height — consistent with the Fix Height rule); Roboto samples are `'HEIGHT'` (auto). This mirrors the Korean-vs-Latin split. When building Korean text, `FIXED` + explicit `resize()` to the Fix Height is the shape that matches the guide — **not** `HUG`/auto.
- **Fetch the two `Notice/…Roboto/…` styles by key, never by name** — `c4112ea69a3d7aa6f0d87c4f018340c68c4e117f` (R) and `58f3332efd7beeb19e88edc565a027dce70d695f` (B, actually Medium). An exact-name lookup will silently miss them.
- **Don't ask for "Roboto Bold" — it doesn't exist here.** The heavy Roboto weight is `Medium`. Requesting `Roboto Bold` will either fail to load or fall back, silently diverging from the library.
- **Follow the `figma-use` canonical text recipe** — `loadFontAsync` for **both** `NanumBarunGothic Regular/Bold` and `Roboto Regular/Medium` before any mutation. Neither family is preloaded (only Inter is), so skipping the load will throw `Cannot write to node with unloaded font`.
