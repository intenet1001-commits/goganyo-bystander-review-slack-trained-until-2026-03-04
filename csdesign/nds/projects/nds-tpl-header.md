---
name: nds-tpl-header
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=32758-4146"
learned_date: 2026-07-15
sections_studied:
  - "32758:4146 (page '    - Header 헤더' — enumerated via get_metadata; no lazy-load truncation, full tree returned in one call)"
  - "32760:6095 ('[NM] Screens' — header_basic + statusbar + btn_bottom_page composed, placeholder title/button copy)"
  - "32760:6100 ('[QV] Screens' — same composition, QV channel)"
  - "32762:2512 / 32762:4305 ('헤더 아이콘 종류' — two near-duplicate frames, 14 header_basic instances each, real icon-role labels: 음성인식/알림/선물/더보기/설정/상담/내정보/검색/공유/툴팁/안내/랭킹/캘린더/가이드)"
  - "32762:3184 / 32762:2511 (embedded screenshot annotations decoding nds_icon_header naming: 컴포넌트명 vs 아이콘명)"
  - "32762:3299 / 32762:3998 ('마이데이터등록/관리' — composed real screen, header_basic with real title text + bell icon, second/different header_basic component set)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen)
---

# NDS_Templates — Header 헤더

Page from **NDS_Templates** (`1xE0qvn2yv3ZkQ9BwhKT1y`), which per the pre-loaded verdict **subscribes to NDS_Library** (`lk-e6bea415…`) — unlike NDS_M.web. This is confirmed on canvas: every `header_basic`, `statusbar`, `btn_bottom_page(_assets)`, and `Basic_btn` instance checked resolves `getMainComponentAsync().remote === true`. This page is a **composition/usage** source (demo screens + a real production-style screen), not a token-definition page — no color/type rules are stated here.

`get_metadata("32758:4146")` returned the full tree in one call (no lazy-load truncation this time — the whole canvas, including 5 sibling frames, came back directly).

## Layer-name convention verdict

**Unreliable for headers specifically, reliable for icon-demo labels.** The composed demo screens (`[NM] Screens` `32760:6095`, `[QV] Screens` `32760:6100`) show a `header_basic` instance whose on-canvas title reads placeholder Korean **"화면 타이틀명"** ("screen title name") and a bottom button reading **"버튼명"** ("button name") — the instance name is just `header_basic`, giving no hint the displayed copy is a placeholder. Contrast the `헤더 아이콘 종류` (header icon types) demo frames: their row labels (음성인식, 알림, 선물, 더보기, 설정, 상담, 내정보, 검색, 공유, 툴팁, 안내, 랭킹, 캘린더, 가이드) are real, meaningful Korean icon-role names — those ARE trustworthy. And the `마이데이터등록/관리` composed screen (`32762:3299`) shows a `header_basic` with a **real** title ("마이데이터등록/관리") and a real bell icon, not placeholder — so reliability depends on *which frame* (demo template vs. composed example), not the page as a whole. [unverified beyond these 4 sampled frames]

Embedded screenshot annotation (`32762:3184`, transcribed verbatim) decodes icon naming: `nds_icon_header` = **컴포넌트명** (component name), `nds_icon_header_tooltip` = **아이콘명** (icon name) — the suffix after the component name is the icon's Type variant value.

## KEYS — header instances, name = key (kind, remote)

All checked via `getMainComponentAsync()`; read-only session, so `importComponentSetByKeyAsync` was **not attempted** (would throw per LEADER.md).

| Instance (nodeId) | Variant (main COMPONENT name) | COMPONENT key | remote | Parent COMPONENT_SET key | remote |
|---|---|---|---|---|---|
| `32760:6096` (NM Screens) | `Channel=NM, Left Icon=on, Right Icon=on` | `f3856f3362229d169e328d4d6639599672e83348` | true | `c95043e94317fde7230298017f42dd8099e1cbdc` | true |
| `32762:2513`/`2844`/`3134`/`4307` (icon-type demo, both duplicate frames) | same as above | same | true | same `c95043e94…` | true |
| `32760:6101` (QV Screens) | `Channel=N2, Left Icon=on, Right Icon=on` | `a2686b3cf0d4498b96eb40fa43929bbe5b8b58ee` | true | same `c95043e94…` | true |
| `32762:3302`/`4001` (마이데이터등록/관리, both duplicate frames) | `Channel=NM, Type=아이콘 1개` | `eedc6cc695a52eec84c867cec8f00f45f8615bd8` | true | **`07fb2e569ac9d8cd9e31b49cf8770209df58c089`** | true |

