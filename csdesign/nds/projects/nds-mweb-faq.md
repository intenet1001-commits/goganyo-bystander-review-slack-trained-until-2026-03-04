---
name: nds-mweb-faq
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=634-2138"
learned_date: 2026-07-15
sections_studied:
  - "634:2138 (page '    - 자주하는질문' / FAQ — single top-level content frame, no sibling sections)"
  - "645:4516 (frame '자주하는질문', 360x800 — one complete FAQ screen: header + tabs + accordion list)"
  - "645:4517 (sticky 'Top' group — statusbar + header_basic + tab_1depth_line)"
  - "645:4521 (frame 'list' — 4 sibling 'FAQ_List' accordion cards, gap 10px)"
  - "645:4522 (FAQ_List #1 — Q1, expanded, with full answer text)"
  - "645:4530 / 645:4535 / 645:4540 (FAQ_List #2-4 — Q2/Q3/Q4, collapsed, question row only)"
status: real shipped-content example screen (not a component-library guide page) — genuinely finished, no placeholder text
---

# NDS M.web — 자주하는질문 (FAQ)

This page is one of only 4 content pages in NDS_M.web **not** marked `(진행중)`, and on-canvas evidence supports that: this is a **single, complete, real-content screen** — a "큰손PICK" (institutional-13F-tracking stock-pick feature) FAQ — not an abstract component spec. There is no separate rules/spec frame beside it; the page *is* the worked example. Confirmed real (not placeholder) by:
- The header title is a real feature name: **"큰손PICK이란?"** ("What is 큰손PICK?").
- Q1's answer is fully written, grammatically complete Korean copy about a specific data-sourcing detail (SEC 13F filings), not lorem-ipsum or a repeated placeholder string.
- All 4 questions are distinct, on-topic, and internally consistent with each other (Q1 defines the service, Q2 defines a term Q1 used, Q3 is a caveat, Q4 is an operational FAQ).

No frame-name vs. on-canvas heading mismatch found on this page — `자주하는질문` (frame name) matches the active tab label "자주하는 질문" exactly, and the four `FAQ_List` siblings' question-text nodes match their own screenshot content 1:1 (verified via `get_design_context`, not just layer names).

## Screen structure (top → bottom, `645:4516`, 360×800)

1. **Sticky `Top` group** (`645:4517`) — does not scroll with the list:
   - `statusbar` instance (`645:4518`) — `Type=NM, Dark mode=off`
   - `header_basic` instance (`645:4519`) — `Channel=NM, Left Icon=on, Right Icon=off`; title text "큰손 PICK이란?" (16px, `NanumBarunGothic Regular`, black)
   - `tab_1depth_line` instance (`645:4520`) — `Colum=2col, Type=fixed`; two tabs "서비스 안내" (inactive, `Pretendard Medium 24`, `#999`, grey underline `#E0E0E0`) / "자주하는 질문" (**active**, `Pretendard Bold 24`, black, black underline) — this FAQ page is the *second* tab of a 2-tab detail screen, not a standalone page.
2. **`list` frame** (`645:4521`, absolute-positioned at x16/y150) — vertical stack of 4 `FAQ_List` cards, `gap: 10px`. Each card: white bg, `rounded-[10px]`, `px-16 pb-20`.

## Accordion card anatomy (verbatim copy)

Each `FAQ_List` card has a question row (`Frame 482347`): question text (16px `Pretendard Medium`, black, fixed width 270px so it wraps rather than truncating) + a `nds_icon_arrow04_u24` chevron instance, `gap: 10px`.

| # | Question (verbatim) | State | Chevron variant | Answer (verbatim, if expanded) |
|---|---|---|---|---|
| Q1 | `Q1. 큰손PICK은 어떤 서비스인가요?` | **Expanded** | `Color=05, Type=up, Height=h24` | `'큰손PICK'은  미국 유명 투자 대가가 (기관투자자) 운용하는 포트폴리오 변동을 추적하여 안내해드리는 서비스예요.`⏎(blank line)⏎`해당 데이터는 매 분기말 SEC(미국 증권거래위원회)에 공시되는 13F 공시 자료 기준입니다.` |
| Q2 | `Q2. 13F 공시는 무엇인가요? ` (trailing space in source) | Collapsed | `Color=05, Type=down, Height=h24` | — (not rendered while collapsed) |
| Q3 | `Q3. 큰손PICK 포트폴리오를 볼 때 주의해야 할 점은?` | Collapsed | `Color=05, Type=down, Height=h24` | — |
| Q4 | `Q4. 데이터는 언제 업데이트 되나요?` | Collapsed | `Color=05, Type=down, Height=h24` | — |

Answer text styling (Q1 only, node `645:4529`): `Pretendard Regular 21px`, color `#666` (`NM/Default/3.013`), `line-height 30px`, `white-space: pre-wrap` — i.e. hard line breaks are baked into the copy, not just word-wrap. A visually-blank paragraph (a lone zero-width-space character, `​`) separates the two answer paragraphs — this is the guide's mechanism for a paragraph gap within one text node rather than a second text node.

Only Q1's card carries a divider line (`645:4527`, `#F0F0F0` = `NM/ESS/line/3.025(리스트구분선)`, 1px) between its question row and its answer — because collapsed cards have no answer to separate from. Collapsed cards (`FAQ_List` #2-4) are literally shorter frames (64/88/64px vs Q1's 405px) with only the question-row child; there's no evidence of a hidden/collapsed answer node underneath (nothing extra found in `get_metadata`'s tree for those three cards).

