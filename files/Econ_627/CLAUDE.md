# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this directory is

This is a subdirectory of the `vadimmarmer.github.io` website repo. It contains **15 PDF lecture notes** for Econ 627 (PhD Econometric Theory II, UBC), served at `vadimmarmer.com/files/Econ_627/` via GitHub Pages.

There is no source code here — only compiled PDFs. The LaTeX sources live in a separate private repo.

## Related locations

| What | Path |
|------|------|
| LaTeX sources | [`vadimmarmer/Econ_627`](https://github.com/vadimmarmer/Econ_627) (private), under `lecture_notes/` |
| TeX working directory | `/Users/vmarmer/Documents/teaching/Econ_627/lecture_notes/` |
| Teaching page | `_teaching/2020-01-Econ-627.md` (in parent website repo) |
| Parent website repo | `/Users/vmarmer/GitHub/vadimmarmer.github.io/` |

## Lecture notes

| # | File | Topic |
|---|------|-------|
| 1 | `627_01` | Review of GMM for linear models |
| 2 | `627_02` | Simultaneous equations I: Definitions and identification |
| 3 | `627_03` | Simultaneous equations II: Multiple-equation GMM, 3SLS |
| 4 | `627_04` | Simultaneous equations III: FIML |
| 5 | `627_05` | Simultaneous equations IV: LIML |
| 6 | `627_06_4` | Weak IVs |
| 7 | `627_07_2` | Stationarity, ergodicity, weak dependence |
| 8 | `627_08_02` | Linear regression with weakly dependent data |
| 9 | `627_09` | Linear processes I: Wold decomposition |
| 10 | `627_10_02` | Linear processes II: Spectral density, lag operator, ARMA |
| 11 | `627_11` | Linear processes III: Asymptotic results |
| 12 | `627_12` | Unit root, weak convergence, FCLT |
| 13 | `627_13_2` | Spurious regression, testing for unit root |
| 14 | `627_BIC` | Model selection with BIC |
| 15 | `627_quantile_reg` | Quantile regression |

## Workflow

1. Edit TeX in `/Users/vmarmer/Documents/teaching/Econ_627/lecture_notes/`
2. Compile with `pdflatex`
3. Copy PDFs here
4. Commit TeX to `vadimmarmer/Econ_627`; commit PDFs to `vadimmarmer.github.io`
