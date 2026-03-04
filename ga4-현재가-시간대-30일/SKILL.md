---
name: ga4-현재가-시간대-30일
version: "1.0"
description: NH MTS GA4 — 주식현재가 vs 해외주식현재가 시간대별 일평균 진입수 & PV (Namuh / QV 구분)
argument-hint: "[일수: 기본 30]"
---

# ga4-시간대-분석

NH MTS GA4에서 **주식현재가 [1210]** 과 **해외주식현재가 [3510]** 의 시간대별(0~23시 KST) 일평균 진입수 및 PV를 Namuh / QV 기준으로 비교 분석한다.

## GA4 환경

- **Property ID:** `153317169` (NH MTS GA4)
- **스트림 구분:** `streamName` 차원 → `Namuh MTS` / `QV MTS`
- **시간 차원:** `hour` (KST 기준, 0~23)
- **화면명:**
  - 주식현재가: `[1210] 주식 현재가 : X04m1210`
  - 해외주식현재가: `[3510] 해외주식 현재가 : X06m3510`

---

## 실행 절차

### STEP 1: 2개 쿼리 병렬 실행

**쿼리 A — 해외주식현재가 시간대별**
```
property_id: 153317169
date_ranges: [{"start_date": "30daysAgo", "end_date": "yesterday"}]
dimensions: ["hour", "streamName"]
metrics: ["totalUsers", "screenPageViews"]
dimension_filter:
  and_group.expressions:
    - filter: unifiedScreenName EXACT "[3510] 해외주식 현재가 : X06m3510"
    - filter: streamName IN_LIST ["Namuh MTS", "QV MTS"]
order_bys: hour ASC
```

**쿼리 B — 주식현재가 시간대별**
```
property_id: 153317169
date_ranges: [{"start_date": "30daysAgo", "end_date": "yesterday"}]
dimensions: ["hour", "streamName"]
metrics: ["totalUsers", "screenPageViews"]
dimension_filter:
  and_group.expressions:
    - filter: unifiedScreenName EXACT "[1210] 주식 현재가 : X04m1210"
    - filter: streamName IN_LIST ["Namuh MTS", "QV MTS"]
order_bys: hour ASC
```

---

### STEP 2: 일평균 계산

```
조회 기간 일수 = 30 (30daysAgo ~ yesterday 기준)
일평균 진입수 = 시간대 누적 유저 ÷ 30
일평균 PV     = 시간대 누적 PV ÷ 30
```

기간 인수가 다를 경우 `일수 = N` 으로 계산.

---

### STEP 3: 결과 출력

아래 형식으로 0~23시 전체를 출력하고, 시장 시간대 마커를 표시한다.

```
🇰🇷 국내 증시: 09:00~15:30 KST
🇺🇸 미국 증시 (EST 겨울): 23:30~06:00 KST

시간  │ ── Namuh ──────────────────────────────── │ ── QV ──────────────
      │ 해외현재가                주식현재가        │ 해외현재가  주식현재가
      │ 진입수   PV/day           진입수   PV/day   │ 진입수      진입수
──────┼────────────────────────────────────────────┼────────────────────
00시  │ {n}     {pv} 🇺🇸         {n}     {pv}      │ {n}         {n}
...
08시  │ {n}     {pv} 📈          {n}     {pv} 📈   │ ...
09시  │ {n}     {pv}             {n}     {pv} 🔺🔺 │ ...
...
23시  │ {n}     {pv} 🔺🔺        {n}     {pv}      │ ...
```

**마커 기준:**
- `🇺🇸` — 미국장 시간대 (23~05시 KST, EST 겨울 기준)
- `🇰🇷` — 국내장 시간대 (09~15시 KST)
- `🔺🔺` — 해당 화면 일평균 PV 최고 시간대
- `📈` — 상위 3개 시간대

---

### STEP 4: 인사이트 요약

출력 후 아래 항목을 자동으로 분석·서술한다.

1. **주식현재가 피크 시간** — 국내장 개장 전후 패턴
2. **해외현재가 피크 시간** — 미국장 개장 전후 패턴
3. **Namuh vs QV 시간대 패턴 차이** 유무
4. **특이 구간** — 예상 외 트래픽 급등/급락 시간대

---

## 참고 정보

- 기간 인수가 제공되면 `30daysAgo` 대신 `{N}daysAgo` 로 대체
- 미국 서머타임(EDT) 적용 시 미국장 시간 = 22:30~05:00 KST
- 저장 경로: `~/Library/CloudStorage/GoogleDrive-intenet1@gmail.com/My Drive/글로벌브로커리지확장/ga4/`

## 버전 이력

### v1.0 (2026-02-26)
- 최초 생성: 시간대별 일평균 진입수 & PV 분석 스킬
