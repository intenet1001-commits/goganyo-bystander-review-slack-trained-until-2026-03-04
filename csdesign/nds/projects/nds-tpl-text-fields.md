---
name: nds-tpl-text-fields
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=3760-32774"
learned_date: 2026-07-15
sections_studied:
  - "3760:32774 (page canvas '- Text Fields (Input) 텍스트필드, 인풋' — on-canvas title 'Text Fields' / 'QV-NM Template Guide', 4 grouped usage-example rows: Basic 기본, Stock 주문/관심, Certify 인증, Product 금액 입력)"
  - "4585:37111 / 4585:37213 / 4585:37274 / 4585:37339 (Basic 기본 — 4 input_line/pulldown variants: plain line, line+disabled button, dual split-field, dropdown+line+disabled button)"
  - "4585:37415 / 4585:37652 (Stock 주문/관심 — 2 input_box variants: plain box, box+disabled button)"
  - "4585:37829 / 4585:37834 (Certify 인증 — 2 input line_certify variants: line+edit-pencil icon, line+chevron icon)"
  - "27395:30375 / 27609:53864 / 27395:30451 / 27609:53950 / 27395:30580 / 27395:30693 (Product 금액 입력 — 6 amount-input card states: empty/placeholder, sell-with-toggle+tooltip, focus+keyboard, sell+focus+keyboard, error-over-limit, error-under-minimum)"
status: internal NDS component-library guide (Templates file — usage-example gallery, not an asset-swatch sheet); this page FILLS a gap Core previously had NO entry for
---

# NDS Templates — Text Fields (Input) 텍스트필드, 인풋

Usage-example gallery (title on-canvas: **"Text Fields" / "QV-NM Template Guide"**) for four input-field families composed into example screens: 기본(Basic) line inputs, 주식 주문/관심(Stock order/watch) box inputs, 인증(Certify) line inputs, and 상품 금액 입력(Product amount input) cards. Like other NDS_Templates pages, this is a composition gallery, not an isolated component-swatch sheet — but unlike most, it also carries genuine prose usage rules (2 short annotations) placed directly on canvas.

## Component keys — all genuine COMPONENT_SETs, `remote: true`

Sampled via explicit node IDs (6/6 succeeded this pass, no read-only throw):

| Instance | variant | main COMPONENT key | remote | parent SET name | parent SET key | remote |
|---|---|---|---|---|---|---|
| `6966:17879` input_line | `Type=basic, Status=normal` | `21f296d273a769595a18f3f75ccaee60895dff28` | true | `input_line` | `54946e9fc819093272e3ca0abdd7b8b49e763cd3` | true |
| `4585:37948` input_box | `Type=basic, Status=normal` | `7c70293709633a28be4a20cfafa03e07fff2986b` | true | `input_box` | `123c8f22410029b388d6117a398dae443e1892bb` | true |
| `4585:37833` input line_certify | `Type=txt field, Status=normal` | `1fa804c1340889250271b1603e8884f851ff63a7` | true | `input line_certify` | `16b2d52478c0640dfa3ee4fed824f6f1f6234e4d` | true |
| `27566:53846` btn_container_regular | `Strength=4(line), Height=h46, Status=normal` | `9727232cc58b1e4de962fd6618c896cdb4c3f989` | true | `btn_container_regular` | `fd0a4e2fd7b3c49612b27963bd8bf41f1580910b` | true |
| `27609:53937` toggle_txt | `choose=left` | `c84936707be05f871440adf6c2d16387839977c0` | true | `toggle_txt` | `b24f3ce689ce24cdccae8d20ddd0f72f75944f8a` | true |
| `27609:53938` nds_icon_tooltip | `Type=01` | `2f406dde16651eb4a4bed0d2a8d628d48542fa6c` | true | `nds_icon_tooltip` | `7e414339b7619b81d964facd6b7faf2a3f814135` | true |

Three distinct, genuinely different text-field families exist: `input_line` (underline style), `input_box` (bordered box style), `input line_certify` (underline style, narrower label-input gap — see below). None share a key with each other or with `Table_cell`/`Table_header`. The "Product 금액 입력" amount-entry cards (`투자금액입력` frame) are **not** a componentized text field at all — they're a hand-composed frame (rounded rect + text + quick-amount `btn_container_regular` row), no dedicated input componentKey found for the amount display itself.

## Layer-name convention — reliable

Instance layer names (`input_line`, `input_box`, `input line_certify`, `btn_container_regular`, `toggle_txt`, `nds_icon_tooltip`) read directly as their component name, confirmed via `getMainComponentAsync()`. Group labels (`Basic 기본`, `Stock 주문/관심`, `Certify 인증`, `Product 금액 입력`) match their on-canvas section headers exactly (screenshot-confirmed).

