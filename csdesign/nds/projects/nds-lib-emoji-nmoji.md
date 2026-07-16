---
name: nds-lib-emoji-nmoji
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=15422-15275"
learned_date: 2026-07-16
sections_studied:
  - "15422:15275 (page '    - Emoji & Nmoji' — canvas root; 243 COMPONENTs, 0 COMPONENT_SETs)"
  - "19851:3053 (frame '1. TXT' — on-canvas heading 'TXT' / 'QV-NM Emoji Guide', body '텍스트(본문)에 사용하는 문자형 이모지입니다.')"
  - "51149:2599 (frame '2. IMG' — on-canvas heading 'Nmoji: 142개' '(40에 2배수 png추출)' / 'QV-NM Emoji Guide')"
  - "19851:18169 (frame '3. IMG' — on-canvas heading 'Emoji IMG : 80개' '(50에 2배수 png추출)' / 'QV-NM Emoji Guide')"
  - "51153:185 (frame 'title_' — the Nmoji authoring rule, red-emphasised on canvas)"
status: "live — 243 local (remote:false) source COMPONENTs, populated and actively extended (nmoji numbering runs to 153, well past the page's own stale '142개' label). No deprecation marker, no supersede pointer. NOT inferred from the page name. No Last update stamp — see Gaps."
---

# NDS_Library — "    - Emoji & Nmoji" page

**The page's own structure answers a question the `🌈 Graphic asset` index gets wrong.** The index card says emoji are `두가지로 나뉩니다` (divided into two kinds); this page has **three** top-level frames, and they are the three kinds:

| Frame | Kind | What it is |
|---|---|---|
| `1. TXT` (`19851:3053`) | **유니코드** | Unicode character emoji, pasted as text |
| `2. IMG` (`51149:2599`) | **Nmoji (엔모지)** | NDS's own icon-style emoji, as images |
| `3. IMG` (`19851:18169`) | **이미지 이모지** | Twemoji-derived image emoji, the fallback |

The index card's "두가지" is stale copy. **Three is correct.** (Flagged to LEDGER from the `nds-lib-graphic-asset` note.)

## Name-reliability verdict: MIXED — reliable inside the three frames, unreliable outside them

- **Inside `1. TXT` / `2. IMG` / `3. IMG`: RELIABLE.** Component names are disciplined identifiers (`nds_nmoji##`, `nds_emoji_<unicode-hex>`), and TEXT node names match their content (verified by screenshot on `51153:185` and `51153:191`).
- **Outside the three frames: UNRELIABLE — this is the page's scratch area, and it is large.** The canvas root holds dozens of loose nodes that are **NOT part of the delivered system**: raw `<frame>`/`<vector>` work-in-progress copies of `nds_nmoji85` and `nds_nmoji76` sitting at x≈33,000 (i.e. duplicated *names* that are frames, not components); stray `nds_infographic65` frames that belong to a **different page's** asset class; loose `camera-with-flash_1f4f8` / `camera_1f4f7` rounded-rects; unnamed `<frame> " "` (`62118:601`); and instances named `viviana`, `moana`, `su`, `sia`, `ys` (designer avatar/handle stamps, not assets).
  **This is exactly the method doc's "layer names lie" failure mode, and it is live on this page**: a name-only sweep would report `nds_infographic65` as an emoji asset and `nds_nmoji85` as existing three times. **Only nodes inside the three numbered frames count.**
- **Rules are NOT embedded in pasted screenshot images** — all rule text is live TEXT. But the Nmoji authoring rule's *emphasis* (a red-colored clause carrying the two hard requirements) is a **fill-color property, invisible to a name-only read**. I recovered it by screenshot. Same lesson class as the white-on-white `제작중` on the index page: **styling carries meaning here, and structure-only reads drop it.**

## Verbatim rules

### `2. IMG` — Nmoji (`51153:187`, screenshot-confirmed, red emphasis noted)

> `타이틀, 카테고리에 사용하는 NDS만의 아이콘형 이모지입니다.`
> `제작시 3가지 색 사용은 지양합니다.` **`사용시 디자인팀 공유 필수!!!!!! TINY PNG 필수!!!!!!!!`**

The bold portion is **rendered in red** on canvas — it is the emphasised half. Two hard requirements: **디자인팀 공유** and **TINY PNG**. Plus one soft constraint: **제작시 3가지 색 사용은 지양** (avoid using three colors when authoring).

Header (`51149:2601` + `54121:2346`): `Nmoji: 142개` `(40에 2배수 png추출)` — **export at 40px @2x. Count is stale, see LEDGER.**

### `3. IMG` — Image Emoji (`51153:192`)

> `Nmoji가 없을때 사용하는 이미지형 이모지입니다.`

