---
name: nds-tpl-indicators
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=271-12615"
learned_date: 2026-07-15
sections_studied:
  - "271:12615 (canvas '    - Indicators (pagination, step)' — one page, two indicator families: carousel-dot pagination + wizard step_header)"
  - "12568:2287 / 12568:2475 / 15103:741 (상단강조형 / 카드형 / 상단 배너형 — pagination01 in a card-carousel context)"
  - "12572:1047 / 12592:2848 / 12573:3642 / 12576:808 (배녀형A / 배너형B / 나무멤버스_시장체크 / 컨텐츠형 — pagination01 in banner/content-carousel contexts)"
  - "18159:4194 / 27416:8924 (스텝 기본화면 / 스텝 텍스트 Over하면 흐르게 — step_header instances)"
  - "12568:4144 / 15103:746 / 18159:4190 (title frames: 'Card Pagination', 'Banner Pagination', '스텝')"
status: internal NDS component-library guide (Templates file — usage-example gallery, not an asset-swatch sheet)
---

# NDS Templates — Indicators (pagination, step)

Single-page usage gallery for two visually and componentwise **distinct indicator families** composed into 8 example screens: a carousel/pagination-dot indicator (`pagination01`, used in 7 composed frames: 상단강조형, 카드형, 상단 배너형, 배녀형A, 배너형B, 나무멤버스_시장체크, 컨텐츠형) and a wizard/step indicator (`step_header`, used in 2 frames: 스텝 기본화면, 스텝 텍스트 Over하면 흐르게).

## ANSWER — what indicator types exist

1. **`pagination01`** — dot-carousel position indicator (small horizontal row of equal-size dots, one enlarged/active). Confirmed sampled on 3 of the 7 composed frames, all resolving to the **same** variant (`Step=4`), same key — the gallery demonstrates *placement contexts* (top-of-card, banner overlay, content-card row), not a variant sweep. Screenshot (`상단강조형`, `id_1.png`) shows: white card + 4-dot row centered below it, active dot wider/filled. Also seen inside a banner image (`상단 배너형`) and as a plain dot row under ranking-card text (배녀형A/B).
2. **`step_header`** — wizard/step progress indicator, visually and structurally different from pagination: a **numbered green circle** ("1") + trailing row of smaller gray dots, right-aligned in a labeled header row (label text e.g. "스텝명" on the left). Screenshots (`id_4.png`, `id_5.png`) confirm this. The second example screen (`스텝 텍스트 Over하면 흐르게`) exists specifically to demonstrate label-text overflow/scroll behavior when the step-name label is too long ("텍스트가 범람하면 흐르는 애니메이션 효과가 들[어갑니다]" — text truncated in the frame, verbatim as far as visible) — a UI-behavior note, not a written rule.

These are **not the same component and not interchangeable**: `pagination01` = passive carousel position marker (no numbering, no label); `step_header` = active multi-step progress marker (numbered, labeled, paired with a header row).

## Overlap with the separate "Step Timeline" page — flagged, not resolved

This page's `step_header` component (numbered circle + dots, used to show step *N of M* progress in a labeled header) shares the word "step"/스텝 with the unlearned page `- Step Timeline 스텝, 타임라인✔️` (`11153:18299`). **Not confirmed whether they're the same concept.** `step_header` here reads as a compact **header-row step indicator** (numeral + dots, no visible timeline/connector graphic, no per-step labels beyond the current one). A "Step Timeline" name suggests a fuller multi-step **timeline** widget (potentially showing all step labels/connectors at once, not just current position) — plausibly a different, more elaborate component. **When that page is learned, cross-check its component name/key against `step_header` (`bf51d607…` standalone COMPONENT and `78bcf171…` SET) to confirm whether it's the same family, a variant, or a genuinely separate component.**

## Real family by content

Two independent families, confirmed by both visual form and componentKey:
- **Pagination family**: `pagination01` — carousel/gallery position dots. Family = card/banner/content carousels throughout the app (매매·상품 추천 카드, 배너 등).
- **Step family**: `step_header` — in-flow multi-step process header (numbered progress + dots). Family = step-based wizards/flows (신청, 온보딩 등), distinct from the carousel-pagination family despite superficial "dots" similarity.

