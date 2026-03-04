---
name: verify-codebase-review
description: codebase-review-v1 플러그인의 에이전트 정의 일관성, 커맨드 동기화, 출력 포맷을 검증합니다. SKILL.md 수정 후 사용.
---

# 코드베이스 리뷰 플러그인 검증

## Purpose

1. **에이전트 정의 일관성** — SKILL.md 내 5개 에이전트(Architecture, Quality, Security, Performance, Maintainability)가 동일한 구조(분석 항목 + 평가 기준)를 가지는지 검증
2. **커맨드 ↔ SKILL.md 동기화** — `commands/codebase-review.md`의 focus 옵션이 SKILL.md의 에이전트 목록과 일치하는지 검증
3. **출력 포맷 완전성** — SKILL.md의 Output Format에 5개 에이전트 결과 섹션이 모두 포함되어 있는지 검증
4. **평가 기준 일관성** — 모든 에이전트가 A/B/C/D 4단계 등급 기준을 정의하고 있는지 검증

## When to Run

- `SKILL.md`의 에이전트 정의를 수정한 후
- 새로운 분석 관점(에이전트)을 추가한 후
- 커맨드 파일의 focus 옵션을 변경한 후
- 출력 포맷 템플릿을 수정한 후

## Related Files

| File | Purpose |
|------|---------|
| `plugins/codebase-review-v1/skills/codebase-review/SKILL.md` | 스킬 실행 프로토콜 및 에이전트 정의 |
| `plugins/codebase-review-v1/commands/codebase-review.md` | 커맨드 정의 및 focus 옵션 |
| `plugins/codebase-review-v1/.claude-plugin/plugin.json` | 플러그인 메타데이터 |

## Workflow

### Step 1: 5개 에이전트 정의 존재 확인

**파일:** `plugins/codebase-review-v1/skills/codebase-review/SKILL.md`

**검사:** SKILL.md에 5개 에이전트 섹션 헤더가 모두 존재하는지 확인합니다.

Grep 도구로 검사:
- 패턴: `Architecture Agent`, `Quality Agent`, `Security Agent`, `Performance Agent`, `Maintainability Agent`

**PASS 기준:** 5개 에이전트 섹션 헤더가 모두 존재
**FAIL 기준:** 하나라도 누락된 에이전트 섹션이 있는 경우
**수정 방법:** 다른 에이전트의 포맷을 참고하여 누락된 섹션 추가

### Step 2: 에이전트별 필수 하위 섹션 검증

**파일:** `plugins/codebase-review-v1/skills/codebase-review/SKILL.md`

**검사:** 각 에이전트 정의에 "분석 항목"과 "평가 기준" 하위 섹션이 존재하는지 확인합니다.

Grep 도구로 검사:
- 패턴: `분석 항목` — 5회 이상 출현해야 함
- 패턴: `평가 기준` — 5회 이상 출현해야 함

**PASS 기준:** "분석 항목"과 "평가 기준"이 각각 5회 이상 출현
**FAIL 기준:** 출현 횟수가 5 미만인 경우 — 어떤 에이전트에서 누락됨
**수정 방법:** 누락된 에이전트에 "분석 항목:" 및 "평가 기준:" 하위 섹션 추가

### Step 3: 평가 등급 A/B/C/D 일관성 검증

**파일:** `plugins/codebase-review-v1/skills/codebase-review/SKILL.md`

**검사:** 각 에이전트의 평가 기준에 A, B, C, D 4개 등급이 모두 정의되어 있는지 확인합니다.

Grep 도구로 검사:
- 패턴: `- A:` — 5회 이상
- 패턴: `- B:` — 5회 이상
- 패턴: `- C:` — 5회 이상
- 패턴: `- D:` — 5회 이상

**PASS 기준:** A/B/C/D 각각 5회 이상 출현 (에이전트당 1회씩)
**FAIL 기준:** 어떤 등급이 5 미만인 경우
**수정 방법:** 누락된 에이전트의 등급 기준 추가

