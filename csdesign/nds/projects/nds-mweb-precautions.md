---
name: nds-mweb-precautions
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=645-4572"
learned_date: 2026-07-15
sections_studied:
  - "645:4572 (page '    - 유의사항  (진행중)' — canvas root, no frame/section wrapper; loose frames + stray annotation text nodes)"
  - "645:5999 (frame '유의사항_플로팅고정형' — Case 02 floating bar over btn_bottom_page)"
  - "645:6011 (frame '유의사항_일반' — Case 01 기본, title + 2 bullets, no arrow)"
  - "645:6020 (frame '유의사항_일반_심사필' — Case 01 + 심사필 first bullet + arrow on title)"
  - "645:6030 (frame '유의사항_일반_버튼추가' — Case 01 심사필 + Basic_btn '해지하기')"
  - "645:6041 (frame '유의사항_더보기_슬라이딩팝업' — Case 03 sliding popup, dim + Popup_Sliding_basic_guide, 3 content_popup instances)"
  - "645:6053 (frame '유의사항_더보기_풀팝업' — Case 03 full popup, 2 con groups (5+2 items) + 소제목 subheading)"
  - "645:6229 (frame 'title' — page cover: '유의사항' / 'QV-NM Template Guide')"
  - "645:7178 (frame '유의사항_asset' — 유의사항_하단노출 component-set showcase, Type=1줄/2줄 × 더보기=on/off, 4 symbols)"
  - "645:7218 (frame '유의사항_assetge' — 유의사항_Content_popup component-set showcase, Type=기본/심사필)"
  - "648:7391 (frame '유의사항_asset' — 유의사항_Content component-set showcase, Type=기본/심사필/기본(강조포함)/당구장 × 줄개수=1줄/2줄, 7 symbols)"
  - "645:6232, 645:6234, 645:6235, 645:6236, 645:6240, 645:6241 (annotation text nodes, all named '토스트/체결알림 정의' — layer-name-lies confirmed via use_figma read)"
  - "645:6242, 645:6243, 645:6244 (section headers: '페이지 하단 유의사항' / '플로팅 고정 유의사항' / '호출 팝업')"
  - "645:6245 (annotation: '기본문구 : 유의사항')"
status: "internal NDS_M.web component-library page — marked '(진행중)' IN PAGE NAME on canvas. Treat as work-in-progress, not a finished spec. See WIP evidence below."
---

# NDS M.web — 유의사항 (Precautions / Disclaimers)

Page `645:4572` in **NDS_M.web** (`uVcmG6GgOl2J8EOlc22wob`), page name literally **`    - 유의사항  (진행중)`** — the `(진행중)` ("in progress") is part of the page's own name on canvas, not an inference. This is reported as a finding per instructions, not filled in.

**No page-level frame/section wrapper** — the canvas root (`645:4572`) directly contains 6 loose demo frames, a title frame, 3 component-set showcase frames, and several stray page-level text annotations. This is looser than the tightly-sectioned NM_color/QV_color structure seen on the Colors page.

## The three groups (mirrors the NDS_UX Guide's Case 01/02/03 split)

Confirmed via three on-canvas section-header text nodes (verbatim, not paraphrased):

| Header (verbatim) | On-canvas group | Demo frames |
|---|---|---|
| **`페이지 하단 유의사항`** | Case 01 equivalent — bottom-of-scroll block | `유의사항_일반`, `유의사항_일반_심사필`, `유의사항_일반_버튼추가` |
| **`플로팅 고정 유의사항`** | Case 02 equivalent — floating bar | `유의사항_플로팅고정형` |
| **`호출 팝업`** | Case 03 equivalent — popup | `유의사항_더보기_슬라이딩팝업`, `유의사항_더보기_풀팝업` |

## Demo frame 1 — `유의사항_일반` (기본, `645:6011`)

Screenshot transcribed. Title row: plain "유의사항" text, **no arrow**. Bullets below (placeholder copy, verbatim): "해당 유의사항은 스크롤 화면에서 쓰입니다." / "해당 줄은 중요한 텍스트가 있는 경우 사용합니다." Background is the plain screen background (pink placeholder in the mock, not a distinct disclaimer-card color) — consistent with the UX guide's "no separate background color" rule.

