# Econ 527 slides: plan for the first deck

**Approved on 2026-08-25.** Write the first deck as set out below, one file, ending at the OLS formula. Transpose is $X_i^\top$.

Built from the twelve transcribed class lectures (the first four meetings of Fall 2022, Fall 2023 and Fall 2025) and from `lecture_notes/527_01.tex` and `527_02.tex`.

## What the classes actually did

The three cycles agree on the shape of the opening and differ on where they start.

| | Fall 2022 | Fall 2023 | Fall 2025 |
|---|---|---|---|
| Meeting 1 | random variable, CDF, PDF, joint and marginal, expectation, mean and median as minimisers, conditional mean | wage equation, log specifications, the model, what is random, the probability space | CDF, PDF, joint, marginal, conditional density, conditional expectation, law of iterated expectations, the linear conditional mean, identification |
| Meeting 2 | conditional density, independence, iterated expectations, taking out what is known, mean independence, the regression model | random variable, CDF, PDF, moments, quantiles, variance, joint moments, covariance, identification, method of moments | conditional expectation again, mean independence, the model, identification, the second-moment matrix, method of moments, matrix notation, OLS |
| Meeting 3 | the model, identification, positive definiteness, method of moments, OLS as a minimiser | the model, assumptions, method of moments, OLS, unbiasedness, conditional expectation, iterated expectations | matrix form, identification, OLS equals method of moments, unbiasedness |
| Meeting 4 | quantile and median regression, then back to matrix notation and unbiasedness | unbiasedness, mean independence versus uncorrelatedness, variance, homoskedasticity, geometry of OLS | unbiasedness, variance, homoskedasticity, Gauss-Markov |

Two things the class does that the typed notes do not. Probability arrives when it is needed rather than as a self-contained first lecture, and identification is stated, defined and proved on the board although `527_02.tex` never uses the word. Fall 2022 also spent a full meeting on median and quantile regression, which has no typed counterpart at all.

## The first deck

**Title:** Regression, identification, and the OLS estimator.
**Ends at:** `$\hat\beta = (X^\top X)^{-1}X^\top Y$`, together with the proof that it is the least-squares minimiser. Nothing about unbiasedness, variance or efficiency.
**Size:** roughly 60 slides, about three class meetings.

### 1. What the course is estimating

- The wage equation as the running example: log wage on education, gender, race, urban, experience, plus an error.
- The error as everything unobserved, ability first among them.
- The coefficient on education as the object of interest.
- Reading a coefficient: log-level as a proportional change, log-log as an elasticity, level-level as a derivative. Why the dependent variable is logged, with the two density sketches.

### 2. The data and what is random

- The sample $\{(Y_i, X_i)\}_{i=1}^n$; $X_i$ is $k\times1$ with a leading one; $\beta$ is $k\times1$ and fixed.
- Observations drawn independently from one joint distribution. The population is that distribution, not a group of people.
- The probability space picture: $\Omega$, a point $\omega$, and $X(\omega)$, $U(\omega)$ landing on the line.

### 3. Probability, brought in as needed

- Random variable as a map from $\Omega$ to $\mathbb{R}$; $P(Y\in A)$ as the probability of the set of $\omega$ that land in $A$.
- CDF, then PDF as its derivative; $P(Y\in A)=\int_A f_Y$.
- Joint CDF and PDF; the marginal by integrating out, proved through the marginal CDF; the marginals do not pin down the joint.
- Conditional density as joint over marginal, with the $P(A\mid B)$ analogy, and the check that it integrates to one.
- Independence as factorisation.

### 4. Conditional expectation

- $E(Y_i\mid X_i=x)$ is a number; $E(Y_i\mid X_i)=g(X_i)$ is a random variable.
- Law of iterated expectations, with the proof by changing the order of integration.
- Taking out what is known; the version with two conditioning variables.
- Mean independence, and where it sits between independence and zero correlation.
- The conditional mean minimises mean squared error.

### 5. The linear regression model

- The parametric assumption $E(Y_i\mid X_i)=X_i^\top\beta$, and $\beta_j$ as a marginal effect.
- $U_i := Y_i - E(Y_i\mid X_i)$, so $E(U_i\mid X_i)=0$ holds by construction, and $Y_i = X_i^\top\beta + U_i$.
- What a nonzero error mean does, and how the intercept absorbs it.

### 6. Identification

- The definition as stated in class: $\beta$ is identified if it is uniquely determined by the joint distribution of the observables.
- $E(U_i\mid X_i)=0$ gives $E U_i = 0$ and $E X_i U_i = 0$, both by iterated expectations; the second read as zero covariance between each regressor and the error.
- The population normal equations $E[X_iX_i^\top]\beta = E[X_iY_i]$.
- $E[X_iX_i^\top]$ is symmetric and positive semidefinite, through $W_i = c^\top X_i$ and $c^\top E[X_iX_i^\top]c = E W_i^2 \ge 0$.
- Positive definite exactly when no regressor is an exact linear combination of the others; a nonlinear relation such as $X_{i2}=X_{i1}^2$ is fine.
- $\beta = (E X_iX_i^\top)^{-1}E X_iY_i$, boxed, with the scalar case $\beta = E(X_iY_i)/E(X_i^2)$.
- What survives if only $E X_iU_i = 0$ is assumed: $\beta$ is still identified, but $X_i^\top\beta$ is no longer a conditional mean.

### 7. From identification to an estimator

