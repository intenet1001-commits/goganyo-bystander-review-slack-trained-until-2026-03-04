---
name: nds-ci-banks-brokerages
fileKey: KmpaYeoYh41F6nyIKvBQ7h
source_url: "https://www.figma.com/design/KmpaYeoYh41F6nyIKvBQ7h/NDS_CI?node-id=511-2"
learned_date: 2026-07-16
sections_studied:
  - "511:2 (page '은행/증권/기관' — canvas root; 3,810 nodes, 253 top-level children, ZERO components)"
  - "2827:5053 (frame '🏷' — on-canvas heading 'SVN 마이데이터 기관코드', date stamp '240328')"
  - "2887:9334 (frame '🏷' — on-canvas heading 'CDN 은행증권 코드', date stamp '240328')"
  - "3905:2873 / 3905:2872 (page heading '📌 은행/증권/기관' + the naming-grammar caption 'ss_img_company_숫자.png')"
  - "6011:183 / 6176:1662 (the two '히스토리 참고용' rebrand-comparison columns — '구 버전 CI' vs '신규 버전 CI')"
  - "3554:28 (frame 'ss_img_company_null' — the fallback/unknown-institution asset)"
status: "live — both sections carry an on-canvas date stamp of `240328` (2024-03-28), the only dated evidence on the page. No deprecation marker, no 👿, no supersede pointer, no opacity ghosting. NOT inferred from the page name. But see 'Gaps' — `240328` is the ONLY freshness signal and it is now >2 years old."
---

# NDS_CI — "은행/증권/기관" page

**This page is not a component library. It is a flat, code-keyed logo lookup table.** 3,810 nodes, 253 top-level children, and **zero COMPONENTs, zero COMPONENT_SETs**. Every asset is a bare `FRAME` whose **name is an institution code** and whose single child `GROUP` is **named for the institution**. There is nothing here to `importComponentByKeyAsync` — a build consumes this page by **exporting frames by name**, not by key.

That single structural fact drives everything below.

## ⚠️ Third-party-logo usage rule: **NONE EXISTS ON THIS PAGE**

**I am stating this as a finding, not inferring a policy.** The page has exactly **18 TEXT nodes**. I read `characters` on all 18 (not layer names). In full, they are: the two section labels + their date stamps (`SVN 마이데이터 기관코드`/`240328`, `CDN 은행증권 코드`/`240328`), one usage-context note, three column headings (`은행`, `금융투자`, `보험/캐피탈`), two `히스토리 참고용` labels, two×`구 버전 CI`, two×`신규 버전 CI`, two stray artwork labels (`savings bank`, `흥국`), the page heading `📌 은행/증권/기관`, and the grammar caption `ss_img_company_숫자.png`.

**Not one of them states a usage, permission, attribution, licensing, clear-space, or sizing rule.** This page holds **240 logo frames belonging to ~200 third-party financial institutions** — banks, brokerages, savings banks, foreign bank branches, government-adjacent funds — and carries **no IP notice of its own**. The only governing text in the whole file is NDS_Library's Welcome-page notice (`…상업적 이용 및 재배포를 엄격히 금지…사내 업무 용도로만…`), which is about **NH투자증권's** rights and says nothing about the **third parties' own** marks layered on top.

**⛔ Treat this as an open legal question, not as permission.** Absence of a rule is not a grant of one.

The single verbatim scope note that does exist (`1529:2`) is a **usage-context** note, not a permission:

> `[사용 메뉴]`
> `이체`
> `오픈뱅킹`
> `입금계좌지정서비스`
> `비대면계좌개설 > 1원 역이체 (본인인증)`

It sits at the head of the `CDN 은행증권 코드` section (x=8369, y=13641) and scopes **where that code system's logos are consumed** — four menus. It does **not** scope the SVN section.

## ⭐ A SIXTH invisibility mechanism — `get_metadata` silently drops GROUP subtrees

The brief listed five mechanisms. **This page exposes a sixth, and it is the worst one, because it fails toward false confidence.**

