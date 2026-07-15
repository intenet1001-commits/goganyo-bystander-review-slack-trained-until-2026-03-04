---
name: nds-tpl-chart
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=15260-2524"
learned_date: 2026-07-15
sections_studied:
  - "15260:4636 (title frame — on-canvas 'Chart' / 'QV-NM Template Guide', matches page name)"
  - "15260:2563 / 15260:2653 / 15260:2736 / 15260:2815 / 15260:8724 / 15260:2901 / 15260:11957 / 15260:2995 / 15260:8880 / 15260:3068 / 15260:3147 / 15260:3230 (chart_pie01–04_nm/_qv — 12 donut-chart screen mockups: 디폴트옵션 선정, 통합연금 자산현황, 글로벌 자산배분 variants, demonstrating 4 legend layouts per section-header text: 상품명/수익률표시, 오른쪽범례, 아래범례, 범례리스트)"
  - "15287:1440 (text header 'Guage Chart 게이지차트') + 15286:1120 / 15286:1300 (frames literally named 'chart_pie05_nm' but positioned directly under the Gauge header and showing a semicircular gauge, not a pie — layer name mismatch, screenshot-confirmed)"
  - "31761:3624 (text header 'Line Chart', no directly-following frame) + 31765:5014 / 31765:5017 ('[NM] 큰손 수익률 보드 상세' popup, containing the only line-chart instance on the page)"
sections_studied_note: "'Line Chart' and 'Guage Chart' have NO dedicated component-swatch frames of their own — their only visual evidence sits inside unrelated-named screen mockups positioned nearby on the canvas."
status: internal NDS component-library guide (Templates file — usage-example gallery, not an asset-swatch sheet)
---

# NDS Templates — Chart 차트

Title frame confirms page name ("Chart" / "QV-NM Template Guide"). Three section-header **text** labels exist at x=-2831 in a vertical stack — "Pie Chart 파이차트" (y=-1171), "Guage Chart 게이지차트" (y=1285), "Line Chart" (y=3013) — but only the Pie Chart section has frames whose layer names actually match ("chart_pieNN_nm/_qv", 12 instances). **The other two sections are net-new evidence, not net-new components**: the Gauge header sits directly above two frames literally named `chart_pie05_nm` that screenshot as a semicircular gauge (수익률 현황, 현재/기대 수익률) — a repeat of this file's known layer-name-lies pattern, this time swapping chart *type* not just number. The Line Chart header has **no frame at all beneath it**; its only real evidence is one line chart embedded inside a "큰손 수익률 보드 상세" popup (`31765:5017`) — a comparison of 스탠리 드러켄밀러 (red line/diamond markers) vs S&P500 (gray line/circle markers), 10%/0%/-10% y-axis.

## Component keys — sampled via explicit node IDs (5/5 succeeded on retry after one read-only throw)

| Instance | main COMPONENT key | remote | parent SET name | parent SET key |
|---|---|---|---|---|
| `15279:770` chart_pie (`Percent=on, Legend=4`) | `014eb17f5431567a9b8c999e4ef248b3696acadf` | true | `chart_pie` | `37223b19d81f1a1f965ee72efac073983cd17c5d` |
| `15260:2894` btn_txt_arrow | `1ba950291fbc70787b8f727e88c26d8c71f0cad5` | true | `btn_txt_arrow` | `bc0399bb33f9213ff99482a43345a0aaaa3e070c` |
| `15286:1122` toggle_txt (gauge frame) | `dc6b0a457dab6ccc8d77414c7c21e8406d610c9b` | true | `toggle_txt` | `b24f3ce689ce24cdccae8d20ddd0f72f75944f8a` |
| `15260:2647` statusbar | `169d23c202bd4e85398ceafdf264d6fa19eb1cbf` | true | `statusbar` | `fe57c685f5a27a53c49fc56c9999456340140c2f` |
| `15260:2648` header_basic | `c7706f72a18d458759548113071367745adc8d96` | true | `header_basic` | `c95043e94317fde7230298017f42dd8099e1cbdc` |

`header_basic` SET matches Core exactly (further corroboration). `statusbar` SET matches `nds-tpl-layout`'s `fe57c685…` sighting exactly (same distinct key, not Core's `169d23c2…`-family). **`chart_pie` is a genuine published COMPONENT_SET, `remote: true`** — this is the pie/donut chart component itself, not previously seen in Core. Note: `chart_pie` the component and `chart_pie01–05_nm/_qv` the frame *names* are different things — the frames are composed screens using `chart_pie` instances, not the SET itself.

## ANSWERS

**Chart types present:** donut/pie (`chart_pie` SET, published), gauge (unnamed as such — lives under mislabeled `chart_pie05_nm` frames), line (no component at all — hand-drawn inside one screen popup, no swatch/demo of its own).

**Red-up/blue-down honoured?** Not by the chart marks. Pie/donut and gauge slices use a fixed **categorical** palette (blue/green/orange/yellow) for portfolio-composition shares — correct, since composition isn't directional data. The line chart's two series are colored **red (highlighted/subject) vs gray (benchmark)** — a series-differentiation choice, not the price-direction rule. The *only* place the convention appears is the standalone rate text next to the line chart (`+000.00%`, `+2.97%`, both red) — consistent with the UX Guide's +/- system (red=up, standalone rate, plus-sign kept) — but that's copy, not the chart itself.

**Series/axis colours stated or only shown?** Only shown. Zero prose rules found anywhere on this page — no legend-color spec, no axis-color spec, no chart-type-selection guidance — matching the gallery-only pattern of every other Templates page learned so far.

**Contrast concern:** the line chart's `10%`/`0%`/`-10%` axis labels render as small light-gray text on white — a plausible sub-4.5:1 risk per `nds-ux-guide-color-contrast`, **not measured this pass** — flag for a dedicated contrast check if this chart is reused.

## Blanks / gaps

- **No dedicated Gauge or Line Chart component/frame exists on this page** — both section headers are effectively pointing at nothing of their own; the content found is incidental (embedded in unrelated screens). Escalate if a designer expects standalone swatches here.
- No written chart-selection or color-usage rules (e.g. "use pie for composition, line for trend") — gallery-only, consistent with sibling Templates pages.
- Legend-layout taxonomy (4 named types: 상품명/수익률표시, 오른쪽범례, 아래범례, 범례리스트) is implied by section-header text only, not spelled out as a rule.
- One data inconsistency noticed (not chased further): `chart_pie04_nm`'s legend rows show 40/20/20/20% while its pie slices show 40/30/20/10% — placeholder-data drift, not a component defect.

## CORE

Add `chart_pie` (SET `37223b19d81f1a1f965ee72efac073983cd17c5d`, remote) to Core's component table — first chart component confirmed published. Do NOT add "gauge" or "line chart" as components — neither has one on this file.
