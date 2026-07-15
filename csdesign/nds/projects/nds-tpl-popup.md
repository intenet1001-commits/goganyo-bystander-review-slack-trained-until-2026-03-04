---
name: nds-tpl-popup
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=3-158"
learned_date: 2026-07-15
sections_studied:
  - "3:158 (canvas '    - Popup  팝업' — 155 top-level children: 4 titled sections + ~50 demo frames + a handful of published COMPONENTs)"
  - "4386:34089 (title frame, on-canvas 'Layer Popup / QV-NM Template Guide')"
  - "4386:37239 (title frame, on-canvas 'Bottom Sheet (Sliding popup)')"
  - "4386:36988 (title frame, on-canvas 'Full Popup')"
  - "32560:13349 (title frame, on-canvas 'Summary View Popup')"
  - "4386:34092 (frame 'popup_레이어_01' — live 레이어팝업 min-height demo, screenshotted)"
  - "4386:37157 (frame 'popup_풀_01' — live 풀팝업 demo, screenshotted)"
status: internal NDS component-template gallery (design-system reference; subscribes to NDS_Library and publishes as NDS_Templates)
---

# NDS Templates — Popup 팝업

A **demo gallery**, not a rules essay: four titled sections (Layer Popup, Bottom Sheet/Sliding popup, Full Popup, Summary View Popup) each containing many composed example frames (`popup_레이어_NN`, `popup_바텀시트_*`, `popup_풀_NN`, `Summary View Popup_NN`) built from real component instances, plus a small number of actually-**published** COMPONENTs on this page (`step_header`, `이체_내계좌`, `이체_계좌선택_직접입력`, `이체_계좌선택_직접입력_스크롤`, `통화 선택_진입시`, `간편매수_확인_popup`).

**Layer-name convention — confirmed unreliable.** All four section title frames share the identical layer name `\x08title` (a control-character placeholder); the on-canvas headings ("Layer Popup", "Bottom Sheet (Sliding popup)", "Full Popup", "Summary View Popup") are the only way to tell them apart. Screenshot-confirmed on all four.

## Read-only session — broader block than expected

Not just `setCurrentPageAsync`/`importComponentSetByKeyAsync`: both `instance.getMainComponentAsync()` and the sync `instance.mainComponent` getter throw `"Operation attempted to modify the file while in read-only mode"` here — resolving *any* instance's main component is blocked, not just import calls. Worked around via `list_file_components_for_code_connect(fileKey)`, which returns real `assetKey`s (all `external: true` = remote) for components that are dependencies of this file's 55 published components — but only for instances reachable that way; most page-local demo instances (`popup_silding_select_asset`, `btn_bottom_layerpopup`, `account_popup_assets`, `check_popup`, `radio_btn`, etc.) aren't a dependency of any published component here and stay **unverified — read-only session**.

## Confirmed remote keys (real, from `list_file_components_for_code_connect`)

| name | key | kind | vs. Core/sibling |
|---|---|---|---|
| `nds_icon_arrow` | `dde648604e4d08cc6b99c44dda81ec73ccbb4b15` | COMPONENT_SET, remote | matches Core exactly |
| `quickmenu_basic` | `9c5dd3cd3e714255914cf288f442fad7c3ac76dd` | COMPONENT, remote | matches Core exactly |
| `Table_cell` | `fc81ad075240f81283ab0769426639ff87b6e542` | COMPONENT_SET, remote | matches Core exactly |
| `Table_header` | `8074b6b4ab30e8d392bfb6aec6857386f10e5006` | COMPONENT_SET, remote | matches Core exactly |
| `nds_icon_close` | `66bbb0807fc9e3046ba2b4b8d08a6c89f7f03451` | COMPONENT, remote | new, not in Core |
| `btn_container_regular` | `fd0a4e2fd7b3c49612b27963bd8bf41f1580910b` | COMPONENT, remote | new |
| `btn_bottom_page` | `accfb243ce752fd894af2b6db081b1074022a39d` | COMPONENT, remote | **≠ Core's `btn_bottom_page_assets`** (`0fc4758e…`) — different component, similar name |
| `Topbar_Dropdown` | `ce701f7c5eda23073d17bd862838e75f191b0a96` | COMPONENT, remote | **≠ `nds-mweb-popup`'s `Topbar_Dropdown`** (`69e7ffd4…`) — same name, different library, different key |
| `statusbar` | 4 distinct keys observed (`fe57c685f5…`, `cd20876126…`, `b4d07422e1…`, `fef1ad4be1…`) | remote | **name collision**, same pattern as `header_basic`/`btn_bottom_layerpopup` elsewhere in this domain |

## Screenshot-confirmed content

- **레이어 팝업 min-height demo** (`4386:34092`): live phone mockup, `quickmenu_basic` **visible** behind the popup, card reads "1줄 이상 써주세요. 최소 사이즈는 **230px**이에요." — a **new numeric conflict**: `nds-mweb-popup.md` states/measures the same minimum as **233px**. Two sibling sources now disagree on this number; unresolved.
- **풀팝업 demo** (`4386:37157`): header is `타이틀 ✕` (close only, no back), **no `quickmenu_basic`**, **no bottom button** — content is Notion-boilerplate/FINRA placeholder text (not real copy). Exactly matches `nds-ux-guide-popup`'s 풀팝업 rules.

## GAPS

- Most demo-frame instance names (`popup_silding_select_asset`, `btn_bottom_layerpopup`, `account_popup_assets`, `check_popup`, `radio_btn`, `유의사항_Content_popup`, `Topbar_Fullpop`, `icon_comm_complate/warning`, `nds_bullet_mydata`, `r_squre_h60_open_txt_w492`, `combo_box`, `check_icon_line`, `check_icon_solid`, `radio_basic_txt`) — **unverified — read-only session**; not proof of unpublished status, just unreachable by the available read APIs.
- Page carries no prose rules (unlike the UX Guide) — it is a component-instance gallery only; go to `nds-ux-guide-popup.md` for the *why*, this file for confirmed keys/measurements.

## How this feeds BUILD mode

Confirms the domain's standing pointer ("Figma → NDS_Templates → Popup 참고") is real: this page is where the four popup types are actually assembled from `NDS_Library` instances. Prefer the 9 confirmed keys above over guessing; treat everything else here as needing a write-capable session to resolve.
