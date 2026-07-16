---
name: nds-lib-account-controller
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=4357-9138"
learned_date: 2026-07-16
sections_studied:
  - "4357:9138 (page '    - Account Contoller  계좌 컨트롤러' — note the source's typo 'Contoller'; 4 numbered guide frames + an assets frame + loose reference mockups)"
  - "4357:9144 (frame '1. Trading' — on-canvas heading 'Account Controller_Trading' / 'QV-NM Accont Design Guide'; section TRADING / WITH BTN)"
  - "5961:10510 (frame '2. Lookup' — on-canvas heading 'Account Controller_Lookup')"
  - "6002:10873 (frame '3. Apply' — on-canvas heading 'Account Controller_Apply')"
  - "6007:11322 (frame '4. ETC' — on-canvas heading 'Account Controller_ETC'; sections on card, Interested)"
  - "5910:12096 (frame '99. Account_assets' — the combo/popup/arrow asset sets)"
  - "240:6660 (COMPONENT_SET 'account_trading_withbtn' — 18 variants, the page's largest)"
status: "live — internal NDS component library page. Evidence: 15 local COMPONENT_SETs with published keys, plus late additions (58076:* Dropdown Status variants, 40239:* mydata 자주쓰는 type). NOTE: this page carries NO 'Last update' stamp and NO usage frame — see blanks."
---

# NDS Library — Account Contoller (계좌 컨트롤러)

> **The page name is misspelled at source: `    - Account Contoller  계좌 컨트롤러`** — "Contoller", missing the `r`. Quoted verbatim per the source. The on-canvas headings spell it correctly ("Account Controller_Trading"). **Resolve this page by node id `4357:9138`, not by name** — a search for "Account Controller" will not match the page name.

The account-selector foundation of `NDS_Library`. Four usage contexts (Trading / Lookup / Apply / ETC), each with its own component set. **This is the only one of my five pages with no usage frame and no Last update stamp** — a genuine documentation gap.

Components are LOCAL (`remote: false`) — expected; this file is the library. **Keys are `unverified`** (read-only session, no `importComponentSetByKeyAsync` round-trip).

## Name reliability: RELIABLE (page name aside)

Screenshotted the Trading frame and compared. Frame layer names (`1. Trading`, `2. Lookup`, `3. Apply`, `4. ETC`) map cleanly onto their on-canvas headings (`Account Controller_Trading`, `_Lookup`, `_Apply`, `_ETC`). Variant names match the on-canvas column labels (NORMAL / ACCOUNT SELECTED / DROPDOWN SELECTED / DISABLED / NULL) exactly.

- **The page name is misspelled** (`Contoller`) — the single naming defect.
- **All four subtitles read "QV-NM Accont Design Guide"** — **"Accont"**, misspelled consistently across all four frames. It's the file's own spelling, not copy-paste rot (contrast the Controls page, where subtitles are copy-pasted from the *wrong component*).
- **Rules are in TEXT nodes.** **No screenshot-embedded rules found on this page.** But see the blanks — there is barely any rule text *to* extract.
- **Demo copy is a MIX:**
  - **Placeholder filler (do NOT record)**: `123-45-678891`, `계좌이름`, `타이틀 영역`, `텍스트를 입력하세요`.
  - **⭐ A REAL product string**: **`선택할 수 있는 계좌가 없습니다.`** ("There are no selectable accounts.") — this is the **`null`-state copy**, and it appears consistently across every `null` variant in the screenshot. This is a genuine product string, not filler. It is the most valuable copy on the page.
  - **Plausibly real UI labels**: `예수금` (deposit), `전체잔고` / `국내잔고` / `해외잔고` (total/domestic/overseas balance), `거래비밀번호` (trading password), `저장` (save). These read as real, and their consistency across variants supports it.

## ⭐ The `null` state — a fifth status this library treats as first-class

Nearly every set on this page carries **`Status=null`** (or `Account Status=null`) alongside normal/selected/disabled. The screenshot confirms it renders as a greyed field reading **`선택할 수 있는 계좌가 없습니다.`**

**This is distinct from `disabled`.** Both sets exist side by side:
- `disabled` = an account exists but the control is inert (greyed, still shows `123-45-678891`).
- `null` = **there is no account to select** (shows the "no selectable accounts" message).

**Do not conflate them.** The account controller is the only component family in my batch with a `null` status — checkboxes, radios, toggles, search bars, selects and text fields all lack it. It's a domain-specific state (a brokerage user may genuinely have zero eligible accounts) and the library models it properly.

`account_card` is the odd one out — see conflicts.

## Component keys

All **KIND: COMPONENT_SET** — these are the keys `importComponentSetByKeyAsync` needs.

