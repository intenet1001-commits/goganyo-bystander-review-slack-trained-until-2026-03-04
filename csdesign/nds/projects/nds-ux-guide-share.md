---
name: nds-ux-guide-share
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=1904-9530"
learned_date: 2026-07-15
sections_studied:
  - "1906:27291 (frame '👍 thumbnail' — page cover)"
  - "1906:27283 (frame '01' → INDEX: '01 APP 공유하기_이미지 저장 없을 때', '02 APP 공유하기_이미지 저장 있을 때', '02 WEB 공유하기' — the third item is mis-numbered '02' in the index itself)"
  - "1906:27309 (frame '02' → on-canvas 'case 01 APP 공유하기 / 이미지 저장 없을 때')"
  - "1908:28491 (frame '03' → on-canvas 'case 02 APP 공유하기 / 이미지 저장 있을 때' — steps ①②)"
  - "1908:28999 (frame '04' → on-canvas 'case 02 앱 내 공유하기 / 이미지 저장 있을 때' — step ③; note the eyebrow reads '앱 내 공유하기', not 'APP 공유하기' as on frame '03')"
  - "1908:28725 (frame '05' → on-canvas 'case 03 WEB 공유하기')"
  - "2662:1456 (frame '7' → on-canvas 'case 03 WEB 공유하기 (이벤트)')"
  - "2644:1420 (frame '06' → on-canvas '썸네일 샘플' — sits AFTER frame '7' on canvas despite the lower layer number)"
  - "1908:28490 (a large free-floating TEXT node parented to the page — the designer's rationale note on why Kakao API is used on web but not in the app; not inside any frame)"
  - "2662:3230 (Update_History_01 — version table)"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as design-rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — 공유하기 (Share)

Part of the NDS_UX Guide file's "공유하기" canvas (page group "Patterns"). Tagged **"NHI Design Principle"** in the guide's own corner label. Covers the three share surfaces: app share without a saved image, app share with a saved image, and web share.

**Frame-numbering gotcha confirmed again**, in two distinct forms on this page:
- layer `02` → on-canvas **"case 01"**; layer `03` → **"case 02"**; layer `05` → **"case 03"**. The usual off-by-one.
- **Canvas order ≠ layer order**: layer `7` (case 03 WEB 공유하기 (이벤트)) sits *before* layer `06` (썸네일 샘플) on the canvas. Reading frames in layer-name order gives the wrong sequence.

**Error in the guide's own INDEX** (not a Figma artifact — the visible on-canvas text): the index lists
> "01 APP 공유하기_이미지 저장 없을 때 / **02** APP 공유하기_이미지 저장 있을 때 / **02** WEB 공유하기"

The third entry is numbered **02** but the corresponding section's own heading says **case 03**. Trust the section headings (01 / 02 / 03); the index's third number is a typo.

**Terminology inconsistency**: the eyebrow label for case 02 reads **"APP 공유하기"** on frame `03` but **"앱 내 공유하기"** on frame `04` — same case, two names. Not a distinction; just drift.

## case 01 — APP 공유하기: 이미지 저장 없을 때

For sharing a *screen/article* (e.g. a Financial Times 상세 news page) where there is no generated image asset.

> ① **공통 헤더 아이콘 사용**

> ② **OS 기본 공유 팝업 호출**
> *"\*카카오톡 다이나믹링크 iOS 버그로, 앱에서는 카카오톡 공유 바로 호출 불가."*
> *"\*앱 내 카카오톡 공유 API 적용하려면 앱수정, 업데이트 필요."*
> "안드로이드, 아이폰 OS 별 동작 차이 있음"

So: in the **app**, the share icon lives in the standard header (`nds_icon_header`-family share glyph) and fires the **OS share sheet** — not a custom Kakao sheet. The two red asterisk notes are the stated reasons.

## case 02 — APP 공유하기 (앱 내 공유하기): 이미지 저장 있을 때

For sharing *generated image content* (e.g. 미국주식 나무팜 card, 내 점수 자랑하기, 수익률 공유하기).

> ① **'공유하기' 템플릿 사용** (rendered as a link on canvas — points to a separate 공유하기 템플릿 resource)

> ② **OS 기본 공유 팝업 호출**
> (same two red asterisk notes as case 01: iOS 다이나믹링크 버그 / 앱수정·업데이트 필요)
> "안드로이드, 아이폰 OS 별 동작 차이 있음"

> ③ **앨범에 이미지 컨텐츠 저장**
> **"컨텐츠에 따라 이미지 높이는 가변이며, 최대 높이는 618px"**

The template exposes a 3-action row beneath the image card: **공유하기 / 이미지 저장 / 커뮤니티 게시**. Tapping 이미지 저장 saves to the album and shows a toast — on-canvas copy: *"이미지를 저장했어요"*. The saved image carries a `namuh` watermark + timestamp (e.g. "2024.09.19 09:41") in its footer.

**618px is the only hard numeric spec on this page.** Image width is fixed by the template; height is content-variable up to that cap.

## case 03 — WEB 공유하기

The web surface is where the rules diverge sharply from the app.

