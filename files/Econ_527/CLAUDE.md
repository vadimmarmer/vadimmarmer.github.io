# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this directory is

This is a subdirectory of the `vadimmarmer.github.io` website repo, served at `vadimmarmer.com/files/Econ_527/` via GitHub Pages. It holds two kinds of material for Econ 527 (Econometric Methods, UBC MA):

- **Quarto slide decks**, one `.qmd` per deck. Since 2026-09-19 a new deck is drafted and reviewed in `/Users/vmarmer/Documents/teaching/Econ_527/slides/` and moved here only when the author says so; from then on it is edited and rendered here.
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

The settled notation across the decks: transpose is `^\top`, the error is `U_i`, and expectation, variance and covariance use the `\E{}`, `\Var{}` and `\Cov{}` macros, each defined in a hidden block after the first heading of its deck. Match it when writing or extending a deck.

| Deck | File | Topic |
|---|---|---|
| 1 | `527_01_regression_ols.qmd` | Regression, identification, and the OLS estimator |
| 2 | `527_02_ols_properties.qmd` | Properties of the OLS estimator: unbiasedness, variance, Gauss-Markov |
| 3 | `527_03_ols_geometry.qmd` | Geometry of OLS, projection matrices, the error variance, Frisch-Waugh-Lovell, partitioned regression with an intercept |

Each deck renders to three files in `output/`: an HTML page with a table of contents, a PDF, and a RevealJS slide show. All three are committed, because the HTML page and the slide show are what the course page links to.

Two rules hold for every render.

- **Everything a render produces goes into `output/`, never into this folder.** `_quarto.yml` sets `output-dir: output`, so run `quarto render` from this folder and let Quarto place the files; do not pass an output path on the command line. A `.tex`, `.log`, `.aux` file or a `_files/` folder left sitting here means the render stopped before it finished: delete the leftovers and render again.
- **Both HTML files must carry everything they need inside them.** `_quarto.yml` sets `embed-resources: true` on the page format and on the slide show format, so every deck in this folder inherits it and no deck should repeat it in its own frontmatter. Images, styles, fonts and scripts are then written inside the HTML file. Without this Quarto leaves a `_files/` folder beside each page, and a page that points at such a folder breaks as soon as it is published. The last line the check prints, `self-contained: yes`, is what confirms the setting took effect.

```bash
quarto render 527_01_regression_ols.qmd
python3 /Users/vmarmer/.claude/scripts/qmd_render_check.py \
  output/527_01_regression_ols.html 527_01_regression_ols.qmd
python3 /Users/vmarmer/.claude/scripts/qmd_render_check.py \
  output/527_01_regression_ols_slides.html 527_01_regression_ols.qmd
```

Decks 2 and 3 need more than Quarto. Their figures (in deck 2, the two panels
comparing a spread-out regressor with a concentrated one; in deck 3, the picture
of the projection for one regressor and two observations) are drawn through a `standAlone` `tikzDevice`
device so that LaTeX itself typesets the labels, which means the render calls
`pdflatex` and `pdftoppm` and needs the R packages `tikzDevice` and `png`. The helper that does it, `tikz_fig()`, sits in a hidden chunk just after
the macro block of each deck, and draws the figure into that chunk's own device rather than
handing it to `knitr::include_graphics()`.

The check must report clean on both HTML files before the work is finished: no math errors, no raw command leaks, no undefined macros, no macro block showing in the text, and self-contained output.

`_quarto.yml` holds what every deck shares: the output directory, the embedding of resources in both HTML formats, and defaults for figures and code. Each deck's frontmatter holds only what is its own, starting with the three output file names. Copy the frontmatter of `527_01_regression_ols.qmd` for a new deck and change those names; do not add `embed-resources` or `self-contained` back into it.

Two settings worth knowing. `navigation-mode: linear` is required: level-one headings become section dividers, and without it the right arrow skips whole sections instead of moving slide by slide. `slides_no_caps.css` stops RevealJS from upper-casing headings.

## Adding a deck to the course page

Add one numbered line to the Slides section of `_teaching/2023-09-Econ-527.md`, in the same form as the existing entry: the title links to the HTML page, then `[[pdf]]` and `[[slides]]`. The Lecture notes section below it stays as it is.

## Workflow

**Slides.** Draft from the typed lecture notes and the transcriptions of the handwritten class notes, in `/Users/vmarmer/Documents/teaching/Econ_527/slides/`. When the author says the deck is ready, move the `.qmd` here, render here, commit the `.qmd` and all three files in `output/` to `vadimmarmer.github.io`, add the line to the course page. This repository is not cloud-synced, so the ordinary git commands apply, including `git pull`.

**Lecture notes.** Edit TeX in `/Users/vmarmer/Documents/teaching/Econ_527/lecture_notes/`, compile with `latexmk -pdf`, copy the PDF here, commit the TeX to `vadimmarmer/Econ-527` and the PDF to `vadimmarmer.github.io`.
