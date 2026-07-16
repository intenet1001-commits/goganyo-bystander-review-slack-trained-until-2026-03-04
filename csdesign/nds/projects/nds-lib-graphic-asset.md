---
name: nds-lib-graphic-asset
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=19851-347"
learned_date: 2026-07-16
sections_studied:
  - "19851:347 (page '🌈 Graphic asset______________' — canvas root, on-canvas heading 'Graphic asset', 6 direct children: 5 `guide_parent` cards + the heading TEXT)"
  - "24147:1353 (guide_parent card — on-canvas heading 'Emoji' / '이모지')"
  - "51631:3095 (guide_parent card — on-canvas heading 'Nmoji' / '엔모지')"
  - "24147:1620 (guide_parent card — on-canvas heading 'Infographic' / '인포그래픽')"
  - "24147:1803 (guide_parent card — on-canvas heading 'Illust' / '일러스트')"
  - "44525:1391 (guide_parent card — on-canvas heading 'Character' / '캐릭터')"
status: "live — carries the file's only cross-cutting size taxonomy; four of five asset classes render real, delivered assets. Evidence: 5 `guide_parent` cards each render a populated asset grid backed by local COMPONENTs (keys read off `nds_nmoji01`..`nds_nmoji19`, `nds_emoji/...`, all `remote:false`). No deprecation marker, no strikethrough, no '→ 이동' pointer anywhere on the page. NOT inferred from the page name (the underscore padding is a sidebar-separator convention and is NOT evidence of anything)."
---

# NDS_Library — "🌈 Graphic asset" page

**Read this first: despite the underscore-padded, header-looking page name, this page carries the single most load-bearing cross-cutting rule in the `nds` graphic-asset domain — the recommended-size taxonomy that tells you WHICH asset class to reach for at a given pixel size.** It is a five-card index; the per-class detail pages (`- Icons`, `- Emoji & Nmoji`, `- Infographic`, `- Illusts`) hang off it.

## Name-reliability verdict: RELIABLE (with one specific trap)

**TEXT node layer names on this page are byte-identical to their `characters`.** I verified this two ways, not one: every card's rule sentence was (a) read off the layer name in `get_metadata`, and (b) independently read out of `node.characters` via a read-only `use_figma` probe, and (c) confirmed on a rendered screenshot. All three agree. The names are Figma's auto-naming (TEXT layers default to their content), and nobody has hand-renamed them here.

**The trap is not the names — it's that one visible-in-the-tree node is invisible on the canvas.** See the Nmoji correction below. `hidden="true"` was not the mechanism; a white-on-white fill was. Structure-only reads cannot catch this. **Rules were NOT embedded in pasted screenshot images on this page** — no `스크린샷 ...`-style image nodes exist here; all five rules are live TEXT.

## The five recommended sizes — verbatim, screenshot-confirmed

Each card's body is a single TEXT node with an embedded newline. Quoted **in full**, exactly as rendered (`\n` marks the line break; the size clause is the second line and is bolded on canvas):

| Class | Node | Full verbatim copy |
|---|---|---|
| **Emoji** / 이모지 | `24147:1619` | `유니코드/엔모지/이미지 이모지 두가지로 나뉩니다.\n추천 사이즈 : ~ 40` |
| **Nmoji** / 엔모지 | `51631:3101` | `타이틀, 카테고리에 사용하는 아이콘형 이모지입니다.\n추천 사이즈 : 26 ~ 40` |
| **Infographic** / 인포그래픽 | `24147:1626` | `콘텐츠를 부가 설명하는 그래픽으로 쓰입니다.\n추천 사이즈 : 40 ~ 80` |
| **Illust** / 일러스트 | `24147:1808` | `QV/NM BI를 고려한 비주얼 일러스트 입니다.\n추천 사이즈 : 80 ~ 200` |
| **Character** / 캐릭터 | `44525:1396` | `특정 서비스 컨셉을 표현한 비주얼 이미지 입니다.\n추천 사이즈 : 제한 없음` |

All five size clauses match what the orchestrator sighted. **The prose first lines were NOT in the orchestrator's brief and are the part that actually tells you when to pick each class** — the size range alone is ambiguous where the bands touch (Emoji `~40` and Nmoji `26~40` overlap entirely between 26 and 40; the disambiguator is the prose: Nmoji is for **타이틀/카테고리**, Emoji is the general/본문 case).

