---
name: nds-ux-guide-color-contrast
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=3745-6193"
learned_date: 2026-07-15
reviewed_date: 2026-07-15
sections_studied:
  - "3745:6222 (cover/INDEX page — lists the guide's 3 sections: 01/02/부록. NOT rule content itself — corrected 2026-07-15, the first pass mislabeled this node as the '01' rule section)"
  - "4037:6431 (this is the real '01 명도대비(웹접근성)란?' section — corrected 2026-07-15, the first pass mislabeled this node as '02 적용 예시')"
  - "4040:10209 (this is the real '02 4.5:1 적용 필요 예시' section — corrected 2026-07-15, the first pass mislabeled this node as '03')"
  - "4040:10254 (부록. 피그마로 명도대비 확인하는 법)"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as design-rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — 색상 명도대비 (Color Contrast)

Part of the NDS_UX Guide file's "색상 명도대비" canvas — the design team's internal accessibility/contrast rulebook. This is a **rules document**, not a product screen: use it to validate/generate color choices, not as a layout or flow reference (that's `csdesign/asset`'s job).

**Re-reviewed 2026-07-15** against the live Figma file (`get_metadata` + `get_screenshot` on all 4 sections). Found one real numeric error and a section/node-ID mislabeling from the first pass — both corrected below. The rule content itself (4.5:1 / 3:1 / label exception) was substantively accurate; the mistakes were in *which node holds which section* and *one transcribed ratio digit*.

**Root cause of the node-ID mixup**: this file's internal Figma frame layer names (`"01"`, `"2"`, `"3"`) do **not** match the on-canvas section number the frame actually displays (real section "01" lives in the frame Figma calls `"2"`, etc.) — the INDEX/cover frame is itself internally named `"01"`, which is what led the first LEARN pass astray. **When learning a guide file with a numbered index, don't assume the layer name matches the visible section number — always screenshot the frame and read its actual on-canvas heading before writing `sections_studied`.**

## The rule (WCAG 2.0-based)

- Text/content vs. background contrast must be **≥ 4.5 : 1** as a general baseline (page titles, section titles, body text, button labels).
- Exception — **large or bold text**: minimum drops to **3 : 1**. Verbatim: *"※ 크거나 굵은 글자는 조금 더 대비가 약해도 괜찮아요. 이 경우는 최소 명암 비율 3:1 을 충족해야 합니다."*
- Exception — **labels (보조정보/secondary info elements), app-only**: minimum drops below 4.5 : 1 is allowed, but **only in-app**. On the homepage/website, every piece of content must still meet 4.5 : 1 — no exception there. Verbatim: *"※ 보조정보 요소인 라벨의 경우, 앱에서만 예외적으로 명도 대비 4.5 : 1 미만을 허용합니다. 홈페이지의 모든 콘텐츠는 명도 대비 4.5 : 1 이상을 반드시 만족해야 합니다."*
- Source cited in the guide, verbatim: *"이 기준은 WCAG 2.0* 이라는 웹접근성 규칙에 들어 있어요. "글자(콘텐츠)와 배경의 밝기 차이는 최소 4.5 : 1 이상이어야 한다.""* (footnote: *"*WCAG: 웹 콘텐츠 접근성 가이드라인 (Web Content Accessibility Guidelines)"*). **Added 2026-07-15**: the accompanying balance-scale icon graphic on this page labels the reference book **"KWCAG 2.0"** (not plain "WCAG"), suggesting the guide is actually citing the Korean-adapted WCAG standard even though the body text just says "WCAG" — worth using "KWCAG 2.0" if precision matters in generated copy.
- **Added 2026-07-15** — the guide states *why* the rule exists, which the first pass omitted entirely: *"눈이 나쁜 사람은 연한 회색 글자를 밝은 배경에서 보면 글자가 있는지 없는지조차 잘 안 보일 수 있어요. 명도 대비 기준은 이런 사용자를 돕기 위한 약속 같은 규칙이에요."* (low-vision users may not be able to tell text from background at all if contrast is too low; the standard exists as a shared promise to protect them). Useful framing if asked to justify a contrast fix to a stakeholder, not just cite the number.

## Applied examples (section "02 4.5:1 적용 필요 예시" — node `4040:10209`)

Intro line, verbatim: *"일반적인 콘텐츠(본문, 제목 등)는 모두 명암 비율 4.5 : 1 을 충족해 주세요."*

Shown as pass/fail pairs (✅ green check vs ❌ red x badge, each tagged with its measured ratio) across four content categories:

| Category | Pass example ratio shown | Fail example ratio shown | Note |
|---|---|---|---|
| 페이지 제목, 섹션 제목 (page/section title) | **11.69:1** (corrected 2026-07-15 — first pass misread this as 11.89:1; re-confirmed via a cropped high-res re-screenshot of the exact badge node `4041:48184`) | 2.99:1 | |
| 본문 텍스트 (body text) | 5.74:1 | 2.84:1 | |
| 버튼 안의 글자 (button label) | 7.88:1 | 2.84:1 | |
| 라벨 (label) | 4.88:1 | 3.09:1 | app-only exception applies here — see rule above |

Pattern to reuse when generating/reviewing NH screens: every text-on-background pairing gets a small pill badge in the corner showing its measured ratio plus a pass/fail icon — a useful convention to replicate in any contrast-audit output for this design system. Note: these ratio badges are baked into pasted screenshot images (`rounded-rectangle` nodes literally named after macOS screenshot filenames like `스크린샷 2026-01-12 오후 2.47.50 1`), not live Figma text — **when re-verifying this section in the future, the numbers must be read from a screenshot, not searched for in `get_metadata` text**, since they won't appear there.

## How designers verify contrast in Figma (Appendix — node `4040:10254`)

Workflow documented for the team's own Figma usage: select the object → open the Fill color picker → the picker itself shows a live contrast ratio readout (e.g. "2.39 : 1") plus an AA pass/fail badge next to a contrast-checker icon toggle in the picker's top-right. Clicking that icon (dual-tone circle icon) opens a mode that lets you pick a contrast-compliant color directly against the existing background — "콘텐츠 유형 설정" (content-type setting) then "눌러서 명암비 충족하는 색상으로 바로 변경 가능" (tap to switch directly to a compliant color). Two example swatches shown: `#BAA2A2` (2.39:1, fails — icon shows a crossed-circle/no-entry glyph) vs `#AC2A2A` (6.73:1, passes AA — icon shows a filled dual-tone circle + green "✓ AA" badge). **Re-verified 2026-07-15 — both hex values and ratios confirmed exactly as originally logged, no correction needed here.**

## How this feeds BUILD mode

When generating or reviewing NH MTS screens (via `csdesign` → `nds/LEADER.md` Mode 2, or directly), apply the 4.5:1 / 3:1(large-bold) / label-in-app-exception rules above to any new text/background color pairing before treating a screen as done — this is a hard design-system rule, not a suggestion, per this guide.
