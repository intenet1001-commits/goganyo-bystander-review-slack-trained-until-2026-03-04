---
name: nds-lib-icons
fileKey: 72zrHgMLM4zhCjgSuTf7cC
source_url: "https://www.figma.com/design/72zrHgMLM4zhCjgSuTf7cC/NDS_Library?node-id=476-10295"
learned_date: 2026-07-16
sections_studied:
  - "476:10295 (page '    - Icons' — canvas root; 1,454 nodes, 143 COMPONENT_SETs, 705 COMPONENTs)"
  - "2402:13166 (frame '1. Icon' — on-canvas heading 'Icon' / 'QV-NM Icon', body 'nds_icon 이전 리소스와 구분되는 NDS만의 아이콘 입니다.')"
  - "9244:16154 (frame 'Icon_color usage' — on-canvas heading '🔥 필수 🔥 아이콘 쓰실 디자이너들! 확인하세요!' — the icon color-number legend; THE load-bearing rule of this page)"
  - "2514:14133 (frame '3. Trading' — on-canvas heading '🔮 주식 거래, 차트, 현재가, 등락률')"
  - "2514:14123 (frame '4.flag' — on-canvas heading 'Flag icon' / 'QV-NM Icon', subheading '국기, 해외, 국가코드')"
status: "live — 143 COMPONENT_SETs all resolve as local (remote:false) source components in the library's own home file; no deprecation marker, no supersede pointer. NOT inferred from the page name. See 'Gaps' for the absence of a Last update stamp."
---

# NDS_Library — "    - Icons" page

The icon system's source of truth. **1,454 nodes: 705 COMPONENTs across 143 COMPONENT_SETs, plus 19 standalone COMPONENTs, 404 TEXT nodes, 58 INSTANCEs.** Do not attempt to read this page as a flat list — read it as (1) a color-number contract, (2) a naming grammar, (3) sixteen functional sections.

## Name-reliability verdict: MIXED — and the mix is *systematic*, which makes it usable

This page uses **three different naming conventions simultaneously**, and you must know which you're looking at:

1. **Component/set names — RELIABLE.** `nds_icon_search`, `nds_flag`, `nds_icon_header` etc. are real, hand-maintained identifiers matching the shipped naming grammar. Variant names (`Color=3, Height=h30`) are structured and machine-readable. **Trust these.**
2. **TEXT layer names — RELIABLE AS CONTENT, but they are documentation *about* components, not the components.** A TEXT node named `nds_icon_search(컬러넘버)_(크기)` is a **caption describing the naming rule**, not a component named that. Confusing the two would manufacture ~50 phantom components. **The `(컬러넘버)` / `(크기)` parenthesised tokens are placeholders in a grammar, not literal name parts.**
3. **Container frames — UNRELIABLE, ignore them.** `Frame 123507`, `Frame 123518`, `Group 9689` — auto-generated Figma junk. Note `Frame 123518` and `Frame 123553` each appear on **multiple different sections** with unrelated contents. Never key off these.

**Rules ARE partly embedded in rendered-only form.** The color-number legend (`9244:16154`) is the critical case: its *values* exist as TEXT nodes (`2`, `023`, `333333`), but the **column semantics — which number is the 컬러넘버, which is the token, which is the hex — exist only as spatial layout.** Reading the names alone gives you a bag of digits in no order. **I recovered the mapping by screenshot.** No `스크린샷 ...`-style pasted-image nodes were found on this page, so nothing is locked inside a raster — but layout-encoded meaning is just as opaque to a structure-only read.

## 🔥 THE load-bearing rule: icon color numbers (`9244:16154`)

Frame `Icon_color usage`, headed verbatim:

> `🔥 필수 🔥 아이콘 쓰실 디자이너들! 확인하세요!`

**기본 아이콘 컬러넘버** (`기본 아이콘 컬러넘버 👇`, node `9244:16228`) — screenshot-transcribed, columns are `swatch | 컬러넘버 | 토큰 | hex`:

| 컬러넘버 | 토큰 | hex |
|---|---|---|
| **2** | `023` | `333333` |
| **3** | `013` | `666666` |
| **4** | `024` | `999999` |
| **5** | `074` | `C5C5C5` |
| **6** | `063` | `FFFFFF` |

**예외 넘버** (`예외 넘버`, node `9274:16379`) — explicitly segregated as *exceptions*, not part of the default palette:

| 컬러넘버 | 토큰 | hex |
|---|---|---|
| **1** | `004` | `000000` |
| **7** | `127` | `DDDDDD` |

Governing sentence, verbatim (in a callout bubble at the foot of the legend):

