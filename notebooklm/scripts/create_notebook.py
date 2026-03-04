#!/usr/bin/env python3
"""
NotebookLM 새 노트북 생성 스크립트
텍스트 파일 내용을 소스로 추가하여 새 노트북 생성
"""

import argparse
import sys
import time
from pathlib import Path

from patchright.sync_api import sync_playwright

sys.path.insert(0, str(Path(__file__).parent))

from auth_manager import AuthManager
from notebook_manager import NotebookLibrary
from browser_utils import BrowserFactory, StealthUtils


def create_notebook(title: str, content_file: str, headless: bool = True) -> str:
    """
    NotebookLM에 새 노트북 생성하고 텍스트 소스 추가

    Returns:
        생성된 노트북 URL
    """
    auth = AuthManager()
    if not auth.is_authenticated():
        print("⚠️  인증 필요. python auth_manager.py setup 실행")
        return None

    content = Path(content_file).read_text(encoding="utf-8")
    print(f"📄 콘텐츠 로드 완료: {len(content)} 글자")

    playwright = None
    context = None

    try:
        playwright = sync_playwright().start()
        context = BrowserFactory.launch_persistent_context(playwright, headless=headless)

        page = context.new_page()
        print("🌐 NotebookLM 홈 접속...")
        page.goto("https://notebooklm.google.com/", wait_until="domcontentloaded", timeout=30000)

        # 로그인 확인
        if "accounts.google.com" in page.url:
            print("❌ 로그인 필요. auth_manager.py setup 실행")
            return None

        StealthUtils.random_delay(2000, 3000)

        # "새 노트북" 버튼 클릭
        print("➕ 새 노트북 생성 중...")
        def screenshot_and_dump_buttons(path, label):
            page.screenshot(path=path)
            print(f"  📸 스크린샷: {path}")
            btns = page.query_selector_all("button")
            print(f"  [{label}] 버튼 목록:")
            for b in btns[:25]:
                try:
                    print(f"    • '{b.inner_text()[:40]}' aria='{b.get_attribute('aria-label')}'")
                except Exception:
                    pass

        # 1단계: "새로 만들기" 버튼 클릭
        # 한국어 UI: aria-label="새 노트 만들기" 또는 텍스트 "새로 만들기"
        print("  🔍 버튼 탐색...")
        StealthUtils.random_delay(1500, 2500)

        clicked = False
        # aria-label로 시도
        for aria in ["새 노트 만들기", "New notebook", "Create new notebook"]:
            try:
                btn = page.query_selector(f'button[aria-label="{aria}"]')
                if btn and btn.is_visible():
                    btn.click()
                    clicked = True
                    print(f"  ✓ aria-label '{aria}' 클릭")
                    break
            except Exception:
                continue

        if not clicked:
            # 텍스트 포함 버튼
            for text in ["새로 만들기", "New notebook"]:
                try:
                    btns = page.query_selector_all("button")
                    for b in btns:
                        if text in (b.inner_text() or ""):
                            b.click()
                            clicked = True
                            print(f"  ✓ 텍스트 '{text}' 버튼 클릭")
                            break
                    if clicked:
                        break
                except Exception:
                    continue

        if not clicked:
            screenshot_and_dump_buttons("/tmp/notebooklm_home.png", "홈")
            print("  ❌ 새로 만들기 버튼을 찾지 못했습니다")
            return None

        # 2단계: 새 노트북 페이지 또는 소스 추가 다이얼로그 대기
        print("⏳ 새 노트북 페이지 대기 중...")
        StealthUtils.random_delay(2500, 4000)
        screenshot_and_dump_buttons("/tmp/notebooklm_after_click.png", "클릭 후")

        # 3단계: 소스 추가 버튼 찾기
        # 새 노트북에 진입했을 때 "소스 추가" 버튼 or 다이얼로그의 "텍스트 복사"
        print("📎 소스 추가 버튼 탐색...")

        source_clicked = False
        # 노트북 내 소스 추가 버튼
        for aria in ["소스 추가", "Add source", "Add sources"]:
            try:
                btn = page.query_selector(f'button[aria-label="{aria}"]')
                if btn and btn.is_visible():
                    btn.click()
                    source_clicked = True
                    print(f"  ✓ '{aria}' 클릭")
                    break
            except Exception:
                continue

        if not source_clicked:
            for text in ["소스 추가", "Add source", "소스"]:
                try:
                    btns = page.query_selector_all("button")
                    for b in btns:
                        t = b.inner_text() or ""
                        if text in t and b.is_visible():
                            b.click()
                            source_clicked = True
                            print(f"  ✓ '{text}' 버튼 클릭")
                            break
                    if source_clicked:
                        break
                except Exception:
                    continue

        StealthUtils.random_delay(1500, 2500)

        # 4단계: "텍스트 복사" / "Copied text" 옵션 클릭
        print("📋 텍스트 소스 옵션 클릭...")
        StealthUtils.random_delay(1000, 1500)
        screenshot_and_dump_buttons("/tmp/notebooklm_source_menu.png", "소스 메뉴")

        paste_clicked = False
        # 한국어 UI: "복사된 텍스트" 버튼
        for text in ["복사된 텍스트", "Copied text", "텍스트 복사", "Paste text"]:
            try:
                btns = page.query_selector_all("button")
                for b in btns:
                    t = (b.inner_text() or "").strip()
                    if text in t and b.is_visible():
                        b.click()
                        paste_clicked = True
                        print(f"  ✓ '{text}' 버튼 클릭")
                        break
                if paste_clicked:
                    break
            except Exception:
                continue

        if not paste_clicked:
            screenshot_and_dump_buttons("/tmp/notebooklm_no_paste.png", "붙여넣기 실패")
            print("  ❌ 텍스트 소스 버튼을 찾지 못했습니다")
            return None

        StealthUtils.random_delay(1000, 2000)

        # 5단계: 텍스트 입력
        print("✍️  텍스트 입력 중...")
        screenshot_and_dump_buttons("/tmp/notebooklm_before_input.png", "입력 전")

        text_area = None
        for sel in ["textarea", 'div[contenteditable="true"]', '[role="textbox"]']:
            try:
                text_area = page.wait_for_selector(sel, timeout=5000, state="visible")
                if text_area:
                    print(f"  ✓ 입력 영역: {sel}")
                    break
            except Exception:
                continue

        if not text_area:
            print("  ❌ 텍스트 입력 영역 없음")
            return None

        text_area.click()
        StealthUtils.random_delay(300, 600)

        # pyperclip 또는 xclip으로 클립보드에 복사 후 붙여넣기
        import subprocess
        try:
            proc = subprocess.run(
                ["pbcopy"], input=content.encode("utf-8"), check=True
            )
            text_area.focus()
            page.keyboard.press("Meta+a")
            page.keyboard.press("Meta+v")
            print(f"  ✓ pbcopy + 붙여넣기 완료")
        except Exception:
            # JS로 직접 설정
            try:
                tag = text_area.evaluate("el => el.tagName.toLowerCase()")
                if tag == "textarea":
                    page.evaluate(
                        """(args) => {
                            const el = document.querySelector(args.sel);
                            const setter = Object.getOwnPropertyDescriptor(HTMLTextAreaElement.prototype,'value').set;
                            setter.call(el, args.txt);
                            el.dispatchEvent(new Event('input', {bubbles:true}));
                        }""",
                        {"sel": "textarea", "txt": content}
                    )
                else:
                    text_area.fill(content[:50000])
                print("  ✓ JS 입력 완료")
            except Exception as e:
                print(f"  ⚠️ 입력 오류: {e}")

        StealthUtils.random_delay(800, 1500)

        # 제목 입력
        for sel in ['input[placeholder*="제목"]', 'input[placeholder*="title" i]']:
            try:
                inp = page.query_selector(sel)
                if inp and inp.is_visible():
                    inp.fill(title)
                    print(f"  ✓ 제목: {title}")
                    break
            except Exception:
                continue

        StealthUtils.random_delay(500, 1000)

        # 6단계: 삽입/저장 버튼 클릭
        print("💾 삽입 버튼 클릭...")
        inserted = False
        for text in ["삽입", "Insert", "추가", "저장", "노트북 만들기", "Create notebook"]:
            try:
                btns = page.query_selector_all("button")
                for b in btns:
                    t = b.inner_text() or ""
                    if text in t and b.is_visible() and b.is_enabled():
                        b.click()
                        inserted = True
                        print(f"  ✓ '{text}' 버튼 클릭")
                        break
                if inserted:
                    break
            except Exception:
                continue

        if not inserted:
            screenshot_and_dump_buttons("/tmp/notebooklm_no_insert.png", "삽입 버튼 없음")
            print("  ⚠️ 삽입 버튼 못찾음, 계속 진행...")

        StealthUtils.random_delay(4000, 6000)
        screenshot_and_dump_buttons("/tmp/notebooklm_after_insert.png", "삽입 후")

        # 노트북 URL 확인 (새 노트북 생성되면 URL 변경됨)
        print("🔗 노트북 URL 확인...")
        deadline = time.time() + 30
        notebook_url = None
        while time.time() < deadline:
            current_url = page.url
            if "notebooklm.google.com/notebook/" in current_url:
                notebook_url = current_url
                print(f"  ✓ 노트북 URL: {notebook_url}")
                break
            time.sleep(1)

        if not notebook_url:
            print(f"  현재 URL: {page.url}")
            page.screenshot(path="/tmp/notebooklm_final.png")
            return page.url if "notebooklm" in page.url else None

        return notebook_url

    except Exception as e:
        print(f"❌ 오류: {e}")
        import traceback
        traceback.print_exc()
        if page:
            page.screenshot(path="/tmp/notebooklm_error.png")
        return None

    finally:
        if context:
            try:
                context.close()
            except Exception:
                pass
        if playwright:
            try:
                playwright.stop()
            except Exception:
                pass