## ANSWERS

**Input types/states present:**
- **input_line** (Basic group, 4 examples): plain label+underline (placeholder "힌트 텍스트 입력"), line+disabled trailing button ("버튼명", gray/disabled), dual split field with a "–" separator (each side capped, placeholder "최대6글자까지"), and a compound row: dropdown ("SKT알뜰폰") + line input ("-없이 입력") + disabled trailing button ("인증요청"). These four cover the **normal/placeholder** and **disabled-action** states, not focus/error/filled directly.
- **input_box** (Stock group, 2 examples): bordered box, same placeholder pattern, one with a disabled trailing button. Carries an explicit rule (see below): "박스형 Pulldown, 계좌컨트롤러와 함께 사용합니다. 최대한 사용을 지양합니다." — box-type is meant for pulldown/account-controller pairing and should be **minimized/avoided** as a general choice.
- **input line_certify** (Certify group, 2 examples): underline style, one with a trailing edit-pencil icon, one with a trailing chevron (dropdown) icon — both for certification/verification-screen fields. Explicit rule (see below): used specifically on 인증(certification) screens, tighter label-input gap than default, **requires design-team consultation before use**.
- **Product 금액 입력 (amount-input card)** (6 examples): a genuine state progression — **empty/placeholder** ("투자금액 입력" grayed), **focus with numeric keyboard** (value "123,456,789원" / "1억 2천만원" formatted-in-words helper), **error: over limit** (red inline text "투자 가능 금액 1,000,000원을 초과했습니다."), **error: under minimum** (red inline text "최소 1만원 이상 입력해주세요."), plus a **sell-amount variant** ("매도금액을 입력해주세요" placeholder, with a 금액/좌수(amount/shares) toggle_txt switch and a `nds_icon_tooltip` help icon) shown both static and in focus+keyboard state. No standalone "disabled" state observed for this card.

**Validation / error-message copy (verbatim, quoted from screenshots):**
- Over-limit: `투자 가능 금액 1,000,000원을 초과했습니다.` (red)
- Under-minimum: `최소 1만원 이상 입력해주세요.` (red)
- Persistent helper (all Product states): `로보 한도금액 1,800만원까지 투자할 수 있어요.` (gray, not an error)
- Sell-flow helper: `최소투자금액 1만원`

**Font/width rule stated?** No explicit font-family or pixel-width rule text found on this page (contrast `nds-tpl-layout`'s 40px input-field gap and 492px content width — this page doesn't restate those). Quick-amount buttons rule is explicit though: `퀵버튼은 btn_container_regular 4(line)을 사용합니다.` — "quick buttons use `btn_container_regular` 4(line) [strength variant]," confirmed structurally: sampled instance `27566:53846` is exactly `Strength=4(line), Height=h46, Status=normal`.

**Does this fill Core's empty input area?** Yes — Core previously had **no text-field/input entry at all**. This page adds three real, `remote: true` COMPONENT_SETs (`input_line`, `input_box`, `input line_certify`) plus usage guidance (box-type discouraged; certify-type needs design-team sign-off) that should be promoted into the Core reference.

## Rule copy — verbatim, quoted from canvas text nodes

- `박스형 Pulldown, 계좌컨트롤러와 함께 사용합니다. 최대한 사용을 지양합니다.` (node `4585:37467`, next to the Stock/input_box row)
- `인증 화면에서 사용합니다. 기본보다 레이블과 인풋이 간격이 좁습니다. 사용 시 디자인팀과 상의가 필요합니다.` (node `4585:37839`, next to the Certify/input line_certify row)
- `퀵버튼은 btn_container_regular 4(line)을 사용합니다.` (node `27569:53863`, next to the Product row)

## Blanks / gaps

- No dedicated "focus" or "error" state instance found for `input_line`/`input_box`/`input line_certify` themselves (Type/Status axes weren't sampled beyond `basic, normal` / `txt field, normal`) — only the Product amount-card demonstrates focus/error visually. A page-wide variant sweep of these three SETs (e.g. via `importComponentSetByKeyAsync`) would resolve their full Status axis; not attempted this pass (out of scope, budget).
- No disabled-state example for the Product amount card.
- `투자금액입력`/`Group 481818`/`Group 481819` frames (the amount-input cards) have no resolvable componentKey — confirmed hand-composed, not instances.

## CORE

Core reference (`../CORE.md` → "Verified component keys") has **no text-field/input row at all**. Recommend adding: `input_line` `21f296d2…`/SET `54946e9f…`, `input_box` `7c70293709…`/SET `123c8f22…`, `input line_certify` `1fa804c1…`/SET `16b2d524…` — all `remote: true`, all directly corroborated on this consumer file per Q4.
