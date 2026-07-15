---
name: nds-tpl-precautions
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=309-16791"
learned_date: 2026-07-15
sections_studied:
  - "309:16791 (canvas '    - 유의사항' — page root, loose frames, no wrapper section)"
  - "891:25682 (frame '유의사항_플로팅고정형' — Case 02 1줄, real instance of 유의사항_하단노출 Type=1줄)"
  - "891:25699 (frame '유의사항_플로팅고정형_두줄' — Case 02 2줄, on-canvas caption states max width verbatim)"
  - "309:16878 / 891:25189 / 891:25727 (frames '유의사항_일반' / '_심사필' / '_버튼추가' — Case 01 기본/심사필/버튼추가)"
  - "782:25889 (frame '유의사항_더보기_슬라이딩팝업' — Case 03 sliding, 3x 유의사항_Content_popup)"
  - "891:27444 (frame '유의사항_더보기_풀팝업' — Case 03 full, 2 con groups incl. 소제목 subsection)"
  - "2674:26555 (frame '발행어음매매_상세_유의사항' — real product screen consuming 유의사항_Content in a 원금손실 위험 block)"
  - "2683:26994 (frame '발행어음매매_리스트_유의사항_NM' — real product screen, 유의사항 block above a product-card list)"
  - "5573:17457 (frame '02_단기사채_상세정보' — uses 유의사항_pagetop instance, a variant not seen on sibling files)"
  - "8773:17180 (frame 'title' — page cover: '유의사항' / 'QV-NM Template Guide')"
  - "8773:17186 / 8773:17195 / 8773:17194 (section-header text nodes: '페이지 하단 유의사항' / '플로팅 고정 유의사항' / '호출 팝업' — same 3-group split as NDS_M.web)"
status: internal NDS_Templates page — full-page template compositions built on real NDS_Library components (file subscribes to NDS_Library; not a local doc copy)
---

# NDS Templates — 유의사항 (Precautions / Disclaimers)

Page `309:16791` in **NDS_Templates** (`1xE0qvn2yv3ZkQ9BwhKT1y`). Same three-group structure as `nds-mweb-precautions.md` (페이지 하단 유의사항 / 플로팅 고정 유의사항 / 호출 팝업, confirmed via identical verbatim section-header text nodes), but this file additionally shows the pattern **composed into real product screens** (발행어음 매매 상세/리스트, 해외선물옵션계좌 개설, 단기사채 상세) — something neither sibling file has.

## Layer-name convention — screenshot-confirmed for this page

Frame layer names here (`유의사항_플로팅고정형`, `유의사항_플로팅고정형_두줄`, `유의사항_일반_심사필`, `유의사항_더보기_슬라이딩팝업`, `유의사항_더보기_풀팝업`) **agree with their on-canvas content** in every frame screenshotted — the 두줄-suffixed frame shows exactly the two-line variant, the 심사필-suffixed frame shows the 심사필 first bullet. **Verdict: reliable** on this page — contrast the NDS_UX Guide, where every content frame is misleadingly named `index`.

## THE ANSWER — floating-bar 2-line text-box max width

Screenshot of `891:25699` (`유의사항_플로팅고정형_두줄`) shows the actual `유의사항_하단노출` (Type=2줄) instance with its **on-canvas caption text, verbatim**:

> "할 말이 많을 경우 최대 두 줄로 제한합니다. 텍스트박스 가로길이 최대 **428px**"

nodeId of the caption text: `2707:27147` (layer name `Contents`, inside frame `891:25699`).

**This corroborates `nds-ux-guide-precautions.md`'s 428px, not `nds-mweb-precautions.md`'s 286px.** Two of three independent readings (NDS_UX Guide app-rules doc + NDS_Templates real-library composition) now agree on 428px; only the M.web page — itself marked `(진행중)` in its own page name — states 286px. This is a stated on-canvas spec, not a bounding-box measurement: the caption text is the guide's own annotation, quoted directly, not inferred from frame dimensions. Does not fully resolve the M.web discrepancy (M.web is a distinct platform/file that could legitimately differ), but shifts the weight of evidence toward 428px being the more broadly-held number, with 286px looking more likely to be the M.web-specific or stale value.

## Component-key resolution — settles the M.web open question

Because this file **subscribes to NDS_Library** (per pre-loaded verdict), `getMainComponentAsync()` succeeds (session is not fully read-only for reads) and returns real keys with `remote: true`:

