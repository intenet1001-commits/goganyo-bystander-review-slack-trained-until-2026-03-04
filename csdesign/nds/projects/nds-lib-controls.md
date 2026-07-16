---
name: nds-lib-controls
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=371-7729"
learned_date: 2026-07-16
sections_studied:
  - "371:7729 (page '    - Controls (toggle, switch, check, radio)' — 7 top-level frames; on-canvas the page is 6 numbered guides + an assets frame)"
  - "2522:12171 (frame '1. Toggle' — on-canvas heading 'Toggle' / 'QV-NM toggle Design Guide'; sections BASIC, TXT, ON-OFF, CURRENCY)"
  - "3911:8512 (frame '2. Check' — on-canvas heading 'Check' / 'QV-NM Check Design Guide'; sections ICON, BOX CHECK, COMBINE, FIXED)"
  - "3928:8543 (frame '3. Radio' — on-canvas heading 'Radio' / 'QV-NM Radio Design Guide'; sections BASIC, BUTTON)"
  - "5261:10878 (frame named '3. Radio' but on-canvas heading is 'Switcher' — layer name is WRONG, see conflicts)"
  - "47817:1059 (frame '4. Slider' — on-canvas heading 'Slider'; subtitle wrongly reads 'QV-NM Radio Design Guide')"
  - "3950:8534 (frame 'Control_usage' — on-canvas heading 'Control Usage'; carries the page's only Last update stamp)"
  - "43336:880 (frame '99. Check_assets' — 9-patch Android assets; carries its own newer Last update stamp)"
status: "live — internal NDS component library page. Evidence: 27 local COMPONENT_SETs with published keys, two dated 'Last update' stamps (2022.11.04 and 2025.05.16), and recent variant work (Darkmode axis nodes in the 60630:* id range)."
---

# NDS Library — Controls (toggle, switch, check, radio, slider)

The **canonical source for radio, checkbox, toggle, switch and slider component keys** in `NDS_Library` (`72zrHgMLM4zhCjgSuTf7cC`). This page settles the long-standing `#radio-keys-never-sighted` ledger entry — the radio keys live here and are captured in full below.

**Components on this page are LOCAL (`remote: false`) — that is expected and correct.** This file *is* the library; `remote: false` means "defined here", not "unpublished". Every set carries a stable 40-hex `key`, which is what a consumer file would import by. Judged by structure (variant sets on a guide page, named to the `ms_btn_*` / `nds_img_*` asset convention, referenced by instances on other pages), these are **tier (a) published library components**.

**Keys below are `unverified`** — this was a read-only session. No `importComponentSetByKeyAsync` round-trip was performed to confirm they resolve from a consumer file.

## Name reliability: RELIABLE (with two named exceptions)

Screenshotted every rule-bearing frame and compared layer names against on-canvas headings.

- **Variant/axis names are reliable** — `Channel=NM, Status=normal` etc. match the on-canvas column labels (NORMAL / SELECTED / DISABLED / DISABLED-SELECTED) exactly.
- **Two frame layer names lie** (see Conflicts): frame `5261:10878` is named `3. Radio` but is actually the **Switcher** guide; frame `47817:1059` (`4. Slider`) carries a copy-pasted subtitle reading "QV-NM **Radio** Design Guide".
- **Demo copy is placeholder filler** — `버튼명`, `텍스트를 입력하세요`, `텍스트를 입력해주세요.` are lorem, not product strings. Do not record them.
- **Rules ARE embedded in text nodes, not images** on this page — the two long annotation notes (below) are real TEXT nodes and extracted cleanly. **No pasted-screenshot rules found on this page.**

## Last update (verbatim)

- `Control_usage` (`3950:8534`) → **`Last update 2022.11.04 구자영`**
- `99. Check_assets` (`43336:880`) → **`Last update 2025.05.16 구자영`**

The assets frame is ~2.5 years newer than the usage guide. **The guide's stated rules are stale relative to the components** — the Darkmode variants and the `check_popup`/`check_page` sets postdate the 2022 usage text entirely and are not mentioned by it.

