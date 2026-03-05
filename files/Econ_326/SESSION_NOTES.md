# Session Notes — Econ 326

## 2026-03-05

**File changes:**
- Updated `326_10_r2.qmd` — R example, reveal order, proofreading
- Updated `326_11_mreg_properties.qmd` — reveal order, proofreading

**R example (326_10_r2.qmd):**
- Replaced fabricated numeric example with real data: `lm(price ~ sqrft + bdrms + lotsize, data = hprice1)` from `wooldridge` package (n=88, k=3, R²=0.6724, adj R²=0.6607, s=59.83)
- Shows R code (`library(wooldridge)`, `lm()`, `summary()`) and relevant `summary()` output
- Second slide recovers SSR, SST, SSE from s and R²

**RevealJS reveal-order fixes (verified by 3 agents: opus, codex, gemini):**
- Lecture 11, "Proof of unbiasedness" slide (line 123): converted 3 standalone blocks to bulleted steps for incremental reveal
- Lecture 11, "Derivation of conditional variance" slide (line 190): indented aligned equation under its introducing bullet

**Proofreading fixes (3-agent consensus: opus, codex, gemini):**
- Lecture 11: replaced 7 instances of "regress against" with "regress on"
- Lecture 10, line 159: added articles before $R^2$ ("the $R^2$ from...")
- Lecture 11, line 271: added serial comma, reordered to "$k-1$ additional regressors"
- Lecture 11, line 345: removed spurious comma before restrictive "if"

**Deployment:**
- All 3 output formats render successfully, 0 KaTeX errors
- Pushed to GitHub, deployment verified

## 2026-03-04

**File changes:**
- Created `326_10_r2.qmd` — Lecture 10: R-squared (converted from LaTeX `326_11_r2.tex`)
- Created `326_11_mreg_properties.qmd` — Lecture 11: Properties of OLS in multiple regression (converted from LaTeX `326_12_mreg_properties.tex`)
- Updated `/_teaching/2026-01-Econ-326.md` — added lectures 10 and 11

**New content (326_10_r2.qmd, ~300 lines):**
- 15 slides: Fitted values, Sum-of-Squares (SST/SSE/SSR), Proof of SST=SSE+SSR (2 slides), R², R² non-decreasing property, Proof (2 slides), Adjusted R², Estimation of σ², Unbiasedness of s², Stata example (4 slides)
- Stata output recreated as code block with n=64, k=3, R²=0.5923, adj R²=0.5719

**New content (326_11_mreg_properties.qmd, ~370 lines):**
- 16 slides: Multiple regression and OLS (2 slides), OLS estimators are linear, Unbiasedness, Proof of unbiasedness (2 slides), Conditional variance, Derivation of conditional variance, Conditional covariance (2 slides), Normality, Inclusion of irrelevant regressors (2 slides), Proof of variance inequality, Variance and number of regressors, Estimation of variances and covariances
- Defined `\mathbf{X} = \{(X_{1,i}, X_{2,i}, \ldots, X_{k,i}): i = 1, \ldots, n\}` for multiple regression
- Cross-reference to "Lecture 9" (partitioned regression) updated from LaTeX "Lecture 10"

**Key results:**
- All conditioning uses `\E{\cdot \mid \mathbf{X}}`, `\Var{\cdot \mid \mathbf{X}}`, `\Cov{\cdot \mid \mathbf{X}}` macros throughout
- Fixed LaTeX typos: "In n $Y_i$" → "In $Y_i$" (line 1371 of source), summation index in $w_{j,i}$ denominator corrected to use $l$ instead of $i$
- Proofreading: grammar fixes ("i.e." → "i.e.,", removed filler "that"), long equations broken for RevealJS margin overflow, slide titles shortened
- Reverted proofreader's `\begin{align*}` conversion back to `$$\begin{aligned}$$` for consistency with all other lectures
- Both lectures: 0 KaTeX errors, all 3 output formats render successfully
- Proofreading verified all mathematical derivations correct

