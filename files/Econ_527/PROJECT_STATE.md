# Project State — Econ 527 slides and published notes

**Last updated:** 2026-09-07

## Where the work stands

This folder is now the single place where Econ 527 slide decks are written, rendered and published. The first deck, on regression, identification and the OLS estimator, is finished and live on the course page. The sixteen typed lecture note PDFs sit in the same folder and are unchanged; the course page lists the slides above them.

The decks are drafted from two sources that are read and never edited: the typed LaTeX notes in `/Users/vmarmer/Documents/teaching/Econ_527/lecture_notes/` and the transcriptions of the handwritten class notes in `/Users/vmarmer/Library/CloudStorage/Dropbox/Notability/527/transcripts/final/`. Everything a deck produces is written here.

## File inventory

| File | What it is | Status |
|---|---|---|
| `527_01_regression_ols.qmd` | Deck 1, 1062 lines, 58 slides | Published, proofread twice |
| `output/527_01_regression_ols.html` | The page version, with a table of contents | Live |
| `output/527_01_regression_ols_slides.html` | The RevealJS slide show | Live |
| `output/527_01_regression_ols.pdf` | The PDF, 120 KB | Live |
| `_quarto.yml` | Output directory and shared defaults | Current |
| `slides_no_caps.css` | Stops RevealJS upper-casing headings | Current |
| `PLAN.md` | Approved outline of each deck, what each teaching year covered, the notation | Deck 1 written, decks 2 and 3 sketched |
| `527_01.pdf` … `527_16.pdf` | The typed lecture notes, compiled elsewhere | Unchanged |
| `CLAUDE.md` | Guidance for this folder | Rewritten 2026-09-07 |

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

1. Deck 2, finite-sample properties: unbiasedness conditional on $X$ and unconditionally, why zero correlation alone is not enough, homoskedasticity, $\operatorname{Var}(\hat\beta\mid X) = \sigma^2(X^\top X)^{-1}$, Gauss-Markov with the proof. Outlined in `PLAN.md`, not written. The plan is to write it after deck 1 has been used in class or reviewed.
2. Deck 3, geometry: column space, projection matrices, $\hat\sigma^2$, goodness of fit. Outlined, not written.
3. A possible deck on median and quantile regression, taught in Fall 2022 and with no typed counterpart. Not decided.
4. Only the Fall 2022, 2023 and 2025 opening meetings are transcribed. Later meetings need transcribing in the Notability folder before the decks that cover them can be drafted.
5. This folder has no `TODO.md`, no proofreading agent and no slash command of its own, unlike `files/Econ_326/`. Worth adding if deck writing continues at volume.
