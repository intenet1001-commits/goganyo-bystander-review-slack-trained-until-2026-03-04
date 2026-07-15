---
name: nds-mweb-popup
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=648-7472"
learned_date: 2026-07-15
sections_studied:
  - "648:7472 (page '    - Popup  팝업  (진행중)' — single frame `popup_usage` (2343:2023) plus one orphaned standalone text node)"
  - "2343:2023 (frame 'popup_usage', 1500x3718 — Title_Typo header, two annotated popup-spec diagrams, a 'MAX Case' section with two phone mockups, and two text blocks: 사용방법 / 사용 시 유의사항)"
  - "2343:2043 (Popup_Sliding_basic_one btn_info — annotated 슬라이딩 팝업 spec diagram)"
  - "2343:2055 (Popup_Layer_basic_txt(title) — annotated 레이어 팝업 spec diagram, title+description variant)"
  - "2343:2086 (Bottom Sheet_scroll — MAX Case #1: full-height scrolling 슬라이딩 팝업, '서비스 이용동의')"
  - "2346:4599 (Bottom Sheet_scroll — MAX Case #2: 레이어 팝업 minimum-size example, '1줄 이상이 필요합니다. 최소 사이즈 233px입니다.')"
  - "2561:2028 (orphaned text node '252525', isolated far above the main frame — unexplained)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen) — page explicitly marked (진행중) / in progress by the design team
---

# NDS M.web — Popup 팝업 (in progress)

## FINDING: this page is marked (진행중) — in-progress, incomplete

The page name itself is `    - Popup  팝업  (진행중)` — **"진행중" = "in progress"**, a status the design team put directly in the page name (unlike sibling pages in this file, e.g. `- Colors`, which carry no such tag). On-canvas evidence consistent with an unfinished page:

- The page is far smaller than a typical mature NDS_M.web page: **one frame** (`popup_usage`) plus **one orphaned, disconnected text node** (`252525`, a bare hex-looking string sitting alone ~2000px above the main frame, unconnected to any other content — screenshotted and confirmed to render as literally just the characters "252525" with no visible context around it). Left as-is, purpose unexplained.
- Two caption text nodes (`슬라이딩` at relative `x=346,y=960`, `레이어` at relative `x=1035,y=814`) exist in the metadata but **do not render visibly** in the screenshot at their expected canvas position — confirmed by cropping and zooming the exact coordinates twice. Not marked `hidden="true"` in metadata (so this isn't the standard hidden-frame case), but they are visually absent — either near-invisible styling (colour matching background) or a stale/unused label. Recorded as unverified per the hidden/near-invisible-frame rule: do not treat their text as a confirmed on-canvas heading.
- Per the finding below, the page's own annotated spec diagram for 슬라이딩 팝업 **disagrees with the actual coded padding of the popup instance sitting right next to it** — the kind of internal inconsistency you'd expect mid-build, not on a finished reference page.

**Do not fill any of these gaps.** They are reported as-is; this is exactly the (진행중) status made concrete.

## Page structure

One frame, `popup_usage` (`2343:2023`, 1500×3718), containing in reading order (top to bottom):

1. **Header** (`Title_Typo`, `2343:2024`): title text "Popup Usage", subtitle "QV-NM Typography Font Usage" (subtitle copy is a leftover/copy-paste from a typography page — it does not describe this page's actual content, which is popup spacing/usage, not font usage).
2. **Two annotated spec diagrams side by side** — 슬라이딩 팝업 (left) and 레이어 팝업 (right), each with measurement callouts.
3. **"MAX Case"** heading + two full phone-frame mockups: a maximally-long scrolling 슬라이딩 팝업, and a minimum-height 레이어 팝업.
4. **"사용방법"** (usage method) — 3 numbered rules.
5. **"사용 시 유의사항"** (usage cautions) — margin/size rules, quoted verbatim below.

## 01. 슬라이딩 팝업 spec diagram (`2343:2043`, "Popup_Sliding_basic_one btn_info")

Screenshot-verified measurement callouts (zoomed crop, confirmed twice):

- Side margin arrows: **30 / 30** (labeled at both top corners)
- Vertical stack, top to bottom: **40** (top padding) → **30** (gap between title text and its divider line) → **40** (gap from divider to body text) → **60** (bottom padding before the button)

**FINDING — annotation vs. actual component disagree.** `get_design_context` + `get_metadata` on this exact instance show the *real* coded values are **top padding 40px, side padding 24px, bottom padding 60px** (`popup_contents` frame: child `contents` at `x=24, y=40`, width `492` inside a `540`-wide parent → left/right inset = `(540-492)/2 = 24`, not 30). The 40/30/40/60 vertical stack matches the code exactly (`pt-[40px]`, internal `gap-[30px]` then `gap-[40px]`, `pb-[60px]`). **Only the side margin is inconsistent: the diagram's own callout arrows label it 30, but the built popup instance on the same slide uses 24.** The page's own "사용 시 유의사항" block says **"기본 마진은 좌우 30입니다"** (default margin is 30 left/right) — so the *written rule* and the *diagram's own callout* agree at 30, but the **actual popup component instance** used to build the diagram is built at 24. This is exactly the kind of drift the page's own (진행중) tag would predict — flag, don't silently correct.

- Bottom button: instance `Bottom_popup_btn/NM/w540/Squre/normal` (note: **"Squre" is a typo for "Square"** in the component's own name), height 75px, full-width 540px, fill `#84C13D` (NM primary green, matches `nds-mweb-colors`' `NM/ESS/primary/2.022(대표컬러)`; the style reference tag returned by `get_design_context` reads `NM/Primary/246.022` — same ColorNumber `022`, different SlotIndex `246` vs. that file's `2`, consistent with `nds-mweb-colors`' note that SlotIndex is just table row order and is not portable across tables).
- Title text: 26px Pretendard Medium, `#333333` (`NM/Default/2.023`). Body text: 21px Pretendard Regular, same `#333333`. Divider line: `NM/Line/140.190` = `#E0E0E0` (a **new style-name/hex pair** not yet in `nds-mweb-colors`' Essential-line table — that file records `NM/ESS/line/2.017(박스테두리)` = `#E0E0E0` as the same hex under a *different* style name/number. **Same hex, two different style-name codes** — worth a flag for whoever maintains the colour style list).

Body copy (verbatim):
> 여기에 콘텐츠가 들어갑니다. 기본은 텍스트 형입니다.여기에 콘텐츠가 들어갑니다. 기본은 텍스트 형입니다.여기에 콘텐츠가 들어갑니다. 기본은 텍스트 형입니다.여기에 콘텐츠가 들어갑니다. 기본은 텍스트 형입니다.여기에 콘텐츠가 들어갑니다. 기본은 텍스트 형입니다.

Title placeholder (verbatim): `타이틀 영역` · Button placeholder (verbatim): `버튼명`

## 02. 레이어 팝업 spec diagram (`2343:2055`, "Popup_Layer_basic_txt(title)")

Screenshot-verified measurement callouts:

- Side margin arrows: **30 / 30**
- Vertical stack: **50** (top padding) → **30** (gap between title and description) → **40** (bottom padding before button)

**This one matches its own component exactly.** `get_metadata` shows the inner `txt` frame at `x=30, y=50` inside a 491px-wide `contents` frame with height matching the 50/40 top/bottom padding — side padding really is 30px here, top 50px, bottom 40px, internal title/desc gap 30px. (Note: `get_design_context`'s auto-generated Tailwind approximated this padding as `px-[60px]`, which is **wrong** — it doesn't match the raw node coordinates or the rendered text widths, an artifact of the code-gen step, not a real spec value. Trust `get_metadata` coordinates over generated Tailwind when they disagree.)

Copy (verbatim):
> 타이틀 영역입니다.
> 타이틀에 대한 설명입니다. 타이틀에 대한 설명입니다. 타이틀에 대한 설명입니다.

- Title: 26px Pretendard Medium, `#333333`. Description: 21px Pretendard Regular, `#666666` (`NM/Default/3.013`, matches `nds-mweb-colors` exactly).
- Overall popup width: **492px** — and it sits inside a 540px screen. This **independently confirms** `nds-ux-guide-popup`'s stated rule "레이어 팝업의 폭은 492px로 고정합니다 (화면 폭 540 기준)", now with a real built instance rather than an illustration.
- Corner radius: 16px top corners on `contents`, 16px bottom corners on the button (i.e. the layer popup is a 16px-radius card). The sliding popup by contrast uses **30px** top corners and square bottom (`rounded-tl-[30px] rounded-tr-[30px]`) — the two popup types have **different corner radii**, don't cross them.
- Bottom button instance name: **`btn_bottom_layerpopup_assets`**, resolving to a component set with variant name **"Channel=NM, Type=1-btn, Status=normal"**, `componentKey: 30face15183da4e34a731cb14d9257fdf2cf3985`.

## MAX Case (`2343:2086` sliding / `2346:4599` layer)

Two full 540×1170 phone mockups demonstrating size extremes.

**Sliding MAX case** (`2343:2086`): header "타이틀 ⌄" (dropdown pattern — matches `nds-ux-guide-popup`'s 스크린 dropdown header semantics), popup title "서비스 이용동의", then **7 repeated checklist items** each reading (verbatim):
> 항목 타이틀을 입력하세요.
> 기본적인 문장형 팝업입니다. 여기에 콘텐츠가 들어갑니다. 너무 작은 글씨는 안보여요.

— ending in a single green **확인** button. This is a scrolling long-form example. Its `statusbar` instance is `hidden="true"` (confirmed in screenshot — the header floats with no status bar above it), unlike the layer MAX case whose statusbar is visible and shows `9:41`. A `nds_img_popup_gradation01` rectangle (`2343:2577`, 540×16) sits directly above the bottom button — a **scroll-affordance gradient**, i.e. the library's built-in way to signal "content continues below" on a scrolling sliding popup.

**Layer MAX case** (`2346:4599`): a visible `9:41` status bar + `타이틀 ⌄` header behind a dimmed screen, with a centered layer popup showing the exact minimum-size copy (verbatim):
> 1줄 이상이 필요합니다.
> 최소 사이즈 233px입니다.

This is the live, on-canvas source for the "사용 시 유의사항" bullet **"레이어 팝업은 [최소 높이: 절대값 233] 입니다."** — the example literally states its own constraint as its copy, and the frame `2346:4711` is indeed **233px tall**. Component instance here: `btn_bottom_layerpopup` (no `_assets` suffix), variant name **"Channel=NM, Type=1-btn, Status=normal"** — **the same variant-name string as `btn_bottom_layerpopup_assets` above, but a DIFFERENT componentKey** (`1757f54b8bd8db6aa96fb5fa1f6adba2075daeb9` vs. `30face15183da4e34a731cb14d9257fdf2cf3985`). Two distinct component sets share an identical variant-name string — the same trap the domain's Core reference already flagged for `nds_icon_arrow` ("Two different components share this exact name"). **Instance by key, never by name.** Note the two also differ in font: the `_assets` one renders 버튼명 in Pretendard Medium 26, the plain one in NanumBarunGothic Regular 26.

Also present in both MAX-case mockups: `statusbar` (`componentKey: 169d23c202bd4e85398ceafdf264d6fa19eb1cbf`, variant "Type=NM, Dark mode=false") and `Topbar_Dropdown` (`componentKey: 69e7ffd43cdf9888ae6fc9bbedff3627fe504e6d`, variant "Channel=NM, Type=basic, Combo=off") — both **new confirmed componentKeys**, not previously in the domain's Core reference. `Topbar_Dropdown` is the live component behind the `< 서비스 명 ⌄` header pattern that `nds-ux-guide-popup` describes only as a flat illustrative mockup (that file states plainly that no componentKeys are cited anywhere on its popup canvas) — **this page supplies the real key**.

The sliding MAX case also uses instance `btn_bottom_page` (`2343:2123`), whose **variant-name string is scrambled**: `getMainComponentAsync()` returns the name `"Channel=btn_bottom_layerpopup, Type=btn_bottom_page, Status=NM, Property 4=1-btn, Property 5=normal"` — the property *names* (`Channel`, `Type`, `Status`) hold what look like other properties' *values* (`btn_bottom_layerpopup`, `btn_bottom_page`, `NM`), and two axes are left as unnamed `Property 4` / `Property 5`. `componentKey: 3ef42b8dfd48baf9ff4c1572dd2a4de8264bfee7`. Recorded as-is — no attempt made to guess the intended mapping; this is the kind of build-time inconsistency the (진행중) tag warns about.

## 사용방법 (usage method) — verbatim

> 1. 슬라이딩 팝업을 기본적으로 사용합니다.
> 2. 중요한 안내/공지 등 사용자에게 꼭 알려야 하는 사항은 레이어 팝업을 사용합니다.
> 3. 슬라이딩 팝업 내용이 최대높이 이상으로 너무 많아지면 풀팝업 사용을 권장합니다.

**Rule 3 is the crossover to 풀팝업**, matching `nds-ux-guide-popup`'s 원칙 3 ("스크롤이 필요할 만큼 분량이 많은 경우 슬라이딩 팝업을 지양합니다" → "슬라이딩 대신 풀팝업 사용을 권장합니다"). **Agreement, not contradiction** — and note this page phrases the trigger as *exceeding the max height* where the UX Guide phrases it as *needing to scroll*; this page then supplies the actual number the UX Guide never states (max height = viewport-top margin 80).

## 사용 시 유의사항 (usage cautions) — verbatim

> - 기본 마진은 좌우 30입니다.
> - 레이어 팝업은 [최소 높이: 절대값 233] 입니다.
> - 슬라이딩 팝업은 [최대 높이 : 뷰포트 상단으로부터 여백 80 / 최소 높이 : 절대값 400]입니다.
> - (for designer) 예외케이스는 해당하는 templates에 추가해주세요.

Hard numbers this page adds that `nds-ux-guide-popup` does **not** state:
- **Default side margin: 30px** (both popup types — but see the 24px discrepancy above).
- **레이어 팝업 minimum height: 233px absolute** (demonstrated live in the MAX Case mockup, whose frame really is 233px tall).
- **슬라이딩 팝업 max height: viewport-top margin 80px** / **min height: 400px absolute.**
- An explicit designer instruction to route exception cases into "templates" — the same deferral to NDS_Templates that `nds-ux-guide-popup` makes ("Figma → NDS_Templates → Popup 참고").

## Relationship to `nds-ux-guide-popup` (a DIFFERENT file — the UX Guide, `nEINCcmC7AVkWSqRkq60y1`)

The two files are **complementary, not overlapping**: the UX Guide says *which overlay type to use and how to word it*; this page says *what the component is and what size it is*. Read the UX Guide first to pick a type, then this page for the px values.

**Agreements (all independently confirmed here):**
- **슬라이딩 팝업 is the default popup type.** (Here: "슬라이딩 팝업을 기본적으로 사용합니다." There: "기본적으로 슬라이딩 팝업을 사용합니다.")
- **Escalate to 풀팝업 when the sliding popup gets too long.** (Here: rule 3. There: 원칙 3.) The MAX-Case sliding mockup — 7 checklist items, obviously scrolling, with a scroll-gradient — is a concrete instance of exactly the case the UX Guide flags as a Don't.
- **레이어 팝업 is only for short, important notices.** (Here: "중요한 안내/공지 등 사용자에게 꼭 알려야 하는 사항". There: "중요한 알림, 확인 등에서만 사용합니다.")
- **레이어 팝업 width = 492px at a 540px screen.** The UX Guide states this as a rule; this page's built instance measures 492px. Also re-confirms the Core reference's "build at 540px, not 375px".
- The `< 서비스 명 ⌄` dropdown header rendered here (`Topbar_Dropdown`) matches the UX Guide's 스크린 header-icon semantics.

**No contradictions found between the two files.** The only contradiction on this page is *internal to this page* (the 30-vs-24 margin, below).

**One thing to be careful about:** the UX Guide's 레이어 팝업 rule is "레이어 팝업에 헤더를 사용하지 않습니다" (no header, ever) and its title+설명 variant caps both at 최대 2줄. This page's 레이어 팝업 diagram is the **타이틀 + 설명** variant and is consistent with that (the "타이틀 영역입니다." text is body content inside the card, not a header bar). Don't misread this page's `title` *layer name* as licence for a 레이어 팝업 header.

## GAPS — blank/unverifiable at source

- Page is **(진행중)** — incomplete by the design team's own label. Treat all of the above as a snapshot of an evolving page, not a finished spec.
- **The 30-vs-24px side-margin contradiction** on the 슬라이딩 diagram (written rule and callout both say 30; the diagram's own instance is built at 24) is reported as observed, **not resolved** — nothing on the page addresses it, and it's unclear whether the rule or the instance is the one that's wrong. Escalate to the design team rather than picking one.
- **`슬라이딩` / `레이어` caption text nodes** exist in metadata but don't render visibly at their reported coordinates — checked twice via zoomed crop. Not `hidden="true"`, so not the standard hidden-frame case. Recorded as unverified; not quoted as rules.
- **Orphaned text node `252525`** (`2561:2028`) sits isolated ~2000px above the main frame with no explanatory context anywhere on the page. Purpose unknown — possibly a stray colour-hex note, possibly leftover scratch content. Not integrated into any finding above.
- **`btn_bottom_page`'s scrambled variant-property naming** reported as-is; no guess made at the intended mapping.
- **No componentKey for a popup shell/container itself** — only sub-components (bottom buttons, header, statusbar) resolved to real keys. If a full sliding/layer popup-shell component exists in the library, this page didn't surface it. The UX Guide's pointer to **NDS_Templates → Popup** (libraryKey `lk-6485b4ef...` in the Core reference) remains the place to look.
- The header subtitle "QV-NM Typography Font Usage" is stale/copied — it describes typography, not popups. Not a spec.

## How this feeds BUILD mode

- **Pick the type via `nds-ux-guide-popup` first** (default 슬라이딩; 레이어 only for 1~2 sentences with no options/table/agree-button; escalate to 풀팝업 if it would scroll). Then come here for the numbers.
- **슬라이딩 팝업**: 540px wide, 30px top corner radius, square bottom. Vertical rhythm 40 (top) / 30 (title→divider) / 40 (divider→body) / 60 (body→button). Side padding: the real instance uses **24**, the page's stated rule says **30** — flag this to a human before treating either as canonical. Min height 400px absolute; max height = leave ≥80px margin from the viewport top. Use `nds_img_popup_gradation01` (540×16) above the button when content scrolls.
- **레이어 팝업**: **492px fixed** width at 540px canvas, 16px corner radius, 30px side / 50px top / 40px bottom padding, 30px title→description gap, **min height 233px absolute**.
- **Type ramp**: popup title 26px Pretendard Medium `#333333` (`Headline/Preten/M/26`); body 21px Pretendard Regular `#333333`; layer-popup description 21px Pretendard Regular `#666666` (`NM/Default/3.013`); layer body 24px Pretendard Regular `#333333` (`Title/Preten/R/24`). Button label 26px, but **the font differs by which button component you instance** (Pretendard Medium vs. NanumBarunGothic Regular) — another reason to pick by key deliberately.
- **New componentKeys confirmed on this page** (none previously in the Core reference):

| Component | componentKey | Variant observed |
|---|---|---|
| `Bottom_popup_btn/NM/w540/Squre/normal` (sliding bottom button, "Squre" typo is the real name) | `0c18954dc606cb4cd2e27ef52398f656e8b79219` | — |
| `btn_bottom_layerpopup_assets` | `30face15183da4e34a731cb14d9257fdf2cf3985` | `Channel=NM, Type=1-btn, Status=normal` |
| `btn_bottom_layerpopup` — **name-collision: same variant string, different key** | `1757f54b8bd8db6aa96fb5fa1f6adba2075daeb9` | `Channel=NM, Type=1-btn, Status=normal` |
| `btn_bottom_page` — **scrambled variant-property names** | `3ef42b8dfd48baf9ff4c1572dd2a4de8264bfee7` | `Channel=btn_bottom_layerpopup, Type=btn_bottom_page, Status=NM, Property 4=1-btn, Property 5=normal` |
| `statusbar` | `169d23c202bd4e85398ceafdf264d6fa19eb1cbf` | `Type=NM, Dark mode=false` |
| `Topbar_Dropdown` — the real component behind the UX Guide's `< 서비스 명 ⌄` header | `69e7ffd43cdf9888ae6fc9bbedff3627fe504e6d` | `Channel=NM, Type=basic, Combo=off` |

  Per the Core reference's standing rule, confirm each still resolves via `importComponentSetByKeyAsync` before relying on it.
