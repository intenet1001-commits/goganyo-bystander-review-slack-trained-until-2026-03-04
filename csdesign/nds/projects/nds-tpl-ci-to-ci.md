---
name: nds-tpl-ci-to-ci
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=24156-43629"
learned_date: 2026-07-15
sections_studied:
  - "24156:43629 (page canvas '    - CI to CI' — on-canvas title text 24156:43721 'CI to CI (전송) 화살표 Case')"
  - "24156:43691 이체_이체확인 (popup, 일반형 variant — transfer-confirm sheet, 카카오뱅크 CI icon » NH투자증권 CI icon)"
  - "24156:43763 실물이전 가능여부조회_타사to당사_결과상세 (full screen, 강조형 variant — 신한투자증권 CI icon » NH투자증권 CI icon, result screen)"
  - "24156:43924 / 24156:43929 ss_img_arrow_rebalancing (the '화살표' — arrow instance placed between the two CI icons in both variants)"
status: internal NDS component-library guide (Templates file — single composition-spec page, not a prose rules source)
---

# NDS Templates — CI to CI

Small single-topic page (title on-canvas: **"CI to CI (전송) 화살표 Case"** = "CI to CI (transfer) arrow case"). Two composed mock screens side by side, labeled **일반형** (general/basic type) and **강조형** (emphasis type), each demonstrating the same layout spec: two circular company-logo icons connected by an arrow glyph, used atop a money/asset-transfer screen.

## ANSWER — "CI to CI" MEANS: two Corporate-Identity (company logo) icons joined by an arrow — NOT a rebrand, NOT 연계정보

On-canvas evidence is unambiguous once screenshotted:

- **일반형** popup (`24156:43691`): a small blue circular icon (카카오뱅크 CI mark) → arrow (»»») → a small yellow circular icon (NH투자증권 CI mark), above copy "이아라 님께 123,456,789원을 보낼까요?" with 보낼 계좌 `NH투자증권 1002-652-773427` / 받을 계좌 `카카오뱅크 3333-16-1234567` — a **money-transfer confirm sheet between two different financial institutions**.
- **강조형** screen (`24156:43763`), header "실물이전 가능여부 결과": a blue circular icon (신한투자증권 CI mark) → arrow → a yellow circular icon (NH투자증권 CI mark), body copy "신한투자증권에서 당사로의 이전이 가능해요! 모든 상품을 실물이전 할 수 있어요." — a **securities in-kind-transfer (실물이전) result screen between two brokerages**.
- The arrow itself is a real component instance named `ss_img_arrow_rebalancing`, reused generically as the transfer-direction glyph (its own name is a misnomer here — nothing on this page is about rebalancing).

**Verdict: `CI` = Corporate Identity — but as a literal small circular company-logo/brand-mark icon, not as an abstract "rebrand" concept.** This is the **narrower, correct reading of option 1** from the assignment: the page is a **layout spec for placing two institution CI icons + an arrow** (source-institution logo → destination-institution logo) atop transfer/in-kind-transfer screens — it demonstrates the pattern generically across two different institution pairs (카카오뱅크↔NH투자증권 in one variant, 신한투자증권↔NH투자증권 in the other), **not** a specific old-brand→new-brand (NH→N2) migration screen, and **not** `연계정보` (Connecting Information/CI-as-국가 identity key) — no 연계정보, 본인인증, or KYC-linking language appears anywhere on the page. "CI to CI" reads as engineering shorthand for "[institution] CI icon → [institution] CI icon."

## Layer names — mixed on this page

- Frame names accurately describe content: `이체_이체확인` (transfer/transfer-confirm) → is exactly a transfer-confirm popup; `실물이전 가능여부조회_타사to당사_결과상세` (in-kind-transfer availability check, other-company-to-our-company, result detail) → is exactly that result screen. **Reliable at the frame level.**
- Text nodes are **unreliable**: the account-detail rows (보낼 계좌 / 받을 계좌 / 수수료 labels+values) are all named the generic placeholder `faq`, unrelated to their rendered content — confirmed via screenshot (`24156:43693`). Same generic-name pattern as `Frame 10083`/`Frame 125489`/`Frame 10029` (Figma auto-names, non-descriptive).
- **Verdict: mixed** — frame-level names trustworthy, leaf text-node names not.

## Component keys — genuine COMPONENT_SETs, `remote: true`

5 explicit node IDs checked, one `use_figma` call each (no loop) — **note: a page-context call combining all 5 in one script with `setCurrentPageAsync` first hit "read-only mode" write-block; per-node calls without a page switch succeeded**:

| Instance | main COMPONENT name | main key | remote | parent SET | parent SET key |
|---|---|---|---|---|---|
| `24156:43924` ss_img_arrow_rebalancing | `Property 1=light gray` | `dee18120306846e9f2ac157f43a521006dd2dbd6` | true | `ss_img_arrow_rebalancing` | `2e6816ad4da52665ab780195b2727a3d1d79d84f` |
| `24156:43716` btn_bottom_page | `Channel=NM, Type=1:2-btn, Status=normal` | `eb938394abc4b72887b67d9ab130f7ea017647b1` | true | `btn_bottom_page` | `accfb243ce752fd894af2b6db081b1074022a39d` |
| `24156:43810` 유의사항_Title | `더보기=off` | `c345f91c2653a80101b33d25e41985d12997fd71` | true | `유의사항_Title` | `59151dbe888eb21d90fc8497b7af037572e9bac1` |
| `24156:43821` statusbar | `Type=Clear, Dark mode=false` | `419379268eb08b270314d5359b72f73961f38204` | true | `statusbar` | `b4d07422e1eedeb9f1ae4b831e905357e54b01a6` |
| `24156:43816` icon_comm_complate/warning | `Channel=NM,  Result=Success` | `0b9f750308985c6e6324d495ec198024c2908143` | true | `icon_comm_complate/warning` | `bd8e167c6f55b50541eaafb51cd867468da3af7b` |

All 5 confirmed INSTANCE type first, all resolve to real COMPONENT_SETs, all `remote: true` — corroborates Q4 (NDS_Templates subscribes to NDS_Library), no doc-copy rivalry.

## Taxonomy / reactions

- Both top-level artifacts (`24156:43691`, `24156:43763`) checked for `.reactions`: **zero on both** (`reactions: []`). No prototype links found — consistent with every other page probed under this question; no counter-example found here either.
- Page is a **composition/pattern spec artifact** (two side-by-side variant mocks demonstrating one icon-arrow-icon layout rule), not a flow — no sequential screens, no prototype wiring between the two variants or between the popup and the full screen.

## Blanks / gaps

- No prose rules text found anywhere on the page — the "spec" is entirely implicit in the two composed screenshots (icon size/spacing/arrow placement must be inferred visually, not read from a caption).
- Page-wide instance sweep not attempted (read-only session risk) — only the 5 explicit IDs above key-verified.
- Combining page-switch + multiple `getMainComponentAsync` calls in one script triggered a read-only write-block error; splitting into single-node, no-page-switch calls avoided it — worth noting for future sessions on this file.
