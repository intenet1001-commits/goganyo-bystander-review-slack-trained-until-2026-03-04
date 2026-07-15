---
name: nds-ux-guide-completion-popup
fileKey: nEINCcmC7AVkWSqRkq60y1
source_url: "https://www.figma.com/design/nEINCcmC7AVkWSqRkq60y1/NDS_UX-Guide?node-id=1904-8469"
learned_date: 2026-07-15
sections_studied:
  - "1906:27256 (frame layer named 'Slide 16:9 - 21' — the INDEX slide. Lists 3 top-level sections: 01 명료성 : 완료/실패 표기, 02 고객관점표현 : 능동형 표기, 03 일관성 : 실패 문장 통일)"
  - "1905:546 (frame internally named '완료실패 가이드02', but the on-canvas heading reads '01 명료성 : 완료/실패 표기' — 4 mockups: 2 DO + 2 DON'T)"
  - "1905:442 (frame ALSO internally named '완료실패 가이드02' — on-canvas heading reads '02 고객관점 표현 : 능동형 표기 (완료만)' — 1 DO + 1 DON'T pair)"
  - "1906:27266 ('👍 thumbnail' cover slide — title '완료/실패 팝업')"
  - "2662:3666 (Update_History_01 — version table, all rows still placeholder 'v0.1 최초작성 / 백채원 / 2021.12.28')"
status: internal UX guide (design-team documentation, not a shipped product screen — treat as UX-writing rule source of truth, not a screen-flow reference)
---

# NDS UX Guide — 완료/실패 팝업 (Completion / Failure Popup Copy)

Part of the NDS_UX Guide file's "완료팝업" canvas — the design team's internal UX-**writing** rulebook for completion and failure popups (corner tag on every slide reads "NHI UX Writing Guide", not "NHI Design Principle" as on the touch-area/color-contrast canvases). This is a **copy-rules document**: it governs the wording of the popup headline, not its layout or components.

**Frame-numbering gotcha confirmed again**: as in `nds-ux-guide-color-contrast` and `nds-ux-guide-touch-area`, the internal Figma frame layer names do **not** match the on-canvas section numbers. Worse here — **two different frames share the identical layer name "완료실패 가이드02"** (`1905:546` and `1905:442`), and the one named "…02" that comes first on canvas is actually on-canvas section **01**. The INDEX frame is named "Slide 16:9 - 21". Always screenshot and read the visible heading; the layer name is worthless on this canvas.

**Missing section**: the INDEX lists **three** sections, but the canvas only contains **two** guide slides. Section **"03 일관성 : 실패 문장 통일"** has no corresponding slide — it is indexed but never authored. Do not assume a rule exists for it; if a BUILD pass needs failure-sentence consistency rules, they are not in this file.

## 01. 명료성 : 완료/실패 표기 (Clarity — how to say "done" / "failed")

Section subtitle, verbatim (two lines):

> "문제 없이 완료되었다는 느낌을 확실히 전달하기 위해 '완료' 를 쓰는게 명료해요.
> 실패했을 때는 부정적인 느낌을 주는 '실패했어요' 대신, '완료되지 않았어요' 로 써요."

Four mockups, left→right: **DO, DO, DON'T, DON'T**.

| Badge | Popup headline (verbatim) | Why |
|---|---|---|
| DO | "발행어음 매수를 **완료**했어요." | Success path — the word 완료 carries the "nothing went wrong" signal |
| DO | "발행어음 매수가 **완료되지 않았어요**." | Failure path — negative-framing avoided; paired with a red `warning_line` icon and a red 실패사유 row |
| DON'T | "이체 한도를 수정했습니다." → redlined, corrected to "수정을 **완료**했어요." | Bare past-tense verb without 완료 reads as ambiguous |
| DON'T | "해외주식 소수점 거래를 신청했습니다." → redlined, corrected to "신청을 **완료**했습니다." | Same defect inside a bottom-sheet popup variant |

Hidden designer annotation nodes attached to the DO/DON'T bars (not visible on canvas, but present in the file and quoted here verbatim):
- DO (`1905:3662`): *"'완료'를 써서 고객이 경험한 프로세스가 문제 없이 완료되었다는 느낌을 확실히 전달합니다."*
- DO (`1905:3784`): *"'실패'를 써서 이 과정이 제대로 완료되지 않았다는 느낌을 명료하게 줍니다."*
- DON'T (`1905:3786`, duplicated at `1905:703`): *"명확한 전달을 위해 '완료'를 써야 합니다."*