`get_metadata` rendered **105 of 241 top-level frames as self-closing** — i.e. `<frame id="2887:2456" name="a1aaad0000" … />`, which reads as **empty**. They are not empty. Every one of them is populated:

| Frame | `get_metadata` says | Plugin API says |
|---|---|---|
| `2887:2456` `a1aaad0000` | `<frame … />` (empty) | 1 child: `한국산업은행` **[GROUP]** |
| `2887:2476` `a1aabg0000` | `<frame … />` (empty) | 1 child: `농협은행` **[GROUP]** |
| `6011:184` `a1aajb0000` | `<frame … />` (empty) | 2 children: `케이뱅크` [GROUP, **HIDDEN**] + `케이뱅크` [GROUP] |

**The rule: `get_metadata` emits a frame's children only when they are FRAME/TEXT/VECTOR/ELLIPSE/etc. — a child of type `GROUP` causes the whole subtree to be omitted, and the parent is serialised as self-closing.** I confirmed it by rendering `6011:184`, which `get_metadata` called empty and which draws a full K-bank logo.

**Consequence:** the institution-name mapping — the single most valuable thing on this page — is **100% invisible to `get_metadata`**, because the names live on GROUP nodes. A structure-only read of this page yields 240 opaque codes and nothing else. **The mapping below was recoverable only via `use_figma`.**

Verified absent on this page: **opacity ghosting (zero nodes with opacity<1)**, **STRIKETHROUGH (zero)**, **fill-matching invisibility (none found)**, **`👿`/`제외`/`해당없음`/`deprecated`/`폐기` (zero hits)**. The mechanisms present are **`hidden="true"` (16 nodes)** and **the GROUP-omission bug above**.

## Name-reliability verdict: **RELIABLE, and unusually so — but the codes are the names**

This page inverts the usual warning. Layer names here are not decoration — **the frame name IS the primary key**, hand-maintained, and it is the only identifier that exists (no component keys). Trust it.

- **Top-level frame names — RELIABLE.** They are institution codes, in two disjoint systems (below). This is the lookup key.
- **Child GROUP names — RELIABLE AS DATA.** They carry the human institution name. This is the lookup value. **Typos are shipped — preserve them.**
- **Deep descendant names — UNRELIABLE, ignore.** `Ellipse`, `Vector`, `symbol`, `Oval Copy 21`, `Bitmap`, `image 3`, `Oval Copy 23`. Auto-generated. Also `ic_sc제일은행`, `ic_IBK`, `ic_하나` — an older `ic_` naming layer fossilised inside the artwork; **not a current namespace, do not key off it**.
- **Two stray TEXT nodes are artwork, not documentation:** `savings bank` (`2887:3708`) and `흥국` (`2887:3756`) are lettering baked into logos.

## The naming grammar — TWO disjoint code systems on one page

The page is split into two horizontal bands, each with its own `🏷` label frame and its own **independent** code system. **They do not share a key.** This is the central structural fact for a build.

### System 1 — `SVN 마이데이터 기관코드` (`2827:5053`, y≈9568, stamped `240328`)

Grammar, inferred from 169 frames (**the page states no grammar caption for this system — the caption `기관코드.png` appears only on the sibling 간편인증기관/공공기관 pages**):

> `<c><d>aa<xx>0000` — 10 chars: a letter, a digit, the literal `aa`, two letters, then `0000`

Prefix carries the **institution class**, and this is verbatim-verifiable against the on-canvas column headings:

| Prefix | Count | Class (from position under headings) |
|---|---|---|
| `a1` | 32 | 은행 — 1st-tier banks, 지방은행, 인터넷은행, 공사/기금 |
| `a2` | 4 | 외국계 은행 서울지점 |
| `a3` | 80 | 저축은행 (the bulk) |
| `a4` | 5 | 협동조합 중앙회 |
| `c1` | 48 | 금융투자 — 증권/선물/자산운용 |

