---
name: ga4-현재가-시간대-오늘
version: "1.0"
description: NH MTS GA4 — 주식현재가 vs 해외주식현재가 오늘 시간대별 실시간 현황 (Namuh / QV 구분)
argument-hint: ""
---

# ga4-시간대-오늘

NH MTS GA4에서 **주식현재가 [1210]** 과 **해외주식현재가 [3510]** 의 오늘 시간대별(0~23시 KST) 실시간 누적 현황을 Namuh / QV 기준으로 출력한다.

## GA4 환경

- **Property ID:** `153317169` (NH MTS GA4)
- **스트림 구분:** `streamName` 차원 → `Namuh MTS` / `QV MTS`
- **시간 차원:** `hour` (KST 기준, 0~23)
- **화면명:**
  - 주식현재가: `[1210] 주식 현재가 : X04m1210`
  - 해외주식현재가: `[3510] 해외주식 현재가 : X06m3510`

---

## 실행 절차

### STEP 1: 쿼리 실행 전 현재 시각 확인

쿼리 실행 전 현재 KST 시각을 확인한다. 출력 헤더에 사용한다.
- 데이터 구간: 오늘 **00:00 KST ~ 쿼리 실행 시각**
- `today ~ today` 기준이므로 아직 지나지 않은 시간대는 0 또는 미집계

### STEP 2: 2개 쿼리 병렬 실행

**쿼리 A — 해외주식현재가 시간대별 (오늘)**
```
property_id: 153317169
date_ranges: [{"start_date": "today", "end_date": "today"}]
dimensions: ["hour", "streamName"]
metrics: ["totalUsers", "screenPageViews"]
dimension_filter:
  and_group.expressions:
    - filter: unifiedScreenName EXACT "[3510] 해외주식 현재가 : X06m3510"
    - filter: streamName IN_LIST ["Namuh MTS", "QV MTS"]
order_bys: hour ASC
```

**쿼리 B — 주식현재가 시간대별 (오늘)**
```
property_id: 153317169
date_ranges: [{"start_date": "today", "end_date": "today"}]
dimensions: ["hour", "streamName"]
metrics: ["totalUsers", "screenPageViews"]
dimension_filter:
  and_group.expressions:
    - filter: unifiedScreenName EXACT "[1210] 주식 현재가 : X04m1210"
    - filter: streamName IN_LIST ["Namuh MTS", "QV MTS"]
order_bys: hour ASC
```

---

### STEP 3: 결과 출력

평균을 나누지 않고 당일 누적 원시값을 그대로 출력한다.
아직 지나지 않은 시간대(쿼리 실행 시각 이후)는 `-` 또는 `0`으로 표시한다.

```
🇰🇷 국내 증시: 09:00~15:30 KST
🇺🇸 미국 증시 (EST 겨울): 23:30~06:00 KST

오늘 실시간 현황 — 주식현재가 vs 해외주식현재가
데이터 구간: {today_date} {요일} 00:00 KST ~ {query_time} KST

시간  │ ── Namuh ──────────────────────────────── │ ── QV ──────────────
      │ 해외현재가                주식현재가        │ 해외현재가  주식현재가
      │ 진입수   PV               진입수   PV       │ 진입수      진입수
──────┼────────────────────────────────────────────┼────────────────────
00시  │ {n}     {pv} 🇺🇸         {n}     {pv}      │ {n}         {n}
...
09시  │ {n}     {pv} 🇰🇷         {n}     {pv} 🇰🇷  │ {n}         {n}
...
23시  │ {n}     {pv} 🇺🇸         {n}     {pv}      │ {n}         {n}
```

**마커 기준:**
- `🇺🇸` — 미국장 시간대 (23~05시 KST, EST 겨울 기준)
- `🇰🇷` — 국내장 시간대 (09~15시 KST)
- `🔺🔺` — 오늘 해당 화면 PV 최고 시간대
- `📈` — 오늘 상위 3개 시간대
- `⏳` — 아직 진행 중인 현재 시간대 (쿼리 실행 시각의 hour)

---

### STEP 4: 인사이트 요약

출력 후 아래 항목을 분석·서술한다.

1. **오늘 주식현재가 피크 시간** — 지금까지의 최고 시간대
2. **오늘 해외현재가 피크 시간** — 지금까지의 최고 시간대
3. **현재 시간대 수준** — 현재 시간이 피크 대비 어느 수준인지
4. **특이 구간** — 예상 외 트래픽 급등/급락

---

## 참고 정보

- 날짜는 항상 `today ~ today` 고정 (실시간 당일 누적)
- 30일 시간대 평균이 필요하면 `/ga4-시간대-분석` 사용 (30daysAgo ~ yesterday)
- 미국 서머타임(EDT) 적용 시 미국장 시간 = 22:30~05:00 KST
- 저장 경로: `~/Library/CloudStorage/GoogleDrive-intenet1@gmail.com/My Drive/글로벌브로커리지확장/ga4/`

## 버전 이력

### v1.0 (2026-02-26)
- 최초 생성: 시간대별 오늘 실시간 현황 스킬
- ga4-시간대-분석에서 오늘 구간을 분리
