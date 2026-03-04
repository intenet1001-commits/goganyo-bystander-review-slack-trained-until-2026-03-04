---
name: verify-playwright-v2
description: playwright-test-v2 에이전트 정의 파일의 구조, 패턴, 프로토콜 일관성을 검증합니다. 에이전트 파일 수정 후 사용.
---

# Playwright Test v2 에이전트 일관성 검증

## Purpose

1. **에이전트 파일 존재** — 6개 에이전트(test-lead, page-explorer, functional-tester, visual-inspector, api-interceptor, perf-auditor) 파일이 모두 존재하는지 검증
2. **Frontmatter 구조** — 모든 에이전트의 YAML frontmatter에 name, description, model, tools 필수 필드가 있는지 검증
3. **도구 목록 일관성** — test-lead는 리더 도구셋(Task, TeamCreate 등), 나머지 5개는 동일한 표준 도구셋을 가지는지 검증
4. **필수 섹션 존재** — 각 에이전트가 역할, Playwright MCP 도구 사용법, 실행 프로토콜 등 필수 섹션을 포함하는지 검증
5. **SKILL.md ↔ agents 동기화** — SKILL.md의 에이전트 팀 테이블과 스폰 명령이 실제 에이전트 파일과 일치하는지 검증

## When to Run

- 에이전트 정의 파일(`.md`)을 수정한 후
- 새로운 에이전트를 추가하거나 삭제한 후
- SKILL.md의 실행 프로토콜을 수정한 후
- 에이전트의 도구 목록이나 프로토콜을 변경한 후

## Related Files

| File | Purpose |
|------|---------|
| `plugins/playwright-test-v2/skills/playwright-test/SKILL.md` | 스킬 실행 프로토콜 (에이전트 스폰 및 오케스트레이션 정의) |
| `plugins/playwright-test-v2/agents/test-lead.md` | 팀 리더 에이전트 정의 |
| `plugins/playwright-test-v2/agents/page-explorer.md` | 페이지 탐색 에이전트 정의 |
| `plugins/playwright-test-v2/agents/functional-tester.md` | 기능 테스트 에이전트 정의 |
| `plugins/playwright-test-v2/agents/visual-inspector.md` | 시각/접근성 검사 에이전트 정의 |
| `plugins/playwright-test-v2/agents/api-interceptor.md` | API/네트워크 분석 에이전트 정의 |
| `plugins/playwright-test-v2/agents/perf-auditor.md` | 성능 감사 에이전트 정의 |

## Workflow

### Step 1: 6개 에이전트 파일 존재 확인

**디렉토리:** `plugins/playwright-test-v2/agents/`

**검사:** 6개 에이전트 파일이 모두 존재하는지 확인합니다.

Glob 도구로 검사:
- 패턴: `plugins/playwright-test-v2/agents/*.md`

**PASS 기준:** 다음 6개 파일이 모두 존재
- `test-lead.md`
- `page-explorer.md`
- `functional-tester.md`
- `visual-inspector.md`
- `api-interceptor.md`
- `perf-auditor.md`

**FAIL 기준:** 하나라도 누락된 에이전트 파일이 있는 경우
**수정 방법:** 누락된 에이전트 파일을 기존 에이전트의 구조를 참고하여 생성

### Step 2: Frontmatter 필수 필드 검증

**파일:** 6개 에이전트 파일 전체

**검사:** 각 에이전트의 YAML frontmatter에 필수 필드가 존재하는지 확인합니다.

각 에이전트 파일을 Read 도구로 읽고 frontmatter를 파싱합니다.

필수 필드:
- `name` — 에이전트 식별자
- `description` — 역할 설명
- `model` — 사용 모델 (현재: `sonnet`)
- `tools` — 사용 가능 도구 목록

**PASS 기준:** 6개 에이전트 모두 4개 필수 필드를 포함
**FAIL 기준:** 어떤 에이전트에서든 필수 필드가 누락된 경우
**수정 방법:** 누락된 필드를 다른 에이전트의 frontmatter를 참고하여 추가

### Step 3: 도구 목록 일관성 검증

**파일:** 6개 에이전트 파일 전체

**검사:** test-lead와 나머지 5개 에이전트의 도구 목록이 각각의 역할에 맞는지 확인합니다.

각 에이전트 파일을 Read 도구로 읽고 `tools:` 섹션을 추출합니다.

