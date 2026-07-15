---
name: nds-tpl-share
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=23083-4390"
learned_date: 2026-07-15
sections_studied:
  - "23083:4390 (page canvas '    - Share 공유하기')"
  - "25601:4664 (title frame '앱 공유' / 'QV-NM Template Guide')"
  - "25601:4671 (title frame '웹 공유' / 'QV-NM Template Guide')"
  - "23083:5082 (app frame '나무팡_점수 자랑하기' — 내 점수 자랑하기 screen, 공유하기/저장하기/닫기 3-icon-button row)"
  - "23083:17588 (instance '나무팜_종목상세_공유하기')"
  - "27497:2218 / 25377:5173 / 25377:5174 (instances '커뮤니티_글쓰기_수익률공유_MTS영역')"
  - "24485:6273 (section '가이드' — annotated 618px max-height spec, 54pt margin callouts)"
  - "25601:5054 (frame 'popup_full_1dep', filed under 웹 공유 — header + kebab menu popup)"
  - "31027:5114 (frame 'kebabmenu_popup' — 카카오톡 / 링크 복사 / 더보기 3-item menu)"
  - "31027:20361 (rule text, verbatim web-share copy, filed at 웹 공유 section's y-position)"
  - "31027:20364 (frame '카톡 공유하기' — KakaoTalk-rendered preview mock)"
status: internal NDS component-library guide (Templates file — usage-example gallery, consistent with Gotcha 7)
---

# NDS Templates — Share 공유하기

Single-page usage gallery, split into two title-labeled zones on one canvas: **"앱 공유"** (`25601:4664`) and **"웹 공유"** (`25601:4671`), both tagged "QV-NM Template Guide". Like every other NDS_Templates page learned so far, this is a composed-screen gallery, **not a prose rules source** (Gotcha 7 confirmed again) — with one exception: a single rule-text block is embedded verbatim as a text-node name under the 웹 공유 zone (`31027:20361`), plus a link node `31027:20363` "웹 공유 UX가이드 자세히보기" pointing back at the separate UX-guide file — an explicit cross-reference to `nds-ux-guide-share.md`.

## Layer names — reliable on this page

Instance/frame names read directly as their purpose: `나무팡_점수 자랑하기`, `나무팜_종목상세_공유하기`, `커뮤니티_글쓰기_수익률공유_MTS영역`, `kebabmenu_popup`, `ndsw_icon_share_kakao`. Screenshot-confirmed `23083:5082` ("내 점수 자랑하기" on canvas matches its layer name) and `25601:5054`/`31027:5114` (카카오톡/링크 복사/더보기 kebab popup, on-canvas text matches layer text exactly). **Verdict for this page: reliable.**

## Component keys — sampled via explicit node IDs (no throw this pass)

| Instance | main COMPONENT key | remote | parent SET name | parent SET key |
|---|---|---|---|---|
| `31027:5122` nds_icon_link04 | `f9461fbf3e120d034eccf027feb089d935b31992` | true | `nds_icon_link` | `5ea53bfd1c9b193495640a7f854d82e7e64cadcf` |
| `31027:5125` nds_icon_meatball04 | `9581d0160b8fa76efac9c60e7fe9175c9c8336a3` | true | `nds_icon_meatball` | `6388927509d73385fe59596d8b515ecf96c137e3` |
| `23083:5117` nds_img_iconbtn | `2af0da5e2d12b7f571edf156a4370f2ab0700f9a` | true | `nds_img_iconbtn` | `b794e8b470561d5c9e6582c520a382af39c609d9` |
| `31027:5087` statusbar | `169d23c202bd4e85398ceafdf264d6fa19eb1cbf` | true | `statusbar` | `fe57c685f5a27a53c49fc56c9999456340140c2f` |
| `31027:5116` ndsw_icon_share_kakao | — (FRAME, not an instance) | n/a | n/a | n/a |
| `31027:5088` header_basic | — (FRAME, not an instance) | n/a | n/a | n/a |

**Corroborates Q4**: 4/6 sampled are real subscribed `NDS_Library` components, `remote: true`. **Corroborates Gotcha 5b's statusbar collision**: this page's `statusbar` resolves to parent SET key `fe57c685…` — one of the "≥5 distinct keys" already flagged there, confirmed again here. The **Kakao icon (`ndsw_icon_share_kakao`) and this popup's `header_basic` are both hand-composed FRAMEs**, not instances of the real component — the Kakao brand glyph (ellipse + speech-bubble vector) isn't in NDS_Library (third-party icon), and this particular header wasn't wired to a live `header_basic` instance despite the name.

## ANSWERS — cross-file question vs `nds-ux-guide-share.md`

**Corroborates, does not contradict.** This page shows both sides of the split and they match the rules doc exactly:

- **App mockups** (`나무팡_점수 자랑하기` under the "앱 공유" zone): screenshot shows a plain 3-icon-button row — 공유하기 / 저장하기 / 닫기 — each a bare share/download/close glyph, **no expanded Kakao/링크복사 menu drawn in the app screen**. Confirms "app = simple share affordance, not a custom menu."
- **Web mockup** (`popup_full_1dep`, filed under the "웹 공유" zone despite rendering with a phone-style status bar): screenshot of `kebabmenu_popup` shows a **custom 3-item popup anchored under the header's share icon**, top to bottom: **카카오톡** (yellow icon) → **링크 복사** → **더보기**. **Order is exactly 카카오톡 / 링크 복사 / 더보기, confirmed pixel-for-pixel against the on-canvas rendering** — matches the guide's stated order precisely.
- The embedded rule text (`31027:20361`, verbatim node name) reads: *"웹 공유 시 '카카오톡, 링크 복사, 더보기' 구성을 공통으로 사용 카카오톡 버튼 누를 경우, 카카오톡 앱의 '공유 대상 선택' 화면 호출 *카카오톡 설치 안 된 경우, 앱스토어로 이동"* — word-for-word the same rule `nds-ux-guide-share.md` quotes from the separate UX-guide file. This page even links back to that file (`31027:20363`).
- **No 단발성 이벤트 (one-off event) variant found on this page** — only the standard app/web split is represented here; the event exception isn't independently corroborated or contradicted by this page.

**Share-image ratio/size rule — fills `nds-tpl-thumbnail.md`'s gap, partially.** The 가이드 (`24485:6273`) section carries an annotated spec matching `nds-ux-guide-share.md`'s number exactly:

> **"618px 최대 높이"** with callout **"컨텐츠에 따라 높이는 가변적입니다."**
> 54pt margins marked on all four sides of a 540px-wide card mockup.

This is the **same 618px max-height figure** already known from the rules doc, now visually corroborated with an explicit annotated diagram (image height content-variable, capped at 618px; width fixed). It does **not** state a fixed aspect ratio (unlike `nds-tpl-thumbnail`'s bare 2:1/4:3 sizes) — it's a max-height constraint on a fixed-width card, not a ratio rule. So the gap is filled for *height cap*, but no ratio rule is stated here either — only a numeric ceiling and a variable-height acknowledgment.

## Blanks / gaps

- Only one rule-text block found on the whole page (`31027:20361`); everything else is composed screens, per Gotcha 7.
- `24485:6273`'s "가이드" section is a spec annotation overlay (like a redline), not literal on-canvas prose elsewhere on the page.
- 단발성 이벤트 (event) web variant, documented in `nds-ux-guide-share.md`, has no counterpart mockup on this page — not corroborated, not contradicted, simply absent.
- `nds_icon_link04`/`nds_icon_meatball04`/`nds_img_iconbtn` variant axes (e.g. numbered suffixes `04`) not decoded — out of scope for this pass.
