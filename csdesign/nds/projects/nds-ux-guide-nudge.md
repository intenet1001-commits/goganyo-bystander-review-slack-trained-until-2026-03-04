---
name: nds-ux-guide-nudge
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=2973-38"
learned_date: 2026-07-15
sections_studied:
  - "3006:21389 (frame '01' — INDEX. Lists 2 top-level sections: 01 모달_버튼 동작 유도 없음, 02 모달_동작 유도 있음. 'Last update 25.06.16'. Note: the index entries say '모달_...' but the actual section headings on the slides drop the '모달_' prefix — see mismatch note below.)"
  - "3000:416 (frame internally named '02', but on-canvas heading reads '01 동작 유도 없음' — the 토스트 (toast) definition slide)"
  - "3005:4171 (frame '3' → on-canvas '02 동작 유도 있음', case 01 스낵바 (snackbar))"
  - "3005:4241 (frame '4' → on-canvas '02 동작 유도 있음', case 02 넛징 (서비스 이동) — includes the 문장 구조 copywriting rules)"
  - "3000:461 (frame '참고.' → '참고. 스낵바 폼디 속성' — the snackbar FD (form-descriptor) property table: snacktype/text/duration/bgcolor/fgcolor/ok/okfgcolor/snackshapeinfo/animationFADE/bottomMargin/filename/linkdata)"
  - "2974:2938 (Update_History_01 — version history block; rows read 'v0.1 최초작성 / 2021.12.28 / 백채원')"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as design-rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — 넛징 (Nudge: 스낵바 / 토스트팝업)

Part of the NDS_UX Guide file's "Nudge 넛징 (스낵바, 토스트팝업)" canvas — the design team's internal rulebook for the three transient bottom-of-screen message patterns: **토스트 (toast)**, **스낵바 (snackbar)**, and **넛징 (nudge)**. Corner tag on each slide reads "NHI Design Principle".

This is a **rules document**, not a product screen.

**Frame-numbering gotcha confirmed again** (same as `nds-ux-guide-color-contrast`, `nds-ux-guide-touch-area`, `nds-ux-guide-account-controller`): the frame internally named **"02"** carries the on-canvas heading **"01 동작 유도 없음"**, and the frames named "3" and "4" both carry the heading **"02 동작 유도 있음"**. Always read the visible heading.

**A second, distinct mismatch found here — index vs. section headings.** The INDEX slide lists the two sections as:
> "01 모달_버튼 동작 유도 없음"
> "02 모달_동작 유도 있음"

