---
name: nds-ux-guide-updown-notation
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=2681-38"
learned_date: 2026-07-15
sections_studied:
  - "2681:1939 (cover — title '등락표기 가이드', UX GUIDE, Last update 25.03.19; index lists 2 sections: 01 등락표기 정의, 02 사용처별 표기 예시)"
  - "3472:23579 (on-canvas '01 [시세] 시각 강조형(삼각형) 등락 표기' — the ▲/▼ triangle rule + definition)"
  - "3472:21969 (on-canvas '01 사용처별 예시_현재가' — full-card color-coded 상승/보합/하락 example on a real 삼성전자 현재가 screen)"
  - "3473:26910 (on-canvas '01 사용처별 예시_지수, 관심그룹' — index carousel + watchlist table examples)"
  - "3473:57214 (on-canvas '01 사용처별 예시_...' — watchlist detail popups + individual stock detail cards, 국내/해외 examples)"
  - "3473:26853 (on-canvas '02 [시세] 단순 부호형 (+,-) 등락 표기' — the +/- sign rule + exception for return-only financial products)"
  - "3473:35727 (on-canvas '02 사용처별 예시_홈' — home feed cards, top-gainer avatars, news feed)"
  - "3473:48368 (on-canvas '02 사용처별 예시_미니현재가' — news detail header, 시킹알파-style analyst card, community channel post)"
  - "3477:27258 (on-canvas '02 사용처별 예시_예외케이스 금융상품' — bond/RP yield cards, no +/- sign at all)"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as design-rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — 등락기호표기 (Price Up/Down Notation)

Part of the NDS_UX Guide file's "등락기호표기" canvas — the design team's rulebook for how to represent stock/index price movement (up/down/flat) across the app. This is a **rules document**, not a product screen: use it to validate/generate any price-change UI, not as a layout or flow reference (that's `csdesign/asset`'s job).

Two parallel notation systems are defined, each with its own "사용처별 표기 예시" (usage-by-surface examples) sub-section. Which one applies depends on *where* the value appears, not just what the value is.

## 01. [시세] 시각 강조형(삼각형) 등락 표기 — Triangle notation (for price/quote surfaces)

Rules, verbatim:
- *"등락기호 ▲, ▼는 주식 시세의 등락가가 전일 대비 상승 또는 하락한 상태를 나타낼 때 사용하며, 숫자(등락가) 앞에 붙여 표시합니다."*
- *"▲, ▼ 기호를 사용할 때는 통화 기호(예: $, 원)를 함께 표기하지 않습니다."*
- *"보합일때는 등락기호를 사용하지 않습니다."* (flat/unchanged gets no triangle at all, just the bare value)
- Rate-alongside-price rule: *"등락가에만 등락기호를 표기, 등락률은 기호를 생략합니다."* — when both 등락가 (change amount) and 등락률 (change %) are shown together, only the amount gets the ▲/▼ prefix; the percentage is shown bare in parentheses, no icon.
- Scope limiter, verbatim: *"※ 사용자가 시세를 자주 확인하는 지수·현재가·관심그룹·종목요약 팝업에 한해 본 표기 방식을 적용합니다."* — i.e. this triangle system is explicitly scoped to **frequently-checked quote surfaces**: 지수(index), 현재가(current price), 관심그룹(watchlist), 종목요약 팝업(stock summary popup). It is not a blanket rule for every numeric delta in the app (see the +/- system below for the rest).

### Color convention (Korean market convention — confirmed, not guessed)
- **상승 (up) = red** — ▲ triangle + value in red (e.g. `▲ 14.89`)
- **하락 (down) = blue** — ▼ triangle + value in blue (e.g. `▼ 14.89`)
- **보합 (flat) = green**, no triangle, just the bare value (e.g. `0`)

This is the reverse of the US convention (green=up/red=down) — expected for a Korean market app, but the **green-for-flat** choice (rather than gray/black) is a specific NH detail worth not assuming from general market convention. Confirmed both in the isolated example card and in the full 삼성전자 현재가 screen mockup, where the entire price card background (not just the text) is tinted red/green/blue to match — 상승 = full red card, 보합 = full green card, 하락 = full blue card.

