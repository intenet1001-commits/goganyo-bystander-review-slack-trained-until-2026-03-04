# LEDGER — contested, blocked, unresolved (asset)

> **One place for what is NOT settled across this domain's projects.** BUILD reads an anchor only when `INDEX.md`
> flags a topic ⚠/⛔. VERIFY reads this always — it is the worklist.
>
> **⛔ BLOCKED** = cannot be satisfied / determined with what exists. Escalate; do not fake it.
> **⚠ CONTESTED** = real but ambiguous. Do not resolve by picking the tidy answer.
>
> **Maintained single-threaded by the orchestrator.** Subagents return proposed entries as text and never edit it.
>
> ⚠️ **Cross-project conflicts must be filed HERE, not only in a project note.** With N projects, the thing that
> catches "project A and project B disagree" is this file — nothing else looks across them. If a VERIFY pass notes a
> contradiction only in one project's note, **it is lost.** Discipline, not structure.

---

## header-account-spacing — ⛔ BLOCKED (no value exists anywhere)
A 2026-07-15 BUILD rehearsal could not determine the **pixel spacing between the header and the account controller**.
`../nds`'s 원칙 4 says the controller sits *"directly under the header/tab, nothing between"* — that is a **positional**
rule, not a spacing value. **No file in either domain states a margin number for this joint.** Anyone pixel-matching
production must measure it in Figma or ask. **Do not invent one.**

## header-basic-key-choice — ⚠ CONTESTED (see `../nds/LEDGER.md#header-basic-keys`)
This project's note reports `header_basic` **instanced fine here**, with a title-as-dropdown variant `../nds/CORE.md`
doesn't document — contradicting CORE's "instancing throws" finding. **Both can be true**; the break may be file- or
branch-specific. **This is a *reliability* claim, not a design claim — the project-wins precedence does NOT settle it.**
Re-test in the target file. And it does **not** tell you which of the two real `header_basic` SET keys to import.

## ux-writing-drift-in-production — ⚠ CONTESTED (production contradicts the guide)
The shipped 국내주식권리 file uses **`조회 내역이 없습니다.`** — the `-습니다` form `../nds/projects/nds-ux-guide-empty-state.md`
**redlines**, mandating `-어요`. The NDS library itself drifts the same way on 3 of 7 no-data screens (correlated with
an older shell). So the guide is contradicted by **both the library and shipped production**. **Do not silently copy
production's copy style into a new screen, and do not assume the guide holds.** Escalate.

## Open gaps — recorded, not resolved by guessing (added 2026-07-15)

- `309:17357`'s fixed-header split (`fixed` zone + separately-scrolling `Frame 481821` body): whether this is a native Figma scroll container or a manually authored two-layer illusion was not determined — the read-only session blocks the deeper property inspection that would settle it.
- `338:12388` omits the 합산조회 checkbox present on every other 보유권리 list frame — deliberate state for this reference/scrolled-tab-bar frame, or stale copy from an older version? No annotation nearby addresses it.
- Whether `0:1`'s to-be section is an earlier draft of `222:4804`'s to-be, or a genuinely divergent proposal — needs a direct wireframe-by-wireframe diff, not attempted this pass.
- The 4 identical `btn_container_regular → 05_알림설정_계좌` prototype edges (`338:12721`/`12722`/`12723`/`12725`) — which specific on-screen button each one maps to is undetermined; they may be 4 different entry points on the same screen or partial duplicates.
- Page 2's stray "조회 설정" popup (`222:4568`) — where it actually came from (which other feature/file) was not traced.
