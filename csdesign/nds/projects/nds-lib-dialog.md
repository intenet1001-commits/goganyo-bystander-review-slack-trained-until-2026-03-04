---
name: nds-lib-dialog
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=2283-9982"
learned_date: 2026-07-16
sections_studied:
  - "2283:9982 (page '    - Dialog (snack bar, toast message)  스낵바, 토스트, 넛징')"
  - "2551:14932 (section '1. Snack Bar' — on-canvas heading 'Snack Bar' / 'QV-NM Snack bar Design Guide'; five labelled groups NOTICE / RATE / STOCK / LOG / NUDGE)"
  - "36658:23681 (section '99. Snack Bar_assets' — on-canvas heading 'Nudge Usage' / 'QV-NM Design System Usage'. THE nudge timing rules live here.)"
  - "62361:34887 (frame 'Frame 9284' — the '사용 시 유의사항' rule list, screenshotted and transcribed verbatim)"
  - "4383:8753 (COMPONENT_SET 'toast_basic' — 3 variants, sits inside the LOG group)"
status: "live — carries the freshest Last update stamp of my four pages: 'Last update  2025.09.15  우채희' (62361:34867), rendered and legible in the screenshot of 36658:23681"
---

# NDS Library — Dialog (Snack Bar / Toast / Nudge)

**This page settles the domain's ⛔ blocking open question `#nudge-blank-timing`. The nudging timing rules are NOT blank — they are stated explicitly, in prose, and they render.** See "The nudge timing rules" below. This is the single highest-value fact in my batch.

Equally important and easy to get wrong: **the timing rules cover the _nudge only_.** Snack bar and toast have no timing, trigger, or dismissal rule anywhere on this page. Do not generalise the nudge's 3-second numbers onto snack bars or toasts — that would be inventing a rule the design system does not state.

## Page conventions (determined by screenshotting, per the per-page rule)

- **Layer names: RELIABLE.** Every group's layer name matches its on-canvas heading exactly — `notice`→NOTICE, `rate`→RATE, `stock`→STOCK, `log`→LOG, `Nudge`→NUDGE. Variant axis names (`Type=notice`, `Type=increase`…) also match what renders. This page is the *good* case; contrast with `- Tooltip`, where names lie.
- **Demo copy: realistic sample data, not placeholder.** `[공지] 3월 1주 ELS 1961~1963호 청약 안내`, `원/달러 환율 1,382.40원 ▲14.89 (30.62%)`, `최근 로그인 시간 2022.07.29 12:25:14`. Useful for understanding intent, but it is *sample* content — do not treat a specific string as a copy rule.
- **Rules embedded in screenshot images: NO.** Unusually for this file, this page's rules are live text nodes. I transcribed from the rendered screenshot anyway to confirm nothing was hidden or overridden.
- **No `hidden="true"` frames** on this page.

## ⭐ The nudge timing rules (verbatim) — resolves `#nudge-blank-timing`

From `62361:34887` → `62361:34876`, under the heading **사용 시 유의사항**. Verified rendered in the screenshot of `36658:23681`, not just present in the node tree:

```
넛징 추가 시 업데이트 해주세요 : 피그마 경로
넛징 문구: 이동할 화면의 컨텐츠를 예상할 수 있도록 작성
기본 노출 시간 : 화면진입 시 3초 후 슬라이드 in, 3초 후 슬라이드 out
최대 글자수 : 공백포함 최대 20자
넛징 하단 마진: 4
```

Decoded for BUILD:

| Rule | Value |
|---|---|
| **Trigger** | 화면진입 (screen entry) |
| **Delay before appearing** | 3 seconds after screen entry, then **slide in** |
| **Dwell → dismissal** | 3 seconds after appearing, then **slide out** (auto; no user action) |
| **Motion** | slide in / slide out — not fade, not instant |
| **Max copy length** | 20 characters **including spaces** |
| **Bottom margin** | 4 |
| **Copy guidance** | write it so the user can anticipate the content of the destination screen |

So the full nudge lifecycle is **enter screen → wait 3s → slide in → wait 3s → slide out**. Both 3s intervals are stated; neither is inferred from a mockup.

The **same numbers are independently repeated** in the NUDGE group's own on-canvas subtitle (`36658:23670`), which is a genuine corroboration rather than a copy-paste of the same node:

> `타 서비스 유입 유도 버튼 (나인패치 이미지 / 넛징 하단 마진 4 / 최대 글자수: 공백포함 20자)`

That subtitle adds one fact the usage panel omits: the nudge background is a **나인패치 이미지 (nine-patch image)** — asset `nds_nudge01.9` (`36658:23704`), the `.9` suffix being the Android nine-patch convention. So the nudge stretches horizontally via a nine-patch, which is *why* a 20-character cap exists.

**Purpose of the nudge**, from the Nudge Usage title (`36658:23684`): `타 서비스 유입 유도 버튼` — a button to drive traffic into another service. It is a marketing/cross-sell affordance, not a system notice.

## ⛔ What is still blank — snack bar and toast timing

**There is no timing, trigger, or dismissal rule for snack bars or toasts on this page.** I checked every text node and screenshotted the whole `1. Snack Bar` section. What exists is only *structural*:

- `Stock` (`2514:13690`) and `Logintime` (`2283:10390`) render a **× close affordance** → manually dismissible.
- `Notice` / `Rate` variants render a **`>` chevron** → they navigate; no close button.
- `toast_basic` variants have **no affordance at all** → implying auto-dismiss, **but the duration is stated nowhere.**