### Real-screen usage confirmed
- **현재가 (current price) screen**: 등락가 gets the ▲/▼ prefix inside a small pill; 등락률 sits next to it in parentheses, no icon — both pill and price-card background are colored to match the direction.
- **지수 (index) home-feed tiles**: same ▲/▼-on-amount, bare-%-alongside pattern, e.g. `2,574.28` / `▲36.92 (1.42%)`.
- **관심그룹 (watchlist) table**: 등락가 column shows the triangle, 등락률 column (separate column) is bare (colored, no icon) — confirms the "one value gets the icon, not both" rule extends to tabular layouts, not just inline pairs.
- **개별 종목 detail card / popup**: same convention on 등락가 (e.g. `▲4.2`) next to a bare colored 등락률 badge (e.g. `2.48%`).

## 02. [시세] 단순 부호형 (+,-) 등락 표기 — Plus/minus notation (for standalone rate/return values)

Rules, verbatim:
- *"시세 등락률, 수익률만 단독으로 표기할 경우에 사용합니다."* — used when a rate or return is shown **by itself**, without an accompanying price/amount.
- *"상승은 +, 하락은 −를 표기하고, 보합일때는 기호를 사용하지 않습니다."* — same flat-gets-no-symbol rule as the triangle system, but up/down markers are plain `+`/`−` signs, not triangles. Color is still red(up)/blue(down)/green(flat) — same palette as system 01, only the glyph changes.
- **Exception, verbatim**: *"마이너스 수익률이 노출될 가능성이 없는 금융상품 화면에서는 + 부호를 생략합니다."* — on financial-product screens where a negative return is structurally impossible (e.g. fixed-rate bonds, RP products), the `+` prefix is dropped entirely even for a positive value — shown as plain `3.34%` in red, not `+3.34%`. Confirmed on real 채권(bond, both card-type and list-type) and RP-매매 product screens.

### Real-screen usage confirmed
- **Home feed** (발견/오늘의 손익 승자 등): stock tickers and top-mover avatars show 등락률 alone as `+4.56%` / `-5.35%` / `-2.59%` etc. — plain sign, no triangle, matching the "standalone rate" scope.
- **미니현재가 contexts** (news detail header, 시킹알파-style analyst card, community stock-channel post header): same +/- pattern, e.g. `+1.16%`, `(-3.11%)`, `+7.14%`. **Observed inconsistency worth flagging**: the community-channel example (카카오뱅크 809,000 +7.14%) shows the +/- pattern used *alongside* a price value (809,000), not standalone — which reads as a soft violation of the "단독으로 표기할 경우에 사용" rule as literally written. Likely because that mini-card treats price+rate as one compact unit rather than "시세" in the strict sense the guide means; flag this as a real-world edge case rather than assuming the written rule is violated arbitrarily.
- **예외케이스 금융상품 (bond/RP yield cards)**: both 카드형 (card) and 목록형 (list) layouts confirmed — yield shown as bare `3.34%` / `3.28%` / `3.19%` in red, no `+`, because negative return can't occur on these product types.

## How this feeds BUILD mode

When generating or reviewing NH MTS screens (via `csdesign` → `nds/LEADER.md` Mode 2), before rendering any price-change value:
1. **Decide which system applies first**: is this a 지수/현재가/관심그룹/종목요약-popup context (→ triangle system) or a standalone rate/return display elsewhere (→ +/- system)? Don't default to one everywhere.
2. Apply color: red = 상승, blue = 하락, green = 보합 (never gray/black for flat).
3. Flat values get **no** directional glyph at all (neither ▲/▼ nor +/-) — just the bare number.
4. If both a change-amount and a change-% are shown together, only ONE of them carries the glyph (the amount, in the triangle system) — the other is bare-colored.
5. On financial-product screens where negative isn't possible (fixed-income yield, RP rates), drop the `+` prefix too — plain colored number, no sign of any kind.
6. Never pair a currency symbol ($, 원) with a ▲/▼ triangle on the same value.
