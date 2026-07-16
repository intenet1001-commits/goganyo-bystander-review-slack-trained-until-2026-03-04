---
name: nds-lib-security-keypad
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=5461-10188"
learned_date: 2026-07-16
sections_studied:
  - "5461:10188 (page '    - Security Keypad  보안 키패드' — by far the largest page in the batch: 11,422-line metadata dump (~950KB), 26 COMPONENT/COMPONENT_SET nodes, canvas spanning x=-12930 to x=+37000)"
  - "8979:19449 (frame '거래비밀번호_normal' — the 540-wide QWERTY transkey, under the 📌 '아래의 540 키패드를 사용해주세요' directive)"
  - "11142:14474 (frame 'iOS_공통' — the transkey glyph inventory: common > input > cap/eng/key/sym/etc)"
  - "8977:16941 / 8979:19500 (the two width-regime headings: 'width 608 (이미지 원본 활용)' and 'width 540')"
  - "11246:14848 (COMPONENT_SET 'input_area', axis Status: normal/pressed/pressed-save/error)"
  - "12003:14703 (COMPONENT_SET 'NM' — BROKEN: variantGroupProperties throws 'Component set has existing errors')"
status: "live but CONTESTED — no 'Last update' stamp exists on the page. Dated evidence instead: on-canvas 📌 'As-Is' vs 'to-be_230413' frames and a '📌 아름경은ver' alternative, i.e. a redesign was in flight as of 2023-04-13 with at least two competing proposals unresolved on the canvas."
---

# NDS Library — Security Keypad (보안 키패드)

**The finding: this page is NOT under-specified for security reasons. It is the opposite — it is the most heavily specified page in the batch, and its problem is that it specifies too many contradictory things at once.**

The brief anticipated deliberate under-specification. That is not what is here. What is here is a **third-party transkey (보안 키패드) integration spec** — a raster asset delivery manifest for an external secure-input SDK — plus **an unresolved 2023 redesign with two competing proposals still on the canvas**.

## Why this page is structurally unlike every other page in this batch

Ordinary NDS pages are: a component frame + a usage frame + a Last update stamp. This page is none of that. It is:

- **A raster asset manifest.** Hundreds of `transkey_alnum_cap_<N>` / `transkey_alnum_cap_<N>_land` rounded-rectangles (`11289:16961`–`11289:17012`+), each 40×71 (portrait) or 68×48 (landscape). These are **individual key-cap images the transkey SDK loads by filename**. The `_land` suffix = landscape. **The SDK, not the app, composes the keyboard** — which is exactly why the keypad must ship as loose images rather than as a Figma component.
- **A per-platform, per-orientation, per-device matrix.** Top-level frames enumerate: `IOS_세로_2` / `IOS_가로_2` / `IOS_iPad_세로` / `IOS_iPad_가로` / `AOS_세로_2` / `AOS_가로_2` / `거래비밀번호_폴더블` (foldable) / `거래비밀번호_패드` / `거래비밀번호_패드가로종합`. **세로**=portrait, **가로**=landscape, **폴더블**=foldable, **패드**=tablet.
- **Screenshots of real devices.** `IMG_0126`, `IMG_0127`, `IMG_0128`, `IMG_0030`, `IMG_0031` — camera-roll filenames, pasted as rounded-rectangles at 707×1018 and 949×623. **The tablet/foldable "spec" is literally photographs of a running app.** Nothing in them is extractable; they are evidence, not specification.

## ⚠️ The two competing width regimes — the page's central conflict

Two on-canvas headings sit over two parallel bodies of work:

| Heading (verbatim) | Node | Governs |
|---|---|---|
| **`width 540`** | `8979:19500` | `거래비밀번호_normal/pressed/selected/errer`, `기호키패드_normal`, `숫자키패드_normal/pressed` — all 540×987 |
| **`width 608 (이미지 원본 활용)`** | `8977:16941` | the same six frame names again — all **608×1260** |

`이미지 원본 활용` = "uses the original image". So the 608 regime ships the transkey vendor's **native-resolution artwork**, and the 540 regime is a **rescaled** NDS-conformant version.

**And a third heading resolves it — sort of:**

> **`📌 아래의 540 키패드를 사용해주세요.`** (`8989:16646`) — "**Please use the 540 keypad below.**"

That is a directive: **540 wins.** But the 608 material was **not deleted** — it sits directly beneath, fully built, in both NM and QV (`11246:18943` = `NM`, `11246:18944` = `QV`). **Flagged for LEDGER**: an explicit "use 540" instruction coexisting with a complete, undeleted 608 implementation is exactly the setup that gets the wrong one shipped.

Note `errer` — **misspelled at source** (should be `error`), and it names **three** different frames (`8979:17637`, `8989:15930`, `8979:19490`). The `input_area` component set spells the same state correctly (`Status=error`). **Both spellings are live in the same file.**