**This is a fallback-precedence rule, and it's the most actionable sentence on the page:** image emoji are for when **no Nmoji exists**. Nmoji is the preferred choice; image emoji is the fallback. Header (`19851:18171` + `54121:2348`): `Emoji IMG : 80개` `(50에 2배수 png추출)` — **export at 50px @2x. Count is stale, see LEDGER.**

Sourcing/authoring instruction (`19851:18175`), verbatim:

> `https://www.piliapp.com/emoji/download/ SVG 다운로드 이미지명 nds_emoji_이모지코드 (이모지코드는 다운로드시 출력됨) 사이즈 100x100 png 전달 그리고 여기에 아카이빙!`

→ Source SVG from piliapp, name as `nds_emoji_<이모지코드>`, deliver **100×100 png**, and **archive back onto this page**.

⚠️ **Internal tension:** this instruction says deliver **100x100 png**, but the frame header says **`(50에 2배수 png추출)`** = 50@2x = 100px. **These agree numerically** (50×2 = 100) — recording it because it reads as a contradiction and is not one. The on-canvas components are drawn at 100×100, consistent with both.

### `1. TXT` — Unicode Emoji (`51153:195`, `19851:3439`)

> `텍스트(본문)에 사용하는 문자형 이모지입니다.`

Usage method (`19851:3439`), verbatim:

> `control + command + space로 사용하고자 하는 이모지를 고릅니다. https://emojigraph.org/ 이모지 코드 변환 사이트에서 해당 이모지를 찾습니다. 해당 이모지의 JavaScript, JSON, Java 코드를 복붙하여 전달!`

→ macOS emoji picker → emojigraph.org → **hand off the JavaScript/JSON/Java code**, not an image. This is the only one of the three classes delivered as **code**, not an asset.

## Inventory — exact counts (from `.length`, not estimated)

| | Count |
|---|---|
| All COMPONENTs on page | **243** |
| **COMPONENT_SETs** | **0** — everything here is a flat standalone COMPONENT. No variant axes anywhere on this page. |
| `nds_nmoji##` components | **152** |
| `nds_emoji_*` components | **91** (89 distinct names) |

**Nmoji numbering:** runs `nds_nmoji01` … `nds_nmoji153`, **152 present, exactly one gap: `nds_nmoji42` is missing.** No duplicate numbers.

**Emoji naming pattern:** `nds_emoji_<unicode-hex>`, e.g. `nds_emoji_1f4ac`, `nds_emoji_2709`, `nds_emoji_1f60d`. **The prefix is inconsistent** — some carry a stray `u`: `nds_emoji_u270f`, `nds_emoji_u2602`, `nds_emoji_u1f3e0`, `nds_emoji_u1f4f2`, `nds_emoji_u1f4de`, `nds_emoji_u1f50e`, `nds_emoji_u2665`. Both forms coexist for the same scheme. One name has a **trailing space**: `nds_emoji_1f3a7 `.

Emoji are grouped into two on-canvas category frames inside `3. IMG`:
- `nds_emoji - People & Body` (`24571:742`) — 12 components
- `nds_emoji - Objects` (`24571:743`) — 70 components

⚠️ **Note the category naming here (`People & Body`) does NOT match the `🌈 Graphic asset` index card, which uses `nds_emoji/Smileys & Face/...`, `nds_emoji/Symbol/...`, `nds_emoji/Objects/...`, `nds_emoji/Travel & Places/...` — a slash-path taxonomy with different category labels.** Two different emoji naming schemes coexist across the two pages. See LEDGER.

Also present: `nds_emoji_dim01` (`24591:1417`) under a `Disable` label (`24571:1311`) — the disabled-state emoji treatment.

## CORE — componentKeys found

**All `remote: false` → tier (a) published-library source components in their home file.** KIND = **standalone `COMPONENT`** for every one (`inSet: false` verified — there are **zero** COMPONENT_SETs on this page). **Use `importComponentByKeyAsync`, never `importComponentSetByKeyAsync`** — there is no set to import.

| Component | Full key (40-hex) | KIND |
|---|---|---|
| `nds_nmoji01` | `0384fe47c789b42017779a74fa3f6c56fdb28130` | COMPONENT (standalone) |
| `nds_nmoji02` | `68e5a1ba11086de64c29b0077ca277ef52da275a` | COMPONENT (standalone) |
| `nds_nmoji03` | `69fde3e2ca7e00bc3cae86d328aece1e439919bc` | COMPONENT (standalone) |
| `nds_nmoji05` | `bbdb81f4eae9bb5342dbeaf94eb68eb050574aa3` | COMPONENT (standalone) |
| `nds_nmoji18` | `ae52154982173718fd33945970544ef51e75575c` | COMPONENT (standalone) |
| `nds_emoji_1f4ac` | `08bd1c095e2cbd5b4e70d3728ce45a6d3443272c` | COMPONENT (standalone) |
| `nds_emoji_2709` | `9af7c6872594ca233be66f2a7d342b0d6c472716` | COMPONENT (standalone) |
| `nds_emoji_1f4cb` | `a5929902b97bcbdd75b4bbe312d5d47d461deed6` | COMPONENT (standalone) |

