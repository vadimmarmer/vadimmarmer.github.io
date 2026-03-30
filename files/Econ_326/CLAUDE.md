# Econ 326 — LaTeX Beamer to Quarto Conversion

## Project overview

Converting LaTeX Beamer lecture slides for Economics 326 (Introduction to Econometrics II) into Quarto `.qmd` files that produce three output formats: HTML page, PDF, and RevealJS slides.

## Paths

| What | Path |
|---|---|
| Source LaTeX files | `/Users/vmarmer/Documents/teaching/Econ 326/326_*.tex` |
| Target QMD files | `/Users/vmarmer/GitHub/vadimmarmer.github.io/files/Econ_326/326_*.qmd` |
| Rendered output | `/Users/vmarmer/GitHub/vadimmarmer.github.io/files/Econ_326/output/` |
| Course page | `/_teaching/2026-01-Econ-326.md` |
| Slide CSS | `/files/Econ_326/slides_no_caps.css` |

## Lectures (18 total, after merging)

Lectures 01–17 are converted. Lectures 08 and 09 (both hypothesis testing) were merged into a single lecture 08. Lectures 16–18 (consistency, asymptotic normality, asymptotic variance) were merged into a single lecture 17. Remaining:

| # | File stem (LaTeX source) | QMD lecture # | Topic |
|---|---|---|---|
| 14 | `326_14_mreg_testing_2` | 13 | Testing multiple restrictions |
| 15 | `326_15_dummy` | 14 | Dummy variables |
| 16+17+18 | `326_16_asy` + `326_17_asy_norm` + `326_18_asy_var` | 17 | Asymptotics (merged) |
| 19 | `326_19_misspec` | 18 | Misspecification |
| 20 | `326_20_IV` | 19 | Instrumental variables |
| 21 | `326_21_2SLS` | 20 | Two-stage least squares |

**Numbering note:** The original LaTeX lectures 08 and 09 were merged into QMD lecture 08; LaTeX lectures 16–18 were merged into QMD lecture 17. For LaTeX N ≥ 10: QMD # = N−1 (lectures 10–13); QMD 13 = LaTeX 14 (testing multiple restrictions); QMD 14 = LaTeX 15 (dummy); QMD 15 = LaTeX 15 (causal inference); QMD 16 = LaTeX 15 (DID); QMD 17 = LaTeX 16+17+18 (asymptotics); QMD 18–20 = LaTeX 19–21. Total: 18 lectures (down from 21).

## Output format conventions

Each QMD produces three files (see `326_07_cis.qmd` as the reference template):

- `326_XX_name.html` — standalone HTML with TOC (self-contained via `embed-resources: true`)
- `326_XX_name.pdf` — PDF via xelatex
- `326_XX_name_slides.html` — RevealJS slides (self-contained)

**Important:** Both HTML and RevealJS outputs must be self-contained (all CSS, JS, and images embedded). Without `embed-resources: true` on HTML, the output depends on external `_files/` directories that may not be committed to git, breaking the online version on GitHub Pages.

## YAML frontmatter template

```yaml
---
title: "Lecture N: Title"
subtitle: "Economics 326 — Introduction to Econometrics II"
author:
  - name: "Vadim Marmer, UBC"
format:
  html:
    output-file: 326_XX_name.html
    toc: true
    toc-depth: 3
    toc-location: right
    toc-title: "Table of Contents"
    theme: cosmo
    smooth-scroll: true
    html-math-method: katex
    embed-resources: true
  pdf:
    output-file: 326_XX_name.pdf
    pdf-engine: xelatex
    geometry: margin=0.75in
    fontsize: 10pt
    number-sections: false
    toc: false
    classoption: fleqn
  revealjs:
    output-file: 326_XX_name_slides.html
    theme: solarized
    css: slides_no_caps.css
    smaller: true
    slide-number: c/t
    incremental: true
    html-math-method: katex
    scrollable: true
    chalkboard: false
    self-contained: true
    transition: none
---
```

## Hidden macro div

Place immediately after the first `##` heading:

