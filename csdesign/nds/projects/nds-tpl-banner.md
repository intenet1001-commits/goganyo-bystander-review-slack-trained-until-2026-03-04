---
name: nds-tpl-banner
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=619-26120"
learned_date: 2026-07-15
sections_studied:
  - "619:26120 (title frame '4303:32612' — on-canvas 'Banner' / 'QV-NM Template Guide', matches page name '- Banner 배너')"
  - "4313:33334 'Basic 기본 배너스타일' / 4313:33339 'Image 이미지 배너스타일' / 14950:3323 'Guide 상품 투자가이드' / 28759:5745 '뉴스' / 14963:9908 'TXT 텍스트 배너형 카드' — five on-canvas section-label text nodes, each heading a cluster of composed example screens"
  - "4303:33460 / 4303:34452 top_banner/NM (Night/Day trading-topbanner mockups + 2 standalone) — full-width dark image+text promo banner"
  - "4313:33725 / 4313:33659 Group 9319 / 나무투데이 배너 — carousel banners with pagination01 dots"
  - "14963:9725 / 14963:9737 card_guide (btn_1버튼 mockups) — guide/CTA link row"
  - "28759:5802 / 28759:5818 news frames — hand-composed colored-tag + truncated-headline rows"
  - "14963:9968 Frame 123792 — chat-icon + text + chevron row ('TXT 텍스트 배너형 카드')"
  - "37275:28220 / 37275:28391 NM_group_banner / QV_group_banner — banner embedded inline inside a stock-list screen"
  - "28809:7728 main/banner — light promo pill with chevron, embedded in a list context"
status: internal NDS component-library guide (Templates file — usage-example gallery, not a spec sheet)
---

# NDS Templates — Banner 배너

Single-page usage gallery (title on-canvas: **"Banner" / "QV-NM Template Guide"**, matches page name). Five labeled clusters of composed example screens, each showing one banner "style": **Basic** (`Basic 기본 배너스타일`), **Image** (`Image 이미지 배너스타일`), **Guide** (`Guide 상품 투자가이드`), **News** (`뉴스`), **TXT card** (`TXT 텍스트 배너형 카드`). Like every other `nds-tpl-*` page learned so far, this is composition/usage examples, not a rules document — no prose usage copy (dismiss/timing/count rules) found anywhere on the page.

## Layer-name convention — confirmed reliable (screenshot-checked)

Title screenshot reads "Banner" / "QV-NM Template Guide" — matches page name exactly. Section-label screenshot (`4313:33334`) reads "Basic 기본 배너스타일" — matches its text-node name exactly. Instance layer names (`top_banner/NM`, `card_guide`, `NM_group_banner`, `QV_group_banner`, `pagination01`) all read directly as their resolved component name via `getMainComponentAsync()`. **Verdict for this page: reliable** — consistent with `nds-tpl-list`/`nds-tpl-data-table`'s finding, contrast the `\x08title` unreliable case on `3:158`.

## Component keys — all genuine COMPONENT_SETs, `remote: true`

Sampled via explicit node IDs (page-wide sweep threw read-only on first attempt, succeeded on retry — per known intermittent throw):

| Instance | variant | main COMPONENT key | remote | parent SET name | parent SET key |
|---|---|---|---|---|---|
| `4303:33460` top_banner/NM | `\bBanner=02` | `8835cb1ee309f3ec9a9e2c14a22ffa068ca275b6` | true | `top_banner/NM` | `5f4e5c45ca33b1f303882902acb85310b95561ba` |
| `4303:34452` top_banner/NM | `\bBanner=10` | `9f186d8e6e8eb5e6c5eab8256918b90830d41e91` | true | `top_banner/NM` | `5f4e5c45ca33b1f303882902acb85310b95561ba` |
| `14963:9725` card_guide | `Type\b=1-btn` | `c8f4c111f497af309cf262e47ce9e4b7d80dfb34` | true | `card_guide` | `a027ac0b3104f7c3cbaf4cce2abd81daa65f95ae` |
| `14963:9737` card_guide | `Type\b=2-btn` | `ad5db2276a0f4917d3cacc1809dcea62bff71d74` | true | `card_guide` | `a027ac0b3104f7c3cbaf4cce2abd81daa65f95ae` |
| `37275:28221` NM_group_banner | `banner=banner5` | `9a59a730a281bafacec20bae7a94906870e7e04e` | true | `NM_group_banner` | `adbfc23920bee1365cc11280abfd44eef93870e4` |
| `37275:28392` QV_group_banner | `banner=banner9` | `8dc8b1caed3401aaa42c3955dad0deb5ada7588d` | true | `QV_group_banner` | `7d16bf05ecfeb58d264c004a3ebc65b1fff6298e` |
| `28809:7728` main/banner | `case=메인` | `a4ec5e24a5be221e4fedcfcec3c640f4978cb548` | true | `main/banner` | `751beba013e1b3bb38eff6f220e86f9b4d824cd0` |
| `14963:9968` Frame 123792 (TXT card) | `Arrow=on` | `9ee163cc1658792b462b8ed1fac6dca6c29f8856` | true | `Frame 123792` | `1a82768d0a686095b9a813425c56d5a05e941eef` |
| `4313:33654` pagination01 | `Step=4` | `5231c6d93f90b11d20c8109357d668ff73452ab1` | true | `pagination01` | `1f8a2fec3ced9d0ddae3c8acffc34f3520626da0` |