`nds_nmoji01/02/05/18` **cross-check clean against the `🌈 Graphic asset` index page** — same names, same keys, read via two independent paths (there as resolved instance mains, here as the on-canvas components). That mutual agreement is the strongest identity evidence available in a read-only session.

**Per method, I did NOT transcribe all 243 keys** — the pattern (`nds_nmoji##` / `nds_emoji_<hex>`, flat, keyless-of-variants) plus counts plus this sample is the deliverable. **Verification status: `unverified`** — read-only session, no import round-trip. Expected norm.

## Conflicts / LEDGER candidates

1. **`Nmoji: 142개` is stale — the real count is 152.** Off by 10. The header was not updated as nmoji 143–153 were added. **Any BUILD pass trusting the label under-counts the library by 10 assets.**
2. **`Emoji IMG : 80개` is stale — the real count is 91 components / 89 distinct names.** Off by ~9–11.
3. **`nds_nmoji42` does not exist.** The sequence 01–153 has exactly one hole. **A BUILD pass that iterates `01..N` will 404 on 42.** Unknown whether it was retired or never made.
4. **Two duplicate emoji names, each pointing at two different components:** `nds_emoji_1f5a8` (`47386:1250` and `47396:44983`) and `nds_emoji_1f3c6` (`33839:852` and `67820:189`). **Name→key lookup is ambiguous for these two.**
5. **Two incompatible emoji naming taxonomies across pages.** This page: flat `nds_emoji_<hex>` in `People & Body` / `Objects` frames. The `🌈 Graphic asset` index: slash-path `nds_emoji/Smileys & Face/Smiling Face with Heart-Eyes` with human-readable names and **different categories** (`Smileys & Face`, `Symbol`, `Travel & Places`, `Animals & nature`). **The keys differ too** (`d60ca4a1...` for the index's heart-eyes vs this page's hex-named set). These look like **two generations of the emoji library coexisting** — the index page's slash-path components may be the newer published form, or the older one. **Unresolved and worth a VERIFY pass; do not assume either is canonical.**
6. **`u`-prefix inconsistency** in ~7 emoji names (`nds_emoji_u270f` vs `nds_emoji_270f` — note **both forms exist for the same emoji 270f**, as separate components `19851:18187` and `47386:1201`). Exact-name lookup will miss half the set depending on which form you guess.
7. **Trailing space** in `nds_emoji_1f3a7 `. Exact-match lookup fails.
8. **NOT a conflict (recording to prevent a false flag):** Nmoji `추천 사이즈 : 26 ~ 40` on the index page vs `(40에 2배수 png추출)` here. First is *placement* size, second is *export* spec. Same for Emoji (`~40` placement vs `50@2x` export). These describe different things.
9. **Two hidden `Objects` TEXT labels** (`24571:745`, `51149:2689`) are `hidden="true"`. Per method, **not quoted as rules** — they are section labels, and their sections render fine without them. Cosmetic; recorded, not actioned.

## Gaps / unverifiable

- **No `Last update` stamp on this page.** Searched the full dump — zero hits for `Last update`/date patterns. Contrast `- Infographic` (`2023.12.06 송수연`) and `- Illusts` (`2025.10.24 유상엽`). Freshness inferred from the live 152-nmoji inventory outrunning the stale 142 label — i.e. **the page is demonstrably being extended, but nobody maintains its headers.** That tells you the *assets* are current and the *documentation* is not.
- The scratch area outside the three frames (x≈31,000–37,600) was **not exhaustively catalogued** — it holds WIP frames, slices, and cross-class strays (`nds_infographic65`). I established it is scratch and excluded it; I did not enumerate it.
- `62118:2242` reads `시킹알파 종목 테마별 제작건(추가 전)` ("Seeking Alpha theme-by-theme production item (before addition)") above an **empty 1200×240 frame** (`62118:601`). This is a **pending work marker for an unstarted batch** — not an incomplete asset class in the ⛔ sense (nothing depends on it yet), but evidence the page is an active worksurface. Recorded, low priority.
- The two `nds_nmoji85` and one `nds_nmoji76` raw frames in the scratch area are **not components** and carry no keys. They duplicate delivered component names. Ignored as WIP.
- I did not verify whether `nds_emoji_dim01` (the `Disable` treatment) has a documented usage rule — no prose accompanies it.
</content>