## ⭐ Radio component keys (settles `#radio-keys-never-sighted`)

### `radio_basic` — SET key `91f58f3a086c5ef03ac03c8d77a725d32b3f7a1f`

**KIND: COMPONENT_SET** (this is the key `importComponentSetByKeyAsync` needs). Axes: `Channel=[NM|QV]` × `Status=[normal|selected|disabled|disabled-selected]`. 8 variants. On-canvas: "DEFAULT / 기본 26 크기 라디오" — 26px is the only size.

| Variant (verbatim) | node | **COMPONENT** key (variant, not SET) |
|---|---|---|
| `Channel=NM, Status=normal` | 3928:8869 | `709143b66c5189503db03a32b025d8518ce150a6` |
| `Channel=NM, Status=selected` | 25985:2072 | `b8917d8b6a51b12841f3dd8de4e54cbe28190f3c` |
| `Channel=NM, Status=disabled` | 25985:2059 | `d9fc5ffbbf6115db45b423cb9ec63931319470e0` |
| `Channel=NM, Status=disabled-selected` | 3928:8871 | `5e9c2f3175b573b5741287267a8bf92ec809071a` |
| `Channel=QV, Status=normal` | 3928:8882 | `6b4b47d65352aa9e89e40b09adcec94d2ea6f1dc` |
| `Channel=QV, Status=selected` | 25985:2075 | `6805af6865575d4bf4eb03718d430f6352ab24b7` |
| `Channel=QV, Status=disabled` | 25985:2062 | `6a1a66694abeda13f6ecd907f39b0076393e3ef9` |
| `Channel=QV, Status=disabled-selected` | 3928:8884 | `2503df11961126d9ffe9debf4096392703c672f7` |

Android asset names annotated on canvas: `ms_btn_radio26_nn` (normal), `ms_btn_radio26_sn` (selected), `ms_btn_radio26_nd` (disabled), `ms_btn_radio26_sd` (disabled-selected). The `nn/sn/nd/sd` suffix grammar = **`<n|s>` normal/selected × `<n|d>` normal/disabled**.

### `radio_btn` — SET key `1a972d991cc7c8f8f97bc5557740fba58ca82f23`

**KIND: COMPONENT_SET.** Axes: `Height=[h60|h46]` × `Active=[on|off|disabled]`. 6 variants. On-canvas: "BUTTON / 텍스트가 들어간 단일 선택 버튼형 입니다."

| Variant (verbatim) | node | **COMPONENT** key |
|---|---|---|
| `Height=h60, Active=on` | 3950:8514 | `693241be33cb8ffb46d6b2c03e183ab894d8cbc5` |
| `Height=h60, Active=off` | 3950:8516 | `6ec79249ce8e0666594028e728647d4bd5e4120b` |
| `Height=h60, Active=disabled` | 53016:2142 | `e723a8759cc22f3490c12ff8a4f65faea3ef9f86` |
| `Height=h46, Active=on` | 3950:8524 | `fdb107c73faaa8960061bd6fa314a21e6d3b42d1` |
| `Height=h46, Active=off` | 3950:8526 | `01c115518ba44c8c929a7f91ae2d08acd2e03784` |
| `Height=h46, Active=disabled` | 53016:2202 | `f61bb70508bcfb64c086635f5b0a431e80c0c56a` |

**`radio_btn` has no `Channel` axis** — unlike `radio_basic`. The selected state renders as a black outline + bold label, which is channel-neutral. Do not look for an NM/QV switch here.

`radio_btn_calendar` (`3966:8427`) is a **bare COMPONENT, not a set** — a fixed 1주/1개월/3개월/기간설정 date-range row.

## Checkbox component keys

### `check_icon_solid` — SET key `3452ebde77d6d2d759f123e422ccee3a6c01b3c4`

