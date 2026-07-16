---
name: nds-lib-welcome
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=3408-8606"
learned_date: 2026-07-16
sections_studied:
  - "3408:8842 (frame 'Welcome to NDS Library' — on-canvas cover: 'NDS' / 'Library' / 'NH investment Design System' + the hand-maintained TOC panel)"
  - "29331:511 (frame 'NDS Library Update' — on-canvas heading 'Library Update'; a DATED changelog, latest entry 2024.06.07)"
  - "3418:9189 (loose TEXT — the IP / licence notice, '해당 파일은 NH투자증권의 디자인 자산으로…')"
  - "3418:9229 + 3418:9231 (TEXT 'NDS_Templates' + 'GO ->' — a live hyperlink out to a SEPARATE Figma file)"
  - "5088:8997 (frame 'UI 찾기가 어려우신가요?' [layer name] — on-canvas headings '원하는 UI를 찾기 어려우신가요?' + 'COMPONENTS GUIDELINES'; a 20-card visual component index built from guide_parent)"
  - "43376:623 / 43376:624 (loose TEXT 'Copied to clipboard' + a 32-char string each — UNIDENTIFIED, see below)"
status: "live — evidenced, not inferred: the on-page 'Library Update' changelog carries dated entries running to 2024.06.07, and the component index links to pages that exist. This is the file's front door and is actively maintained."
---

# NDS Library — "👋  Welcome___________________" page

The file's cover and index. Unlike most pages in this domain, its status is **not** a guess: it carries its own dated changelog (below).

## Name reliability — MOSTLY reliable, with two traps

Authored text on this page is truthfully named. Two exceptions, both verified by reading `characters`:

1. **Frame `5088:8997` is layer-named `UI 찾기가 어려우신가요?` but its on-canvas heading reads `원하는 UI를 찾기 어려우신가요?`** — near-miss, enough to break an exact-match search.
2. **The `🖊️` emoji is in the layer name only, NOT in the rendered text.** The body text `5254:9887` renders as `Component는 각자의 기능을…` — no pen emoji. Quoting the layer name verbatim would introduce a character that is not on the canvas. Corrected in the quote below.

Everything else (`COMPONENTS GUIDELINES`, the licence notice, `Library Update` titles/times) matches. **Rules embedded in screenshot images: no** — the cover's background raster and the Library Update artwork are decorative; all rule text is live text. (The cover background raster is layer-named `디자인 시스템Design System, 궁극의 기본 가이드2021  디자인로그DESIGN LOG 1` — a stock-image filename, not a claim about this file. Do not read it as a title or a date.)

## The licence / IP notice — VERBATIM

`3418:9189`, fully quoted, line breaks as authored:

> 해당 파일은 NH투자증권의 디자인 자산으로 상업적 이용 및 재배포를 엄격히 금지합니다.
> 복사하여 사용하거나 수정하는 행위는 사내 업무 용도로만 가능합니다.
> NH Design System의 모든 지식재산권은 NH투자증권 플랫폼혁신부에 있습니다.

This is a **real, enforceable-looking constraint**, not boilerplate, and it is the only such notice found in the domain so far. Three operative clauses:

1. **Commercial use and redistribution are strictly prohibited** (상업적 이용 및 재배포를 엄격히 금지).
2. **Copying and modifying are permitted for internal company work purposes only** (사내 업무 용도로만).
3. **All IP rests with NH투자증권 플랫폼혁신부** (Platform Innovation Dept.) — this also identifies the **owning team**, useful for the "UI 담당자와 협의" escalation path that `nds-lib-justify` mandates for pattern deviations.

> **Practical read for anyone using this domain:** clause 2 permits the internal derivative work this skill does. Clause 1 means **NDS assets and copy must not be republished outward** — no pasting NDS component art or guide copy into public artifacts, external decks, or anything shipped outside NH투자증권. Worth surfacing in CORE, because it constrains *outputs*, not just reads.

## COMPONENTS GUIDELINES — VERBATIM

On-canvas heading (`7247:11492`), then section label (`5254:9886`), then body (`5254:9887`):

> **원하는 UI를 찾기 어려우신가요?**
>
> **COMPONENTS GUIDELINES**
>
> Component는 각자의 기능을 가진 Element의 조합을 의미합니다. NH투자증권의 Component Guidelines은 유관부서 간의 원할한 의사소통을 위해 명칭을 통일시키고 structure, usage, type, pattern에 대해 정의한 가이드라인입니다.

(`원할한` is the source spelling — standard Korean would be `원활한`. **[sic]**, preserved.)

This is the file's **definition of "Component"**: *a combination of Elements, each having its own function.* Note what the second sentence says the guidelines are **for**: **명칭을 통일** — unifying naming **for communication between related departments (유관부서 간의 원할한 의사소통)**, and defining **structure, usage, type, pattern**.