> `😈 최대한 이 안에서 사용하되, 추가적인 컬러가 필요하다면 디자인팀 내 논의를 통해 컬러를 추가도록 합시다.`

**This is the decoder ring for the entire page.** Every `Color=3` / `Color=4` / `Color=05` variant axis across all 143 sets resolves through this table. Without it, `Color=3` is meaningless; with it, `Color=3` = `#666666`. **Promote this table to Core — it is the highest-leverage single artifact I found across all five of my pages.**

Note the `2/3/4/5/6` default band is a **grey ramp only** (333333 → FFFFFF). Colored icons (red/blue/green) are handled outside the 컬러넘버 system via explicit axis values like `Color=red`.

## The naming grammar

The dominant caption pattern, appearing ~50× verbatim:

> `nds_icon_<name>(컬러넘버)_(크기)`

Variants of the grammar, all quoted verbatim from TEXT nodes:

- `nds_icon_arrow(컬러넘버)_(방향)(크기)` — adds direction
- `nds_icon_goarrow(컬러넘버)_(방향)(크기)`
- `nds_icon_accountarrow(컬러넘버)_(방향)`
- `nds_icon_controlarrow(컬러넘버)_(방향)`
- `nds_icon_call(컬러넘버)` · `nds_icon_kebab(컬러넘버)` · `nds_icon_meatball(컬러넘버)` · `nds_icon_link(컬러넘버)` · `nds_icon_filter(컬러넘버)` · `nds_icon_fabarrow(컬러넘버)` · `nds_icon_linkarrow(컬러넘버)` · `nds_icon_reload(컬러넘버)` · `nds_icon_hamburger(컬러넘버)` · `nds_icon_handle(컬러넘버)` — no size axis
- `nds_icon_changearrow(컬러넘버)_크기` — **note: bare `크기`, no parens.** Inconsistent with every sibling.
- `nds_icon_id_(타입)(컬러)_(크기)` and `nds_icon_opennew(컬러)_(크기)` — **note: `(컬러)` not `(컬러넘버)`.** Two exceptions to the grammar.
- `nds_icon_ai_(크기)` — no color axis at all
- `nds_flag_circle/square_(국가코드)` — flags use their own grammar
- **`ms_btn_` family** (a separate namespace — buttons, not icons): `ms_btn_fav(타입)(컬러넘버)_nn/sn`, `ms_btn_memo(컬러넘버)_nn/sn`, `ms_btn_alarm(컬러넘버)_nn/sn`, `ms_btn_heartline(컬러넘버)_nn/sn(_black)`, `ms_btn_calendar(컬러넘버)_nn/sn`. The `nn/sn` suffix pairs with the `Status=[nn|sn]` variant axis.
- **`nds_img_` / `ss_img_` families** — images, not icons: `nds_img_bi_qv`, `nds_img_bi01`, `nds_img_bi_ima01~03`, `nds_img_ci_nh`, `nds_img_bi_nm02`, `ss_img_2022home_newcircle`.
- `nds_icon_ci_n201`, `nds_icon_ci_n202` — CI logo icons.

## Verbatim usage constraints (narrow, easy to miss, high-consequence)

- `16 사이즈는 상품설명/약관 pdf 다운로드 버튼에만 사용` (`16713:15434`) — **h16 download icon is restricted to one context.**
- `30 사이즈는 가로종합주문에서 사용` (`49112:1333`) — h30 setting icon scoped to 가로종합주문.
- `(흰바탕에사용) nds_icon_tooltip02(그레이배경에 사용)` (`10219:15865`) — tooltip 01 on white, 02 on grey. **Note the copy is malformed: `01` is never named, only implied by the leading bare `(흰바탕에사용)`.**
- `👆 As-is h60을 폼디에서 사이즈 수정하여 사용` (`10563:15652`)
- `ss_img_filter로 반영되어있음` (`56835:658`) — filter is shipped as an image, not an icon.
- **Brand color rule** (`39114:271`), verbatim and important enough to promote:
  > `브랜드 로고의 메인 컬러는 Deep Blue 입니다. Deep Blue(#002A41)는 바탕색으로 사용하지 않습니다. 필요한 경우 Dark Blue(#064367) 를 대신 사용합니다.`
  → **`#002A41` is a foreground-only brand color; `#064367` is its background substitute.** This is a hard prohibition, not a preference.