```
::: {.hidden}
\gdef\E#1{\mathrm{E}\left[#1\right]}
\gdef\Var#1{\mathrm{Var}\left(#1\right)}
\gdef\Cov#1{\mathrm{Cov}\left(#1\right)}
\gdef\Vhat#1{\widehat{\mathrm{Var}}\left(#1\right)}
\gdef\se#1{\mathrm{se}\left(#1\right)}
:::
```

**Important:** Do NOT wrap the macro definitions in `$...$` — the `$` signs cause visible dollar signs in the PDF output. The macros work without them.

Include `\Vhat` and `\se` macros in any lecture that uses estimated variances or standard errors (from lecture 06 onward).

## Notation conventions

- The notation `$\E{\cdot \mid \mathbf{X}} = \E{\cdot \mid X_1, \ldots, X_n}$` is defined **once** in `326_04_simple_properties.qmd`. Do **not** repeat this definition in later lectures.

- **Standard error notation:** Use lowercase `$\se{\hat{\beta}_1}$` (renders as $\mathrm{se}(\hat{\beta}_1)$), **not** uppercase SE. The macro `\se` is defined via `\gdef\se#1{\mathrm{se}\left(#1\right)}`. Similarly, use `\Vhat` for estimated variance: `$\Vhat{\hat{\beta}_1}$`.

- **Standard error usage:** Define `$\se{\hat{\beta}_1}$` once per lecture where it first appears (showing the full expression), then use the shorthand `\se{...}` throughout. Do **not** repeat the full $s^2/\sum(X_i - \bar{X})^2$ expression after the definition.

- **Variable names in math mode:** Multi-letter variable names in regression equations must be wrapped in `\text{...}` to render upright. Examples: `$\text{Wage}_{i}$`, `$\text{Experience}_{i}$`, `$\text{Exper}_{i}^{2}$`, `$\text{PrevExperience}_{i}$`. Do **not** use `\mathit{...}` or bare multi-letter names (which render as a product of italic letters). Single-letter variables ($X$, $Y$, $U$, $L$, $K$) remain italic as usual.

## Conversion rules

### Filler phrases
- Drop filler phrases that waste space on slides: "for example", "for instance", "recall that", "note that", "notice that", "observe that", "clearly", "obviously", "it is easy to see/show/check that".
- Rewrite the sentence to flow without the filler. If a "recall that" precedes a formula, just state the formula directly.
- When an example reference is genuinely needed, use "e.g." (parenthetical) instead of "for example".

### Strip from LaTeX source
- All `%TCIMACRO{...}%`, `%BeginExpansion`, `%EndExpansion` blocks
- Preamble, `\begin{document}`, `\end{document}`, title-page boilerplate
- `\QTR{frametitle}{...}` → becomes `## ...` section heading
- `\begin{frame}` / `\end{frame}` → removed (section headings create slides)

### Incremental reveals
- Remove all `\pause` and `$\pause$` artifacts. The `incremental: true` YAML setting reveals bullet points one at a time automatically.
- To reveal non-list content incrementally (code chunks, tables, standalone equations, figures), indent it under a bullet point so it becomes part of an incremental list item. Do **not** use `::: {.fragment}` divs.
- **Exception**: multi-line derivations in `align*`/`aligned` environments should **not** be placed under bullet points — each equation line should not start with a bullet. Keep these as standalone display math blocks.

### Color markup (from LaTeX source)
- `\color{blue}text\color{black}` → `**text**` (in prose)
- `\color{red}text\color{black}` → `**text**` (in prose)
- Inside display math: remove the original LaTeX `\color{...}` commands (these were for emphasis, not pedagogical tracking)

