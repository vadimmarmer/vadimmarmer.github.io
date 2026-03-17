# Plan: Lecture 14 — Treatment Effects and Difference-in-Differences

**File:** `326_14_treatment_did.qmd`
**Outputs:** `326_14_treatment_did.html`, `326_14_treatment_did.pdf`, `326_14_treatment_did_slides.html`

## Context

New lecture on causal inference for Economics 326 (undergraduate, scalar notation only, no vectors).
Based on handwritten notes: `Dropbox/Notability/527/DID causal Nov 13, 2025.pdf`.
Datasets: `jtrain2` and `kielmc` from the `wooldridge` R package.

---

## Lecture Structure (~36 slides)

### Part 1: Potential Outcomes and Treatment Effects (Slides 1–12)

| # | `##` Title | Content |
|---|---|---|
| 1 | Motivation: causal questions | Job training → earnings? Drug → health? Incinerator → house prices? Fundamental challenge: can't observe same person both ways. |
| 2 | Potential outcomes | $Y_i(1)$, $Y_i(0)$; individual effect $Y_i(1)-Y_i(0)$. |
| 3 | The fundamental problem | $D_i\in\{0,1\}$; $Y_i = D_i Y_i(1)+(1-D_i)Y_i(0)$; only one PO observed. |
| 4 | Average treatment effects | ATE $=\mathrm{E}[Y_i(1)-Y_i(0)]$; ATT $=\mathrm{E}[Y_i(1)-Y_i(0)\mid D_i=1]$. |
| 5 | Selection bias | Naive diff = ATT + selection bias; add/subtract derivation. |
| 6 | Random assignment | Under randomization, selection bias = 0; simple diff = ATE = ATT. |
| 7 | Regression with a treatment dummy | $Y_i=\alpha+\tau D_i+U_i$; $\hat\tau=\bar Y_1-\bar Y_0$; equals ATE if random. |
| 8 | Example: Lalonde data | `data(jtrain2)`; NSW randomized experiment; `head(...)`. |
| 9 | Estimating the ATE | `lm(re78 ~ train)`; estimated ATE ≈ \$1,794. |
| 10 | Observational studies | Self-selection → selection bias; need covariates. |
| 11 | Potential outcomes with a covariate | $Y_i(0)=\alpha_0+\beta_0 X_i+U_i(0)$; $Y_i(1)=\alpha_1+\beta_1 X_i+U_i(1)$; conditional mean independence. |
| 12 | The ATE with a covariate | ATE $=(\alpha_1-\alpha_0)+(\beta_1-\beta_0)\mathrm{E}[X_i]$. |

### Part 2: Regression with Covariates and Interactions (Slides 13–20)

| # | `##` Title | Content |
|---|---|---|
| 13 | Two separate regressions | OLS for each group; compute ATE from $(\hat\alpha_1-\hat\alpha_0)+(\hat\beta_1-\hat\beta_0)\bar X$. |
| 14 | Combined regression with interactions | $Y_i=\alpha_0+(\alpha_1-\alpha_0)D_i+\beta_0 X_i+(\beta_1-\beta_0)X_i D_i+\tilde U_i$; coefficient on $D_i$ is NOT ATE. |
| 15 | The demeaning trick | Substitute $X_i=\mathrm{E}[X_i]+(X_i-\mathrm{E}[X_i])$; get $\tau=\text{ATE}$ as coefficient on $D_i$. |
| 16 | Estimating the ATE with covariates | Replace $\mathrm{E}[X_i]$ by $\bar X$; regress on $D_i$, $X_i$, $(X_i-\bar X)D_i$; coeff on $D_i$ = ATE. |
| 17 | Why not regress $Y_i$ on $D_i$ and $X_i$? | Valid if $\beta_1=\beta_0$; interaction nests simpler model. |
| 18 | Example: separate regressions | `lm(re78 ~ educ, subset=train==0/1)`; compute ATE manually. |
| 19 | Example: demeaned regression | `lm(re78 ~ train + educ + I(train*educ_dm))`; coeff on `train` = ATE. |
| 20 | Example: regression lines | Base R figure: two lines, vertical at $\bar X$, ATE arrow. |

