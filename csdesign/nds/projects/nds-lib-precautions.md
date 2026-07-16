---
name: nds-lib-precautions
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=13717-14694"
learned_date: 2026-07-16
sections_studied:
  - "13717:14694 (page '    - 유의사항' — 4 sibling frames, on-canvas headings: '페이지 내 유의사항', '팝업 유의사항', '플로팅 유의사항', '유의사항 Usage')"
  - "13717:14745 (frame '유의사항_usage' — on-canvas heading '유의사항 Usage'; carries the ⭐️필독⭐️ rule block and the page's only Last update stamp)"
  - "13717:14773 (frame '유의사항_asset' — on-canvas heading '페이지 내 유의사항'; 타이틀/본문/상품상세화면 유의사항 sets)"
  - "13717:14758 (frame '유의사항_assetge' — on-canvas heading '팝업 유의사항'; 슬라이딩 팝업 본문)"
  - "13717:14718 (frame '유의사항_asset' — on-canvas heading '플로팅 유의사항'; duplicate layer name with 13717:14773)"
status: "live — Last update stamp '2022.10.25 구자영' present on 13717:14750; all 5 component sets resolve with full keys and no set errors"
---

# NDS Library — 유의사항 (Precautions / disclosure text)

**This is a rules page, not a component showcase** — the highest-value prose page in this batch. 유의사항 is the mandatory disclosure/caution copy that Korean financial products must carry. The page specifies *how that copy is laid out*, in four delivery contexts.

The page's four frames are, by their **on-canvas headings** (the layer names are near-useless here — see below):

| On-canvas heading | Frame layer name | Node |
|---|---|---|
| 페이지 내 유의사항 (in-page) | `유의사항_asset` | `13717:14773` |
| 팝업 유의사항 (popup) | `유의사항_assetge` | `13717:14758` |
| 플로팅 유의사항 (floating) | `유의사항_asset` | `13717:14718` |
| 유의사항 Usage (the rules) | `유의사항_usage` | `13717:14745` |

## ⭐️필독⭐️ — the rule block, verbatim

Transcribed from the rendered canvas of `13717:14745`. Heading: **사용 시 유의사항**.

> - 항목(단락) 간격 10px 입니다.
> - 더보기 버튼 링크 영역에서는 더보기 문구를 쓰지 않습니다.
>   - `〉` 만 사용합니다.
> - 더보기 팝업에서 항목이 3개 이하일 땐 슬라이딩 팝업을 사용합니다.
>   - 흰색 영역 최대 세로 길이 832px
> - 더보기 팝업에서 항목이 4개 이상일 땐 풀팝업을 사용합니다.
>   - 화면 상의 콘텐츠를 절반 이상 채워주세요!

**Decoded for BUILD:**

- **Paragraph gap is 10px** — not the 8px used elsewhere in NDS. Don't reach for a generic spacing token here.
- **The 더보기 ("more") affordance is a bare chevron `〉`, never the word 더보기.** This is a hard prohibition; the text node `13717:14756` named `0.34%` inside `btn_more_area` is placeholder demo copy, not a rule.
- **The popup form is chosen by item count, and the threshold is exact:**
  - **≤ 3 items → 슬라이딩 팝업** (sliding/bottom-sheet), white area capped at **832px** tall.
  - **≥ 4 items → 풀팝업** (full popup), and it must fill **more than half** the screen with content.
  - There is **no rule for the boundary being crossed dynamically** — blank at source. Don't invent a resize behaviour.

The single TEXT node `13717:14753` holds this whole block, and its **layer name is the run-on concatenation of the rendered bullets with the sub-bullets interleaved out of order** (`"항목(단락) 간격 10px 입니다. 더보기 버튼 링크 영역에서는 더보기 문구를 쓰지 않습니다.  만 사용합니다. …"` — note the `〉` glyph is dropped entirely from the name). **Read this rule from the screenshot, never from the layer name.**

## 페이지 내 유의사항 (`13717:14773`) — the in-page anatomy

Three labelled groups, each a component set. On-canvas group labels are bilingual (`타이틀 / title`, `본문 / body`, `상품상세화면 유의사항 / product page`).

**타이틀 — `유의사항_Title` (`13717:14778`)**, axis `더보기` = `on` | `off`. `on` renders the trailing `〉` chevron; `off` is bare text. Both render the literal string `유의사항`.

**본문 — `유의사항_Content` (`13717:14787`)**, axes `Type` × `줄 개수` (line count). This is the workhorse. The **rendered demo copy is self-documenting** — each variant's body text states its own purpose:

| Variant | Rendered copy (verbatim) |
|---|---|
| `Type=심사필, 줄 개수=1줄` | 심사필에 사용하는 줄입니다.심사필에 사용하는 줄입니다. |
| `Type=심사필, 줄 개수=2줄` | (same, wrapped to 2 lines) |
| `Type=기본, 줄 개수=1줄` | 기본 타입으로 일반적인 내용에 사용합니다. |
| `Type=당구장, 줄 개수=1줄` | ※ 유의사항 밑에 하위에 들어가는 2Depth용으로 사용합니다. |
| `Type=기본, 줄 개수=2줄` | 기본 타입으로 일반적인 내용에 사용합니다. / – 단락이 있으면 해당 줄과 같이 사용합니다. |
| `Type=기본(강조포함), 줄 개수=1줄` | 해당 줄은 **중요한 텍스트**가 있는 경우 사용합니다. |
| `Type=기본(강조포함), 줄 개수=2줄` | 해당 줄은 **중요한 텍스트**가 있는 경우 사용합니다. / – 단락이 있으면 해당 줄과 같이 사용합니다. |

Three `Type` values carry real semantics:
- **`심사필`** — "compliance-reviewed". Renders **bold**. Use only for copy that has cleared compliance review.
- **`기본`** — default body. Regular weight.
- **`당구장`** — literally "billiard hall", the Korean printer's slang for the **※ (reference/kome) mark**. It renders `※`-prefixed, smaller and greyer, and its own copy says it is for **2Depth (sub-level) items nested under a 유의사항**. This is a naming joke that will not survive translation — record it as-is.
- **`기본(강조포함)`** — default body with an inline emphasis run.

`줄 개수` is a **visual line count (1줄/2줄), not a content property.** The 2줄 variants hard-code the second line as a `–` paragraph continuation. There is no 3줄+ variant — **blank at source**; if copy needs 3 lines the guide does not say what to do.

**상품상세화면 유의사항 — `유의사항_pagetop` (`13717:14815`)**, axis `Channel` = `NM` | `QV`. Both render the same statutory sentence with a red-emphasised legal citation:

> 해당 금융상품 정보는 **금융소비자보호에 관한 법률 제 19조 1항**에서 규정하고 있는 중요한 사항입니다.

This is a **statutory string (금융소비자보호법 §19(1))** — do not paraphrase, translate, or reflow the emphasis. The red run covers exactly `금융소비자보호에 관한 법률 제 19조 1항`.

## 팝업 유의사항 (`13717:14758`)

Group label 슬라이딩 팝업 본문 / sliding popup body. One set: **`유의사항_Content_popup` (`13717:14766`)**, axis `Type` = `기본` | `심사필`. Note the popup body **drops the `줄 개수` and `당구장` axes** that the in-page body has — the popup body is deliberately simpler. Don't assume parity.

## 플로팅 유의사항 (`13717:14718`)

Group label 플로팅형 / floating. One set: **`유의사항_하단노출` (`13717:14719`)** — layer name means "bottom exposure". Axes `Type` (`1줄`|`2줄`) × `더보기` (`on`|`off`), 4 variants. The set name (`하단노출`) and the on-canvas label (`플로팅형`) **disagree**; both describe the same thing — copy pinned to the bottom of the viewport.

## Name-reliability verdict for this page

**Mixed, leaning unreliable — worse than the file average.** Three distinct failure modes coexist:

1. **Frame layer names are duplicated and abbreviated.** `유의사항_asset` names **two different frames** (`13717:14718` floating, `13717:14773` in-page). `유의사항_assetge` is a typo'd stub for the popup frame. **Route by on-canvas heading, never by frame name.**
2. **`Title_Typo` sub-frames are copy-paste debris.** All four frames contain a `Title_Typo` frame whose sub-caption TEXT node reads `QV-NM 유의사항 Usage` — *including the three that are not the Usage page*. The floating frame's is `QV-NM 유의사항 Asset Guide`. The `Line 49` child in every one sits at `x=883` even in the 820-wide frames, i.e. **outside the frame**.
3. **Component-set names and variant names ARE reliable**, and the body variants' rendered demo copy is genuinely self-documenting — unusually good. Trust `유의사항_Content`'s variant axes.

**Rules embedded in screenshot images: NO.** This page is live text throughout; every rule was extractable, and the screenshot was needed only to *correct* the mangled layer names, not to recover pixels. Contrast with `nds-lib-9-patch`, where the opposite is true.

**No `hidden="true"` frames on this page** — nothing was unverifiable for that reason.

## How this feeds BUILD mode

- **Pick the context first** — in-page / popup / floating are three different component families with **non-overlapping axes**. There is no single "유의사항" component.
- **10px paragraph gap; `〉` chevron only; ≤3 → sliding (832px cap); ≥4 → full popup (>50% fill).** These four are the whole ruleset.
- **`Type=심사필` is a compliance claim, not a style.** Bold is its *rendering*; its *meaning* is "this copy passed review". Never set it for convenience.
- **`Type=당구장` = the ※ 2Depth sub-item.** Reach for it when nesting under an existing 유의사항, not for arbitrary small print.
- The 금융소비자보호법 §19(1) sentence in `유의사항_pagetop` is statutory — reproduce byte-for-byte, keep the red emphasis run exact, and pick `Channel` per the surface (see `nds-mweb-colors` for what `Channel` costs if you get it wrong).