### Primary (the four usage contexts)

| Set | node | **SET** key (40-hex) | Axes (verbatim) | Variants |
|---|---|---|---|---|
| `account_trading_withbtn` | 240:6660 | `259adcc7ae32a34dcd130d01b5a3aacdf0ce77ba` | `Channel=[NM\|QV]` × `Type=[password\|btn]` × `Account Status=[normal\|selected\|disabled\|null]` × `Dropdown Status=[normal\|selected]` | 18 |
| `account_lookup` | 5961:10511 | `557d8e460dcc937a0cd6b3fec94495d181d2aceb` | `Type=[잔고표시\|기본정보]` × `Status=[normal\|disabled\|null\|selected]` | 8 |
| `account_apply` | 6002:10874 | `3f1d52aa040066b6ed58665c64c74fb86c21dec5` | `Type=[잔고표시\|\b레이블표시\|기본정보]` × `Status=[normal\|disabled\|null\|selected]` | 12 |
| `account_card` | 6007:11419 | `a5cd89675e29ae6469c21e4d8aa32a31052d23c7` | `type=[null\|계좌번호]` × `Status=[normal\|disabled\|null]` | 3 |
| `account_box` | 6007:11568 | `305eacaa569c029b74643197f38bdc9a2d0aa28e` | `type=[계좌\|계좌+계좌명\|계좌+계좌좌]` × `Status=[normal\|selected\|disabled\|null]` | 8 |

### Assets & popup parts

| Set | node | **SET** key (40-hex) | Axes | Variants |
|---|---|---|---|---|
| `account_combo_list_assets` | 393:8080 | `09b903ac0311e7a66f7da50b02b61629472d42a7` | `Channel=[NM\|QV]` × `Active=[off\|on]` | 4 |
| `account_combo_withbtn_assets` | 5936:10385 | `14a9d1a899086f282e582a9831fcde39d16e9d87` | `Type=[btn\|pw\|confirm]` × `Active=[on\|off]` × `Channel=[NM\|N2]` | 10 |
| `account_combo_assets` | 5936:11608 | `d521aaa526e0b7c9a7f0198a2f36b505ef080a1c` | `Status=[normal\|disabled\|null\|selected]` × `Channel=[QV\|NM]` | 8 |
| `account_popup_assets` | 6128:10365 | `02823c1bea2fb5f4f895389049a8acec7a04929e` | `Active=[on\|off]` | 2 |
| `account_mydata_assets` | 25836:3937 | `53f83ed7ea6372167f96fc1e7cdcedaff4f5874e` | `Active=[off\|on]` × `Type=[자주쓰는\|잔고표시\|일반]` | 6 |
| `popup_radio_account` | 6262:11306 | `bca81c36fdb886105179354ec7c1a6b150c0d0e8` | `Type=[계좌만\|통장이름\|잔액표시]` × `Status=[selected\|normal]` | 6 |
| `popup_item` | 393:8068 | `47ec5ff9437c4e1691514a0fe49e62e37a8b177b` | `Channel=[NM\|QV]` × `Status=[normal\|pressed]` | 4 |
| `ms_btn_downarrow` | 42664:1429 | `a720eeb2cf099f7a3ae4e5a712dd0a690ad19b44` | `Status=[sd\|sn\|nn\|nd]` × `Channel=[NM\|QV]` | 8 |
| `ms_btn_downarrow2` | 13479:14400 | `e44a2be172a905147fcc862abcbc56a471e24b19` | `Status=[nn\|sn\|sd\|nd]` × `Channel=[QV\|NM]` | 8 |
| `ms_btn_dropdown` | 42664:1439 | `6d7f33a0aff205ee1b1f9f2f06ab7c030b6fe71f` | `Status=[sd\|nd\|sn\|nn]` × `Channel=[QV\|NM]` | 8 |

The `nn/sn/nd/sd` suffix grammar matches the Controls page: **`<n|s>` normal/selected × `<n|d>` normal/disabled**.

Variant COMPONENT keys were not individually enumerated for this page (SET key + `setProperties` is the correct access path); they are recoverable by re-running the read-only script against the set node ids.

### 🔴 `account_apply` has an invisible control character

**`account_apply`'s Type axis value is `\b레이블표시` — with a leading U+0008 BACKSPACE**, not `레이블표시`. Invisible in the Figma UI and in screenshots. `setProperties({ Type: '레이블표시' })` will fail.

Same class of defect as the Controls page's `\bValue` / `\bStep` / `\bDropdown` and the Text Field page's `\bessential`. **Four pages, five instances — this is a systemic defect in this file, not a one-off.** Read axis values off the API and use them byte-for-byte.