…but the actual section headings on the content slides read **"01 동작 유도 없음"** and **"02 동작 유도 있음"** — the `모달_` prefix and the word `버튼` appear only in the index, nowhere on the slides. The content is also not about modals at all (it's toasts/snackbars/nudges), so **the index text looks like a stale copy-paste from a modal guide** — the file's own thumbnail frame (3006:21397) is likewise titled "모달". Trust the section headings and the slide content; treat the index's "모달"/"버튼" wording as unreliable.

The organizing axis of the whole guide is **동작 유도 (action prompting)**: does the message ask the user to do something or not?

## 01. 동작 유도 없음 (No action prompt) — 토스트

Slide title: **토스트**, with a small dark chip next to it reading `라이브러리 보러가기` (a link-out affordance to the component library; appears on all three pattern slides).

### 사용 설명
> "수행했거나, 수행할 프로세스를 사용자에게 짧고 명확하게 안내"
> - "**상태 피드백:** 로그인,로그아웃 / **에러메시지** / 시스템 알림 / 정상 수행 안내 등"

(`에러메시지` is highlighted in red on-canvas — the guide is flagging it as a notable/attention-worthy member of that list.)

### 정의
> - "**사용 목적:** 수행했거나, 수행할 프로세스를 사용자에게 안내"
> - "**최대 글자수: 논의**"
> - "**노출 위치:** 화면 하단 (기본마진 74, 직접설정 가능)"
> - "**동작 유도:** 없음 (상호작용 버튼/동작 유도 없음)"
> - "**지속 시간:** 일시적 (2~3초)"

**`최대 글자수: 논의` is rendered in red — it is an open TODO, not a spec.** The max character count for toasts was still under discussion as of this guide's last update (25.06.16). Do not invent a number; if a length limit is needed for a BUILD pass, flag it as unspecified.

### [토스트 예시] — verbatim example strings
The guide lists six real toast strings (all in `toast_basic` frames):
> "파일을 저장했습니다."
> "설정을 저장했습니다."
> "로그아웃 되었습니다."
> "네트워크 연결 상태를 확인해주세요."
> "앱이 안전한지 한 번 더 확인할게요. 앱을 다시 시작해주세요." *(shown twice — once truncated to a single line with an ellipsis, once wrapped to two lines, demonstrating both overflow behaviours)*

The [토스트 UI] mockup shows a pill-shaped dark toast (`1원을 보냈습니다.`) floating above the bottom edge with a red dimension annotation reading **`74`** — the 기본마진.

## 02. 동작 유도 있음 (Action prompt present)

Two cases share this section number.

### case 01 — 스낵바 (Snackbar)

#### 사용 예시
> "수행 중인 프로세스와 직접 관련된 텍스트 버튼을 포함합니다."

#### 정의
> - "**사용 목적:** 짧은 메시지+사용자 조작 유도"
> - "**노출 위치:** 화면 하단 (기본마진 74, 직접설정 가능)"
> - "**동작 유도:** 있음"
> - "**지속 시간:**" *(left blank on-canvas — see note below)*

**`지속 시간:` has no value.** The bullet exists but the duration is empty in the guide, unlike 토스트 (2~3초) and 넛징 (5~7초). This is a second gap in this guide. The 참고 table's `duration` property (SHORT/LONG/INDEFINITE/ALL) is the closest thing to an answer — but the guide never states which is the snackbar default, so don't assume one.

#### 주의 (Cautions — rendered in red)
> - "한 번에 하나의 스낵바만 표시 가능"
> - "바텀 내비게이션이나 FAB 등 주요 액션 버튼 등과 겹치지 않게 배치"

#### [스낵바 예시] — verbatim
> "데이터가 보이지 않는 이유"  +  button `확인`
> "쿠폰을 받았어요"  +  button `쿠폰함 가기`

Structure: message text left, text button right, in one dark bar. Same `74` bottom-margin annotation as toast.

### case 02 — 넛징 (서비스 이동) (Nudge — service navigation)

#### 정의
> - "**사용 목적:** 짧은 메시지+사용자 조작 유도  (e.g '다시 시도', '이동하기')"
> - "**노출 위치:** 화면 하단 (마진 4)"
> - "**동작 유도:** 있음"
> - "**지속 시간:** 5~7초 또는 조작 전까지 유지"

**Note the margin difference: 넛징 uses 마진 4, not 74.** The on-canvas dimension annotation on the 넛징 mockup reads `4` (vs `74` on toast and snackbar). Also note 넛징's copy does *not* say "직접설정 가능" — unlike toast/snackbar, the 4 appears to be fixed. The nudge sits right at the bottom edge; toast/snackbar float above the quick-menu.

#### 문장 구조 (Sentence structure — the copywriting rules)
> - "두괄식 구조로 필요한 키워드를 처음에 노출해주세요."
> - "'키워드' +행동/혜택/권유/질문의 형태로 작성해주세요.
>   예) 주식으로 배당 받으려면? ➡️ 내 배당금, 주식으로 받으려면?
>   예) 최신뉴스에 대해 AI는 뭐라고 할까요? ➡️ AI가 분석해주는 최신뉴스"
> - "숫자는 중요한 지표를 보여줄 때 사용해주세요.
>   예) 8월 유망종목 보러 가기 ➡️ 이 달의 유망종목 보기
>   예) 연금자산 대세 ETF 보기 ➡️ 연금 ETF 인기상위 10"

