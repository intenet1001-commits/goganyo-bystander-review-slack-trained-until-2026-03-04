---
name: nds-lib-text-field
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=2283-9979"
learned_date: 2026-07-16
sections_studied:
  - "2283:9979 (page '    - Text Field (Input)  텍스트필드, 인풋' — 5 numbered guide frames + assets + usage + a 9-patch guide + a form-design section)"
  - "4483:9017 (frame '1. Line Text Fields' — on-canvas heading 'Line Text Fields'; the default form control)"
  - "2298:14776 (frame '2. Box Text Fields' — on-canvas heading 'Box Text Fields')"
  - "8364:13061 (frame '3. Large Text Fields' — on-canvas heading 'Large Text Fields - 금액/주 단독')"
  - "11096:14694 (frame '4. Certify Text Fields' — on-canvas heading 'Certify Text Fields')"
  - "16755:16591 (frame '5. Amount Controller' — on-canvas heading 'Amount controller')"
  - "4488:10064 (frame '99. Text Fields_assets' — input_label / input_select sets + 9-patch Android assets)"
  - "4692:9518 (frame 'Text Fields_Usage' — on-canvas heading 'Text Fields Usage'; carries the Last update stamp)"
  - "45112:2321 (section '라인인풋_폼디가이드' — a page-local doc re-creation containing a BROKEN duplicate input_line set)"
status: "live — internal NDS component library page. Evidence: 8 healthy local COMPONENT_SETs with published keys plus a 'Last update 2022.11.18 구자영' stamp; later additions (Amount Controller 16755:*, 9-patch guide 45112:*) postdate the stamp."
---

# NDS Library — Text Field (Input)

The input/text-field foundation of `NDS_Library`. Notable for being the page that **explains the Search Bar states contradiction** (text fields have 4 states, search bars have 3), and for containing a **structurally broken component set** that throws on API access.

Components are LOCAL (`remote: false`) — expected; this file is the library. **Keys are `unverified`** (read-only session, no `importComponentSetByKeyAsync` round-trip).

## ⭐ The 4-state finding (context for the Search Bar ledger entry)

**Every live text-field set on this page defines FOUR states:**

> **`normal`** · **`pressed`** · **`filled`** · **`disabled`**

Confirmed on `input_line`, `input_box`, `input_large`, `input line_certify`, and `txt` (Amount Controller) — all five, identically. The screenshot of `4483:9017` shows exactly four columns: NORMAL / PRESSED / FILLED / DISABLED.

**This is very likely the source of the Search Bar "4 states" claim.** Text fields and search bars are visually near-identical (rounded field, placeholder, clear button) and sit adjacent in the library. The search bar genuinely has only 3 (`normal`, `pressed`, `filled` — **no `disabled`**); the text field has 4. See `nds-lib-search-bar.md` for that verdict. **These are two different components with two different state counts — both correct.**

## Name reliability: RELIABLE (one broken set aside)

Screenshotted and compared against on-canvas headings. Frame layer names match their headings (`1. Line Text Fields` → "Line Text Fields", etc.). Variant/axis names match the on-canvas column labels exactly.

