---
name: md-to-docx
description: "마크다운 문서를 보고서_템플릿_가이드_v5 양식에 맞춰 DOCX Word 문서로 변환합니다. 마크다운 보고서를 Word로 변환할 때 사용."
argument-hint: "<마크다운 파일 경로> [--style report|guideline]"
---

# md-to-docx Skill

## Purpose

Convert markdown report/guideline documents into professionally formatted DOCX Word files using `python-docx`, following the formatting rules defined in `보고서_템플릿_가이드_v5.md`. This skill eliminates the need to manually write a Python conversion script each time.

## When to Run

- User provides a markdown file path and wants a `.docx` output
- User says "convert to Word", "DOCX로 변환", "Word로 만들어줘", etc.
- User invokes `/md-to-docx path/to/file.md`

## Style Variants

There are two style variants. Ask the user if unclear which to use.

### Report Style (default)

Based on `create_ria_report.py` / `create_ria_premarketing.py`.

- **Section headings**: Roman numerals (`I. II. III. IV.`) via `add_section_heading(doc, text)`
- **Table titles**: Bracket format `[제목]` via `add_table_title(doc, title)`
- **Document title**: `add_title(doc, text)` (18pt, bold, center - fixed)
- **End mark**: `add_end_mark(doc)` helper function
- **Page number**: `add_page_number(doc)` helper function
- **Dash bullets**: `add_dash_bullet(doc, content, bold_keyword=None)` (fixed indent 1.8cm)
- **Dot bullets**: `add_dot_bullet(doc, content, bold_keyword=None)`
- **set_font**: No `color` parameter
- **create_table**: No `col_widths` parameter

### Guideline Style

Based on `create_ria_guideline.py`.

- **Section headings**: Numbered boxes (`1  2  3`) via `add_section_heading(doc, number, title)`
- **Roman sections**: Also available via `add_roman_section(doc, roman, title)`
- **Table titles**: Angle bracket format `<제목>` via `add_table_title(doc, title, indent=0.19)`
- **Document title**: `add_heading_text(doc, text, size=18, bold=True, alignment=CENTER)`
- **End mark**: Written directly (no helper function)
- **Checkbox items** (□): `add_checkbox_item(doc, keyword, content, bold_keyword=True)`
- **Circle bullets** (ㅇ): `add_circle_bullet_item(doc, content, bold_keyword=None)`
- **Diamond notes** (◇): `add_diamond_note(doc, content)`
- **Sub notes** (※): `add_sub_note(doc, content, indent=0.5)`
- **Arrow items** (→): `add_arrow_item(doc, content, indent=0.7)`
- **Circled numbers** (①②③): `add_numbered_sub_item(doc, number, content, bold_number=True)`
- **Dash items**: `add_dash_item(doc, content, indent=1.2)` (adjustable indent)
- **Plain paragraph**: `add_plain_paragraph(doc, content, size=11, indent=0)`
- **Info box**: `add_info_box(doc, title, content_lines)`
- **set_font**: Has `color=(R,G,B)` parameter
- **create_table**: Has `col_widths=[cm, cm, ...]` parameter
- **set_paragraph_format**: Utility available

## Related Files

| File | Role |
|---|---|
| `/Users/gwanli/Documents/GitHub/myproduct_v4/reports/보고서_템플릿_가이드_v5.md` | Source of truth for all formatting rules |
| `/Users/gwanli/Documents/GitHub/myproduct_v4/reports/create_ria_report.py` | Report style reference (v4 functions) |
| `/Users/gwanli/Documents/GitHub/myproduct_v4/reports/create_ria_guideline.py` | Guideline style reference (v5 functions) |
| `/Users/gwanli/Documents/GitHub/myproduct_v4/reports/create_ria_premarketing.py` | Recent report style example (v5) |

## Workflow

1. **Read** the source markdown file
2. **Determine style variant** (report vs guideline):
   - If `--style report` or `--style guideline` is specified, use that
   - If the markdown contains `□`, `ㅇ`, `◇`, numbered box headings (`1  Title`), default to guideline
   - If the markdown contains `I.`, `II.`, `III.` Roman numeral headings, default to report
   - If unclear, ask the user
3. **Analyze markdown structure**: Identify headings, lists, tables, special markers, footnotes
4. **Map each element** to the correct python-docx function (see Mapping Rules below)
5. **Generate** a `create_*.py` script in the same directory as the source markdown (or in the reports directory)
6. **Run** with `uv run python create_*.py` (or `python create_*.py` if python-docx is available)
7. **Verify** the output: `.docx` file exists and size > 10KB