**Numbering-hole analysis is meaningless for this system** — the `<xx>` slot is a sparse alphabetic allocation, not a dense counter. **Do not iterate it.** (Contrast the sibling file, where iterating `01..N` 404s.)

**One frame breaks the grammar:** `c1aacs000a` — ends `000a`, not `0000`. It sits immediately right of `c1aacs0000`, and **both are 교보증권**. This is a hand-made "second variant" suffix, not part of any stated rule. **A regex of `[a-z]\d aa [a-z]{2} 0000` will silently drop it.**

### System 2 — `CDN 은행증권 코드` (`2887:9334`, y≈13640, stamped `240328`)

**This is the one system whose grammar IS stated on canvas**, verbatim (`3905:2872`):

> `ss_img_company_숫자.png`

(`숫자` = "number". So: `ss_img_company_<number>.png`.) 70 frames. The number is the **standard Korean financial-institution code**, and it is **zero-padded to 3 digits** — `002`, `007`, `089` — which the caption's bare `숫자` does not tell you. Range `002`–`294`; **226 gaps** in `002..294`, exactly as expected for a real bank-code allocation. **Not holes — do not "fill" them, and do not iterate the range.**

The child GROUP re-states the code as a human label: `002. 산업은행`, `007. 수협은행`, `089. 케이뱅크`. **`NNN. <이름>`, dot-space separated.**

**Plus one non-numeric member — the highest-value single asset on this page:**

> **`ss_img_company_null`** (`3554:28`) — renders a grey circle with a `⋯` glyph (children: `Ellipse 2380`, `More Circle`).

This is the **null-object / fallback asset**: what the app renders for an institution code it has no logo for. It is the only frame on the page with **no institution and no solid fill**. **A build MUST wire this up** — it is the entire unknown-code path, and its name is the literal string `null`, which is a landmine for any code that does `if (!code)` or `JSON.parse`. Promote to Core.

## The code→institution mapping table — recovered, and it is what a build needs

**How institutions are keyed: by code, in two parallel systems, with the human name carried on a GROUP child. There is no mapping table on the page** — no cross-reference, no join column, nothing that says `a1aajb0000 == ss_img_company_089`. **The two systems are joinable only through the Korean institution name**, and that name is only reliable as a join key if you accept the typos below.

**⛔ This is the build's central problem, and it is unsolved at source.** Any consumer needing both systems must build and maintain the join itself.

The one place the file *implies* the join is the `히스토리 참고용` region, where `a1aajb0000` and `ss_img_company_089` sit under matching `구 버전 CI`/`신규 버전 CI` labels — both 케이뱅크. **That is a coincidence of the rebrand exhibit, not a mapping mechanism.**

### System 1 — SVN 마이데이터 기관코드 (169 frames; 166 distinct codes)

**은행 / 공사·기금 (`a1`, 32)**

| Code | Institution |
|---|---|
| `a1aaad0000` | 한국산업은행 |
| `a1aaak0000` | SC은행 |
| `a1aabg0000` | 농협은행 |
| `a1aaem0000` | 우리은행 |
| `a1aaeo0000` | 국민은행 |
| `a1aaeq0000` | 중소기업은행 |
| `a1aaer0000` | 신한은행 |
| `a1aaes0000` | 하나은행 |
| `a1aahe0000` | 미래에셋생명보험 |
| `a1aahj0000` | 카카오뱅크 |
| `a1aahp0000` | 전북은행 |
| `a1aahs0000` | 대구은행 |
| `a1aahx0000` | 수협은행 |
| `a1aaii0000` | 부산은행 |
| `a1aaim0000` | 경남은행 |
| `a1aaip0000` | 제주은행 |
| `a1aajb0000` | 케이뱅크 |
| `a1aaka0000` | 우정사업본부 |
| `a1aakb0000` | 하나저축은행 |
| `a1aalt0000` | 애큐온저축은행 |
| `a1aamw0000` | 광주은행 |
| `a1aaou0000` | 한국주택금융공사 |
| `a1aaov0000` | 한국장학재단 |
| `a1aaow0000` | 서민금융진흥원 |
| `a1aaoy0000` | 국민행복기금 |
| `a1aapf0000` | 토스뱅크 |
| `a1aaqe0000` | 한국씨티은행 |
| `a1aarc0000` | 한국농수산식품유통공사 |
| `a1aare0000` | 한국수출입은행 |
| `a1aasy0000` | 신용회복위원회 |