- Section intro (`6165:14179`): `이전 리소스와 구분되는 NDS만의 아이콘 입니다.`
- Specific-icon intro (`10673:15479`): `사용 위치가 명확한 NDS 아이콘 입니다.`
- Filter/account arrow scoping: `상품 필터에서 사용되는 화살표 입니다.` (`14856:15424`), `계좌컨트롤에서 사용되는 화살표 입니다.` (`22243:17151`)

## Sections (16, all prefixed `🔮` on canvas)

`🔮 주식 거래, 차트, 현재가, 등락률` · `🔮 표, 테이블` · `🔮 Multi Status` · `🔮 FAB` · `🔮 불릿, 아이콘불릿` · `🔮 Ci, Bi, 로고, 앱아이콘` · `🔮 관심그룹` · `🔮 내비게이션` · `🔮 메뉴` · `🔮 홈` · `🔮 마이데이터` · `🔮 나무멤버스` · `🔮 기타` · `🔮 완료팝업` · `🔮 현재가` · `🔮 잔고`

Top-level frames: `1. Icon` (`2402:13166`, 2820×6756) · `2. Specific Icon` · `3. Trading` (`2514:14133`) · `4.flag` (`2514:14123`) · `Icon_color usage` (`9244:16154`).

## CORE — componentKeys found

**143 COMPONENT_SETs on this page, ALL `remote: false` → tier (a) published-library source components, viewed from inside their home file.** Consuming files see these as `remote:true`. **These are the canonical SET keys — use `importComponentSetByKeyAsync`.** Below is the high-value subset (full 40-hex, KIND=**COMPONENT_SET**, with real variant axes). I deliberately did **not** transcribe all 705 variant COMPONENTs — per method, the pattern + SET keys + counts are the deliverable.

