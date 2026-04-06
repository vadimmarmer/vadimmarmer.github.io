# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this directory is

This is a subdirectory of the `vadimmarmer.github.io` website repo. It contains **16 PDF lecture notes** for Econ 327 (Introduction to Empirical Methods, UBC), served at `vadimmarmer.com/files/Econ_327/` via GitHub Pages.

There is no source code here — only compiled PDFs. The LaTeX sources live in a separate private repo.

## Related locations

| What | Path |
|------|------|
| LaTeX sources | [`vadimmarmer/Econ-327`](https://github.com/vadimmarmer/Econ-327) (private), under `lecture_notes/` |
| TeX working directory | `/Users/vmarmer/Documents/teaching/Econ_327/lecture_notes/` |
| Parent website repo | `/Users/vmarmer/GitHub/vadimmarmer.github.io/` |

## Lecture notes

| # | File | Topic |
|---|------|-------|
| 1 | `327_01_basics_probability` | Basics of probability |
| 2 | `327_02_cond_probability` | Conditional probability |
| 3 | `327_03_random_variables` | Random variables |
| 4 | `327_04_discrete` | Discrete distributions |
| 5 | `327_05_expectation_discrete` | Expectation (discrete) |
| 6 | `327_06_moments_discrete` | Moments (discrete) |
| 7 | `327_07_discrete_examples` | Discrete distribution examples |
| 8 | `327_08_continuous` | Continuous distributions |
| 9 | `327_09_moments_continuous` | Moments (continuous) |
| 10 | `327_10_quantiles` | Quantiles |
| 11 | `327_11_normal` | Normal distribution |
| 12 | `327_12_joint` | Joint distributions |
| 13 | `327_13_correlation` | Correlation |
| 14 | `327_14_conditional` | Conditional distributions |
| 15 | `327_15_estimation` | Estimation |
| 16 | `327_16_inference` | Inference |

## Workflow

1. Edit TeX in `/Users/vmarmer/Documents/teaching/Econ_327/lecture_notes/`
2. Compile with `pdflatex`
3. Copy PDFs here
4. Commit TeX to `vadimmarmer/Econ-327`; commit PDFs to `vadimmarmer.github.io`