### 🔴 `account_trading_withbtn` is an irregular 18-of-32 grid

`Channel[2] × Type[2] × Account Status[4] × Dropdown Status[2]` = 32 cells; **18 exist.**

From the node list, `Dropdown Status=selected` exists for only **two** combinations:
- `Channel=NM, Type=btn, Account Status=selected, Dropdown Status=selected` (58076:1516)
- `Channel=QV, Type=btn, Account Status=normal, Dropdown Status=selected` (58076:1673)

**Note these two disagree on `Account Status`** — NM pairs dropdown-selected with `selected`, QV pairs it with `normal`. There is no NM/`normal`/dropdown-selected and no QV/`selected`/dropdown-selected. The two channels were built inconsistently, almost certainly an oversight (both are `58076:*`, added in the same later pass).

Also: **`Type=password` has no `Dropdown Status=selected` at all**, and `Type=password` lacks an `Account Status=selected`+dropdown combination entirely. **Probe the grid before assuming a variant exists.**

## Rules transcribed verbatim from canvas

Section descriptions — **this is the entire rule corpus on the page**:

> **trading** — 주문, 잔고, 관심 등 트레이딩 관련된 화면에서 사용하며, dim 없는 combo로 작동합니다.

> **Lookup** — 조회성 업무에서 계좌가 화면 전체를 컨트롤 할때 사용해요. 최상단에 위치해요.

> **Apply** — 신청성 업무에서 계좌선택이 필요할 때 사용해요. 화면 중간에 위치해요.

> **on card** — 카드 위에 쓰이는 텍스트형 계좌 컨트롤러에요.

> **Interested** — 관심그룹에서 사용되는 계좌컨트롤러에요.

> **with btn** — 버튼과 함께 사용

> **select popup** — bottom sheet에 사용

Plus two bare labels on the assets frame: **`당행`** (own bank, `6262:11318`) and **`타행`** (other bank, `6264:11319`), and **`오픈뱅킹/마이데이터`** (`25836:3946`).

### The four-way selection rule, pulled out

This is the page's real value — **which account controller for which screen**:

| Context | Set | Rule (verbatim) | Position |
|---|---|---|---|
| **Trading** (주문/잔고/관심) | `account_trading_withbtn` | `dim 없는 combo로 작동합니다` — **operates as a combo with NO dim** | (unstated) |
| **Lookup** (조회성 업무) | `account_lookup` | account controls the whole screen | **`최상단에 위치해요`** — topmost |
| **Apply** (신청성 업무) | `account_apply` | account selection needed mid-flow | **`화면 중간에 위치해요`** — middle of screen |
| **On card** | `account_card` | text-style, used on top of a card | (unstated) |
| **Interested** (관심그룹) | `account_box` | used in watchlist groups | (unstated) |

**The 조회성 (lookup/inquiry) vs 신청성 (application/request) distinction is the primary axis**, and it carries a concrete layout consequence: **Lookup goes topmost, Apply goes mid-screen.** That's the most actionable rule on the page.

**`dim 없는 combo`** — the Trading controller's dropdown must open **without a dim/scrim overlay**, unlike the sliding popups the Pulldown page describes. A real behavioural rule.

**`당행` / `타행`** — the bottom-sheet account picker splits by own-bank vs other-bank. `account_popup_assets` is 당행; `popup_radio_account` is 타행.

## 🔴 Blanks at source — report, don't infer

This page is **the most under-documented of my five**:

- **NO `Control_usage` / `*_usage` frame at all.** Every sibling page in my batch has one (Controls, Search Bar, Text Field, Pulldown). This page has none. **There is no "사용방법 / 사용 시 유의사항" text anywhere on it.**
- **NO `Last update` stamp anywhere on the page.** I searched every text node in the full metadata dump — absent. **The page's currency is unknown.** The only dating evidence is node-id ranges (`58076:*`, `40239:*` indicate later passes). **Do not guess a date.**
- **NO time/interaction rules.** No combo expand duration, no bottom-sheet animation, no timing for the null-state message. `dim 없는 combo` is the *only* interaction rule on the page and it says nothing about timing. **Systematically blank.**
- **Position is stated for only 2 of 5 contexts** (Lookup=최상단, Apply=화면중간). Trading, on-card and Interested have no position rule.
- **No rule for when `null` vs `disabled` applies** — both states exist and are visually distinct, but nothing says which condition triggers which. Inferred from the copy (`선택할 수 있는 계좌가 없습니다.`), not stated.
- **`account_card` has no `selected` status** (only normal/disabled/null) while every sibling has one. Unexplained — it's a text-style display control, so possibly intentional, but **the page doesn't say.**

