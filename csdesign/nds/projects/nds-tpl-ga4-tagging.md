---
name: nds-tpl-ga4-tagging
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=22330-559"
learned_date: 2026-07-15
sections_studied:
  - "22330:3362 '태깅신청서' — the GA4 tagging spec table: 5-column revision-history/event table (No / 이벤트 카테고리 / 이벤트 액션 / 이벤트 라벨 / 비고), 20 rows, worked example for the '큰손PICK' service"
  - "22330:3653 등 mockup instances ('[NM] 큰손픽 메인', '큰속픽_종목선택시', 'NM_iOS_menu', '큰손픽이란_서비스안내', '큰속픽_포트폴리오') — full screen flows annotated with numbered 'no_1' circle-badge instances (1–21) that map onto the table's No. column"
status: internal NDS GA4-tagging worksheet template — genuinely a spec/convention document, not a component gallery (Gotcha 7 exception confirmed)
---

# NDS Templates — GA4 Tagging

## Layer-name convention — reliable on this page

TEXT node names in `get_metadata` are the literal cell content (`이벤트 카테고리`, `메뉴`, `도움말`, `인물소개_{인물명}`, etc.) — confirmed 1:1 against the screenshot of `22330:3362`. No placeholder-name drift found (unlike `nds-tpl-thumbnail`'s worst case). **Verdict: reliable for this page.**

## ANSWER — this page STATES a convention (Gotcha 7 exception confirmed)

This is a **fillable tagging-request template**, on-canvas titled **`{서비스명} GA태깅 신청서`** ("{Service Name} GA Tagging Application Form"), populated with a worked example for the `큰손PICK` service. It defines a **4-field event schema** as literal table headers:

```
No | 이벤트 카테고리 | 이벤트 액션 | 이벤트 라벨 | 비고
```
(No | Event Category | Event Action | Event Label | Remark)

**Verbatim naming patterns observed in the 20-row example** (quoted exactly, `{}` = fill-in placeholder token used live in the sheet):

- Category examples: `메뉴`, `큰손픽` (all rows use the screen/section as category — no fixed enum stated beyond "name your screen/section")
- Action examples: `전체메뉴`, `메인`, `팝업_나무멤버스`, `큰손PICK이란`, `큰손의 포트폴리오`, `팝업_현재가사이드` — action = sub-screen/state name, `팝업_` prefix used for popup states
- Label patterns with dynamic placeholders: `인물소개_{인물명}`, `큰손탭_{인물명}`, `포트폴리오전체_{종목명}`, `매수종목_{종목명}`, `매도종목_{종목명}`, `전체포트종목_{종목명}` — pattern is **`{동작/맥락}_{동적값}`** using `_` as separator and `{}` for the dynamic token (person name / stock ticker name)
- Static labels (no placeholder): `도움말`, `포트폴리오 이야기`, `포트폴리오 전체보기`, `가장많이매수`, `가장많이매도`, `큰손PICK TOP10 주문하기`, `TOP10 주문하기`, `나무멤버스_전용컨텐츠`, `혜택 자세히 보기`, `서비스 안내 닫기`, `조회설정`, `소수점거래주문`
- `비고` (Remark) column is change-log style, not spec: `버튼 명칭변경`, `48번 추가된것 13번으로 변경`, `지난분기맛보기삭제 13번->14번으로 변경`, `조회설정 모든 케이스 포함` — confirms rows are living/versioned entries, not fixed forever

**No formal screen-name taxonomy or parameter-schema prose is stated beyond the column headers** — the convention is taught entirely by worked example (20 rows), not by written rules text. Numbered badge instances (`no_1`, cloned 21×, values 1–21) are overlaid directly on 5 full-screen mockups (`[NM] 큰손픽 메인`, `큰속픽_종목선택시`, `NM_iOS_menu`, `큰손픽이란_서비스안내`, `큰속픽_포트폴리오`) at the exact UI element each row's event fires on — this is the row-to-UI-element mapping mechanism, confirmed visually (screenshot shows red-circle numbers 1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21 pinned to buttons/menu items/list rows matching the table's No. sequence).

## Component keys (sampled, remote: true — Q4 confirmed)

| Instance | main COMPONENT key | remote | parent SET key/name |
|---|---|---|---|
| `no_1` (22330:3654) | `4043b38d6f8c3fc405dde81a26d9b6d24c9d1046` | true | none (bare COMPONENT, not a variant) |
| `NM_iOS_menu` (22330:3811) | `be6480af5e407edb5ac6cb7289245583249deea0` | true | none |
| `statusbar` (22330:3678) | `a445b1b74f8b09db3db9747aa8a205c047743543` | true | SET `cd20876126ad16ac337802cb72d4e46423b45171` (`statusbar`) |
| `quickmenu_basic` (22330:3806) | `0b75c3c90ea55d51fd61cbd25802aa23a530f0e4` | true | SET `9c5dd3cd3e714255914cf288f442fad7c3ac76dd` (`quickmenu_basic`) |
| `[NM] 큰손픽 메인` (22330:3653) | `46efc74cad25781fe90afcff4cfa6006b5d10e90` | true | none (bare COMPONENT, full-screen mockup) |

Mix of bare-COMPONENT (badges, full-screen mockups) and variant-COMPONENT-in-SET (`statusbar`, `quickmenu_basic`) confirms Gotcha 5 — expected, not a conflict. Sampled live (read-only `use_figma` threw once on a batched call, succeeded on retry and on a second batch — consistent with the documented intermittent read-only failure).

## Blanks / gaps

- No standalone "GA4 naming rules" prose block found anywhere on the page — the spec is 100% example-driven (one filled template, no separate written-rules frame).
- Only 5 full-screen mockups screenshotted for the badge↔row mapping; not all 20 badge positions individually cross-checked against their exact table row text.
- `title 개정이력` frame naming ("개정이력 테이블" = "revision history table") suggests this whole sheet is treated as a changelog artifact per-project, not a universal NDS-wide GA4 taxonomy — i.e. this is a **template/example file for producing a tagging request**, not a fixed company-wide event-naming standard.

## CORE

New cross-cutting fact: NDS_Templates' GA4 Tagging page is the one page across all sibling files that is a genuine spec document — it teaches the `{동작/맥락}_{동적값}` label convention via worked example, not prose.