Read the ➡️ as **before ➡️ after** (bad ➡️ good). The pattern in both keyword examples: strip the leading throat-clearing and lead with the noun the user cares about. In the number examples: **don't** use a number that's merely incidental (8월 = just a month), **do** use a number that's a real metric (인기상위 10).

#### [넛징 예시] — verbatim
Nudge pills are rounded-full, light, and carry `emoji + text + ›` (a `nds_icon_arrow` instance):
> "📈 매일,매주 주식모으기 ›"
> "💰 내 달러로 이자 받기 ›"
> "✅ 배당 방식 선택하러 가기 ›"
> "📊 연금계좌 집중 분석 ›" *(the in-context mockup example)*

So a nudge is visually and structurally distinct from a snackbar: **emoji-led pill with a chevron**, not a dark bar with a text button.

## 참고. 스낵바 폼디 속성 (Snackbar FD property table)

The single highest-value implementation artifact on this page — the actual form-descriptor property list. Columns are: property (numbered, Korean + code name) / applies-to / values / notes. Reproduced verbatim; note the table's own numbering (1,3,9,10,4,2,5,6,7,8,11,12) is **out of order on-canvas** — it's sorted by applies-to, not by number.

| # | Property | 적용 | Values | Notes |
|---|---|---|---|---|
| 1 | 타입 (`snacktype`) | – | • base (기본형 = **토스트, 버튼 없음**)<br>• filelink (화면연동형 = **스낵바, 버튼 있음**) | – |
| 3 | 지속시간 (`duration`) | 모두 | • SHORT (짧게)<br>• LONG (길게)<br>• INDEFINITE (확인버튼 누를때까지)<br>• ALL | – |
| 9 | 애니메이션 (`animationFADE`) | 모두 | • SLIDEFADE : 해당위치에 바로 노출<br>• SLIDE: 하단에서 해당위치로 슬라이드 | – |
| 10 | 하단 마진 (`bottomMargin`) | 모두 | • ONTHEMENU마진값(숫자) | - 메뉴 높이 74 위에 노출<br>- 숫자 입력해서 마진 설정하는 것도 가능 |
| 4 | 배경색 (`bgcolor`) | 토스트만 | • 컬러테이블 Key | – |
| 2 | 텍스트 (`text`) | 토스트만 | • "보여줄 텍스트" | 텍스트 길이가 길면 말줄임 처리) |
| 5 | 글자색 (`fgcolor`) | 토스트만 | • 컬러테이블 Key | – |
| 6 | 확인버튼 텍스트 (`ok`) | 토스트만 | • "확인버튼 텍스트" | – |
| 7 | 확인버튼 글자색 (`okfgcolor`) | 토스트만 | • 컬러테이블 Key | – |
| 8 | Shape (`snackshapeinfo`) | 토스트만 | • "테두리곡률\`테두리컬러key\`테두리굵기" | – |
| 11 | 파일명 (`filename`) | 스낵바만 | • 연동할 파일명 (화면이름) | – |
| 12 | 링크데이터 (`linkdata`) | 스낵바만 | • 연동할 파일에 전달할 값 | – |

**Three important reads of this table:**

1. **`snacktype` inverts the guide's own vocabulary.** In the FD, `base` = 토스트 (no button) and `filelink` = 스낵바 (has a button) — so at the implementation layer, "snackbar" is the *component family name* (`snack*` properties, `snacktype`) and toast is just its button-less variant. The slides treat them as two separate patterns. **Don't be confused when a snackbar FD turns out to be rendering a toast.**
2. **The `적용` (applies-to) column contradicts the naming.** Rows 4–8 (`bgcolor`, `text`, `fgcolor`, `ok`, `okfgcolor`, `snackshapeinfo`) are marked **토스트만** ("toast only") — including `ok` / `okfgcolor`, which are *confirm-button* properties. But per row 1, the toast (`base`) is defined as having **no button**. These two statements can't both be literally true. Most likely the 적용 column means "the base/토스트 property set" (i.e. the shared/common properties that `filelink` inherits) rather than "excluded from 스낵바" — but **the guide does not say so, so treat this row group's scoping as ambiguous and verify against the real component before relying on it.**
3. **`bottomMargin` is where the `74` comes from**, and it confirms the slides: "메뉴 높이 74 위에 노출" — the 74 is the **quick-menu height**, not an arbitrary spacing token. `ONTHEMENU` is the symbolic default; a raw number overrides it. This also explains why 넛징 uses 4: it isn't clearing the menu.

