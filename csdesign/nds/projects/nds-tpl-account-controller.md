---
name: nds-tpl-account-controller
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=304-15709"
learned_date: 2026-07-15
sections_studied:
  - "304:15709 (page '    - Account Controller  계좌 컨트롤러' — ~20 template frames grouped by naming prefix: 계좌컨트롤러_트레이딩01-02, _조회01-05, _신청01-08, _텍스트형01-03, _타행선택01-03, plus one QV-channel reference frame '신탁형ISA상품_예금/RP')"
  - "304:15777 / 304:15755 (트레이딩01/02 — 박스형 order-screen templates; 02 shows the boxed controller + 예수금/전체잔고 buttons + inline dropdown expanded)"
  - "2714:27547 / 2714:27541 / 2714:27535 / 2714:27323 / 2880:28140 (조회01-05 — 라인형 lookup-screen templates, some with account_popup bottom sheet open)"
  - "2880:28246 / 2890:28241 / 2890:34868 / 2890:35277 / 2890:35511 / 2890:35601 / 2890:34962 / 2890:35147 (신청01-08 — 라인형 apply-screen templates)"
  - "2890:35750 / 2890:35721 / 2890:36039 (텍스트형01-03 — 텍스트형 templates, e.g. small '201-02-123456 [QV CMA] ▼' chip with no box/line)"
  - "2890:36295 / 2977:30902 / 2977:31010 / 13061:8842 (타행선택01-03 — picker-only templates using popup_radio_account rows, 3 different row-height variants)"
  - "13473:6157 (신탁형ISA상품_예금/RP — QV-channel reference frame, layer named 'account controller_asis_qv', wraps an account_trading_withbtn instance)"
status: NDS_Templates (subscribes to NDS_Library — see nds/LEADER.md pre-loaded verdict; real published components expected and confirmed below)
---

# NDS_Templates — Account Controller 계좌 컨트롤러 (template gallery)