## Markdown-to-Function Mapping Rules

### Both Styles

| Markdown Pattern | Python Function | Notes |
|---|---|---|
| `# Title` | `add_title(doc, text)` (report) / `add_heading_text(doc, text, size=18, bold=True)` (guideline) | Document title, 18pt bold center |
| `## I. Section` or `## Section` | `add_section_heading(doc, text)` (report) / `add_section_heading(doc, number, title)` (guideline) | 14pt bold, collapsible |
| `1. numbered item` | `add_numbered_item(doc, number, content)` | 12pt, number bold, indent 0.7cm |
| `(1) sub item` | `add_sub_numbered_item(doc, number, content)` | 11pt, indent 1.3cm |
| `- dash item` | `add_dash_bullet(doc, content, bold_keyword)` (report) / `add_dash_item(doc, content, indent)` (guideline) | 11pt |
| `**keyword** rest` inside bullets | Use `bold_keyword='keyword'` parameter | Splits text into bold + normal runs |
| `| table |` markdown table | `create_table(doc, headers, rows)` + optional `col_widths` (guideline) | 10pt, Table Grid, center |
| Table title line before table | `add_table_title(doc, title)` | `[title]` (report) or `<title>` (guideline) |
| `> quote` or `→ text` | `add_arrow_item(doc, content, indent=0.7)` | 11pt |
| `* footnote text` | `add_note_item(doc, content, indent=0.7)` | 10pt |
| Empty line between sections | `doc.add_paragraph()` | Blank separator |
| `[끝]` at end | `add_end_mark(doc)` (report) / manual paragraph (guideline) | 11pt bold center |

### Guideline Style Only

| Markdown Pattern | Python Function | Notes |
|---|---|---|
| `□ (keyword) content` | `add_checkbox_item(doc, keyword, content, bold_keyword=True)` | 11pt, indent 0.5cm |
| `ㅇ content` | `add_circle_bullet_item(doc, content, bold_keyword=None)` | 11pt, indent 1.0cm |
| `◇ content` | `add_diamond_note(doc, content)` | 11pt, no indent |
| `※ content` | `add_sub_note(doc, content, indent=0.5)` | 10pt |
| `① content` | `add_numbered_sub_item(doc, 1, content, bold_number=True)` | 11pt, indent 0.7cm |
| Plain text paragraph | `add_plain_paragraph(doc, content, size=11, indent=0)` | 11pt |
| Info box block | `add_info_box(doc, title, content_lines)` | 1x1 Table Grid box |

### Special: `• bullet` (Dot Bullet)

| Style | Function |
|---|---|
| Report | `add_dot_bullet(doc, content, bold_keyword=None)` |
| Guideline | `add_dot_bullet_item(doc, content, bold_keyword=None)` |

Both have identical formatting: 11pt, indent 1.0cm, hanging -0.4cm.

## Item Type Reference (All 14 Types)

| # | Type | Symbol | Function | Left Indent | Hanging | Size |
|---|---|---|---|---|---|---|
| 1 | Section (Roman) | I. II. III. | `add_roman_section()` / `add_section_heading()` | 0cm | - | 14pt |
| 2 | Section (Number box) | 1 2 3 | `add_section_heading(doc, num, title)` | 0cm | - | 14pt |
| 3 | Checkbox | □ | `add_checkbox_item()` | 0.5cm | -0.5cm | 11pt |
| 4 | Numbered | 1. 2. 3. | `add_numbered_item()` | 0.7cm | -0.5cm | 12pt |
| 5 | Circle bullet | ㅇ | `add_circle_bullet_item()` | 1.0cm | -0.4cm | 11pt |
| 6 | Dot bullet | • | `add_dot_bullet()` / `add_dot_bullet_item()` | 1.0cm | -0.4cm | 11pt |
| 7 | Arrow | → | `add_arrow_item()` | 0.7cm* | -0.3cm | 11pt |
| 8 | Circled number | ①②③ | `add_numbered_sub_item()` | 0.7cm | -0.5cm | 11pt |
| 9 | Sub-numbered | (1)(2)(3) | `add_sub_numbered_item()` | 1.3cm | -0.7cm | 11pt |
| 10 | Dash bullet | - | `add_dash_bullet()` / `add_dash_item()` | 1.8cm* | -0.4cm | 11pt |
| 11 | Diamond note | ◇ | `add_diamond_note()` | 0cm | - | 11pt |
| 12 | Sub note | ※ | `add_sub_note()` | 0.5cm* | - | 10pt |
| 13 | Note | * | `add_note_item()` | 0.7cm* | -0.3cm | 10pt |
| 14 | Plain paragraph | (none) | `add_plain_paragraph()` | 0cm* | - | 11pt |