### Color for clarity in derivations
- Use `{\color{...}...}` in display math to help students track terms through multi-step derivations, cancellations, and decompositions.
- KaTeX-compatible named colors: `blue`, `red`, `teal`, `purple`, `orange`, `green`. Use the brace-grouped form `{\color{blue}\delta}` so color does not bleed.
- Assign a consistent color to each key coefficient or term within a lecture and maintain it across all slides in that lecture (equations, tables, prose references).
- Colors are especially valuable for: tracking coefficients through algebra (e.g., which terms cancel), connecting regression parameters to causal parameters, and decomposing estimands into labeled components (e.g., ATT, bias terms).
- Do not over-color: leave baseline/always-present terms (like intercepts) uncolored to reduce visual noise. Reserve color for terms that need tracking.

### Math environments
- `\begin{equation*}...\end{equation*}` → `$$...$$`
- `\begin{eqnarray*}...\end{eqnarray*}` → `$$\begin{aligned}...\end{aligned}$$` with `&=&` → `&=`
- **Do not** convert `$$\begin{aligned}...\end{aligned}$$` to `\begin{align*}...\end{align*}` when the block uses the fragment mechanism (`\class{fragment}{...}`). The `aligned` wrapper inside `$$...$$` is required for the MathJax fragment normalizer script to work.
- Use macros: `\Var{...}`, `\E{...}`, `\Cov{...}` where the LaTeX has `Var\left(...\right)` etc.

### Lists
- `\begin{itemize}` → `-` bullets
- `\begin{enumerate}` → numbered `1.` lists, indented 2 spaces under parent bullet

### Tables
- LaTeX `\tabular` → markdown pipe tables

### Figures
- EPS/graphic files referenced via `\FRAME{...}` or `\special{...}` → recreate as R code chunks with `echo: false`, `fig-align: center`

### Duplicate section titles
Duplicate `##` titles are allowed (this is the existing convention — see lecture 07 lines 140/154).

## Rendering

```bash
quarto render 326_XX_name.qmd
```

Produces all three formats. Output goes to `output/` subdirectory.

## Slash commands

### `/proofread <filename.qmd>`

Defined in `.claude/commands/proofread.md`. Delegates to the `proofread-326` agent (see below) to proofread a single QMD lecture file. Usage:

```
/proofread 326_06_errors_variance.qmd
```

## Custom agents

### `proofread-326`

Defined in `.claude/agents/proofread-326.md` (project-level). Proofreads a single QMD lecture file through 10 sequential passes:

| Pass | What it checks |
|------|----------------|
| 1 | Spelling — typos, doubled words, missing articles |
| 2 | Grammar — agreement, tense, comma splices |
| 3 | Language tightening — wordy constructions, passive voice, filler phrases, imprecise wording |
| 4 | Notation consistency — macro usage (`\E`, `\Var`, `\Cov`), bold `\mathbf{X}`, estimator naming |
| 5 | Math correctness — algebra, signs, distributional claims, degrees of freedom |
| 6 | Conditioning on `\mathbf{X}` — ensures estimator expectations/variances are conditional |
| 7 | Margin overflow — breaks long displays into `align*` environments for RevealJS |
| 8 | Slide titles — shortens `##` headings that overflow in RevealJS (target ~50 chars) |
| 9 | RevealJS reveal order — verifies indentation; fixes loose text between bullets that would appear out of order |
| 10 | Compilation — runs `quarto render`, checks for KaTeX errors, verifies PDF |

Can also be invoked directly via the Task tool with `subagent_type: "proofread-326"`.

## Session notes

Maintain `SESSION_NOTES.md` in the Econ_326 working directory. Update it at the end of **every** session with a dated summary entry (newest first). See global `CLAUDE.md` for format.

## TODO / DONE lists

Check both TODO locations at the start of a session. Follow the global `todo-workflow` rule for handling completed tasks.

- `/Users/vmarmer/Documents/teaching/Econ 326/TODO.md`
- `/Users/vmarmer/GitHub/vadimmarmer.github.io/files/Econ_326/TODO.md`

## Verification checklist

1. `quarto render` completes with no errors or warnings
2. Grep rendered HTML for `katex-error` — should find none
3. Count `<section` tags in slides HTML = 1 (title) + N (content slides)
4. Check `\checkmark`, `\overset`, custom macros render in HTML
5. Compare side-by-side with original PDF
