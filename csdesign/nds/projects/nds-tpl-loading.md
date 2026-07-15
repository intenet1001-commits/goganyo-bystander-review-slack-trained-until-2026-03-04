---
name: nds-tpl-loading
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=16397-3177"
learned_date: 2026-07-15
sections_studied:
  - "28862:55759 (title 'Screen Loading' / 'QV-NM Template Guide') + 4 usage screens: Screen Loading_NM (28862:55780), Screen Loading_N2 (36797:3809), Screen Loading_QV (30455:1017, hidden), Screen Loading popup (29388:4357)"
  - "16397:3456 (title 'Skeleton Loading' / 'QV-NM Template Guide') + skeleton examples: 나의자산현황_NH투자증권_상품별자산 (23598:2390), 2025 NEW 홈 (34264:9519), 시킹알파 뉴스_스켈레톤 (34257:67713), symbol 다른은행증권_스켈레톤 (23603:308)"
  - "29388:16128 (small caption 'Text' — states Lottie JSON delivery spec: 나무=loading_nm.json, QV=loading_qv.json, Size 40*40)"
status: net-new — Core has no loading/spinner/skeleton entry; this page fills the gap
---

# NDS Templates — Loading 로딩

Two title sections on one page: **"Screen Loading"** (spinner-style, full or partial) and **"Skeleton Loading"** (content-shaped grey placeholders). Both titles screenshot-confirmed matching their on-canvas headings exactly.

## Patterns found

1. **Full-screen center-icon spinner** (`Screen Loading_NM`, `_QV`) — blank content area, single centered brand-mark icon (`nds_icon_ci`, real remote instance, `Channel=QV` variant key `29503935a4…`) sits where a Lottie animation renders. Caption: **"화면 전체 한번에 불러올 시"** (when loading the whole screen at once).
2. **Inline/partial loading over real content** (`Screen Loading_N2`) — a small round "N2" badge overlays an already-rendered list screen (공지사항/notices), i.e. content is visible while a secondary async fetch completes. No caption node found directly tied to this screen (nearest captions belong to the NM/popup variants).
3. **Popup-embedded loading** (`Screen Loading` / popup variant) — dim overlay + bottom-sheet popup: title "제3자 정보 제공 동의 내역 조회", a small dot loader (`loading_nm.json` placeholder), body copy **"잠시만 기다려주세요 화면을 나가면 조회가 중단돼요."** (please wait — leaving the screen cancels the lookup), and a disabled-state bottom CTA reading **"정보를 불러오는 중이에요"** (built from `btn_bottom_page` SET, variant `Channel=NM, Type=1-btn, Status=disabled`). Caption: **"팝업 내 일부 데이터 조회 시"** (when fetching partial data inside a popup).
4. **Skeleton loading** — grey rounded-rectangle placeholders shaped like the eventual content, no shimmer visible in a static screenshot (animation not verifiable per instructions). Three genuinely different skeleton compositions: a simple 3-block account-balance skeleton, a rich home-feed skeleton (card pairs + list rows), and a news-list skeleton (avatar circle + text bars + thumbnail square, repeated). Caption: **"화면 진입 후 컨텐츠 불러올 시"** (when loading content after entering the screen). One outlier: the `symbol` node named `다른은행증권_스켈레톤` ("other-bank-securities skeleton") actually renders **real populated data**, not a skeleton — name/content mismatch, flagged not resolved.

**The loading graphic itself is not a Figma component.** `loading.json` (28862:55938) and `loading_nm.json` (29388:4386) are plain `RECTANGLE` nodes — placeholders standing in for an externally-delivered Lottie animation, confirmed by caption text (verbatim): *"Json 파일 개발 전달 완료 / 나무 : loading_nm.json / QV : loading_qv.json / Size : 40*40"*. So there is no `SET`/`COMPONENT` key for the spinner graphic — engineering swaps in a 40×40 Lottie JSON file per channel (나무=NM, QV) instead.

## Names — reliable (screenshot-confirmed for this page)