Note the QV-screen instance variant reads **`Channel=N2`**, not `QV` — quoted verbatim as observed; possibly a typo/legacy value in the library, not invented.

## ANSWERS — `header_basic` contest

**Partially resolved, with a new complication — do not force a clean "resolved."**

1. **Core's key (`c95043e94317fde7230298017f42dd8099e1cbdc`) is directly corroborated as the real, currently-live `header_basic` COMPONENT_SET key**, `remote: true`, sourced from a file that genuinely subscribes to NDS_Library — the best evidence yet for that side of the contest. 18 of 19 header instances checked resolve to it. This supports Core's key over the three M.web candidates (Top Nav / Dialog / FAQ), consistent with the assignment's hypothesis that those were COMPONENT (variant) keys or otherwise mis-read, not this set key.
2. **New finding not anticipated by the contest framing**: this same page also contains a **second, genuinely different, also-`remote:true` `header_basic` COMPONENT_SET** — key `07fb2e569ac9d8cd9e31b49cf8770209df58c089` — used on the one composed "real" screen (`마이데이터등록/관리`), with a different variant axis (`Channel, Type` vs. the demo frames' `Channel, Left Icon, Right Icon`). This is neither a COMPONENT/COMPONENT_SET mixup nor a doc-copy — both are `COMPONENT_SET`, both `remote: true`. **So the true state is at least 5 distinct real-or-claimed `header_basic` keys are in play across the domain**, not 4, and NDS_Library itself may host more than one published `header_basic` set (possibly an older/newer generation). This was not testable further (`importComponentSetByKeyAsync` throws in this read-only session — not attempted, per instructions).
3. **Do not overwrite Core's "broken 2026-07" flag from this evidence alone** — this page never called `createInstance()` fresh; it only read pre-existing instances, so the earlier "`Component set for node has existing errors`" import failure is untested here.

## TIERS

**9 published / 2 doc-copy(local) / 0 scaffolding**, of the components sampled:

- **Published (remote:true, real COMPONENT_SET)**: `header_basic` ×2 distinct sets (`c95043e94…`, `07fb2e569a…`), `statusbar` ×2 distinct sets (`e453babe03efec7dabe6c99a8db8d6a46eebac58` on NM/QV Screens; `fe57c685f5a27a53c49fc56c9999456340140c2f` on 마이데이터등록/관리 — another same-name/different-key pair, mirroring the `header_basic` split), `btn_bottom_page` (`accfb243ce752fd894af2b6db081b1074022a39d`), `btn_bottom_page_assets` (`0fc4758ec4ab4c83ad6052748c3dabf76d0542e8` — **exact match to Core reference**, corroborating Core and partially answering the open "M.web doesn't subscribe to NDS_Library, is Core's attribution right?" question: yes for this component, since NDS_Templates *does* subscribe and reproduces the identical key), `Basic_btn` (`6e32f5c69470db7d3193ea31a74ef4d92449ad51`).
- **Page-local doc-copy / scaffolding**: `card-2row` (`395faf210d018c86e35a44d7fefe25ea5bd73952`, `remote:false`, parent is a plain `FRAME` not a COMPONENT_SET) and `list` (`39e2aa83ee250a46785fbd17c5281a7034c83a4d`, `remote:false`, same pattern) — both used only inside the one composed `마이데이터등록/관리` example, standalone unpublished COMPONENTs nested in a demo frame, not real library components.

## BLANKS

None found blank at source on this page — every frame carries either real composed content or clearly-labeled placeholder text (화면 타이틀명/버튼명), which is itself the expected state for a template demo, not a gap.

## CORE reference — proposed change

Add a note under `header_basic` in `nds/LEADER.md` Core reference: **a second live `header_basic` COMPONENT_SET (`07fb2e569ac9d8cd9e31b49cf8770209df58c089`, `Channel/Type` axis) exists alongside the currently-documented one** — confirmed via NDS_Templates, a file that genuinely subscribes to NDS_Library. Do not treat "key differs from `c95043e94…`" as automatically wrong going forward. Same caveat likely applies to `statusbar` (two distinct real keys seen: `e453babe03…` vs `fe57c685f5…`) — worth a follow-up check, not conclusively resolved here.
