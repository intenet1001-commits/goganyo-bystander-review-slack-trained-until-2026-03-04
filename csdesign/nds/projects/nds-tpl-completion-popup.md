---
name: nds-tpl-completion-popup
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=302-12285"
learned_date: 2026-07-15
sections_studied:
  - "302:12285 (page canvas '    - 완료팝업' — 7 top-level frames)"
  - "663:25479 (frame '1. 완료팝업' — the main matrix: Title + ~14 popup variants × 2 channel columns [NaMUH x=622 / QV x=2410])"
  - "663:25562 / 663:26133 (완료팝업_성공 / 완료팝업_실패 — the base success/failure pair, screenshot-confirmed)"
  - "47759:8213 (완료팝업_성공_추가업무_성공1실패1 — partial-success/partial-failure list variant, screenshot-confirmed)"
  - "3140:29229 (간편인증번호등록완료팝업_채우기 포함_성공 — cross-sell footer variant, screenshot-confirmed)"
  - "3140:29275 / 47759:7847 (계좌개설/인증 하단 컨텐츠형 추가 / 일부 완료/실패 복합 케이스 — remaining top-level sections, metadata-only)"
status: internal NDS component-library guide (Templates file — usage-example gallery of completion/failure popup compositions, not a prose rules source)
---

# NDS Templates — 완료팝업 (Completion Popup)

Component/usage gallery (title on-canvas: **"완료팝업" / "QV-NM 완료팝업 Guide"**) showing ~14 popup compositions × 2 channel columns (NaMUH and QV, same content duplicated at x=622 and x=2410) plus 4 extra top-level sections for account-opening/auth cross-sell variants and partial-success/partial-failure list variants. Consistent with `nds-tpl-no-data`: zero prose usage rules on this page — corroborates **Gotcha 7** (gallery, not rules source). This is the sibling shipped-example page to the rules doc `nds-ux-guide-completion-popup.md`.

## Layer names — confirmed reliable

Screenshot-verified across 5 frames (663:25562, 663:26133, 47759:8213, 3140:29229, title 663:25532): every TEXT layer name transcribed from `get_metadata` matched the on-canvas rendered text character-for-character, including the "faq" list-row placeholder labels and detail-row values. **Verdict for this page: layer names reliable.**

## Component keys — genuine COMPONENT_SETs, `remote: true`

Sampled via 5 explicit node IDs (one `getMainComponentAsync()` call each; 1 of 6 total attempts threw the intermittent read-only error and was retried once, succeeded):

| Instance | main COMPONENT name | main key | remote | parent SET | parent SET key |
|---|---|---|---|---|---|
| `663:26185` icon_comm_complate/warning | `Channel=NM, Result=Success` | `0b9f750308985c6e6324d495ec198024c2908143` | true | `icon_comm_complate/warning` | `bd8e167c6f55b50541eaafb51cd867468da3af7b` |
| `663:25915` statusbar | `Type=NM, Dark mode=false` | `169d23c202bd4e85398ceafdf264d6fa19eb1cbf` | true | `statusbar` | `fe57c685f5a27a53c49fc56c9999456340140c2f` |
| `663:25916` Topbar_Dropdown | `Channel=NM, Type=basic, Combo=off` | `69e7ffd43cdf9888ae6fc9bbedff3627fe504e6d` | true | `Topbar_Dropdown` | `ce701f7c5eda23073d17bd862838e75f191b0a96` |
| `1370:27702` btn_bottom_page | `Channel=btn_bottom_layerpopup, Type=btn_bottom_page, Status=NM` | `3ef42b8dfd48baf9ff4c1572dd2a4de8264bfee7` | true | `btn_bottom_page` | `accfb243ce752fd894af2b6db081b1074022a39d` |
| `25289:1801` warning_line | `Color=red` | `c8cd206da3a320b09448ca6f323c257dac835558` | true | `warning_line` | `dd39b07e4226e078e25b61741720255763b4f516` |

All `remote: true`, corroborates Q4 (subscribes to NDS_Library). `Topbar_Dropdown` parent SET key `ce701f7c…` and `btn_bottom_page` parent SET key `accfb243…` **exactly match** values already in Core/Gotcha 5a — double corroboration, no new conflict.

## ANSWER — headlines vs. `nds-ux-guide-completion-popup`'s 3 mechanical rules

Every headline string transcribed verbatim (via metadata + 5 screenshot spot-checks):