## Conflicts / hazards for the LEDGER

1. **⭐ The page name is misspelled at source: `Account Contoller`** (missing `r`). On-canvas headings spell it correctly. **Resolve by node id `4357:9138`.**
2. **All four subtitles read "QV-NM Accont Design Guide"** — "Accont" misspelled, consistently.
3. **`account_apply.Type` contains `\b레이블표시`** — leading U+0008 backspace, invisible. **Fifth instance of this defect across four pages in this file — treat it as systemic.**
4. **`account_box.type` has the typo `계좌+계좌좌`** (`6007:11568`) — should be `계좌+계좌명` (the other two variants use `계좌+계좌명`). The `disabled` variant is `type=계좌+계좌좌` while `normal`/`selected`/`null` are `type=계좌+계좌명`. **This splits what should be one type into two**, so `Type=계좌+계좌명` has **no disabled variant** and `Type=계좌+계좌좌` has *only* disabled. A real, functional bug — not cosmetic.
5. **`account_trading_withbtn` is an irregular 18-of-32 grid**, and its two `Dropdown Status=selected` variants **disagree across channels** (NM pairs with `Account Status=selected`, QV with `normal`).
6. **`account_card` uses `Status=null` AND `type=null`** — `null` appears as a value on *both* axes (`type=[null|계좌번호]`, `Status=[normal|disabled|null]`), and only 3 of 6 cells exist. Confusing modelling.
7. **Axis-name case is inconsistent**: `account_card` and `account_box` use lowercase `type`; `account_lookup`, `account_apply`, `account_trading_withbtn` use uppercase `Type`.
8. **`account_trading_withbtn` uses `Account Status` / `Dropdown Status`** (with a space) rather than `Status` — the only set in my batch with multi-word axis names.
9. **Channel vocabulary is inconsistent across this page**: most sets use `Channel=[NM|QV]`, but **`account_combo_withbtn_assets` uses `Channel=[NM|N2]`**. `N2` also appears on the Controls page's switcher sets. **`N2` vs `QV` is unresolved** — they may be the same channel under two names, or a third channel. **Do not assume.**
10. **NO usage frame and NO Last update stamp** — unique among my five pages. Currency unknown.
11. **Loose reference mockups clutter the page**: `이체내역_입출금` (`42571:1796`, `42571:2203` — two near-duplicates), `IMG_5322`/`IMG_5336` rounded-rectangles (`48861:*`), a `Resized_...` image (`42776:1311`), and stray `ms_btn_dropdown_*_black` rectangles at negative coordinates. These are pasted screenshots / scratch, **not components**. The `나무 블랙` / `큐브 블랙` labels near them (`48857:736`–`740`) suggest a black-variant exploration that never became a component set. Ignore for BUILD.

## How this feeds BUILD mode

- **Pick the controller by business context first — this is the page's core rule:**
  - 주문/잔고/관심 (trading) → `account_trading_withbtn` (`259adcc7…`), operates as a **combo with no dim**.
  - 조회성 업무 (lookup) → `account_lookup` (`557d8e46…`), place it **topmost**.
  - 신청성 업무 (apply) → `account_apply` (`3f1d52aa…`), place it **mid-screen**.
  - On a card → `account_card` (`a5cd8967…`).
  - 관심그룹 (watchlist) → `account_box` (`305eacaa…`).
- **Handle the `null` state explicitly.** It is NOT `disabled`. Copy is **`선택할 수 있는 계좌가 없습니다.`** Every primary set has it (except `account_card`'s partial grid).
- **`account_trading_withbtn`**: `setProperties({ Channel, Type: 'btn'|'password', 'Account Status': ..., 'Dropdown Status': ... })` — **note the spaces in the axis names**. Only 18 of 32 combinations exist; probe before setting.
- **`account_apply`'s label type is `\b레이블표시`** — read it off the API, don't retype it.
- **`account_box` disabled requires `type=계좌+계좌좌`** (the typo), not `계좌+계좌명`.
- **Bottom-sheet pickers**: 당행 → `account_popup_assets` (`02823c1b…`); 타행 → `popup_radio_account` (`bca81c36…`); 오픈뱅킹/마이데이터 → `account_mydata_assets` (`53f83ed7…`).
- **Channel discipline** (`nds-mweb-colors`): `NM` = green `#84C13D`, `QV` = orange `#FFAA1A`. **But `account_combo_withbtn_assets` offers `N2`, not `QV` — unresolved.**
- **This page has no usage guidance and no date.** Treat its rules as thinner than the sibling pages' and escalate anything not covered rather than inferring.
- Keys are **unverified** (read-only session). Confirm with `importComponentSetByKeyAsync` before relying on them.