**KIND: COMPONENT_SET.** Axes: `Channel=[NM|QV]` × `Height=[h34|h26]` × `Status=[normal|selected|disabled|disabled-selected]` × `Darkmode=[false|true]`. 24 variants. On-canvas: "SOLID / 가장 기본적인 체크", asset name `ms_btn_rcheck(크기)_nn/sn/nd/sd`.

**The `Darkmode=true` variants only exist at `Height=h26`** — 4 statuses × 2 channels = 8 dark variants, all h26. There is **no h34 dark variant**. 16 light (2 channels × 2 heights × 4 statuses) + 8 dark = 24. Don't assume Darkmode is available at h34.

Selected variant keys (the most-reached-for):

| Variant | node | COMPONENT key |
|---|---|---|
| `Channel=NM, Height=h34, Status=selected, Darkmode=false` | 3911:8616 | `0f42fb2cff6b7346a2d7aeace0b20d9a090daec3` |
| `Channel=NM, Height=h26, Status=selected, Darkmode=false` | 3911:8620 | `82e89dfb097f3ce62bff2b6b0ba221c1ef945134` |
| `Channel=QV, Height=h34, Status=selected, Darkmode=false` | 3911:8608 | `29499fe831561887930f3e3051e12da6c676366b` |
| `Channel=QV, Height=h26, Status=selected, Darkmode=false` | 3911:8612 | `88ad11fe05f546c08e29ee0aa81a83ba0a940acb` |
| `Channel=NM, Height=h26, Status=selected, Darkmode=true` | 60630:2346 | `72665b500c11bcfbabc6872b9a35bd9e6f99e9c0` |
| `Channel=QV, Height=h26, Status=selected, Darkmode=true` | 60630:2326 | `b42c25790b98fa39c92397c490d0fec741a662d9` |

Normal/disabled/disabled-selected keys, all 24, were captured in-session; the full set is recoverable by re-running the same read-only script against `3911:8607`.

### Other check sets (SET keys)

| Set | node | **SET** key | Axes | Notes |
|---|---|---|---|---|
| `check_icon_line` | 3911:8865 | `0598f4c21dd68667d15d34875f12c1b3e1176c34` | `Channel` × `Status` (8) | on-canvas "LINE / 하위 뎁스의 체크"; asset `ms_btn_lcheck_nn/sn/nd/sd` |
| `check_icon_multi` | 43553:521 | `1fd5b30c3c7153a7e47c66aaa6b8a09232eadf42` | `Status=[normal|selected]` (2) | asset `ms_btn_mcheck_nn/sn`. **Scope-restricted — see rules** |
| `check_combine_txt` | 3911:8800 | `67ca79c4745e8c8438a79688f7468834ef9187e9` | `Txt Line=[한줄|두줄]` × `Size=[h26|h34]` (4) | |
| `check_combine_box` | 3911:8894 | `4ead5df2730ab0c4ac6bf3e48730225cc825261e` | `Type=[1dep|2dep-list|2dep-checklist]` (3) | |
| `check_btn` | 43317:847 | `1bf507f2445fd36a2829988134beb5dc97e8bd85` | `Property 1=[normal|selected]` (2) | **axis is literally named `Property 1`** — never renamed |
| `financial_boxlist_selected_NM` | 43336:1015 | `bc6925d15535f74cdaa430653d1c3f7c3f718554` | `type=[nomal|seleted|linked|linked_selected]` (4) | **two typos in the values** — see conflicts |
| `check_popup` | 46068:13185 | `b008e8fc02ccce8b762c12a9fb1f88d64fca6865` | `Scroll=[on|off]` × `BTN=[on|off]` (4) | |
| `check_page` | 47842:5024 | `2905df9f858f7fcd02e1718ce435f84da4ccd836` | `Scroll=[on|off]` × `BTN=[on|off]` (4) | |

`check_btn` variant keys: `Property 1=normal` → `f31ee4cea4d356106312923e5995c7cb88a330c1`; `Property 1=selected` → `15f17fc98d1451a2c04de18fcf4fef5b5525acf5`.