- **`유의사항_하단노출`** on-canvas instance (`891:25683`, variant `Type=1줄, 더보기=on`) → main component's parent COMPONENT_SET key = **`6ab304902264c6101f4a0a62927f79d08c1d5827`** — this is **byte-identical to the Core reference's key**. The 2줄 instance (`891:25700`, variant `Type=2줄, 더보기=on`) resolves to the **same set key**. This **confirms** the Core reference's `유의사항_하단노출` axes (`Type(1줄/2줄)` + `더보기(on/off)`) are the real, currently-live component — and settles the M.web note's "same component by convention, key-identity unconfirmed" question: yes, it is the same component (at least the same set key surfaces here; M.web's own instance still couldn't be checked because M.web's session was read-only, not because the identity is actually in doubt).
- **`유의사항_Content`** (`781:24327`) → set key `0b26360121994f0a841dc0208d50ca20c0bcaa50`, variant `Type=기본, 줄 개수=1줄` — confirms the `Type` × `줄 개수` axis naming M.web found (richer than the UX Guide describes), on a **different, resolvable key**. Not yet cross-checked against M.web's unresolved instance for key equality — flagged, not asserted.
- **`유의사항_Content_popup`** (`891:26775`) → set key `9448217e1879d57c134cfbc8a042d5be7d82d8b8`, variant `Type=심사필`.
- **`유의사항_Title`** (`781:24257`) → set key `59151dbe888eb21d90fc8497b7af037572e9bac1`, variant `더보기=off`.
- **`유의사항_pagetop`** (`5582:17695`, on `02_단기사채_상세정보`) → set key `12f007e35ee9414751e85aae8a4730111f4645f3`, variant `Channel=NM` — a **variant of the precautions family not seen on either sibling file** (page-top disclosure, distinct from the bottom-floating and Case-01-block forms).

## Tiers — COMPONENT vs COMPONENT_SET (`getMainComponentAsync().remote`)

Sampled 24 instances across the page (disclaimer components + surrounding chrome used in the real product-screen compositions: `statusbar`, `btn_bottom_page`, `Basic_btn`, `quickmenu_basic`, `Table_header`, `Table_cell`, `label_risk`, `check_txt`, `nds_icon_tooltip`, `Topbar_Dropdown`, `Topbar_Basic`, `tab_1depth_line`, `line_section`, `btn_txt_arrow`, `icon_pdf`, `Topbar_Fullpop`, `Popup_Sliding_basic_guide` frame):

- **24/24 checked instances resolve `remote: true`.** No page-local doc copies, no unpublished export scaffolding found — matches the pre-loaded verdict that NDS_Templates consumes real NDS_Library components, unlike NDS_M.web's mixed three-tier situation.
- **22/24** belong to a COMPONENT_SET (`parent.type === "COMPONENT_SET"`) — variant-driven components.
- **2/24** (`line_section`, `icon_pdf`) are standalone COMPONENTs with no parent set — single-variant assets.

## Real-screen composition (new — not present on either sibling file)

Two full product screens on this page show 유의사항 **embedded inside a shipped-style layout**, not just isolated demo frames:

- `발행어음매매_상세_유의사항` (`2674:26555`): a `원금손실 위험` block using 4 stacked `유의사항_Content` instances directly under a product title, above a `table_A_basic_현재가` rate table and a `btn_h54` PDF-download row (`icon_pdf` + "상품설명서"). Layout order: title → rate table → 원금손실 유의사항 block → `Topbar_Dropdown` header → `btn_bottom_page` → `quickmenu_basic`.
- `발행어음매매_리스트_유의사항_NM` (`2683:26994`): a `유의사항` block (title + 3 `유의사항_Content` instances) placed **above** a list of `card_grid_ETF` product cards (each carrying a `label_risk` risk-level chip) — i.e. disclaimer-before-list-of-products, a pattern neither the UX Guide nor M.web demonstrated.
- `해외선물옵션계좌_개설_완판케이스1` (`13007:912`, hit while scanning the page bounds — a sibling frame, not itself a 유의사항 demo but included because it composes `유의사항_Content` into a real "금융소비자 확인사항" block with 6 real regulatory bullets, one of which literally reads "기본 타입으로 일반적인 내용에 사용합니다. - 단락이 있으면 해당 줄과 같이 사용합니다." — this is the M.web demo-frame's own placeholder caption text pasted into what should be real legal copy, a copy-paste artifact carried across files).

## Blanks / gaps found at source

- No numeric width caption on the Case 01 (`유의사항_일반*`) or Case 03 (popup) frames — only the Case 02 두줄 floating bar states a pixel width. Case 01/03 have no analogous stated dimension on this page; not inferred.
- `Popup_Sliding_basic_guide` (`782:25871`) is a plain FRAME, not an INSTANCE — no componentKey to report for it on this page (consistent with it being local guide chrome, not a library component).

## How this feeds BUILD mode

- Use `유의사항_하단노출` key `6ab304902264c6101f4a0a62927f79d08c1d5827` directly — now doubly confirmed (Core reference + this file's live resolution).
- For a 2-line floating disclaimer, **428px is the better-evidenced max text-box width** (2 of 3 independent sources agree); treat M.web's 286px as the outlier pending designer confirmation, per that file's own `(진행중)` caveat.
- `유의사항_Content`'s `Type`(기본/심사필/...) × `줄 개수`(1줄/2줄) axis pattern is confirmed live here with a resolvable key (`0b26360121994f0a841dc0208d50ca20c0bcaa50`) — prefer this key over guessing when building a Case 01 disclosure block.
- New reusable pattern: disclaimer block placed directly above a product-card list (`발행어음매매_리스트_유의사항_NM`), and a page-top variant (`유의사항_pagetop`) for screens that need disclosure above the fold rather than at the bottom.
