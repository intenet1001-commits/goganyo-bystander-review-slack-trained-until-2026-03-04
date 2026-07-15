---
name: nds-ux-guide-touch-area
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=2439-38"
learned_date: 2026-07-15
sections_studied:
  - "2549:1432 (INDEX — lists 3 top-level sections: 01 터치 영역 가이드란?, 02 터치 영역 기본 원칙, 03 터치 영역 크기 가이드. Note: this file's internal frame layer name is '01', not an index-specific name — same layer-name-vs-visible-number mismatch documented in nds-ux-guide-color-contrast, confirmed again here.)"
  - "2549:1443 (frame internally named '02', but the on-canvas heading reads '01 터치 영역 가이드란?' — the guide's actual opening/definition section)"
  - "2549:24534 (frame '03' on-canvas → '02 터치 영역 기본 원칙_엄지영역 고려')"
  - "2549:26787 (frame '04' on-canvas → '02 터치 영역 기본 원칙_충분한 영역 확보')"
  - "2549:24538 (frame '05' on-canvas → '03 UI 요소 별 터치 영역 크기 가이드', case 01 플로팅 액션(FAB) 버튼)"
  - "2727:79 (frame '06' on-canvas → same '03' section, case 02 네비게이션 버튼)"
  - "2780:395 (frame '07' on-canvas → same '03' section, case 03 아이콘 버튼)"
  - "2780:455 (frame '8' on-canvas → same '03' section, case 04 체크버튼)"
  - "2727:214 (frame '07' — a second, differently-ID'd frame also internally named '07' — on-canvas → same '03' section, case 05 리스트/카드 내 아이콘 버튼)"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as design-rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — 터치영역 설정 (Touch Area Sizing)