| Headline (verbatim) | State | 완료-word? | 실패-ban? | Active voice? |
|---|---|---|---|---|
| 이체 한도 수정을 완료했어요. | Success | ✅ | n/a | ✅ active |
| 발행어음 매수를 완료했어요. (×3 dup) | Success | ✅ | n/a | ✅ active |
| 환전 신청을 완료했어요. (×2 dup) | Success | ✅ | n/a | ✅ active |
| 자동 환전 신청을 완료했어요. | Success | ✅ | n/a | ✅ active |
| 계좌 개설을 완료했어요. | Success | ✅ | n/a | ✅ active |
| 간편인증번호 등록을 완료했어요. | Success | ✅ | n/a | ✅ active — **exact match to the guide's own DO example** |
| 2줄 이상 케이스 폰트24로 발행어음 매수를 완료했어요. | Success | ✅ | n/a | ✅ active |
| 2줄 이상 케이스 폰트24로 발행어음 매수를 **완료하였습니다**. | Success | ✅ | n/a | ✅ active (formal `-였습니다` variant, inconsistent ending vs. its `-했어요` twin, but not itself a banned form) |
| 이체 한도 수정에 **실패했어요**. (×3 dup) | Failure | ✅ (contains 완료? **NO**) | ❌ **VIOLATES** | n/a |
| 이체 한도 수정에 **실패했어요**. (screenshot-confirmed, `663:26133`) | Failure | ❌ | ❌ **VIOLATES** | n/a |
| 자동 대체 신청에 **실패했어요**. | Failure | ❌ | ❌ **VIOLATES** | n/a |
| 자동 대체 신청에 **실패했습니다**. | Failure | ❌ | ❌ **VIOLATES** | n/a |
| 2줄 이상 케이스 폰트24로 발행어음 매수에 **실패했어요**. (×2 dup) | Failure | ❌ | ❌ **VIOLATES** | n/a |
| 일부 계좌 신청을 **완료하지 못했어요**. (×2 dup, screenshot-confirmed `47759:8213`) | Partial failure | partial (has 완료, negated) | not literally `실패했어요`, but also not the prescribed `완료되지 않았어요` | n/a |

**CONTRADICTS the guide totally, not partially — and unlike `nds-tpl-no-data`, this is NOT a subset/shell-correlated drift.** A file-wide `grep` for the string `완료되지 않` — the exact phrase the guide mandates for failure — returns **zero matches anywhere on this page**. Every one of the 8 pure-failure headlines uses the explicitly-banned `실패했어요`/`실패했습니다` (7 of 8 use `-했어요`, 1 uses `-했습니다`); the 2 partial-failure headlines use a third, unprescribed form (`완료하지 못했어요`). **100% of failure-state copy on this page violates rule 2; 0% matches the guide's own worked example.** Success-state copy is clean: 9/9 unique success headlines contain 완료, and 0 use the passive `-됐/-되었` marker — rules 1 and 3 pass completely.

**Shell-correlation check (per the no-data precedent):** does the violation cluster by shell/template? **No differential to check** — since the violation is total (8/8), not partial, there is no compliant subset to compare against a non-compliant one within this page. This is a **sharper, different failure mode than no-data's**: no-data showed the rule *sometimes* followed and sometimes not (correlating with an older shell); here the rule appears **never implemented in the shipped library at all**, on any shell, for any product context (이체한도/발행어음/자동대체 all agree). Read literally: the failure-copy rule may postdate this entire page, or the page was never updated after the rule was written.

## Taxonomy: component/usage gallery, not a flow

Frame `663:25479` ("1. 완료팝업") is a flat grid of ~14 independent popup mockups arranged in 2 columns (NaMUH/QV channel duplicates) with **no prototype links observed between frames** — each is a frozen, self-contained popup state (success / failure / success-no-detail / success-with-sub-tasks / etc.), matching the file-wide "composition examples, not flows" correction already in Core. The 4 extra top-level frames (`3140:29275`, `47759:7847`, `3140:29209`, `3140:29229`) are additional standalone popup variants (account-opening completion w/ cross-sell footer, partial-success/failure account-list popup), not a continuation flow.

## Blanks / gaps

- 3 of 7 non-primary top-level frames (`3140:29275`, `47759:7847` sub-children beyond the ones screenshotted) were read via metadata only, not screenshot-confirmed individually — their headline text is trusted from the reliable-layer-name verdict established on the 5 confirmed frames, not independently re-verified.
- No prose usage rules found anywhere on this page (matches `nds-tpl-no-data` precedent) — pure example gallery.
- Annotation-style stray text nodes present as design notes, not real copy (not counted as headlines): `"상품 설명은 최대 1줄까지만 가능합니다요."` (typo: 가능합니다요), `"투버튼 일떈 가로 240px 고정입니다."` (typo: 일떈), `"하단 텍스트는 유의사항 스타일대로"` — these are builder instructions left on-canvas, not shipped copy.
- `icon_comm_complate/warning`'s variant axis is literally `Result=Success` (only value sampled) — no `Result=Fail` sibling variant confirmed; the failure popups instead swap to the separate `warning_line` SET, consistent with the rules doc's stated icon pattern (green check = success, red `warning_line` = failure).

## CORE

No Core reference update needed — `Topbar_Dropdown` and `btn_bottom_page` keys sampled here exactly match values already recorded in Gotcha 5a/Core; no new components or corrections surfaced.