`check_icon_multi` variant keys: `Status=normal` → `a911a9bf283fa90b1b064df57aff35f5c972a1b4`; `Status=selected` → `f2fb632b07c6f5f5ef7a39502e53c817cd94ba21`.

## Toggle component keys

| Set | node | **SET** key | Axes |
|---|---|---|---|
| `toggle_basic` | 454:9647 | `42cff7468c8000d28635cd9abd7695ce9aabc30b` | `Channel=[NM|QV]` × `Height=[h32]` × `Active=[on|off]` (4) |
| `toggle_txt` | 831:12129 | `b24f3ce689ce24cdccae8d20ddd0f72f75944f8a` | `choose=[left|right]` (2) |
| `toggle_text46` | 48546:1461 | `00f076de364f91983319aba487cbc4ca53d5374d` | `State=[left|right]` (2) |
| `toggle_onoff` | 454:9672 | `3ad6558b799f217f19bed9d4e3901adc03da95e3` | `Channel=[NM|QV]` × `Active=[on|off]` (4) |
| `ms_btn_wontoggle` | 29689:340 | `71b99be39faa46e4b41d77b5e7a28b6e91f110aa` | `toggle=[on|off]` (2) |
| `ms_btn_pricetoggle` | 28791:360 | `c1bd0d2d0bee70db7bc3a6d1d58dac9fc09b724a` | `Active=[true|false]` (2) |
| `ms_btn_wondollartoggle` | 34359:6927 | `5345017484d897910b8eef7a71884e7b9fddb5b6` | `dollar=[ture|false]` (2) — **`ture` is a typo at source** |

`toggle_basic` variant keys: NM/on `225034975893f7907e883f8860158ef7375f3411`, NM/off `807c0bafd46087611faec0b84445be5019966393`, QV/on `ee14638c16eb4650566abb2c787ae4ffb6d9c0c4`, QV/off `cec7c969ae7b253ea039e8fd0c8e14e9ae4143f3`.

`toggle_onoff` variant keys: NM/on `cb4dcd130806fcc8eaacbd77fa79b852b204756e`, NM/off `dea61bac909e04e8305924fdc7b6bda2e325de05`, QV/on `5143d390e1967c983f0706164fbfc3205326f938`, QV/off `d6adb23ce6675ac3a19d375916e8f1af44b53d69`.

**`toggle_basic` has a `Height` axis with exactly one value (`h32`).** A single-value axis is a placeholder for sizes that were never built. Pass `Height: 'h32'` — it is required but offers no choice.

## Switcher & slider component keys

| Set | node | **SET** key | Axes |
|---|---|---|---|
| `slider_basic` | 47817:1180 | `a3657af47e9b4aef84458f239322f3618a219d7d` | `Channel` × `Value=[10|5]` × `No.` (16) |
| `switcher_table` | 2851:8832 | `34d5394d301cfd19128ab637aa627d337d0df2e5` | `Step` × `Active` × `Channel` (10) |
| `switcher_table_asset` | 460:12557 | `5aaff3d98038886bf7ea9fa716e7c90f008fd9a1` | `Channel` × `Status` (4) |
| `nds_img_switcher` | 44711:1411 | `6e05e2b4e1d23a9998ac0fe872fbf66b8585bdea` | `Channel` × `\bValue` × `No.` × `Theme` (36) |
| `nds_img_priceswitcher` | 47504:28046 | `db39127bf6f7649a9ed9aef3a080539645236185` | `No.=[1..4]` (4) |
| `nds_img_market_switcher` | 52750:2088 | `80ce98978f664a33f5812ba8802c5e0f12737833` | `Channel` × `trading_label=[통합|KRX|NXT]` × `Dark mode` (9) |
| `nds_img_order_switcher` | 69118:3283 | `4630e785909200bbd409d125d5ad4aea517e78a1` | `Channel=[NM|N2]` × `Type=[일반|소수점]` (4) |
| `toggle_text46` (chart) | 54894:2428 | `4968d922b3b75c0b3478fac9a020667aa7685f7c` | `\bStep=[01|02|03]` (3) |
| `Component 1` | 54894:2433 | `0a0211f256aaab07c5bdf7313b6c1b418bf8e0c4` | `\bDropdown=[on|off]` (2) — **unnamed set** |

