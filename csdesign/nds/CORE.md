# CORE — always-on BUILD baseline

> **This is what a BUILD pass reads FIRST.** It is the cross-file view: one row per component, with **every**
> key sighted for it. Multiple keys under one name are legal and real (see `header_basic`) — that is a fact
> about this design system, not an error to reconcile away.
>
> **Read order for BUILD:** this file → `INDEX.md` (find the topic's note) → that note. Check `LEDGER.md`
> only when INDEX flags a topic ⚠/⛔. **Never** read `sources/*.md` at build time — that is LEARN forensics.
>
> **Key format rule:** componentKeys are the **full 40-hex string or absent**. An ellipsis (`abc123…`) is
> **invalid** — it cannot be passed to `importComponentSetByKeyAsync`. Six keys were stored truncated and
> unusable until 2026-07-15; restored from `projects/*.md`. Grep before committing a row:
> `grep -nE '\`[0-9a-f]{6,39}…' CORE.md` must return nothing.
>
> **Status column:** `unverified` means the key was read off a live instance but **never round-tripped**
> through `importComponentSetByKeyAsync` — every Figma session this repo has used was **read-only**, where
> that call throws. `unverified` is the norm, not a defect; it means "seen, not executed".

Reference data collected from a real NHIS Digital Platform Figma file (org `organization::1445250327526291914`) so future `use_figma` work doesn't have to re-discover the same components from scratch. Always confirm keys still resolve with a quick `importComponentSetByKeyAsync` before relying on them — libraries evolve.

**Promotion bar note** (for consistency with `../asset/COMMON.md` and the production-site domains, which require ≥2 independently-learned projects before promoting a claim to their own "Common patterns" section): this Core reference doesn't wait for a 2nd source. NDS is a single canonical design-system library — one confirmed observation from the real, subscribed library file is already authoritative, since there's no second independent implementation to cross-check against. `asset` covers independently-built shipped screens that might each do things their own way, so that domain's bar is intentionally higher. This is a deliberate difference in how the two domains work, not an inconsistency.

### Libraries

Discovered via `get_libraries({ fileKey })` on a file already subscribed to NDS. Library keys are long-lived; reuse them directly in `search_design_system({ includeLibraryKeys: [...] })` to scope searches instead of searching everything.

| Library | libraryKey | Contents |
|---|---|---|
| NDS_Library | `lk-e6bea415400bda7333bf420ebc524217219c3d9a92b4b42c8fe4e43e2bf613b37c02396f57bcda1f307f67fa55fe9b0b5d405b1b977e0313aecdfcb7951e5119` | Core components: headers, buttons, radio/checkbox, tabs, icons, tables |
| NDS_Templates | `lk-6485b4ef7b0b10972b6bedaec2939b2704dde7bf1b3c11029414263b122918e9dec57db8c867a3e3c30d3ccd34568ea2cd685c80389235d66d054f4a651770a6` | **corrected 2026-07-15** — was described as "Full page templates (e.g. product order flows)". **It is not flows.** Its most flow-like page (`42129:7390` 매매 주문 확인) was probed: 3 top-level artifacts, **zero prototype links**, each a frozen confirm moment in a different product context — a component/pattern page. Read it as **composition/usage examples** of NDS_Library components. File `1xE0qvn2yv3ZkQ9BwhKT1y`; **subscribes to NDS_Library**, so its keys corroborate this table rather than rivalling it. See `### NDS_Templates` above (10/39 learned). |
| NDS_Colors | `lk-a53c04528e4f6b93f81844642ba2d019d3e52894662e8def952bf0ea35739941a9316cf5abf9c2320d59cb70e584b84d7cf59c567ef44d17dc5791fd1ad0ea9b` | Color fill styles — names are cryptic numeric codes (e.g. `NM/Primary/270.274`, `NM/Grayscale/20.203`), not semantic. Faster to sample colors directly off existing component instances (see Tokens below) than to decode style names. |
| NDS_Darkmode Colors | `lk-77c238f65d24623b72cc780ce48ba757b17edd3122aea855450a33fe3643b869cd2d2a19c2079333cbdcaf940375e853687bb924c00dac4398a46b2497ea4121` | Dark-mode counterpart color styles |
| **NDS_CI** (added 2026-07-16) | *(file `KmpaYeoYh41F6nyIKvBQ7h` — no libraryKey; it **publishes nothing**)* | **⛔ NOT a component library — a CDN asset catalogue.** Third-party institution/stock CI. `COMPONENT`/`COMPONENT_SET`/`INSTANCE` = **0** on every inventory page; logos are plain FRAMEs with image fills or flattened geometry. **There is no key to import for any logo.** The contract is a filename resolved server-side: **`downloadcdn.nhqv.com/mts/ci/이미지명.png`**, falling back to **디폴트 CI** on 404. The **only** importable sets are the 8 defaults on its guide page (below). It **consumes** NDS_Library — its `nds_flag` instance resolves to `d81573482ffbff1e5076384753d483a3072d775f`, matching `nds-lib-icons.md` byte-for-byte. See `LEDGER#ci-not-a-component-library`. |
| **NDS_M.web** (added 2026-07-15) | `lk-3be70d25016393cffa2f36eac4d994fcd5f0c6417dfd4e8a182bbb77346e00a57e7b97d48be832f9ef35e37b02862383ee65d47d437001b9182bd1103d6b3d6c` | **Mobile-web component library — a separate platform from the rest of this table, which is app-side.** Its own file (`uVcmG6GgOl2J8EOlc22wob`) does **not** subscribe to NDS_Library. Keys/components here are NOT interchangeable with the app keys below even when the names match — see `### NDS_M.web` above for the three-tier warning (published vs page-local doc copy vs unpublished export scaffolding). Uses Pretendard, not NanumBarunGothic. |

`Channel` variant property seen across many components: `NM` = 나무(NAMUH?) main channel, `QV` = QV channel. Default to `NM` unless the target screen is explicitly a QV surface.

### Verified component keys (componentKey, for `importComponentSetByKeyAsync`)

All from NDS_Library unless noted.

| Component | key | Variant axes | Notes |
|---|---|---|---|
| `header_stock` | `28c77263cb49ee32b6dc3ab6df216e5887659855` | Channel, country, Type | Good reference for header structure (back icon + title + right icons); has nested `tit` and `nds_icon_header` instances |
| `header_basic` | `c95043e94317fde7230298017f42dd8099e1cbdc` **(corroborated 2026-07-15 — see note)** | Channel, Left Icon, Right Icon (+ `rightType` `기본`/`txt btn`/`two`/`-`, added 2026-07-15 from NDS_Templates `32758:4146`) | **ROOT CAUSE FOUND 2026-07-16 — the set itself is FINE.** Instancing throws `"Component set for node has existing errors"` because it **nests `header_title_txt` (`9864:16724`) ×12**, which has two identically-named variants. `header_stock` nests it ×0 and works. **Fix = rename/delete one duplicate variant there; re-keying won't help.** Until then use the manual builder below. **A 2nd, genuinely different SET shares this name** — `07fb2e569ac9d8cd9e31b49cf8770209df58c089` (`Channel × Type`), published **6 seconds** after this one; **both are live in the index.** See the `header_basic` section below + `LEDGER#header-basic-keys`. |
| `nds_icon_header` | `19619c9f1fd2e3c2e6515542d0484e651f3f30c6` | Type, Color, Darkmode | 81 variants. Confirmed present: `back`, `close`, `info`, `bell`, `bellnew`, `guide`, `kebab`, `stock`, `mic`. Use `Color=2, Darkmode=false` for standard light-mode icons. |
| `btn_bottom_page_assets` | `0fc4758ec4ab4c83ad6052748c3dabf76d0542e8` | Channel, Type(`1-btn`/`1:2-btn`/`2-btn`), Status(`normal`/`disabled`) | Primary (green) bottom CTA. `1-btn` = full-width single button (540w). `2-btn` = one half of a two-button row (270w) — place two instances side by side. Override text via nested `TXT` node (`findAllWithCriteria({types:["TEXT"]}).find(t=>t.name==="TXT")`). |
| `btn_bottom_page_assets_gray` | `873d1a7bbe44364aef31c19bbf15f19d7d457265` | Type(`1:2-btn`/`2-btn`, + `(icon)` variants), Status | Secondary/gray counterpart — pair with the green `2-btn` above for confirm-dialog cancel/submit rows. |
| `radio_basic` | `91f58f3a086c5ef03ac03c8d77a725d32b3f7a1f` | Channel, Status(`normal`/`selected`/`disabled`/`disabled-selected`) | Bare 26×26 radio circle, **no nested label** — wrap in your own auto-layout pill with a text node alongside it for a labeled option. |
| `radio_btn` | `1a972d991cc7c8f8f97bc5557740fba58ca82f23` | Height(`h60`/`h46`), Active(`on`/`off`/`disabled`) | Alternative full-row radio control |
| `popup_radio_account` | `bca81c36fdb886105179354ec7c1a6b150c0d0e8` | Type(`계좌만`/`통장이름`/`잔액표시`), Status(`normal`/`selected`) | **This is a 계좌 선택창 (picker) row, not the 계좌 컨트롤러 itself** — the two are strictly distinct; see `projects/nds-ux-guide-account-controller.md`. **The `Type` axis is a rule decision, not styling** (added 2026-07-15 from that guide): `계좌만` = 계좌번호 only, `통장이름` = +계좌정보, `잔액표시` = +잔고표시 — and per 원칙 3, `잔액표시` implies the feeding controller must be 라인형. Picker text must equal controller text (only 잔고표시 may be dropped). Guide shows a `최대 24글자 표기 이상은 말줄임` budget on the secondary line, consistent with the no-reflow clipping gotcha below. **Controller keys RESOLVED 2026-07-15** (was: "no component key exists yet for the controller itself — a real gap"). NDS_Templates `304:15709` found **4 keys, one per usage context**, all COMPONENT_SET + `remote: true`, mapping 1:1 onto the UX Guide's three types: 박스형 `account_trading_withbtn` `259adcc7ae32a34dcd130d01b5a3aacdf0ce77ba` · 라인형(조회) `account_lookup` `557d8e460dcc937a0cd6b3fec94495d181d2aceb` · 라인형(신청) `account_apply` `3f1d52aa040066b6ed58665c64c74fb86c21dec5` · 텍스트형 `txt_simle` `a5cd89675e29ae6469c21e4d8aa32a31052d23c7`. Their `Type` axis (기본정보/잔고표시/계좌번호) matches the guide's text-composition rule. All `unverified — read-only session` (`importComponentSetByKeyAsync` unavailable). Full-width (480px default) account-row selector card. Nested TEXT nodes named `통장이름` (title) and `계좌번호` (subtitle) — override both via `findAllWithCriteria({types:["TEXT"]})`. **Do not shrink below ~330px width** — internal text doesn't reflow and clips; use full-width, stacked vertically, not squeezed side-by-side. |
| `check_icon_solid` | `3452ebde77d6d2d759f123e422ccee3a6c01b3c4` | Channel, Height(`h34`/`h26`), Status, Darkmode | Solid checkmark badge, good for completion/success states |
| `check_icon_line` | `0598f4c21dd68667d15d34875f12c1b3e1176c34` | Channel, Status | Outline checkmark |
| `tab_2depth_chip` | `0f20528265a3c598e42e30f6ae422be67e941c10` | `Property 1` (`Default`/`Variant2`) | Default variant ships pre-populated with multiple example `tab_btn` + `TXT` pairs (not a clean 2-state toggle) — trim to the N tabs you need or build a simple 2-pill toggle manually if you only need 2 states. |
| `Table_cell` | `fc81ad075240f81283ab0769426639ff87b6e542` | Type(`rate`/`with button`/`button`/`multi`/`2line`/`global`/`basic`) | Fits simple label+value or label+icon rows; not a good fit for multi-field cards (e.g. a stock card with 4+ label/value pairs + a status chip). **corrected 2026-07-15** — the "poor fit" half is now CONFIRMED (first real test, after 2 files had no 4+-field example to check): NDS_Templates `94:17765` and `404:13016` both hold genuine multi-field cards and **neither uses `Table_cell`**. But **"build those manually instead" is WRONG — do not hand-build.** Purpose-built published components exist for exactly this case: **`colum`** `c355ddcba3cd13f902b9ff2d9a678498b0ca119c` (SET, axis `단분할`, remote — label/value rows, used by `국내ETF검색` `4216:31489` and `계좌잔고_해외주식` `4214:31482`) and **`list_product03`** `6eb8cdb388e2ffdf8be7688c9f040597c289db80` (SET, remote — product rows). Reach for those. Both `unverified — read-only session`. |
| `Table_header` | `8074b6b4ab30e8d392bfb6aec6857386f10e5006` | Type(`switch`/`sorting`/`2Line`/`basic`) | |
| `toggle_basic` | `42cff7468c8000d28635cd9abd7695ce9aabc30b` | Channel, Height(`h32`), Active(`on`/`off`) | |
| `nds_icon_menu` | `9bc511d2e0676903ee9be6cdeb26598d234604b7` | Type(`exchange`/`setting`/`login`/`logout`/`person`/`home`) | |
| `quickmenu_basic` | `9c5dd3cd3e714255914cf288f442fad7c3ac76dd` | Channel, Type(`normal`/`pressed`/`Easy`) | Global 5-icon app-shell bottom nav (+ hamburger = 6 tappable slots): 홈/관심 그룹/주식 현재가/국내주식 주문/국내주식 잔고·손익. Nested TEXT names match those labels exactly for override. Appears on **every** real screen in the app, not just list screens — include it on any screen meant to look "real" unless that screen has its own sticky primary CTA (then the CTA replaces it, don't stack both). |
| `유의사항_하단노출` | `6ab304902264c6101f4a0a62927f79d08c1d5827` | Type(`1줄`/`2줄`), 더보기(`on`/`off`) | Persistent one-line (or two-line) disclaimer bar that sits directly above `quickmenu_basic`, always visible (not just in a popup). Use `더보기=on` to keep a "more" link that opens the fuller info popup. Single nested TEXT named `유의사항(default)` — override directly. |
| `select_line` | `0842644285356f35387441ac1cb0812f872c3c10` | — | **added 2026-07-15** (NDS_Templates `1636:23684`). Line-type select → opens a **sliding bottom sheet**. Pairs with `combo_box` below; the sheet/inline split is by component type and matches `nds-ux-guide-account-controller`'s 라인형→bottom-sheet rule. `unverified — read-only session`. |
| `combo_box` | `e47693a48af0a713a785ee9f074c1ed2a083f8bf` | — | **added 2026-07-15** (NDS_Templates `1636:23684`). Box-type select → **inline expand**, not a bottom sheet. Matches the 박스형→inline rule. `unverified — read-only session`. |
| `popup_silding_select_asset` | `774810d98b93da7f6ae2264319400559d0ead811` | — | **added 2026-07-15**. The sliding select sheet itself. `unverified — read-only session`. |
| `input_line` | `54946e9fc819093272e3ca0abdd7b8b49e763cd3` | — | **added 2026-07-15** (NDS_Templates `3760:32774`) — Core previously had **no text-field entry at all**. Line-type input. Seen normal + disabled + dropdown-compound. `unverified — read-only session`. |
| `input_box` | `123c8f22410029b388d6117a398dae443e1892bb` | — | **added 2026-07-15**. Box-type input — **discouraged by a usage rule on that page**; prefer `input_line`. `unverified — read-only session`. |
| `input line_certify` | `16b2d52478c0640dfa3ee4fed824f6f1f6234e4d` | — | **added 2026-07-15**. Certification-line input (note the space in the name). **Requires design-team sign-off per an on-page rule.** `unverified — read-only session`. |
| `searchbar_basic` | `755deb62dc296ad41135fb0147e814de64cb7e08` | — | **added 2026-07-15** (NDS_Templates `12374:4326`) — Core previously had **no searchbar entry**. ⚠️ **Ships only 3 states (NORMAL/PRESSED/FILLED); `nds-ux-guide-search` requires 4** (Normal / Focused Empty / Focused Typing / Results), and the guide's **탐색형** (searchbar in the header slot, replacing the title) has **zero examples** in the library. A BUILD pass cannot satisfy the guide with this component — escalate. `unverified — read-only session`. |
| `searchbar_filter` | `0ca00d45253ed2384c2cce8e681af9eda793c502` | — | **added 2026-07-15**. Search bar with a filter affordance. Same state/type caveats as `searchbar_basic`. `unverified — read-only session`. |
| `colum` | `c355ddcba3cd13f902b9ff2d9a678498b0ca119c` | `단분할` | **added 2026-07-15** (NDS_Templates `404:13016`). **The label/value row component to reach for on multi-field cards** — see the corrected `Table_cell` note: do NOT hand-build those. Used by `국내ETF검색` (`4216:31489`) and `계좌잔고_해외주식` (`4214:31482`). `unverified — read-only session`. |
| `list_product03` | `6eb8cdb388e2ffdf8be7688c9f040597c289db80` | — | **added 2026-07-15** (NDS_Templates `94:17765`). Product list row; its expanded state is a genuine 4+-field card built **without** `Table_cell`. Sibling row families on the same page: `list_stock` `09fd4ecabbb4e3db2151a55b00396e49a05693e7`, `list_account` `13d1fd192e1910377c11012c4752f91e3236b3dd`, `list_board` `d4853f1f0a6138bd17f603b51706282ca6ae6da9`, `card` `8ec93dc2c367da7954a072d96b5cb4c7addae943`. **Note:** its expanded state shows 2 buttons (primary + secondary, no `더보기`) — a **partial, unconfirmed deviation** from `nds-ux-guide-touch-area`'s one-action-per-row rule. `unverified — read-only session`. |
| `chart_pie` | `37223b19d81f1a1f965ee72efac073983cd17c5d` | — | **added 2026-07-15** (NDS_Templates `15260:2524`) — Core's first chart component. Pie/donut. **Deliberately NOT added: gauge and line chart.** That page has section headers for both, but **no component backs either name** — the gauge hides in frames mislabeled `chart_pie05_nm`, and the only line chart is embedded in an unrelated popup. Adding them from the headers alone would create ghost entries. **`nds-ux-guide-updown-notation`'s 상승=red/하락=blue does not apply to chart marks** (composition data has no direction; series colours are identity, not direction) — it applies to the rate text beside the chart. `unverified — read-only session`. |
| `top_banner/NM` | `5f4e5c45ca33b1f303882902acb85310b95561ba` | — | **added 2026-07-15** (NDS_Templates `619:26120`) — Core previously had **no banner entry**. Dark top-of-screen promo. Siblings on the same page: `card_guide` SET `a027ac0b3104f7c3cbaf4cce2abd81daa65f95ae` (guide link row), `NM_group_banner` SET `adbfc23920bee1365cc11280abfd44eef93870e4` / `QV_group_banner` SET `7d16bf05ecfeb58d264c004a3ebc65b1fff6298e` (inline, embedded in stock lists), `main/banner` SET `751beba013e1b3bb38eff6f220e86f9b4d824cd0`. Image style is a carousel via `pagination01`. **No dismiss/rotation/max-count rule anywhere — blank at source.** `unverified — read-only session`. |
| `pagination01` | `1f8a2fec3ced9d0ddae3c8acffc34f3520626da0` | — | **added 2026-07-15**. Carousel dots (`Step=N`). **Corroborated 3× independently** (`271:12615`, `619:26120`, and Core's own prior sighting). Its page-mate `step_header` is a wizard step indicator — structurally unrelated (different SET), and it appears **standalone on one instance and as a SET member on another**; that duality is **unresolved**. `unverified — read-only session`. |
| `nds_icon_arrow` | `dde648604e4d08cc6b99c44dda81ec73ccbb4b15` | Color(`01`/`03`/`04`/`05`/`06`), Type(`up`/`down`/`left`/`right`), Height(`h16`/`h24`) | Two different components share this exact name (an older one, key `e5c1cd3126858fc4f2ad492128e21c059097a5b9`, last updated 2025-11-03) — prefer the more recently updated key above. Use `Type=right` for a plain list-row chevron (the "actionable, nothing pending" state in a 3-tier status pattern — see `../asset/projects/domestic-stock-rights.md`). |

### NDS_Library masters — keys read at the source of truth (added 2026-07-16)

> **`remote: false` here means MASTER, not "documentation re-creation."** NDS_Library **is** the home library —
> a master always reads `remote: false` **in its own file**; `remote: true` only means "imported from elsewhere."
> **Proof:** `header_stock` reads `remote: false` here with key `28c77263cb49ee32b6dc3ab6df216e5887659855` —
> **byte-identical to the key this table already recorded as verified** from other files, where it reads
> `remote: true`. Same component, opposite side of the library boundary.
> **This inversion was made and caught during this pass** — it had labelled `header_basic` / `quickmenu_basic` /
> `nds_icon_header` "do NOT import", i.e. the three most-used masters in the system. **Judge tier by structure and
> publish state, never by the `remote` flag alone.**
>
> All keys below are **full 40-hex** and **`unverified`** (read-only session — `importComponentSetByKeyAsync`
> throws there). Per-page notes hold the **complete** variant-COMPONENT key tables; only SET keys are listed here.
>
> ## ⭐⭐ NDS_Library SUBSCRIBES TO ITSELF — this explains most "duplicate key" findings in this domain
>
> **Verified 2026-07-16 via `get_libraries({fileKey: "72zrHgMLM4zhCjgSuTf7cC"})`: `NDS_Library`
> (`lk-e6bea415…`) appears in its own `libraries_added_to_file`.**
>
> **Consequence: a component can exist here TWICE** — the live local master (`remote: false`) **and a stale
> re-import of its own earlier publish (`remote: true`)**. Those pairs are **not rival designs**; they are a master
> and its own superseded snapshot. Much of what this domain has logged as "N distinct keys for one name" is
> **version lag, not disagreement.** Classification table:
>
> | Observed | Means | Import? |
> |---|---|---|
> | `remote: false` + key in publish index | **MASTER** | ✅ **this one** |
> | `remote: false` + key absent from index | Local unpublished — WIP | ❌ |
> | `remote: true` + key absent from index | **Stale self-import** — superseded snapshot | ❌ |
> | `remote: true` + traced to another library | Genuine cross-library import | ⚠️ scope it |
>
> **Worked example — `nds_icon_header`, and it runs opposite to the intuitive reading.** Master `19619c9f1fd2e3c2e6515542d0484e651f3f30c6`
> (`Type/Color/Darkmode`, index 2026-06-19) vs `94ffbc72589e16b24dcaf3532c11b141e6195bf8` (`Type/Color`, no dark). The 2-axis one is **not** a
> foreign library's reduced version — it is a **pre-Darkmode snapshot of this same component** (index shows the
> lineage `e40b494d13e6cab0e5cc2c8b5db57b2e5ac94243` 2024-01-12 → the master above, 2026-06-19). **No other subscribed library ships an
> `nds_icon_header` at all**; M.web's equivalent is `ndsw_icon_header` `1e4f301bff2b205d1076239009529a1ef13a2109`
> — different name (`ndsw` = web prefix), different key. **The master GAINED the axis; the import predates it.**
>
> **Same shape:** `Subpage_top` is **NDS_Templates'**, and currently ships as **ONE** set
> `d6ad46694b936bf545c099efa3d0a538f91696e4` (2025-10-29) — so `a64d3559986500518141a81b4a6dfce6a29c6ff4` / `4aee11466d7a115bc3da7c400f20a3b527903fff` are two **stale snapshots**,
> and you almost certainly *can* swap 1-btn↔2-btn via `Type` on the live set. **This page pins two different stale
> snapshots of another library's component**, which is very likely what a 68px height discrepancy (200 vs 268) was
> really showing. `sectionbar` and `nds_icon_arrow` collapse the same way.
>
> **Publish-index method + its honest limit:** `search_design_system` **absence is strong but NOT proof** — it
> returns a ranked, bounded set. "Absent from the index" means a targeted name query returned the master *and*
> same-name records *and* fuzzy hits, **but not that key**. **`importComponentSetByKeyAsync` in a write-capable
> session is the definitive test** — masters resolve, dead snapshots throw.
>
> Confirmed masters (key ✓ in the publish index): `statusbar` `e453babe03efec7dabe6c99a8db8d6a46eebac58`
> (2026-04-09) · `nds_icon_header` `19619c9f1fd2e3c2e6515542d0484e651f3f30c6` (2026-06-19) · `header_basic`
> `c95043e94317fde7230298017f42dd8099e1cbdc` (2026-04-07). `statusbar`'s index key is **byte-identical to its local
> `remote: false` key** — a second independent confirmation of the `header_stock` proof above.
>
> ⚠️ **`00_컬러팔레트_라이브러리용` is subscribed TWICE**, under two different library keys (`lk-7cb0b84c…`,
> `lk-6113fc02…`) — verified in the same call. Likely a colour-domain issue; logged, not chased.

| Component | SET key | Variant axes | Note |
|---|---|---|---|
| `header_basic` (BASIC) | `c95043e94317fde7230298017f42dd8099e1cbdc` | Channel(NM, N2, clear 밝은배경, clear 어두운배경) × Left Icon × Right Icon | ⛔ nests broken `header_title_txt` |
| `header_basic` (OPTIONAL) | `07fb2e569ac9d8cd9e31b49cf8770209df58c089` | Channel(NM, N2) × Type(버튼, 아이콘 1개, 아이콘 2개) | **⚠️ NOT previously in Core.** Same name, real 2nd set. ⛔ same nested defect |
| `header_title_txt` | `3adbf2e221ffa7d8421e52a8e1b6cb51b0bb7e47` | ⛔ **UNREADABLE — the broken one** | duplicate variant `2depth 메뉴표시=off, 어두운배경=off` |
| `header_stock` | `28c77263cb49ee32b6dc3ab6df216e5887659855` | Channel × country(국내/해외) × Type(현재가/주문/차트) | ✅ clean deps, **usable today** |
| `header_order_switcher` | `201081a13664d076948028592c941252b1083a35` | Channel × Type(일반/소수점) | default state unspecified |
| `tit` | `c8f9c55cd64cbb8cd3101d64028c075079053a61` | **`\bLine`**(1줄, `\b`2줄) | ⚠️ U+0008 in axis + value |
| `quickmenu_basic` | `9c5dd3cd3e714255914cf288f442fad7c3ac76dd` | Channel × Type(normal, pressed, **Easy**) | see correction below |
| `quickmenu_allmenu` | `306256ff8cf9f31da5c059d6c1237d6ffe36c095` | Type(login/logout) | |
| `quickmenu_ticker` | `04062068328db463acde622df2d88d51ba3063aa` | Type(매매동향/환율/news) | |
| `quickmenu_nmpick` | `ffbda22a2ba9199d3c7b16937c585fbf7c9c27b8` | Type(today/levelup/pick/membership) | |
| `nds_icon_header` | `19619c9f1fd2e3c2e6515542d0484e651f3f30c6` | Type(**37 values**) × Color(2, 6) × Darkmode | ✅ **81 variants — corroborated exactly.** `Color` is a ColorNumber: NM→2, N2→6 |
| `nds_illust` | `0ec614d9667c2ae11fd9887cc3aa571c85546dca` | `NM/N2`(on/off) × No(nds_illust01…140) | **280 variants, no gaps.** Axis is semantically broken — "which channel is `on`?" is unanswerable |
| `nds_flag` | `d81573482ffbff1e5076384753d483a3072d775f` | Type(Circle/Square) × Country(28) | codes are **ISO-4217 currency codes** despite the `(국가코드)` caption |
| `nds_icon_arrow` | `dde648604e4d08cc6b99c44dda81ec73ccbb4b15` | Color × Type × Height | |
| `nds_icon_step` | `be9d70861f0510a5ea083d0c20360aafae7f4c56` | Channel × Step(01–07/next01–07/pre) | |
| `nds_icon_bullet` | `eb1ab3ac46e5e6e5c1c6539e7334ac2b3e922e4f` | ⛔ **THROWS** | variants `25 global`/`26 chatbot` lack the `Type=` prefix. `ms_btn_memo` fails identically |
| `radio_basic` | `91f58f3a086c5ef03ac03c8d77a725d32b3f7a1f` | Channel(NM/QV) × Status(normal/selected/disabled/disabled-selected) | ✅ **SIGHTED 2026-07-16 — resolves `#radio-keys-never-sighted`.** Matches Core exactly |
| `radio_btn` | `1a972d991cc7c8f8f97bc5557740fba58ca82f23` | Height(h46/h60) × Active(off/on/disabled) | ✅ **SIGHTED.** No Channel axis |
| `searchbar_basic` | `755deb62dc296ad41135fb0147e814de64cb7e08` | Type(left-line/left-solid/right-solid) × **Status(normal/pressed/filled)** | **3 states — corroborates ⛔ `#search-bar-states`** |
| `searchbar_filter` | `0ca00d45253ed2384c2cce8e681af9eda793c502` | Type(line/no line/round) × **Status(normal/pressed/filled)** | 3 states |
| `guide_parent` | `965da57e41718e449483f3e85afe510b30695d3b` | **KIND: standalone COMPONENT — no set** | ⚠️ **use `importComponentByKeyAsync`.** Distinct from `Component 1` |
| `Component 1` | `63dad438b76acef52f178928763cb34708cc377e` | Property 1 (22 variants) | typos are **real string values**: `=Lable` [sic], `= Full Popup` [sic, leading space], `=Variant20` |
| `list_icon` | `d15c808ac3325366f72303f3d20929dfadd05799` | ⛔ **THROWS** | dup variant `Type=인포그래픽, Line=multi, Margin=30, Arrow=off` (`81858:762`) |
| `nds_img_tab_gradation` | `3b21c3c00f45d9d1b58527c1a04ea64dde00daa1` | ⛔ **THROWS** | dup variant `Type=nds_img_tab_gradation01` |

**Tab / Button / Input / View / Indicator SET keys** are extensive; full tables live in the per-page notes
(`nds-lib-tab.md`, `nds-lib-box-button.md`, `nds-lib-controls.md`, `nds-lib-text-field.md`, `nds-lib-pulldown.md`,
`nds-lib-account-controller.md`, `nds-lib-card.md`, `nds-lib-list.md`, `nds-lib-chart.md`, `nds-lib-indicators.md`,
`nds-lib-label.md`, `nds-lib-number-keypad.md`, `nds-lib-security-keypad.md`, `nds-lib-icons.md`). Use `INDEX.md`.

**`quickmenu_basic` — CORRECTED 2026-07-16. The old "5 icons + hamburger" description is wrong twice:**
1. **The 5 are TEXT labels, not icons** — `icon_hamburger` is the only icon. Labels verbatim: `홈`, `관심\n그룹`,
   `주식\n현재가`, `국내주식\n주문`, `국내주식\n잔고/손익`. There is also a **6th trailing slot** (`icon_영역` GROUP)
   the old description omitted.
2. **`Type` has a third value `Easy`** (간편홈) — it **hides the hamburger** (`visible: false`) and swaps both end
   caps, exposing menu items present in no other variant. **"hamburger + 5" does not describe `Easy` at all.**
   Also `Type=pressed` is **532px tall** — it is the expanded overlay, **not** a button-press state.

### NDS_CI — the 8 default/fallback CI sets (added 2026-07-16)

> **These are the ONLY importable components in NDS_CI**, and they exist *because* the CDN can 404 — the
> `MTS 종목 로고 노출 정책` renders 디폴트 CI on a miss. Every actual logo is a CDN filename, not a component.
> All `remote: false` = **local masters** (this is their home file). All `unverified` (read-only session).
> **All 8 read `variantGroupProperties` cleanly — zero `Component set has existing errors`**, so the
> duplicate-variant diagnostic does not fire here (contrast NDS_Library's 7 throwing sets).

| Set | SET key | Variants | Axes |
|---|---|---|---|
| `ss_img_ci` | `1e5ac724199f6a6910c9c7de5a0d8c8e3f1591fc` | 10 | `Property 1=[bond\|dls\|els\|foreign\|fund\|mmw\|option\|rp\|trust\|ima]` |
| `ss_img_ci_etc` | `f3a7b6ed87a9914c0dca2f1f87d2c77cd9164dc4` | 9 | `Country=[usd(미국)\|aus\|chn\|deu\|gbr\|hkg\|idn\|jpn\|vnm]` ⚠ see `LEDGER#ci-usd-usa-contradiction` |
| `ss_img_ci_etc` | `6df9754dd059b28f1944788478c8084590ca4820` | 4 | `Property 1=[etc\|kor_etc\|oversea_etc\|research_etc]` ⚠ 3-way name fork |
| `ss_img_ci_etc` | `b4665cca504f745b79265bd96065cb79067088ba` | 3 | `Property 1=[ksp\|ksq\|knx]` ⚠ 3-way name fork |
| **`ss_img_ci_etf`** | **`e1782bf94b991624a579f9c58c156277fd95080e`** | 3 | `Property 1=[kr\|us\|global]` — ✅ **the visible one. USE THIS.** |
| `ss_img_ci_etf` | `b2862b1a740d8f3864c8003c98cbc5192324f566` | 2 | `Property 1=[kr\|global]` — ⛔ **occluded, no `us`.** `LEDGER#ci-etf-occluded-duplicate` |
| `ss_img_ci_etn` | `5b7982db65feff2bf690c64d1ad7029ba4017d45` | 2 | `Property 1=[kr\|global]` |
| `noimage_initials` | `52de7493c27ff680a71ac3097bd0e373ef0dea0f` | 2 | `Property 1=[English\|Korean]` |

**CI production rules — verbatim** (guide `2581:324`, stamped `Last update  2024.02.27 Moana` [sic, double space]):
`기본적으로 유색배경으로 제작합니다.` · `심볼은 벡터형식으로 제작하나, 불가피 할시 이미지로 넣습니다.` ·
`흰색배경으로 제작해야할 시 라인은 017 컬러코드 2pt 두께입니다.` ·
`기존 제작되어 있는 이미지 크기와 상관없이  앞으로 제작되는 사이즈는 200x200 1배수 제작합니다.` [sic, double space] ·
`200x200 1배수로 추출합니다. (Tiny PNG 필수!!!)` ·
`이미지명을 프레임명으로 제작하며, 그룹 네이밍을 기관 및 종목 명칭으로 적용합니다.`
**Layer-stack contract:** `<filename> / <종목·기관명> / symbol / Ellipse` — e.g. `ss_img_ci_017860` / `DS단석`.
**`017` 컬러코드 ⇒ `#E0E0E0` @ 2pt** — ⚠️ **measured from two exemplars, NOT stated at source.** Confirm against
the colour-token table before treating as canon.
**Initials:** `글자 : Pretendard, Semibold, #FFFFFF, 20px(40x40 기준)` · `배경 : #333333` · `align center 상하좌우.`
⚠️ **`Semibold` (one word, source) ≠ Figma's `"Semi Bold"` (two words) — `loadFontAsync` throws if you pass it
through.** ⚠️ **How 20px scales to the 200×200 canvas is blank at source — do not infer 100px.**

**⭐ Clear-space spec — the file's only one, and it has ZERO words** (guide `2585:336`, `scale guide`).
Recovered from child geometry after `get_metadata` reported the frame **empty** (Gotcha 17). Canvas 200×200:
guide squares `168/120/72`; three `#FF0000`@10% safe-area tints → **square symbol ≤ `104×104`** · **portrait ≤
`88w×120h`** · **landscape ≤ `120w×88h`**. **⇒ at 200×200 a symbol never exceeds 120px on its long axis, and never
104px if square.** The union is a plus/cross envelope — corners always clear, keeping the mark optically inside the
circle. ⚠️ **"max bounds" is a reading of an unlabelled diagram** — natural given the three-aspect structure, but no
text confirms it.

**Naming grammar — per-asset-class. There is NO single `ss_img_ci_*` rule:**
| class | pattern | exemplar | size |
|---|---|---|---|
| 국내주식 | `ss_img_ci_종목코드(숫자).png` | — | 200×200 |
| 해외주식 | `ss_img_ci_국가티커(알파벳).png` | `ss_img_ci_usaaapl` (= `usa`+`aapl`, **no separator**) | 200×200 |
| 은행/증권/기관 | `ss_img_company_숫자.png` | `ss_img_company_002` (3-digit, zero-padded) | 200×200 |
| 마이데이터 · 간편인증기관 · 공공기관 | **bare `기관코드.png`, no prefix** | `zyaaqh0000` / `PBAAVN0000` ⚠ case inconsistent | 200×200 |
| 펌뱅킹 | `ss_img_bank숫자.png` | `ss_img_bank06` | **180×87** ⚠ |
| 언론사 | `ss_img_press숫자.png` | `ss_img_press01` | **200×80** ⚠ |
| 자문사 | **`자문사코드.png`** ⚠ breaks the file's own `ss_img_` convention | `FAA07` | — |
⚠️ **펌뱅킹/언론사 contradict rule 4's `200x200`** — both are transparent-ground **wordmark lockups with no
circle/disc**, a class the 제작방법 never mentions, sitting under 📌 샘플 as go-forward exemplars. Unresolved.
⚠️ **Export: CI badges ship at x2** (50×50 → 100×100), enforced by 32,747 export settings — **not** by prose, and
**not** a domain-wide rule. See `LEDGER#ci-export-multiplier-x2`.
⚠️ **No do/don't section exists** — rules are stated positively only. **The absence is the finding.**

### Sampled tokens (fonts/colors observed on real component instances)

Because NDS_Colors style names are non-semantic numeric codes, prefer sampling actual fills/text colors off existing component instances (see `figma-use` for the sampling script pattern: create instance → `findAllWithCriteria` → read `fills`/`fontName`/`fontSize` → remove instance) over guessing a style name. Values confirmed 2026-07:

- Brand primary green (NM channel button fill): `rgb(0.518, 0.757, 0.239)` ≈ `#84C13D`
- Body ink: `rgb(0.2, 0.2, 0.2)` = `#333333`
- Muted secondary text (labels, switcher text): `rgb(0.341, 0.376, 0.416)` ≈ `#576078`
- White surface: `#FFFFFF`
- Headers/buttons font: `NanumBarunGothic` (`Bold` for titles/CTAs, `Regular` for body use in headers)
- ~~Labels/body font: `Pretendard` (`Regular`, `SemiBold`)~~ → **corrected 2026-07-16 from NDS_Library itself.**
  **Labels/body in NDS_Library are `NanumBarunGothic`, not Pretendard.** Two independent lines of evidence from
  the library file (`72zrHgMLM4zhCjgSuTf7cC`):
  1. Its **Typography page defines 36 local text styles — zero Pretendard.** All are `NanumBarunGothic` or
     `Roboto`, and `Label/Nanum/R/15` + `Label/Nanum/B/15` exist explicitly. (`nds-lib-typography.md`)
  2. A **`fontName` census of real instances** on the Header page: `NanumBarunGothic Regular` ×66,
     `NanumBarunGothic Bold` ×15, `Roboto Medium` ×14, `Roboto Regular` ×9, `Roboto Bold` ×5 — every component
     label is NanumBarunGothic; doc prose is Roboto. Tab page: zero Pretendard. (`nds-lib-top-navigation.md`)
  **Nuance — "zero Pretendard in the library" is too strong, don't overcorrect:** `Pretendard SemiBold` ×4 does
  ship, as the raw font on `" 통합"` inside **`nds_img_market_switcher`**, nested in `header_stock`. That is real
  published component content, not an annotation. (2 further `Pretendard Regular` hits are designer sticky-note
  `Comment` nodes — discard those.) **Precise rule: Nanum for labels/body; Pretendard survives only as a raw font
  in ≥1 published asset, never as a style.**
  *Why the old claim existed:* it was sampled from **rendered instances**, not from styles — a legitimate method
  that happened to land on the one Pretendard asset. **`NDS_M.web` genuinely does use Pretendard** (different
  platform, different file, `uVcmG6GgOl2J8EOlc22wob`) — that row in the Libraries table above is still correct.
  Scope the font to the file you are building against.
- Account-row title font: `Roboto Medium` (as used inside `popup_radio_account`)
- `popup_radio_account` corner radius: 16px. Bottom CTA buttons: 0 radius (square, full-bleed).

### `header_basic` — ROOT CAUSE FOUND 2026-07-16. It is not broken, and it is not deprecated.

**The defect is one component upstream.** `header_basic` reads `key`/`remote`/`variantGroupProperties` cleanly and
has no duplicate variants of its own. The error cascades from a **nested dependency**: **`header_title_txt`**
(`9864:16724`) declares **two variants with the identical combo** `2depth 메뉴표시=off, 어두운배경=off`
(`9864:16725` and `50853:16826`). Reading its axes throws `Component set has existing errors`; reading a child's
`variantProperties` throws `Component set for node has existing errors` — **the exact string recorded above**.

Proof by nesting (verified twice independently, orchestrator + subagent):

| Set | node | nests `header_title_txt` | instancing |
|---|---|---|---|
| `header_basic` BASIC | `8901:13953` | ×12 | ⛔ throws |
| `header_basic` OPTIONAL | `8901:13980` | ×6 | ⛔ throws |
| `header_stock` | `8901:13894` | **×0** | ✅ works |

That reproduces the observed pattern exactly with no appeal to deprecation. **Zero on-canvas evidence of
`header_basic` being broken/deprecated/superseded** — it renders normally under the heading "BASIC", no
strikethrough, no dimming, no marker. **The fix is to rename or delete one duplicate variant in
`header_title_txt`.** Re-keying would not help — the defect is upstream of the key. **Escalate to the designer;
this is a one-line fix that unblocks the most-used component in the system.** Until then, use the manual builder
below.

> ⭐ **Reusable diagnostic (audited across 27 sets, exact 1:1, zero exceptions):**
> **duplicate variant name ⇔ `Component set has existing errors`.** When a set throws, look for two children
> declaring the same variant combo. **Seven broken sets are known in NDS_Library** — addressed by node id, since
> their keys are unusable anyway: `header_title_txt` (`9864:16724`), `nds_img_tab_gradation` (`14449:15313`),
> `list_icon` (`50855:17337`), `input_line` dup (`45112:2329`), `NM` keypad (`12003:14703`), plus
> `nds_icon_bullet` and `ms_btn_memo` (variants missing the `Type=` prefix their siblings have).
> Full keys: `LEDGER#library-structural-defects`.
> **Guard every `variantGroupProperties` read with try/catch — a bulk sweep over this file crashes without it.**

### Workaround: manual header (while `header_title_txt` remains unfixed)

```js
const iconSet = await figma.importComponentSetByKeyAsync("19619c9f1fd2e3c2e6515542d0484e651f3f30c6");
const backIcon = iconSet.children.find(c => c.name === "Type=back, Color=2, Darkmode=false").createInstance();
const infoIcon = iconSet.children.find(c => c.name === "Type=info, Color=2, Darkmode=false").createInstance();
const header = figma.createAutoLayout("HORIZONTAL");
header.paddingLeft = 8; header.paddingRight = 12; header.paddingTop = 14; header.paddingBottom = 14;
header.itemSpacing = 8; header.counterAxisAlignItems = "CENTER";
header.appendChild(backIcon);
const title = figma.createText();
await figma.loadFontAsync({ family: "NanumBarunGothic", style: "Bold" });
title.fontName = { family: "NanumBarunGothic", style: "Bold" };
title.fontSize = 17;
title.characters = "화면 제목";
header.appendChild(title);
title.layoutSizingHorizontal = "FILL";
header.appendChild(infoIcon);
```

### Canvas width: build at 540px, not 375px

Every real NDS screen — every frame across NDS_Library, NDS_Templates, and the shipped `domestic-stock-rights` production file — uses a **540px-wide canvas** (`statusbar width="539.99..."`, `header_basic width="540"`, all screen frames `width="540"`), not the 375px iPhone-point convention. Components like `quickmenu_basic` and `유의사항_하단노출` have internal children with fixed pixel widths sized for a 540 canvas; forcing them into a 375-wide frame via `layoutSizingHorizontal = 'FILL'` does **not** shrink those internal children — it just clips them (looks like mangled/truncated Korean text at small screenshot scale, easy to misdiagnose as a font-rendering bug rather than real overflow). **Always build new NH MTS screens at 540px width** to match the system natively, especially any screen that will include app-shell components (`quickmenu_basic`, `유의사항_하단노출`, `header_stock`, etc.).

### Gotchas specific to this design system

1. **ROOT CAUSE FOUND 2026-07-16 — see the `header_basic` section above. The set is fine; its nested
   `header_title_txt` has two identically-named variants.** That also explains the "works here, throws there"
   inconsistency below: whether you hit the error depends on whether the operation resolves the broken nested
   dependency, not on the target file. **Diagnostic: duplicate variant name ⇔ set-has-errors (1:1 across 27 sets).**
   Original observation retained for history: **`header_basic` import succeeded on one attempt (this file, `mxm5Ml7RfFH9bEXrhWdKRy`), but failed with `"Component set for node has existing errors"` on another attempt in the same file.** Also confirmed working as a plain `createInstance()` when observed inside an existing production file (`domestic-stock-rights` project, fileKey `ZkwarjFkN8BiGolWO7PcwI` — title-as-dropdown variant instanced fine there). So the break is not universal to the component — likely a specific corrupted variant or transient import-cache issue in a specific target file. **Don't assume it's broken — try it first**, and only fall back to the manual-header workaround below if the specific file/variant actually errors.
2. **`popup_radio_account` breaks when resized narrow.** It's built for a single full-width row in a vertical list (account picker / bottom sheet), not a side-by-side card. Stack rows vertically at full width (≥330px).
3. **`radio_basic` / `check_icon_*` are bare glyphs with no label slot.** Always pair them with your own text node in a wrapping auto-layout frame if you need a labeled option or list row.
4. **Color style names in NDS_Colors/NDS_Darkmode Colors are opaque numeric codes** (`NM/Primary/270.274` etc.) with no changelog describing which is "the" brand green. Sampling real instances is faster and more reliable than guessing from the name list — see Sampled tokens above. **Partially superseded 2026-07-15**: `projects/nds-mweb-colors.md` decodes this naming scheme — the `NM`/`QV` channel prefix, the `ESS` (Essential) tier, and semantic Korean suffixes (e.g. `NM/ESS/primary/2.022(대표컬러)` = `#84C13D`, `QV` counterpart `#FFAA1A`; `NM/ESS/line/2.017(박스테두리)` = `#E0E0E0`). Read that file before falling back to sampling. Caveats: it was learned from the **M.web** file, so confirm a style resolves the same way on the app side before relying on it there; and duplicate codes for the same hex do exist across paths (`NM/Line/137.017` vs `NM/ESS/line/2.017`, both `#E0E0E0`; `NAMUH/Others/129.001` vs `NM/ESS/others/1.238` for up/down) — unreconciled.
5. **Several component NAMES map to more than one published key — and two different causes are now distinguished (added 2026-07-15).**
   **(a) Reporting artefact, NOT a real conflict — proven.** A COMPONENT_SET and each of its variant COMPONENTs carry *different* keys; `importComponentSetByKeyAsync` needs the **SET** key. `Topbar_Dropdown` demonstrated this concretely: NDS_Templates `3760:33077` reports COMPONENT `69e7ffd43cdf9888ae6fc9bbedff3627fe504e6d` **with parent SET `ce701f7c5eda23073d17bd862838e75f191b0a96`** — the same two keys two earlier agents had reported as a M.web-vs-Templates *conflict*. Same component. **Always report which kind you read.**
   **(b) Genuine collision — real.** `header_basic` `c95043e94317fde7230298017f42dd8099e1cbdc` (Core, corroborated 4×, `remote: true`, 18/19 instances) coexists with a second, genuinely different, also-`remote: true` SET `07fb2e569ac9d8cd9e31b49cf8770209df58c089` (마이데이터, NDS_Templates `32762:3302`). `statusbar` is worse: **≥5 distinct keys** across `3:158`, `3760:33077`, `9665:20994` (incl. SET `fe57c685f5a27a53c49fc56c9999456340140c2f`). And `btn_bottom_page` `accfb243ce752fd894af2b6db081b1074022a39d` is a **different component** from `btn_bottom_page_assets` `0fc4758ec4ab4c83ad6052748c3dabf76d0542e8` despite the near-identical name.
   **(c) Same name, different NODE KIND — added 2026-07-15.** `국내주식 주문 공통` is a **remote INSTANCE** (`057e29c977538fefecae14a2d970b6f87c7995d2`) on NDS_Templates `42129:7390`, but a **local FRAME with no key at all** on `31836:5060`. Not a key conflict — one of them isn't a component. Same for `guide_tooltip`, which is a real published SET (`80538a1c120ffbe7e5fbe22f02d127273efa92db`) yet appears **hand-composed as a plain FRAME** on both `13604:20760` and `19746:6495`. **Before comparing keys, confirm the node is even an INSTANCE.**
   **Consequence:** never resolve one of these names by key alone. Read the SET key, confirm `remote`, and expect more than one legitimate answer. None are live-testable right now — `importComponentSetByKeyAsync` throws in a read-only session.
6. **NDS has dense static specs but systematically blank TIME/INTERACTION rules — treat this as a known shape of the system, not a per-page oversight (added 2026-07-15).** Confirmed across three files and many pages:
   - `nds-ux-guide-nudge`: toast `최대 글자수` is literally marked **`논의`** (under discussion) and snackbar `지속 시간` is **empty** — **still unresolved after checking NDS_M.web's Dialog page AND NDS_Templates' Alarm page** (the latter isn't even the same UI category — it's outbound 알림톡/푸시).
   - Tooltip/coach-mark **trigger / dismiss / timing / anchor / sequencing / once-per-user** rules: **absent in all three of** `nds-tpl-tooltip`, `nds-mweb-tooltip`, `nds-tpl-coach-mark` — thrice-confirmed.
   - `nds-tpl-loading`: **no duration or threshold** anywhere; the only spec is the Lottie asset's 40×40px size.
   - `nds-tpl-banner`: **no rotation timing, no max count, no dismissibility** stated.
   **Consequence for BUILD:** when a timing/interaction value is needed, it is almost certainly NOT in Figma. Escalate to a designer. **Do not infer one from a mockup, and do not treat a static screenshot as evidence of motion.**
7. **`NDS_Templates` is a component GALLERY, not a rules source (added 2026-07-15).** Every page learned so far *shows* without *stating*: Chart, Banner, Loading, Thumbnail, Coach mark, Tab, Card, List, Indicators and Tooltip all returned **zero prose usage rules**. The rules live in **NDS_UX Guide**; Templates is where you confirm a component **exists, is published, and how it's composed**. Two consequences: (a) a page name here does **not** guarantee a component (Chart's "Gauge"/"Line Chart" headers have none; Controls' "switch" doesn't exist); (b) where the guide and this library disagree — e.g. `searchbar_basic` ships 3 states where `nds-ux-guide-search` demands 4, and offers no 탐색형 at all — **the library, not the guide, is what a BUILD pass is actually limited by.** Escalate those gaps rather than pretending the rule is satisfiable.
   **Two real exceptions found (2026-07-15), both narrow:** `22330:559` **GA4 Tagging** is a genuine spec — a fillable `{서비스명} GA태깅 신청서` form — but it still teaches by 20 worked rows rather than prose (`{동작/맥락}_{동적값}`), and reads as a **per-project (큰손픽) artifact, not a company taxonomy**. `45212:559` **아티클** is stronger: a spec panel **declares** a type ramp (title 30pt Bold / body 24pt Medium / sub 21pt Medium) — though **no line-height and no font family**, and it also carries the file's only real changelog stamps (`Last update 2026.05.26 이영록`), refuting the assumption that this file has none.
   **`📱Sample Page` does NOT mean "flow" — settled 2026-07-15 (3 independent probes, zero links each).** `42129:7390` 매매 주문 확인 (3 artifacts), `29065:55508` 안내페이지 (3 artifacts, `.reactions` checked on all), `31836:5060` 매수방법 선택 (5 artifacts, full reactions sweep — the page's only 2 reactions are an internal variant swap). **Both halves of the order journey are refuted**, and the 매수방법선택→매매주문확인 sequence **exists nowhere structurally — only implied by page names.** The group means *composed full-screen template galleries*.
8. **The UX-writing guides are systematically NOT followed by this library — verify copy against the library, never assume the guide holds (added 2026-07-15).** Three independent drifts, each with a different shape:
   - **`nds-ux-guide-completion-popup`: 8 of 8 failure headlines use the explicitly BANNED `실패했어요`** (`302:12285`); the mandated `…이/가 완료되지 않았어요` appears **zero** times. **100% violation — no compliant subset exists.** Yet the same page's success headlines are **9/9 clean** (all contain `완료`, all active voice). **Half the rule is followed, half is inverted.** A 3rd unprescribed form also exists: `일부 계좌 신청을 완료하지 못했어요`.
   - **`nds-ux-guide-empty-state`: 3 of 7 no-data screens use the redlined `-습니다`** (`16357:507`) — and the 3 are **exactly the screens on the older `상단안내영역03` shell**. Correlated with template age, not scattered typos. The shipped `국내주식권리` production file drifts the same way (`조회 내역이 없습니다.`), so **the guide is contradicted by both the library and production.**
   - **`9665:19604` 자주하는질문 labels its own non-compliance**, holding a `가이드 미반영` composition (legacy right-chevron, navigates away) beside a `NDS가이드 반영` one (accordion).
   **Counter-example, so this is not "the library always drifts":** `23083:4390` Share corroborates `nds-ux-guide-share` **word-for-word**, including the exact 카카오톡 → 링크 복사 → 더보기 order, and links back to that guide. **It varies by page. Check, don't assume — in either direction.**
9. Multiple plans exist on this account (`whoami`) — for NH-internal work the right org is usually **NHIS Digital Platform** (`organization::1445250327526291914`), not the personal `chunsung's team` plan.
10. **⭐ INVISIBILITY HAS FOUR MECHANISMS IN THIS SYSTEM, NOT ONE. `get_metadata` and layer-name walks miss all four — RENDER EVERY RULE-BEARING FRAME (added 2026-07-16, NDS_Library).** The domain previously knew only `hidden="true"`. Each of these was caught *only* by screenshotting, and each one silently corrupted a conclusion before it was caught:
    - **(a) Fill matching background.** `제작중` on the Graphic-asset Nmoji card reports `visible: true` but is **white text on a white card**. Reading it literally would have flagged Nmoji ⛔ **and blocked a BUILD pass from 152 shipped nmoji components.** Two `Last update` stamps are likewise **dark-on-dark** and missed a full-text grep of the dump.
    - **(b) `STRIKETHROUGH` on a text segment.** Popup `5913:11448` extracts as `레이어 팝업은 [최대 높이 850/ 최소 높이 230]`, but `최대 높이 850` is its own **`STRIKETHROUGH` segment** (verified via `getStyledTextSegments(['textDecoration'])`, not eyeballed). **A text-only read reports a retired value as live.** No replacement is given → layer-popup max height is **unresolved at source**. *Distinct from "rules live in images": the rule IS live text; its **styling** carries the negation.* **Add `textDecoration` to the read checklist.**
    - **(c) `opacity: 0.30` on a whole section.** `tab_2depth_txt` (`3683:15217`) is dimmed to 30% while its siblings sit at 1.0 — likely soft-deprecation, **no confirming text on canvas**. Evidence, not verdict; confirm with a designer. Same mechanism greys out the ~126 non-Lottie infographics.
    - **(d) `hidden="true"`** (already known) — renders as a blank 1×1 PNG. Never quote such a node's text-node names as rules.
    **Corollary:** for NDS_Library the operative warning is **not** "rules live inside pasted screenshots" — 4 of 5 graphics pages had *zero* image-embedded rules. It is **"rules live in styling and position, so render anyway."** (Image-embedded rules do still exist elsewhere: 9-patch's whole stretch/padding diagram is a 2018 raster; Number Keypad's every measurement is an annotation overlay; Security Keypad's tablet spec is camera-roll photos.)
11. **⭐ U+0008 (`\b`) CONTROL CHARACTERS ARE BAKED INTO REAL, SHIPPED NAMES — CONFIRMED FILE-WIDE ACROSS 6 INDEPENDENT BATCHES (added 2026-07-16).** Not just layer names (the known `\x08title`) — **variant axis names, axis values, component names, style names, and even a page name.** They are **invisible in the Figma UI and in screenshots**, and `setProperties({Height: …})` / `variantName === 'Type=password'` **fail silently or with a baffling error**. Confirmed instances: axis `"\bLine"` + value `"\b2줄"` (`tit`) · `"\bHeight"` (`btn_container_except_stockplus`) · `"\bFold"` (`card_accordion_center` — **while its sibling `card_accordion_right` has a clean `Fold`**, so identical-looking code works on one and throws on the other) · `"Type\b"` (`card_guide`) · `"\bSelect"` (`financial_boxlist_nm`) · `"\bType"` (chart gauge) · `"\bValue"` (`nds_img_switcher`) · `Type=\bessential` (`input_label`) · `Type=\b레이블표시` (`account_apply`) · `\bms_btn_calendar` · `nds_icon_menu`'s `\bexchange` · style names `Notice/\bRoboto/R/19` and `…/B/19` · `Type=␈number_ios` / `␈password` (`keyboard`) · **the page name ` 📖 \bJustify___…`**.
    **Rule: read axis names/values off the API byte-for-byte and match by key. NEVER hand-type a name from a screenshot or from this document.**
12. **`N2` vs `QV` — two spellings, one role, NOT proven identical. Do not merge; do not string-match one and assume you caught both (added 2026-07-16).** Both occupy the dark channel opposite a light `NM`, and **`Channel=[NM|N2]` and `Channel=[NM|QV]` never co-occur on one axis**, so no direct test exists in most families. **Evidence FOR equivalence (strongest available):** on the Tooltip page a variant named `Type=QV` **renders on-canvas as `N2 툴팁 타이틀`**. **Evidence AGAINST a naive merge:** measured fills differ — `N2` header self-fill `#0E2A3F` vs `QV` tab pill `#0E1A49`. Close but distinct navies (may just be different families using different tokens). `nds_img_market_switcher` even ships `Channel=[NM|N2|ALL]`. **Consequence: a build filtering on `"QV"` silently skips every `N2` component, and vice versa. Enumerate the axis, don't assume its vocabulary.**
    ⚠️ **`QV` in NDS_Library is dark navy `#0E1A49` — NOT orange.** `nds-mweb-colors` records `QV/ESS/primary/2.022(대표컬러)` = `#FFAA1A`, but that is **NDS_M.web, a different file/platform**. **Do not carry "QV = orange" into NDS_Library work.** (Notable: NM's tab pill `#2C363B` *is* exactly M.web's `NM/ESS/grayscale/1.296(홈상단배경)` — so those ColorNumbers do reach this file, which makes the QV divergence more interesting, not less.)
13. **Names are not identifiers in this file, and counts in headings are stale. Resolve by key/node-id; count with `.length` (added 2026-07-16).**
    - **Name collisions with genuinely different keys**: `header_basic` ×2 · `tab_btn` **×3** (3 axis signatures) · `Line_chart01` **×3** · `statusbar` ×4 · `label_risk` ×2 · `input_line` ×2 (one broken) · `toggle_text46` ×2 (different axes) · `Subpage_top` ×2 (separate SETs — you **cannot** swap 1-btn↔2-btn via a property) · `line_section` ×2 · `nds_icon_mic`, `nds_icon_arrowred`, `bank` (**incompatible axis vocabularies — a real fork**), `rate`, `nds_infographic138`.
    - **Stale heading counts — systemic, trust none of them**: `Nmoji: 142개` → **really 152** · `Emoji IMG : 80개` → **really 91 (89 distinct)** · `Infographic(전체DB) : 251개` → **really 253**.
    - **Numbering holes — iterating `01..N` will 404**: `nds_nmoji42` missing · `nds_infographic233` missing · `nds_infographic138` duplicated. (`nds_illust01–140` is the only clean sequence.)
14. **🔥 THE ICON 컬러넘버 LEGEND — decodes every `Color=N` axis across all 143 icon sets (added 2026-07-16).** Recovered by screenshot from Icons `9244:16154`; **its column semantics exist ONLY as spatial layout and are unreadable from node names.** Headed `🔥 필수 🔥 아이콘 쓰실 디자이너들! 확인하세요!`
    | Color | 컬러넘버 | hex | tier |
    |---|---|---|---|
    | **2** | `023` | `#333333` | 기본 |
    | **3** | `013` | `#666666` | 기본 |
    | **4** | `024` | `#999999` | 기본 |
    | **5** | `074` | `#C5C5C5` | 기본 |
    | **6** | `063` | `#FFFFFF` | 기본 |
    | **1** | `004` | `#000000` | 예외 |
    | **7** | `127` | `#DDDDDD` | 예외 |
    Rule, verbatim: `😈 최대한 이 안에서 사용하되, 추가적인 컬러가 필요하다면 디자인팀 내 논의를 통해 컬러를 추가도록 합시다.`
    **⚠️ `Color` is a ColorNumber, not a channel.** Measured binding on `nds_icon_header`: **NM→`Color=2`, N2→`Color=6`**. Mixing them is **silently wrong, not an error.**
    **Brand prohibition** (Icons `39114:271`, verbatim): `브랜드 로고의 메인 컬러는 Deep Blue 입니다. Deep Blue(#002A41)는 바탕색으로 사용하지 않습니다. 필요한 경우 Dark Blue(#064367) 를 대신 사용합니다.`
15. **⚖️ LICENCE CONSTRAINS OUTPUTS, NOT JUST READS (added 2026-07-16, NDS_Library Welcome page `3418:9189`, verbatim).** `해당 파일은 NH투자증권의 디자인 자산으로 상업적 이용 및 재배포를 엄격히 금지합니다. 복사하여 사용하거나 수정하는 행위는 사내 업무 용도로만 가능합니다. NH Design System의 모든 지식재산권은 NH투자증권 플랫폼혁신부에 있습니다.` **Practical read: NDS art/copy must not be republished outward** — commercial use and redistribution are prohibited; copy/modify is **사내 업무 용도로만**. 플랫폼혁신부 is also the team named by Justify's `UI 담당자와 협의` escalation path.
16. **The 5-colour component-maturity scheme on the blank working page is 원티드(Wanted)'s, NOT NH's — do NOT adopt it (added 2026-07-16).** 🔵 디자인&개발 배포 완료 / 🟢 디자인 그룹 내 배포 완료 / 🟡 테스트,피드백 받는중 / 🔴 아직 정규배포 안함 / ⚪ 그 외. It is a **screenshot of a conference talk** — the capture still shows a **YouTube scrubber at `15:29 / 20:24`**. No evidence NDS adopted it. **The most misquotable artifact in the file**, and only a screenshot caught it. Same page: the chart-page's pasted `스크린샷 2024-*` images are **Highcharts.com documentation**, not NDS rules — transcribing them would invent a palette NDS doesn't use.
17. **🚨 `get_metadata` SILENTLY OMITS CHILDREN — an "empty" result is NOT evidence of emptiness (added 2026-07-16, NDS_CI). This one undermines a method step, so read it before trusting any structure-only read.**
    **Proven:** `get_metadata(KmpaYeoYh41F6nyIKvBQ7h, "2585:336")` returns
    `<frame id="2585:336" name="scale guide" x="-3460" y="47" width="200" height="200" />` — **self-closing, zero
    children.** The Plugin API reports **14 children** on that same node. The omitted content is the **entire
    clear-space specification** — the only one in the file.
    **Why it matters beyond one frame:** `LEADER.md` Mode 1 step 3 says *"`get_metadata(nodeId)` — one call"*, and
    `figma-learn-all-pages` triage skips pages whose probe comes back empty. **That inference is unsound.** During
    the NDS_Library and NDS_CI passes, **5 pages were skipped on exactly this evidence** (`🎨 Foundation`,
    `🖼️ Components`, and NDS_CI's three `---`). **All 5 were re-checked against the Plugin API and were genuinely
    empty (`childCount: 0`) — so both coverage claims survived. But they survived by luck, not by method.**
    **✅ THE RULE: before skipping any page or frame as empty, confirm with the Plugin API, not `get_metadata`:**
    ```js
    const p = await figma.getNodeByIdAsync(PAGE_ID);
    await figma.setCurrentPageAsync(p);   // MUST load it first — children.length lies on non-current pages
    return { name: p.name, childCount: p.children.length };
    ```
    **Corollary — the failure compounds with Gotcha 10.** `get_metadata` cannot see opacity, `textDecoration`, fill
    colour, or instance overrides *and* may omit nodes outright. **A structure-only read is not a floor on what
    exists.** When a frame ought to hold a rule and `get_metadata` shows nothing, that is a **signal to render it**,
    not evidence of absence. `scale guide` is the worked example: no text, no metadata children, and the whole rule
    encoded in child coordinates.
18. **⭐ INVISIBILITY MECHANISM #6 — FULL OCCLUSION BY A SELF-NESTED DUPLICATE SECTION (added 2026-07-16, NDS_CI).**
    A `SECTION` named `디폴트 ETF` (`3867:7814`) sits **inside** an identically-named `SECTION` (`3867:7821`) at
    `x=0, y=0, 447×1045` — **exactly its parent's bounds**, hiding it completely. **Verified: same name, inner is a
    direct child of outer, identical dimensions.** `get_metadata` lists **both** sets; **the canvas renders only the
    inner one.** Someone duplicated the section to add a variant and buried the original instead of deleting it.
    **Consequence:** `ss_img_ci_etf` resolves to two live importable keys — inner
    `e1782bf94b991624a579f9c58c156277fd95080e` (`Property 1=[kr|us|global]`, **the visible one**) vs outer
    `b2862b1a740d8f3864c8003c98cbc5192324f566` (`Property 1=[kr|global]`, **occluded, no `us` variant**). A
    name→key lookup can silently pick the one **missing US ETF support**, and nothing on the canvas reveals it.
    **Import the inner/visible key `e1782bf94b991624a579f9c58c156277fd95080e`. Escalate the buried duplicate for
    deletion.** See `LEDGER#ci-etf-occluded-duplicate`.
19. **PREFIXES NAME THE CONSUMING SURFACE, NOT THE ENTITY TYPE — and a name is not a unique key (added 2026-07-16, NDS_CI).** `bank` ⊃ 우체국/새마을금고 · `press` ⊃ IR GO/씽크풀 · `FAA28` = 쿼터백**자산운용**. **Never infer what something IS from its prefix.** Worse, **the `ss_img_*` namespace has writers outside NDS_CI** — `press20` is claimed by 벤징가 (empty frame, no outlet mapped: **the slot looks free and is not**), and `FAA`/`OAR` codes are external and expanded nowhere. **NDS_CI is not the source of truth for its own filenames.** Two contradictory retirement conventions coexist **in one file**: 펌뱅킹 **preserves** (`히스토리 참고용` + an old wordmark hidden *inside* the live asset — **a bulk-unhide resurrects a retired bank CI**); 자문사 **deletes without trace**. `ss_img_bank10` is **one name across three nodes** (구버전/신규버전/live) disambiguated by **x-position only** → **2-in-3 chance a lookup returns a history exhibit**.
20. **`node.opacity` THROWS on `SLICE` nodes — wrap every opacity sweep in try/catch (added 2026-07-16, NDS_CI).** `no such property` on SLICE. Real cost: it killed an invisibility sweep mid-run (134 slices on one page, 7 on another). Since Gotcha 10 makes opacity sweeps mandatory, this trap is on the critical path. **Also: `node.screenshot()` is blocked read-only** (`Can't call "screenshot" in read-only mode`) — use the `get_screenshot` tool instead, and **`findAll(predicate)` deep traversal can trip the read-only guard where `findAllWithCriteria` succeeds** (verified: it unblocked a page a subagent had written off as unreadable). Some pages remain genuinely unreadable read-only regardless — **name the gap rather than implying a clean sweep.**
