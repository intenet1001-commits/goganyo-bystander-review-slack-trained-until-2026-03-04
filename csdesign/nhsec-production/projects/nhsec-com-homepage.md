---
name: nhsec-com-homepage
url: "https://www.nhsec.com/"
learned_date: 2026-07-15
pages_studied:
  - "https://www.nhsec.com/ (homepage, desktop viewport 1440x900)"
status: live production website (NH투자증권 main corporate/retail site — not a Figma file, expect drift over time)
---

# nhsec.com — Homepage (NH투자증권 main website)

Live production website, distinct from the NDS/MTS-app domains (`../../nds`, `../../asset`) and from the sibling `../../nhnamuh-production` site. Learned by browsing the real page (Chrome `use_browser` tool), not Figma.

## Access quirks (see also `../LEADER.md` Tooling note)

- The URL is a **frameset shell**: the real page lives in `<iframe name="iflg_body" src="https://www.nhsec.com/main.html?ver=...">` (plus a `ticker.html` iframe for the scrolling market ticker). Query `document.getElementById('iflg_body').contentDocument`, not the top document.
- Loading `/` also opens a **separate notice-popup tab/window** ("홈페이지 국내주식 거래 종료 안내" as of 2026-07) that can be mistaken for the homepage itself, or can cause a plain `page.goto()` to hang. Resolve by listing open tabs and operating on the one titled "NH투자증권 투자,문화가 되다", not the popup.
- Font: `Dotum, 돋움, sans-serif` (legacy Korean web-safe stack, not a modern webfont).

## Nav structure (GNB)

**Utility bar** (above the main nav, small text): 로그인 · 인증센터 · 개인정보수정 · 전자민원접수 · 금융소비자보호 · 상품공시실 · 회사소개 · (search icon) · 전체메뉴 (grid icon → full sitemap panel)

**Main GNB** (`ul.mn_list > li`, 6 top-level categories, logo "NH투자증권" at far left):

1. **금융상품** — quick links: 펀드검색, 청약중인 상품, 해외채권, IMA 투자가이드
2. **뱅킹/계좌정보** — quick links: My 자산, 이체출금, 진행중인 청약, 서비스안내
3. **주식/파생상품안내** — quick links: ETF(상장지수펀드) 소개, 해외주식 투자가이드, 해외선물옵션 투자가이드, NH트레이더
4. **투자정보** — quick links: 최신리포트, 뉴스/공시, 금리/환율/유가, 주식길라잡이
5. **연금자산** — quick links: MY 통합연금, 퇴직연금매매, MY 연금저축, 인트로
6. **고객센터** — quick links: 금융소비자 보호체계, 영업점에서 계좌개설, 인증/OTP 센터, 채널특징 및 다운로드

Markup pattern (shared with namuh, see `../../nhnamuh-production`): top-level items are `ul.mn_list > li`; each has a `.mn_sub` panel using **`<dl>/<dd>`**, not nested `<ul>/<li>` — links live at `.mn_sub dl dd > .mn_box > a`. The full sitemap (well beyond these 4-item quick-link panels — a flat DOM query turned up 1400+ total anchor tags across the mega-menu system) is reachable via the "전체메뉴" icon; the 4-item lists above are the curated "quick access" subset shown per category, not the complete category tree. Treat the 6 category labels + their quick-link subsets as the reliable, stable part of this note; treat the full 1400+-link sitemap as "exists, not exhaustively catalogued here."

## Color palette (sampled from real computed styles, not guessed)

| Role | Value | Notes |
|---|---|---|
| Section/card background | `rgb(240, 243, 248)` ≈ `#F0F3F8` | Most common non-white background — light blue-gray, used for content section fills |
| Surface white | `#FFFFFF` | |
| Off-white surface | `rgb(251, 252, 253)` ≈ `#FBFCFD` | Secondary surface tone, slightly warmer than pure white |
| **Primary brand blue (bright)** | `rgb(22, 146, 232)` ≈ `#1692E8` | Low-frequency but visually dominant — accent/highlight blue |
| **Primary brand blue (deep)** | `rgb(17, 113, 210)` ≈ `#1171D2` | Deeper blue, likely hover/pressed state or a secondary accent alongside the one above |
| Muted secondary text/button | `rgb(96, 119, 146)` ≈ `#607792` | Seen on a button-like element's text color |
| Hero/headline ink | Dark navy (visually sampled from screenshot, not computed-style-confirmed — headline "일 잘하는 증권사가 만든 N2, IMA①" renders in a deep navy, close to but not identical to the two brand blues above; re-sample precisely in a future VERIFY pass if exact hex is needed) | |
| Logo | "NH" wordmark in navy + a small leaf/clover icon in gold/mustard yellow, "투자증권" in navy | |

**This is a genuinely different palette family from both sibling domains** — the NDS/MTS app (`../../nds`) uses a green brand color (`#84C13D`), and the namuh site (`../../nhnamuh-production`) uses a teal family (`#00A5BD`/`#0A808C`). All three are real, distinct NH design languages — don't default to one when building for another.

## Layout notes (homepage, desktop)

- Header: logo left, 6-item GNB center/right, "전체메뉴" grid-icon launcher far right, utility bar above.
- Hero: full-width banner, current campaign is "일 잘하는 증권사가 만든 N2, IMA①" (product-launch style hero with a professional-photography background and dark overlay) — **this is campaign content, expect it to change on a normal marketing cadence; don't treat the specific copy/imagery as a structural fact to preserve, only the banner's existence/placement is structural.**
- No "증권사 사칭 주의" (broker-impersonation warning) callout observed on this homepage in this pass, unlike namuh's homepage — worth re-checking in a future VERIFY pass since this kind of security notice can be added/removed independent of a real redesign.

## How this feeds BUILD mode

When asked to add a new top-level menu item, page, or feature to nhsec.com (or something meant to match it), use the 6-category GNB pattern above and the blue-family palette — not the NDS app's green or namuh's teal. If the request is ambiguous about which NH property it targets, ask rather than assuming.
