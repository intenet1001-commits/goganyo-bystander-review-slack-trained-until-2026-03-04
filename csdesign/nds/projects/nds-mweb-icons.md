---
name: nds-mweb-icons
fileKey: uVcmG6GgOl2J8EOlc22wob
source_url: "https://www.figma.com/design/uVcmG6GgOl2J8EOlc22wob/NDS_M.web?node-id=1000-14"
learned_date: 2026-07-15
sections_studied:
  - "1000:14 (page '    - Icons' — three sibling sections: Icon_color usage 1598:787, Icon_guideline 1589:1734, Flag_guideline 1607:1172)"
  - "1598:787 (section 'Icon_color usage' — the mandatory icon colour-number allowlist, heading '🔥 필수 🔥 아이콘 쓰실 디자이너들! 확인하세요!')"
  - "1589:1734 (section 'Icon_guideline' — on-canvas heading 'M.web Icon' / 'Icongraphy Asset & Guideline'; 8627px tall, the main naming catalogue)"
  - "1593:2058 (frame — the ndsw export/handoff rule block)"
  - "1589:1744 (frame 'common' — ~30 category blocks, each = Korean label + naming pattern + variant set)"
  - "1593:175 (frame 'Specific' — CI/logo/members assets that sit outside the common naming rule)"
  - "2444:215 + 2444:220 (frames 'title_' / 'Group 16' — the ms/ndsw multi-status naming grammar)"
  - "2053:510 (frame — ndsw_icon_sort; the one block where the '소팅 기준이 2개일 때만' note genuinely renders)"
  - "2806:2356 (frame — ndsw_icon_reply; confirmed layer-name-vs-canvas mismatch, see gotcha)"
  - "1607:1172 (section 'Flag_guideline' — on-canvas heading 'M.web Flag' / 'Flag Asset & & Guideline'; ndsw_flag country/currency set)"
status: internal NDS component-library guide (design-system reference, not a shipped product screen)
---

# NDS M.web — Icons, Icon Colors & Flags

The icon foundation for the **NDS_M.web** library (`uVcmG6GgOl2J8EOlc22wob`). Three independent sections on one page:

1. **`Icon_color usage`** (`1598:787`) — a hard allowlist of which colour numbers an icon may use.
2. **`Icon_guideline`** (`1589:1734`) — the naming catalogue: ~30 icon families, each with a Korean role label, an `ndsw_icon_*` naming pattern, and a variant set.
3. **`Flag_guideline`** (`1607:1172`) — the country/currency flag set.

**Frame-name-vs-on-canvas mismatch: CONFIRMED on this page** — see the gotcha under "Naming catalogue". The recurring problem from `nds-ux-guide-color-contrast` / `nds-ux-guide-touch-area` shows up here in a different form (duplicated stale annotation layer names rather than mis-numbered sections), so the same rule applies: **screenshot and read the visible text; never trust a layer name alone.**

## 1. Icon colour allowlist (`1598:787`)

The section header is, verbatim:

> "🔥 필수 🔥 아이콘 쓰실 디자이너들! 확인하세요!"

Then, under the label **"기본 아이콘 컬러넘버 👇"** (a red outline on the canvas boxes the 컬러넘버 column, i.e. the middle number is the thing to quote):

| Icon Color slot | 컬러넘버 | Hex |
|---|---|---|
| 2 | 023 | `#333333` |
| 3 | 013 | `#666666` |
| 4 | 024 | `#999999` |
| 5 | 074 | `#C5C5C5` |
| 6 | 063 | `#FFFFFF` |

Under **"예외 넘버"** (exception numbers):

| Icon Color slot | 컬러넘버 | Hex |
|---|---|---|
| 1 | 004 | `#000000` |
| 7 | 127 | `#DDDDDD` |
| line | 017 | `#E0E0E0` |

Under **"예외 컬러"** (exception colours — no slot number, shown as `-`):

| 컬러넘버 | Hex | Cross-reference |
|---|---|---|
| 022 | `#84C13D` | NM 대표컬러 (see `nds-mweb-colors`) |
| 022 | `#FFAA1A` | QV 대표컬러 — **same number, different channel** |
| 238 | `#D73838` | 상승 Red |
| 239 | `#247EF2` | 하락 Blue |
| 003 | `#009F83` | 보합 |

Closing note, verbatim:

> "😈 최대한 이 안에서 사용하되, 추가적인 컬러가 필요하다면 디자인팀 내 논의를 통해 컬러를 추가하도록 합시다."

**This is a governance rule, not a suggestion** — icon colours are a closed set; extending it requires design-team discussion. Treat any icon colour outside these 13 values as a finding.

