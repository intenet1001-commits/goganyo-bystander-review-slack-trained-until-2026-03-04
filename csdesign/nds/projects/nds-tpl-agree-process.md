---
name: nds-tpl-agree-process
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=15364-7116"
learned_date: 2026-07-15
sections_studied:
  - "17897:5539 (frame '01 필수 단일 동의' — single checkbox, checked, CTA '다음')"
  - "17897:5915 / 18151:1833 (frame '01 필수 단일 동의' — multi-item list, aggregate labeled '[필수] 전체동의')"
  - "17897:6005 (frame '01 필수 단일 동의' — title '필수 동의 사항', aggregate '[필수] 모두 동의합니다', CTA '확인')"
  - "17897:7033 / 17897:7209 (frame ' 02 필수, 선택 혼합 동의')"
  - "17904:11469 etc. (frame '03 예외) 상품설명서 및 약관동의')"
  - "17912:1850 (frame '04 예외) 마이데이터 스크롤 동의' — aggregate labeled '전체동의', no [필수] prefix)"
  - "17912:3046 (frame '04 예외) 개인(신용)정보처리 동의' — checklist-only aggregate, no 동의/비동의 buttons)"
  - "27697:56882 (frame '05 변경) 개인(신용)정보처리 동의' — 동의/비동의 button pairs per item)"
status: internal NDS component-library guide (Templates file — composed usage-example screens, not the rules doc)
---

# NDS Templates — Agree process 이용동의

Composed demo screens for the five consent patterns, laid out left-to-right on one canvas. **Layer names read reliably on this page** — every top-level frame is named after its on-canvas `0N 案례` label, matching exactly (confirmed via metadata + screenshot; no placeholder-copy or number-swap gotcha found here, unlike other NDS_Templates pages).

## KEYS — Gotcha-5-compliant (COMPONENT vs parent SET)

Sampled via 5 explicit node IDs inside `17897:5539` (page-wide sweep not attempted):

| Instance | variant (COMPONENT) | COMPONENT key | remote | parent SET | SET key | remote |
|---|---|---|---|---|---|---|
| `check_icon_solid` | `Channel=NM, Height=h26, Status=normal, Darkmode=false` | `7078b6e2024a2c646e85d32b922cf113f35c97cb` | true | `check_icon_solid` | `3452ebde77d6d2d759f123e422ccee3a6c01b3c4` | true |
| `check_icon_line` | `Channel=NM, Status=normal` | `2ba0a9b18aeff6007483454c3a8c2c6cadd4d996` | true | `check_icon_line` | `0598f4c21dd68667d15d34875f12c1b3e1176c34` | true |
| `nds_icon_arrow` | `Color=04, Type=right, Height=h16` | `7937b8b53de922d4b691afb4725f3e481463a0f3` | true | `nds_icon_arrow` | `dde648604e4d08cc6b99c44dda81ec73ccbb4b15` | true |
| `btn_bottom_page` | `Channel=NM, Type=1-btn, Status=disabled` | `53b6e4e64922d3a4ee54588ba925ba54983ec52e` | true | `btn_bottom_page` | `accfb243ce752fd894af2b6db081b1074022a39d` | true |
| `quickmenu_basic` | `Channel=NM, Type=normal` | `0b75c3c90ea55d51fd61cbd25802aa23a530f0e4` | true | `quickmenu_basic` | `9c5dd3cd3e714255914cf288f442fad7c3ac76dd` | true |

All 5 SET keys **match Core exactly** (`check_icon_line`, `nds_icon_arrow`, `btn_bottom_page` parent SET all corroborate) — clean corroboration, no rival keys.

**Anomaly worth flagging**: the `btn_bottom_page` instance driving the CTA on `17897:5539` (the single-required-consent screen, checkbox shown checked, button rendered visually as the same solid green used on every other "enabled" CTA on this page) reports variant `Status=disabled`, not `Status=normal`. Either the demo's variant selection is stale relative to its visual override, or this design system's `disabled` swatch for this button family isn't visually distinct from `normal` — unresolved, flagged not asserted.

## ANSWERS — cross-file check against `nds-ux-guide-consent.md`

**5 patterns**: partially corroborated, with real deviations found in the SAME page.
- Case 01 (single required) — `17897:5539` shows copy **"[필수] 동의합니다"** — exact verbatim match to the guide.
- Case 01 (multi-item, 모두동의+하위체크) — `17897:6005` shows **"[필수] 모두 동의합니다"** with title **"필수 동의 사항"** — exact verbatim match.
- **Contradiction**: two sibling case-01 frames (`17897:5915`, `18151:1833`) use **"[필수] 전체동의"** instead — same pattern, different fixed-copy phrase than the guide mandates. This is a real in-file inconsistency, not a guide-vs-page mismatch alone.
- Case 04 (마이데이터) — nodes at `17904:12178/12201/12224/12369/12392/12415` (children of the `17912:1850` cluster) label the aggregate simply **"전체동의"** — missing the `[필수]` prefix the guide requires on every item/aggregate row.
- Case 05 (개인신용정보처리) — **two competing representations coexist on this page**: the older frame `17912:3046` ("04 예외) 개인(신용)정보처리 동의" on canvas) uses a plain **checkmark list** + "[필수] 모두 동의합니다", with **no 동의/비동의 button pairs** — directly contradicts the guide's mandatory rule ("render 동의/비동의 button pairs — never a single checkbox"). The newer frame `27697:56882` ("05 변경) 개인(신용)정보처리 동의") **does** show real **동의 | 비동의** button pairs per item (screenshot verbatim: "1. 수집·이용에 관한 사항 · 개인(신용)정보 수집·이용 [동의][비동의]", "2. 제공에 관한 사항 · 개인(신용)정보 제3자 제공 [동의][비동의]", footer note "비동의 체크 시 서비스 가입이 불가합니다.") — this matches the guide exactly and appears to be the corrected/current version the "변경" (changed) label signals.

**Fixed copy verbatim match**: mixed for "모두 동의합니다"/aggregate row (2 of 4 sampled aggregate instances match exactly; 2 use "전체동의"). `[필수]`/`[선택]` prefixes present on the case-05-변경 popup's items in principle but the case-04 마이데이터 aggregate omits `[필수]` entirely.

**CTA gated in unchecked state?** Not directly verifiable from this page — every screenshot sampled (`17897:5539`, `17897:6005`, `27697:56882`, `17912:3046`) shows the **checked/completed state with a green enabled CTA**; no unchecked/disabled-CTA demo frame was found to screenshot-confirm the guide's "미체크 시 버튼 비활성화" claim. No violation observed (never saw an enabled CTA paired with an unchecked box), but also no positive same-page confirmation of the disabled state.

## BLANKS

- No unchecked/disabled-CTA state demoed anywhere sampled — cannot confirm the guide's disabled-state rule from this page alone.
- Case 02/03 screenshots were inconsistent across two identical-nodeId requests during this session (read-only volatility per LEADER.md) — not quoted as rules here to avoid reporting an unverified state.
- Page-wide instance sweep not attempted; only 5 explicit-ID instances key-verified.

## CORE

No new Core claims to add — all 5 sampled keys corroborate existing Core entries (`check_icon_line`, `check_icon_solid`, `nds_icon_arrow`, `btn_bottom_page`, `quickmenu_basic`).