Part of the NDS_UX Guide file's "터치영역 설정" canvas — the design team's internal touch-target sizing rulebook (labeled "NHI Design Principle" in the guide's own corner tag). This is a **rules document**, not a product screen: use it to validate/generate hit-area sizes and spacing, not as a layout or flow reference (that's `csdesign/asset`'s job).

**Frame-numbering gotcha confirmed again**: exactly like `nds-ux-guide-color-contrast`, this file's internal Figma frame layer names ("01"–"8") do **not** line up with the on-canvas section numbers — e.g. the layer named "02" is actually on-canvas section "01", and five separate case frames (layer names "05","06","07","8", and a second "07") all belong to the single on-canvas section "03". Always screenshot and read the visible heading; never trust the layer name alone.

## 01. 터치 영역 가이드란? (What is the touch-area guide)

> "모바일에서 터치 인터랙션을 더욱 편리하게 만들기 위한 가이드입니다. 사용자가 실수하지 않도록 돕고, 누구나 쉽게 쓸 수 있도록 하는 것이 목적입니다. 또한, 접근성을 높여 더 편리한 사용자 경험을 제공합니다."

Illustrated with a thumb-reach heatmap (phone held in one hand): three zones — **HARD** (red, top of screen — 한 손 또는 엄지로 닿기 어려운 영역), **OK** (yellow, middle), **EASY** (green, bottom-center — 닿기 쉬운 영역). This is the classic one-handed thumb-zone diagram; use it to justify placing primary actions low/center on a screen.

## 02. 터치 영역 기본 원칙 (Basic principles)

Two sub-rules, each illustrated with a DON'T (red X badge) vs DO (green check badge) app-screenshot pair:

### 엄지영역 고려 (Consider the thumb zone)
> "Josh Clark*에 따르면 모바일 기기 상호작용의 75%가 엄지손가락으로 이루어진다고 합니다. 엄지로 쉽게 접근할 수 있는 영역에 중요 기능을 배치해주세요." (*Josh Clark – *Tapworthy: Designing Great iPhone Apps*, cited verbatim as the source)

One-handed grip usage split shown as a stat, illustrated with 3 hand-hold diagrams: **49% 한손 사용** (one-hand), **36% 손에 받쳐 사용** (cradled in other hand), **15% 양손 사용** (two-hand). Example pair: a card-detail screen's primary CTA buttons ("매매 전략", "가격 패턴", "거래량 변화" pills) — DON'T places them top/scattered, DO anchors them in a bottom action bar within thumb reach.

### 충분한 영역 확보 (Ensure adequate area)
> "안정적인 상호 작용을 위해 터치 영역을 단순하고 직관적으로 설계해야 합니다. 카드나 리스트에서 메인 액션은 하나로 제한하는 것이 좋습니다. 사용자의 손 크기를 고려하여 충분한 터치 영역을 확보해주세요."
> Footnote: *"Facebook, Instagram, YouTube 등 주요 앱들은 리스트/카드 하나에 메인 액션 하나만 할당하는 것을 기본 UX 원칙으로 삼고 있습니다."*

Example pair: a "서비스 알림설정" toggle-list screen — DON'T has multiple mixed tap-targets per row (chevron + toggle + dotted overflow icon all crowded), DO simplifies each row to one clear action (either a chevron-nav row or a toggle row, not both, plus a red highlight ring showing the now-unambiguous full-row hit target).

## 03. UI 요소 별 터치 영역 크기 가이드 (Sizing table, per UI element)

Section intro, verbatim: *"실수를 방지할 수 있도록 충분한 터치 영역(여백)과 요소 간 적절한 간격을 확보해주세요."* Footnoted: *"\* Apple/Google 권장 가이드를 기반으로 하되, 실제 적용 시의 제약사항을 반영하여 일부 수치 조정함"* — i.e. these are NH's own adjusted numbers, not raw Apple/Google HIG values; don't assume they match stock iOS/Android guidance exactly.

Five cases, each with a spec table (항목 / 모바일 기준 / 물리적 크기):

| Case | Element size | Touch-target min | Spacing between elements | Note |
|---|---|---|---|---|
| 01. 플로팅 액션(FAB) 버튼 (우하단 고정형) | 버튼 자체 크기 52pt (≈8.3mm) | 터치 영역 최소값 52pt (≈8.3mm — button itself **is** the touch area, no extra padding) | 화면 여백 좌우/하단 최소 16pt (≈3.0mm) | "FAB는 일반적으로 버튼 자체를 터치 영역으로 간주"; "손가락 접근성 고려하여 화면 우측 여백 최소 16 확보 필요" |
| 02. 네비게이션 버튼 (뒤로가기, 닫기, 알림 등) | 아이콘 자체 크기 34px (≈5.4mm) | 터치 영역 최소값 40px (≈6.3mm) | 버튼 간 간격(터치영역 포함) 최소 8~16px (≈1.3–2.5mm) | Live example diagram on a real header mockup: bell/theme icons measured at 50 (touch box) / 34 (icon) / 8 (gap) |
| 03. 아이콘 버튼 | 아이콘 자체 크기 16~24px (≈5.4mm listed — likely a copy-paste from case 02's physical-size column, see gotcha below) | 터치 영역 최소값 36px (≈6.3mm) | 최소 8~16px (≈1.3–2.5mm) | |
| 04. 체크버튼 | 아이콘 자체 크기 16~24px | 터치 영역 최소값 36px (≈6.3mm) | 최소 8~16px (≈1.3–2.5mm) | Table is **identical** to case 03's — 체크버튼 gets no distinct sizing rule, just inherits the icon-button spec |
| 05. 리스트/카드 내 아이콘 버튼 | 아이콘 자체 크기 20~24pt (≈3.2–4.0mm) | 터치 영역 최소값 36px (≈5.7mm) | 8~12px 권장(터치영역 포함) (≈1.3–1.9mm) | Repeats the case-02 principle: *"카드나 리스트 내부에서 메인 액션은 하나로 제한하거나, 부가 기능은 '더보기' 메뉴 등으로 분리하는 것이 좋습니다."* + same Facebook/Instagram/YouTube footnote as section 02 |

**Gotcha**: case 03's "물리적 크기" column shows "약 5.4mm" for a 16–24px icon, which is the same mm value shown for case 02's 34px icon — these two rows almost certainly aren't both correct (px→mm conversion should scale with the px value). Treat the **px/pt columns as authoritative** (directly stated in the guide) and the mm column as a secondary, possibly-miscalculated convenience conversion — don't cite the mm figures as precise engineering specs without cross-checking.

**Also note**: unit is inconsistent across rows — some rows use `pt` (FAB, 리스트/카드 icon), others use `px` (nav, icon button, check button touch mins and gaps). Match whichever unit the specific case uses; don't assume they're interchangeable 1:1 in this guide (though pt≈px is a common assumption at 1x density, the guide doesn't state a density assumption explicitly).

## How this feeds BUILD mode

When generating or reviewing NH MTS screens (via `csdesign` → `nds/LEADER.md` Mode 2), apply these minimum touch-target sizes before treating any tappable element as done:
- Any bottom-right FAB: 52pt button = 52pt touch area, ≥16pt margin from screen edges.
- Header/nav icon buttons (back/close/bell/etc.): ≥40px touch box around a 34px icon, ≥8px gap between adjacent buttons.
- Generic icon buttons and check buttons: ≥36px touch box, ≥8px gap.
- Icon buttons inside list rows/cards: ≥36px touch box, ≥8–12px gap, and **only one primary tappable action per row/card** — route secondary actions through a "더보기" (more) menu instead of stacking multiple independent hit targets in one row.
- Design for one-handed thumb reach: primary actions bottom-anchored/center, not scattered near the top of the screen.
