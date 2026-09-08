# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this directory is

This is a subdirectory of the `vadimmarmer.github.io` website repo, served at `vadimmarmer.com/files/Econ_527/` via GitHub Pages. It holds two kinds of material for Econ 527 (Econometric Methods, UBC MA):

- **Quarto slide decks**, one `.qmd` per deck, written and rendered here. This is where all slide work happens.
- **16 compiled PDF lecture notes**, `527_01.pdf` through `527_16.pdf`. Their LaTeX sources live in a separate private repo and are compiled elsewhere; only the PDFs are copied here.

The course page lists the slides first and the typed lecture notes below them.

## Related locations

| What | Path |
|------|------|
| LaTeX sources for the 16 PDFs | [`vadimmarmer/Econ-527`](https://github.com/vadimmarmer/Econ-527) (private), under `lecture_notes/` |
| TeX working directory | `/Users/vmarmer/Documents/teaching/Econ_527/lecture_notes/` |
| Teaching page | `_teaching/2023-09-Econ-527.md` (in parent website repo) |
| Parent website repo | `/Users/vmarmer/GitHub/vadimmarmer.github.io/` |
| Econ 326 decks, the model for this setup | `/Users/vmarmer/GitHub/vadimmarmer.github.io/files/Econ_326/` |
| Handwritten in-class notes and their transcriptions | `/Users/vmarmer/Library/CloudStorage/Dropbox/Notability/527/`, transcriptions in `transcripts/final/`, has own `CLAUDE.md`. A deck is drafted from them, but no file from there is ever copied into this folder, and that folder also holds scanned student exams carrying names and student numbers |
| Teaching-project guidance | `/Users/vmarmer/Documents/teaching/Econ_527/CLAUDE.md` |
| Project memory for the course | `/Users/vmarmer/.claude/projects/-Users-vmarmer-Documents-teaching-Econ_527/memory/MEMORY.md`, plus an older set under the earlier folder name at `/Users/vmarmer/.claude/projects/-Users-vmarmer-Documents-teaching-Econ-527/memory/MEMORY.md` |
| Project memory for this repository | `/Users/vmarmer/.claude/projects/-Users-vmarmer-GitHub-vadimmarmer-github-io/memory/MEMORY.md`, which holds the feedback on slide conciseness, derivation style and color that the Econ 326 decks were calibrated on and that applies here too |

## Slides

`PLAN.md` holds the approved outline of each deck, what the class actually covered in each teaching year, and the settled notation: transpose is `^\top`, the error is `U_i`, and expectation, variance and covariance use the `\E{}`, `\Var{}` and `\Cov{}` macros defined in a hidden block after the first heading. Read it before writing or extending a deck.

| Deck | File | Topic |
|---|---|---|
| 1 | `527_01_regression_ols.qmd` | Regression, identification, and the OLS estimator |

Each deck renders to three files in `output/`: an HTML page with a table of contents, a PDF, and a RevealJS slide show. All three are committed, because the HTML page and the slide show are what the course page links to.

```bash
quarto render 527_01_regression_ols.qmd
python3 /Users/vmarmer/.claude/scripts/qmd_render_check.py \
  output/527_01_regression_ols.html 527_01_regression_ols.qmd
python3 /Users/vmarmer/.claude/scripts/qmd_render_check.py \
  output/527_01_regression_ols_slides.html 527_01_regression_ols.qmd
```

The check must report clean on both HTML files before the work is finished: no math errors, no raw command leaks, no undefined macros, no macro block showing in the text, and self-contained output.

The three formats are configured per deck in the YAML frontmatter (`_quarto.yml` sets only the output directory and shared defaults). Copy the frontmatter of `527_01_regression_ols.qmd` for a new deck and change the three output file names. Both HTML outputs must stay self-contained (`embed-resources: true` on the page, `self-contained: true` on the slides); without that the published version breaks, because the external `_files/` directories are not committed.

Two settings worth knowing. `navigation-mode: linear` is required: level-one headings become section dividers, and without it the right arrow skips whole sections instead of moving slide by slide. `slides_no_caps.css` stops RevealJS from upper-casing headings.

## Adding a deck to the course page

Add one numbered line to the Slides section of `_teaching/2023-09-Econ-527.md`, in the same form as the existing entry: the title links to the HTML page, then `[[pdf]]` and `[[slides]]`. The Lecture notes section below it stays as it is.

## Workflow

**Slides.** Draft from the typed lecture notes and the transcriptions of the handwritten class notes, write and render here, commit the `.qmd` and all three files in `output/` to `vadimmarmer.github.io`, add the line to the course page. This repository is not cloud-synced, so the ordinary git commands apply, including `git pull`.

**Lecture notes.** Edit TeX in `/Users/vmarmer/Documents/teaching/Econ_527/lecture_notes/`, compile with `latexmk -pdf`, copy the PDF here, commit the TeX to `vadimmarmer/Econ-527` and the PDF to `vadimmarmer.github.io`.
