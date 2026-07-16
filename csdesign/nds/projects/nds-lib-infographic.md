---
name: nds-lib-infographic
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=19888-18193"
learned_date: 2026-07-16
sections_studied:
  - "19888:18193 (page '    - Infographic' — canvas root; 253 COMPONENTs, 0 COMPONENT_SETs)"
  - "26605:1860 (frame 'infographic' — on-canvas heading 'Infographic(전체DB) : 251개' '(80에 2배수 png추출)' / 'QV-NM Infographic')"
  - "79228:27961 (frame 'infographic(유형별)' — on-canvas heading 'Infographic (유형별)' / 'QV-NM Infographic')"
  - "75175:3111 (frame 'infographic_darkmode' — on-canvas heading 'Infographic: Darkmode' / 'QV-NM Infographic')"
  - "26611:513 (frame 'Typo_usage' — on-canvas heading 'Infographic Usage' / 'QV-NM Infographic Usage'; carries 'Last update 2023.12.06 송수연')"
  - "75435:2868 (SECTION '인포그래픽_제작완료_개발전달전' — on-canvas heading '*제작 예정*'; a text-only backlog, no artwork)"
  - "80364:7827 (frame 'Theme Infographic_ETF' — on-canvas heading 'Infographic (ETF 테마별)')"
status: "live — 253 local (remote:false) source COMPONENTs, populated. Carries its own dated stamp: 'Last update 2023.12.06 송수연' (node 26611:524-adjacent, 26611:513 frame). NOT inferred from the page name. NOTE the stamp is the OLDEST of my five pages by ~2 years; see Gaps."
---

# NDS_Library — "    - Infographic" page

The 40–80px asset class (per the `🌈 Graphic asset` index: `콘텐츠를 부가 설명하는 그래픽으로 쓰입니다. / 추천 사이즈 : 40 ~ 80`). **253 components, all flat, no variant sets.** Organised into five views of the same underlying set: full DB, by-type, darkmode, ETF-theme, and a usage card.

## Name-reliability verdict: MIXED — but in an unusual and *useful* way

This page inverts the normal pattern. Here the **TEXT nodes are semantic Korean descriptions of the artwork** — `쌓인 동전`, `축하 폭죽`, `사이버보안`, `양자컴퓨터`, `생채인증(지문)`, `모래시계/기다림` — while the **components** are opaque numbers (`nds_infographic01`…`nds_infographic253`). Neither alone is enough:

- **Component names: RELIABLE but semantically empty.** `nds_infographic147` tells you nothing about what it depicts.
- **TEXT labels: RELIABLE as descriptions, and they are the ONLY way to know what an asset *is*.** 926 TEXT nodes carry the human meaning.
- **The mapping between them is SPATIAL, not structural** — a label sits above/beside its component. **A structure-only read cannot connect `nds_infographic147` to `양자컴퓨터`.** This is the page's defining trap: you can enumerate every component and still not know what a single one shows.
- `생채인증` (`79083:3911`, `79083:3912`) is itself a **typo for `생체인증`** (biometric auth) — the labels are hand-typed and not spell-checked.

**Rules are NOT embedded in pasted screenshot images.** But the `Infographic Usage` card's `Last update` line is **rendered in a dark grey on a dark background** — low-contrast, and it did **not** surface in my first name-pattern grep of the metadata dump. I found it only by rendering `26611:513`. **Same lesson as the white-on-white `제작중` on the index page: this file repeatedly hides real information behind fill colors.**

## Verbatim rules

### `Infographic Usage` (`26611:513`) — screenshot-transcribed

On-canvas heading `Infographic Usage` / `QV-NM Infographic Usage`, under `사용방법` (`26611:514`), a numbered list:

> 1. `파일명 확인 nds_inforgraphic00~`
> 2. `80*80을 2배수로 추출`
> 3. `Tiny.png에서 압축해 개발전달`

Footer, verbatim: **`Last update  2023.12.06  송수연`**

**⚠️ Step 1 contains a typo in the naming rule itself: `nds_inforgraphic00~` (inforgraphic) — the actual 253 components are all named `nds_infographic##` (infographic).** The rule that tells you the filename convention **misspells the filename convention.** Flagged to LEDGER — this is the kind of error that propagates into shipped asset names if followed literally.

Export spec: **80×80 @2x → Tiny.png compression → hand to dev.** Consistent with the index page's `추천 사이즈 : 40 ~ 80` (placement) — 80@2x is the *export*, 40–80 is the *placement range*. Not a conflict.

