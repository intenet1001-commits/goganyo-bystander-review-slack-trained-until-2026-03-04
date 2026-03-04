---
name: verify-playwright-v1
description: playwright-test-v1 플러그인의 에이전트 목록, 출력 경로, 커맨드 동기화, 설정값 일관성을 검증합니다. SKILL.md 수정 후 사용.
---

# Playwright Test v1 플러그인 일관성 검증

## Purpose

1. **에이전트 목록 일관성** — SKILL.md 내에서 5개 에이전트(Explorer, Functional, Visual, API, Performance) 이름이 모든 섹션에서 일관되게 사용되는지 검증
2. **출력 파일 경로 일관성** — Agent Details 섹션의 출력 파일과 Phase 4 결과 파일 목록이 일치하는지 검증
3. **커맨드 ↔ SKILL.md 동기화** — `commands/test.md`가 SKILL.md의 스킬 이름을 올바르게 참조하는지 검증
4. **plugin.json 메타데이터** — plugin.json의 name, description이 실제 스킬과 일치하는지 검증
5. **설정값 일관성** — Configuration 섹션의 에이전트 목록과 환경변수가 Agent Details와 일치하는지 검증

## When to Run

- SKILL.md의 에이전트 목록이나 출력 경로를 수정한 후
- commands/test.md를 수정한 후
- plugin.json을 수정한 후
- 새로운 에이전트를 추가하거나 제거한 후

## Related Files

| File | Purpose |
|------|---------|
| `plugins/playwright-test-v1/skills/playwright-test/SKILL.md` | 스킬 실행 프로토콜 및 에이전트 정의 |
| `plugins/playwright-test-v1/commands/test.md` | 커맨드 정의 (/test) |
| `plugins/playwright-test-v1/.claude-plugin/plugin.json` | 플러그인 메타데이터 |

## Workflow

### Step 1: 5개 에이전트 이름 일관성 검증

**파일:** `plugins/playwright-test-v1/skills/playwright-test/SKILL.md`

**검사:** SKILL.md 내에서 5개 에이전트 이름이 Agent Details 섹션, Protocol 다이어그램, Configuration 섹션에서 모두 일관되게 사용되는지 확인합니다.

Grep 도구로 검사:
- 패턴: `Explorer` — Agent Details + Protocol 다이어그램 + Configuration에 출현
- 패턴: `Functional` — 동일
- 패턴: `Visual` — 동일
- 패턴: `API` — 동일 (대소문자 주의: `API`와 `api` 구분)
- 패턴: `Performance` — 동일

추가로 소문자 에이전트 키 확인 (Configuration 섹션):
- 패턴: `explorer.*enabled` — Configuration에 존재
- 패턴: `functional.*enabled` — Configuration에 존재
- 패턴: `visual.*enabled` — Configuration에 존재
- 패턴: `api.*enabled` — Configuration에 존재
- 패턴: `performance.*enabled` — Configuration에 존재

**PASS 기준:** 5개 에이전트 이름이 Agent Details(대문자), Configuration(소문자), Protocol 다이어그램 모두에서 출현
**FAIL 기준:** 에이전트 이름이 누락되거나 불일치하는 섹션이 있는 경우
**수정 방법:** 누락된 에이전트 이름을 해당 섹션에 추가

### Step 2: Agent Details 파일 경로 일관성 검증

**파일:** `plugins/playwright-test-v1/skills/playwright-test/SKILL.md`

**검사:** 각 에이전트의 **File** 필드 경로가 일관된 패턴을 따르는지 확인합니다.

Grep 도구로 검사:
- 패턴: `tests/agents/explorer/index.js` — Agent 1에 존재
- 패턴: `tests/agents/functional/index.js` — Agent 2에 존재
- 패턴: `tests/agents/visual/index.js` — Agent 3에 존재
- 패턴: `tests/agents/api/index.js` — Agent 4에 존재
- 패턴: `tests/agents/performance/index.js` — Agent 5에 존재

**PASS 기준:** 5개 에이전트 파일 경로가 모두 `tests/agents/{name}/index.js` 패턴을 따름
**FAIL 기준:** 패턴이 일치하지 않는 에이전트 파일 경로가 있는 경우
**수정 방법:** 파일 경로를 올바른 패턴으로 수정

### Step 3: 출력 파일 경로 교차 검증

**파일:** `plugins/playwright-test-v1/skills/playwright-test/SKILL.md`

**검사:** Agent Details 섹션의 각 에이전트 **Output** 필드 경로가 Phase 4 결과 파일 목록과 일치하는지 확인합니다.

SKILL.md를 Read 도구로 읽고, 두 위치에서 출력 파일 경로를 추출하여 비교합니다.

**Agent Details의 출력 파일:**
- Agent 1 Explorer → `page-map.json`
- Agent 2 Functional → `functional-tests.json`
- Agent 3 Visual → `visual-tests.json`, screenshots
- Agent 4 API → `api-tests.json`, `network-logs.json`
- Agent 5 Performance → `performance-report.json`

**Phase 4의 결과 파일:**
- `page-map.json`
- `functional-tests.json`
- `visual-tests.json`
- `api-tests.json`
- `performance-report.json`

Grep 도구로 각 출력 파일명이 SKILL.md에서 최소 2회 출현하는지 확인:
- 패턴: `page-map\.json` — 2회 이상 (Agent Details + Phase 4)
- 패턴: `functional-tests\.json` — 2회 이상
- 패턴: `visual-tests\.json` — 2회 이상
- 패턴: `api-tests\.json` — 2회 이상
- 패턴: `performance-report\.json` — 2회 이상