**외국계 (`a2`, 4)**

| Code | Institution |
|---|---|
| `a2aakc0000` | 중국은행 주식회사 서울지점 |
| `a2aals0000` | 중국공상은행 |
| `a2aarg0000` | 인도네시아느가라은행 |
| `a2aarh0000` | 홍콩상하이은행 |

**저축은행 (`a3`, 80)** — full list, verbatim, **typos preserved**:

`a3aajy0000` DB저축은행 · `a3aajz0000` **sbi**저축은행 [sic, lowercase] · `a3aakb0000` 하나저축은행 · `a3aake0000` 예가람저축은행 · `a3aakj0000` OSB저축은행 · `a3aakk0000` HB저축은행 · `a3aakl0000` 푸른저축은행 · `a3aakp0000` 다올저축은행 · `a3aakr0000` NH저축은행 · `a3aaks0000` JT친애저축은행 · `a3aakt0000` 신한저축은행 · `a3aaku0000` 웰컴저축은행 · `a3aakw0000` 금화저축은행 · `a3aakx0000` 페퍼저축은행 · `a3aaky0000` 안양저축은행 · `a3aakz0000` 부림저축은행 · `a3aala0000` 평택상호저축은행 · `a3aalb0000` 삼정저축은행 · `a3aalc0000` 세람저축은행 · `a3aald0000` 상상인저축은행 · `a3aale0000` 안국저축은행 · `a3aalf0000` JT저축은행 · `a3aalg0000` 영진저축은행 · `a3aalh0000` 한화저축은행 · `a3aali0000` 인천저축은행 · `a3aalk0000` 모아저축은행 · `a3aall0000` 인성저축은행 · `a3aalm0000` 남양저축은행 · `a3aaln0000` 융창저축은행 · `a3aalp0000` 조은저축은행 · `a3aalq0000` 민국저축은행 · `a3aalt0000` 애큐온저축은행 · `a3aalu0000` **sky**저축은행 [sic] · `a3aalw0000` 대신저축은행 · `a3aalx0000` 애큐온저축은행 · `a3aaly0000` 유안타저축은행 · `a3aalz0000` 바로저축은행 · `a3aamc0000` KB저축은행 · `a3aame0000` **키움yes 저축은행** [sic — lowercase + inner space] · `a3aamf0000` 더케이저축은행 · `a3aami0000` **ck**저축은행 [sic] · `a3aamk0000` 우리금융저축은행 · `a3aamn0000` **상상인 플러스저축은행** [sic — space after 상상인] · `a3aamo0000` 아산저축은행 · `a3aamp0000` **O2저축은힝** [sic — 은힝, should be 은행] · `a3aamq0000` 삼호저축은행 · `a3aamr0000` **smart**저축은행 [sic] · `a3aams0000` 센트럴저축은행 · `a3aamt0000` 더블저축은행 · `a3aamv0000` 동양저축은행 · `a3aamx0000` 대한저축은행 · `a3aamy0000` 한국투자저축은행 · `a3aamz0000` 스타저축은행 · `a3aana0000` MS저축은행 · `a3aanb0000` 대백저축은행 · `a3aanc0000` 유니온저축은행 · `a3aand0000` 대아저축은행 · `a3aane0000` 머스트삼일저축은행 · `a3aanf0000` 참저축은행 · `a3aang0000` 드림저축은행 · `a3aanh0000` 라온저축은행 · `a3aani0000` 흥국저축은행 · `a3aanj0000` 국제저축은행 · `a3aank0000` 고려저축은행 · `a3aanm0000` 우리저축은행 · `a3aann0000` DH저축은행 · `a3aano0000` SNT저축은행 · `a3aanp0000` IBK저축은행 · `a3aanq0000` 조흥저축은행 · `a3aanr0000` 진주저축은행 · `a3aans0000` 솔브레인저축은행 · `a3aant0000` 동원제일저축은행 · `a3aanx0000` 키움저축은행 · `a3aaph0000` 상호저축은행중앙회 · `a3aapo0000` 청주저축은행 · `a3aapp0000` 한성저축은행 · `a3aapq0000` 대명저축은행 · `a3aapr0000` 대원저축은행 · `a3aaps0000` BNK저축은행 · `a3aapt0000` 오성저축은행