**`pagination01`/parent SET key here = Core's key exactly** (`nds-tpl-indicators`'s `5231c6d9…`/`1f8a2fec…`) — independent corroboration, third sighting. **Data defect noted twice**: `top_banner/NM`'s variant name and `card_guide`'s variant name both carry a literal `\b` (backspace) character before the `=` — same defect class as `account_apply`'s `레이블표시\b` recorded in `nds-tpl-account-controller`. **Net-new families vs Core**: `top_banner/NM`, `card_guide`, `NM_group_banner`/`QV_group_banner`, `main/banner`, `Frame 123792` — none appear in Core's table; this page fills a real gap ("Core has no banner entry").

## ANSWER

- **Types/placements**: five distinct genres — (1) **Basic** `top_banner/NM`: full-width dark image+text promo (e.g. "한도없이 최대 1% 적립! / 나무 롯데카드 출시!"), used as a screen-top banner inside trading-app mockups; (2) **Image**: card-style carousel with product image + title + `pagination01` dots (e.g. "오늘의 투자 이야기", "나무투데이 배너"); (3) **Guide** `card_guide`: light pill row, book-icon + "펀드가 처음인가요?" + right-aligned "투자가이드" label link; (4) **News**: hand-composed (not a component — plain `frame`) colored-tag + truncated headline + chevron; (5) **TXT card** `Frame 123792`: chat-bubble icon + one-line text + chevron. Additionally `NM_group_banner`/`QV_group_banner`/`main/banner` show banners **embedded inline inside stock-list screens**, not just at screen-top.
- **Dismissible?** No close/✕ affordance visible on any of the 9 screenshotted examples. Not stated as dismissible or persistent anywhere — **unconfirmed either way**, absence of an X icon is the only evidence.
- **Carousel vs static?** Both exist: Image-style banners carry `pagination01` (multi-slide, confirmed `Step=4` variant → at least 4 dots visible in one instance), so carousel; Basic/Guide/News/TXT-card examples are static single-item rows.
- **Rotation timing / max count stated?** **No.** No prose text found anywhere on the page stating auto-rotate interval or a maximum banner count — same blank-at-source pattern as `nds-tpl-tooltip`/`nds-tpl-list` (gallery shows, doesn't state rules).
- **Contrast concern?** Impression only, not measured: the Image-style banner's secondary label ("상품전략·자산배분", small gray-on-cream text under the bold headline) reads visually low-contrast — a plausible candidate to fall under `nds-ux-guide-color-contrast`'s ≥4.5:1 requirement, but this is **NOT the same file** as that guide and no pixel measurement was taken. All other examples (dark-bg Basic banner, light-pill Guide/TXT-card, blue-pill News tag) read as adequate contrast by eye.

## Blanks / gaps

- No prose usage rules (dismiss / auto-rotate timing / max banner count / trigger conditions) found anywhere on this page — blank at source, not invented.
- `NM_group_banner`/`QV_group_banner` sit inside a much larger composed stock-list screen (`37275:28167`/`37275:28338`) whose surrounding list content was not separately transcribed — out of scope for this page's banner focus.
- Contrast impression above is unverified — no color sampling or measurement performed against `nds-ux-guide-color-contrast`'s thresholds.