Section header `📍 Indicators 표시자` above this page is consistent with content — unlike the sibling M.web file (where `📍 Indicators` was verified-empty), here it groups a real, non-trivial page with two indicator sub-families.

## Names — reliable

Instance layer names read directly as their component: `pagination01` and `step_header` instances both resolved via `getMainComponentAsync()` to a component/variant literally named `pagination01`/`step_header` — no mismatch found. Frame-level Korean labels (상단강조형, 카드형, 상단 배너형, 배녀형A, 배너형B, 나무멤버스_시장체크, 컨텐츠형) are real descriptive placement-context names, not gibberish or placeholder — though they are category labels chosen by the designer, not verbatim on-canvas headings (the frames' own visible text is generic demo copy like "타이틀"/"타이틀 > "). No mixed/unreliable pattern (no shared placeholder layer name across unrelated nodes) found on this page.

## Component keys (Gotcha 5 — kind reported)

Sampled via 6 explicit node IDs (page-wide sweep not attempted; first attempt threw `"Operation attempted to modify the file while in read-only mode"`, retry succeeded):

| Instance node | name = key (kind, remote?) | parent SET key |
|---|---|---|
| `12568:2310`, `12568:2521`, `15103:742` | `pagination01/Step=4` = `5231c6d93f90b11d20c8109357d668ff73452ab1` (COMPONENT, remote: true) | `pagination01` (SET) = `1f8a2fec3ced9d0ddae3c8acffc34f3520626da0` |
| `18159:4195` | `step_header` = `bf51d607adbf521531ba3f06f380ea13bc5ea916` (COMPONENT, remote: true) | **none — standalone COMPONENT, no parent SET** |
| `27416:8974` | `step_header/Property 1=flowing` = `d0102f9fe9d4fdb6c30a35bffe3c1a00d67cd42b` (COMPONENT, remote: true) | `step_header` (SET) = `78bcf171f3d164e76c52dcdee99235dad8baeda9` |
| `12568:2293` | `header_basic/Channel=clear 어두운배경, Left Icon=on, Right Icon=off` = `fd559e4ba26f0dc8b3e4c38fad628c6f18c02168` (COMPONENT, remote: true) | `header_basic` (SET) = `c95043e94317fde7230298017f42dd8099e1cbdc` — **corroborates Core again** (6th+ sighting across this file) |

**Gotcha 5 in effect on `step_header` itself**: two different-looking keys under the same instance name (`bf51d607…` vs `d0102f9fe9d4fdb6c30a35bffe3c1a00d67cd42b`) are **not necessarily rival components** — the first is a standalone COMPONENT (no `Property 1` axis, used in the "basic screen" example) while the second is one variant COMPONENT of a `step_header` SET (`78bcf171…`) with axis `Property 1` (value `flowing` seen). Plausible reading: the basic-screen instance predates or bypasses the variant set, or the SET's default/normal state just wasn't the one sampled — **not confirmed as the same vs. genuinely separate component; flagged, not resolved**, consistent with the file's established pattern of real name collisions (`header_basic`, `statusbar`, `btn_bottom_page`) needing a write-capable session to adjudicate via `importComponentSetByKeyAsync`.

`pagination01`'s SET key (`1f8a2fec…`) and `step_header`'s SET key (`78bcf171…`) are themselves distinct — confirming the two indicator types are unrelated components, not variants of one family.

## Blanks / gaps

- No written usage rules found on this page — pure composition/usage-example gallery, consistent with other NDS_Templates pages (no prose to report as blank beyond that).
- Page-wide instance/key sweep not attempted (read-only risk); only 6 explicit-node-ID instances sampled. Other `pagination01` variants (`Step=2/3/5...` etc., if they exist) not observed — all 3 sampled pagination instances happened to be `Step=4`.
- `step_header`'s standalone-COMPONENT-vs-SET-member duality (see Gotcha 5 note above) is unresolved — needs a write-capable session or a wider sample to confirm whether both are legitimately in concurrent use or one is stale.
- Text overflow/scroll behavior on `스텝 텍스트 Over하면 흐르게` is demonstrated visually (long label text starting "텍스트가 범람하면...") but the frame carries no written spec for timing/easing — an interaction demo, not a documented rule.
