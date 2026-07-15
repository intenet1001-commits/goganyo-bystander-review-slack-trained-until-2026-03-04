---
name: nds-tpl-alarm
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=17659-4250"
learned_date: 2026-07-15
sections_studied:
  - "17659:4250 (page '    -  Alarm  알림' — canvas holds exactly 2 top-level mockup frames + 2 free-floating labels. No other content.)"
  - "17692:3528 ('kakaotalk mockup' — on-canvas heading '알림톡'. Full KakaoTalk chat-app screenshot mockup showing two stacked NH투자증권 알림톡 (AlimTalk) message bubbles.)"
  - "17692:3533 / 17692:3545 ('내용' frames — the 알림톡 message body text, real Korean copy: 채권 환불/배정 안내)"
  - "18036:541 ('device mockup' — on-canvas heading '푸시알림'. Full iOS lock-screen screenshot mockup with two stacked native push-notification banners.)"
  - "17692:3619 / 18036:542 ('Notification - Collapsed' frames — App Icon instance + Title/Time/Description text stack, real copy: 채권청약 / 배정 및 환불금 안내)"
  - "38486:65989 / 38486:65991 (free TEXT nodes '푸시알림' / '알림톡' — the section labels sitting above each mockup, confirmed matching on-canvas headings)"
status: internal NDS component-library guide (NDS_Templates, subscribes to NDS_Library — real remote components, not local doc copies)
---

# NDS Templates — Alarm 알림

The page is small and narrow in scope: **exactly two full-screen mockups**, each a realistic screenshot-style composition rather than a rules document or a variant showcase. `get_metadata` on `17659:4250` returns only these two frames plus their two floating section-label texts — no hidden frames, no additional sections, nothing else on the canvas.

## Layer-name convention — confirmed reliable on this page

Both top-level frame layer names (`kakaotalk mockup`, `device mockup`) do **not** literally match their on-canvas headings, but the two free-floating TEXT labels (`38486:65989` = "푸시알림", `38486:65991` = "알림톡") sit directly above each mockup and **do** match what's visually rendered — confirmed via screenshot. So: trust the floating section-label text nodes for section identity on this page, not the frame names themselves (the frame names are internal/descriptive, e.g. "device mockup" for the push-notification screen). This is a milder version of the frame-vs-heading mismatch seen elsewhere in this domain, not the same failure mode — here the mismatch is frame-name-vs-label, and the label itself is trustworthy.

## The two patterns

### 알림톡 (AlimTalk) — `17692:3528`

A full KakaoTalk chat UI screenshot (status bar, NH투자증권 verified header, search/menu icons, message input bar) containing two stacked yellow "알림톡 도착" message cards from NH투자증권. Real Korean product copy:

> "[NH투자증권] 환불/배정 안내
> 김\*투님 200-02-03\*\*\*4
> 종목명 : 국고0340-3406(24-1)
> 배정금액 : 9,000,000원
> 환불금액 : 1,000,000원
> 입고예정일 : 2024.06.20
> ※ 환불일 오전에는 이체출금 집중으로 업무처리 지연이 예상되니, 가급적 오후시간대에 이용하시기를 부탁드립니다.
> ※ 고객지원센터 및 영업점 문의는 오전 8시이후 부터 가능합니다.
> ※ 청약 계좌에 출금가능금액이 부족시, 기타 대여금이 발생되오니 유의하시기 바랍니다."

This is the KakaoTalk-channel counterpart to `nds-ux-guide-alimtalk` (the UX Guide's outbound-copy rules page) — this page shows the actual rendered card, that one governs the writing structure (제목→요약→상세→설명→참고). Consistent five-slot shape is visible here: 안내 title / 수신자+계좌 / 상품 상세 (표) / 안내문구 (3개 ※) — no 참고 slot rendered in this particular example.

### 푸시알림 (Push notification) — `18036:541`

A full iOS lock-screen screenshot mockup (status bar, date/time, wallpaper) with two stacked native notification banners, each built from an `App Icon` instance + Title/Time/Description text stack (`Notification - Collapsed` → `Notification` → `Title, Time and Description` → `Title and Time` + `Description`). Real copy:

> "국고0340-3406(24-1) 채권청약 — 청약일정 : 2025.06.13 ~ 06.17" (9:41 AM)
> "채권 배정 및 환불금 안내 — 청약일정 : 2025.06.13 ~ 06.17" (9:41 AM)

Both notifications share the identical NH icon and timestamp — a matched-pair example of a lifecycle notification (신청 → 배정/환불) rather than two unrelated examples.

## Componentry — 1 real tier only

Fanned out `getMainComponentAsync()` over every INSTANCE under `17659:4250`:

| Instance | Main component | key | remote |
|---|---|---|---|
| `17692:3621` "App Icon" (kakaotalk mockup context — actually part of the push-notification frame's App Icon slot, first occurrence) | `No App Icon` | `3ccbd0f05ba5c7fdce71345f875a62a849963c5b` | **true** |
| `18036:544` "App Icon" (second push notification) | `No App Icon` | `3ccbd0f05ba5c7fdce71345f875a62a849963c5b` | **true** |

Both instances resolve to the **same** remote, published component — `remote: true` confirms the preloaded verdict that NDS_Templates subscribes to NDS_Library (unlike NDS_M.web). No COMPONENT/COMPONENT_SET nodes exist locally on this page (`findAllWithCriteria` for those types returned zero) — everything componentized here is imported, nothing is page-local doc scaffolding. `findAllWithCriteria` for INSTANCE returned exactly 2 — the mockups are otherwise built from plain frames/rounded-rectangles/text/ellipses (the chat bubbles, phone chrome, wallpaper gradient are all hand-drawn, not componentized).

Note the variant is named `No App Icon` despite both mockups showing a visible NH leaf-icon — this is likely a mislabeled/default variant name in the library, not an indication the icon is absent (screenshot confirms the icon renders).

## ANSWERS to the assigned open question — still blank

**This page does NOT resolve either blank spec from `nds-ux-guide-nudge.md`.**

- **Toast 최대 글자수** (marked `논의` at source): not addressed. This page contains **no toast UI at all** — no floating pill/bar element anywhere in either mockup.
- **Snackbar 지속 시간** (blank bullet at source): not addressed. This page contains **no snackbar UI at all** — no message+button bar.

More fundamentally than `nds-mweb-dialog.md`'s near-miss (same topic, wrong content): **this page is not even about the same UI category.** `-  Alarm  알림` covers *outbound notification channels* — KakaoTalk AlimTalk messages and native OS push notifications, both of which fire when the app is backgrounded/closed. 토스트/스낵바/넛징 are *in-app* transient UI elements that only exist while the app is foregrounded. There is no reason to expect this page to carry those specs, and it doesn't. Both blanks remain open per `nds-ux-guide-nudge.md` and `nds-mweb-dialog.md`'s existing guidance — do not invent values.

## How this feeds BUILD mode

- Use this page as the reference for realistic AlimTalk/push-notification **mockup composition** (chat UI chrome, lock-screen chrome, matched-pair example copy) when a BUILD pass needs to depict a notification being received, not for in-app toast/snackbar/nudge work (route those to `nds-ux-guide-nudge`).
- The only reusable componentKey here is `No App Icon` (`3ccbd0f05ba5c7fdce71345f875a62a849963c5b`, remote) — the app-icon slot inside a push-notification mockup.
- Cross-reference `nds-ux-guide-alimtalk.md` for the AlimTalk writing structure this page's example instantiates.