**중앙회 (`a4`, 5)**

| Code | Institution |
|---|---|
| `a4aaaz0000` | **농업혐동조합중앙회** [sic — 혐동, should be 협동] |
| `a4aagc0000` | 산림조합중앙회 |
| `a4aagd0000` | 수산업협동조합중앙회 |
| `a4aakm0000` | 신용협동조합중앙회 |
| `a4aapa0000` | 새마을금고중앙회 |

**금융투자 (`c1`, 48)**

`c1aaap0000` 삼성선물 · `c1aaaq0000` 유진투자선물 · `c1aabq0000` 이베스트투자증권 · `c1aabr0000` 키움증권 · `c1aabs0000` 흥국증권 · `c1aabu0000` IBK투자증권 · `c1aabv0000` 케이프투자증권 · `c1aacn0000` 유화증권 · `c1aaco0000` 한국증권금융 · `c1aacq0000` **NH투자증권** · `c1aacs0000` 교보증권 · **`c1aacs000a` 교보증권** ⚠️ · `c1aact0000` 한국투자증권 · `c1aacu0000` 미래에셋증권 · `c1aacv0000` 상상인증권 · `c1aacx0000` 한양증권 · `c1aacy0000` 한화투자증권 · `c1aacz0000` 메리츠증권 · `c1aada0000` KB증권 · `c1aadb0000` 유진투자증권 · `c1aadc0000` 유안타증권 · `c1aadd0000` 현대차증권 · `c1aadf0000` 신한투자증권 · `c1aadi0000` DB금융투자 · `c1aadp0000` 코리아에셋투자증권 · `c1aaey0000` 삼성증권 · `c1aafb0000` SI증권 · `c1aagu0000` 카카오페이증권 · `c1aahw0000` 토스증권 · `c1aaij0000` 하이투자증권 · `c1aaik0000` BNK투자증권 · `c1aaje0000` 신영증권 · `c1aajg0000` DS투자증권 · `c1aajn0000` 부국증권 · `c1aakn0000` 하나증권 · `c1aako0000` 대신증권 · `c1aapd0000` 우리종합금융 · `c1aapv0000` 다올투자증권 · `c1aapw0000` SK증권 · `c1aaqc0000` 삼성자산운용 · `c1aaqd0000` 우리투자증권 · `c1aaqf0000` 리딩투자증권 · `c1aaql0000` 한화자산운용 · `c1aara0000` NH선물 · **`c1aarv0000` KCGI자산운용(구 메리츠자산운용)** · `c1aazs0000` 에셋플러스자산운용 · `c1abad0000` KR투자증권 · `c1abbg0000` 한국스탠다드차타드증권

### System 2 — CDN 은행증권 코드 (70 frames)