Derived (my synthesis, not on-canvas): the bands read as a continuous ladder — `≤40` Emoji · `26–40` Nmoji · `40–80` Infographic · `80–200` Illust · unbounded Character.

## ⚠️ CORRECTION to the briefing: the Nmoji card is NOT incomplete

The orchestrator's brief stated the Nmoji card "shows `제작중` (in production)" and instructed me to report Nmoji as an incomplete asset class. **That is wrong, and I am not reporting it that way. Here is the evidence:**

- The `제작중` TEXT node (`51631:3278`) **does exist** in the tree and reports `visible: true`.
- **But its fill is `{r:1, g:1, b:1}` — pure white — and it sits on `Rectangle 6030`, a white card.** It is white-on-white: present in the node tree, invisible on the canvas.
- The rendered screenshot of `51631:3095` shows **12 real nmoji icons** (piggy bank, chart, graduation cap, megaphone, robot, folder, …) in a populated 4×3 grid. There is no visible "제작중" text.
- The card holds **14 live INSTANCE nodes** (`nds_nmoji01`–`nds_nmoji10`, `18`, `19`) whose main components resolve to real local COMPONENTs with full keys (see CORE section).
- The node IDs tell the story: `제작중` is `51631:3278`; the nmoji instances are `51731:*` and `61354:*` — **created later**. The placeholder was superseded by delivered artwork and left behind as dead text rather than deleted.

**Conclusion: Nmoji is a delivered, populated asset class.** The `- Emoji & Nmoji` detail page independently corroborates this with a `Nmoji: 142개` inventory count. Treating Nmoji as ⛔ would have blocked a BUILD pass from using 142 shipped assets.

This is a clean instance of the method's own warning generalized: **`hidden="true"` is not the only way a node lies. A visible node with a fill matching its background is invisible too, and only a screenshot catches it.** Structure-only reads produce false positives in *both* directions.

## ✅ CONFIRMED incomplete: Character

The `Character` card (`44525:1391`) is the **one** genuinely incomplete class:
- `44525:1405` = `곧, 만나요~😘` — fill is also white `{r:1,g:1,b:1}`, **but here it sits over a dark/dimmed image**, so it renders large and legible dead-center of the card.
- The screenshot shows five character figures behind it, heavily **dimmed/darkened** — a deliberate "coming soon" treatment, not a finished swatch grid.
- The card carries **no INSTANCE nodes at all** — unlike Emoji/Nmoji/Infographic, there is nothing to place.

**⛔ A BUILD pass must not assume any `Character` asset exists.** The `추천 사이즈 : 제한 없음` rule for Character is a forward-looking declaration about assets that have not shipped.

## Inventory

- **Emoji card** (`24147:1353`) — `Twemoji` > `Frame 9011`, a 6×4 grid of **24 COMPONENTs** at 40×40, named `nds_emoji/<Category>/<Name>`. Categories seen: `Smileys & Face` (6), `Symbol` (2), `Objects` (11), `Travel & Places` (3), `Animals & nature` (1). Note the frame is named `Twemoji` — the source is Twitter's Twemoji set.
- **Nmoji card** (`51631:3095`) — 14 INSTANCEs at 50×50, flat `nds_nmoji##` naming (no category path). `nds_nmoji09` appears **three times** at the identical position (`51731:912`, `61354:859`, `61354:867` all at x=466,y=164) — stacked duplicates, a housekeeping smell, not a rule.
- **Infographic card** (`24147:1620`) — `Twemoji` frame (**misnomer** — these are not Twemoji) holding **12 FRAMEs** at 80×80 with plain-English semantic names: `won`, `dollar`, `candle`, `korea`, `rise`, `corp`, `id`, `security card`, `calender` [sic], `bank account`, `one`, `security`. These are frames, **not** components — page-local demo copies, not placeable library assets.
- **Illust card** (`24147:1803`) — a `Mask group` cropping `Section 1 1` (1442×730) down to the 550×364 card. Real 3D-style illustrations render (hands, people with laptops, treasure chest, magnifying glass). No individually-named asset nodes — it's one masked showcase image, not an inventory.
- **Character card** (`44525:1391`) — `Mask group` + dimmed image + the `곧, 만나요~😘` overlay. No assets.

Page heading: `Graphic asset` (`24147:1812`), sitting above the Nmoji card at x=-735.

## CORE — componentKeys found

