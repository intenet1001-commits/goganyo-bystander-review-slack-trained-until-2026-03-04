---
name: nds-tpl-certificate-capture
fileKey: 1xE0qvn2yv3ZkQ9BwhKT1y
source_url: "https://www.figma.com/design/1xE0qvn2yv3ZkQ9BwhKT1y/NDS_Templates?node-id=30554-12151"
learned_date: 2026-07-15
sections_studied:
  - "30554:12151 (page canvas '    - 확인서, 이미지 캡쳐 저장' — no separate title frame, 3 sections)"
  - "30554:12163 (section '이체확인서' — transfer confirmation, 2 img_area mockups + 1 composed detail-field spec panel)"
  - "30554:12810 (section '오픈뱅킹 이체내역' — open-banking transfer history, list screen + 2 img_area confirmation mockups)"
  - "30554:13253 (section '퇴직연금 가입확인서' — retirement-pension enrollment confirmation, 4 img_area mockups incl. DC/기업형IRP and 개인형IRP variants)"
  - "30554:12286 / 30554:12933 / 30554:13373 ('line' frames — red dimension-line callout, '693px' label, one per section)"
  - "45153:761 / 45153:749 ('confirm' frames — 확인일 stamp, boolean-operation 'stamp' + '확인일'/'NH투자증권' text, retirement-pension section only)"
status: internal NDS component-library guide (Templates file — usage-example gallery; ONE genuine Gotcha-7 exception found — a stated capture-area spec)
---

# NDS Templates — 확인서, 이미지 캡쳐 저장

Single-page usage gallery, three sections side by side on one canvas: **이체확인서** (transfer confirmation), **오픈뱅킹 이체내역** (open-banking transfer history), **퇴직연금 가입확인서** (retirement-pension enrollment confirmation). Each section shows 2–4 full-screen phone mockups of a confirmation-document screen with a share (공유하기) icon and a save-image (이미지 저장) icon at the bottom, plus one "capture area" annotation. Consistent with Gotcha 7's pattern (compose over prose) with **one real exception**: the capture-area dimension callout below.

## Layer names — mixed on this page

Most detail-row text nodes are placeholder-named `faq` (generic, unrelated to content — matches the pattern warned about elsewhere in this file family) — screenshot-confirmed the actual rendered values differ per row (계좌명, 금액, 날짜, etc.) while every node shares the name `faq`. By contrast, structural/semantic frames (`img_area`, `line`, `label`, `confirm`, `nds_img_confirm_stamp`, `stamp`) and the two component instances (`nds_img_ci_nh`, `이체확인서`) read reliably and match their on-canvas role. **Verdict: mixed — trust structural/instance names, do not trust `faq`-named leaf text.**

## Component keys — sampled via 5 explicit node IDs (no loop)

| Instance | main COMPONENT name | main key | remote | parent SET |
|---|---|---|---|---|
| `30554:12214` nds_img_ci_nh | `nds_img_ci_nh` | `5606ef4a1649de92606a121d2cdd5ad40f9c5e0a` | true | none — standalone COMPONENT |
| `30554:12940` nds_img_ci_nh (section 2) | `nds_img_ci_nh` | `5606ef4a1649de92606a121d2cdd5ad40f9c5e0a` | true | none — standalone COMPONENT (same key, corroborates) |
| `30554:13747` 이체확인서 | `이체확인서` | `9ffbf73d46ee304c6cf788d1024156c1888ea664` | true | none — standalone COMPONENT (the full-mockup wrapper itself is a published component) |
| `30554:12293` " " (share/save icon row) | — | unverified | — | `getMainComponentAsync` threw `"Operation attempted to modify the file while in read-only mode"` — read-only session, no key captured |
| `45153:763` nds_img_confirm_stamp | n/a | n/a | n/a | **not an instance — FRAME.** Despite the `nds_`-prefixed component-like name, this stamp (⭕ "확인일" / date / "NH투자증권") is hand-composed, not a real published component. Consistent with Gotcha 5c (name implies a component, node kind says otherwise). |

3/5 sampled resolve as real published, `remote: true` components (2 distinct, one corroborated twice) — consistent with Q4 (NDS_Templates subscribes to NDS_Library).

## TAXONOMY — artifacts / reactions

3 top-level sections (SECTION nodes), each a self-contained gallery of 2–4 static mockups. `.reactions` not swept (no `📱Sample Page`-style ambiguity here — sections are plainly parallel document-type variants, not a flow candidate), but no prototype-link affordance is visible on any mockup (each is a standalone full-bleed screen with a close ✕, not a "next" arrow). Treat as a static gallery, consistent with the rest of the file.