**test-lead 필수 도구:**
- `Task`, `SendMessage`, `Read`, `Write`, `Edit`, `Glob`, `Grep`, `Bash`
- `TaskCreate`, `TaskUpdate`, `TaskList`, `TaskGet`, `TeamCreate`, `ToolSearch`

**나머지 5개 에이전트 표준 도구셋 (모두 동일해야 함):**
- `ToolSearch`, `Read`, `Write`, `Bash`
- `TaskUpdate`, `TaskList`, `TaskGet`, `SendMessage`

Grep 도구로 빠른 확인:
- 패턴: `TaskCreate` — `test-lead.md`에만 존재해야 함
- 패턴: `TeamCreate` — `test-lead.md`에만 존재해야 함

**PASS 기준:** test-lead는 리더 도구셋, 나머지 5개는 동일한 표준 도구셋
**FAIL 기준:** 도구 목록이 불일치하는 에이전트가 있는 경우
**수정 방법:** 역할에 맞지 않는 도구를 추가/제거

### Step 4: 필수 섹션 존재 검증

**파일:** 6개 에이전트 파일 전체

**검사:** 각 에이전트가 역할에 맞는 필수 섹션을 포함하는지 확인합니다.

Grep 도구로 검사:

**전체 에이전트 공통 필수 섹션:**
- 패턴: `## 역할` — 6개 파일 모두에서 출현
- 패턴: `## Playwright MCP 도구 사용법` 또는 `Playwright MCP` — 6개 파일 모두에서 출현 (test-lead는 에이전트 스폰 가이드로 대체 가능)
- 패턴: `## 실행 프로토콜` 또는 `실행 프로토콜` — 6개 파일 모두에서 출현

**non-lead 에이전트(5개) 필수 섹션:**
- 패턴: `## 완료 보고` — 5개 파일에서 출현
- 패턴: `## shutdown 프로토콜` — 5개 파일에서 출현
- 패턴: `## 출력 포맷` — 5개 파일에서 출현

**PASS 기준:** 모든 에이전트가 역할에 맞는 필수 섹션을 포함
**FAIL 기준:** 누락된 섹션이 있는 경우
**수정 방법:** 다른 에이전트의 해당 섹션을 참고하여 추가

### Step 5: SendMessage 프로토콜 일관성 검증

**파일:** 5개 non-lead 에이전트 파일

**검사:** 모든 non-lead 에이전트의 완료 보고에서 `recipient: "test-lead"`로 메시지를 보내는지 확인합니다.

Grep 도구로 검사:
- 패턴: `recipient.*test-lead` 또는 `recipient: "test-lead"`
- 검색 경로: `plugins/playwright-test-v2/agents/`
- test-lead.md는 제외 (자기 자신에게 보내지 않음)

**PASS 기준:** 5개 non-lead 에이전트 모두에서 `recipient: "test-lead"` 패턴이 존재
**FAIL 기준:** 잘못된 recipient나 SendMessage가 누락된 에이전트가 있는 경우
**수정 방법:** 올바른 SendMessage 호출 추가

### Step 6: shutdown 프로토콜 일관성 검증

**파일:** 5개 non-lead 에이전트 파일

**검사:** 모든 non-lead 에이전트가 동일한 구조의 shutdown 프로토콜을 포함하는지 확인합니다.

Grep 도구로 검사:
- 패턴: `shutdown_response` — 5개 파일 모두에서 출현
- 패턴: `approve: true` — 5개 파일 모두에서 출현 (shutdown 승인)

**PASS 기준:** 5개 non-lead 에이전트 모두에서 `shutdown_response` + `approve: true` 패턴 존재
**FAIL 기준:** shutdown 프로토콜이 누락되거나 불완전한 에이전트가 있는 경우
**수정 방법:** 다른 에이전트의 shutdown 프로토콜 섹션을 복사하여 추가

### Step 7: SKILL.md ↔ agents 에이전트 이름 동기화 검증

**파일:** `plugins/playwright-test-v2/skills/playwright-test/SKILL.md`

**검사:** SKILL.md의 에이전트 팀 테이블에 나열된 에이전트 이름이 실제 에이전트 파일명과 일치하는지 확인합니다.

SKILL.md를 Read 도구로 읽고, 에이전트 팀 테이블에서 이름을 추출합니다.