| Set name | Full SET key (40-hex) | Variants | Axes |
|---|---|---|---|
| `nds_icon_header` | `19619c9f1fd2e3c2e6515542d0484e651f3f30c6` | 81 | `Type=[close\|mic\|back\|stock\|bell\|gift\|kebab\|setting\|cs\|my\|search\|share\|tooltip\|ranking\|calendar\|ms_btn_pwopen_nn\|ms_btn_pwopen_sn\|ms_btn_pwsave_nn\|ms_btn_pwsave_sn\|ss_btn_pwnosave\|home\|alamset\|info\|recharge\|bellnew\|guide\|history\|make\|mynew\|Table\|Easy\|ms_btn_heart_nn\|ms_btn_heart_sn\|filter\|filternew\|cs02\|searchnew]`, `Color=[2\|6]`, `Darkmode=[false\|true]` |
| `nds_flag` | `d81573482ffbff1e5076384753d483a3072d775f` | 56 | `Type=[Circle\|Square]`, `Country=[KRW(한국)\|GBP(영국)\|AUD(호주)\|BRL(브라질)\|CAD(캐나다)\|CHF(스위스)\|CNY(중국)\|DKK(덴마크)\|EUR(유럽)\|FRA(프랑스)\|GER(독일)\|HKD(홍콩)\|IDR(인도네시아)\|INR(인도)\|JPY(일본)\|MXN(멕시코)\|NOK(노르웨이)\|NZD(뉴질랜드)\|RUB(러시아)\|SEK(스웨덴)\|SGD(싱가폴)\|THB(태국)\|TWD(대만)\|USD(미국)\|ZAR(남아공)\|VND(베트남)\|NLD(네덜란드)\|Global(디폴트)]` — **28 countries × 2 shapes. Country codes are ISO-4217 *currency* codes, not country codes, despite the `(국가코드)` caption.** |
| `nds_icon_arrow` | `dde648604e4d08cc6b99c44dda81ec73ccbb4b15` | 34 | `Color=[03\|04\|05\|06\|01]`, `Type=[left\|down\|right\|up]`, `Height=[h24\|h16]` |
| `nds_icon_step` | `be9d70861f0510a5ea083d0c20360aafae7f4c56` | 30 | `Channel=[NM\|QV]`, `Step=[pre\|01..07\|next01..next07]` |
| `nds_icon_bullet` | `eb1ab3ac46e5e6e5c1c6539e7334ac2b3e922e4f` | 26 | ⚠️ **axes unreadable — see Gaps** |
| `rate` | `6b15826624212f3b4d3a280c37f7181209ec45f5` | 13 | `Type=[down\|upper\|lower\|up\|flat]`, `Height=[12\|16\|14]`, `White=[true\|false]` |
| `nds_btn_view` | `d8c71507e1e03cdcd26f353a0877cd61414ada7c` | 12 | `Type=[카드\|표\|차트\|리스트\|2단분할(태블릿전용)\|파이]`, `Active=[off\|on]` |
| `nds_icon_info` | `a8c8213957d82b75453df70541d4de215db3c24d` | 9 | `Color=[3\|4\|5\|6\|red]`, `Height=[h30\|h22\|h16]` |
| `nds_icon_notify` | `6c415989d820c034ba1efffeb03ef16fa0effdae` | 9 | `Property 1=[01 주문\|02 계좌\|03 금융상품\|04 서비스\|05 대출대차\|06 내정보\|07 기타\|08_한도\|Variant9]` |
| `nds_icon_close` | `66bbb0807fc9e3046ba2b4b8d08a6c89f7f03451` | 8 | `Color=[3\|4\|5\|6]`, `Height=[h22\|h30]` |
| `ss_img_quickbar` | `80fc818618096f42616ee1ec5f8f6f45a5fb1a4b` | 8 | `Type=[normal_NM\|normal_QV\|close\|setting\|global\|chatbot\|ticker\|switcher]` |
| `nds_icon_quick_component` | `756f6ea285b1accd76cc09ad3dd9cdc5fd42f321` | 8 | `Type=[game\|global\|chatbot\|graph\|record\|star-off\|star-on\|setting]` |
| `nds_icon_edit` | `b7608e89f9562b393cd9172b42a13bae81c0e3ec` | 7 | `Color=[4\|5\|3]`, `Height=[h16\|h22\|h30]` |
| `percent_box` | `1c2e0ea796ddd8ccf913eb6e5249a191f779e1c0` | 7 | `Type=[increase\|decrease\|no change]`, `Dark mode=[off\|true\|on]` ⚠️ 3-valued boolean |
| `nds_icon_search` | `b4157e53ce0e772dac9b0836dee81a8a472dfe26` | 4 | `Color=[3\|4]`, `Height=[h30\|h22]` |
| `nds_icon_calendar` | `fcbaea03154bb33f07f7ea60f98842c7cce25754` | 4 | `Color=[4\|5\|3]`, `Height=[h22\|h30]` |
| `nds_icon_bi` | `730d28715305eb22aa0e19b925521fc54fa96c96` | 4 | `Channel=[N2\|NM]`, `Darkmode=[Off\|On]` |
| `nds_img_bi01` | `34b2d3697a482dcc474d2b651b151b76033e47c0` | 4 | `channel=[NM\|N2]`, `Darkmode=[true\|false]` |
| `nds_icon_id` | `2aaf5154445da255c5787a87996a0e9548a05fb1` | 5 | `Type=[face\|fingerprint\|password]`, `Color=[3\|4]`, `Size=[100\|24]` |
| `nds_icon_table_sort` | `aa207ca9f9b54419e1bfc464ab9046c55780cb4a` | 6 | `Status=[low\|default\|high]`, `Dark mode=[on\|off]` |
| `nds_icon_banginfo` | `b4d2ea50bb6eae5ec8e3786a8ead24bd79bcecaf` | 6 | `Color=[3\|5\|red\|4]`, `Height=[h30\|h22]` |
| `icon_comm_complate/warning` | `bd8e167c6f55b50541eaafb51cd867468da3af7b` | 6 | `Channel=[QV\|NM\|Gray]`, `Result=[Success\|Failed]` — **name is a typo for "complete"** |
| `nds_icon_menu` | `9bc511d2e0676903ee9be6cdeb26598d234604b7` | 6 | `Type=[login\|logout\|person\|setting\|home\|\bexchange]` ⚠️ `\b` control char |
| `nds_icon_filterarrow` | `38b43a1b603b0955d21ef3f80e4a0a3d3bf4add4` | 5 | `Color=[5\|2\|22-NM\|22-QV\|17]` |
| `nds_icon_plus` | `3efaf821e6ab49731c52901332200c6927651658` | 6 | `Color=[3\|4\|5\|6\|32]`, `Height=[h22\|h40]` |
| `nds_icon_minus` | `9cd86d0697eb564f432feee574eaa21e808b0077` | 5 | `Color=[3\|4\|5\|32]`, `Height=[h22\|h40]` |
| `nds_icon_setting` | `9f0fbe93143508524996eef03c43fba70c364502` | 5 | `Color=[4\|5\|4(solid)\|6]`, `Height=[h22\|h30]` |
| `rate_home` | `bc45e1afc2e39e964eb80de9af27dea69606bd1f` | 6 | `Type=[increase\|decrease\|nochange]`, `Gray=[false\|true]` |
| `rate` | `2310bdf5a4add5e5bcb18668a27d2fe41359d68b` | 6 | `Type=[increase\|decrease\|nochange]`, `Gray=[true\|false]` |
| `nds_icon_export` | `bf86d806647fdad26c65a44dbe9690582f3bf134` | 6 | `Color=[3\|5\|4]`, `Height=[h30\|h22]` |
| `nds_icon_accountarrow` | `07bcbf522f407a3aab843932e3d1222f05358cf5` | 6 | `Color=[05\|02\|04]`, `Type=[down\|up]` |
| `ss_img_2022home_morebank` | `b966ea4b88e724081ee48b35881e47c46ed68804` | 6 | `darkmode=[off\|on]`, `name=[ss_home_more\|ss_home_more_small]`, `Height=[h60\|h30]` |
| `nds_icon_download` | `7e02725de161d5324ee44b7df274fe424f00458f` | 5 | `Color=[3\|5\|4]`, `Height=[h30\|h22\|h16]` |
| `nds_icon_share` | `5bed169a3a82609ffe4d927661628af3e2ba37ad` | 4 | `Color=[5\|4\|3]`, `Height=[h22\|h30]` |
| `nds_icon_copy` | `f451722dbf577664a468548f6cfdd4ae2b6e7965` | 4 | `Color=[3\|5]`, `Height=[h30\|h22]` |
| `nds_icon_exchange` | `3aac7e8bb4b0a48c92103b25f4155b322d8023b2` | 3 | `Color=[3\|4]`, `Height=[h16\|h34]` |
| `nds_icon_delet` | `74eac710a62949cb0702187de2b05bd9d206f105` | 4 | `Color=[4\|5]`, `Height=[h22\|h30]` — **name is a typo for "delete"** |
| `nds_icon_bin` | `46c77de29d6ca828cde5465e2006d38d7b7b1af0` | 3 | `Color=[5\|4]`, `Height=[h30\|h22]` |
| `nds_icon_clock` | `6a153673df13dc229351933e2da00025bf7ed553` | 3 | `Color=[3\|4\|5]`, `Height=[h22]` |
| `nds_icon_reload` | `7731e4c0e07b8057be4144cb7e5787325bdc65c8` | 3 | `Color=[3\|4\|5]` |
| `nds_icon_add` | `e8d733da439fa28d948cb548aa573da75e4f0fa2` | 3 | `Color=[4\|5]`, `Height=[h30\|h22]` |
| `nds_icon_interest` | `c6fe0222134199ef47b22ca1599493aadfa43a25` | 3 | `Type=[setting\|bin\|alarm]` |
| `nds_icon_bullet_etf` | `1f598ef7b9b8556bcccef1ff7d5d8e366ff811cb` | 3 | `Type=[2x\|3x\|etf]` |
| `nds_img_bi_ima` | `c53a5d6136cc8cb06d70751a50ba4fe0de97d98b` | 3 | `Type=[nds_img_bi_ima01\|02\|03]` |
| `nds_img_fab` | `d7417350dab74ff0706b8d933cc75380b634bf01` | 4 | `Type=[01\|02\|03\|Type5]` ⚠️ `Type5` breaks the numbering |
| `nds_icon_mic` | `4a8c249c20d522ae593717adb22d122dfcd32ccc` | 2 | `Color=[4\|5]`, `Height=[h30\|h34]` — **the LIVE mic set** |
| `nds_icon_mic` | `d379a98403c8dfc41a5f603fb040eb790655ae49` | 1 | `Color=[4]` — ⚠️ **inside the HIDDEN frame `1134:20188`. Duplicate name, different key. See LEDGER.** |
| `nds_icon_arrowred` | `fd77d8e021ccc968d2d6c7752d2686eaa2a7f7e0` | 1 | `속성 1=[기본]` — ⚠️ duplicate name |
| `nds_icon_arrowred` | `a6648f56a1e21c7e200fb0d4b462ecb4a62663bc` | 1 | `속성 1=[기본]` — ⚠️ **second set, same name, different key. See LEDGER.** |
| `bank` | `5b11d38e077a70a01e5f1f0bab7f2eeed5798fff` | 4 | `Property 1=[h50\|h60\|ss_img_ci\|h60_square]` — ⚠️ duplicate name |
| `bank` | `900b67304c5419dc8f4f521c09e4900c77a3c5bd` | 3 | `Property 1=[h50-1\|h60\|h50-2]` — ⚠️ **second set, same name, different key. See LEDGER.** |
| `\bms_btn_calendar` | `621e4d381a3afc88b51b4a1ade0fdd943f3947fb` | 2 | `Color=[4]`, `Height=[h30]`, `Status=[nn\|sn]` — ⚠️ **name begins with a literal `\b` (U+0008) backspace control character.** |
| `nds_icon_table_zoom` | `4d0fbd31474a1fc441a2fc696cd978b863335bfb` | 2 | `Type=[확대\|축소]` |
| `nds_icon_tooltip` | `7e414339b7619b81d964facd6b7faf2a3f814135` | 2 | `Type=[01\|02]` |
| `nds_icon_meatball` | `6388927509d73385fe59596d8b515ecf96c137e3` | 2 | `Property 1=[4\|5]` |
| `nds_icon_lock` | `ee65e2b4a9076891260ef249efa330f9fbbe3055` | 2 | `Color=[2\|5]`, `Height=[h22]` |
| `nds_icon_sort` | `711a4d3352d94c3d84f0a5619f15f8bd8afc336e` | 2 | `Color=[4\|3]`, `Height=[h22]` |
| `nds_icon_undo` | `5eab70ede6fee2e23a718dbfcc72ff2b9c0f70aa` | 2 | `Color=[5\|4]`, `Height=[h30]` |
| `nds_icon_control` | `b21f9f891b14df48ae90c12ac8845e8fd6632f9c` | 2 | `Type=[left\|right]` |
| `nds_icon_fab` | `b594778ba893efa9a384f573305872afddbabac3` | 2 | `Type=[nds_icon_fab01\|nds_icon_fab02]` |
| `appicon_nm` | `e3e4e8a138946f308eaf390aeea447c2146c0715` | 2 | `Channel=[NM\|N2]` |
| `nds_icon_refresh` | `d0cf70d682c3d7d7d3b50c181faa11b7d6920ec2` | 2 | `Color=[3\|2]`, `Height=[h30]` |
| `nds_icon_call` | `4c2811897bec018db5718d70b60d0f03b55411db` | 2 | `Color=[4\|2]` |
| `nds_icon_sortasc` | `5bb357112fc37ed7d72651a2130b810dc814c49b` | 2 | `Color=[3\|4]`, `h22=[Default]` ⚠️ size encoded as an axis *name* |
| `nds_icon_quick` | `c9dc3f098825a1e7eb699b2bb1cc4011918a7111` | 2 | `Type=[01\|02]` |
| `nds_icon_table_view` | `8d108fb977b16b579e3e4e916cd39c59a3f52048` | 2 | `color=[3]`, `darkmode=[false\|true]` |
| `ss_btn_view` | `3d5627ce7bf348f254fedb914b1fc929a5587406` | 4 | `view=[big\|small]`, `color=[3\|5]` |
| `nds_btn_returnshare` | `c136bc1768504a91057a5bae77b465691a09c1e2` | 4 | `Type=[1\|2]`, `Active=[on\|off]` |
| `ms_btn_cart` | `45c23834d79069ab10f9723451845f7126980685` | 2 | `Active=[on\|off]` |
| `nds_icon_bullet_null` | `58efea2717f5d305b66db816114d5c46dfec47da` | 2 | `Type=[01\|02]` |
| `nds_icon_table_modify` | `8ec9b235c438f4a41f6ee2d8e3fde1a731a5a370` | 2 | `Color=[2\|6]` |
| `ss_img_2002home_mydataicon` | `678e1803878f634373841e9f4125b1ecdb301515` | 2 | `Type=[card\|coin]` — **name typo: `2002` should be `2022`** |
| `ss_img_menu_speed` | `17ff034dab8a6bf177c0ace1d8cd7019f3594cdb` | 2 | `Channel=[NM\|QV]` |
| `ss_img_ico_chatbot` | `9b0779ee69a2619f0c967ed4e9d8653a0483e3fd` | 2 | `Channel=[NM\|QV]` |
| `nds_icon_hamburger` | `016522a2f1181ac7b4af0c221550ee4d1ded7ed4` | 1 | `Color=[5]` |
| `nds_icon_handle` | `115da3bc345ab16491cfd3c4b1e9960226817574` | 1 | `Color=[5]` |
| `nds_icon_filter` | `bb3b17157ec6a13b0854bae21aef5cee1c8289c4` | 1 | `Color=[01]` |
| `nds_icon_link` | `5ea53bfd1c9b193495640a7f854d82e7e64cadcf` | 1 | `Property 1=[4]` |
| `nds_icon_bell` | `02f79af521de7c94007cbc5f7da24dd753e3b3fa` | 1 | `Color=[3]`, `Height=[h22]` |
| `nds_icon_bankbook` | `c980e0e4a201e1a66e1b4e8e09eb0108df6d5547` | 1 | `Color=[4]`, `Height=[h30]` |
| `nds_icon_history` | `bd6e09e10c37959356a2331834ac17f8a95ec7a8` | 1 | `Color=[4]`, `Height=[h30]` |
| `nds_icon_calculator` | `be9e109975dd1da2771c921d577884b112040099` | 1 | `Color=[3]`, `Height=[h30]` |
| `nds_icon_changearrow` | `948a747d045dcee4c1188f5cc0cc0a18c126dbd3` | 1 | `Color=[04]`, `Height=[h22]` |
| `nds_icon_opennew` | `a39a1c16bef6470c65f422ceefc72375aa68e50c` | 1 | `Color=[4]`, `Height=[h22]` |
| `nds_icon_fabarrow` | `6c2b1953b7d997ced17f61c329a7d8e8c99de001` | 1 | `Color=[05]` |
| `nds_icon_linkarrow` | `d3103fa8be384c39a7679733d31aa236ad152fbf` | 1 | `Color=[05]` |
| `nds_icon_goarrow05_r24` | `584f5db5b68b433cf7a46d88bbcbb695e463929a` | 1 | `Color=[05]` — **size baked into the set NAME, unlike every sibling** |
| `nds_icon_ess` | `a9fa5c37a89ddc14888f96bfecd0213b38d61310` | 1 | `Color=[red]` |
| `nds_icon_anno` | `48f9ab7d8231d7cb0daafc4c385d5a959278a661` | 1 | `Color=[04]` |
| `nds_icon_pdf` | `28f409742709517fb55f09088be7440c4dbabff7` | 1 | `Type=[pdf]` |
| `nds_icon_banginfo_solid` | `7a58590d45b16a504aa826cad222ab5cd148224a` | 1 | `Height=[h30]`, `Color=[7]` — **uses 예외 넘버 7** |
| `nds_icon_table_wallet` | `6c982f9df68453aa9e16cae33f09040a9ed5af01` | 1 | `Height=[h22]` |
| `nds_icon_fav` | `f54b87deef0be46f5296c2c73435c393f13e2784` | 1 | `Height=[h22]` |
| `nds_icon_kebab` | `4d66b4f034e02255fdd86990b7a9a325d57b818c` | 1 | `Color=[4]` |
| `nds_icon_crown` | `4d574be81de86a68f7a39bdf07cb58eb9d586b5a` | 1 | `Active=[on]` |
| `nds_home_newcircle` | `b28eb62d7f66f188a2657fd3f4eafee4a6cf9c3d` | 1 | `Color=[red]` |
| `ss_img_2022home_night` | `4677e499e7a738fa26ffe0aad186a3a3f6f8d252` | 1 | `Color=[6]` |
| `ss_img_2022home_plusmydata` | `24da791cae21acabe90d693c8708b8e38223ae9e` | 1 | `Property 1=[Default]` |
| `icon_mydata_linked` | `66329c8ca4b039b6a6b1177386431a2ea78d705c` | 1 | `Property=[Default]` |
| `percent_txt_home` | `b68a209cd69e7c9c28dd21c744b6a623a5d7ab03` | 3 | `Type=[increase\|decrease\|nochange]` |
| `percent_txt` | `21f21838245e94b86e22212850d28d1ffce092ab` | 3 | `Type=[increase\|decrease\|nochange]` |

