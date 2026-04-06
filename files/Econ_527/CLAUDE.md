# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this directory is

This is a subdirectory of the `vadimmarmer.github.io` website repo. It contains **16 PDF lecture notes** for Econ 527 (Econometrics II, UBC), served at `vadimmarmer.com/files/Econ_527/` via GitHub Pages.

There is no source code here — only compiled PDFs. The LaTeX sources live in a separate private repo.

## Related locations

| What | Path |
|------|------|
| LaTeX sources | [`vadimmarmer/Econ-527`](https://github.com/vadimmarmer/Econ-527) (private), under `lecture_notes/` |
| TeX working directory | `/Users/vmarmer/Documents/teaching/Econ_527/lecture_notes/` |
| Teaching page | `_teaching/2023-09-Econ-527.md` (in parent website repo) |
| Parent website repo | `/Users/vmarmer/GitHub/vadimmarmer.github.io/` |

## Lecture notes

| # | File | 
|---|------|
| 1–16 | `527_01.pdf` through `527_16.pdf` |

## Workflow

1. Edit TeX in `/Users/vmarmer/Documents/teaching/Econ_527/lecture_notes/`
2. Compile with `latexmk -pdf`
3. Copy PDFs here
4. Commit TeX to `vadimmarmer/Econ-527`; commit PDFs to `vadimmarmer.github.io`