Both title frames match on-canvas headings exactly ("Screen Loading" / "Skeleton Loading"). Screen-variant names (`Screen Loading_NM/_N2/_QV`) and component instance names (`header_basic`, `quickmenu_basic`, `searchbar_basic`, `btn_bottom_page`, `공지사항_소비자보호`) all read as their real identity. `loading.json`/`loading_nm.json` layer names are literally the delivered asset filenames — informative, not placeholder junk.

## Keys (Gotcha 5 — kind reported), all sampled via explicit node ID, none threw

| Instance | variant | main key (kind) | remote | parent SET | parent SET key |
|---|---|---|---|---|---|
| `36797:3959` 공지사항_소비자보호 | — | `e0ead920aab7a77aee142cb5a53219cf12b32c7e` (standalone COMPONENT, no SET) | true | — | — |
| `29388:4380` btn_bottom_page | `Channel=NM, Type=1-btn, Status=disabled` | `53b6e4e64922d3a4ee54588ba925ba54983ec52e` (variant COMPONENT) | true | `btn_bottom_page` | `accfb243ce752fd894af2b6db081b1074022a39d` |
| `23598:2487` quickmenu_basic | `Channel=NM, Type=normal` | `0b75c3c90ea55d51fd61cbd25802aa23a530f0e4` (variant COMPONENT) | true | `quickmenu_basic` | `9c5dd3cd3e714255914cf288f442fad7c3ac76dd` |
| `23598:2485` header_basic | `Channel=NM, Left Icon=on, Right Icon=off` | `c7706f72a18d458759548113071367745adc8d96` (variant COMPONENT) | true | `header_basic` | `c95043e94317fde7230298017f42dd8099e1cbdc` |
| `34257:67852` searchbar_basic | `Type=left-solid, Status=normal` | `65b9cd256a3bb66aa4738b5626bf8a934e502927` (variant COMPONENT) | true | `searchbar_basic` | `755deb62dc296ad41135fb0147e814de64cb7e08` |
| `30455:1042` nds_icon_ci | `Channel=QV` | `29503935a48c4e41492f9921703c893da942a327` (variant COMPONENT) | true | (icon set, not sampled) | — |

`btn_bottom_page` SET key matches the already-established value (≠ Core's `btn_bottom_page_assets`). `quickmenu_basic` and `header_basic` SET keys match Core exactly (further corroborating sightings). `searchbar_basic` SET key matches `nds-tpl-search-bar`'s finding exactly — cross-file corroboration.

## ANSWERS

**Patterns present:** all four — full-screen spinner, inline/partial-overlay spinner, popup-embedded spinner+progress-copy, and skeleton (3 layout variants). No plain linear progress-bar pattern found.

**Duration/threshold rule:** **blank at source.** No text anywhere on the page states a duration, a "show only after Nms" delay-threshold, or a max-display time. The only numeric spec found is the Lottie asset size (40×40px), not timing. This echoes `nds-ux-guide-nudge`'s two unresolved blanks (toast 최대 글자수 = `논의`; snackbar 지속 시간 = empty) — a third timing-spec gap in this file family. Do not invent a number.

## BLANKS

- No duration/threshold/"show after Nms" rule stated anywhere on this page.
- `Screen Loading_N2`'s caption ownership is ambiguous — no text node sits directly under it; nearest captions belong to sibling variants.
- `다른은행증권_스켈레톤` symbol shows real populated data, not a skeleton — name/content mismatch, unresolved.
- `Screen Loading_QV` (30455:1017) is `hidden="true"` → screenshot is a blank 1×1, unverified, its `nds_icon_ci` key was still resolvable by explicit ID (component itself loads even though the frame is hidden).
- Two "토스트/체결알림 정의" (Toast/execution-alert definition) text nodes sit on this Loading page (near the NM and popup screens) — content unrelated to loading; likely leftover/mislabeled captions, not investigated further.

## CORE

No loading/spinner/skeleton entry existed in Core — this page is a net-new fill. Add: no dedicated "spinner" component exists in NDS_Library; loading indicators are externally-delivered 40×40 Lottie JSON files (`loading_nm.json`/`loading_qv.json`) dropped into a placeholder rectangle, not a Figma SET.