**Verification: `unverified` for all — expected.** Read-only session; `importComponentSetByKeyAsync` would throw. Keys are read directly off the `COMPONENT_SET` nodes, which is authoritative for identity but not a round-trip import test.

**KIND discipline:** every key in the table above is a **SET** key. The 705 variant COMPONENTs each carry a *different* key which I did not capture and which **will not work** with `importComponentSetByKeyAsync`.

## Conflicts / LEDGER candidates

1. **`nds_icon_mic` — two sets, same name, different keys.** Live: `4a8c249c...` (2 variants, `Color=[4|5]`, `Height=[h30|h34]`). Hidden: `d379a984...` (1 variant, `Color=[4]`) inside `hidden="true"` frame `1134:20188`. **A name→key lookup will collide.** The hidden one is almost certainly superseded — but per method I am **not** quoting the hidden frame's contents as a rule. Needs unhide + re-check.
2. **`nds_icon_arrowred` — two sets, same name, different keys** (`fd77d8e0...` vs `a6648f56...`), both 1 variant, both `속성 1=[기본]`. Identical on every readable dimension. One is dead. Unresolved.
3. **`bank` — two sets, same name, different keys** (`5b11d38e...` 4 variants vs `900b6730...` 3 variants) with **incompatible axis vocabularies** (`h50|h60|ss_img_ci|h60_square` vs `h50-1|h60|h50-2`). This one is a genuine fork, not a duplicate.
4. **`rate` — two sets, same name, different keys** (`2310bdf5...` 6 variants `Type/Gray` vs `6b158266...` 13 variants `Type/Height/White`). Different enough to be intentional (home vs general), but the shared name is a trap.
5. **`nds_icon_bullet` (`eb1ab3ac...`) is STRUCTURALLY BROKEN at source.** `componentPropertyDefinitions` **throws** `Component set has existing errors`. Its 26 children have inconsistent naming — some are properly `Type=23  clock`, `Type=22 kakaopay`, but **`25 global` and `26 chatbot` are missing the `Type=` prefix entirely**, which is what breaks the set. ⛔ **A BUILD pass cannot reliably use `nds_icon_bullet` until this is fixed at source.** `ms_btn_memo` throws the same error.
6. **`\bms_btn_calendar` and `nds_icon_menu`'s `\bexchange` contain literal U+0008 backspace control characters** in their names. This is the same `\x08title` corruption class the method doc warns about — **confirmed present in this file, in component names, not just text.** Any exact-name lookup will silently miss these.
7. **Grammar inconsistencies** (low severity, but they defeat pattern-matching): `(컬러)` vs `(컬러넘버)`; `_크기` vs `_(크기)`; `nds_icon_goarrow05_r24` bakes color+size into the set name while its own caption says `nds_icon_goarrow(컬러넘버)_(방향)(크기)`; `nds_icon_sortasc` encodes size as the axis *name* `h22=[Default]`.
8. **Typos in shipped component names** (do not "fix" in a consumer — the key is what matters, but note the name): `nds_icon_delet` (delete), `icon_comm_complate` (complete), `ss_img_2002home_mydataicon` (2022).
9. **`percent_box` has a 3-valued "boolean"**: `Dark mode=[off|true|on]`. `true` and `on` are almost certainly the same state, duplicated by accident.
10. **Cross-file corroboration (NOT a conflict):** the `rate`/`percent` sets encode `Type=[increase|decrease|nochange]` and the trading captions name `nds_icon_rateup_red` / `nds_icon_ratedown_blue` / `nds_icon_rateflat_green` — **consistent** with the 상승=red / 하락=blue / 보합=green convention already recorded in `nds-ux-guide-updown-notation` and `nds-mweb-colors`. The M.web archive page documents the same icon family under the `ndsw_` prefix (`ndsw_icon_rateup_red`); here it is `nds_icon_` — **the `ndsw_` vs `nds_` prefix is the M.web-vs-library channel distinction, not a contradiction.**