def main():
    parser = argparse.ArgumentParser(description="NotebookLM 새 노트북 생성")
    parser.add_argument("--title", required=True, help="노트북 제목")
    parser.add_argument("--content-file", required=True, help="소스 텍스트 파일 경로")
    parser.add_argument("--show-browser", action="store_true", help="브라우저 표시")
    parser.add_argument("--add-to-library", action="store_true", help="라이브러리에 자동 추가")
    args = parser.parse_args()

    url = create_notebook(
        title=args.title,
        content_file=args.content_file,
        headless=not args.show_browser,
    )

    if url:
        print(f"\n✅ 노트북 생성 완료!")
        print(f"🔗 URL: {url}")

        if args.add_to_library:
            library = NotebookLibrary()
            nb_id = library.add_notebook(
                url=url,
                name=args.title,
                description="RIA/EAG 출시 로드맵, UX 원칙, 계좌·한도·보안·시뮬레이터 설계 회의",
                topics=["RIA", "EAG", "UX", "계좌개설", "절세", "시뮬레이터", "회의"],
            )
            library.set_active_notebook(nb_id)
            print(f"📚 라이브러리 등록: {nb_id}")
        return 0
    else:
        print("❌ 노트북 생성 실패")
        return 1


if __name__ == "__main__":
    sys.exit(main())