### Step 4: 커맨드 focus 옵션 ↔ SKILL.md 에이전트 동기화

**파일:** `plugins/codebase-review-v1/commands/codebase-review.md`, `plugins/codebase-review-v1/skills/codebase-review/SKILL.md`

**검사:** 커맨드 파일의 Focus Options에 나열된 관점이 SKILL.md의 에이전트와 1:1 매칭되는지 확인합니다.

커맨드 파일에서 focus 옵션 추출:
- `architecture`, `quality`, `security`, `performance`, `maintainability`

SKILL.md에서 에이전트 이름 추출:
- `Architecture Agent`, `Quality Agent`, `Security Agent`, `Performance Agent`, `Maintainability Agent`

**PASS 기준:** 커맨드의 5개 focus 옵션이 SKILL.md의 5개 에이전트와 정확히 대응
**FAIL 기준:** 커맨드에만 있고 SKILL.md에 없는 옵션, 또는 그 반대
**수정 방법:** 불일치 항목을 추가/제거하여 동기화

### Step 5: 출력 포맷에 모든 에이전트 섹션 포함 확인

**파일:** `plugins/codebase-review-v1/skills/codebase-review/SKILL.md`

**검사:** Output Format 섹션의 템플릿에 5개 에이전트의 결과 섹션이 모두 포함되어 있는지 확인합니다.

Grep 도구로 검사:
- 패턴: `Architecture Analysis` — 출력 포맷 내 존재
- 패턴: `Quality Analysis` — 출력 포맷 내 존재
- 패턴: `Security Analysis` — 출력 포맷 내 존재
- 패턴: `Performance Analysis` — 출력 포맷 내 존재
- 패턴: `Maintainability Analysis` — 출력 포맷 내 존재

**PASS 기준:** 5개 분석 섹션이 모두 출력 포맷에 존재
**FAIL 기준:** 누락된 분석 섹션이 있는 경우
**수정 방법:** 누락된 에이전트의 분석 결과 섹션을 출력 포맷에 추가

### Step 6: Phase 구조 검증

**파일:** `plugins/codebase-review-v1/skills/codebase-review/SKILL.md`

**검사:** SKILL.md에 3개 Phase(Discovery, Parallel Analysis, Report Synthesis)가 모두 정의되어 있는지 확인합니다.

Grep 도구로 검사:
- 패턴: `Phase 1.*Discovery` 또는 `Codebase Discovery`
- 패턴: `Phase 2.*Analysis` 또는 `Parallel Analysis`
- 패턴: `Phase 3.*Report` 또는 `Report Synthesis`

**PASS 기준:** 3개 Phase가 모두 존재
**FAIL 기준:** 누락된 Phase가 있는 경우
**수정 방법:** 누락된 Phase 섹션을 다른 Phase의 구조를 참고하여 추가

## Output Format

```markdown
## 코드베이스 리뷰 플러그인 검증 결과

| # | 검사 항목 | 상태 | 이슈 |
|---|-----------|------|------|
| 1 | 5개 에이전트 존재 | PASS/FAIL | 상세... |
| 2 | 필수 하위 섹션 | PASS/FAIL | 상세... |
| 3 | 평가 등급 일관성 | PASS/FAIL | 상세... |
| 4 | 커맨드 동기화 | PASS/FAIL | 상세... |
| 5 | 출력 포맷 완전성 | PASS/FAIL | 상세... |
| 6 | Phase 구조 | PASS/FAIL | 상세... |
```

## Exceptions

다음은 **위반이 아닙니다**:

1. **plugin.json의 구조 차이** — plugin.json은 메타데이터 파일이므로 에이전트 정의 구조를 따를 필요 없음
2. **에이전트별 고유 분석 항목 수 차이** — Security Agent는 OWASP Top 10 등 더 많은 항목을 가질 수 있으며, 이는 도메인 특성상 정상
3. **출력 포맷 내 에이전트별 섹션 길이 차이** — Security의 취약점 테이블 등 에이전트별 고유 출력 형식이 있을 수 있으며, 이는 정상