### 🔴 Invisible control characters in axis names

**`nds_img_switcher`'s value axis is not `Value` — it is `\bValue`, with a leading U+0008 BACKSPACE character.** Same for `toggle_text46`'s `\bStep` and `Component 1`'s `\bDropdown`, and `account_apply`'s `\b레이블표시` value on the Account page.

This is invisible in the Figma UI and in any screenshot. A `setProperties({ Value: '03' })` call will fail with a confusing "no such property" error. **Read the axis name off the API and use it byte-for-byte** — do not retype it. This is the single highest-value gotcha on the page for BUILD work.

## Rules transcribed verbatim from canvas

From `Control_usage` (`3950:8534`) — the page's stated usage rules:

> 사용방법
> 1. 사용하고자 하는 기능에 맞는 control을 사용합니다.
> 2. 케이스별 properties를 확인합니다.
>
> 사용 시 유의사항
> 제공된 라이브러리 이외의 탭은 사용을 지양합니다. 수정은 디자이너와 협의가 필요합니다. (for designer) 예외케이스는 해당하는 templates에 추가하도록 합시다.

Toggle-selection rule (`48546:1471`, a real TEXT node on the Toggle frame):

> toggle_txt는 카드 , 일부 구좌 내에서 콘텐츠를 구분할 때 주로 사용  예) 매도 주문조건 설정, 큰손픽 toggle_txt46은 주로 필터와 소팅과 함께 같은 Align에서 사용 예) 뉴스인사이트 > 종합 뉴스 Label은 두글자를 권장

So: **`toggle_txt` = inside a card/구좌 to divide content; `toggle_text46` = on the same align line as filters and sorting. Labels should be two characters (`Label은 두글자를 권장`).** Note the annotation says "toggle_txt46" but the actual layer is `toggle_text46` — the prose and the layer name disagree by one character.

Font/asset warning on the ON-OFF toggle (`40557:23664`):

> 홈 > 자산 > 총자산 구좌에서 사용중 이미지 애셋 아니고 개발코드로 진행함 나눔폰트로 적용되어 있어 Roboto로 지정 요청할 것

I.e. the on-off toggle is **not an image asset — it's built in code**, currently rendering in 나눔 (Nanum) and needs to be re-specced to Roboto.

Scope restrictions on the check components (`46490:25926`, `46490:25928`):

> 퇴직연금 실물이전에서만 사용

> 퇴직연금 실물이전에서만 사용 다른 화면에 사용하고 싶을때 디자인팀 문의

**`check_icon_multi` and the 3-column box check are restricted to the 퇴직연금 실물이전 (retirement-pension physical transfer) screen only.** Using them elsewhere requires asking the design team first. Do not reach for `check_icon_multi` as a general-purpose checkbox.

Box-check character limits (`43327:861`, `43308:591`):

> 최대글자4~5 아이콘과 겹치지 않게

> 가로 3열 체크

**Box check labels max 4–5 characters, must not overlap the icon.** The 2-column variant is `Fixed Rows / 가로 2열 체크` (asset `ms_btn_radio60_nn/sn`); the 3-column is a separate composition.

Fixed-position check rule (`15631:15294`):

> fixed 팝업/페이지 하단에 고정되어 사용됩니다. 팝업/페이지 상하 좌우 마진이 다르니 유의해주세요.

**`check_popup` and `check_page` are two distinct sets precisely because popup and page margins differ.** Don't substitute one for the other.

## Blanks at source — report, don't infer