**PASS 기준:** 모든 출력 파일이 Agent Details와 Phase 4 양쪽에 존재
**FAIL 기준:** 한쪽에만 존재하거나 이름이 불일치하는 출력 파일
**수정 방법:** 불일치하는 파일명을 양쪽에서 통일

### Step 4: 커맨드 ↔ SKILL.md 동기화 검증

**파일:** `plugins/playwright-test-v1/commands/test.md`, `plugins/playwright-test-v1/skills/playwright-test/SKILL.md`

**검사:** commands/test.md가 SKILL.md의 스킬 이름(`playwright-test`)을 올바르게 참조하는지 확인합니다.

Grep 도구로 검사:
- 패턴: `playwright-test` — `commands/test.md`에 존재
- 패턴: `SKILL.md` 또는 `skills/playwright-test` — `commands/test.md`에 존재

추가로 커맨드에서 언급된 에이전트 수가 SKILL.md와 일치하는지 확인:
- 패턴: `5` 또는 `five` — 커맨드 파일에서 에이전트 수 언급

**PASS 기준:** commands/test.md가 `playwright-test` 스킬을 참조하고, 에이전트 수가 일치
**FAIL 기준:** 잘못된 스킬 이름 참조 또는 에이전트 수 불일치
**수정 방법:** 참조를 올바른 스킬 이름과 에이전트 수로 수정

### Step 5: plugin.json 메타데이터 일관성 검증

**파일:** `plugins/playwright-test-v1/.claude-plugin/plugin.json`

**검사:** plugin.json의 name이 SKILL.md의 frontmatter name과 일치하는지 확인합니다.

Read 도구로 plugin.json을 읽고 확인:
- `name` 필드가 `"playwright-test"`인지
- `description`에 에이전트 수(`5`)가 언급되는지

Grep 도구로 SKILL.md의 frontmatter에서 확인:
- 패턴: `^name: playwright-test` — SKILL.md frontmatter에 존재

**PASS 기준:** plugin.json의 name과 SKILL.md frontmatter의 name이 일치
**FAIL 기준:** name이 불일치하는 경우
**수정 방법:** 두 파일의 name을 통일

### Step 6: Configuration 에이전트 키 ↔ Agent Details 동기화

**파일:** `plugins/playwright-test-v1/skills/playwright-test/SKILL.md`

**검사:** Configuration 섹션의 agents 객체 키가 Agent Details의 에이전트와 1:1 대응하는지 확인합니다.

Grep 도구로 Configuration 섹션에서 에이전트 키 추출:
- 패턴: `explorer:.*enabled` — 존재
- 패턴: `functional:.*enabled` — 존재
- 패턴: `visual:.*enabled` — 존재
- 패턴: `api:.*enabled` — 존재
- 패턴: `performance:.*enabled` — 존재

**PASS 기준:** Configuration의 5개 에이전트 키가 Agent Details의 5개 에이전트와 대응
**FAIL 기준:** Configuration에만 있거나 Agent Details에만 있는 에이전트
**수정 방법:** 불일치 항목을 추가/제거하여 동기화

### Step 7: Phase 구조 검증

**파일:** `plugins/playwright-test-v1/skills/playwright-test/SKILL.md`

**검사:** SKILL.md에 4개 Phase가 모두 정의되어 있는지 확인합니다.

Grep 도구로 검사:
- 패턴: `Phase 1` — Environment Setup
- 패턴: `Phase 2` — Test Execution
- 패턴: `Phase 3` — Agent Execution Flow
- 패턴: `Phase 4` — Result Analysis

**PASS 기준:** 4개 Phase가 모두 존재
**FAIL 기준:** 누락된 Phase가 있는 경우
**수정 방법:** 누락된 Phase 섹션 추가

## Output Format

```markdown
## Playwright Test v1 플러그인 일관성 검증 결과

| # | 검사 항목 | 상태 | 이슈 |
|---|-----------|------|------|
| 1 | 5개 에이전트 이름 일관성 | PASS/FAIL | 상세... |
| 2 | Agent Details 파일 경로 | PASS/FAIL | 상세... |
| 3 | 출력 파일 경로 교차 검증 | PASS/FAIL | 상세... |
| 4 | 커맨드 ↔ SKILL.md 동기화 | PASS/FAIL | 상세... |
| 5 | plugin.json 메타데이터 | PASS/FAIL | 상세... |
| 6 | Configuration 에이전트 키 | PASS/FAIL | 상세... |
| 7 | Phase 구조 | PASS/FAIL | 상세... |
```

## Exceptions

다음은 **위반이 아닙니다**:

1. **에이전트 이름의 대소문자 차이** — Agent Details에서는 대문자(`Explorer`), Configuration에서는 소문자(`explorer`)를 사용하는 것은 각 컨텍스트의 관례를 따르는 것으로 정상
2. **API 에이전트의 추가 출력 파일** — API 에이전트가 `api-tests.json` 외에 `network-logs.json`을 추가로 출력하는 것은 도메인 특성상 정상이며, Phase 4에 `network-logs.json`이 없어도 위반이 아님
3. **Visual 에이전트의 스크린샷** — Visual 에이전트가 `visual-tests.json` 외에 `tests/screenshots/*.png`를 생성하는 것은 정상이며, Phase 4에 스크린샷 개별 목록이 없어도 위반이 아님
4. **환경변수 테이블의 값 차이** — `TEST_URL`의 기본값이 Configuration의 `baseUrl`과 다르더라도, 둘 다 동일한 값을 가리키면 정상