> ① **웹 공유 시 '카카오톡, 링크 복사, 더보기' 구성을 공통으로 사용**
> - "카카오톡 버튼 누를 경우, 카카오톡 앱의 '공유 대상 선택' 화면 호출"
>   *"\*카카오톡 설치 안 된 경우, 앱스토어로 이동"*
> - "링크 복사 누를 경우, 해당 화면 URL 복사"
> - "더보기 누를 경우, OS공유 팝업 호출"

> ② **공유 대상 선택 시 카카오톡 공유하기 API로 설정한 썸네일 전송**
> **"공유하기 썸네일은 '썸네일' 템플릿 사용"** (link on canvas)

So on **web** the share icon opens a small custom 3-item menu (카카오톡 / 링크 복사 / 더보기) — **not** the OS sheet directly; the OS sheet is demoted to the "더보기" item. This is the inverse of the app, where the OS sheet is the whole interaction.

### case 03 — WEB 공유하기 (이벤트)

An event-page variant:
> ① "헤더(상단 고정) 닫기버튼 왼쪽에 공유하기 아이콘 노출"

> ② **OS 기본 공유 팝업 호출**
> *"\*단발성 이벤트에는 카카오 디밸로퍼스 커스텀이 필요한 카카오톡 공유하기는 하지 않음."*
> "안드로이드, 아이폰 OS 별 동작 차이 있음"

**Important exception**: one-off event pages **skip** the Kakao button and go straight to the OS share sheet — i.e. the ① rule above ("카카오톡, 링크 복사, 더보기 공통 사용") does **not** apply to 단발성 이벤트. The stated reason is the Kakao Developers custom setup cost. Icon placement: to the **left of the close (✕) button** in the fixed header.

## 썸네일 샘플 (Thumbnail samples)

A gallery of real KakaoTalk-rendered share cards, showing the accepted thumbnail forms:
- Link-preview cards branded `namuh` (`namuh.page.link`) and `QV` (`qv.page.link`) — the two channels
- Content cards: 차트분석 AI 차분이, 팡팡 파라 파라 팡팡팡 (nami/namuh branded)
- NH투자증권 official KakaoTalk channel messages (1544-0000): "선물이 도착했어요!" in two colorways (green→나무증권에서 선물받기 / blue→큐브에서 선물받기), and a 투자, NH와 똑똑하게 news card with a 자세히보기 CTA

The green/blue split maps to the `Channel` variant convention documented in the Core reference (`NM` = 나무 vs `QV`) — 나무 gets green, QV gets blue. Consistent with the rest of NDS.

## Designer's rationale note (free-floating text `1908:28490`)

Verbatim, the guide's own explanation of the app/web asymmetry:

> "웹 카카오 API 를 적용한 이유
> - Web에서 Web Share(OS공유)를 적용하려고 하였으나, 안드로이드 폰에서 오동작 케이스가 많았음
> - 차트 손금 웹 화면에서 카카오API 를 적용 요청
> - 카카오공유 api 의 UI가 커스터마이징 하기 좋아서 채택
> - 카카오공유 api 에 네이버 클라우드 CDN 웹 서비스 주소를 적용하여 사용
>
> 앱에서는 카카오 API 적용 안 되는 이유
> - MTS의 OS 공유하기 또한 일부 폰에서 오동작 및 안드로이드/아이폰 동작 차이가 있음(특히 iOS 카카오톡 다이나믹링크 버그로 인해 카카오톡에서 공유 기능을 사용할 수 없음)
> - MTS에 카카오공유 API 를 적용하려면 앱 수정 및 업데이트를 해야함(시간이 오래 걸림)"

This is the highest-value find on the page: it documents that the app-vs-web split is a **workaround, not a design preference**. If the iOS dynamic-link bug is fixed or an app update ships the Kakao SDK, the app rule is expected to converge on the web rule. Treat "app = OS sheet only" as *current-state*, not a principle.

## How this feeds BUILD mode

When generating or reviewing an NH MTS screen with a share affordance:

1. **Decide app vs web first — they have different share UIs.**
   - **App**: share icon in the standard header → **OS share sheet**. Do not draw a custom Kakao/링크복사 menu in an app screen.
   - **Web**: share icon → custom 3-item menu **카카오톡 / 링크 복사 / 더보기**, in that order. "더보기" is the OS sheet.
2. **Web 단발성 이벤트 pages are the exception** — OS sheet directly, no Kakao button. Share icon goes immediately left of the header's close (✕) button.
3. **Sharing an image?** Use the **공유하기 템플릿** with its 3-action row (공유하기 / 이미지 저장 / 커뮤니티 게시). Image height is content-variable but **capped at 618px**. Saved images carry the `namuh` watermark + timestamp and confirm with a "이미지를 저장했어요" toast.
4. **Kakao thumbnails use the 썸네일 템플릿** — don't hand-compose a preview card. Match the channel: 나무/`NM` → green, QV → blue.
5. **Never promise in-app Kakao share.** The iOS dynamic-link bug makes it non-functional; it needs an app update. If a spec asks for it, flag it as blocked rather than mocking it.
6. **Assume OS behavior differences** between Android and iOS ("안드로이드, 아이폰 OS 별 동작 차이 있음" is repeated on every case) — don't over-specify the OS sheet's contents in a design.