- **No time/interaction/animation rules anywhere on this page.** No transition duration for the toggle knob, no press-state timing, no ripple spec. This is the systematic blank this design system has; the toggle guide shows only static on/off. **Do not infer a duration from the mockup.**
- **No `disabled` state on `toggle_basic` or `toggle_onoff`.** Only `Active=[on|off]`. Checkboxes and radios have 4 statuses including disabled; toggles have 2. This asymmetry is real, not an omission I should paper over.
- **No Korean semantic role text** on any swatch/variant here (unlike the Colors page). Axis names are the only semantics.
- **`Control_usage` carries no per-component rules** — it's four generic lines. The actionable rules are the scattered annotation TEXT nodes transcribed above, not the usage frame.

## Conflicts / hazards for the LEDGER

1. **Frame `5261:10878` is named `3. Radio` but is the Switcher guide** (on-canvas heading: "Switcher"). There are **two frames named `3. Radio`** on this page (`3928:8543` = real Radio, `5261:10878` = actually Switcher). Selecting "the 3. Radio frame" by name is ambiguous and will silently give you the wrong one.
2. **`4. Slider` (`47817:1059`) subtitle reads "QV-NM Radio Design Guide"** — copy-paste from the Radio frame, never updated. The Switcher frame has the same wrong subtitle. **Only `2522:12171` (toggle) and `3911:8512` (check) have correct subtitles.**
3. **Backspace (U+0008) characters in four axis names** — `\bValue`, `\bStep`, `\bDropdown`, `\b레이블표시`. Invisible; breaks `setProperties`.
4. **Typos baked into variant values**: `ms_btn_wondollartoggle` has `dollar=ture` (not `true`); `financial_boxlist_selected_NM` has `type=nomal` (not `normal`) and `type=seleted` (not `selected`). These are the literal strings — **pass the typo, not the correction.**
5. **`toggle_txt` uses axis `choose`; `toggle_text46` uses axis `State`** — same left/right concept, two different axis names. No convention.
6. **A set is literally named `Component 1`** (`54894:2433`) — never named. It's the chart-switcher dropdown.
7. **`check_btn`'s axis is `Property 1`** — Figma's default, never renamed.
8. **Two `toggle_text46` sets exist with different keys**: `48546:1461` (`00f076de…`, axis `State`) on the Toggle frame and `54894:2428` (`4968d922…`, axis `\bStep`) on the Switcher frame. Same name, different components. **Match by node id or key, never by name.**
9. **Guide text is 2022; components are 2025.** The `Control_usage` rules predate Darkmode, `check_popup`, `check_page` and the market switcher entirely.
10. **Hidden frames**: `Group 1` (`502:11174` and its clones on every frame) is `hidden="true"` and contains `toggle_switch_txt/*` instances. These render blank and are **legacy leftovers cloned onto every frame on this page** — not rules, not usable components. Ignore them.

## How this feeds BUILD mode

- **Radio**: import SET `91f58f3a086c5ef03ac03c8d77a725d32b3f7a1f`, then `setProperties({ Channel: 'NM'|'QV', Status: 'normal'|'selected'|'disabled'|'disabled-selected' })`. Only 26px exists. For the text-button form use SET `1a972d991cc7c8f8f97bc5557740fba58ca82f23` with `{ Height: 'h60'|'h46', Active: 'on'|'off'|'disabled' }` — **no Channel axis**.
- **Checkbox**: default to `check_icon_solid` (`3452ebde…`). `Darkmode: 'true'` is h26-only. `check_icon_line` is for sub-depth rows. **Never use `check_icon_multi` outside 퇴직연금 실물이전.**
- **Toggle**: `toggle_basic` (`42cff746…`) for the standard switch; `toggle_onoff` (`3ad6558b…`) for the ON/OFF-labelled variant (and note it's code-rendered, font needs Roboto). Neither has a disabled state.
- **Always read axis names off the API before `setProperties`** — four of them contain invisible backspace characters, and three sets use Figma-default or misspelled names.
- **Channel discipline carries over from `nds-mweb-colors`**: `NM` = green `#84C13D`, `QV` = orange `#FFAA1A`. Every `Channel`-bearing set here follows it.
- Keys are **unverified** (read-only session). Confirm with `importComponentSetByKeyAsync` before relying on them in a consumer file.
