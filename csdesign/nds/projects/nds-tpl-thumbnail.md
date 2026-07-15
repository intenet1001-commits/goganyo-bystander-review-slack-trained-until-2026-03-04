---
name: nds-tpl-thumbnail
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=16889-4317"
learned_date: 2026-07-15
sections_studied:
  - "16889:4317 (title frame '- Thumbnail 썸네일' — on-canvas 'Thumbnail' / 'QV-NM Template Guide')"
  - "16891:4338 / 25602:3149 / 37275:29871 (540x270 base KakaoTalk share thumbnails — 기본형/차분이/나무팡/썸네일_N2 themes)"
  - "17884:9498 (NM) / 17884:9494 (QV) (800x600 알림톡 card templates — 선물하기 gift-arrival card, NM vs QV channel)"
  - "25602:2986 (차트분석 AI) / 21918:562 (투자컨텐츠 공유) (540x1200 alarm-talk mockup symbols)"
  - "21919:763 / 21919:781 (링크공유_NM, 540x1200 — thumbnail composed into a KakaoTalk link-share bubble)"
  - "21919:962 / 21919:977 (NM_mock up / QV_mock up, 540x1171 — final rendered chat-bubble mockups)"
status: net-new — no Core entry existed prior to this pass
---

# NDS Templates — Thumbnail 썸네일

Single-page usage gallery (title on-canvas: **"Thumbnail" / "QV-NM Template Guide"**) for KakaoTalk share/알림톡 (notification-message) assets: 540×270 base share thumbnails across 5 named themes (기본형, 차분이, 나무팡, 선물하기, 투자컨텐츠), plus 800×600 알림톡 card templates (gift-arrival "선물이 도착했어요!", chart-analysis AI card, investment-content card), all shown composed inside realistic KakaoTalk chat-UI phone mockups (540×1200/1171 frames) rather than as isolated swatches.

## ANSWER — asset dump, not a component/variant system

This is the **same genre as `nds-mweb-illusts`**: a curated set of finished creative assets (Kakao share/알림톡 imagery) with a filename-handoff purpose, not a reusable NDS component with variant axes. `get_metadata` shows FRAME/TEXT/VECTOR/RECTANGLE trees and a handful of SYMBOL/INSTANCE nodes (`thumbnail_NM`, `thumbnail_N2`, `차트분석 AI`, `투자컨텐츠 공유`, `Frame 125412`, plus instances `su`/`NM`/`QV`) — no `Property 1` variant axis, no COMPONENT_SET anywhere on the page. Every image sampled (namuh-logo card, gift-wrap illustration, chart-analysis AI bot, investment headline card) is **real finished art**, not a placeholder/blank state.

## Sizes / ratios

- **540×270** (exactly 2:1) — base share thumbnail, the unit reused across `썸네일_NM`, 나무팡, `썸네일_N2`.
- **800×600** (4:3) — larger 알림톡 card template (gift/chart-AI/investment cards), rendered at ~366×274 inside the final chat-bubble mockups (same 4:3 ratio, scaled down).
- **540×1200 / 540×1171** — full KakaoTalk phone-screen mockup frames wrapping the assets above; these are device-context canvases, not an asset ratio.
- No explicit on-canvas cropping/ratio **rule text** found (contrast `nds-mweb-illusts`'s stated view-icon fixed-ratio rule) — the 2:1 and 4:3 sizes are demonstrated by example only, never stated in prose.

## Fallback / placeholder state

None found. Every sampled frame carries finished illustration + real Korean copy (e.g. "선물이 도착했어요!", "AI 차트분석 결과가 도착했어요.", "투자, NH와 똑똑하게"). No blank/gray placeholder swatches like `nds-mweb-illusts` would show for an unassigned slot.

## Layer names — UNRELIABLE on this page (new finding)

Five duplicate text nodes (`16889:4321`, `25602:3184`, `16889:4323`, `17884:9010`, `21918:561`) all share the identical layer name **"토스트/체결알림 정의"** (Toast/execution-alert definition text) — a name that belongs to a *different* NDS_Templates page (`nds-ux-guide-nudge`/alarm territory). Screenshot-confirmed one instance (`16889:4321`) renders **"차트분석 AI"** on canvas — completely unrelated to its layer name. This is a stale copy-paste artifact, not per-column labeling. **Per the per-page convention, this page's verdict is unreliable** — do not trust text-node names here; screenshot every label.

## Blanks / gaps

- `getMainComponentAsync()` threw `"Operation attempted to modify the file while in read-only mode"` on every sampled instance (`18705:546` su, `21919:976` NM, `21919:992` QV) — **zero keys/tiers captured**, needs a write-capable re-check. All would-be keys are `unverified — read-only session`.
- No prose usage rules found anywhere on the page (asset-gallery only, consistent with `nds-tpl-list`/`nds-tpl-data-table`).
- A few deeply nested decorative vectors inside the gift-illustration group are `hidden="true"` (e.g. `17884:9540`–`9543`) — incidental art layering, not a content gap; not quoted as rules.