### Part 3: Difference-in-Differences (Slides 21–36)

| # | `##` Title | Content |
|---|---|---|
| 21 | From cross-sections to panel data | Cross-section needed "selection on observables"; panel → exploit within-unit changes. |
| 22 | DID setup | Two periods $t\in\{0,1\}$; two groups $D_i\in\{0,1\}$; treatment between periods. |
| 23 | DID regression model | $Y_{it}=\alpha+\delta t+\gamma D_i+\beta(t\cdot D_i)+U_{it}$; 2×2 table of conditional means. |
| 24 | Interpreting the coefficients | $\alpha$=baseline; $\delta$=time effect; $\gamma$=group diff at $t=0$; $\beta$=DID. |
| 25 | Deriving the DID estimand | Full derivation: $\beta=\mathrm{E}[Y_{i1}-Y_{i0}\mid D_i=1]-\mathrm{E}[Y_{i1}-Y_{i0}\mid D_i=0]$. |
| 26 | DID diagram | Base R: 4-point diagram, counterfactual dashed line, $\beta$ arrow. |
| 27 | Example: incinerator and house prices | `data(kielmc)`; Kiel & McClain (1995); `head(...)`. |
| 28 | The 2×2 table of means | `tapply(rprice, list(y81, nearinc), mean)`; DID by hand. |
| 29 | DID regression | `lm(rprice ~ y81 + nearinc + y81nrinc)`; matches 2×2 table; p≈0.11. |
| 30 | DID with covariates | Add `age + I(age^2)`; DID becomes significant. |
| 31 | DID and potential outcomes | Panel POs $Y_{it}(d)$; what's observed for each group; ATT definition. |
| 32 | DID as a treatment effect | Express $\beta$ in terms of POs via add/subtract derivation. |
| 33 | Assumption 1: no anticipation | $\mathrm{E}[Y_{i0}(1)\mid D_i=1]=\mathrm{E}[Y_{i0}(0)\mid D_i=1]$; incinerator interpretation. |
| 34 | Assumption 2: parallel trends | $\mathrm{E}[Y_{i1}(0)-Y_{i0}(0)\mid D_i=0]=\mathrm{E}[Y_{i1}(0)-Y_{i0}(0)\mid D_i=1]$; $\Rightarrow\beta=\text{ATT}$. |
| 35 | Parallel trends diagram | Base R: annotated diagram, equal $\delta$ for both groups, $\beta$=ATT arrow. |
| 36 | Summary | Recap: POs → ATE/ATT → regression + demeaning → DID → assumptions → ATT. |

---

## Datasets

- **`jtrain2`**: Lalonde NSW randomized job training. Variables: `train`, `re78`, `educ`, `age`, `black`, `married`.
- **`kielmc`**: Kiel & McClain housing prices near incinerator. Variables: `year`, `rprice`, `nearinc`, `y81`, `y81nrinc`, `age`.

## Formatting

- YAML: standard (matching `326_13_dummy.qmd`), outputs named `326_14_treatment_did.*`
- Hidden macro div: `\E`, `\Var`, `\Cov`, `\Vhat`, `\se` immediately after first `##`
- Scalar notation throughout (no vectors)
- All display math and R chunks indented 2 spaces under a parent bullet
- Base R figures (`#| fig-width: 8`, `#| fig-height: 5.5`, `#| fig-align: center`)
- `\text{ATE}`, `\text{ATT}` for multi-letter names in math

## Implementation steps

1. ~~Write scratch file~~ (done as `scratch_lecture21.qmd`)
2. Fix numbering (21 → 14) and apply to `326_14_treatment_did.qmd`
3. `quarto render 326_14_treatment_did.qmd`
4. Grep for `katex-error` in HTML output
5. Run `proofread-326` agent
6. Move TODO item to DONE.md
7. Update course page `_teaching/2026-01-Econ-326.md`
8. Update `SESSION_NOTES.md`
