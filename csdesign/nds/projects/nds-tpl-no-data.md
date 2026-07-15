---
name: nds-tpl-no-data
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=16357-507"
learned_date: 2026-07-15
sections_studied:
  - "16357:507 (page canvas '    - No data 데이터 없음' — title frame 16378:11467 on-canvas 'No data' / 'QV-NM Template Guide')"
  - "16378:13058 / 16378:13103 / 16378:14420 (Screens_1Level — bare/icon/icon+CTA empty-state variants, single-line '조회된 데이터가 없어요.')"
  - "16378:13153 / 16378:13212 (Group 9193/9192 — illustration + headline + CTA, '조회된 데이터가 없어요.' / 2-line '조회할 수 있는 데이터가 없어요.')"
  - "16378:13313 (tab_2column_탭 — tabbed screen, bare '조회된 데이터가 없어요.', no icon/CTA)"
  - "16378:13369 (상단안내영역01 — promo-banner-topped screen, bare '조회된 데이터가 없어요.')"
  - "16378:13434 / 16378:14217 / 16378:13510 (상단안내영역03 ×3 — promo-banner-topped screens, all '조회 가능한 데이터가 없습니다.' 1-line/2-line/+subtext, each with a generic 버튼명 CTA)"
  - "42015:10471 (상품_모집기간 아님 — 'coming soon' state, NOT an empty state: '지금은 모집 준비 중이에요. 곧 좋은 상품으로 찾아올게요.')"
  - "20776:1071 (02_펀드찾기_투자권유X_미희망자 — access-restricted state with real (non-placeholder) copy + real CTA button '나의 투자성향 확인')"
status: internal NDS component-library guide (Templates file — usage-example gallery of empty-state screen compositions, not a prose rules source)
---

# NDS Templates — No data 데이터 없음

Single-page usage gallery (title on-canvas: **"No data" / "QV-NM Template Guide"**) showing ~10 composed full-screen mockups of the empty-state pattern across different screen shells (plain list screen, tabbed screen, promo-banner-topped screen, restricted-access screen, "coming soon" product screen). Consistent with `nds-tpl-list`/`nds-tpl-data-table`: no isolated component-swatch sheet, every instance lives inside a composed screen mock. **Zero prose rules on this page** — confirms Gotcha 7 (gallery, not rules source).

## Layer names — confirmed reliable

Screenshot-verified: layer-named text nodes (`조회된 데이터가 없어요.`, `조회할 수 있는 데이터가 없습니다. (2줄케이스)`, etc.) match on-canvas rendered text exactly, character-for-character, across all 9 screenshotted frames. Component instance names (`statusbar`, `header_basic`, `nds_icon_info05_h30`, `btn_container_regular`) also resolved to identically-named parent COMPONENT_SETs via `getMainComponentAsync()`. **Verdict for this page: layer names reliable** — no mismatches found (contrast with the "one page had 5 nodes all misnamed" warning elsewhere in this file family; not the case here).

## Component keys — genuine COMPONENT_SETs, `remote: true`

Sampled via 5 explicit node IDs (page-wide sweep not attempted, per read-only risk):

| Instance | main COMPONENT name | main key | remote | parent SET | parent SET key |
|---|---|---|---|---|---|
| `16378:13059` statusbar | `Type=NM, Dark mode=false` | `169d23c202bd4e85398ceafdf264d6fa19eb1cbf` | true | `statusbar` | `fe57c685f5a27a53c49fc56c9999456340140c2f` |
| `16378:13061` header_basic | `Channel=NM, Left Icon=on, Right Icon=off` | `c7706f72a18d458759548113071367745adc8d96` | true | `header_basic` | `c95043e94317fde7230298017f42dd8099e1cbdc` |
| `16378:13148` nds_icon_info05_h30 | `Color=5, Height=h30` | `903649e2a4ce7bfbffa385cbd580e68564e3d014` | true | `nds_icon_info` | `a8c8213957d82b75453df70541d4de215db3c24d` |
| `16378:13208` btn_container_regular | `Strength=3-gray, Height=h54, Status=normal` | `27ae7416a10f99b895c813b94b129be1199d143b` | true | `btn_container_regular` | `fd0a4e2fd7b3c49612b27963bd8bf41f1580910b` |
| `16378:13203` NM/nds_illust01 | (single COMPONENT, not a SET) | `678b14399ad0918e8e61d50c3f93620040ea8849` | true | — | — |

All `remote: true`, all resolve cleanly to Q4 (NDS_Templates subscribes to NDS_Library) — corroborates Core, no doc-copy rivalry.

## ANSWER — empty-state strings on this page: mixed endings, CONTRADICTS the guide

Every empty-state string transcribed verbatim, with ending style and CTA presence:

| Frame | Headline (verbatim) | Ending | CTA? |
|---|---|---|---|
| `16378:13058` Screens_1Level (bare) | 조회된 데이터가 없어요. | **-어요** ✓ | No (bare, no icon/button) |
| `16378:13103` Screens_1Level (+icon) | 조회된 데이터가 없어요. | **-어요** ✓ | No button, only ⓘ icon |
| `16378:14420` Screens_1Level (+icon+CTA) | 조회된 데이터가 없어요. | **-어요** ✓ | Yes — placeholder `버튼명` button |
| `16378:13153` Group 9193 (+illust+CTA) | 조회된 데이터가 없어요. | **-어요** ✓ | Yes — placeholder `버튼명` |
| `16378:13212` Group 9192 (+illust+CTA, 2-line) | 조회할 수 있는 데이터가 없어요. (2줄케이스) | **-어요** ✓ | Yes — placeholder `버튼명` |
| `16378:13313` tab_2column_탭 (bare, tabbed) | 조회된 데이터가 없어요. | **-어요** ✓ | No |
| `16378:13369` 상단안내영역01 (bare, promo shell) | 조회된 데이터가 없어요. | **-어요** ✓ | No |
| `16378:13434` 상단안내영역03 (+CTA) | 조회 가능한 데이터가 없습니다. (2줄케이스) | **-습니다** ✗ | Yes — placeholder `버튼명` |
| `16378:14217` 상단안내영역03 (+subtext+CTA) | 조회 가능한 데이터가 없습니다. (2줄케이스) + "서브텍스트가 들어갑니다." | **-습니다** ✗ | Yes — placeholder `버튼명` |
| `16378:13510` 상단안내영역03 (+CTA, 1-line) | 조회 가능한 데이터가 없습니다. | **-습니다** ✗ | Yes — placeholder `버튼명` |

Two additional adjacent-but-distinct states (not counted above — not pure "no data"):
- `42015:10471` 상품_모집기간 아님: "지금은 모집 준비 중이에요. 곧 좋은 상품으로 찾아올게요." — **-어요**, a "coming soon" state (matches the guide's warning: don't conflate loading/prep states with empty states — this page correctly keeps them visually distinct via a "COMING SOON" sign illustration, not the ⓘ empty-state icon).
- `20776:1071` 02_펀드찾기_투자권유X_미희망자: "고객님의 투자성향이 조회되지않아 상품 조회가 제한되었습니다." — **-습니다**, an access-restriction message (not absence-of-data) with a **real, non-placeholder CTA**: "나의 투자성향 확인" button.

**CONTRADICTS `nds-ux-guide-empty-state`, but only partially and in a specific pattern.** The 7 "core" no-data screens split cleanly along a structural axis: all 4 **plain-shell / list-shell** screens use the guide-compliant **`-어요`** ending; all 3 **promo-banner-topped (`상단안내영역03`) shell** screens use the redlined **`-습니다`** ending. This is a **new, sharper finding than prior pages** (`국내주식권리`, `nds-tpl-tab` — which just showed isolated `-습니다` instances): here, within a single page, the split correlates with screen template/shell, suggesting the `-습니다` copy may be older/legacy template text that was never updated when the `상단안내영역03` shell's other fields were revised (note `14217` has a half-finished second field — literal placeholder "서브텍스트가 들어갑니다." never replaced with real copy, evidence of an unfinished template). **Escalate-worthy**: this library's own component gallery is internally inconsistent on the exact rule the sibling UX-writing guide treats as its single most mechanical check.

All CTA buttons observed use the generic instance-default label `버튼명` (a placeholder, not real product copy) — none of these template screens demonstrate real CTA text like `주식 사러 가기` / `종목 추가하기` from the guide's prescribed examples. The one **real** CTA label seen anywhere on this page (`나의 투자성향 확인`, node `20776:1071`) belongs to the access-restriction case, not a pure empty-data case.

## Blanks / gaps

- Page-wide instance sweep not attempted (read-only risk) — only 5 explicit-ID components key-verified; other instances (quickmenu_basic, tab_1depth_line, btn_bottom_page, Subpage_top, moana, list_recomm, etc.) not individually key-checked, though names read reliably per the screenshot spot-checks above.
- Several loose canvas-level text nodes named "토스트/체결알림 정의" (`16357:2118`, `16357:2119`, `25121:659`, `28817:5700`, `16378:10356`, `16359:3122`) are scattered around the canvas at large x/y offsets, unrelated to the page's own topic (toast/체결알림 = trade-execution notification, not empty state) — likely leftover/copy-pasted section-divider labels from another page. Not screenshot-confirmed (low priority, off-topic); flagged as noise, not empty-state content.
- No prose usage rules found anywhere on this page (matches `nds-tpl-list`/`nds-tpl-data-table` precedent) — pure example gallery.
- CTA button instances all carry placeholder text (`버튼명`) rather than real copy — can't confirm from this page alone whether NDS_Templates ever ships realistic CTA strings for the no-data pattern specifically.