`*` = adjustable via parameter

## Page & Font Settings

These MUST be set at the top of every generated script:

```python
from docx import Document
from docx.shared import Pt, Cm, Inches, RGBColor
from docx.enum.text import WD_ALIGN_PARAGRAPH
from docx.enum.table import WD_TABLE_ALIGNMENT
from docx.oxml.ns import qn
from docx.oxml import OxmlElement

doc = Document()

# Page setup - Letter size, 2.54cm margins
section = doc.sections[0]
section.page_width = Cm(21.59)    # or Inches(8.5)
section.page_height = Cm(27.94)   # or Inches(11)
section.top_margin = Cm(2.54)
section.bottom_margin = Cm(2.54)
section.left_margin = Cm(2.54)
section.right_margin = Cm(2.54)
```

- **Font**: 나눔명조 (NanumMyeongjo) for all text
- **Line spacing**: 1.15x for all paragraphs and table cells
- **Page number**: Footer, center, 나눔명조 10pt (report style adds via `add_page_number()`)

## Utility Functions Reference

### Core Utilities (include in every script)

```python
def set_font(run, font_name='나눔명조', size=11, bold=False, color=None):
    run.font.name = font_name
    run._element.rPr.rFonts.set(qn('w:eastAsia'), font_name)
    run.font.size = Pt(size)
    run.font.bold = bold
    if color:
        run.font.color.rgb = RGBColor(*color)

def set_line_spacing(paragraph, multiplier=1.15):
    pPr = paragraph._p.get_or_add_pPr()
    spacing = OxmlElement('w:spacing')
    spacing.set(qn('w:line'), str(int(240 * multiplier)))
    spacing.set(qn('w:lineRule'), 'auto')
    pPr.append(spacing)

def set_collapsible_heading(paragraph, outline_level=1):
    pPr = paragraph._p.get_or_add_pPr()
    outlineLvl = OxmlElement('w:outlineLvl')
    outlineLvl.set(qn('w:val'), str(outline_level - 1))
    pPr.append(outlineLvl)
```

### Guideline-only Utility

```python
def set_paragraph_format(paragraph, left_indent=None, first_line_indent=None,
                         space_before=None, space_after=None):
    pf = paragraph.paragraph_format
    if left_indent is not None:
        pf.left_indent = Cm(left_indent)
    if first_line_indent is not None:
        pf.first_line_indent = Cm(first_line_indent)
    if space_before is not None:
        pf.space_before = Pt(space_before)
    if space_after is not None:
        pf.space_after = Pt(space_after)
```

### Footnote Functions (when markdown contains footnotes)

```python
def create_footnote(doc, paragraph, footnote_text):
    # Creates a Word footnote with superscript reference
    # Footnote content: 9pt 나눔명조
    ...

def save_doc_with_footnotes(doc, filepath):
    # Must use this instead of doc.save() when footnotes are present
    ...
```

## Script Generation Rules

1. **File naming**: `create_{descriptive_name}.py` based on the markdown filename
2. **Output naming**: `{Descriptive_Name}.docx` in the same directory or specified output path
3. **Include only needed functions**: Report style scripts don't need guideline-only functions and vice versa
4. **Blank lines between sections**: Always add `doc.add_paragraph()` between major sections (after section headings, between numbered item groups)
5. **Bold keyword detection**: When markdown has `**keyword** rest of text`, extract and pass as `bold_keyword` parameter
6. **Table parsing**: Parse markdown tables (`| header | header |`) into `headers` list and `rows` list of lists
7. **Department/date line**: Look for a line like `부서명(YYYY.MM)` right after the title

## Exceptions & Edge Cases

| Case | Handling |
|---|---|
| Images in markdown (`![alt](url)`) | Insert placeholder text: `[이미지: {alt}]` as plain paragraph |
| Complex merged tables | Flag as manual adjustment needed; generate basic table |
| Emoji in headings | Strip emoji characters from heading text |
| Nested lists deeper than 3 levels | Flatten to dash bullets with increased indent |
| Footnote markers (`[^1]`) | Convert to `create_footnote()` calls; use `save_doc_with_footnotes()` |
| No clear style indicators | Default to report style; inform the user |
| Mixed Korean/English text | Both handled by 나눔명조 font |
| Very long single-line content | python-docx handles wrapping automatically |

## Output Format

After successful execution, report:
- Generated script path: `create_*.py`
- Output DOCX path: `*.docx`
- File size confirmation (should be > 10KB)
- Number of pages (approximate based on content length)