SKILL.md에 있어야 하는 에이전트 이름:
- `test-lead`
- `page-explorer`
- `functional-tester`
- `visual-inspector`
- `api-interceptor`
- `perf-auditor`

Grep 도구로 SKILL.md에서 확인:
- 패턴: `test-lead` — 존재해야 함
- 패턴: `page-explorer` — 존재해야 함
- 패턴: `functional-tester` — 존재해야 함
- 패턴: `visual-inspector` — 존재해야 함
- 패턴: `api-interceptor` — 존재해야 함
- 패턴: `perf-auditor` — 존재해야 함

**PASS 기준:** 6개 에이전트 이름이 모두 SKILL.md에 존재하고, 실제 파일과 1:1 대응
**FAIL 기준:** SKILL.md에만 있고 파일이 없는 에이전트, 또는 파일은 있으나 SKILL.md에 없는 에이전트
**수정 방법:** 불일치 항목을 SKILL.md 또는 에이전트 파일에서 추가/수정

### Step 8: 출력 파일 경로 일관성 검증

**파일:** `plugins/playwright-test-v2/skills/playwright-test/SKILL.md`, 5개 non-lead 에이전트 파일

**검사:** SKILL.md의 출력 파일 목록이 각 에이전트의 출력 파일 경로와 일치하는지 확인합니다.

SKILL.md의 출력 파일 트리에서 추출:
- `tests/results/page-map.json` — page-explorer
- `tests/results/functional-report.json` — functional-tester
- `tests/results/visual-report.json` — visual-inspector
- `tests/results/api-report.json` — api-interceptor
- `tests/results/performance-report.json` — perf-auditor
- `tests/results/REPORT.md` — test-lead

각 에이전트 파일에서 Grep 도구로 해당 출력 파일 경로가 언급되는지 확인:
- 패턴: `page-map.json` — `page-explorer.md`에서 출현
- 패턴: `functional-report.json` — `functional-tester.md`에서 출현
- 패턴: `visual-report.json` — `visual-inspector.md`에서 출현
- 패턴: `api-report.json` — `api-interceptor.md`에서 출현
- 패턴: `performance-report.json` — `perf-auditor.md`에서 출현

**PASS 기준:** 모든 에이전트의 출력 파일 경로가 SKILL.md와 일치
**FAIL 기준:** 경로가 불일치하거나 누락된 경우
**수정 방법:** 불일치하는 파일 경로를 SKILL.md 또는 에이전트 파일에서 수정

## Output Format

```markdown
## Playwright Test v2 에이전트 일관성 검증 결과

| # | 검사 항목 | 상태 | 이슈 |
|---|-----------|------|------|
| 1 | 6개 에이전트 파일 존재 | PASS/FAIL | 상세... |
| 2 | Frontmatter 필수 필드 | PASS/FAIL | 상세... |
| 3 | 도구 목록 일관성 | PASS/FAIL | 상세... |
| 4 | 필수 섹션 존재 | PASS/FAIL | 상세... |
| 5 | SendMessage 프로토콜 | PASS/FAIL | 상세... |
| 6 | shutdown 프로토콜 | PASS/FAIL | 상세... |
| 7 | SKILL.md ↔ agents 동기화 | PASS/FAIL | 상세... |
| 8 | 출력 파일 경로 일관성 | PASS/FAIL | 상세... |
```

## Exceptions

다음은 **위반이 아닙니다**:

1. **test-lead의 도구 목록 차이** — test-lead는 팀 리더로서 Task, TaskCreate, TeamCreate 등 오케스트레이션 도구를 추가로 가지며, 이는 역할상 정상
2. **test-lead의 shutdown/완료보고 섹션 부재** — test-lead는 리더이므로 다른 에이전트에게 shutdown을 보내는 쪽이며, 자기 자신의 shutdown 프로토콜이나 완료 보고 섹션은 불필요
3. **에이전트별 고유 ToolSearch 쿼리 차이** — 각 에이전트는 역할에 맞는 Playwright 도구를 로드하므로 ToolSearch 쿼리가 다른 것은 정상 (예: visual-inspector는 screenshot/resize, api-interceptor는 network/console)
4. **에이전트별 출력 JSON 스키마 차이** — 각 에이전트의 결과 JSON 구조는 역할에 따라 다르며, 이는 정상