Header of the main frame (`26605:2292` + `54121:2339`): `Infographic(전체DB) : 251개` `(80에 2배수 png추출)`.

## ⛔ INCOMPLETE: the `*제작 예정*` backlog (`75435:2868`)

A SECTION named **`인포그래픽_제작완료_개발전달전`** ("infographic_production-complete_before-dev-handoff") containing a card headed **`*제작 예정*`** ("*production planned*"), screenshot-confirmed.

**Its 9 children are ALL TEXT nodes. There is no artwork, no component, no instance in it.** It is a **request backlog**, not delivered work. The eight requested items, verbatim:

`쌓인 동전` · `안락의자` · `장바구니` · `인증서` · `축하 폭죽` · `정장` · `음표` · `보드판`

**⛔ A BUILD pass must not assume these eight infographics exist.** They are named but unmade.

`인증서` renders **noticeably dimmer** than its seven siblings — a possible sub-status (deprioritised? already done elsewhere?). Unconfirmed; recorded as a question, not a finding.

**The section NAME contradicts its own CONTENT:** `제작완료` (production complete) vs `*제작 예정*` (production planned). One of the two is stale. Given the section holds zero assets, **`제작 예정` is the truthful one** and the section name is misleading. Flagged to LEDGER.

## Inventory — exact counts (from `.length`)

| | Count |
|---|---|
| All COMPONENTs | **253** |
| **COMPONENT_SETs** | **0** — flat, no variant axes anywhere |
| `nds_infographic##` | **253** (100% — no other component naming on this page) |
| TEXT nodes | 926 |
| INSTANCEs | 638 |

**Numbering:** `nds_infographic01` … `nds_infographic253`. **252 distinct numbers. `nds_infographic233` is missing. `nds_infographic138` appears TWICE** (two components share the number).

**Five views** (all top-level frames on one canvas):
1. **`infographic`** (`26605:1860`, 1539×4891) — the full DB, `Infographic(전체DB) : 251개`.
2. **`infographic(유형별)`** (`79228:27961`, 3080×5640) — by type/category.
3. **`infographic_darkmode`** (`75175:3111`, 1539×4891) — **exactly the same dimensions as the light DB frame**, i.e. a parallel darkmode rendering of the same set. **Darkmode is handled as a separate frame of separate assets here, NOT as a `Darkmode=[on|off]` variant axis** — unlike the Icons page, which uses variant axes for darkmode. Cross-page inconsistency worth knowing.
4. **`Theme Infographic_ETF`** (`80364:7827`) — `Infographic (ETF 테마별)`, split into `ETF 테마 분류(한국)` (`80364:9841`) and `ETF 테마 분류(미국)` (`80415:7881`).
5. **`Typo_usage`** (`26611:513`) — the usage card above.

**Semantic coverage** (from TEXT labels — a sample, verbatim): 의료/제약/바이오 · 노트북/IT · 사이버보안 · 양자컴퓨터 · 자율주행 · 수소에너지 · 게임 · 여행 · 엔터테인먼트/미디어 · 채권 · 왕관/밸류업 · 옥수수/농업 · 은/백금 · 구리 · 가스 · 광산 · 돌/희토류 · 석유 · 화장품 · 보물상자 · 탐사선 · 비만 · 어린이 · 중년(여성) · 생채인증(지문) · 생채인증(얼굴) · 디지털 결제 · 저울/배분 · 폐쇄형펀드 · 농기계 · 계산기 · 이벤트 · 메뉴 · 창문 블라인드 · 인사/공손한 사람 · 실험/과학 · 성공/체크 · 실패/주의 · 타이머 · 원화주문시간 · 불가시간 · 환전 · 드론 · VR · IPO · 로켓 · 체인 · 달러 방패 · 기계팔 · 오토바이 · 운동복 · 서류가방 · 미국국기 · 사각형 태극기 · 뱃지(배당금) · 손 위에 집 · 손 위에 돈 · 기계 손 위에 집 · 동전 위의 새싹 · 대마 · 설문,성향 등록 · 톱니바퀴2

## CORE — componentKeys found

**All `remote: false` → tier (a) published-library source components in their home file.** KIND = **standalone `COMPONENT`** for all 253 (`inSet: false`; **zero** COMPONENT_SETs on this page). **Use `importComponentByKeyAsync`.**

