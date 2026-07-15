---
name: nds-tpl-link-list
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=26819-1617"
learned_date: 2026-07-15
sections_studied:
  - "26819:1617 (page canvas — 3 composed screen mocks: 이체_이체설정 `26819:3743`, NM_서비스 신청/변경 `26819:4740`, 아이디/비밀번호 관리_완료 `26820:3562`)"
  - "26820:3562 (아이디/비밀번호 관리_완료 — only frame get_metadata could expand; 2 stacked 'Main Container' sections each with 4× item_setting rows + sectionbar divider, plus top/statusbar/Topbar_Dropdown chrome and quickmenu_basic)"
  - "26819:3743 (이체_이체설정 — 'symbol' type, metadata would not expand; screenshot-confirmed only)"
  - "26819:4740 (NM_서비스 신청/변경 — 'symbol' type, metadata would not expand; screenshot-confirmed only)"
status: internal NDS component-library guide (Templates file — usage-example gallery, not an asset-swatch sheet)
---

# NDS Templates — link list 이동리스트

Page is 3 composed settings/menu screen mocks (이체 설정, 서비스 신청/변경, 아이디/비밀번호 관리) built from a single row component: **`item_setting`**, not `list_link`. Every row = icon-free title + subtitle text pair, right-edge either a chevron (`nds_icon_arrow`) or, in one screen, a pair of action buttons.

## Layer-name convention — confirmed reliable (for this page)

`item_setting` instance/frame names read directly as their component name; the `아이디/비밀번호 관리_완료` frame's on-canvas header text ("아이디/비밀번호 관리") matches its layer name exactly. Consistent with `nds-tpl-list`'s finding for this file — reliable here too.

## Component keys — real COMPONENT_SETs, `remote: true`

Only `26820:3562` (아이디/비밀번호 관리_완료) was expandable via `get_metadata`; the other two top-level frames are Figma "symbol" nodes that neither `get_metadata` nor a `node.query` sweep would expand (both attempts threw `"Operation attempted to modify the file while in read-only mode"` — the documented intermittent throw). They are **screenshot-confirmed visually** (see Blanks) but not key-sampled.

| Instance | variant | main COMPONENT key | remote | parent SET name | parent SET key |
|---|---|---|---|---|---|
| `26820:4081`/`26820:4135` item_setting | `Property 1=arrow, toggle on=off` | `4b38b927dc3f1d956ac8868c5ad7465b49bb1009` | true | `item_setting` | `346da24c50ff2685ec05c43c581a3c77645efed9` |
| `26820:4184` nds_icon_arrow (hidden in a button-row variant) | `Color=05, Type=right, Height=h24` | `d0ec4c9777b1f8ce1bec480f25a1f72c2d962aa1` | true | `nds_icon_arrow` | `dde648604e4d08cc6b99c44dda81ec73ccbb4b15` |
| `26820:4190` btn_container_regular | `Strength=4(line), Height=h46, Status=normal` | `9727232cc58b1e4de962fd6618c896cdb4c3f989` | true | `btn_container_regular` | `fd0a4e2fd7b3c49612b27963bd8bf41f1580910b` |

`item_setting`'s own variant axis literally names a state `arrow` (plus a `toggle` boolean) — the row component natively supports either a chevron-nav state or a toggle state; the 3 password rows on this page detach/customize it into a 2-button state instead (see below).

## ANSWERS

**Distinct family, not List-page reuse.** `item_setting` (SET `346da24c…`) shares no keys with `nds-tpl-list`'s 7 row families (`list_stock`, `list_account`, `list_board`, `list_product03`, `card`, `btn_order_container_list`, `label_basic`). It is a separate purpose-built settings/nav-menu row component — confirms the "link list 이동리스트" page is its own row family, though Core has no `list_link` entry (the component itself is named `item_setting`, not `list_link` — that naming guess doesn't hold).

**Chevron = `nds_icon_arrow Type=right`, confirmed.** Sampled key: `Color=05, Type=right, Height=h24` (SET `dde64860…`) — exactly the "actionable, nothing pending" affordance Core describes, used on `item_setting`'s default `arrow` variant.

**One-action rule: mixed — holds on 2 of 3 screens, deviates on the 3rd.** 이체 설정 (`26819:3743`) and 서비스 신청/변경 (`26819:4740`) are pure chevron-nav lists — one full-row tap target per row, rule holds (screenshot-confirmed only, not key-verified — see Blanks). But 아이디/비밀번호 관리 (`26820:3562`)'s 3 password rows (거래/아이디/계좌 비밀번호) each show **two simultaneous buttons** ("변경" + "재설정"), no `더보기` menu, no chevron — a second, independent sighting of the same partial-deviation pattern `nds-tpl-list` found in `list_product03`'s expanded state (primary+secondary pairing, not single-action).

## Blanks / gaps

- `26819:3743` and `26819:4740` are Figma "symbol"-type nodes; `get_metadata` returned them unexpanded and a `node.query("INSTANCE")` sweep on each threw the read-only error — their row components are **unverified by key**, confirmed only via screenshot (both show the same title+subtitle+chevron row shape as `item_setting`'s default state).
- No written usage rules found on this page (same as `nds-tpl-list`, `nds-tpl-data-table`) — example-gallery only, per Gotcha 7.
- Icons `nds_icon_notify` (header bell) and `sectionbar`/`quickmenu_basic`/`statusbar`/`Topbar_Dropdown` chrome instances not key-sampled — out of scope for row-family question.