**The `Color=01..06` variant axis is now decoded.** The Core reference records `nds_icon_header` with a `Color` axis and advises "Use `Color=2` for standard light-mode icons" without saying why. This table is the key: **`Color=2` → 컬러넘버 023 → `#333333`**, which is exactly the "Body ink" the Core reference sampled independently. The two numbers in play are different things — the **slot** (1–7/`line`, what the Figma variant axis takes) and the **컬러넘버** (023, what the design team says out loud). Don't conflate them.

Note `022` appears **twice** in 예외 컬러 with two different hexes. That's not an error — it's the channel dependency documented in `nds-mweb-colors`: a 컬러넘버 is only meaningful with a channel attached.

## 2. Export / handoff rule (`1593:2058`)

Verbatim, three lines:

> "Export → ndsw_icon_(object).SVG"
> "Color hex, Size 전달 필수"
> "ndsw 공통처리"

Plus an adjacent link label: **"🔗 퍼블가이드 링크"** (a pointer to the publishing/front-end guide, which lives outside this Figma file — worth chasing if you need the implementation side).

So: icons ship as **SVG**, named `ndsw_icon_(object)`, and **colour hex + size must be handed over explicitly** — the SVG alone is not a complete handoff.

## 3. The `ms` / `ndsw` multi-status naming grammar (`2444:215`, `2444:220`)

For assets with multiple states, verbatim:

> "ms (버튼)" — "여러 상태값이 존재하는 이미지에 사용하는 네이밍 룰 * ms : multi status"
> "ndsw" — "웹화면 전용 이미지는 ms 대신 ndsw로 사용합니다."

The pattern (read off `2444:220`): **`ms _ btn _ example _ sn/nn/sd/nd`**, where `example` is annotated "업무명, 아이콘명(타입)". The four state suffixes, verbatim:

| Suffix | Expansion | Korean |
|---|---|---|
| `sn` | select normal | 선택된 활성화 |
| `nn` | non-select normal | 디폴트 일반값 |
| `sd` | select disable | 선택된 비활성화 |
| `nd` | non-select disable | 선택되지 않은 비활성화 |

**For web screens use `ndsw` in place of `ms`** — so a real web asset name is `ndsw_btn_<업무명>_<nn|sn|sd|nd>`. This grammar is what `ndsw_btn_heart_nn/sn(_black)` below is an instance of.

## 4. Naming catalogue (`1589:1744` "common")

Each block = Korean role label + naming pattern. Verbatim pairs, in canvas order:

| Korean role label | Naming pattern |
|---|---|
| 화살표, 꺽쇠 | `ndsw_icon_arrow_(방향)` |
| 다중 화살표 | `ndsw_icon_triplearrow_(방향)` |
| 지우기, 삭제 | `ndsw_icon_delete` |
| 필수 입력, 확인 | `nds_icon_ess` |
| 새로고침, 다시 불러오기 | `ndsw_icon_reload` |
| 안내, 유의사항 | `ndsw_icon_info` / `ndsw_icon_banginfo` |
| 추가, 더하기 | `ndsw_icon_plus` / `ndsw_icon_add` |
| 더보기, 상세메뉴, 미트볼 | `ndsw_icon_meatball` |
| 링크, 주소 | `ndsw_icon_link` |
| 완료 체크 | `ndsw_icon_complete` |
| 완료 실패 | `ndsw_icon_faild` |
| 헤더 아이콘 | `ndsw_icon_header_(타입)` |
| 닫기, X | `ndsw_icon_close` |
| 찾기, 검색 | `ndsw_icon_search` |
| 툴팁 | `ndsw_icon_tooltip` |
| 이미지 없음, 호출불가 | `ndsw_icon_noimg` |
| 등락률 | `ndsw_rate` |
| NEW, 뉴 | `ndsw_badge_new(타입넘버)` |
| 플로팅 액션 버튼, 맨위로 | `ndsw_icon_fab(번호)` |
| 카카오 | `ndsw_icon_kakao` |
| 외부로 이동 | `ndsw_icon_opennew` |
| 복사 | `ndsw_icon_copy` |
| 편집, 수집 | `ndsw_icon_edit` |
| 정렬, 스위치, 토글 | `ndsw_icon_sort` |
| 작성, 수정 | `ndsw_icon_edit` |
| 입력 | `ndsw_icon_reply` |
| AI심볼 | `ndsw_icon_ai_(크기)` |
| AI 채팅 입력 | `ndsw_icon_replyai` |
| 텍스트 확대/축소 | `ndsw_img_zoom_in/zoom_out` |
| 종목 즐겨찾기 | `ndsw_btn_heart_nn/sn(_black)` |
| 라인 종목 즐겨찾기 | `ndsw_btn_heartline(컬러넘버)_nn/sn(_black)` |