**Cross-references:**
- LaTeX 11 → QMD 10 (R²), LaTeX 12 → QMD 11 (properties)
- Course page updated with lectures 10–11

## 2026-02-26

**File changes:**
- Created `/Users/vmarmer/GitHub/vadimmarmer.github.io/files/Econ_326/326_09_mreg.qmd` — Lecture 9: Multiple regression (converted from LaTeX `326_10_mreg.tex`)

**New content (326_09_mreg.qmd):**
- 17 sections covering: motivation for multiple regression, omitted variable bias (2 slides), multiple linear regression model, interpretation of coefficients, changing multiple regressors simultaneously, modelling nonlinear effects, OLS estimation, normal equations (2 slides), partitioned regression, proof of partitioned regression result (5 slides), "partialling out"
- YAML frontmatter for 3-format output (HTML, PDF, RevealJS)
- Hidden macro div with `\E`, `\Var`, `\Cov`, `\Vhat`, `\se`

**Key results:**
- Fixed known typo from LaTeX source line 1296: `$X_{4}$` → `$X_{k}$` in step 3 of the partitioned regression proof
- Math review verified all derivations correct (omitted variable bias, OLS FOCs, normal equations, partitioned regression proof steps 1-4)
- Flagged: line 143 equation `$\Delta Y = \beta_0 + \beta_1 \Delta X_1 + \beta_2 X_2 + \ldots$` inherited from original LaTeX source is mathematically incorrect as a "change" equation (should be `$\Delta Y = \beta_1 \Delta X_1$`)
- 18 prose edits applied (unanimous/majority agreement from 3-agent polishing): "regress against" → "regress on" throughout, missing articles, "and etc." → "etc.", "squared errors function" → "sum of squared errors", commas before nonrestrictive "which", and other grammar fixes
- Adopted `\E{\cdot \mid \mathbf{X}}` notation throughout: converted bare `E\left(...\right)` to `\E{...}` macro, changed assumption to `\E{U_i \mid \mathbf{X}} = 0`, added `\mathbf{X}` definition in OVB slide
- Removed `$` wrapping from `\gdef` macros in hidden div (caused visible `$` in PDF output)
- Fixed reveal order on 5 slides (Partitioned regression, Proof slides, "Partialling out"): indented standalone text/equations under bullet points for proper incremental reveal
- Added lecture 9 entry to course page (`_teaching/2026-01-Econ-326.md`)
- All 3 output formats render successfully, 0 KaTeX errors

**Cross-references:**
- LaTeX source: `/Users/vmarmer/Documents/teaching/Econ 326/326_10_mreg.tex`
- YAML template: `326_08_htesting.qmd`
- Numbering: LaTeX lecture 10 → QMD lecture 09 (shift by 1 for N ≥ 10)

## 2026-02-15

**File changes:**
- Created `/Users/vmarmer/Documents/teaching/Econ 326/326_ps_05.tex` — Assignment 5 (2 pages)
- Updated `/Users/vmarmer/Documents/teaching/Econ 326/TODO.md` — all items marked completed

**New content (326_ps_05.tex):**
- Q1: Intercept-only model Y_i = beta_0 + U_i — interpret beta_0, derive E[sum hat_U_i^2] = (n-1)sigma^2, propose unbiased estimator of sigma^2
- Q2: Derive Var(beta_1_WLS | X) under classical assumptions for simple regression with arbitrary positive weights w_i(X_i); includes hint showing WLS estimator formula with weighted means
- Q3: R output (rent ~ income, n=26) with missing entries A-D (SE, CI bounds); interpret 95% CI; construct 90% CI and compare widths
- Q4: Propose one-sided CI (-inf, U] for beta_1 using t critical values; prove coverage = 1-alpha under normality

**Config changes:**
- Added "Session notes" and "TODO list" sections to project CLAUDE.md (chezmoi source)
- Added user preferences (session notes, TODO tracking) to project MEMORY.md