> **This reframes the whole library.** NDS's stated primary purpose is not visual consistency — it is a **shared vocabulary between departments**. That explains why `nds-lib-justify` spends its effort on naming information types rather than on pixels, and it means a component's **name** is a first-class deliverable here, not a label. It also implies the `Element` → `Component` hierarchy is normative; `Element` is used as a defined term but is **not itself defined anywhere on this page** (gap).

### The component index (`guide_parent` cards)

Below the guidelines heading, **20 `guide_parent` instances** are laid out in a 3-column grid under eight section headings (verbatim, in canvas order):

`Navigations` · `Overlays` · `Buttons` · `View` · `Inputs` · *(unlabelled row at y≈5372)* · `Indicators` · `Others`

Each card is a **visual index entry**: thumbnail + underlined (linked) Korean title + English label + one-line description. Confirmed by screenshot — e.g. the card at `5144:10284` renders:

> **Top Navigation**  Header
> 상단 내비게이션은 사용자가 머무르고 있는
> 화면의 타이틀과 주요 액션 버튼을 보여줍니다.

This is the answer to "원하는 UI를 찾기 어려우신가요?" — a browsable picture-index for people who don't know the component's name. See `nds-lib-sort-order-working-page.md` for where this card design came from and how its ordering was decided.

## Library Update — the changelog (this is the `Last update` evidence)

Frame `29331:511`, on-canvas heading **`Library Update`**. Four dated entries, verbatim (`Title` / `Time` / `Description`):

| Title | Time | Description |
|---|---|---|
| `Infographic` | **2024.06.07** | 말하는 감자를 갈아서 만드는 인포그래픽 80개 자산 |
| `Box Button` | 2024.02.15 | 리스트 안에서 쓰이는 container btn case 추가 |
| `Number Keypad` | 2024.01.31 | 기기 키패드 외에 숫자 커스텀 키패드를 제공 |
| `Indicators (step)` | 2024.01.31 | 스텝별 단계의 부가 간단한 설명이 필요한 케이스 추가 |

The frame is named `Notification - Collapsed` internally — i.e. **this is a truncated view; there are almost certainly older entries not rendered.** Treat 2024.06.07 as *the most recent update the file advertises*, and the four rows as *the newest four*, not as the whole history.

> **Most recent evidenced activity in this file: 2024.06.07.** This is the best freshness anchor found in the domain so far and should be the reference point when adjudicating whether a competing page is stale.

## Cross-file pointer — NDS_Templates