This page is a **template/example gallery**, not a rules document (that's `nds-ux-guide-account-controller.md`) and not a component-library canvas either — it's full mock screens (status bar + Topbar_Dropdown + quickmenu_basic shell) showing the account controller **in situ**, organized by the transaction-type buckets the rules doc names: 트레이딩 (trading/order), 조회 (lookup), 신청 (apply), 텍스트형 (text-only), and 타행선택 (other-bank account picker).

## Layer-name convention — confirmed reliable on this page

Unlike the NDS_UX Guide (frame "02" ≠ on-canvas "01") and `header_basic`'s contested-key mess on NDS_M.web, **this page's frame layer names are trustworthy category labels**. Screenshot-confirmed against three frames:

| Frame layer name | Screenshot content | Matches category |
|---|---|---|
| `계좌컨트롤러_조회01` (`2714:27547`) | Borderless row: `201-02-123456` left / `[종합매매] 김나무 ▼` right, top-aligned, light-gray strip | 라인형 (line type) |
| `계좌컨트롤러_텍스트형01` (`2890:35750`) | Small inline chip `201-02-123456 [QV CMA] ▼` in the header area, no box/no line | 텍스트형 (text type) |
| `계좌컨트롤러_트레이딩02` (`304:15755`) | Boxed control `123-45-678891 / 계좌이름 ▼` **paired with 예수금 / 전체잔고 buttons**, one instance shown with the inline dropdown expanded below it | 박스형 (box type), buttons-mixed |
| `계좌컨트롤러_신청01` (`2880:28246`) | Same borderless top-aligned row shape as 조회01 (`201-02-123456` / `[종합매매] 김나무 ▼`) | 라인형 |

`계좌컨트롤러_트레이딩01` (`304:15777`) itself renders as an **empty content area below the header** — the account controller instances live only in `_트레이딩02` on this page; not a hidden-frame issue, just an unpopulated template variant. No blank-at-source claims made from it.

**Verdict: NAMES = reliable** on this page. The `트레이딩`/`조회`/`신청`/`텍스트형`/`타행선택` prefixes map 1:1 onto the rules doc's 박스형/라인형/텍스트형 taxonomy and onto real, distinct component sets (below).

## ANSWER to the assigned open question — controller componentKeys FOUND

Core's claim ("no component key exists yet for the controller itself") is **corrected, not confirmed**: the controller is not one missing component — it is **already implemented as (at least) four separate, real, published NDS_Library components**, one per usage context, each `remote: true` on this file (confirming the NDS_Templates→NDS_Library subscription). `popup_radio_account` genuinely is only the picker, as Core already states; these four are the controller itself:

| name = key (kind, remote) | Variant axes | Type-axis values | Role / evidence |
|---|---|---|---|
| `account_trading_withbtn` = `259adcc7ae32a34dcd130d01b5a3aacdf0ce77ba` (COMPONENT_SET, remote:true) | Channel(NM/QV), Type(password/btn), Account Status(normal/selected/disabled/null), Dropdown Status(normal/selected) | — | **박스형.** Used in 트레이딩01/02. Screenshot confirms it's the boxed control paired with 예수금/전체잔고 buttons — exactly 원칙 3's "버튼 혼합 → 박스형 mandatory." Also appears standalone on the QV reference frame (`13473:6171`, wrapped in a locally-named frame `account controller_asis_qv`) and twice more loose on the canvas (`43254:16126`, `43254:16139`). |
| `account_lookup` = `557d8e460dcc937a0cd6b3fec94495d181d2aceb` (COMPONENT_SET, remote:true) | Type(잔고표시/기본정보), Status(normal/selected/disabled/null) | `잔고표시`, `기본정보` | **라인형** for 조회 (lookup/inquiry) screens. Type axis literally names 잔고표시 vs 기본정보 — directly matches the rules doc's text-composition rule (기본정보 = 계좌번호+계좌정보; 잔고표시 adds the balance row). Used in all 5 `_조회0N` frames. |
| `account_apply` = `3f1d52aa040066b6ed58665c64c74fb86c21dec5` (COMPONENT_SET, remote:true) | Type(잔고표시/기본정보/레이블표시 — note: `레이블표시` literal has a stray `\b` backspace char in the source string), Status(normal/selected/disabled/null) | `잔고표시`, `기본정보`, `레이블표시` | **라인형** for 신청 (apply) screens. Same 잔고표시/기본정보 pair as `account_lookup`, plus a third `레이블표시` (label-display) option not seen elsewhere on this page. Used in all 8 `_신청0N` frames. |
| `txt_simle` = `a5cd89675e29ae6469c21e4d8aa32a31052d23c7` (COMPONENT_SET, remote:true) | type(null/기본정보/잔고표시/계좌번호), Status(normal/disabled/null) | `계좌번호`, `기본정보`, `잔고표시` | **텍스트형.** Type axis this time includes bare `계좌번호` (number-only, no label) alongside 기본정보/잔고표시 — the fullest three-way text-composition axis of the four sets, matching the rules doc's "계좌번호는 필수, 계좌정보/잔고표시는 화면 성격에 따라" statement most directly. Used in `_텍스트형01/03`. |
| `txt_simle/잔고표시/normal` = `09c2f70ad15915975ff14301d83975d60cf69d76` (COMPONENT, remote:true) | — | — | Standalone COMPONENT with **no COMPONENT_SET parent** (`node.parent.type` is not `COMPONENT_SET`) despite the name implying it's a `txt_simle` variant — likely an orphaned/detached duplicate. Used once, in `_텍스트형02` (`2890:36028`). Flag as inconsistent, don't treat as part of the `txt_simle` set above. |

**Corroborating, not contested**: `popup_radio_account` = `bca81c36fdb886105179354ec7c1a6b150c0d0e8` (COMPONENT_SET, remote:true) is confirmed present as the picker only, in the three `_타행선택0N` frames (rows at `2977:30877` etc.), consistent with Core's existing entry.

**Not attempted** (read-only session, per instructions): `importComponentSetByKeyAsync` on any of the four keys throws `Can't call "importComponentSetByKeyAsync" in read-only mode`. Variant lists above were instead read directly off each instance's live `getMainComponentAsync().parent` (a local proxy node already loaded in this session), which does not require write access — so the variant axes/names ARE verified, just not via the import path.

## Does this page confirm the three types, mapped to variant axes?

**Yes, confirmed on all three fronts** — screenshots, frame-name buckets, and component Type axes all agree, and no single component covers more than one type:

- **박스형** → `account_trading_withbtn` — its differentiator vs the other three isn't a `Type=박스형` value, it's a structurally different axis set entirely (`Channel`/`Type=password|btn`/`Account Status`/`Dropdown Status`) reflecting the extra button/password-input composition the box type is built for.
- **라인형** → `account_lookup` (조회) and `account_apply` (신청) — two separate components, not one shared 라인형 component, split by transaction context, but sharing the same `Type(잔고표시/기본정보[/레이블표시])` shape.
- **텍스트형** → `txt_simle` — the only set whose Type axis includes bare `계좌번호` as its own value.

So the mapping is **type → distinct component**, not a single component with a `유형` variant switching between 박스/라인/텍스트 rendering — each type is its own component family. `popup_radio_account`'s `Type(계좌만/통장이름/잔액표시)` remains the picker's separate, parallel three-way axis (already documented in Core/the rules-doc file).

## Blanks / gaps found at source

- `계좌컨트롤러_트레이딩01` (`304:15777`) renders with an empty body below the header — no controller instance placed in that specific template frame. Recorded as-is, not filled in.
- `account_apply`'s third Type value contains a literal backspace character (`\b레이블표시`) in the raw property string — transcribed verbatim as returned by the Plugin API; likely a copy-paste artifact in the source file, not a transcription error here.
- Did not screenshot the `_신청02`–`_신청08`, `_조회02`–`_조회05`, or `_타행선택02/03` frames individually (time/budget) — their component-instance evidence (via metadata + `getMainComponentAsync`) was captured, but their visual layout is `[unverified]` beyond the one representative screenshot per bucket.

## Cross-reference against Core / the rules-doc file

- **Corrects** `nds/LEADER.md`'s `popup_radio_account` row claim "No component key exists yet for the controller itself." Four real keys exist (table above); propose Core add them.
- **No contradiction** with `nds-ux-guide-account-controller.md`'s type-selection rules — the 박스형-with-buttons and 라인형-with-balance evidence on this page's screenshots matches 원칙 3 exactly.
