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
  Econ_327/          # Econ 327 materials
  Econ_527/          # Econ 527 materials
  Econ_627/          # Econ 627 materials
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

## Econ 326 lecture conversion (active project)

LaTeX Beamer slides are being converted to Quarto `.qmd` files.
See `files/Econ_326/CLAUDE.md` for detailed conversion rules, YAML template, and progress.

Key paths:

| What | Path |
|---|---|
| LaTeX sources | `/Users/vmarmer/Documents/teaching/Econ 326/326_*.tex` |
| QMD files | `files/Econ_326/326_*.qmd` |
| Rendered output | `files/Econ_326/output/` (HTML, PDF, RevealJS slides) |

## Build commands

```bash
# Jekyll site (run from repo root)
bundle exec jekyll serve

# Quarto lectures (run from files/Econ_326/)
quarto render 326_XX_name.qmd
```