`002` 산업은행 · `003` 기업은행 · `004` 국민은행 · `007` 수협은행 · `011` 농협은행 · `012` 지역 농축협 · `020` 우리은행 · `023` SC은행 · `027` 한국씨티은행(한미은행) · **`030` → `007. 수협은행` ⚠️ MIS-KEYED** · `031` 대구은행 · `032` 부산은행 · `034` 광주은행 · `035` 제주은행 · `037` 전북은행 · `039` 경남은행 · `045` 새마을금고 · `048` 신협 · `050` 저축은행 · `054` HSBC · `055` 도이치은행 · `057` 제이피모간체이스은행 · `058` 미즈호은행 · **`059` → `ic_엠유에프지은행` ⚠️ GRAMMAR BREAK** · `060` 뱅크오브아메리카(BOA) · `061` **비엔피파리바은행** [sic — no space after `061.`] · `062` 중국공상은행 · `063` 중국은행 · `064` 산림조합 · `067` 중국건설은행 · `071` 우체국 · `081` 하나은행 · `088` 신한은행 · `089` 케이뱅크 · `090` **카카오뱅크** [sic — `090.카카오뱅크`, no space] · `092` 토스뱅크 · `209` 유안타증권 · `218` KB증권 · `221` 상상인증권 · `224` BNK투자증권 · `225` **IBK투자증권 ** [sic — trailing space] · `226` KB증권(구.KB투자증권) · `227` 다올투자증권 · `230` 미래에셋대우(구. 미래에셋증권) · `238` 미래에셋대우 · `240` 삼성증권 · `243` 한국투자증권 · `247` NH투자증권 · `261` 교보증권 · `262` **하이투자증권** [sic — `262.하이투자증권`, no space] · `263` 현대차증권 · `264` 키움증권 · `265` LS증권 · `266` SK증권 · `267` 대신증권 · `269` 한화투자증권 · `270` 하나증권 · `271` 토스증권 · `278` 신한투자증권 · `279` DB금융투자 · `280` 유진투자증권 · `287` 메리츠종합금융증권 · `288` 카카오페이증권 · `290` 부국증권 · `291` 신영증권 · `292` 케이프투자증권 · `294` 우리투자증권 · **`null` → fallback ⋯ asset**

## The `히스토리 참고용` rebrand exhibit — a documented convention, read by render

Two small columns sit far left (x≈4931–5500), **outside both main grids**, each headed `히스토리 참고용` ("for historical reference"):

- `히스토리 참고용 - SVN 마이데이터` (`6011:183`, y=9793) — `구 버전 CI` (`2887:2805`, x=4931) vs `신규 버전 CI` (`6011:184`, x=5259). Both named `a1aajb0000`.
- `히스토리 참고용 - CDN 은행증권` (`6176:1662`, y=13660) — `구 버전 CI` (`2887:5440`, x=4931) vs `신규 버전 CI` (`6176:1696`, x=5292). Both named `ss_img_company_089`.

**I rendered all of them.** The exhibit documents **one** rebrand — 케이뱅크:

- **`구 버전 CI`** = a **`Kbank` wordmark**, white on deep navy.
- **`신규 버전 CI`** = a **`K` monogram**, white on brighter blue.

**And here is the mechanism that matters:** the *live* grid frames (`a1aajb0000` at 8494/10295 and `ss_img_company_089` at 7054/14704) each contain **two GROUPs both named `케이뱅크`, of which the first is `visible: false`**. The old CI is **retained, hidden, inside the live frame**. Rendering the live frame gives the new K monogram — byte-identical to the `신규 버전 CI` exhibit (I diffed the PNGs: both 4310 bytes).

> **⭐ File convention: on this page, a superseded logo is not deleted and not ghosted with opacity — it is kept as a `visible:false` sibling GROUP inside the same code-named frame, and the rebrand is additionally exhibited in a `히스토리 참고용` column.** This is a **different** convention from the sibling file's `opacity: 0.10/0.30/0.5` ghosting, which is **entirely absent here**. Do not go looking for opacity on this page; look for hidden siblings.

**Scope limit, stated plainly:** the exhibit covers **케이뱅크 only**. It is not a general changelog. The 16 hidden nodes on the page are: 4× `케이뱅크` GROUP (the four rebrand frames) + their 4 `Ellipse` backings, 1× `scale guide` INSTANCE, and 7 stray hidden RECTANGLEs (`신용회복위원회 1`, `부림저축은행 1`, `조은저축은행 1`, `대한저축은행`, `img 1`, `a3aapo0000`, `DS투자증권 1`) — the `… 1` suffix suggests abandoned duplicate artwork, **not** a version archive. **Do not read those seven as rebrands.**

