---
name: mynamuh-com-homepage
url: "https://www.mynamuh.com/"
learned_date: 2026-07-15
pages_studied:
  - "https://www.mynamuh.com/ (homepage, desktop viewport 1440x900)"
status: live production website (나무/namuh discount-brokerage sub-brand site — not a Figma file, expect drift over time)
---

# mynamuh.com — Homepage (나무/namuh sub-brand website)

Live production website for NH투자증권's "나무(namuh)" discount/direct-trading sub-brand — a sibling of `../../nhsec-production`'s main site, same underlying template, different content/skin. Learned by browsing the real page (Chrome `use_browser` tool), not Figma.

## Access quirks

Identical platform to nhsec.com — see `../LEADER.md` Tooling note and `../../nhsec-production/LEADER.md`'s note in full; both apply verbatim here (iframe shell via `iflg_body`, `main.html` + `ticker.html` sub-frames, notice-popup-opens-its-own-tab behavior, same `ul.mn_list`/`.mn_sub dl` mega-menu markup). Font is also `Dotum, 돋움, sans-serif`, same as the main site.

## Nav structure (GNB)

**Utility bar** (same pattern as nhsec.com): 로그인 · 인증센터 · 개인정보수정 · 전자민원접수 · 금융소비자보호 · 상품공시실 · 회사소개

**Main GNB** (`ul.mn_list > li`, 6 top-level categories, logo "namuh 나무증권" at far left, with a solid teal horizontal accent bar directly under the whole header — not present on nhsec.com):

1. **나무(namuh)란?** — brand explainer; **this item does not exist on nhsec.com's GNB** — namuh needs to introduce itself as a sub-brand, the main NH site doesn't.
2. **뱅킹/계좌정보** — quick links: My자산, 계좌전환, 은행이체입출금, 진행중인 청약
3. **주식/파생상품안내** — quick links: ETF(상장지수펀드) 소개, 해외주식투자가이드, 해외선물옵션 투자가이드, NH트레이더
4. **투자정보** — quick links: 최신 리포트, 리서치센터 공지사항, 주식길라잡이
5. **금융상품** — quick links: 펀드검색, 청약중인 상품, 해외채권, IMA 투자가이드
6. **고객센터** — quick links: 금융소비자 보호체계, 계좌개설안내, HTS, 인증/OTP 센터

**Diff vs. `../../nhsec-production`'s registered nav** (recorded per that domain's Mode 1 instruction to compare against the sibling):
- **Added**: 나무(namuh)란? (brand-explainer, namuh-only)
- **Dropped**: 연금자산 (pension assets — not offered/promoted as a top-level namuh category)
- **Same 4 core categories, reordered**: 뱅킹/계좌정보, 주식/파생상품안내, 투자정보, 금융상품, 고객센터 all appear on both sites with near-identical quick-link subsets, just in a different tab order (namuh puts 금융상품 5th; nhsec puts it 1st) — the underlying category set is shared NH-wide, only the emphasis/ordering and the presence of a brand-explainer/pension category differs per site.

## Color palette (sampled from real computed styles)

| Role | Value | Notes |
|---|---|---|
| Section/card background | `rgb(240, 243, 248)` ≈ `#F0F3F8` | **Identical to nhsec.com** — shared template-level section background across both sites |
| Surface white | `#FFFFFF` | Shared |
| Off-white surface | `rgb(251, 252, 253)` ≈ `#FBFCFD` | Shared |
| **Primary brand teal (bright)** | `rgb(0, 165, 189)` ≈ `#00A5BD` | namuh's distinguishing accent — used for the header's underline bar and primary CTA button ("자세히 보기") |
| **Primary brand teal (deep)** | `rgb(10, 128, 140)` ≈ `#0A808C` | Deeper teal, likely hover/pressed state |
| Muted teal-gray text | `rgb(97, 120, 123)` ≈ `#61787B` | Secondary text tone, teal-tinted counterpart to nhsec.com's blue-gray `#607792` |
| Logo | "namuh" wordmark in black + a small leaf/bird icon in teal, "나무증권" in gray beside it | |
| Quick-link tile tiers (visual, not yet computed-style-confirmed) | Right-side "처음오셨나요?"/"모바일 트레이딩 나무증권" panels use a **tiered blue-family palette** (navy, medium blue, teal) across individual tiles (계좌개설/원격제어/추천펀드 etc. each a different shade) — layered on top of the teal brand accent, not a strict single-hue system. Re-sample exact hex values in a future VERIFY pass if precision is needed for a BUILD task touching these tiles specifically. |

**Structural section backgrounds (`#F0F3F8`/white/`#FBFCFD`) are shared exactly with nhsec.com** — confirms both sites run the same underlying template/design system for layout scaffolding, and only the **brand accent color** (teal here vs. blue on nhsec.com) plus nav content differs. When building for namuh, reuse the shared neutral tokens but always the teal accent, never nhsec.com's blue or the NDS app's green (`../../nds`).

## Layout notes (homepage, desktop)

- Header: logo left, 6-item GNB, teal accent bar directly beneath the whole header (nhsec.com has no equivalent — its header sits flush with no colored underline).
- A "증권사 사칭 주의" (broker-impersonation warning) callout box appears on namuh's homepage (right column, red warning-triangle icon) — **not observed on nhsec.com's homepage in this pass**. Could be a real difference (namuh, as a discount/low-recognition brand, may be a more common impersonation target) or could be homepage-rotation content on either site — flag for a future VERIFY pass rather than treating as certain.
- Market-index ticker bar (KOSPI/KOSPI200/KOSDAQ/선물) rendered inline on the homepage itself (below the quick-access panels), not just in the separate scrolling `ticker.html` iframe — same live-data pattern likely shared with nhsec.com (not directly compared in this pass).
- Notice/consumer-alert list ("공지사항 | 소비자 경보") + a market-index summary panel side by side — standard content-page layout below the hero, likely shared structurally with nhsec.com.

## How this feeds BUILD mode

When asked to add a new top-level menu item, page, or feature to mynamuh.com (or something meant to match it), use the nav pattern above (6 categories, including the namuh-specific brand-explainer item, no 연금자산) and the teal-family palette — not nhsec.com's blue or the NDS app's green. If a requested feature is pension-related, double check whether it belongs on namuh at all, since 연금자산 isn't part of this site's nav today.
