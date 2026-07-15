---
name: nds-tpl-step-timeline
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=11153-18299"
learned_date: 2026-07-15
sections_studied:
  - "11153:18299 (canvas '    - Step Timeline 스텝, 타임라인✔️' — one page, two title groups: '타임라인' and '스텝')"
  - "17161:3246 / 17913:7227 (title frames, plain Korean headings + 'QV-NM Template Guide' subtitle — no ✔️ or stamp on-canvas)"
  - "17506:6182 / 17742:8433 / 17742:1976 (타임라인 바로가기형 / 타임라인 상세설명형 / 타임라인 기본 — full vertical numbered-step timelines, 3-5 steps each, connector lines between numbered circles)"
  - "17907:15186 (상단 스텝 기본 — contains a `step_header` instance, the compact header-row step indicator)"
  - "17845:1174 / 17887:14206 / 17933:2329 (step_팝업컨트롤 기본_01 / 이미지포함_01 ×2 — popup-based step-control variants with inline 3-step mini stepper 'stepUI')"
status: internal NDS component-library guide (Templates file — usage-example gallery, not an asset-swatch sheet)
---

# NDS Templates — Step Timeline (스텝, 타임라인)

Page groups two related but visually distinct constructs under one canvas: a **full vertical step-timeline** (numbered circle + connector line + label + optional description/CTA/notice, repeated per step, scrollable body content) shown in 3 example screens (타임라인 바로가기형/상세설명형/기본), and a **compact step_header** (numbered circle + trailing dot row in a single header bar) shown once (상단 스텝 기본). A third family — inline 3-step "stepUI" mini-steppers embedded in bottom-sheet popups (step_팝업컨트롤 기본_01 / 이미지포함_01 ×2) — is hand-composed (frames "step1/step2/step3" + `nds_icon_step` instances + vector connector lines), not an instance of either indicator component.

## ANSWERS to assigned questions

**(1) The ✔️ in the page name — UNEXPLAINED.** Screenshotted both title frames (`17161:3246` "타임라인", `17913:7227` "스텝") — each shows only the plain heading text and "QV-NM Template Guide" subtitle, no stamp, badge, version note, or reviewer mark. No other text node on the page (checked via metadata: all labels are generic demo copy — "단계에 대한 설명입니다.", "타이틀", "예외) 인증에서만 사용") reads as an explanation. **No on-canvas evidence found; the checkmark is unexplained** — consistent with the skill's warning not to invent a meaning.

**(2) `step_header` overlap with Indicators — PARTIALLY RESOLVED, same concept confirmed distinct from the timeline.** `step_header` appears once on this page (`17907:15186` "상단 스텝 기본" → instance `17907:15215`). Sampled via explicit node ID: resolves to `step_header` = key `bf51d607adbf521531ba3f06f380ea13bc5ea916` (COMPONENT, remote: true), **standalone — no parent SET** — the **same key and same standalone-COMPONENT resolution** as the Indicators page's `bf51d607…` instance (not the `d0102f9f…`/SET-member side of that page's duality). This page does not independently reproduce the SET-member resolution, so the duality itself remains **not fully resolved** — but it adds a second independent sighting confirming the standalone-COMPONENT form is real and in active use (not a one-off anomaly). **"Step" is NOT the same concept as Indicators' step_header usage**, despite sharing the exact component: here `step_header` is used only as a compact **top-of-screen progress marker** (one frame, paired with `header_basic`+`statusbar`), while the page's actual subject — the **timeline** (타임라인 바로가기형/상세설명형/기본) — is a structurally different, much larger hand-composed construct (numbered circles + connector lines + per-step labels/descriptions/CTAs/notices, all visible at once, no SET/COMPONENT wrapping the whole timeline — each `step1..step5` is a plain frame). Confirmed via screenshot (`st_timeline1.png`, `17506:6182`): 4 visible steps, green numbered circles (1-4), vertical connector line between them, step 2/3 carry an expandable "상세, 안내 이동에 사용합니다" row. So: Indicators' `step_header` = compact progress widget; this page's "timeline" = full step list — genuinely different components serving the same "step" concept at different densities, both legitimately named "step" without being interchangeable.

