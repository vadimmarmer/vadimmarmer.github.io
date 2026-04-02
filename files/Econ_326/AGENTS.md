# Repository Guidelines

## Project Structure & Module Organization
Lecture sources live at the repository root as `326_XX_topic.qmd`; each file is one lecture. Shared project configuration is in `_quarto.yml`. Slide-specific assets live alongside the sources, notably `slides_no_caps.css` and `reveal_mathjax_fragments.html`. Source figures belong in `figures/`. Rendered HTML, PDF, and RevealJS outputs are written to `output/` and are part of the repo, so update them when source files change. Quarto cache files live under `.quarto/` and should remain untracked.

## Build, Test, and Development Commands
- `quarto render 326_16_did.qmd` renders one lecture to HTML, PDF, and slides in `output/`.
- `quarto render` rebuilds the full project.
- `quarto render 326_07_cis.qmd --to revealjs` is the fastest slide-only check.
- `rg -n "katex-error" output/*.html` performs the standard post-render scan for math failures.

Use single-file renders while editing and rebuild all affected outputs before committing. PDF generation uses `xelatex`, so a working TeX installation is required.

## Coding Style & Naming Conventions
Keep the existing filename pattern: `326_XX_topic.qmd`, with matching output stems. Use 2-space indentation in YAML and nested lists. Preserve existing Quarto front matter structure where possible. Follow nearby lectures for notation, macros, and slide pacing rather than introducing new conventions mid-series. Prefer R chunks for tables and figures; keep them deterministic and scoped to the lecture being edited.

## Testing Guidelines
There is no separate unit-test suite in this directory. Validation is render-based: build the lecture you touched, confirm HTML/PDF/slides all succeed, scan the rendered HTML for `katex-error`, and manually spot-check slide overflow, equation alignment, and figure placement. If you edit shared files such as `_quarto.yml`, `slides_no_caps.css`, or shared math/render helpers, run `quarto render` for the full project.

## Commit & Pull Request Guidelines
Recent history uses short, imperative, lecture-scoped commit subjects such as `Lecture 16: clarify time FE slide` and `Lecture 20: replace Stata output with R code`. Keep commits focused on one lecture or one shared rendering fix. In pull requests, list the affected `.qmd` files, note whether `output/` artifacts were regenerated, and include screenshots only when layout, figure, or math-rendering changes need visual review.
