---
name: nds-mweb-tab
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=319-2004"
learned_date: 2026-07-15
sections_studied:
  - "319:2004 (page '    - Tab  (진행중)' — canvas, empty bounding box 0x0; content lives in two child frames)"
  - "621:1364 (frame '1. 1depth' — on-canvas title 'Tab_1depth' / 'QV-NM Tab Design Guide'; two labeled groups: LINE, BUTTON)"
  - "621:1366 (frame 'tab_1depth_line' — 4 COMPONENT variants: Colum=2col/3col/4col Type=fixed, Type=swipe Colum=swipe)"
  - "636:3051 (frame 'tab_2depth_button' — 2 COMPONENT variants: Channel=NM, Channel=QV, each a 5-pill row)"
  - "624:1453 (frame '99. Tab_assets' — component/token reference sheet: LINE 라인형 16PT, arrow icons, gradation images, BUTTON 버튼형)"
  - "624:1510 (frame 'tab_line_16pt' — 8 COMPONENT variants: Type=fix-2col/fix-3col/fix-4col/swipe × Active=on/off)"
  - "624:1653 (frame 'tab_icon_arrow' — 3 COMPONENT variants: Type=left/down/up)"
  - "630:133 (frame 'nds_img_tab_gradation' — 3 COMPONENT variants: two named 'Type=nds_img_tab_gradation01', one 'Type=nds_img_tab_gradation02')"
  - "636:3022 (frame 'tab_btn' — 4 COMPONENT variants: Channel=QV/NM × Active=on/off)"
status: internal NDS component-library guide page, explicitly marked in-progress ('진행중') by the file itself — treat contents as provisional, not a finished spec
---

# NDS M.web — Tab (`- Tab (진행중)`)