## ANSWER — capture size IS stated, closing part of the thumbnail/share gap

**Every section carries an explicit red dimension-line callout reading exactly:**

> **"캡쳐 영역"** (capture area) + **"693px"**

(verbatim text-node names `30554:12292` "캡쳐 영역" / `30554:12289` "693px"; screenshot-confirmed identical callout repeated in all 3 sections at `30554:12286`, `30554:12933`, `30554:13373`.)

This marks the **height** of the `img_area` frame the callout brackets — and that frame's **width is fixed at 540px** (every `img_area` frame across all 3 sections: `30554:12212`, `30554:12249`, `30554:12859`, `30554:12896`, `30554:13300`, `30554:13335` all have `width="540"`). So: **capture size = 540 × 693px, width fixed / height labeled 693px**, stated via an annotated redline diagram (not prose) — this IS a Gotcha-7 exception, same genre as `nds-tpl-share`'s 618px-max-height callout and `nds-tpl-article`'s type ramp.

**Caveat — the 693px label is nominal, not universally exact.** Metadata shows the actual `img_area` frame heights vary slightly by content: 693.0000610351562px (5 of 6 frames) vs 690.9999... (`30554:13335`, the DC/기업형IRP retirement mockup with one extra detail row). The label stays "693px" in all three sections regardless — so it reads as a **target/reference height**, not a hard pixel-exact contract, similar in spirit to `nds-tpl-share`'s "content-variable, capped" framing, though here the variance is downward (~2px) rather than an explicit content-variable rule.

**No ratio rule, no resolution/DPI, no file format, no filename convention found anywhere on this page.** The only interactive affordances are two icon buttons labeled **공유하기** (share) and **이미지 저장** (save image) — bare glyphs + Korean labels, no format badge (PNG/JPG), no filename pattern shown or implied. **This closes the thumbnail/share width question (540px, matching both `nds-tpl-thumbnail`'s 540×270 and `nds-tpl-share`'s 540px card) but leaves format/filename/DPI open — Gotcha 7's silence prediction holds for everything except the capture-area size itself.**

## Legal / 심사필 copy — found, verbatim

Two distinct disclaimer strings, each repeated identically across every mockup in their respective section (screenshot-confirmed, not paraphrased):

**이체확인서 section** (all 6 mockups, e.g. under `30554:12212`):
> "이체확인서는 고객의 편의를 위하여 제공 중이며, 증명서의 용도로 이용할 수 없습니다. (문의 : 고객지원센터 1544-0000)"

**오픈뱅킹 이체내역 section**: identical string repeated (same disclaimer, different transfer source — open banking vs internal).

**퇴직연금 가입확인서 section** (all 4 mockups):
> "가입확인서는 고객 편의를 위하여 제공되는 것으로 가입 확인용으로만 사용할 수 있습니다. (문의 : 연금자산관리센터 1544-6060)"

The retirement-pension section additionally carries a **certification stamp graphic** (not present in the other two sections) — a circular boolean-operation badge (`45153:764`/`45153:752` "stamp") with text **"확인일"** (confirmation date) / a date value (e.g. "2026.01.26") / **"NH투자증권"**, rendered as a hand-composed FRAME (`nds_img_confirm_stamp`), not a real component (see Gotcha 5c note above). This is the closest thing to 심사필 stamp-copy found: an issuer-verification badge, not a regulatory-review mark, but functionally the same genre (official-looking round stamp + date + issuer name affixed to a legal document mockup).

Also present, spec-adjacent: `30554:12295` text (verbatim) **"거래구분 02.출금 (단, 02-1 은 표시하지 않음)"** ("transaction type 02.withdrawal — note: 02-1 is not displayed") — a data-filtering rule for which transaction-type codes populate this template, tagged with a blue "당사 출금" pill badge in the screenshot. Not a capture/format rule, but a real prose spec on an otherwise example-only page.

## Blanks / gaps

- Icon-row instance (`30554:12293`, the 공유하기/이미지 저장 button group) key unverified — `getMainComponentAsync` threw in this read-only session; needs a write-capable re-check.
- No file format (PNG/JPG), DPI/resolution, or filename convention found anywhere on the page — silence here is a genuine finding, not an omission.
- The "693px" label's ~2px mismatch against one frame's actual measured height (690.9999...) is unresolved — could be a rounding artifact of that section's one extra detail row, not investigated further.
- `nds_img_confirm_stamp`'s date value only sampled from 2 mockups (both read "2026.01.26") — not confirmed whether this is a live dynamic field or a fixed example date across the whole page.
