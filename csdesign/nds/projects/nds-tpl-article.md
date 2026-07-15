---
name: nds-tpl-article
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=45212-559"
learned_date: 2026-07-15
sections_studied:
  - "45212:559 (page canvas '    - 아티클' — title frame 45212:8302 on-canvas '아티클' / 'QV-NM Template Guide')"
  - "45212:5460 [NM]국민성장펀드 이야기 (article 1, full-scroll mock, 540x4242, dated 2026.05.22 on-canvas)"
  - "45212:11942 IMA 이야기 (article 2, full-scroll mock, 540x3167)"
  - "45212:12256 Frame 2147221152 (article 3, collapsed SYMBOL '[NM] 펀드 이야기_260410' — 목표전환형 펀드, unexpanded)"
  - "45212:8907/8908/8909 (column labels '03 IMA' / '02 목표전환형 펀드' / '01 국민성장펀드')"
  - "45251:5834 Survey Usage (매뉴얼/디자이너 참고용 — separate spec section, NOT an artifact)"
status: internal NDS component-library guide (Templates file — mostly a gallery, BUT this page also carries a genuine prose spec section, a second Gotcha-7 exception)
---

# NDS Templates — 아티클 (Article)

Page shows **3 full-length article/story mockups** side by side (labeled columns "01 국민성장펀드" / "02 목표전환형 펀드" / "03 IMA"), each a long vertical scroll (540px wide, up to 4242px tall) composed of stacked title/body/step/table sections — plus a separate **"Survey Usage" 매뉴얼 (디자이너 참고용)** frame that is not a fourth article but a build-spec panel for this page's own layer-naming/GA-tagging conventions.

## TAXONOMY answer

**3 top-level content artifacts** (matches the 3 column labels exactly): `[NM]국민성장펀드 이야기`, `IMA 이야기`, and a collapsed SYMBOL instance `[NM] 펀드 이야기_260410` (목표전환형 펀드 — not expanded/inspected, it's a placed symbol not a frame). A 4th top-level frame, `Survey Usage`, is a manual/spec panel, not a 4th artifact — excluded from the count.

**Prototype links: none found.** No reactions/interactions were inspected (out of scope per method), but structurally each artifact is one single continuous scroll frame (not discrete linked screens) — same shape as `42129:7390`'s zero-prototype-link finding from Wave 1. **Verdict: component/pattern (gallery) page, not a flow** — 3 static long-form mockups, no sequencing between them.

## ANSWER — content/typography surface: STATED, uniquely on this page

Unlike every other Gallery page in this file (Gotcha 7), the `Survey Usage` → `04 본문` section states an explicit **type ramp by layer name** (screenshot-transcribed verbatim):

> 레이어 이름 : **title (Bold, 30pt)** / **body (Medium, 24pt)** — ㄴ 기본 색상은 013, ㄴ 강조 문구는 004로 처리하면 형광펜 처리됩니다. / **sub (Medium, 21pt)**

- **Type ramp: STATED** — 3 sizes/weights (title 30pt Bold, body 24pt Medium, sub 21pt Medium), keyed to layer name not a text style.
- **Line-height: NOT stated** anywhere on this page.
- **Measure/width rule: only a frame-width rule, not a text-measure rule** — "해상도는 화면 사이즈 관계 없이 **Width 540 가운데 고정**됩니다" (the whole mock is fixed 540px, centered) — this is the frame's fixed width, not a prescribed line-length/measure for body copy.
- **Font family: NOT named** — only weight (Bold/Medium) per layer, no family string anywhere on this page. Cannot corroborate or contradict `nds-mweb-typography`'s Pretendard/NanumBarunGothic split from this page alone.
- **Color: opaque numeric codes only** — base "013", emphasis/highlight "004" — no hex, no contrast ratio; consistent with Gotcha 4 (opaque NDS color codes, sampling required, not attempted here — out of scope).
- **Date/version stamp: YES, twice.** Per-article on-canvas date `2026.05.22` (inside article 1's title block) AND a genuine manual footer **"Last update 2026.05.26 이영록"** at the bottom of the Survey Usage spec — a real changelog line, contradicting the file-wide "no changelog" assumption for at least this one page.

## NAMES — reliable (layer names match instance/component names read cleanly; not screenshot-cross-checked node-by-node beyond the 2 frames above)

## TIERS / KEYS — 5/5 remote (single-node `getMainComponentAsync` calls, no loop)

| Instance | main COMPONENT name | main key | remote | parent SET name | parent SET key |
|---|---|---|---|---|---|
| `45212:5579` statusbar | `Type=Clear, Dark mode=false` | `d5da233e30df1c17b8e90c35591ab8bb09364795` | true | `statusbar` | `fe57c685f5a27a53c49fc56c9999456340140c2f` |
| `45212:5580` header_basic | `Channel=clear 밝은배경, Left Icon=off, Right Icon=on` | `c6d77f3bcbeb1a0855a5b01513fc9a72d1a06b04` | true | `header_basic` | `c95043e94317fde7230298017f42dd8099e1cbdc` |
| `45212:5581` tab_1depth_line | `Colum=2col, Type=fixed` | `5f693621dc20496a7812cbcdbed0063353aadee3` | true | `tab_1depth_line` | `7bf9b1cbc3bada9a2d4e323ae51efcc74e60f611` |
| `45212:5487` nds_icon_step | `Channel=NM, Step=01` | `86049b96cb4fd6b86d7842ccd85ed3283c6925b9` | true | `nds_icon_step` | `be9d70861f0510a5ea083d0c20360aafae7f4c56` |
| `45212:5521` Table_header | `Type=basic` | `cf7c2dee26d1a354d58575a299e5f7a04268ad23` | true | `Table_header` | `8074b6b4ab30e8d392bfb6aec6857386f10e5006` |

`statusbar` SET (`fe57c685…`) and `header_basic` SET (`c95043e9…`) both match Core/`nds-tpl-no-data` exactly — corroborates Q4. `nds_icon_step` SET (`be9d7086…`) matches `nds-tpl-step-timeline`'s standalone form's family. `tab_1depth_line` and `Table_header` are new SET keys not previously recorded.

## Blanks / gaps

- Article 3 (목표전환형 펀드) is a collapsed SYMBOL, not expanded — its internal structure/copy unverified.
- No line-height or font-family value stated anywhere — confirmed absent, per Gotcha 6 pattern, despite this being the one page where *some* type spec does exist.
- Color codes 013/004 not sampled to hex — cannot confirm ≥4.5:1 contrast against `nds-ux-guide-color-contrast`.
- Prototype-link check was structural inference only (no `get_reactions` call made — out of scope per method).
