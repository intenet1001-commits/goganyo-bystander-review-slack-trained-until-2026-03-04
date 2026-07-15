---
name: nds-tpl-data-table
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=3-160"
learned_date: 2026-07-15
sections_studied:
  - "3:160 (page '    - Data Table 테이블(표)' — one canvas of ~7 composed usage examples, no asset-swatch sheet like M.web's)"
  - "4518:40198 (title frame: on-canvas 'Table' / 'QV-NM Template Guide')"
  - "10129:16573 (table_기본_01 — screen mock, 4-col basic table, up/down/flat rate column)"
  - "9849:18881/9849:19733 (Zebra Stripes section — 2line Table_cell variant)"
  - "23766:2469 (table_케이스_04 '버튼/라벨 혼합' — 7-col wide table; two cells are DETACHED custom frames, not instances)"
  - "23766:2473 (account_lookup card — raw text/icon nodes, NOT built from Table_cell — no multi-field-card use of the component found)"
status: internal NDS component-library guide (Templates file — usage-example gallery, not an asset-swatch sheet)
---

# NDS Templates — Data Table 테이블(표)

Single-page usage gallery (title on-canvas: **"Table" / "QV-NM Template Guide"**) for `Table_cell` / `Table_header` composed into ~7 example tables (기본 테이블, Full 테이블, Zebra Stripes, 화면 고정/스와이프 variants, 표안에 버튼, 버튼/라벨 혼합, 컨트롤). Unlike NDS_M.web's Data Table page, this page has **no isolated component-swatch sheet** — every `Table_cell`/`Table_header` seen is a live instance inside a composed screen mock.

## Layer-name convention — confirmed reliable

Screenshot of `10129:16573` (`table_기본_01`) matches its on-canvas heading exactly: "기본 테이블" (기본 테이블 section) shows a 4-column table with a rate column carrying ▲ (red) / ▼ (blue) / – (teal) glyphs, identical to the up/down/flat convention already documented from the UX Guide and M.web. `Table_cell`/`Table_header` instance layer names read directly as their component name — no frame-number-vs-heading mismatch found on this page (confirmed, not exhaustive).

## ANSWER — `Table_cell` / `Table_header`: real COMPONENT_SETs, keys match Core exactly

Resolved via `getMainComponentAsync()` on live instances (read succeeded; only broader `findAllWithCriteria` calls hit read-only-mode errors — see Gaps):

| Instance sampled | variant (`main.name`) | `main.key` (COMPONENT) | `main.remote` | `main.parent.name` | `main.parent.key` (COMPONENT_SET) |
|---|---|---|---|---|---|
| `10129:16623` Table_cell | `Type=basic` | `5d5243c0a77ea31c1dc15832ab9d206d21bf7650` | true | `Table_cell` | `fc81ad075240f81283ab0769426639ff87b6e542` |
| `10196:16915` Table_cell | `Type=basic` | (same) | true | `Table_cell` | `fc81ad075240f81283ab0769426639ff87b6e542` |
| `10204:16516` Table_cell | `Type=basic` | (same) | true | `Table_cell` | `fc81ad075240f81283ab0769426639ff87b6e542` |
| `10935:17636` Table_cell | `Type=basic` | (same) | true | `Table_cell` | `fc81ad075240f81283ab0769426639ff87b6e542` |
| `15178:2313` Table_cell | `Type=2line` | `c215df401fc4d00efda626797cb376076131ec0d` | true | `Table_cell` | `fc81ad075240f81283ab0769426639ff87b6e542` |
| `23766:2505` Table_cell | `Type=2line` | (same) | true | `Table_cell` | `fc81ad075240f81283ab0769426639ff87b6e542` |
| `9849:18862` / `9849:19738` Table_cell | `Type=2line` | — | true | — | — |
| `10118:18969` / `10124:20727` Table_cell | `Type=basic` | — | true | — | — |
| `10129:16617` Table_header | `Type=basic` | `cf7c2dee26d1a354d58575a299e5f7a04268ad23` | true | `Table_header` | `8074b6b4ab30e8d392bfb6aec6857386f10e5006` |
| `10196:16927` Table_header | `Type=basic` | (same) | true | `Table_header` | `8074b6b4ab30e8d392bfb6aec6857386f10e5006` |
| `10204:16532` Table_header | `Type=basic` | (same) | true | `Table_header` | `8074b6b4ab30e8d392bfb6aec6857386f10e5006` |
| `15178:2306` Table_header | `Type=sorting` | `1abccc5245e1a3b001270394a36041c8056b5821` | true | `Table_header` | `8074b6b4ab30e8d392bfb6aec6857386f10e5006` |
| `23766:2496` Table_header | `Type=2Line` | `c417df6d199df1d6fd209efdd548deae87e8bf34` | true | `Table_header` | `8074b6b4ab30e8d392bfb6aec6857386f10e5006` |