## Colors and type used on this page (all confirmed via `get_design_context` styles list)

| Role | Style name | Hex/value |
|---|---|---|
| Page background | `NM/ESS/grayscale/5.297(bg배경)` | `#EBEDF1` |
| Card background | `NAMUH/Grayscale/73.018` / `NM/Grayscale/74.018` | `#FFFFFF` |
| Header title text | `NM/Default/1.004` | `#000000` |
| Question text | `NM/Default/2.023` | `#333333` |
| Answer text | `NM/Default/3.013` | `#666666` |
| Inactive tab label | `NM/Default/4.024` | `#999999` |
| Card-internal divider (Q1 only) | `NM/ESS/line/3.025(리스트구분선)` | `#F0F0F0` |
| Inactive tab underline | `NM/Line/137.017` | `#E0E0E0` |
| (Referenced but unused on this specific page — appeared in the style list anyway) | `NM/Default/5.074(HintText)` / `NM/Grayscale/54.074` | `#C5C5C5` |
| Question font | `Title/Preten/M/24-16` | Pretendard Medium 16/24 |
| Active tab font | `Title/Preten/B/24` | Pretendard Bold 24/34 |
| Inactive tab font | `Title/Preten/M/24` | Pretendard Medium 24/34 |
| Answer font | `Body/Preten/R/21` | Pretendard Regular 21/30 |

All hexes here independently corroborate `nds-mweb-colors.md`'s NM-channel table (e.g. `#333333`/`#666666`/`#999999`/`#F0F0F0`/`#EBEDF1` all match that page's decoded values exactly) — no discrepancies found.

## Component library — verified live in this Figma session

Confirmed via `node.getMainComponentAsync()` on each instance (read-only session — could read `key`/`remote`/`parent`, could not `importComponentSetByKeyAsync`). **All five are `remote: true`, i.e. real published NDS_Library components, not page-local unpublished scaffolding** — no `ndsw_ms_*`-style local export names found anywhere on this page.

| Instance (this page) | Variant used here | componentKey | componentSet key | Matches Core reference? |
|---|---|---|---|---|
| `statusbar` | `Type=NM, Dark mode=off` | `a445b1b74f8b09db3db9747aa8a205c047743543` | `cd20876126ad16ac337802cb72d4e46423b45171` | Not previously recorded in Core reference — **new key to add**. |
| `header_basic` | `Channel=NM, Left Icon=on, Right Icon=off` | `6ebb7f6578174274ff2edfcd3b51cc4d98ccde61` | `7888c4556b44006dcde2d2c97a9b0d3f03455f08` | **Same component name, different key** than Core reference's `header_basic` (`c95043e94317fde7230298017f42dd8099e1cbdc`, from a different file, org NHIS Digital Platform). Not a contradiction necessarily — could be a per-file library instance of the same design-system component — but flag before assuming the keys are interchangeable across files. Core reference also notes this component was "broken" for instancing in that other file; this instance renders fine here, so it's at least usable in NDS_M.web. |
| `tab_1depth_line` | `Colum=2col, Type=fixed` | `4a7a62958e7e983edc979ae3ce00683286784d4f` | `702641f42a2baf696ec14fd1c1daf4f50b85f3e2` | Not previously recorded — **new key to add**. Note the guide's own typo: variant axis is spelled `Colum` (missing an `n`), not `Column`. |
| `nds_icon_arrow04_u24` (up) | `Color=05, Type=up, Height=h24` | `8571fa97ecb73cec4c329be89c1c77ccd0375dae` | `dde648604e4d08cc6b99c44dda81ec73ccbb4b15` | **Component-set key matches Core reference's `nds_icon_arrow` exactly** — confirms that's the same component family; this page just uses the `Height=h24` size and `up`/`down` (not `left`/`right`) variants for accordion state, which the Core reference didn't previously illustrate. |
| `nds_icon_arrow04_u24` (down) | `Color=05, Type=down, Height=h24` | `7c328ec445db51b44cdbe133974e6796eeebbefe` | `dde648604e4d08cc6b99c44dda81ec73ccbb4b15` | Same set as above. |

**Accordion state pattern (new, worth promoting)**: expanded = chevron `Type=up`; collapsed = chevron `Type=down`. Both are the *same* `nds_icon_arrow` component set, just different `Type` variant — confirms this is the general-purpose directional-arrow component, reused here for accordion affordance rather than a dedicated "accordion chevron" component.

## Gaps

- No visible "Last update" stamp or version annotation found on this page (unlike some NDS_UX Guide pages, e.g. `nds-ux-guide-tab`'s `Last update 22.11.17`). Completeness is inferred from copy quality and internal consistency, not an explicit version marker.
- Collapsed states' answer text is **not present anywhere in the file** — there is no hidden/`visible=false` answer node under Q2-Q4 to check, so their answer copy is genuinely absent from this Figma file (not a hidden-frame case per the skill's "hidden frames" rule — there's simply no node there at all). If Q2-Q4's answers are needed for BUILD, they must be sourced elsewhere (Notion, product spec) — do not invent them.
- Did not attempt `importComponentSetByKeyAsync` on the 5 keys above (session is read-only; the call would throw). Recommend a live re-check before relying on these keys in a BUILD pass with write access.