`3418:9229` renders `NDS_Templates`; the adjacent `3418:9231` renders `GO ->` and carries a **real hyperlink** (read off the text's `hyperlink` segment):

```
https://www.figma.com/file/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=1030%3A25730
```

→ **`NDS_Templates`, fileKey `1xE0qvn2yv3ZkQ9BwhKT1y`, entry node `1030:25730`.** Not currently in the domain. **Recommended next target** — and specifically the most likely home for the missing `Structure` / `Type A. 조회/요약+ Data Grid` slides that `📖 Justify`'s deck advertises but does not contain.

## ⚠️ The TOC is hand-maintained and DRIFTS — never use as a coverage denominator

The cover's TOC panel (`3408:9572` + `8154:14464`, confirmed by screenshot) reads:

> **Foundations** — Colors · Typography · Icons · Illusts · Images
> **Components** — Layout · **Navigations**: Top Navigation, Bottom Navigation, Tabs · **Button / Overlays**: Box Button, Popups · **View**: List, Card, Data Table · **Inputs**: Pulldown, Text Fields, Account, Controls, Search bar, Date Picker · **Indicators**: Indicator, Labels · **Others**: Dialog, Tooltip

**The real file has 51 pages.** The TOC lists ~25 entries. It drifts in **both** directions — this is worse than the sibling-file precedent the lead warned about, which drifted only by omission.

### Omitted by the TOC but present as real pages (16)

| Page | Why it matters |
|---|---|
| ` 📖 \bJustify______` | **The rationale page itself.** The TOC omits the document that explains the design system's reasoning — the exact failure mode the lead predicted. |
| `🌈 Graphic asset______` § | Whole section absent from TOC |
| `    - Emoji & Nmoji` | |
| `    - Infographic` | **Also the newest changelog entry (2024.06.07)** — the TOC is stale against the file's own Library Update panel |
| `    - Lottie animation` | |
| `    - Img Naming Rule` | |
| `    - Title  타이틀` | |
| `    - Chart  차트(그래프)` | |
| `    - 유의사항` | |
| `    - Number Keypad` | **Also a changelog entry (2024.01.31)** |
| `    - Security Keypad` | |
| `    - 9-patch 나인패치` | |
| `👀 Archive______` § + `- Search bar Archive` / `- Icons Archive` / `- Illusts Archive` / `- Emoji & Nmoji / Infographic Archive` / `- 썸네일` | Whole Archive section absent |
| `" "` (blank-named, last page) | see `nds-lib-sort-order-working-page.md` |

### Listed by the TOC but NOT a real page (1) — phantom

- **`Date Picker`** appears under `Inputs` in the TOC. **There is no Date Picker page among the 51.** (A `Property 1=Date Picker` variant exists in the `Component 1` set on the blank page, and `Date Picker` appears in the V2/V3 orderings — but no page.) The TOC advertises a destination that does not exist.

> **Verdict: the Welcome TOC is an artifact, not an index.** Three of its omissions (`Infographic`, `Number Keypad`, `Indicators (step)` — the last being present in TOC as `Indicator`) are contradicted **by the changelog on the very same page**, which proves the TOC was not updated when the library was. **Never use it as a coverage denominator; enumerate `figma.root.children` instead (51 pages).**

## ❓ The two `Copied to clipboard` strings — UNIDENTIFIED

Two loose TEXT nodes float above the cover at (-980, -2046) and (-980, -1997), outside every frame. Verbatim `characters` (the layer name concatenates the two lines; the real text has a newline):

| Node | Line 1 | Line 2 |
|---|---|---|
| `43376:623` | `Copied to clipboard` | **[REDACTED — 32-char base62 string; read it at the node]** |
| `43376:624` | `Copied to clipboard` | **[REDACTED — 32-char base62 string; read it at the node]** |

> 🔒 **Deliberately redacted, 2026-07-16 — do not paste the values back in.** These strings could not be
> identified as any Figma identifier (see the eliminations below), and a **32-char base62 string is the shape of an
> API token or secret**. They remain in the Figma file; the node IDs above are sufficient to inspect them at source.
> Copying an unidentified possible credential out of Figma and into this **git-tracked repo** would spread it into
> clone history for no analytic gain — the finding is "two unidentified strings live at these nodes", and that
> finding is fully preserved without the literal values.
>
> **Escalated for a human decision** (the page carries an explicit IP notice naming NH투자증권 플랫폼혁신부):
> if these are live credentials they should be **deleted from the Figma file and rotated**, not catalogued.
> They were **not tested against any API** — confirming a suspected secret by using it is not this pass's call.

**Reported as unidentified. Not recorded as componentKeys.** What was ruled out, with evidence:

- **NOT componentKeys.** Both are **32 chars, base62** (mixed case + digits). A Figma componentKey is **40 lowercase hex** — e.g. this file's real `guide_parent` key, `965da57e41718e449483f3e85afe510b30695d3b`. Wrong length, wrong alphabet.
- **NOT a fileKey.** Figma fileKeys are ~22-char base62 — confirmed twice in this very file: `72zrHgMLM4zhCjgSuTf7cC` (22) and `1xE0qvn2yv3ZkQ9BwhKT1y` (22, from the NDS_Templates link). 32 ≠ 22.
- **NOT branch keys** — branch keys use the same 22-char fileKey format.
- Neither text carries a hyperlink (checked `getStyledTextSegments(['hyperlink'])` → `null` on both).

**What they probably are — stated as inference, not fact:** `Copied to clipboard` is the exact wording of **Figma's own toast notification**. The most economical explanation is that someone copied a value, and the toast text plus the copied value got pasted onto the canvas together as literal text — i.e. **accidental debris, not content.** The 32-char base62 shape is consistent with an API token/secret or a third-party plugin identifier.

> **Recommendation: treat as untrusted debris and do not propagate.** If these *are* credentials, the correct action is not to catalogue them but to flag them for deletion — the licence notice on this same page makes the file's IP sensitivity explicit. **Surfaced to the orchestrator for a human decision; deliberately not investigated further, and deliberately not resolved by trying them against any API.**

## Gaps / unverifiable

- `Library Update` is `Notification - Collapsed` — older entries exist but are not rendered. History before 2024.01.31 is unavailable from this page.
- **`Element`** is used as a defined term in the Component definition but is never itself defined here.
- The `guide_parent` card at row y≈5372 sits under **no section heading** (the seven other rows have one) — either a missing label or an intentional continuation of `Inputs`. Blank at source; not inferred.
- The card titles are underlined, implying links, but per-card link targets were **not** individually verified this pass (only the `GO ->` hyperlink was read). A VERIFY pass should confirm the 20 cards' destinations — this is also the cheapest way to detect further TOC/index drift.
- `NDS_Templates` (`1xE0qvn2yv3ZkQ9BwhKT1y`) is unexplored.

## CORE — componentKeys found

The 20 index cards are **INSTANCEs of `guide_parent`**, whose main COMPONENT is defined on the blank page — key captured and reported in **`nds-lib-sort-order-working-page.md`**, not duplicated here.