Page `319:2004` in the **NDS_M.web** component library (`uVcmG6GgOl2J8EOlc22wob`). Two content frames only: `1. 1depth` (the "real" composed tab specimens, titled on-canvas "Tab_1depth — QV-NM Tab Design Guide") and `99. Tab_assets` (a lower-level asset/token sheet: line segments, icons, gradation overlays, button pills, before they're assembled into the 1depth specimens).

## WIP status — the finding to record, not fill in

**The page name itself carries the tag `(진행중)`** — "in progress". On-canvas evidence corroborates this is genuinely thin/unfinished, not just a stale label:

- No "탭의 성격" (is-it-a-tab) qualifying rules, no item-count guidance, no Do/Don't grid, no decision tree — all present on the *separate* NDS_UX Guide file's tab page (`nds-ux-guide-tab.md`, different fileKey `nEINCcmC7AVkWSqRkq60y1`). This M.web page is **pure component specimens** (line tabs, button-pill tabs) with **zero usage-rule copy** anywhere on either frame.
- Both frames are internal asset/spec sheets (`1. 1depth`, `99. Tab_assets`) — naming and structure mirror a component-library "build sheet," not a finished guide page with sections/numbering like the richer pages in this same file (e.g. `nds-mweb-colors.md`'s two-section Colors page).
- One instance, `Tab_2depth_swipe` (`621:1365`, 533×88), is **`hidden="true"`** on the `1. 1depth` frame — per the hidden-frame rule, this cannot be screenshotted (renders blank 1×1) or quoted as a rule; flagged as unverified, not evidence of anything.
- No text anywhere on the page states version/last-update — unlike `nds-ux-guide-tab.md`'s cover slide, which is explicitly stamped `Last update 22.11.17`. This page carries no such stamp at all (blank, not omitted-by-me).

**Conclusion**: this page is a live work item, not a completed spec. Nothing below should be read as a finished/ratified rule set — it documents what currently exists on canvas, which is components only.

## Frame `1. 1depth` — composed specimens

On-canvas title block: **"Tab_1depth"** / **"QV-NM Tab Design Guide"** (verbatim, `621:1389`/`621:1390`).

### LINE group — "가장 기본적인 탭입니다." (verbatim, `621:1394`)

Two example columns, **FIXED** and **SWIPE** (verbatim labels, `621:1395`/`621:1396`):

- **FIXED** column: three stacked line-tab rows, each showing an active item (bold, black, underlined) beside greyed-out inactive siblings truncated/concatenated (`일이삼사오육칠`, `일이삼사오`, etc. — these are literal placeholder Korean numeral strings 일/이/삼/사/오/육/칠 = 1/2/3/4/5/6/7, used as filler text, not real labels).
- **SWIPE** column: a horizontally scrolling line-tab row with an active bold item mid-row and a right-edge fade (see `nds_img_tab_gradation` below).
- One FIXED row's active label reads **"한글기준최대열두글자요"** ("in Korean, max twelve characters") — the guide's own **label-length ceiling annotation**, embedded as example copy rather than as a stated rule. Read literally: a fixed-tab label budget of ~12 Korean characters.

Underlying component: `tab_1depth_line` (`621:1366`), a plain FRAME hosting **4 local COMPONENT nodes** (no componentKey/library metadata returned by `get_design_context` — these are page-local variants, not published library components):
- `Colum=2col, Type=fixed` (360×48)
- `Colum=3col, Type=fixed` (360×48)
- `Colum=4col, Type=fixed` (360×48)
- `Type=swipe, Colum=swipe` (360×48)

Variant axes verbatim: **`Colum`** (`2col`/`3col`/`4col`/`swipe` — note the guide's own typo, "Colum" not "Column") and **`Type`** (`fixed`/`swipe`).

### BUTTON group — "라운드 버튼형 탭으로. 스와이프 가능합니다." (verbatim, `636:3050` — "Rounded pill-button-style tab. Swipeable.")

Two rows of 5 pill buttons each, labeled **"카카오"** (placeholder brand-name filler text, not a real tab label), one row per channel:
- **NM row**: active pill filled dark charcoal (`#2C363B`, style `NM/ESS/grayscale/2.298(탭활성화)` — matches the "탭활성화" token already decoded on `nds-mweb-colors.md`), 4 inactive white pills with `#E0E0E0` border (`NM/ESS/line/2.017(박스테두리)`).
- **QV row**: active pill filled navy (`#0E1A49`, style `QV/ESS/grayscale/2.298(탭활성화)`) — **this is a QV-specific hex not previously recorded** in `nds-mweb-colors.md`'s Colors page (that page's `QV/ESS/primary` group used orange `#FFAA1A`; this is a different QV group, `grayscale`, giving navy — QV's dark/active-surface tone rather than its brand accent). Inactive pills identical white/`#E0E0E0` styling to NM.

Underlying component: `tab_2depth_button` (`636:3051`), 2 local COMPONENT variants keyed by **`Channel`** (`NM`/`QV`), each internally composed of 5 `tab_btn` instances (1 active + 4 inactive). `tab_btn` itself (`636:3022`, in the `99. Tab_assets` frame) is a 4-variant component set: **`Channel`** (`NM`/`QV`) × **`Active`** (`on`/`off`).

Text styling: active pill text white/`text-white`, inactive text `#666666` (`NM/Default/3.013` — matches the "글자 보조" secondary-text token from `nds-mweb-colors.md`); font `Pretendard Regular 21px/30`.

## Frame `99. Tab_assets` — component/token sheet

On-canvas section headers **"LINE 라인형"** and **"BUTTON 버튼형"** (verbatim — Korean glosses "line-style"/"button-style").

### LINE 라인형 → 16PT (`624:1510`, component `tab_line_16pt`)

8 local COMPONENT variants, axes **`Type`** (`fix-2col`/`fix-3col`/`fix-4col`/`swipe`) × **`Active`** (`on`/`off`) — this is the atomic single-tab-item component that `tab_1depth_line` above composes into rows. Columns on-canvas labeled **ACTIVE** / **NORMAL** (i.e. `Active=on`/`Active=off`), rows labeled **FIXED** / **SWIPE** (verbatim, `624:1568`/`624:1573`).

Confirmed from `get_design_context` on this component:
- Active fixed-2col label uses **black, bold, 24px Pretendard, with a black 1px bottom underline** (`act_line`).
- Inactive fixed-2col (and all 3col/4col states) use **grey `#999999` (`NM/Default/4.024`) medium-weight text, with a grey `#E0E0E0` (`NM/Line/137.017` — a *third*, previously-unseen NM/Line style path distinct from `nds-mweb-colors.md`'s `NM/ESS/line/*` group) bottom line** — except that active 3col/4col states render **black bold text on a black underline**, matching the 2col active look; only 2col's *inactive* state and the always-grey baseline line differ from 3/4col.
- Swipe-inactive items have no underline at rest (`border-0`); swipe-active gets a black bottom border.
- **Style-name collision to flag**: `get_design_context` reports the underline token here as `NM/Line/137.017: #E0E0E0` — same hex as `nds-mweb-colors.md`'s `NM/ESS/line/2.017(박스테두리)`, but a **different style path** (`NM/Line/137.017` vs `NM/ESS/line/2.017`). Either a duplicate/legacy style or a naming-scheme drift between this page and the Colors page; don't assume they're the same token even though the hex matches.

Placeholder copy verbatim: `한글기준최대열두글자요` (active), `너무 길게 쓰면 안됩니다` ("don't write it too long" — inactive-fixed-2col placeholder), `일이삼사오육칠` (3col), `일이삼사오` (4col), `일이삼사오육` (swipe).

### `nds_icon_tabarrow_(방향)` (`624:1651` label) → `tab_icon_arrow` (`624:1653`)

3 local COMPONENT variants, axis **`Type`**: `left`, `down`, `up`. On-canvas rendered as three small chevron-in-box icons. No `right` variant present on this page (unverified whether one exists elsewhere in the library) — this page shows only 3 of what would presumably be a 4-direction set.

### `img_tab_gradation` (`630:132` label) → `nds_img_tab_gradation` (`630:133`)

3 local COMPONENT variants: **two both named `Type=nds_img_tab_gradation01`** (a naming duplicate — both share the identical variant name, distinguished only by node ID/position, not a clean variant axis) and one `Type=nds_img_tab_gradation02`. On-canvas these render as small horizontal gradient swatches — dark-to-transparent, navy-to-transparent, and a third (referenced in the swipe-line component code as `imgNdsImgTabGradation02`, a right-edge fade-to-white overlay used to signal more scrollable content in `tab_1depth_line`'s swipe variant, confirmed in the `get_design_context` output for `621:1366`).

### BUTTON 버튼형 (`636:3017` title) → `tab_btn` (`636:3022`)

Already described above under the 1depth BUTTON group — this is its atomic single-pill component (4 variants: `Channel`×`Active`). On-canvas columns **ACTIVE**/**NORMAL**, rows **NM**/**QV** (verbatim, `636:3020`/`636:3021`).

## Cross-check against `nds-ux-guide-tab.md` (different Figma file — NDS_UX Guide, `nEINCcmC7AVkWSqRkq60y1`)

**These are two distinct files and must not be conflated** — the UX Guide file states *when something qualifies as a tab and how many items it may hold*; this M.web page shows *what the tab components look like as drawn assets*, with zero rule copy of its own. Cross-checking anyway, per instructions:

- **No contradiction found**, but also **very little overlap to check**: this page never states the "is it even a tab?" three-condition test (no-navigate / single horizontal row / single-select), never gives item-count minimums/maximums, and never gives pixel heights (72px/70px/58px/50px per the UX Guide's `90:5657` spec sheet). None of that is present here to agree or disagree with.
- **Component-shape agreement**: the UX Guide names seven abstract tab-ish controls (`tab 1`–`tab 5`, 세그먼트 컨트롤, 단일선택 chip) but explicitly says **"nothing in this guide resolves how `tab 1`–`tab 5` map onto NDS_Library components"**. This M.web page's actual drawn components — a fixed/swipe **line** tab (`tab_1depth_line`/`tab_line_16pt`) and a fixed/swipe **button-pill** tab (`tab_2depth_button`/`tab_btn`) — are plausible candidates for filling that gap (line-tab ≈ `tab 1`/`tab 3`/`tab 5` fixed styles or `tab 2`/`tab 4` swipe styles; button-pill ≈ 단일선택 chip / 세그먼트 컨트롤), but **this page does not itself make that mapping explicit** — it's an inference, not a confirmed cross-reference. Flagging as a gap rather than asserting it.
- **"Selecting doesn't navigate" / "single horizontal row" / "single-select"** conditions from the UX Guide are consistent with everything drawn here (all specimens are single horizontal rows with exactly one active item at a time), but this M.web page never states those conditions itself — silence, not disagreement.

## CORE reference cross-check (`tab_2depth_chip`, key `0f20528265a3c598e42e30f6ae422be67e941c10`)

**This page does NOT appear to be the source of `tab_2depth_chip`.** No component on this page is named `tab_2depth_chip`, and none of its variant axes match the Core reference's recorded `Property 1` (`Default`/`Variant2`) axis. This page's components use entirely different variant axes: `Colum`/`Type` (`tab_1depth_line`), `Channel` (`tab_2depth_button`), `Type`/`Active` (`tab_line_16pt`, `tab_btn`). **No componentKey could be captured for any component on this page** — `get_design_context` returned React/Tailwind code with local node-ID data attributes but no `key`/`componentKey` field, and a `use_figma` read (`findAllWithCriteria` for `COMPONENT`/`COMPONENT_SET`) was rejected with `"Operation attempted to modify the file while in read-only mode"` — this file session is view-only, so componentKeys could not be independently confirmed via the Plugin API. Recorded as a gap, not fabricated.

Given the mismatch in both name and variant axes, **`tab_2depth_chip` likely lives on a different, not-yet-learned page or file** — this `(진행중)` Tab page is not its source of truth as originally hypothesized. This should be treated as an open question, not resolved here.

## Gaps / unverifiable

- `Tab_2depth_swipe` instance (`621:1365`) — `hidden="true"`, renders blank; not screenshotted or quoted.
- No componentKeys captured for any component on this page (read-only file session blocked the `use_figma` introspection needed to pull them).
- No usage-rule copy, item-count guidance, or px-height spec exists on this page at all — confirmed blank at source, not omitted by this pass.
- Whether `tab_icon_arrow`'s missing 4th (`right`) direction exists elsewhere in the library is unknown from this page alone.
- The `tab_2depth_chip` Core-reference component's actual source page remains unidentified after this check.