## Demo frame 2 — `유의사항_일반_심사필` (`645:6020`)

Title row now carries a **`>` arrow** (popup entry affordance), matching the UX guide's "심사필 adds a `>` on the title row" claim. First bullet is **bold** and duplicated verbatim placeholder text: "심사필에 사용하는 줄입니다.심사필에 사용하는 줄입니다." — the bold-first-line pattern for 심사필 content is confirmed structurally (component `유의사항_Content` variant `Type=심사필`, see below), though the actual real 심사필 legal text isn't shown in this demo frame (it does appear, verbatim, in the full-popup demo — see below).

## Demo frame 3 — `유의사항_일반_버튼추가` (`645:6030`)

Same as 심사필 demo, plus a small secondary button labeled **"해지하기"** (component `Basic_btn`) placed beneath the bullets — confirms the UX guide's "버튼 추가" variant exists as a real demo, not just a guide claim.

## Demo frame 4 — `유의사항_플로팅고정형` (Case 02, `645:5999`)

An instance of **`유의사항_하단노출`** (width 360, height 34) sits directly above an instance of **`btn_bottom_page`** (the green CTA) — confirms the Core reference's ordering claim (disclaimer bar directly above the bottom CTA) with a real on-canvas example, not just the guide's textual claim.

## Demo frame 5 — `유의사항_더보기_슬라이딩팝업` (Case 03 sliding, `645:6041`)

Structure: `dim` overlay → `Popup_Sliding_basic_guide` → `contents` (`title` "유의사항" + divider line + `con` holding 3 **`유의사항_Content_popup`** instances, heights 52/52/104 — i.e. two 1-line bullets then one 2-line bullet) → `btn_bottom_page` ("버튼명" placeholder CTA). Transcribed bullet copy (verbatim):
> · 슬라이딩 팝업 본문 타입으로 일반적인 내용에 사용합니다.
> · 해당 줄은 중요한 텍스트가 있는 경우 사용합니다.
> · 금융투자상품(집합투자증권) **자산가격 변동, 환율변동, 신용등급 하락 등에 따라 투자원금의 손실(0~100%)이 발생**할 수 있으며, 그 손신을 투자자에게 귀속됩니다.

The third bullet's red/bold risk clause is a **real financial-disclosure sentence** (not placeholder), and the emphasis is rationed to just the risk phrase — matches the UX guide's "emphasis restricted to the single key risk clause" rule exactly.

## Demo frame 6 — `유의사항_더보기_풀팝업` (Case 03 full, `645:6053`)

Structure: `statusbar` + `Topbar_Fullpop` (title "유의사항" + ✕) → two `con` groups. First `con` (5 `유의사항_Content` instances, heights 36/52/78/78/104):
> 1. **NH투자증권 준법감시인 심사필 제2022-0585호(2022-03-28 ~ 2023-03-27)** — first bullet, bold, confirms "심사필 always goes first" from the UX guide, with the real legal-notice format.
> 2. 기본 타입으로 일반적인 내용에 사용합니다.
> 3. 금융투자상품(집합투자증권)은 예금자보호법에 따라 예금보험공사가 보호하지 않습니다. *(repeated twice, back-to-back — looks like a duplicate-paste artifact in the demo content, not a real double-disclosure rule)*
> 4. 금융투자상품(집합투자증권) **자산가격 변동, 환율변동, 신용등급 하락 등에 따라 투자원금의 손실(0~100%)이 발생**할 수 있으며, 그 손신을 투자자에게 귀속됩니다.

Second `con` group is headed by a text node reading verbatim **"소제목으로 활용가능"** ("usable as a sub-heading") followed by 2 more `유의사항_Content` instances — confirms the UX guide's "long popups get 소제목 subsections" rule with a concrete demo, including the literal in-context label proving the sub-heading pattern is intentional (not accidental heading reuse).