## ⚠️ An unresolved 2023 redesign, with two rival proposals

Four 📌 headings mark competing branches:

| 📌 Heading | Node | Frames |
|---|---|---|
| `📌 As-Is` | `11320:22223` | `0413_AOS_세로_as-is` (`11289:16025`), `0413_AOS_가로_as-is` (`11289:18831`) |
| *(unlabelled to-be)* | — | `AOS_세로_to-be_230413` (`11289:19450`), `0413_AOS_가로_to-be` (`11289:19012`) |
| `📌 아름경은ver` | `11320:22224` | `AOS_가로_2` (`5461:11496`), `AOS_세로_2` (`5461:11947`) |
| `📌 재배열 버튼 추가 시` | `25315:3442` | `keypad_number` set (`25315:3368`) |

`0413` / `230413` date these to **2023-04-13**. So: an **As-Is**, a **To-Be**, and a **third alternative named after its authors** (`아름경은` reads as the given names 아름 + 경은 — a designer-pair's working version). **Three Android proposals, none marked as adopted, no decision recorded, no date stamp.** Flagged for LEDGER — this is the single biggest "ask before building" item in the batch.

**`📌 재배열 버튼 추가 시`** = "when adding a **재배열 (rearrange/shuffle) button**". This is the security-relevant one: transkey scrambles key positions, and this zone specs a control that **re-scrambles them on demand**. It is scoped by a conditional heading (*"when adding…"*) — i.e. **optional, not baseline**. Its `keypad_number` set (`25315:3368`, key `f8a2ddc3b8204dc13c5dd8a4900464042e895fb1`, axis `Status`) is 663×746 — a different geometry from every other keypad on the page.

## ⚠️ A structurally broken component set

**`NM` (`12003:14703`)**, key `890429b79228f68726e702b1f830f0010fa57590`, `remote: false`.

Reading `variantGroupProperties` **throws**: `in get_variantGroupProperties: Component set has existing errors`. This is Figma's error for a set whose children have **inconsistent or duplicate variant definitions** — the set is in an invalid state *in the file itself*.

The cause is visible in its children: **`Type=ms_btn_keypadcheck_nn` names TWO components** (`12003:14702` key `9c887c1c…`, `12003:14704` key `c0c508590d…`) and **`Type=ms_btn_keypadcheck_sn` names TWO** (`12003:14707` key `faee2cc4…`, `12003:14708` key `65603633…`). **Four children, two distinct variant values, duplicated.** Figma cannot resolve which is which.

**Consequences:**
- The set's axis list is **unreadable** — not by my tooling, but at all.
- **`importComponentSetByKeyAsync('890429b7…')` on this set is unsafe.** Import the individual COMPONENTs by their own keys.
- A set named just **`NM`** is also a naming failure — it's a channel name occupying a component-name slot.

**This is a real defect in the source file, not an artifact of read-only access.** Flagged for LEDGER as the highest-severity item found.

## The transkey glyph inventory (`11142:14474`, `iOS_공통`)

Recovered by screenshot. Four `common > input > <class>` groups define the **complete character set the SDK must render**:

- **`common > input > cap`** — `A`–`Z`
- **`common > input > eng`** — `a`–`z`
- **`common > input > key`** — `1234567890` and `` ` `` `-` `=` `₩` `[` `]` `;` `'` `,` `.` `/`
- **`common > input > sym`** — `! @ # $ % ^ & * ( ) ~ _ + | { } : " < > ?`
- **`common > input > etc`** — `•` (masking bullet), `␣` (space), `|` (caret)

The `₩` (won sign) is rendered **struck through** on the canvas — visually marked as excluded/deprecated, but **with no legend explaining the strike**. Blank at source; **unverified**. Do not assume `₩` is out.

A `iPhone_Res > common` column holds only an `×` (close) glyph and a vertical caret rule.

The `거래비밀번호` (transaction password) keypad renders **QWERTY with Korean sub-labels** (`q`/`ㅂ`, `w`/`ㅈ`, `e`/`ㄷ`…) — dual-script keys — plus a numeric strip, `기호` (symbols) / `SPACE` / `취소` / **`확인` (green = NM)**, a `⇧` shift and `⌫`. The input area shows a **`⊘ 저장하기` (save) affordance** — notable on a *transaction password* keypad; its semantics are **not specified anywhere on the page**.

## Component inventory (26 nodes, all `remote: false` — expected, this IS the library)

| Name | Node | Type | Key (full 40-hex) | Axes |
|---|---|---|---|---|
| `NM` | `12003:14703` | SET ⚠️**broken** | `890429b79228f68726e702b1f830f0010fa57590` | **unreadable** |
| `input_area` | `11246:14848` | SET | `40413cab7794da12eef4d6fcddeaecacbf1e09b6` | `Status` = normal / pressed / **pressed-save** / error |
| `keypad_eng` | `11246:14890` | SET | `61e70fe8dc94b66d602c86ccb29ee1f383291b78` | `Status` = normal / pressed |
| `keypad_number` | `13824:15103` | SET | `a0d3f5bfdb7057dd349655e51be04373909bb127` | `Status` = normal / pressed |
| `keypad_number` | `25315:3368` | SET | `f8a2ddc3b8204dc13c5dd8a4900464042e895fb1` | `Status` = normal / pressed |
| `keypad_folderble` | `13824:14722` | SET | `816a4aa0116caca4bd018abebc39ad822d0c0bfb` | `Device` = land |
| `keypad_pad` | `13824:16058` | SET | `1cbfecb71fe319d0505d00fd36465f163b945468` | `Type` = number / eng / land |
| `keypad_sign_normal` | `8979:18329` | COMPONENT | `327f4cef1e8c5d25f7137e2b351a27f77b3b8bf3` | — |

Selected variant COMPONENT keys (**these are COMPONENT keys, not SET keys**): `input_area / Status=normal` = `3b780571ee59bc65a50bb9859029ace96056649e`; `Status=pressed` = `69d5efd12755b22cdc4807f2db4a43e667393711`; `Status=pressed-save` = `6b3d4f5e3422e5258ce03b24962b69e4e21e2450`; `Status=error` = `f22deb3a953d0d0307528b75431cf4327c5a5435`.

**⚠️ `keypad_number` names two different SETs on THIS page** (`a0d3f5bf…`, `f8a2ddc3…`) — **and four more `keypad_number*` COMPONENTs exist on the Number Keypad page** (`keypad_number01`–`04`), unrelated to any of them. Six things, one name. **Always import by key.**

**⚠️ `keypad_folderble`** — misspelled (`folderble` → `foldable`), and its axis `Device` has **exactly one value: `land`**. A single-variant set means **the portrait foldable case is absent** — the foldable frames exist as static art (`11246:18992`, `8989:16882`) but only landscape was componentised. **Blank at source.**

## Name-reliability verdict for this page

**Mixed, with a distinct failure mode: names are systematically MISSPELLED rather than wrong.** `errer` (error), `folderble` (foldable), `seleted` (selected, inherited from the file-wide convention). The names *mean* what they say — they're just typo'd. That is more tractable than the 9-patch page's outright contradictions, but it breaks exact-match lookup.

- **COMPONENT_SET / COMPONENT names: semantically reliable, lexically unreliable (typos), and heavily non-unique** (`keypad_number` ×2 here, ×6 file-wide; `거래비밀번호_normal` ×3; `숫자키패드_normal` ×2; `제작가이드`-style duplication throughout). **Key is the only identifier.**
- **Frame names: reliable and genuinely informative** — the `AOS_세로_to-be_230413` / `0413_AOS_가로_as-is` convention encodes platform + orientation + branch + date. **This is the best-named material in the batch.**
- **📌 TEXT headings: reliable and load-bearing** — they are the page's only routing mechanism and its only decision record.

**Rules embedded in screenshot images: YES, and irrecoverably so.** The tablet and foldable specs are **camera-roll photographs** (`IMG_0126`–`IMG_0128`, `IMG_0030`, `IMG_0031`). The transkey glyph inventory is flat art. Nothing in either is extractable — screenshot is the only read path, and for the photos even that yields evidence rather than specification.

**Three `hidden="true"` frames — content UNVERIFIED:** `키패드_소문자` (`8962:15245`, 602×422), `iPhone_transkey_popup` (`8962:15559`, 104×211), `transkey_popup` (`8962:15562`, 608×211). All three sit far off-canvas at `x≈-12000`. `키패드_소문자` ("lowercase keypad") and the two popup frames would plausibly carry real spec. **They render as blank 1×1 PNGs; I have not quoted anything from them. Unhide and re-check.**

## How this feeds BUILD mode

- **You probably cannot "build" this.** The security keypad is rendered by a **third-party transkey SDK from loose PNG assets**, not composed from Figma components. The NDS side's job is to deliver correctly-named images and to size the surrounding `input_area`. Treat this page as an **asset manifest**, not a component spec.
- **Use the 540 regime.** The 📌 directive is explicit. Ignore the 608 material — but know it exists and is complete, because someone will point at it.
- **Do not touch the `NM` set (`890429b7…`).** It is structurally broken in the file. Import its four children individually by key.
- **The Android design is UNDECIDED.** As-Is / To-Be(230413) / 아름경은ver are three live proposals with no adoption marker. **Ask before implementing any Android security keypad.**
- **재배열 (re-scramble) is conditional**, not baseline — `📌 재배열 버튼 추가 시`.
- **Foldable portrait and any iPad componentisation are missing.** Only `Device=land` exists. Photos are not a spec.
- **`input_area` is the one clean, importable thing here** — 4 states including `pressed-save`. If you need one component off this page, it's that.
- **확인 renders NM green.** As with the number keypad, **there is no QV security keypad.**
