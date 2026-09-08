## 2026-09-07

### Summary

Moved the Econ 527 Quarto slide work from `/Users/vmarmer/Documents/teaching/Econ_527/slides/` into this folder, published the first deck, and rebuilt the course page so it lists slides first and the typed lecture notes below them. Updated the guidance file in each of the four folders the course spans.

### File changes

- Created here: `527_01_regression_ols.qmd` (1062 lines), `_quarto.yml`, `slides_no_caps.css`, `PLAN.md`, `.gitignore` (ignores `/.quarto/`), and `output/` with `527_01_regression_ols.html`, `527_01_regression_ols.pdf` (120 KB) and `527_01_regression_ols_slides.html`. All moved from the old folder, then re-rendered here.
- Rewritten: `files/Econ_527/CLAUDE.md`. It used to say the folder held compiled PDFs only. It now covers the deck workflow, the render and check commands, the frontmatter conventions, how to add a deck to the course page, and the other three folders.
- Modified: `_teaching/2023-09-Econ-527.md` gained a Slides section above Lecture notes, plus one `&nbsp;` paragraph between the two so the sections do not sit on top of each other.
- Modified: repo `CLAUDE.md` describes this folder as slides plus PDFs, in the structure listing, the course section and the build commands.
- Modified outside this repo, both untracked in their own folders by design: `/Users/vmarmer/Documents/teaching/Econ_527/CLAUDE.md` (records the move, drops the dead render command, rewrites the closing table) and `/Users/vmarmer/Library/CloudStorage/Dropbox/Notability/527/CLAUDE.md` (adds the decks to its table and says drafting decks is now the main use of `transcripts/final/`).
- Deleted: `/Users/vmarmer/Documents/teaching/Econ_527/slides/`, empty after the move apart from a Quarto cache. It was untracked in `vadimmarmer/Econ-527`, so no git bookkeeping followed.

### Key results

- The deck re-rendered from its new location with exit code 0, all three outputs rebuilt. `qmd_render_check.py` reports clean on both HTML files: 0 math errors, no raw command leaks, no undefined macros, no macro block in the text, both self-contained.
- Published and verified live: the course page and all three deck files return HTTP 200 at `vadimmarmer.com`. GitHub Pages built after each push.
- Three commits: `dec274c` the move and the page, `c042615` the cross-references, `482a2d8` the spacing. Total 8221 insertions across 11 files.
- Both project memory folders for this course exist, one under the current folder name `-Econ_527` and one under the earlier `-Econ-527`, and the guidance files disagreed about which to read. Each now names both. Every path cited in the four guidance files was checked to exist.
- The deck is 58 slides and ends at the OLS formula with the least-squares proof; `PLAN.md` holds the approved outline and sketches the decks after it.

### Cross-references

- `PLAN.md` fixes the notation for every deck: transpose `^\top`, error `U_i`, and the `\E{}`, `\Var{}`, `\Cov{}` macros in a hidden block after the first heading.
- A deck is drafted from two read-only sources: the typed notes in `/Users/vmarmer/Documents/teaching/Econ_527/lecture_notes/` and the transcriptions in `/Users/vmarmer/Library/CloudStorage/Dropbox/Notability/527/transcripts/final/`.
- The course page `_teaching/2023-09-Econ-527.md` links to `output/527_01_regression_ols.html`, its PDF, and its slide show.
- Slide style feedback collected for Econ 326 lives in `/Users/vmarmer/.claude/projects/-Users-vmarmer-GitHub-vadimmarmer-github-io/memory/` and applies to these decks too.