## Exact counts — `.length`, and the heading disagreement

**There is no count heading on this page to contradict** (contrast `Nmoji: 142개` in the sibling file). All figures below are `.length`.

| Measure | Count |
|---|---|
| Total nodes (`findAll`) | **3,810** |
| Top-level children | **253** (241 FRAME + 12 TEXT) |
| TEXT | **18** |
| **COMPONENT** | **0** |
| **COMPONENT_SET** | **0** |
| INSTANCE | **1** (`scale guide`, hidden) |
| SVN institution-code frames | **169** (166 distinct codes) |
| CDN `ss_img_company_*` frames | **70** (67 distinct numeric + `null` + 2 history dupes) |
| Nodes with `opacity < 1` | **0** |
| `visible:false` nodes | **16** |
| STRIKETHROUGH segments | **0** |
| Frames `get_metadata` wrongly called empty | **105** |

**⚠️ The one real heading-vs-reality disagreement — and it is a heading promising assets that do not exist:**

Three column headings sit at y=9793: `은행` (x=7054), `금융투자` (x=9617), **`보험/캐피탈` (x=12290)**.

**The `보험/캐피탈` column is EMPTY.** The right-most asset frame on the entire page is at **x=11769** (`c1aacq0000` NH투자증권 / `c1aadb0000` / `c1aaij0000` / `c1aaqc0000`). Nothing exists at or beyond x=12290. **`보험/캐피탈` is a heading over zero assets** — either a planned section never filled, or one whose contents were removed without removing the heading.

Corroborating the gap: the page's only insurance asset, **`a1aahe0000` 미래에셋생명보험**, is filed at x=8974 — **under `은행`, not under `보험/캐피탈`**. The taxonomy is broken in both directions.

## Conflicts / LEDGER candidates

