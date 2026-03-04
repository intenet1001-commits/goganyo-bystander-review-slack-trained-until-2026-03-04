---
name: ga4-현재가-요약-30일
version: "1.0"
description: NH MTS GA4 — 주식현재가 vs 해외주식현재가 30일 전체 요약 (Namuh / QV 구분)
argument-hint: "[일수: 기본 30]"
---

# ga4-현재가-요약

NH MTS GA4에서 **주식현재가 [1210]** 과 **해외주식현재가 [3510]** 의 30일 진입 현황을 Namuh / QV 기준으로 비교 분석한다.

## GA4 환경

- **Property ID:** `153317169` (NH MTS GA4)
- **스트림 구분:** `streamName` 차원 → `Namuh MTS` / `QV MTS`
- **화면명:**
  - 주식현재가: `[1210] 주식 현재가 : X04m1210`
  - 해외주식현재가: `[3510] 해외주식 현재가 : X06m3510`

---

## 실행 절차

### STEP 1: 3개 쿼리 병렬 실행

아래 3개를 **동시에** `mcp__analytics-mcp__run_report` 로 호출한다.

**쿼리 A — 주식현재가 스트림별 집계**
```
property_id: 153317169
date_ranges: [{"start_date": "30daysAgo", "end_date": "yesterday"}]
dimensions: ["streamName"]
metrics: ["totalUsers", "screenPageViews"]
dimension_filter:
  and_group.expressions:
    - filter: unifiedScreenName EXACT "[1210] 주식 현재가 : X04m1210"
    - filter: streamName IN_LIST ["Namuh MTS", "QV MTS"]
order_bys: totalUsers DESC
```

**쿼리 B — 해외주식현재가 스트림별 집계**
```
property_id: 153317169
date_ranges: [{"start_date": "30daysAgo", "end_date": "yesterday"}]
dimensions: ["streamName"]
metrics: ["totalUsers", "screenPageViews"]
dimension_filter:
  and_group.expressions:
    - filter: unifiedScreenName EXACT "[3510] 해외주식 현재가 : X06m3510"
    - filter: streamName IN_LIST ["Namuh MTS", "QV MTS"]
order_bys: totalUsers DESC
```

**쿼리 C — 전체 사용자 (분모)**
```
property_id: 153317169
date_ranges: [{"start_date": "30daysAgo", "end_date": "yesterday"}]
dimensions: ["streamName"]
metrics: ["totalUsers"]
dimension_filter:
  filter: streamName IN_LIST ["Namuh MTS", "QV MTS"]
order_bys: totalUsers DESC
```

---

### STEP 2: 진입률 계산

```
진입률 = 화면 진입 유저 / 전체 사용자 × 100
인당 PV = 총 PV / 진입 유저
```

---

### STEP 3: 결과 출력

아래 형식으로 출력한다.

```markdown
## 30일 전체 요약 — 주식현재가 vs 해외주식현재가
> 기간: {30daysAgo_date} ~ {yesterday_date}

| 구분 | Namuh 주식현재가 | Namuh 해외현재가 | QV 주식현재가 | QV 해외현재가 |
|------|---------------:|---------------:|-------------:|-------------:|
| 전체 사용자 | {N_total} | {N_total} | {QV_total} | {QV_total} |
| 진입 유저 | {N_주식_users} | {N_해외_users} | {QV_주식_users} | {QV_해외_users} |
| **진입률** | **{N_주식_%}** | **{N_해외_%}** | **{QV_주식_%}** | **{QV_해외_%}** |
| 총 PV | {N_주식_PV} | {N_해외_PV} | {QV_주식_PV} | {QV_해외_PV} |
| 인당 PV | {N_주식_ppv}회 | {N_해외_ppv}회 | {QV_주식_ppv}회 | {QV_해외_ppv}회 |

> 주식현재가 진입률이 해외현재가의 **{배수}배(Namuh) / {배수}배(QV)** 수준
```

---

## 참고 정보

- 기간 인수가 제공되면 `30daysAgo` 대신 `{N}daysAgo` 로 대체
- 추가 비교 화면이 필요하면 쿼리 A/B 조건의 unifiedScreenName 값을 변경
- 저장 경로: `~/Library/CloudStorage/GoogleDrive-intenet1@gmail.com/My Drive/글로벌브로커리지확장/ga4/`

## 버전 이력

### v1.0 (2026-02-26)
- 최초 생성: 주식현재가 vs 해외주식현재가 30일 요약 스킬
