# vadimmarmer.github.io

Personal academic website for **Vadim Marmer**, Professor of Economics at UBC.
Built with Jekyll (GitHub Pages) + Quarto for lecture notes.
Live at: <https://vadimmarmer.com>

## Repository structure

```
_config.yml          # Jekyll site configuration
_pages/              # Static pages (about, CV, publications, teaching index)
_publications/       # Publication entries (Markdown, one per paper)
_teaching/           # Course pages (Markdown, one per course)
_layouts/            # Jekyll HTML templates
_includes/           # Reusable HTML partials
_sass/               # SCSS stylesheets
assets/              # Site-wide CSS/JS
images/              # Site images (avatar, etc.)
files/               # Downloadable files: papers, supplements, lecture notes
  Econ_326/          # Econ 326 Quarto lecture notes (.qmd sources + output/)
  Econ_327/          # Econ 327 lecture note PDFs (has own CLAUDE.md)
  Econ_527/          # Econ 527 Quarto slides (.qmd sources + output/) and lecture note PDFs (has own CLAUDE.md)
  Econ_627/          # Econ 627 lecture note PDFs (has own CLAUDE.md)
  Lima_2017/         # Lima workshop 2017
  Lima_2023/         # Lima workshop 2023
```

## Teaching courses

| Course | Page | Materials |
|---|---|---|
| Econ 326 | `_teaching/2026-01-Econ-326.md` | `files/Econ_326/` |
| Econ 327 | `_teaching/2015-01-Econ-327.md` | `files/Econ_327/` |
| Econ 527 | `_teaching/2023-09-Econ-527.md` | `files/Econ_527/` |
| Econ 627 | `_teaching/2020-01-Econ-627.md` | `files/Econ_627/` |

## Econ 327 lecture notes

Introduction to Empirical Methods (undergrad probability/statistics). PDFs are in `files/Econ_327/`; LaTeX sources are in a separate private repo [`vadimmarmer/Econ-327`](https://github.com/vadimmarmer/Econ-327) under `lecture_notes/` (working directory: `/Users/vmarmer/Documents/teaching/Econ_327/lecture_notes/`). See `files/Econ_327/CLAUDE.md` for details.

## Econ 527 slides and lecture notes

Econometric Methods (masters). `files/Econ_527/` holds both halves of the course material, and the course page `_teaching/2023-09-Econ-527.md` lists the slides first and the typed lecture notes below them.

- **Quarto slide decks**, `files/Econ_527/527_XX_name.qmd`, written and rendered in that folder, three outputs each in `files/Econ_527/output/` (HTML page, PDF, RevealJS slides). Same setup as the Econ 326 decks. `files/Econ_527/PLAN.md` holds the approved outline of each deck.
- **16 lecture note PDFs**, `files/Econ_527/527_01.pdf` through `527_16.pdf`; their LaTeX sources are in a separate private repo [`vadimmarmer/Econ-527`](https://github.com/vadimmarmer/Econ-527) under `lecture_notes/` (working directory: `/Users/vmarmer/Documents/teaching/Econ_527/lecture_notes/`).

See `files/Econ_527/CLAUDE.md` for the render command, the verification check, and the frontmatter conventions.

The course has two further locations, both with their own CLAUDE.md and all of them cross-referenced:

- **Teaching project:** `/Users/vmarmer/Documents/teaching/Econ_527/` holds the LaTeX sources, problem sets, exams, and past-year solutions.
- **Handwritten in-class notes:** `/Users/vmarmer/Library/CloudStorage/Dropbox/Notability/527/` holds Notability PDFs of the lectures and office hours, 2016 through 2025. They are not published. That folder also holds scanned student exams carrying names and student numbers, so never copy a file from it into `files/`.

## Econ 627 lecture notes

PhD Econometrics II lecture notes. PDFs are in `files/Econ_627/`; LaTeX sources are in a separate private repo [`vadimmarmer/Econ_627`](https://github.com/vadimmarmer/Econ_627) under `lecture_notes/`. See `files/Econ_627/CLAUDE.md` for details.

## Econ 326 lecture conversion (active project)

LaTeX Beamer slides are being converted to Quarto `.qmd` files.
See `files/Econ_326/CLAUDE.md` for detailed conversion rules, YAML template, and progress.

Key paths:

| What | Path |
|---|---|
| LaTeX sources | `/Users/vmarmer/Documents/teaching/Econ 326/326_*.tex` |
| QMD files | `files/Econ_326/326_*.qmd` |
| Rendered output | `files/Econ_326/output/` (HTML, PDF, RevealJS slides) |

### Related Econ 326 projects

Econ 326 spans two working directories. Each has its own CLAUDE.md and project memory with accumulated feedback:

- **Teaching project:** `/Users/vmarmer/Documents/teaching/Econ 326/`
  - **CLAUDE.md:** `/Users/vmarmer/Documents/teaching/Econ 326/CLAUDE.md` — assignment writing guidelines, LaTeX sources, additional conversion context
  - **Project memory:** `/Users/vmarmer/.claude/projects/-Users-vmarmer-Documents-teaching-Econ-326/memory/MEMORY.md`
- **GitHub Econ_326 subdirectory:** `files/Econ_326/`
  - **CLAUDE.md:** `/Users/vmarmer/GitHub/vadimmarmer.github.io/files/Econ_326/CLAUDE.md` — conversion rules, YAML template, notation, verification checklist

When working on Econ 326 lectures or assignments, consult both project memories (this repo's and the teaching project's) for feedback on derivation style, slide conciseness, assignment design, etc.

## CV updates

Source: `_pages/cv.md`. Render with `bash render-cv.sh` (never `quarto render` directly).
For the full update workflow (finding conference details, cross-checking against Word CV/annual reports, formatting conventions), see project memory `workflow_cv_update.md`.

**Always run `bash render-cv.sh` after any edit to `_pages/cv.md`, before committing.** The `Updated: Month D, YYYY` line on line 10 of `_pages/cv.md` is a hardcoded literal (no Liquid/`\today` equivalent). The render script sed-rewrites that line to today's date (`$(date "+%B %-d, %Y")`) and then regenerates `files/vadim_marmer_CV.pdf`. Skipping the render leaves the web page date stale. Commit both `_pages/cv.md` and `files/vadim_marmer_CV.pdf` together.

Key sources for conference details:
- Reimbursement folders: `/Users/vmarmer/Documents/reimbursements/paid/` (and `../` for unpaid)
- Word CV and annual reports: `/Users/vmarmer/Documents/vita and reports/` (has its own `CLAUDE.md`)

## Build commands

```bash
# Jekyll site (run from repo root)
bundle exec jekyll serve

# Quarto lectures (run from files/Econ_326/)
quarto render 326_XX_name.qmd

# Quarto slides (run from files/Econ_527/)
quarto render 527_XX_name.qmd
```