**`Table_cell`'s parent `COMPONENT_SET` key is `fc81ad075240f81283ab0769426639ff87b6e542` — EXACT match to Core.** **`Table_header`'s parent `COMPONENT_SET` key is `8074b6b4ab30e8d392bfb6aec6857386f10e5006` — EXACT match to Core.** Both `remote: true`. **This confirms Core's structural claim (one COMPONENT_SET with a `Type` variant axis) is correct**, and settles the open question: NDS_M.web's page-local `Table_cell`/`Table_header` symbol sheet (7 + 4 standalone COMPONENTs, all different keys) was a **doc re-creation**, not the real library component — this file, which genuinely subscribes to NDS_Library, proves it.

## Multi-field-card claim — still unresolved, not tested here either

Core's "poor fit for multi-field cards" claim is **neither confirmed nor refuted** on this page. Two candidate examples were checked and both fail to be a real test:
1. `23766:2473` `account_lookup` — a 2-field balance card ("출금가능금액"/"201-02-123456" + "77,269 원"/"[종합매매] 김엔투") — but it's built from **raw TEXT/icon nodes, not a `Table_cell` instance at all**.
2. `23766:2510`/`23766:2513` (in the "버튼/라벨 혼합" wide table) — named `Table_cell` but are **detached custom `FRAME`s** (not `INSTANCE`s), each holding only 2 stacked `TXT` nodes — not a 4+-field card either, and structurally no longer the live component.

No composed example on this page uses `Table_cell` for a genuine multi-field (4+ label/value pairs + status chip) card. The claim remains untested by any file learned so far.

## Findings summary

- **Templates confirms Core, contradicts M.web's local copy.** `Table_cell`/`Table_header` are genuine `COMPONENT_SET`s with a `Type` variant axis, `remote: true`, keys exactly matching Core reference (`fc81ad07…`, `8074b6b4…`).
- Every sampled instance's `Type` (`basic`, `2line`, `sorting`, `2Line`) is a valid Core-documented variant value — no new/undocumented Type surfaced on this page.
- No `Table_control` (check/radio) instance found on this page — the M.web-discovered component wasn't re-confirmed here (out of scope for this single page, not evidence against it).
- 상승/하락/보합 glyph convention (▲ red / ▼ blue / – teal) reconfirmed inside a live `Table_cell` `rate`-column context, consistent with the UX Guide and M.web findings.

## Blanks / gaps

- **Could not run a page-wide instance sweep.** `page.findAllWithCriteria({types:["INSTANCE"]})` followed by `getMainComponentAsync()` in a loop threw `"Operation attempted to modify the file while in read-only mode"` on two attempts (even scoped to 40 instances) — the session is read-only for that combination of calls. Worked fine for small, explicit ID lists (used above). Coverage of `Table_cell` `Type` values actually composed on this page (`rate`/`with button`/`button`/`multi`/`global` beyond what's sampled) is therefore **not exhaustively confirmed** — only `basic`/`2line`/`sorting`/`2Line` were directly observed.
- `importComponentSetByKeyAsync` not attempted (read-only session per task instructions) — keys above are read via live-instance `getMainComponentAsync()`, not import, so they are directly observed rather than `unverified`.
- No written usage rules found anywhere on this page (same as M.web) — nothing to report as blank-at-source beyond "this page is example-only, no prose guidance."