**Internal contradiction — flag for a VERIFY pass**: hidden annotation `1905:3784` says to use **'실패'**, but the visible section subtitle explicitly says the opposite — *"'실패했어요' 대신, '완료되지 않았어요' 로 써요"* — and the mockup it annotates does in fact read "완료되지 않았어요". The hidden annotation is **stale copy** from an earlier draft. **Trust the visible subtitle and the mockup: use "완료되지 않았어요", not "실패했어요".**

## 02. 고객관점 표현 : 능동형 표기 (완료만) (Customer-perspective — active voice)

Section subtitle, verbatim:

> "고객이 행위의 주체일 때는 능동형으로 써주세요. 고객 관점에서 서비스를 경험하도록 해주세요."

The "(완료만)" qualifier in the heading scopes this rule to **완료 (success) copy only** — it is not stated to apply to failure copy.

| Badge | Popup headline (verbatim) | |
|---|---|---|
| DO | "환전 신청을 **완료했어요**." | Customer is the actor → active voice |
| DON'T | "간편인증번호 등록이 ~~완료됐어요~~." → redlined, corrected to "**을 완료했어요**." (i.e. "간편인증번호 등록**을 완료했어요**.") | Passive 완료**됐**어요 makes the system the actor |

The DO mockup pairs the headline with a 5-row detail list (계좌번호 / 환전유형 / 1일 한도 / 약정이율 / 매수금액) and a single green `btn_bottom_page` reading "확인". The DON'T mockup additionally carries a cross-sell block ("금융사기가 걱정된다면?" + 단말기 지정서비스 / 지연이체 서비스 buttons) — that block is **not** what's being flagged; only the passive headline is.

Hidden designer annotations:
- DO (`1905:3138`): *"고객이 행위의 주체일 때는 능동형으로 써주세요. 고객 관점에서서비스를 경험하도록 해 주세요."* (note the missing space in "고객 관점에서서비스" — typo present in the source file)
- DON'T (`1905:3300`): *"행위 주체가 고객이기 때문에, 능동형 문장으로 수정되어야 합니다."*

## Observed components in the mockups

These are instance names seen inside the guide's phone mockups — useful as a cross-check on what a real completion popup is assembled from (no componentKeys are exposed by `get_metadata`, so these are names only, not verified keys):

- `icon_comm_complate/warning` — the circular check glyph at the top of a success popup (39.7×39.7 in the 286-wide mockup)
- `warning_line` — the red exclamation-circle glyph used **only** on the failure popup (`1905:608`)
- `statusbar`, `Topbar_Dropdown` — popup chrome
- `btn_bottom_page` — the single full-width green CTA ("확인")
- `Basic_btn` — the secondary outline buttons in the cross-sell block
- `line_section`, `icon_comm_complate_h75`, `quickmenu_basic`

Pattern: **success = `icon_comm_complate/warning` (green check); failure = `warning_line` (red !)**. The failure popup also drops the long detail list down to 2 rows (계좌번호 + 실패사유), with 실패사유 rendered in red.

## How this feeds BUILD mode

When generating or reviewing any NH MTS **completion or failure popup** (via `csdesign` → `nds/LEADER.md` Mode 2), the headline must satisfy all of:

1. **Success headline must contain the word "완료"** — never a bare past-tense verb. "…을 완료했어요." ✅ / "…했습니다." ❌ / "…수정했습니다." ❌
2. **Failure headline must read "…이/가 완료되지 않았어요."** — never "실패했어요". (The stale hidden annotation saying to use '실패' is wrong; the visible rule wins.)
3. **Success headline must be active voice** when the customer performed the action: "등록을 완료했어요" ✅ / "등록이 완료됐어요" ❌. Watch for the `-됐/-되었` passive marker as the tell.
4. **Ending style**: every DO example uses the polite `-어요/-았어요` ending. Two DON'T corrections use `-했습니다` in the corrected text (`1905:1491`-adjacent "신청을 완료했습니다."), so `-습니다` is not itself the defect — the missing 완료 is. Prefer `-어요` to match the DO set.
5. **Icon must match the outcome**: green `icon_comm_complate/warning` check for success, red `warning_line` for failure. Never a green check on a failure popup (the third DON'T mockup does exactly this — green check + non-완료 headline — and is marked DON'T).
6. **Failure popups show 실패사유 in red** as a detail row, and carry fewer detail rows than the success counterpart.
7. **No rule exists for "일관성 : 실패 문장 통일"** despite the index listing it — don't invent one; escalate if a screen needs it.
