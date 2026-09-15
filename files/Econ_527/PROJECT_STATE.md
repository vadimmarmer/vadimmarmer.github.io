# Project State — Econ 527 slides and published notes

**Last updated:** 2026-09-15

## Where the work stands

This folder is now the single place where Econ 527 slide decks are published. Two decks are live on the course page: the first, on regression, identification and the OLS estimator, and the second, on the properties of the OLS estimator. Deck 2 was drafted and audited in `/Users/vmarmer/Documents/teaching/Econ_527/slides/` and copied here on 2026-09-15; that folder keeps the proof audit and the referees' claims, which are not published. The sixteen typed lecture note PDFs sit in the same folder and are unchanged; the course page lists the slides above them.

The decks are drafted from two sources that are read and never edited: the typed LaTeX notes in `/Users/vmarmer/Documents/teaching/Econ_527/lecture_notes/` and the transcriptions of the handwritten class notes in `/Users/vmarmer/Library/CloudStorage/Dropbox/Notability/527/transcripts/final/`. Everything a deck produces is written here.

## File inventory

| File | What it is | Status |
|---|---|---|
| `527_01_regression_ols.qmd` | Deck 1, 1062 lines, 58 slides | Published, proofread twice |
| `output/527_01_regression_ols.html` | The page version, with a table of contents | Live |
| `output/527_01_regression_ols_slides.html` | The RevealJS slide show | Live |
| `output/527_01_regression_ols.pdf` | The PDF, 120 KB | Live |
| `527_02_ols_properties.qmd` | Deck 2, 886 lines, 52 slides | Published, proof-audited and polished |
| `output/527_02_ols_properties.html` | The page version, with a table of contents | Live |
| `output/527_02_ols_properties_slides.html` | The RevealJS slide show | Live |
| `output/527_02_ols_properties.pdf` | The PDF, 15 pages, 244 KB | Live |
| `PLAN_02.md` | Outline of deck 2, slide by slide, with the source meeting for each part | Current |
| `_quarto.yml` | Output directory and shared defaults | Current |
| `slides_no_caps.css` | Stops RevealJS upper-casing headings | Current |
| `PLAN.md` | Outline of deck 1, what each teaching year covered, the notation | Decks 1 and 2 written, deck 3 sketched |
| `527_01.pdf` … `527_16.pdf` | The typed lecture notes, compiled elsewhere | Unchanged |
| `CLAUDE.md` | Guidance for this folder | Rewritten 2026-09-07 |

## Deck 2, as published

Six top-level sections: the model and the assumptions, unbiasedness, the variance of a random vector, the variance of the OLS estimator, the Gauss-Markov theorem, and two extensions with the summary. The assumptions are numbered as the typed notes number them, `lecture_notes/527_02.tex` lines 176 to 179: 1 the model, 2 zero conditional mean, 3 homoskedasticity and no autocorrelation, 4 the rank condition.

Rendering deck 2 needs more than Quarto. Its two figures are drawn through a `standAlone` `tikzDevice` device, so that LaTeX itself typesets their labels and the figure text matches the mathematics on the slides. The render therefore calls `pdflatex` and `pdftoppm` and needs the R packages `tikzDevice` and `png`. The helper, `tikz_fig()`, is defined in a hidden chunk just after the macro block, and `PLAN_02.md` explains it, including why the image is drawn into the chunk's own device instead of being handed to `knitr::include_graphics()`.

Nine slides render taller than the RevealJS slide box and four carry display mathematics wider than it. Everything scrolls and nothing is lost; whether to split those slides is still open.

## Deck 1, as published

Six top-level sections: motivation and data, probability, conditional expectation, the linear regression model, identification, estimation and least squares. It ends at $\hat\beta = (X^\top X)^{-1}X^\top Y$ with the proof that it minimises the sum of squares. Nothing about unbiasedness, variance or efficiency, which belong to deck 2.

Sixty-four corrections were applied in the first proofreading round and a second round followed, both on 2026-09-07 before the move. The details are in the status section of `PLAN.md`.

## How to build and check

```bash
quarto render 527_01_regression_ols.qmd
python3 /Users/vmarmer/.claude/scripts/qmd_render_check.py \
  output/527_01_regression_ols.html 527_01_regression_ols.qmd
python3 /Users/vmarmer/.claude/scripts/qmd_render_check.py \
  output/527_01_regression_ols_slides.html 527_01_regression_ols.qmd
```

Both HTML files must report clean on all five signals before the work is finished. As of 2026-09-07 both do: 0 math errors, no raw command leaks, no undefined macros, no macro block showing in the text, both self-contained.

Two settings that must not be dropped when a new deck copies this one's frontmatter. `navigation-mode: linear` keeps the right arrow moving slide by slide, because level-one headings otherwise become vertical stacks the arrow skips. `embed-resources: true` on the page and `self-contained: true` on the slides keep the published files working, because the external `_files/` directories are not committed.

## Publishing

Commit the `.qmd` and all three files in `output/`, then add one numbered line to the Slides section of `_teaching/2023-09-Econ-527.md` linking the title to the HTML page, with `[[pdf]]` and `[[slides]]` after it. This repository is not cloud-synced, so the ordinary git commands apply. GitHub Pages rebuilds on push; `gh api repos/vadimmarmer/vadimmarmer.github.io/pages/builds/latest` reports when it is done.

## Unresolved items

1. Deck 2 now exists in two places: here, and the working copy in `/Users/vmarmer/Documents/teaching/Econ_527/slides/`. They are identical as of 2026-09-15. Decide which one is edited from now on, so the two do not drift.
2. Deck 3, geometry: column space, projection matrices, $\hat\sigma^2$, goodness of fit. Outlined, not written.
3. A possible deck on median and quantile regression, taught in Fall 2022 and with no typed counterpart. Not decided.
4. Only the Fall 2022, 2023 and 2025 opening meetings are transcribed. Later meetings need transcribing in the Notability folder before the decks that cover them can be drafted.
5. This folder has no `TODO.md`, no proofreading agent and no slash command of its own, unlike `files/Econ_326/`. Worth adding if deck writing continues at volume.