**No copy-paste subtitle rot in the numbered frames** — all five correctly read "QV-NM Text Fieds Design Guide". (Note **"Fieds"** — the subtitle is misspelled identically on all five. It's consistent, so it's the file's own spelling, not rot.) The Usage frame's subtitle, however, **wrongly reads "QV-NM Select box & Combo Usage"** — copy-pasted from the Pulldown page.

**Rules are in TEXT nodes and extracted cleanly — with one exception.** The `나인패치 제작가이드` frame (`44985:858`) contains a **pasted screenshot** (`44985:863`, "스크린샷 2018-05-08 오후 5.08.56", 1219×1197) whose contents are **not text-extractable**. Its two surrounding text nodes are truncated at source in the metadata dump (`*기존 이미지의 3배 사이즈로 컷팅`, `4. 나인패치 (이미지명 끝에 .9표`). **The 9-patch production rules are partly locked inside a 2018 screenshot** — transcribe visually if ever needed.

**Demo copy is a MIX — flag carefully:**
- **Placeholder filler / designer notes-as-copy (do NOT record as product strings)**: `텍스트 입력`, `힌트 텍스트 입력`, `버튼명`, `최대6글자까지`, `Pressed는 004`, `폰트 컬러 입력 중 1.004`. The last two are literally *annotations about the design* rendered inside the field — `Pressed는 004` means "pressed uses [color] 004", not product copy.
- **Plausibly real**: `SKT알뜰폰` (carrier select), `인증요청` (request verification), `-없이 입력` ("enter without hyphens"), `01012345678`. These read as genuine certify-flow copy but appear as demo content inside variant previews — treat as pattern examples, not a copy spec.

## Last update (verbatim)

`Text Fields_Usage` (`4692:9518`) → **`Last update 2022.11.18 구자영`**

**The stamp is stale relative to the page.** The Amount Controller frame (`16755:*`, `18047:*`), the 9-patch assets (`44985:*`, `45089:*`) and the 폼디 guide section (`45112:*`) are all substantially later additions the 2022 usage text never mentions.

## Component keys

All **KIND: COMPONENT_SET** — these are the keys `importComponentSetByKeyAsync` needs.

| Set | node | **SET** key (40-hex) | Axes (verbatim) | Variants | Tier |
|---|---|---|---|---|---|
| `input_line` | 4483:9186 | `54946e9fc819093272e3ca0abdd7b8b49e763cd3` | `Type=[basic\|with btn\|2-col\|complex]` × `Status=[normal\|pressed\|filled\|disabled]` | 16 | (a) published — **the default** |
| `input_box` | 2298:14787 | `123c8f22410029b388d6117a398dae443e1892bb` | `Type=[basic\|with btn]` × `Status=[normal\|pressed\|filled\|disabled]` | 8 | (a) published |
| `input_large` | 8364:13062 | `d62586ff8681058eefbbe0cb25ecc237c4a4e8d8` | `Type=[basic\|with calculator]` × `Status=[normal\|pressed\|filled\|disabled]` | 8 | (a) published |
| `input line_certify` | 4813:8928 | `16b2d52478c0640dfa3ee4fed824f6f1f6234e4d` | `Type=[txt field\|pulldown]` × `Status=[disabled\|normal\|filled\|pressed]` | 8 | (a) published — **note the space in the name** |
| `txt` (Amount Controller) | 16755:16692 | `7c6ba39e006d8f7475c07cd6b9a79e2f190407e2` | `Type=[기본\|주문\|차트주문]` × `Status=[normal\|pressed\|filled\|disabled]` | 12 | (a) published — **name is just `txt`** |
| `input_label` | 4488:10209 | `c48f6f72d013fe9525f8d35beb4b5ea34c5e79b3` | `Type=[\bessential\|default\|tooltip\|with btn\|error]` | 5 | (a) published — shared with Select |
| `input_select` | 4699:9120 | `214b1976ca29efcd5bade5873f096e85d8d9e98f` | `Status=[normal\|disabled]` | 2 | (a) published — sub-part of `complex` |
| `input_line` (폼디 dup) | 45112:2329 | `3390b1b96bde08ef34bb2c3a657bfc78b437f3e1` | **THROWS** | 4 | **(b) page-local doc re-creation — BROKEN, do not use** |

### 🔴 `input_line` exists TWICE with different keys — one is broken

- **`4483:9186`** — key `54946e9f…`, 16 variants, healthy. **This is the real one.**
- **`45112:2329`** — key `3390b1b9…`, 4 variants, lives inside section `라인인풋_폼디가이드` (`45112:2321`). **This set is structurally broken.**

Reading `variantGroupProperties` on it throws:

```
Error: in get_variantGroupProperties: Component set has existing errors
```

Cause, confirmed by listing its children: it has **two variants both named `Type=basic, Status=pressed`** (nodes `45112:2402` and `45112:2513`). Duplicate variant names make a set invalid in Figma.

**Consequences:**
1. **Never resolve `input_line` by name** — you have a 50/50 chance of the broken one. Match by node id or key.
2. A naive script that maps `variantGroupProperties` over all sets on this page **will crash** on this node. Guard with try/catch (that's how it was isolated here).
3. It's a **doc re-creation** — a form-design (폼디) annotation guide showing input specs with call-out rectangles over it. It was never meant to be imported. Classified **tier (b)**, not a published component despite carrying a key.

### 🔴 Invisible control character in `input_label`

**`input_label`'s first Type value is `\bessential` — with a leading U+0008 BACKSPACE**, not `essential`. Invisible in the Figma UI and in screenshots. `setProperties({ Type: 'essential' })` will fail with a confusing error.

Same class of defect as the Controls page's `\bValue` / `\bStep` / `\bDropdown` and the Account page's `\b레이블표시`. **Read axis values off the API and use them byte-for-byte.**

## Rules transcribed verbatim from canvas

Section descriptions / headings:

> **Large Text Fields - 금액/주 단독** — (heading; the frame also carries a loose `이체` label at `11096:14693`)

> **label** — text Field와 select 공통 레이블

> **select** — line-complex 에 쓰이는 셀렉트 박스

> **9-patch** — 인풋박스 나인패치 이미지

From `Text Fields_Usage` (`4692:9518`):

> 사용방법
> 1. 기본적으로 라인 텍스트 필드를 사용합니다.
> 2. 주문, 현재가와 같은 화면에서는 예외적으로 박스 텍스트 필드를 사용합니다.
> 3. 모든 status를 고려하고, 그에 따른 properties를 확인합니다.
>
> 사용 시 유의사항
> 제공된 라이브러리 이외의 UI는 사용을 지양합니다. Assets 수정은 디자이너와 협의가 필요합니다. (for designer) 예외케이스는 해당하는 templates에 추가하도록 합시다.

**The line/box decision rule, stated plainly: line is the default; box is the exception, only for 주문 (order) and 현재가 (current price) screens.** This mirrors the Pulldown page's identical line-vs-box rule — the two pages agree.

### ⭐ Resizing rule (unusually concrete — rare in this design system)

From `3699:10341` and its three sub-frames — the page tells you **exactly** how to resize an input, which most NDS pages don't:

> 인풋 사이즈 조절 방법
> 1. `Form_label : Fill Contatiner로 변경하기`
> 2. `input/default : Fill Container 로 변경하기`
> 3. `txtfieds_line : Hug Contents -> Fixed Width 로 변경하여 사이즈 조절하기`

I.e. **set `Form_label` and `input/default` to Fill Container, then change `txtfieds_line` from Hug Contents to Fixed Width and size it there.** Note `Contatiner` (step 1) and `txtfieds` are both typos at source — the layer is `txtfields_line` conceptually but the guide types `txtfieds`, matching the misspelled "Text Fieds" subtitle. The intent is unambiguous.

This is the **actionable resizing recipe** and it directly matches the `figma-use` rule that `layoutSizing*` must be set after the node is in an auto-layout parent.

### 9-patch asset names (verbatim)

Two families, and the guide flags one as **untested**:

> 기존이미지 업데이트 — `bs_underline_editbox_n.9`, `bs_underline_editbox_d.9`, `bs_underline_editbox_o.9`

> 신규이미지 테스트필요 — `bs_nds_lineinput_n.9`, `bs_nds_lineinput_d.9`, `bs_nds_lineinput_o.9`

**`bs_nds_lineinput_*.9` is labelled `신규이미지 테스트필요` ("new image, needs testing") — it is NOT signed off.** The `_n`/`_d`/`_o` suffixes are normal/disabled/(o = focused/on?) — **the guide never defines `_o`. Blank at source; don't guess.**

## Blanks at source — report, don't infer

- **NO time/interaction rules.** No focus-transition duration, no cursor-blink rate, no debounce, no keyboard-appearance timing, no error-message reveal timing. The states are four static frames. **Systematically blank — do not infer from the mockup.**
- **NO `Channel` (NM/QV) axis on any set on this page** — despite every subtitle saying "QV-NM". Text fields are channel-neutral here. (The `Pressed는 004` annotation hints the pressed underline uses a colour number, but no channel is given.)
- **NO error/validation state in the `Status` axis.** `input_label` has a `Type=error` variant (the *label* can show an error), but the **field itself has no error status** — `Status` is only normal/pressed/filled/disabled. How an errored field renders is undefined here.
- **`_o` suffix in the 9-patch names is never defined.**
- **The 9-patch production rules are inside a 2018 pasted screenshot** and are not text-extractable.
- **No max-length / character-limit rules** beyond the `최대6글자까지` demo string (which is filler, not a spec).

## Conflicts / hazards for the LEDGER

1. **Two `input_line` sets, different keys; one is BROKEN** (`45112:2329`, duplicate `Type=basic, Status=pressed` variants). Throws on `variantGroupProperties`. **Resolve by node id/key, never by name. Guard bulk scripts with try/catch.**
2. **`input_label.Type` contains `\bessential`** — leading U+0008 backspace, invisible.
3. **Text Field has 4 states; Search Bar has 3.** Both correct. This page is the likely origin of the Search Bar "4 states" misreading. Cross-ref `nds-lib-search-bar.md`.
4. **`Text Fields_Usage` subtitle is wrong** — reads "QV-NM Select box & Combo Usage", copy-pasted from the Pulldown page.
5. **"Text Fieds" is misspelled in all five frame subtitles** (consistently — it's the file's spelling, not rot).
6. **A published set is named just `txt`** (`16755:16692`) — the Amount Controller. Uselessly generic; there are `txt` frames elsewhere in the file.
7. **`input line_certify` has a space, not an underscore** (`input line_certify`), breaking the `input_*` convention used by every sibling.
8. **`Contatiner` and `txtfieds` typos** in the resizing rule.
9. **`bs_nds_lineinput_*.9` is unsigned-off** (`신규이미지 테스트필요`).
10. **Status value ORDER differs between sets** — `input line_certify` lists `[disabled|normal|filled|pressed]`, others list `[normal|pressed|filled|disabled]`. Same four values; only the declaration order differs. Harmless for `setProperties`, but don't rely on index-based access.
11. **Last update (2022.11.18) predates** the Amount Controller, the 9-patch assets, and the 폼디 section.
12. Loose `Group 9454` (`4744:8913`) and `Frame 9001`-style empty frames appear as leftovers.

## How this feeds BUILD mode

- **Default to `input_line`** — SET `54946e9fc819093272e3ca0abdd7b8b49e763cd3`, `setProperties({ Type: 'basic'|'with btn'|'2-col'|'complex', Status: 'normal'|'pressed'|'filled'|'disabled' })`. **Use the node-`4483:9186` key, not the broken `3390b1b9…`.**
- **Use `input_box` (`123c8f22…`) ONLY on 주문 / 현재가 screens** — the guide states this as an explicit exception.
- **`input_large` (`d62586ff…`)** for standalone 금액/주 amount entry; `Type=with calculator` when a numeric keypad is attached.
- **`input line_certify` (`16b2d524…`)** for the phone-verification flow (carrier pulldown + number field + 인증요청 button).
- **`txt` (`7c6ba39e…`)** for the Amount Controller / stepper — `Type=기본|주문|차트주문`.
- **Pair fields with `input_label` (`c48f6f72…`)** — shared with Select. **Its `essential` value carries an invisible backspace; read it off the API.**
- **To resize**: `Form_label` → Fill Container; `input/default` → Fill Container; `txtfieds_line` → Hug Contents → Fixed Width. Per `figma-use` Rule 12, append to the auto-layout parent *before* setting `FILL`.
- **There is no error state on the field itself** — only on the label (`input_label.Type=error`). If a design needs an errored field, that's a gap; escalate.
- Keys are **unverified** (read-only session). Confirm with `importComponentSetByKeyAsync` before relying on them.