Captured via a read-only `use_figma` probe. **All keys below are full 40-hex, KIND = standalone `COMPONENT` (verified: none has a `COMPONENT_SET` parent — I checked `mc.parent.type` explicitly and it was never `COMPONENT_SET`). There are NO variant axes on these — emoji and nmoji are flat, one component per asset.**

| Component | Full key (40-hex) | KIND | Source node |
|---|---|---|---|
| `nds_nmoji01` | `0384fe47c789b42017779a74fa3f6c56fdb28130` | COMPONENT (standalone) | main of instance `51731:904` |
| `nds_nmoji02` | `68e5a1ba11086de64c29b0077ca277ef52da275a` | COMPONENT (standalone) | main of instance `51731:905` |
| `nds_nmoji05` | `bbdb81f4eae9bb5342dbeaf94eb68eb050574aa3` | COMPONENT (standalone) | main of instance `61354:875` |
| `nds_nmoji18` | `ae52154982173718fd33945970544ef51e75575c` | COMPONENT (standalone) | main of instance `61354:877` |
| `nds_emoji/Smileys & Face/Smiling Face with Heart-Eyes` | `d60ca4a1ba6869c862a7bc78d0f143f92188209d` | COMPONENT (standalone) | node `24147:1357` (on-canvas COMPONENT, not an instance) |
| `nds_emoji/Symbol/Red Heart` | `b46b27eaade9bd52ec72d5749bc2d6e66eaa202e` | COMPONENT (standalone) | node `24147:1414` |

**Tier classification — all six: (a) published-library source components.** Every one reports **`remote: false`**, and this file *is* NDS_Library. `remote:false` here does **not** mean "local re-creation" — it means these are the **originals that the library publishes**, viewed from inside their home file. This is the opposite of the "page-local documentation re-creation" tier: consuming files would see these same keys as `remote: true`. **These are the canonical keys to import.**

**Verification status: `unverified`, as expected.** I did not call `importComponentSetByKeyAsync` — and it would not apply anyway, since none of these is a SET. The keys are read directly off the resolved main components, which is the strongest read available in a read-only session. Per the method doc, this is the expected norm, not a gap.

**Mind the KIND when consuming:** these need `importComponentByKeyAsync`, **not** `importComponentSetByKeyAsync`. The set-vs-variant distinction that bit a previous session doesn't arise here — there are no sets on this page — but reaching for the SET importer out of habit will throw.

## Cross-reference / conflicts

- **Emoji vs Nmoji size bands overlap 26–40.** Not a contradiction; the prose disambiguates by role (title/category → Nmoji). Worth stating explicitly in Core so a BUILD pass doesn't coin-flip.
- **Nmoji `추천 사이즈 : 26 ~ 40` vs the `- Emoji & Nmoji` page's `(40에 2배수 png추출)`** — these are **not** in conflict. 26–40 is the *usage/placement* range; 40@2x is the *export* spec. Same for Emoji (`~40` usage vs `(50에 2배수 png추출)` export) and Infographic (`40~80` usage vs `80*80을 2배수로 추출` export). **Recording this because it reads as a conflict at a glance and is not one.**
- The `Infographic` card's grid frame is named `Twemoji` — copy-paste leftover from the Emoji card. Cosmetic.

## Gaps / unverifiable

- **`유니코드/엔모지/이미지 이모지 두가지로 나뉩니다.` says "두가지" (two kinds) but lists three** (유니코드 / 엔모지 / 이미지). The `- Emoji & Nmoji` page resolves the intent — it has exactly three frames: `1. TXT` (유니코드), `2. IMG` = Nmoji, `3. IMG` = 이미지 emoji. So the *content* is three; the word "두가지" is stale, likely written when Nmoji didn't exist yet. **Flagged to LEDGER as a source-copy error.** Do not propagate "two kinds" into any derived doc.
- **No `Last update` stamp on this page.** Unlike `- Infographic` (`2023.12.06 송수연`) and `- Illusts` (`2025.10.24 유상엽`), this page is undated. Its freshness is inferred from its *contents* being current, not from a stamp — so the `live` status above rests on populated-assets evidence, not on a date.
- The Illust and Character cards use `Mask group` + a single flattened image; I could not enumerate individual illustration assets from this page. The `- Illusts` page is the authority for that inventory.
- The dead `제작중` node (`51631:3278`) should be deleted at source. Until then, **any future automated pass that reads this page structurally, without rendering, will re-derive the same false "Nmoji is incomplete" conclusion.** Recommend the note itself be the guard.
</content>
</invoke>
