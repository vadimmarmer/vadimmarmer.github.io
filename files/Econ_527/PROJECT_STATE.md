# Project State: Econ 527 slides and published notes

**Last updated:** 2026-09-22

## Where the work stands

This folder is where Econ 527 slide decks are published. Three decks are live on the course page: regression, identification and the OLS estimator; the properties of the OLS estimator; and the geometry of OLS with partitioned regression. The sixteen typed lecture note PDFs sit in the same folder and are unchanged; the course page lists the slides above them.

A new deck is drafted, reviewed and rendered in `/Users/vmarmer/Documents/teaching/Econ_527/slides/` and moved here only when the author says so. Deck 3 was moved on 2026-09-22. Its working record, `_527_03_sources_and_review.md` (the pages of the class notes each slide follows, and every review finding with its outcome), stays in that folder and is not published.

The decks are drafted from two sources that are read and never edited: the typed LaTeX notes in `/Users/vmarmer/Documents/teaching/Econ_527/lecture_notes/` and the transcriptions of the handwritten class notes in `/Users/vmarmer/Library/CloudStorage/Dropbox/Notability/527/transcripts/final/`.

## File inventory

| File | What it is | Status |
|---|---|---|
| `527_01_regression_ols.qmd` | Deck 1, 58 slides | Published, trimmed by the author after publication |
| `527_02_ols_properties.qmd` | Deck 2 | Published, trimmed 2026-09-17 and again by the author |
| `527_03_ols_geometry.qmd` | Deck 3, 1116 lines, 37 slides in six sections | Published 2026-09-22 |
| `output/<deck>.html`, `<deck>_slides.html`, `<deck>.pdf` | The page with a table of contents, the RevealJS slide show, the PDF, for each deck | Live |
| `_quarto.yml` | Output directory, `embed-resources: true` for both HTML formats, shared defaults | Current |
| `slides_no_caps.css` | Stops RevealJS upper-casing headings | Current |
| `527_01.pdf` … `527_16.pdf` | The typed lecture notes, compiled elsewhere | Unchanged |
| `CLAUDE.md` | Guidance for this folder | Updated 2026-09-22 for deck 3 and the drafting folder |

## The decks

**Deck 1.** Motivation and data, probability, conditional expectation, the linear regression model, identification, estimation and least squares. Ends at $\hat\beta = (X^\top X)^{-1}X^\top Y$ with the proof that it minimises the sum of squares.

**Deck 2.** The model and the assumptions, unbiasedness, the variance of a random vector, the variance of the OLS estimator, the Gauss-Markov theorem, two extensions and the summary. The assumptions are numbered as `lecture_notes/527_02.tex` lines 176 to 179 number them. Nine slides render taller than the RevealJS slide box and four carry display mathematics wider than it; everything scrolls and nothing is lost.

**Deck 3.** Geometry of OLS (norm, column space, the closest point, the picture for one regressor and two observations); the projection matrices $P_X$ and $M_X$ with each property derived; estimation of the error variance (the trace argument, the bias of the estimator that divides by $n$, standard errors); the Frisch-Waugh-Lovell theorem; partitioned regression with an intercept. It was written from the class notes of Fall 2022, 2023 and 2025, then reviewed section by section until a review found nothing. Left out on purpose, for the next deck: $R^2$ and goodness of fit, long against short regressions, omitted variables, dummy variables. On the slide "Slope: deviations from the mean" it follows the Fall 2022 route; Fall 2025 takes another, and that choice is still the author's to make.

Decks 2 and 3 draw their figures through `tikzDevice`, so the render needs `pdflatex`, `pdftoppm` and the R packages `tikzDevice` and `png` (details in `CLAUDE.md`). If the render stops with "Bad CPU type in executable" naming `/opt/miniconda3/bin/pandoc`, take `/opt/miniconda3/bin` off the path for that command.

## How to build and check

```bash
quarto render 527_03_ols_geometry.qmd
python3 /Users/vmarmer/.claude/scripts/qmd_render_check.py \
  output/527_03_ols_geometry.html 527_03_ols_geometry.qmd
python3 /Users/vmarmer/.claude/scripts/qmd_render_check.py \
  output/527_03_ols_geometry_slides.html 527_03_ols_geometry.qmd
```

Both HTML files must report clean on all five signals. On 2026-09-22 deck 3 did: 0 math errors, no raw command leaks, no undefined macros, no macro block showing, both self-contained; PDF 16 pages.

## Publishing

Commit the `.qmd` and all three files in `output/`, then add one numbered line to the Slides section of `_teaching/2023-09-Econ-527.md`. This repository is not cloud-synced, so the ordinary git commands apply. GitHub Pages rebuilds on push; `gh api repos/vadimmarmer/vadimmarmer.github.io/pages/builds/latest` reports when it is done.

## Unresolved items

1. Deck 3 has not been checked for slides taller than the RevealJS slide box. The `revealjs-check` agent can do it; it edits the deck, so it runs only when asked.
2. The open choice on deck 3's slide "Slope: deviations from the mean", above.
3. Deck 2: whether to split the tall and wide slides; the slide heading that repeats its section heading; whether "weighted least squares" keeps deck 2's general positive-definite meaning or deck 1's diagonal one.
4. Next decks, with the class notes already transcribed: what deck 3 left out, then confidence intervals, then hypothesis testing. A possible deck on median and quantile regression (Fall 2022, no typed counterpart) is not decided.
5. This folder has no `TODO.md`, no proofreading agent and no slash command of its own, unlike `files/Econ_326/`.