- Method of moments: replace the expectation by the sample average.
- $\hat\beta = (n^{-1}\sum X_iX_i^\top)^{-1} n^{-1}\sum X_iY_i$, and why it will not equal $\beta$.
- Matrix notation $Y$, $X$, $U$; the identities $X^\top X=\sum X_iX_i^\top$ and $X^\top Y=\sum X_iY_i$.
- $\hat\beta = (X^\top X)^{-1}X^\top Y$.
- The sample orthogonality $X^\top\hat U = 0$ as the sample counterpart of $E X_iU_i = 0$.
- The sample rank condition: $\operatorname{rank}(X)=k$, so $n\ge k$.

### 8. Least squares

- The problem $\min_b \sum_i (Y_i - X_i^\top b)^2 = \min_b (Y-Xb)^\top(Y-Xb)$.
- The proof by completing the square around $\hat\beta$, with the cross term vanishing by $X^\top\hat U=0$, and uniqueness from $X'X$ positive definite.
- The population version: $\beta$ minimises $E(Y_i-X_i^\top b)^2$.
- Two estimators named for contrast, not derived: $(X^\top WX)^{-1}X^\top WY$ with a general and with a diagonal weight matrix.

## Decks after the first

Sketched, for approval later.

- **Second deck, finite-sample properties.** Unbiasedness conditional on $X$ and unconditionally; why $E X_iU_i=0$ alone is not enough, with the parabolic counterexample; independence, mean independence and zero correlation compared; the variance of a random vector; homoskedasticity and no autocorrelation; $\operatorname{Var}(\hat\beta\mid X)=\sigma^2(X^\top X)^{-1}$ and the scalar picture; Gauss-Markov and BLUE, with the proof.
- **Third deck, geometry.** The column space, the fitted value as the closest point in it, orthogonality of the residual, the two projection matrices, $\hat\sigma^2$, goodness of fit.
- **Possible fourth deck, median and quantile regression.** Taught in Fall 2022, with no typed counterpart: the conditional median, the check function, least absolute deviations, the normal example where the mean and median slopes coincide, conditional heteroskedasticity and slopes that vary with the quantile, and the random-coefficient reading.

## Format

Same three outputs as the Econ 326 slides, from one `.qmd` per deck: an HTML page with a table of contents, a PDF, and RevealJS slides. Theme `solarized`, `smaller: true`, `incremental: true`, KaTeX, self-contained. Macros `\E`, `\Var`, `\Cov` defined in a hidden block after the first heading.

Two conventions, both settled. Transpose is $X_i^\top$, following the typed notes rather than the board's prime. The error is $U_i$, which the typed notes use throughout and the board mostly agrees with.

Files go in `/Users/vmarmer/GitHub/vadimmarmer.github.io/files/Econ_527/`, named `527_01_regression_ols.qmd` and so on, next to the sixteen typed lecture note PDFs. The rendered files go to `output/` in that same folder, and the course page `_teaching/2023-09-Econ-527.md` links to them above the typed notes.

## Status

`527_01_regression_ols.qmd` is written and rendered: 58 slides, all three outputs in `output/`, the five-signal check clean on both HTML files, no display wider than the slide. Several slides run longer than one screen and scroll, which is how the Econ 326 decks handle it too.

Three additions after the first draft, following the author's revisions. The expectation of a function of two variables, with covariance, correlation and uncorrelatedness, and a separate slide on what independence implies for such expectations, both placed after independence. Mean independence restated as $\E{Y \mid X = x} = c$ for all $x$ in the support, with the value of $c$ left as a question for the class rather than derived on the slide, and the consequences for $\E{U}$ and $\E{UX}$ on their own slide, stated for a mean-zero variable and resting only on what precedes them. The three concepts of unrelatedness rewritten around the chain independence, $\E{U \mid X} = \E{U}$, $\Cov{U, X} = 0$, keeping the original three bullets.

Proofread on 2026-09-07 by six independent readers: four covering a quarter of the deck each, and two cross-model passes over the whole file, one on the mathematics and one on cross-references and prose. Sixty-four corrections were applied, every one checked against the source first. The ones that mattered: a promise of a counterexample that was never kept, a claim that a zero conditional mean makes the conditional expectation differ from $X_i^\top\beta$ (it only stops us concluding they are equal), a claim that continuous $Y_i$ makes $\mathrm{P}(\hat\beta = \beta) = 0$ (it is continuous errors that do), a weight matrix with no condition on it although its inverse was used, "percentage" where the quantity was a proportion, a slide that assumed $\E{U} = 0$ and then derived it, and two equivalences between a zero second moment and a variable being zero that needed "with probability one". Ability in the probability-space picture was renamed from $U$ to $V$, which the error term already used, and the candidate predictor on the mean-squared-error slide from $c$ to $m$, which a constant and a vector already used.

A second round on the same day, at the author's direction. The deck now carries six top-level sections, so the page has a real table of contents and the slides have section dividers: motivation and data, probability, conditional expectation, the linear regression model, identification, estimation and least squares. Quarto turns level-one headings into vertical slide stacks, which would have made the right arrow skip whole sections, so `navigation-mode: linear` restores the flat left-to-right order the deck had before. The population and sample normal equations are now named as a pair and both appear in the summaries. The population least squares claim states the model rather than referring to it. The answer to the mean-independence question was removed from the slide, leaving the question for the class.

Next: the second deck, finite-sample properties, once the first has been used or reviewed.
