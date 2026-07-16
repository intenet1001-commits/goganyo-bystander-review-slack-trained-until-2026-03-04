# INDEX — topic → note

> **BUILD reads this SECOND** (after `CORE.md`), to find which of 132 notes to open. One line per topic.
> **Flags:** ⚠ = contested / unresolved · ⛔ = the guide **cannot be satisfied** with the current library.
> When a row is flagged, read the `LEDGER.md` anchor **before** building — it will tell you the rule is
> blocked or the key is untrustworthy.
>
> **A row with no flag means "no contest is on record" — NOT "audited and clean."** Every LEDGER entry was found
> by an explicit pass; an un-audited topic and a genuinely clean one look identical here. Absence of a flag is not
> assurance.
>
> Rows list every source that covers the topic. **More sources on a row is a feature** — that is how
> contradictions surface (Search Bar's 3-vs-4 states and `header_basic`'s rival keys were both found by
> cross-reading). Rule of thumb: **guide sources state the rule, Templates/M.web show what actually exists;
> where they disagree, the library is what a BUILD pass is limited by.**

| topic / keywords | note(s) | source(s) | flags |
|---|---|---|---|
| 9-patch, 나인패치, NinePatch, Android, stretch region, .9.png | nds-lib-9-patch.md | Library | ⚠ x1-vs-3배 export conflict; no stamp; whole spec is a 2018 raster |
| account controller, 계좌 컨트롤러, null state, 조회성/신청성 | nds-lib-account-controller.md | Library | ⚠ no usage frame, no Last update; LEDGER#library-structural-defects |
| account, controller, 계좌 컨트롤러 | nds-tpl-account-controller.md; nds-ux-guide-account-controller.md | Templates; UX Guide | — |
| agree, process, 이용동의 | nds-tpl-agree-process.md | Templates | — |
| alarm, 알림 | nds-tpl-alarm.md | Templates | ⛔ LEDGER#nudge-blank-timing |
| alimtalk, 알림톡 | nds-ux-guide-alimtalk.md | UX Guide | — |
| archive | nds-mweb-archive.md | M.web | ⚠ LEDGER#mweb-archive-status |
| article, 아티클 | nds-tpl-article.md | Templates | — |
| banner, 배너 | nds-tpl-banner.md | Templates | — |
| bottom navigation, quickmenu, 퀵메뉴, ticker, allmenu, 간편홈 | nds-lib-bottom-navigation.md | Library | ⚠ LEDGER#quickmenu-easy-undocumented; badged `NDS 추가 개발 해당없음` |
| box button, bottom/container/text/order, strength ladder, 버튼 | nds-lib-box-button.md | Library | ⚠ corrupted variant axis; `\b` in prop name; LEDGER#n2-vs-qv |
| box, button, 진행중 | nds-mweb-box-button.md; nds-tpl-box-button.md | M.web; Templates | — |
| button, 버튼 | nds-ux-guide-button.md | UX Guide | ⚠ LEDGER#button-stub |
| buy, method, select, 매수방법 선택 | nds-tpl-buy-method-select.md | Templates | — |
| card, container, data/select/emphasis/accordion, stroke(017), margin 30/24, 카드 | nds-lib-card.md | Library | ⚠ 4 sets carry `\b` in property names |
| card, 카드 | nds-tpl-card.md | Templates | — |
| certificate, capture, 이미지 저장 캡쳐 확인서 | nds-tpl-certificate-capture.md | Templates | — |
| chart, graph, pie/line/bar/stock/treemap/legend, 차트, 그래프 | nds-lib-chart.md | Library | ⚠ LEDGER#treemap-보합-grey; pasted images are Highcharts docs, NOT NDS |
| chart, 차트 | nds-tpl-chart.md | Templates | — |
| CI advisory, 자문사, FAA, OAR, 자문사코드 | nds-ci-advisory.md | CI | ⚠ FAA 75% holes unexplained; breaks the file's own `ss_img_` convention |
| CI archive, ETF CI exploration, 자동완성, nds_icon_bullet_etf, 아카이브 | nds-ci-archive.md | CI | ⚠ **UNKNOWN — holds the file's NEWEST ETF work, not old**; LEDGER#ci-bullet-etf-rivals |
| CI banks archive, 은행/증권/기관 구버전, K bank rebrand, 아카이브 | nds-ci-banks-brokerages-archive.md | CI | ⚠ superseded (live quotes it as 구 버전); **150 codes dropped from live** — LEDGER#ci-banks-dropped-codes |
| CI banks brokerages, 은행/증권/기관, ss_img_company, 기관 로고 | nds-ci-banks-brokerages.md | CI | ⚠ 0 components — CDN filename contract |
| CI domestic stock, 국내주식, ss_img_ci 종목코드, 코스피, 코스닥 | nds-ci-domestic-stock.md | CI | ⚠ 0 components — CDN filename contract |
| CI ETF, ETF CI, ss_img_ci_etf, 디폴트 ETF | nds-ci-etf.md | CI | ⚠ LEDGER#ci-etf-occluded-duplicate; not the current ETF design state |
| CI export rig, export settings, x2 multiplier, 2457 badges, 코스피01 | nds-ci-export.md | CI | ⚠ **x2 enforced via exportSettings**; 34 malformed + 17 duplicate names shipping |
| CI firm banking, 펌뱅킹, ss_img_bank, 케이뱅크 히스토리 | nds-ci-firm-banking.md | CI | ⚠ `ss_img_bank10` = 1 name / 3 nodes; **undated** |
| CI media, 언론사, ss_img_press, 벤징가 | nds-ci-media.md | CI | ⚠ press20 empty + **invisibility UNCLEARED (page unreadable read-only)** |
| CI overseas stock, 해외주식, ss_img_ci_국가티커, usaaapl | nds-ci-overseas-stock.md | CI | ⚠ country+ticker concatenated, no separator — parse width unstated |
| CI public agencies, 공공기관, 기관코드 | nds-ci-public-agencies.md | CI | ⚠ bare `기관코드.png` — no prefix; case inconsistent |
| CI simple auth, 간편인증기관, 마이데이터, 기관코드 | nds-ci-simple-auth.md | CI | ⚠ 마이데이터/간편인증 sections byte-identical — copy-paste debris |
| CI 제작 가이드, CI production rules, naming grammar, clear-space, 200x200, Tiny PNG, CDN, 디폴트 CI, 이니셜, 로고 제작 | nds-ci-production-guide.md | CI | ⚠ LEDGER#ci-etf-occluded-duplicate; ss_img_ci_etc 3-way fork; usd/usa contradiction |
| ci, to, ci | nds-tpl-ci-to-ci.md | Templates | — |
| coach, mark, 코치마크 | nds-tpl-coach-mark.md | Templates | ⚠ LEDGER#tooltip-no-rules |
| color, contrast, 명도대비 색상 | nds-ux-guide-color-contrast.md | UX Guide | — |
| colors | nds-mweb-colors.md | M.web | — |
| colors, NDS_Colors, signpost, 별도 라이브러리 | nds-lib-colors.md | Library | ⚠ pointer page only — no spec; `GO ->` target unresolved |
| completion, popup, 완료팝업 | nds-tpl-completion-popup.md; nds-ux-guide-completion-popup.md | Templates; UX Guide | ⛔ LEDGER#ux-writing-drift |
| consent, 이용동의 | nds-ux-guide-consent.md | UX Guide | — |
| controls, toggle, switch, check, radio, slider, 컨트롤 | nds-lib-controls.md | Library | ✅ radio keys sighted (LEDGER#radio-keys-never-sighted); ⚠ `\b` in axis names |
| controls, 진행중) | nds-mweb-controls.md; nds-tpl-controls.md | M.web; Templates | ⚠ LEDGER#radio-keys-never-sighted |
| currency, notation, 통화표기 | nds-ux-guide-currency-notation.md | UX Guide | — |
| data table, table, header/cell/control, 테이블, 표 | nds-lib-data-table.md | Library | ⚠ no stamp; LEDGER#data-table-rate-red |
| data, table, 진행중) | nds-mweb-data-table.md; nds-tpl-data-table.md | M.web; Templates | — |
| date, picker, 날짜·기간 데이트피커 설정 | nds-ux-guide-date-picker.md | UX Guide | — |
| dialog | nds-mweb-dialog.md | M.web | ⛔ LEDGER#nudge-blank-timing |
| dialog, snack bar, toast, nudge, 스낵바, 토스트, 넛징 | nds-lib-dialog.md | Library | ⭐ nudge timing FOUND; ⛔ toast/snackbar still blank — LEDGER#nudge-blank-timing |
| emoji nmoji infographic archive, nmoji grid, 아카이브 | nds-lib-emoji-nmoji-infographic-archive.md | Library | ⚠ superseded (grid) / unknown (scratch) — shares live's exact `nds_nmoji42` gap → older snapshot, NOT a rival |
| emoji, nmoji, unicode emoji, image emoji, 이모지, 엔모지 | nds-lib-emoji-nmoji.md | Library | ⚠ counts stale (152, not 142); LEDGER#emoji-two-generations |
| empty, state, 데이터 없음 | nds-ux-guide-empty-state.md | UX Guide | ⛔ LEDGER#ux-writing-drift |
| faq, 자주하는질문 | nds-mweb-faq.md; nds-tpl-faq.md | M.web; Templates | — |
| feedback, 남기기 의견 | nds-tpl-feedback.md | Templates | — |
| ga4, tagging | nds-tpl-ga4-tagging.md | Templates | — |
| graphic asset taxonomy, recommended size, asset class routing, 그래픽에셋, 추천 사이즈 | nds-lib-graphic-asset.md | Library | ⛔ Character 미제작 — LEDGER#incomplete-asset-classes. **Nmoji is FINE** (white-on-white `제작중`) |
| guide, page, 안내페이지 | nds-tpl-guide-page.md | Templates | — |
| header, 헤더 | nds-tpl-header.md | Templates | ⚠ LEDGER#header-basic-keys |
| icons | nds-mweb-icons.md | M.web | — |
| icons archive, flag 구버전, ss_img_flag, 아이콘 아카이브 | nds-lib-icons-archive.md | Library | ⚠ superseded — live Icons defines itself AGAINST it (`nds_icon 이전 리소스와 구분되는`); markers `원형 구버전`, `👿 일단 제외` |
| icons, color number, 컬러넘버, naming grammar, flags, 아이콘 | nds-lib-icons.md | Library | 🔥 컬러넘버 legend → CORE Gotcha 14; ⛔ `nds_icon_bullet` broken; ~43/143 sets uncaptured |
| illustration, 일러스트, nds_illust, Tax 참고불가 | nds-lib-illusts.md | Library | ⛔ LEDGER#incomplete-asset-classes; ⚠ LEDGER#illust-export-multiplier |
| illusts | nds-mweb-illusts.md | M.web | — |
| illusts archive, ss_img_com_illust, ghosted assets, 일러스트 아카이브 | nds-lib-illusts-archive.md | Library | ⚠ superseded + **65/153 ghosted at opacity 0.10, meaning UNSTATED** — LEDGER#illusts-archive-ghosting |
| image naming, filename grammar, prefix nds/ms/ss/biz/squad/lottie, 네이밍 규칙 | nds-lib-img-naming-rule.md | Library | ⚠ `_black`/`_old` undocumented; stamp stale vs own content |
| images, asset registry, gradation, shadow, risktable, 이미지 | nds-lib-images.md | Library | ⚠ 7 hidden nodes unverified (`nds_img_noimg02/03`) |
| indicators | nds-tpl-indicators.md | Templates | ⚠ LEDGER#step-header-duality |
| indicators, pagination, step, gauge, 인디케이터, 총단계 | nds-lib-indicators.md | Library | ⚠ 2 rules `기획논의필요` at source; INSTANCE names are stale fossils |
| infographic, 인포그래픽, ETF theme, darkmode, 80@2x | nds-lib-infographic.md | Library | ⛔ 8 `*제작 예정*` — LEDGER#incomplete-asset-classes |
| infographics | nds-mweb-infographics.md | M.web | — |
| justify, UI pattern rationale, 조회/요약/결과·상세, Sub 정보, 적용원칙, 메인화면 vs 풀팝업, 화면 유형 | nds-lib-justify.md | Library | ⚠ LEDGER#justify-deck-fragment — 3-slide fragment, no stamp |
| label, tag | nds-mweb-label-tag.md | M.web | — |
| label, tag, 라벨, label_risk, label_basic, 위험도 | nds-lib-label.md | Library | ⚠ LEDGER#label-height-30-vs-26; RISK table has duplicate colour pairs |
| layout, margin, grid, spacing, card padding, statusbar, keyboard, 레이아웃, 여백 | nds-lib-layout.md | Library | ⚠ LEDGER#statusbar-four-sets; `\b` in variant names; **undated**; 6 section titles lie |
| layout, 진행중 | nds-mweb-layout.md; nds-tpl-layout.md | M.web; Templates | — |
| link, list, 이동리스트 | nds-tpl-link-list.md | Templates | — |
| list, row, stock/account/icon/board/product, 등락률, 리스트 | nds-lib-list.md | Library | ⛔ `list_icon` set is BROKEN — LEDGER#library-structural-defects |
| list, 리스트 | nds-tpl-list.md | Templates | — |
| loading, 로딩 | nds-tpl-loading.md | Templates | — |
| lottie, animation, motion, timing, easing, json delivery, 로띠, 애니메이션 | nds-lib-lottie-animation.md | Library | ⚠ **zero timing/easing — values live in external JSON, not Figma.** Only 4 of ~130 are real Lottie |
| nmoji, emoji | nds-mweb-nmoji-emoji.md | M.web | — |
| no, data, 데이터 없음 | nds-tpl-no-data.md | Templates | ⛔ LEDGER#ux-writing-drift |
| nudge, 넛징 스낵바 토스트팝업) | nds-ux-guide-nudge.md | UX Guide | ⛔ LEDGER#nudge-blank-timing |
| number keypad, 숫자 키패드, keypad_number01-04, 터치영역 | nds-lib-number-keypad.md | Library | ⚠ px/pt mixed; every measurement is an annotation overlay |
| padding, 여백 | nds-tpl-padding.md | Templates | — |
| popup, sliding/layer/full, max-height, scroll region, 팝업 | nds-lib-popup.md | Library | ⚠ LEDGER#popup-max-height-unresolved (STRIKETHROUGH); **NOT a component library** (1 set) |
| popup, 팝업 | nds-mweb-popup.md; nds-tpl-popup.md; nds-ux-guide-popup.md | M.web; Templates; UX Guide | — |
| precautions, 유의사항 | nds-mweb-precautions.md; nds-tpl-precautions.md; nds-ux-guide-precautions.md | M.web; Templates; UX Guide | ⚠ LEDGER#precautions-width |
| precautions, 유의사항, disclosure, 심사필, 당구장, 금융소비자보호법 | nds-lib-precautions.md | Library | — (genuine rules prose; see LEDGER#precautions-width) |
| principles, 원칙) 프로덕트 | nds-ux-guide-principles.md | UX Guide | — |
| pulldown | nds-mweb-pulldown.md; nds-tpl-pulldown.md | M.web; Templates | — |
| pulldown, select, combo, dropdown, 풀다운, 셀렉트박스, 콤보 | nds-lib-pulldown.md | Library | ⭐ dev-name mapping `Line Select Box` → **`bottom design`** |
| questionnaire, 등록 질문지 | nds-tpl-questionnaire.md | Templates | ⚠ LEDGER#radio-keys-never-sighted |
| search bar archive, legacy searchbar, 검색창 아카이브 | nds-lib-search-bar-archive.md | Library | ⚠ deprecated (**cross-file** evidence, not self-marked); **2 states only — does NOT hold the guide's 4th state or 탐색형** |
| search bar, filter, sort, 검색, 검색창 | nds-lib-search-bar.md | Library | ⛔ LEDGER#search-bar-states (3 states, corroborated); Sort is `작업중` — **does not exist** |
| search, bar, 검색 검색창 | nds-tpl-search-bar.md | Templates | ⛔ LEDGER#search-bar-states |
| search, 검색 | nds-ux-guide-search.md | UX Guide | ⛔ LEDGER#search-bar-states |
| security keypad, 보안 키패드, transkey, 거래비밀번호, AOS/iOS | nds-lib-security-keypad.md | Library | 🚨 LEDGER#security-keypad-undecided + broken `NM` set |
| share, 공유하기 | nds-tpl-share.md; nds-ux-guide-share.md | Templates; UX Guide | — |
| sort order, 정렬 순서, Framework→Detail, V1/V2/V3 history, guide_parent | nds-lib-sort-order-working-page.md | Library | ⚠ working-draft; **maturity scheme is 원티드's, do NOT adopt** (CORE Gotcha 16) |
| step, timeline, 스텝 타임라인) | nds-tpl-step-timeline.md | Templates | ⚠ LEDGER#step-header-duality |
| tab, 진행중) | nds-mweb-tab.md; nds-tpl-tab.md; nds-ux-guide-tab.md | M.web; Templates; UX Guide | ⚠ LEDGER#tab-2depth-chip-source |
| tab, 탭, 1depth/1.5depth/2depth, switch, swipe, chip | nds-lib-tab.md | Library | ✅ LEDGER#tab-2depth-chip-source resolved; ⚠ `tab_btn` ×3 collision; LEDGER#tab-2depth-txt-dimmed |
| text field, input, 텍스트필드, 인풋 | nds-lib-text-field.md | Library | ⛔ broken dup `input_line` — LEDGER#library-structural-defects; ships **4** states (cf. search bar's 3) |
| text, fields, 인풋 텍스트필드 | nds-tpl-text-fields.md | Templates | — |
| thumbnail, 썸네일 | nds-tpl-thumbnail.md | Templates | — |
| thumbnail, 썸네일, file cover art, 나눔바른고딕 specimen | nds-lib-thumbnail.md | Library | ⚠ unknown — judged on own evidence; "archive" is inherited from page position only |
| title, section heading, Title_default, size 21/24/26, 타이틀 | nds-lib-title.md | Library | ⚠ sparse set: only 10 of 24 combos exist; top-level frame name lies (`1. List`) |
| tooltip, guide tooltip, coach-mark, width & margin, 툴팁 | nds-lib-tooltip.md | Library | ⚠ LEDGER#tooltip-no-rules — geometry found, **behaviour still blank**; design≠dev value |
| tooltip, 진행중 툴팁 | nds-mweb-tooltip.md; nds-tpl-tooltip.md | M.web; Templates | ⚠ LEDGER#tooltip-no-rules |
| top navigation, header, header_basic, header_stock, 헤더 | nds-lib-top-navigation.md | Library | ✅ LEDGER#header-basic-keys ROOT CAUSE; ⛔ `header_title_txt` broken |
| top, navigation | nds-mweb-top-navigation.md | M.web | ⚠ LEDGER#header-basic-keys |
| touch, area, 설정 터치영역 | nds-ux-guide-touch-area.md | UX Guide | — |
| trade, order, confirm, 매매 주문 확인 | nds-tpl-trade-order-confirm.md | Templates | — |
| typography | nds-mweb-typography.md | M.web | — |
| typography, type scale, Nanum, Roboto, Fix Height, 나눔바른고딕, 타이포그래피 | nds-lib-typography.md | Library | ⭐ **zero Pretendard styles** → corrects CORE; ⚠ 2 style names carry `\b` |
| updown, notation, 등락기호표기 | nds-ux-guide-updown-notation.md | UX Guide | — |
| welcome, cover, TOC, licence, IP notice, component definition, changelog, 웰컴, 저작권 | nds-lib-welcome.md | Library | ⚠ LEDGER#welcome-toc-drift (never a denominator); 🔒 LEDGER#clipboard-strings-possible-secret |