## Names — reliable (with one caveat)

Instance layer names read directly as their component (`step_header`, `nds_icon_step`, `header_basic`, `statusbar`, `btn_bottom_page` all resolved to components literally named the same). Inner step frames are named descriptively (`step1`..`step5`, `step popup`, `notice`, `유의사항_Content`) and match their on-canvas role. Caveat: frame names collide across sibling top-level frames without disambiguation — two different popups are both named `step_팝업컨트롤 이미지포함_01` (`17887:14206` and `17933:2329`), distinguishable only by node ID, not name — consistent with the file-wide layer-name unreliability the skill warns about, though instance→component resolution itself was accurate everywhere sampled.

## Component keys (Gotcha 5 — kind reported)

Sampled via 5 explicit node IDs (no page-wide sweep; a first attempt using a loop over 5 IDs in one script threw `"Operation attempted to modify the file while in read-only mode"`, confirming the skill's warning that sweeps are unreliable — retried as 5 separate single-node calls, all succeeded):

| Instance node | name = key (kind, remote?) | parent SET key |
|---|---|---|
| `17907:15215` | `step_header` = `bf51d607adbf521531ba3f06f380ea13bc5ea916` (COMPONENT, remote: true) | **none — standalone COMPONENT, no parent SET** (matches Indicators' standalone sighting exactly) |
| `17742:1944` | `nds_icon_step/Channel=NM, Step=04` = `5748afa1edc26777928789334184c2c7ea10c4bb` (COMPONENT, remote: true) | `nds_icon_step` (SET) = `be9d70861f0510a5ea083d0c20360aafae7f4c56` — new component, not seen on other learned pages yet |
| `17506:6185` | `header_basic/Channel=NM, Left Icon=on, Right Icon=off` = `c7706f72a18d458759548113071367745adc8d96` (COMPONENT, remote: true) | `header_basic` (SET) = `c95043e94317fde7230298017f42dd8099e1cbdc` — **matches Core exactly, corroborates again** |
| `17845:1210` | `btn_bottom_page/Channel=btn_bottom_layerpopup, Type=btn_bottom_page, Status=NM` = `3ef42b8dfd48baf9ff4c1572dd2a4de8264bfee7` (COMPONENT, remote: true) | `btn_bottom_page` (SET) = `accfb243ce752fd894af2b6db081b1074022a39d` — **matches Core's `btn_bottom_page` (not `_assets`) exactly** |
| `17506:6231` | `statusbar/Type=NM, Dark mode=false` = `169d23c202bd4e85398ceafdf264d6fa19eb1cbf` (COMPONENT, remote: true) | `statusbar` (SET) = `fe57c685f5a27a53c49fc56c9999456340140c2f` — **matches one of Core's known ≥5 `statusbar` collision keys (the `9665:20994` sighting)** |

All 5/5 sampled remote: true, consistent with Q4 (NDS_Templates subscribes to NDS_Library).

## Blanks / gaps

- No written usage rules found on this page — pure composition/usage-example gallery (Gotcha 7 confirmed again): no max-step-count rule beyond the demo copy "최대 5단계!" (max 5 steps) baked into placeholder text on 3 frames — this reads as a real constraint but is only ever stated as filler copy, never as a labeled spec field.
- `step_header`'s standalone-vs-SET-member duality (flagged by Indicators) is not resolved on this page either — only the standalone side recurs here.
- The "예외) 인증에서만 사용" (exception: used only in authentication) label on `17845:1174`'s title frame suggests the popup-stepper variant is scoped to auth flows only, but no further written rule accompanies it.
- Page-wide instance sweep not attempted (read-only risk, confirmed unreliable); only 5 explicit-node-ID instances sampled. Other `nds_icon_step` step numbers (01-03, 05+) and other `header_basic`/`statusbar` variants on this page not individually sampled.