Extra annotations found near specific blocks, verbatim:

- **AI symbol sizing** (`3041:844`): "nds_icon_ai_h40 : 기본형 / nds_icon_ai_h24 : 넛징 앞에 작게 쓰일 때" — h40 is the default; h24 only when it sits small in front of a nudge.
- **종목 즐겨찾기 scoping** (`3201:6031`, `3201:6035`): `ndsw_btn_heart_*` → "홈, 관심그룹 등 종목 즐겨찾기"; `ndsw_btn_heartline(컬러넘버)_*` → "종목요약팝업". So the **line** variant is scoped specifically to the stock-summary popup, and it takes a 컬러넘버 in its name.
- **Sort constraint** (`2053:578`), verbatim: "소팅 기준이 2개일 때만 사용가능" — `ndsw_icon_sort` is only usable when there are exactly two sort criteria.

### Gotcha: stale duplicated annotation layer names (mismatch CONFIRMED)

The string **"소팅 기준이 2개일 때만 사용가능"** appears as a TEXT layer *name* in **five** blocks: `ndsw_icon_sort` (`2053:578`), `ndsw_icon_edit` (`2565:168`), `ndsw_icon_reply` (`2806:2361`), `ndsw_icon_ai` (`3025:203`), and `ndsw_icon_replyai` (`2934:238`).

Screenshot verification:
- `2053:510` (`ndsw_icon_sort`) — the note **does** render on canvas. Genuine.
- `2806:2356` (`ndsw_icon_reply`) — the frame renders only "입력 / ndsw_icon_reply". **The note does not appear.** The layer is a stale copy-paste leftover carried along when the block was duplicated from the sort block.

So the sort-criteria constraint applies to **`ndsw_icon_sort` only**. Do not attribute it to 작성/수정, 입력, AI심볼, or AI 채팅 입력 — a metadata-only read would wrongly apply it to all five. This is the same class of bug as the frame-numbering mismatch in the sibling `NDS_UX Guide` file: **the layer name is not the content.**

### Other naming inconsistencies (verbatim, uncorrected)

These are in the guide as-is; flagging them rather than silently normalizing:

- **`nds_icon_ess`** (필수 입력, 확인) uses the `nds_` prefix, not `ndsw_`, unlike every other entry in this web-oriented catalogue. Likewise the AI sizing note says `nds_icon_ai_h40` while the catalogue entry says `ndsw_icon_ai_(크기)`. Verify the real prefix per-asset before assuming `ndsw_`.
- **`ndsw_icon_faild`** is a misspelling of "failed" — but it's the actual asset name. Use it as spelled; don't "fix" it.
- **`ndsw_icon_edit` is listed twice** for two different roles (편집/수집 and 작성/수정) with different glyphs. The name alone is ambiguous — disambiguate by node/variant, not by name.
- **`ndsw_icon_info` is also listed twice** (both labelled 안내, 유의사항), with `ndsw_icon_banginfo` as a sibling variant.

### Variant axes observed

`ndsw_icon_arrow` (`1000:1758`) is the fully-enumerated example:

- **`Color`**: `01`, `03`, `04`, `05`, `06` — note **`02` is absent from this set** even though slot 2 (`#333333`) is the standard body-ink icon colour per the allowlist. Enumerate a component set's real variants before assuming `Color=2` exists on it. (Core reference records `nds_icon_arrow` in the *other* file with `Color(01/03/04/05/06)` — the same gap, independently confirmed here.)
- **`Type`**: `right`, `left`, `up`, `down`
- **`Height`**: `h24`, `h16`

SVG instance names follow the abbreviated direction convention: `ndsw_icon_arrow_r` / `_l` / `_u` / `_d`.

## 5. Specific assets (`1593:175`)

Brand/logo assets that sit outside the common naming rule:

| Korean role | Name | Variants |
|---|---|---|
| CI, 회사로고 | `ndsw_icon_ci_n2` | `Color=06`, `Color=05` |
| CI | `ndsw_icon_ci_nh` | `Channel=nh` |
| 나무멤버스 | `ndsw_img_members(타입넘버)` | `Type=01`, `Type=02` |
| 더, more | `ndsw_icon_more` | `속성 1=기본` |

Two distinct CI marks exist — `_n2` (나무, colour-variant) and `_nh` (NH, channel-variant). Pick per the channel the screen belongs to.

## 6. Flags (`1607:1172`)