**Content duplication caveat**: bullet 3 appearing twice back-to-back is very likely placeholder-content sloppiness (copy-pasted twice while building the demo) rather than an intentional double-disclosure rule — flagged, not asserted as a rule.

## Component-set showcases (variant axes, verbatim from `get_design_context`)

### `유의사항_하단노출` (frame `645:7178`, 4 symbols)

Confirms the Core reference's variant axes exactly: **`Type` = `1줄` | `2줄`**, plus a second boolean prop (rendered in code as `propValue`, matching the guide's `더보기` on/off axis) that gates whether the right-edge `nds_icon_arrow` chevron renders. Text styling: `NM/Default/3.013` (`#666666`) body, `Info/Preten/R/18` font (Pretendard Regular 18px/24), container fill `NM/ESS/grayscale/7.051(그레이박스)` (`#F9F9F9`).

**Contradicts `nds-ux-guide-precautions.md` on the two-line text-box width.** This M.web asset's own on-canvas caption states, verbatim, **twice** (once per 2-line row): *"할 말이 많을 경우 최대 두 줄로 제한합니다. 텍스트박스 가로길이 최대 **286px**."* The NDS_UX Guide file's Case 02_두줄 sample instead says **"텍스트박스 가로길이 최대 428px."** These are two different numbers for what reads as the same rule (max text-box width for the 2-line floating disclaimer). **Not silently resolved here** — both are quoted verbatim from their respective sources; a designer needs to confirm which is current. Given this M.web page is itself marked `(진행중)`, either number could be the stale one.

### `유의사항_Content_popup` (frame `645:7218`, 2 symbols)

**`Type` = `기본` | `심사필`.** 기본: `Pretendard SemiBold`, color `#666666` (`NM/Default/3.013`). 심사필: `Pretendard Bold`, color `#333333` (`NM/Default/2.023`) — i.e. 심사필 popup rows are simply darker + bolder, not a structurally different layout. Bullet glyph `·` in both.

### `유의사항_Content` (frame `648:7391`, 7 symbols — more granular than the popup variant)

**`Type` = `기본` | `심사필` | `기본(강조포함)` | `당구장`, crossed with `줄 개수` = `1줄` | `2줄`** (7 of the 8 combinations exist; `당구장×2줄` is absent from the showcase). This is **more granular than anything the NDS_UX Guide's precautions page documents** — that guide only describes 1depth `・` / 2depth `-` bullets and "본문 강조 폰트" emphasis, with no named "당구장" type.

- **`기본(강조포함)`** ("기본 + emphasis included"): body text `NanumBarunGothic Regular`, with an embedded partial-bold span — e.g. "해당 줄은 **중요한 텍스트**가 있는 경우 사용합니다." (only "중요한 텍스트" bolded, color `#333333`). This is the concrete implementation of the UX guide's rule 4 (본문 강조 폰트 on the key clause only).
  - **Font-family gotcha**: `기본(강조포함)` uses `NanumBarunGothic`, while `기본`/`심사필` use `Pretendard SemiBold`/`Bold`. Two different font families for visually similar rows — worth sampling exact instance before reusing.
- **`당구장`** (lit. "billiard hall [numbering]" — Korean UI slang for a small-numeral/footnote list style): distinct visual treatment — `※` glyph prefix (not `・`), `Pretendard Light` 13px glyph + `Pretendard Medium` 15px body, color `#999999` (lightest of all the text/bullet variants here). On-canvas sample text: *"유의사항 밑에 하위에 들어가는 2Depth용으로 사용합니다."* — i.e. **당구장 is this file's own name for a 2-depth footnote row**, which is a plausible but not explicitly confirmed match to the UX guide's "2depth 하이픈(-)" rule — this variant uses `※`, not `-`, so it may be a distinct third tier rather than the guide's 2depth. Flagged as an open question, not resolved.
- 2줄 variants (기본, 심사필) append a second `<p>` line reading **"- 단락이 있으면 해당 줄과 같이 사용합니다."** ("if there's a paragraph, use it like this line") — this is the closest on-canvas match to the UX guide's "2depth 하이픈(-)" convention, confirming the `-` prefix convention survives into M.web, just on a different component (`유의사항_Content`, not `_popup`).