1. **⛔ `ss_img_company_030` is MIS-KEYED — its child GROUP is `007. 수협은행`.** `ss_img_company_007` (x=7774) *also* holds `007. 수협은행`. So **030 and 007 are duplicate assets, and 030's own name contradicts its own contents.** In the standard Korean bank-code table `030` is **not** 수협. **A build keying on the frame name gets 수협은행 for code 030 — wrong. A build keying on the GROUP label gets 007 twice and never resolves 030.** Highest-severity conflict on the page. Unresolved at source.
2. **`ss_img_company_059`'s child is `ic_엠유에프지은행` — the ONLY CDN member that breaks the `NNN. <이름>` label grammar.** No number prefix, and it carries the fossil `ic_` prefix. Any parser doing `label.split('. ')` returns garbage for 059. (059 = MUFG.)
3. **`c1aacs0000` and `c1aacs000a` are both 교보증권.** Two codes, one institution, and `000a` breaks the `0000` grammar. One is presumably dead; **the page says nothing about which**. Unresolved.
4. **`하나저축은행` has two codes: `a1aakb0000` (filed under 은행) and `a3aakb0000` (filed under 저축은행).** Note the `<xx>` slot is identical (`kb`) — only the class prefix differs. **A name→code lookup is not 1:1.**
5. **`애큐온저축은행` has THREE codes: `a1aalt0000`, `a3aalt0000`, `a3aalx0000`.** Two share the `lt` slot across classes (same pattern as #4); `a3aalx0000` is a genuine third. **The worst name→code collision on the page.**
6. **CDN duplicates by institution:** `218 KB증권` vs `226 KB증권(구.KB투자증권)`; `230 미래에셋대우(구. 미래에셋증권)` vs `238 미래에셋대우`. In both pairs the `(구. …)` member is the **legacy merged entity retained under its own code**. **These are correct-by-design** (real distinct bank codes) — recorded so a future reader does not "fix" them. Note `(구.KB투자증권)` has no space after the dot while `(구. 미래에셋증권)` does — **inconsistent, cosmetic**.
7. **Cross-system join is UNDOCUMENTED.** `a1aajb0000` and `ss_img_company_089` are both 케이뱅크; `a1aahx0000` and `ss_img_company_007` are both 수협은행. **The file states no mapping.** Joining on the Korean name requires first fixing #2, #3, #4, #5, and the typos. **⛔ This is the single biggest blocker to a build that needs both systems.**
8. **Shipped typos in institution names — do NOT silently "fix", they are the data:** `O2저축은힝` (은행), `농업혐동조합중앙회` (협동), `sbi`/`sky`/`smart`/`ck` (lowercase where siblings are uppercase), `키움yes 저축은행`, `상상인 플러스저축은행`, `IBK투자증권 ` (trailing space), `061.비엔피파리바은행` / `090.카카오뱅크` / `262.하이투자증권` (missing space after the dot).
9. **`ic_` is a fossil namespace, not a live one.** `ic_sc제일은행`, `ic_IBK`, `ic_하나`, `ic_엠유에프지은행` survive deep inside artwork. **Note `ic_sc제일은행` vs the frame's own `SC은행`** — the artwork remembers the pre-rebrand name (SC제일은행 → SC은행). Interesting as provenance; **useless as a key**.
10. **`보험/캐피탈` heading over an empty column** (see Counts). LEDGER-worthy: a consumer reading headings would expect an insurance logo set that does not exist.

## Gaps / unverifiable

- **`240328` is the ONLY freshness signal, and it is thin.** Both `🏷` frames carry it (`2827:5055`, `2887:9336`) — I rendered `2827:5053` to confirm it is legible (gold-on-dark, visible). Read as **2024-03-28**, this predates `learned_date` by >2 years. There is **no `Last update` label** in the file's usual form; the stamp is a bare 6-digit string next to a section name, and **`240328` is an inferred date format** — the page never says it is a date. Two institutions on the page postdate it in the real world; I did not attempt to verify the inventory against reality.
- **Component keys: NONE EXIST.** `page.findAllWithCriteria({types:['COMPONENT','COMPONENT_SET']})` returns **0** for both. There is nothing to report in the componentKeys section, and nothing to verify with `importComponentByKeyAsync`. **This is not a coverage gap — it is the page's structure.** `getMainComponentAsync()` was not applicable (the page's 1 INSTANCE is the hidden `scale guide`).
- **`scale guide` (`2887:2739`) is a hidden INSTANCE inside `a1aahj0000` (카카오뱅크).** Almost certainly the sizing/clear-space guide that would answer "how big should a logo be inside the 200×200 frame". **Per method I did not quote its contents as a rule.** Its main component is elsewhere in the file. ⚠️ **Follow-up: resolve `scale guide` via `getMainComponentAsync()` — it is the most likely home of the sizing rule this page otherwise lacks.**
- **All asset frames are 200×200.** Uniform, verified across all 241. **The page never states this as a rule** — no export-multiplier note, no `@2x/@3x`, no clear-space spec. The `.png` in `ss_img_company_숫자.png` implies raster export; **the multiplier is unstated**.
- **I did not verify the 105 GROUP-omitted frames one-by-one by render.** I confirmed the omission mechanism on 9 sampled frames and recovered all 241 names structurally via `use_figma`. The *names* are exact; I rendered only 5 logos (both 케이뱅크 pairs + `null`). **A logo could be visually wrong/blank inside a correctly-named frame and I would not have caught it.**
- **Provenance:** no pasted-image/screenshot nodes found (contrast the sibling pages' Highcharts docs and 원티드 talk). Every asset is native vector/bitmap artwork inside a GROUP. **Nothing on this page is a foreign document posing as a rule.**
- The `[사용 메뉴]` note is positioned in the CDN band but **its scope is not stated** — I have read it as scoping the CDN section by position alone. It may be intended page-wide. **Low confidence; positional inference only.**