| Component | Full key (40-hex) | KIND |
|---|---|---|
| `nds_infographic01` | `0bda223a2ff7da55698215e58c9d9ffffe2b17ee` | COMPONENT (standalone) |
| `nds_infographic02` | `8b7337c5ce493847332bb2cec45219e53557303d` | COMPONENT (standalone) |
| `nds_infographic03` | `623eab5f5968819204618b7e38389b7b9a6b8543` | COMPONENT (standalone) |
| `nds_infographic04` | `3f562ab7d59feedb9e95cbb81b0d7d3cabdbbf11` | COMPONENT (standalone) |

**Per method, I did NOT transcribe all 253 keys** — the pattern (`nds_infographic##`, flat, no variants), the exact count, and the numbering anomalies are the deliverable. **Verification status: `unverified`** — read-only session; expected norm.

## Conflicts / LEDGER candidates

1. **⛔ `*제작 예정*` backlog: 8 named-but-unmade infographics** (`쌓인 동전`, `안락의자`, `장바구니`, `인증서`, `축하 폭죽`, `정장`, `음표`, `보드판`). A BUILD pass must not assume these exist.
2. **⛔/⚠️ The section name `인포그래픽_제작완료_개발전달전` ("production complete") directly contradicts its own `*제작 예정*` ("production planned") content and its zero-asset reality.** The name is stale/wrong.
3. **`Infographic(전체DB) : 251개` is stale — the real count is 253.** Off by 2. *(Same failure mode as `- Emoji & Nmoji`, whose `142개`/`80개` labels are also stale. **Header counts are systematically unmaintained across this file — do not trust any of them.**)*
4. **The usage rule misspells the naming convention: `nds_inforgraphic00~` vs the actual `nds_infographic##`.** If followed literally, produces wrongly-named deliverables.
5. **`nds_infographic233` does not exist** — a hole in the 1–253 sequence. Iterating `01..253` will 404 on 233.
6. **`nds_infographic138` is duplicated** — two components share the number. Name→key lookup is ambiguous.
7. **`nds_infographic123` (`80364:7831`) is a `visible: false` INSTANCE** inside `Theme Infographic_ETF`. Per method, **not quoted as a rule** and not treated as evidence of anything. It's a hidden instance, not a hidden *component* — the component itself exists and is fine. Recorded as **unverified + "unhide and re-check"** why this one placement is switched off.
8. **Darkmode modelling is inconsistent with the Icons page.** Here: a whole parallel frame (`infographic_darkmode`) of separate assets. On `- Icons`: a `Darkmode=[on|off]` / `Dark mode=[on|off]` variant axis inside single sets. **Two different strategies for the same concern in one library.** Not wrong, but a consumer needs to know which applies per asset class.
9. **`생채인증` should be `생체인증`** (biometric) — typo in two labels (`79083:3911`, `79083:3912`).
10. **NOT a conflict:** `추천 사이즈 : 40 ~ 80` (index page, placement) vs `80*80을 2배수로 추출` (here, export). Different concerns. Recording to pre-empt a false flag.

## Gaps / unverifiable

- **`Last update 2023.12.06 송수연` is the OLDEST stamp among my five pages** — ~2 years older than `- Illusts` (`2025.10.24 유상엽`), and the author differs (송수연 vs 유상엽). **The *usage card* is stale; the *assets* are not** — `nds_infographic253` and the ETF-theme frames are clearly newer than 2023. So the stamp dates the **documentation**, not the inventory. **Do not read this stamp as "the infographic system was last touched in 2023."** The `(NEW) illustration Asset Usage` card on `- Illusts` is likely the successor authoring process; whether it supersedes this card for infographics too is **unresolved** — the Illust card's subtitle confusingly reads `QV-NM Infographic Usage` (see `nds-lib-illusts` LEDGER item).
- **The component↔label mapping was NOT extracted.** I have all 253 component names and all 926 labels but not the spatial join. Knowing "there is an asset for 양자컴퓨터" does not tell you **which number it is**. A future pass needing name→asset lookup must do a coordinate-proximity join or render the by-type frame. **This is the single biggest gap on this page** and it blocks any "find me the infographic for X" workflow.
- The `유형별` (by-type) and `ETF 테마별` frames were not screenshotted; I read their structure and labels only. The two ETF sub-groupings (한국/미국) were not enumerated.
- Whether the 253 light-mode components have 1:1 darkmode counterparts (the frame dimensions match exactly, suggesting yes) was **not verified** — I did not count components inside `infographic_darkmode` separately, and the 253 total appears to cover the page as a whole. **If a BUILD pass needs darkmode infographics, confirm the pairing first.**
- `인증서`'s dimmed rendering in the backlog is unexplained.
</content>