Section headings: **"M.web Flag"** / **"Flag Asset & & Guideline"** (the doubled "&" is in the source).

Export rule, verbatim:

> "Export → ndsw_flag_circle_(국가코드).SVG"
> "Size 전달 필수"
> "ndsww 공통처리"
> "(200x200)"

(**"ndsww"** — three w's — is a typo for `ndsw`, cf. the icon section's "ndsw 공통처리".)

Component `ndsw_flag` (`1607:2877`) has two axes:

- **`Type`**: `Square`, `Circle`
- **`Country`**: keyed by **currency code + Korean country name**, e.g. `USD(미국)`, `KRW(한국)`, `JPY(일본)`, `CNY(중국)`, `EUR(유럽)`, `GBP(영국)`, `HKD(홍콩)`, `AUD(호주)`, `CAD(캐나다)`, `CHF(스위스)`, `SGD(싱가폴)`, `TWD(대만)`, `THB(태국)`, `VND(베트남)`, `IDR(인도네시아)`, `INR(인도)`, `BRL(브라질)`, `MXN(멕시코)`, `ZAR(남아공)`, `RUB(러시아)`, `NZD(뉴질랜드)`, `SEK(스웨덴)`, `NOK(노르웨이)`, `DKK(덴마크)`, `NLD(네덜란드)`, `FRA(프랑스)`, `GER(독일)`, `Global(디폴트)`.

**Gotcha — the two Types are not symmetric.** `Circle` has **28** countries; `Square` has **27**. `Type=Square, Country=Global(디폴트)` **does not exist** — the default/fallback flag is Circle-only. If you need a fallback for an unmapped currency, you must use `Type=Circle`.

**Gotcha — the Country axis mixes two code systems.** Most values are ISO-4217 *currency* codes (`USD`, `KRW`, `JPY`), but `NLD`, `FRA`, `GER` are *country* codes (the Netherlands, France and Germany all use EUR, which also exists as its own `EUR(유럽)` entry). And `GER` is not even ISO — ISO-3166 for Germany is `DEU`. So you **cannot** map a currency code to a flag variant programmatically; look the value up against the enumerated variant list.

Also note the export rule names only `ndsw_flag_circle_(국가코드)` while the component ships both Square and Circle — the Square export naming is undocumented here.

## How this feeds BUILD mode

- **Icon colours are a closed allowlist.** Use only 023/013/024/074/063 (standard), 004/127/017 (exception), or 022/238/239/003 (semantic exception). Anything else needs design-team sign-off per the guide's own closing note. Body-ink icons → 컬러넘버 **023 = `#333333`**, reachable as the `Color=2` variant slot.
- **`Color=02` may not exist on a given component set** even though slot 2 is the standard icon colour (`ndsw_icon_arrow` only ships `01/03/04/05/06`). Enumerate `componentSet.children` names before selecting a variant; don't construct `"Color=2, Type=right, Height=h24"` blind.
- **Name new assets with the real grammar**: plain icons → `ndsw_icon_<object>`; multi-state buttons → `ndsw_btn_<업무명>_<nn|sn|sd|nd>` (`sn`=selected-active, `nn`=default, `sd`=selected-disabled, `nd`=unselected-disabled). Use `ndsw`, not `ms`, for web.
- **Handoff is SVG + explicit colour hex + size.** Exporting the SVG alone is an incomplete deliverable per the guide.
- **Look names up in the catalogue table above rather than guessing** — the set is full of traps: `ndsw_icon_faild` (sic), `nds_icon_ess` (wrong prefix), `ndsw_icon_edit` ×2 for different glyphs, `ndsw_icon_meatball` for the overflow menu (not "more"/"kebab" — note the sibling `NDS_Library` in the Core reference calls its overflow icon `kebab`, so **the two libraries disagree on the name for this glyph**).
- **Favourite/heart is scope-dependent**: `ndsw_btn_heart_*` for 홈/관심그룹; `ndsw_btn_heartline(컬러넘버)_*` for 종목요약팝업 only.
- **AI symbol**: `h40` default, `h24` only when small in front of a nudge.
- **`ndsw_icon_sort` requires exactly two sort criteria** — if a screen sorts by three or more, this icon is the wrong control. (This constraint applies to sort *only*; see the stale-layer-name gotcha above.)
- **Flags**: `ndsw_flag`, `Type=Square|Circle`, `Country=<CUR>(<한글국가명>)`. Use `Type=Circle` for any fallback — `Global(디폴트)` has no Square. Never derive the Country value from a currency code programmatically; the axis mixes currency and country codes (`NLD`/`FRA`/`GER` alongside `EUR`).