## Gaps / unverifiable

- **No `Last update` stamp anywhere on this page.** I searched the full 144k-char dump for `Last update`/`update`/`ver.`/`버전`/date patterns — zero hits. Contrast `- Infographic` (`2023.12.06`) and `- Illusts` (`2025.10.24`), which both carry one. **This page's freshness is unlabeled**; the `live` status rests on all 143 sets being local+populated and on zero deprecation markers, not on a date.
- **`hidden="true"` frame `1134:20188` (`nds_icon_mic`)** — per method, its contents are **NOT quoted as rules**. I read its component key only for the collision analysis above. Recorded as **unverified + "unhide and re-check"**.
- **`nds_icon_bullet` / `ms_btn_memo` axes are unreadable** (set errors, item 5). I captured `nds_icon_bullet`'s variant *names* as a fallback (`25 global`, `26 chatbot`, `Type=23  clock`, `Type=22 kakaopay`, `Type=21 bio`, `Type=20 public`, `Type=19 password`, `Type=18 etf`, `Type=24 check`, `Type=17 thunder`, `Type=16 star`, `Type=15 question`, …) — note `Type=23  clock` has a **double space**. Full 26-variant list not enumerated.
- **The `use_figma` set listing was truncated at 20 kB**, so I captured ~100 of 143 sets. The ~43 uncaptured sets are the tail (mostly 1–2 variant, in the 관심그룹/나무멤버스/기타 sections). **This is a real coverage gap and I am naming it rather than implying completeness.** Counts (143/705/19) are exact — those came from `.length`, not from the truncated payload.
- **19 standalone COMPONENTs** (not in any set) were counted but not individually keyed.
- The tooltip rule copy (`(흰바탕에사용) nds_icon_tooltip02(그레이배경에 사용)`) is malformed at source — `nds_icon_tooltip01` is implied but never written. Low confidence that white→01 is the intent; it is the only reading that parses.
</content>