**This confirms the domain's systematic-blankness pattern for snack bar / toast specifically, while refuting it for the nudge.** The `#nudge-blank-timing` ledger entry as written is too broad — it should be narrowed, not closed outright. Do NOT read a toast duration off a mockup; there is nothing to read.

## Snack bar taxonomy

| Group | Component / Set | Variants | On-canvas purpose (verbatim) |
|---|---|---|---|
| NOTICE | `Notice` (SET) | `Type=notice`, `Type=urgent` | `공지, 긴급 형태의 스낵바` |
| RATE | `Rate` (SET) | `Type=increase`, `Type=decrease`, `Type=nochange` | `환율 내용이 노출되는 스낵바` |
| STOCK | `Stock` (single COMPONENT) | — | `매수 관련 내용이 나오는 스낵바` |
| LOG | `Logintime` (single COMPONENT) | — | `로그인 시 내용이 나오는 스낵바` |
| LOG | `toast_basic` (SET) | `Type=basic`, `Type=logout`, `Type=Type3` | *(no subtitle of its own)* |
| NUDGE | `nudge` (single COMPONENT) | — | `타 서비스 유입 유도 버튼 …` |

`Rate`'s three variants corroborate the market-direction convention pinned in `nds-mweb-colors`: **increase = red ▲, decrease = blue ▼, nochange = teal/green** — the Korean convention, reversed vs US.

**Structural oddity:** `toast_basic` (`4383:8753`) sits physically inside the **LOG** group's row but is a distinct concept from `Logintime`, and the LOG subtitle (`로그인 시 내용이 나오는 스낵바`) does not describe it. Its `Type=Type3` variant name is a placeholder that was never given a real name. Treat `toast_basic` as an unlabelled fourth concept, not part of LOG.

## componentKeys — Dialog page

Read-only session → **all keys `unverified`** (captured off the file, not confirmed against a publish record). In this file (the library itself) components are LOCAL, so `remote: false` on every node is expected and is **not** evidence of non-publication.

**COMPONENT_SET keys** (use these with `importComponentSetByKeyAsync`):

| Name | SET key (40-hex) | Axes | Tier |
|---|---|---|---|
| `Notice` | `1e1945afb035d346b620452faefbdb5ba73c8b20` | `Type: notice \| urgent` | (a) published library component |
| `Rate` | `d3f76cf5f70479c2ee746104a8976b0e863c290f` | `Type: increase \| decrease \| nochange` | (a) published library component |
| `toast_basic` | `5af7c0e9c578d4a1fb4c6daa6162233d646efc98` | `Type: basic \| logout \| Type3` | (a) published library component |

**Standalone COMPONENT keys** (no set; use `importComponentByKeyAsync`):

| Name | COMPONENT key (40-hex) | Tier |
|---|---|---|
| `Logintime` | `26dd9d6a71f70af7062ee927f142a0f1d6d71229` | (a) published library component |
| `Stock` | `55f06e617eeb6c03a56d3132ddfbf969d3295a2a` | (a) published library component |
| `nudge` | `45d174910ebb917901266ea796d878be9719886c` | (a) published library component |

**Variant COMPONENT keys** (⚠ these are variant-component keys, **not** SET keys — do not pass to `importComponentSetByKeyAsync`):

| Variant | COMPONENT key (40-hex) |
|---|---|
| `Notice / Type=notice` | `36f997bf40a18074cc5c3e622b23bac4c40add4a` |
| `Notice / Type=urgent` | `f00098afb58431d080614513be4ba3f45868e4e3` |
| `Rate / Type=increase` | `3ef1330038417557ac14efdffb8d6e8b93659942` |
| `Rate / Type=decrease` | `6551335f4ef0512051ce6a90705f960fdeb5cfd1` |
| `Rate / Type=nochange` | `24139a4ce8225f8b85624853a376d56f9ef91704` |
| `toast_basic / Type=basic` | `dc526cf4a31d44bc1c361b6eec3413f85f3dbf58` |
| `toast_basic / Type=logout` | `241daefe664aa30d470639bd3fe3831882293758` |
| `toast_basic / Type=Type3` | `bc77e25ad22c6f5c774500f70cf037309fbceed8` |

## Loose ends on this page

- `46682:26419` — a **pasted iOS screenshot image** labelled `[as-is] iOS` (`46682:26420`), 540×1169, parked at page level outside every section. It is reference material for a current-state iOS build, not a spec. No text is extractable from it; I screenshotted the page region and it adds no rule.
- `46682:26415` (`kale`) and `36658:23685` — sticky-note / instance annotations parked at page level.

## How this feeds BUILD mode

- **Nudge is fully specified — build it to the letter.** enter → 3s → slide in → 3s → slide out; ≤20 chars incl. spaces; bottom margin 4; nine-patch background. No guesswork needed, so no excuse for guessing.
- **Snack bar / toast auto-dismiss duration must be escalated to the designer, not chosen.** The library is silent. If BUILD needs a number, that is a question for 우채희 (the page's last editor), not a value to sample.
- **Pick the snack bar by semantic group, not by looks**: 공지/긴급 → `Notice`; 환율 → `Rate`; 매수 → `Stock`; 로그인 → `Logintime`; cross-sell → `nudge`.
- **`Stock` and `Logintime` have no variants** — if a design calls for a "disabled stock snackbar", the library does not have one.
- Nudge copy is capped at **20 characters including spaces** — a hard constraint worth validating in code, since Korean copy hits it fast.