## WIP evidence (`(진행중)` finding, on-canvas)

1. **Page name itself**: `    - 유의사항  (진행중)` — the status is baked into the page name.
2. **Stray annotation text nodes are all mislabeled at the layer-name level.** Six page-level text nodes (`645:6232, 645:6234, 645:6235, 645:6236, 645:6240, 645:6241`) all carry the identical layer name **`토스트/체결알림 정의`** ("Toast/execution-notification definition") — a name that belongs to a *different* NDS_M.web page (Nudge/toast), not this one. Their **actual displayed characters**, confirmed via a direct `use_figma` read (not the layer name), are short captions unrelated to toast/notifications: `"기본"`, `"한줄"`, `"기본(바�록시트)"`→ verbatim `"기본(바텀시트)"`, `"심사필 포함"`, `"풀팝업"`, `"버튼포함"`. This is the exact "layer names lie" failure mode the learning method warns about, caught here by reading `.characters` directly rather than trusting the metadata `name` field — and it's independent evidence the page was cloned/copy-pasted from the Toast page template and never fully relabeled, consistent with the `(진행중)` status.
3. **Duplicated bullet content** in the full-popup demo (bullet 3 repeated back-to-back, see above) reads as unfinished placeholder content rather than deliberate design.

## Verified vs unverifiable (read-only session)

This session's Figma connection is **read-only**. Two independent attempts to resolve literal `componentKey` values for the instances used on this page (`유의사항_하단노출`, `유의사항_Content`, `유의사항_Content_popup`, `유의사항_Title`, `Basic_btn`, `btn_bottom_page`, `Popup_Sliding_basic_guide`, `Topbar_Fullpop`, `statusbar`) both threw:
- `getMainComponentAsync()` → `"Operation attempted to modify the file while in read-only mode."`
- `node.componentId` → `TypeError: no such property 'componentId' on INSTANCE node` (this property doesn't exist on Plugin API `InstanceNode`; the correct accessor (`mainComponent`) is exactly the one blocked by the read-only guard above)

So **no componentKey for any instance on this page could be confirmed in this pass** — this is a hard gap, not a guess filled in. `get_design_context`'s generated code also does not surface component keys (only Tailwind/CSS-shaped reference code + local style names), so it could not substitute either.

**Cannot confirm whether the on-page `유의사항_하단노출` instance (`648:7313`) resolves to the same componentKey as the Core reference's `유의사항_하단노출` (`6ab304902264c6101f4a0a62927f79d08c1d5827`, sourced from a different NDS org file)** — the variant axis names (`Type=1줄/2줄`) match exactly by name, which is suggestive but not proof of identity across files/libraries. Treat as "same component by convention, key-identity unconfirmed."

## How this feeds BUILD mode

- This page is the **M.web-native reference implementation** for `유의사항_하단노출`, `유의사항_Content`, `유의사항_Content_popup`, complementing (not replacing) the NDS_UX Guide's rules.
- For a 2-line floating disclaimer, **check both width numbers (286px here vs 428px in the UX guide) against the actual target library before hardcoding either** — this note deliberately does not pick a winner.
- The `당구장` type and `기본(강조포함)` type are M.web-specific refinements beyond what the UX guide names — reach for them when a screen needs a lighter 2-depth footnote (`당구장`, `※`, `#999999`) or an inline partial-bold emphasis row (`기본(강조포함)`) rather than inventing a new pattern.
- Font-family is not uniform across `유의사항_Content` variants — `기본`/`심사필` use Pretendard, `기본(강조포함)` uses NanumBarunGothic. Sample the real instance rather than assuming Pretendard throughout.
- Because this page is marked `(진행중)` and shows a real copy-paste layer-naming artifact, **re-run Mode 3 (VERIFY) on this page before treating any single number here as final** — safer to treat this note's width/variant findings as "best evidence captured 2026-07-15," not frozen spec.