## Component/instance names observed (not yet confirmed componentKeys)

These are **layer/instance names seen on this canvas**, not verified library keys — the guide's `라이브러리 보러가기` chips suggest real library counterparts exist, but no key was resolved during this pass:

- `toast_basic` — used for **both** toast and snackbar examples (a `toast_basic` with two text children = snackbar; with one = toast). Consistent with the FD table's finding that they're one component family.
- `nudge` — the nudge pill. Contains `toast message` → `text` → (emoji TEXT + label TEXT + `nds_icon_arrow` instance). Again nested under toast-family naming.
- `nds_icon_arrow` — already in the Core reference (key `dde648604e4d08cc6b99c44dda81ec73ccbb4b15`); used here at 16×16 as the nudge's trailing chevron. **Consistent with the Core reference's note that `Type=right` is the plain chevron.**
- `btn_container_regular` — the `라이브러리 보러가기` chip itself (guide furniture, not product UI).
- `quickmenu_basic`, `statusbar`, `Topbar_Dropdown`, `nds_icon_header`, `nds_icon_ci`, `btn_txt_arrow`, `top_banner/NM` — app-shell instances in the mockups. `quickmenu_basic` is already in the Core reference; its presence here at **height ≈49.33 in a 360-wide mockup** is the scaled-down twin of the 540-wide canvas convention (360/540 = 0.667; 49.33/0.667 ≈ 74). **This independently corroborates the FD table's "메뉴 높이 74".**

## How this feeds BUILD mode

When generating or reviewing an NH MTS screen with a transient bottom message (via `csdesign` → `nds/LEADER.md` Mode 2):

1. **Pick the pattern by 동작 유도 first:**
   - No action needed, just informing (saved / logged out / error / system notice) → **토스트**. No buttons. 2~3초.
   - Short message that needs one directly-related action → **스낵바**. Message + text button. One at a time.
   - Prompting navigation to another service ("이동하기", "다시 시도") → **넛징**. Emoji pill + chevron. 5~7초 or until acted on.
2. **Bottom margin: 74 for 토스트/스낵바, 4 for 넛징.** The 74 is the quick-menu height — a toast/snackbar must sit *above* `quickmenu_basic`, never overlapping it. On a 540-wide canvas use 74 directly; the 360-wide guide mockups show the same margin scaled.
3. **Never overlap bottom nav or a FAB** with a snackbar, and **never stack two snackbars** — one at a time.
4. **Nudge copy is 두괄식**: lead with the keyword, then 행동/혜택/권유/질문. Cut leading filler ("주식으로 배당 받으려면?" → "내 배당금, 주식으로 받으려면?"). Use a number only when it's a real metric (인기상위 10), not incidental (8월).
5. **Nudge = emoji + label + `nds_icon_arrow` (Type=right, 16px)** in a rounded-full pill. Don't build a nudge as a dark snackbar bar.
6. **When wiring an FD**: `snacktype=base` for a toast, `snacktype=filelink` for a snackbar (which additionally needs `filename` + `linkdata` for its target screen). `bottomMargin=ONTHEMENU` unless there's a reason to override with a number. `animationFADE=SLIDE` to slide up from the bottom edge, `SLIDEFADE` to appear in place.
7. **Two specs are genuinely missing from this guide — do not invent them:** toast **최대 글자수** (marked `논의`, i.e. still under discussion) and snackbar **지속 시간** (bullet present, value blank). If a BUILD pass needs either, flag it as unspecified and escalate rather than guessing. Long toast text is known to 말줄임 (ellipsis) per the FD table, and the guide shows both a 1-line-truncated and a 2-line-wrapped rendering of the same string — so wrapping to 2 lines is evidently allowed, but the cutoff isn't defined.
