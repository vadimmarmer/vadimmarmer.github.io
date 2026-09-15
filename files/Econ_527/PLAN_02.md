# Plan for the second Econ 527 slide deck

**Title:** Lecture 2: Unbiasedness, variance, and the Gauss-Markov theorem.
**File:** `527_02_properties_of_ols.qmd`, next to `527_01_regression_ols.qmd`.
**Size:** 55 slides in six sections: 4, 13, 8, 11, 15 and 4.

Sources. The class transcripts live in
`/Users/vmarmer/Library/CloudStorage/Dropbox/Notability/527/transcripts/final/`
and are cited below by file stem and page, for example `y2025_L4_sep11 p6`. The
typed notes are `527_02_assumptions.tex` and
`527_02_properties_of_widehat_beta.tex`.

---

# Part 1. What the classes did

The topics the brief lists would make one table eleven columns wide, which no
one can read. The same information is split into three tables below, each with
one row per teaching year.

## Unbiasedness

| | Conditional on $X$ | Unconditional, by iterated expectations | Why $\E{X_iU_i}=0$ is not enough, and the example |
|---|---|---|---|
| Fall 2022 | `y2022_L4_sep15` p14 to p15, stated as a claim under the board's Assumptions 1 to 3 and proved. Restated `y2022_L5_sep20` p2 | `y2022_L4_sep15` p15, one line at the foot of the proof | `y2022_L4_sep15` p16: the noise term is a nonlinear function of $X$, so the expectation does not factor. No example. Restated `y2022_L5_sep20` p2 |
| Fall 2023 | `y2023_L4_sep14` p8, and again `y2023_L6_sep21` p3 | `y2023_L4_sep14` p8 and `y2023_L6_sep21` p3, both by iterated expectations | The fullest treatment of the three years. `y2023_L3_sep12` p12 to p13 sets up the gap, p14 to p19 supplies conditional expectation and the law of iterated expectations to close it. `y2023_L4_sep14` p2 to p4 gives the integral argument: $\int g(x)f_X(x)\,dx=0$ does not force $g(x)=0$. The example is a parabola in $u$ against $x$, drawn twice, p4 and p7, with $u$ read as ability and $x$ as education |
| Fall 2025 | `y2025_L4_sep11` p2, with the $k=1$ case written out in full | `y2025_L4_sep11` p2 implies it; the explicit iterated-expectations line is not on the board this year | `y2025_L4_sep11` p2 to p3: the expectation of a ratio is not the ratio of expectations, written out as a double integral. The picture on p3 is a downward-opening parabola with a horizontal line cutting it twice |

## Variance

| | Variance-covariance matrix of a random vector | $\Var{\hat\beta \mid X}$, general and under homoskedasticity | The scalar case and its picture |
|---|---|---|---|
| Fall 2022 | `y2022_L5_sep20` p3 to p5: definition, the matrix entry by entry, symmetry, the claim that it is positive semidefinite with the proof through $a^\top(Y-\E{Y})=W$, the degenerate case, and the rule $\Var{\alpha+\Gamma Y}=\Gamma\Var{Y}\Gamma^\top$ | `y2022_L5_sep20` p6 to p7. $\Var{U\mid X}=\E{UU^\top\mid X}$ is derived, then homoskedasticity and no autocorrelation are assumed and $\sigma^2(X^\top X)^{-1}$ follows | `y2022_L5_sep20` p7 to p8: $\sigma^2/\sum_i X_i^2$, with one picture carrying both cases, the tight cluster in black with several lines of different slopes through it and the wide scatter in red with one line |
| Fall 2023 | `y2023_L4_sep14` p8 to p10: the same definition, symmetry, $a^\top\Var{V}a\ge 0$, and the linear-map rule with its expansion | `y2023_L4_sep14` p11 to p12, and again `y2023_L6_sep21` p4. The sandwich is boxed first, then homoskedasticity is imposed | `y2023_L4_sep14` p13: $\sigma^2/\sum_i x_i^2$ with two separate sketches, the narrow cloud with three lines of different slopes and the wide band with two nearly coincident lines |
| Fall 2025 | `y2025_L4_sep11` p4 to p6: definition, the matrix entry by entry, symmetry, positive semidefiniteness, and positive definiteness when no exact linear relation holds among the entries | `y2025_L4_sep11` p6 to p8, with $\Gamma_x=(X^\top X)^{-1}X^\top$ named and the rule $\Var{\Gamma_x U\mid X}=\Gamma_x\Var{U\mid X}\Gamma_x^\top$ boxed | `y2025_L4_sep11` p9: $\sigma^2/\sum_i X_i^2$ with arrows showing the variance falling as the sum rises, and two sketches side by side |

## Efficiency

| | Other linear estimators | Gauss-Markov, BLUE, and the proof | Uniqueness | Anything else |
|---|---|---|---|---|
| Fall 2022 | None in these meetings | Not taught. Nothing on Gauss-Markov or BLUE appears in `y2022_L4_sep15`, `y2022_L5_sep20` or `y2022_L6_sep22` | Not taught | `y2022_L4_sep15` p17 absorbs a nonzero error mean into the intercept. `y2022_L5_sep20` p9 relabels the four assumptions to match the typed notes, putting the rank condition fourth |
| Fall 2023 | None in these meetings | Not taught | Not taught | `y2023_L6_sep21` p5 does the heteroskedastic sandwich, $X^\top\Omega X=\sum_i\sigma_i^2X_iX_i^\top$. `y2023_L6_sep21` p11 to p13 absorbs a nonzero error mean and defines the expectation of a random matrix. Normality arrives later, in `y2023_L7_sep26_2` p8, as the classical normal regression model with $\hat\beta\mid X\sim N(\beta,\sigma^2(X^\top X)^{-1})$ |
| Fall 2025 | `y2025_L4_sep11` p10: the two-point slope estimator $(Y_n-Y_1)/(X_n-X_1)$ and the weighted estimator $(X^\top WX)^{-1}X^\top WY$ with its variance. `y2025_L5_sep16` p1 and p4 restate both | `y2025_L4_sep11` p11 to p14 and `y2025_L5_sep16` p1 to p5. Statement and BLUE on p11, the diagonal-entry reading of a positive semidefinite matrix on p12, the transpose rule for covariance matrices and $A_xX=I$ on p13, and $\Cov{\hat\beta,\tilde\beta\mid X}=\Var{\hat\beta\mid X}$ on p14. `y2025_L5_sep16` p5 completes it through $0\le\Var{\tilde\beta-\hat\beta\mid X}$ | `y2025_L5_sep16` p6. Equal variances force $\tilde\beta-\hat\beta$ to be non-random given $X$, and conditional unbiasedness then makes it zero | `y2025_L5_sep16` p7 to p12: heteroskedasticity, the eigenvalue decomposition, the symmetric square root, the transformed model, and generalised least squares. Normality arrives later, in `y2025_L8_oct02` p1 |

## What the classes did that the typed notes do not

- The whole argument that $\E{X_iU_i}=0$ is too weak. The typed notes say only
  that conditional unbiasedness fails under (A2\*). The board gives the reason,
  the integral argument, and a picture.
- The definition of the variance-covariance matrix of a random vector, its
  symmetry, its positive semidefiniteness with proof, and the rule for a linear
  map. The typed notes use $\Var$ in this section without defining it.
- The scalar case $\sigma^2/\sum_i X_i^2$ and the two scatter pictures. All
  three years drew them.
- Named linear estimators to compare against: the two-point slope estimator and
  weighted least squares, with the variance of the second.
- The step that makes BLUE mean something coefficient by coefficient, that a
  positive semidefinite matrix has non-negative diagonal entries
  (`y2025_L4_sep11` p12).
- The heteroskedastic sandwich written as $\sum_i\sigma_i^2X_iX_i^\top$
  (`y2023_L6_sep21` p5), and the symmetric square root and generalised least
  squares (`y2025_L5_sep16` p7 to p12).

## What the typed notes have that the classes did not

- The statement that $\hat\beta$ is a linear estimator, with
  $A=(X^\top X)^{-1}X^\top$, listed as the first property. Fall 2025 checks
  $A_XX=I_k$ on OLS but never names linearity as a property.
- The fixed-regressor version of every result, and the remark that conditioning
  on $X$ and treating $X$ as fixed give the same results.
- Assumption (A5), normality, and the classical normal regression model. The
  classes reach normality later, when confidence intervals need it.
- Assumption (A6), independent and identically distributed observations, and
  the remark that (A1) to (A4) do not imply independence across observations.
- The reading of (A2) as strict exogeneity, and the remark that it is hard to
  justify in economic applications.
- The footnote on rank, perfect multicollinearity, and the interpretation of
  the intercept as $\E{Y_i\mid X_{i2}=\cdots=X_{ik}=0}$.
- "Almost surely" attached to $AX=I_k$, to $\tilde\beta=\hat\beta$, and to the
  rank condition.

## Board slips recorded here and not carried into the deck

- `y2025_L4_sep11` p6 writes $\Var{\gamma U}=\gamma^2\Var{U}=\gamma\Var{U}\gamma$
  with no transpose on the second factor. The matrix version needs
  $\Gamma\Var{U}\Gamma^\top$.
- `y2025_L4_sep11` p12 lets the index of the diagonal entries run to $n$ where
  the matrix compared on p11 is $k\times k$.
- `y2025_L4_sep11` p14 labels $X^\top A_x^\top$ as $I_n$ where it is $I_k$.
- `y2023_L4_sep14` p9 states $a^\top\Var{V}a=0$ if and only if $a^\top V=0$,
  without "with probability one". The deck writes the centred form, and since
  2026-09-14 it leaves the qualifier off too, as Part 3 records.
- `y2023_L4_sep14` p10 labels the vector $V$ as $n\times n$ where it is
  $n\times1$.
- `y2022_L5_sep20` p9 relabels the assumptions so that the rank condition is
  the fourth and homoskedasticity the third, which reverses the order used
  earlier in the same lecture.

---

# Part 2. The deck, slide by slide

In the deck each `## Section` heading below becomes a level-one heading and
each `### slide` heading becomes a level-two heading, as in the first deck.
Notation follows the first deck throughout: transpose is $X^\top$, the error is
$U_i$, and `\E{}`, `\Var{}` and `\Cov{}` are the macros defined in the hidden
block after the first heading.

## Section 1. The model and the assumptions

### 1.1 Where the first deck ended

Source: the first deck, `527_01_regression_ols.qmd`, closing slides.

- The first deck produced the estimator and stopped there:
$$
\hat\beta = (X^\top X)^{-1} X^\top Y
= \left(\sum_{i=1}^{n} X_i X_i^\top\right)^{-1}\sum_{i=1}^{n} X_i Y_i,
$$
the unique minimiser of $\sum_i (Y_i - X_i^\top b)^2$.
- Nothing so far says whether it is a good estimator. $\hat\beta$ is a function
  of the sample, so it is random, and it will not equal $\beta$.
- Three questions, and the deck takes them in this order. Is $\hat\beta$ right
  on average? How much does it move from sample to sample? Is there a better
  estimator of the same kind?

### 1.2 The model in matrix form

Source: `y2023_L4_sep14` p1, `y2025_L4_sep11` p1, the first deck's matrix
notation slide.

- Restate the stacking from the first deck:
$$
\underset{n\times1}{Y} = \begin{pmatrix} Y_1 \\ \vdots \\ Y_n \end{pmatrix},\qquad
\underset{n\times k}{X} = \begin{pmatrix} X_1^\top \\ \vdots \\ X_n^\top \end{pmatrix},\qquad
\underset{n\times1}{U} = \begin{pmatrix} U_1 \\ \vdots \\ U_n \end{pmatrix}.
$$
- The $n$ scalar equations become one:
$$
\underset{n\times1}{Y} = \underset{n\times k}{X}\ \underset{k\times1}{\beta} + \underset{n\times1}{U}.
$$
- $\beta$ is fixed and unknown. $X$, $Y$ and $U$ are random, and $U$ is not
  observed.

### 1.3 The four assumptions

Source: `y2025_L4_sep11` p1 and p4, `y2022_L5_sep20` p2, `y2023_L4_sep14` p8
and p11, and the typed notes `527_02_assumptions.tex`.

- **Assumption 1.** $Y = X\beta + U$ for some $\beta \in \mathbb{R}^k$.
- **Assumption 2.** $\E{U \mid X} = 0$.
- **Assumption 3.** $\Var{U \mid X} = \sigma^2 I_n$ for some $\sigma^2 > 0$.
- **Assumption 4.** $\operatorname{rank}(X) = k$, so $n \ge k$ and no regressor
  is an exact linear combination of the others.
- The numbering is the typed notes': (A3) is homoskedasticity and (A4) is the
  rank condition, as in `527_02.tex` lines 176 to 179. Assumption 4 is the
  sample rank condition, which the first deck introduced as the sample
  counterpart of $\operatorname{rank}(\E{X_i X_i^\top}) = k$. Assumption 3 is
  new and is not needed until Section 4.

### 1.4 What unbiased means

Source: `y2023_L3_sep12` p11.

- $\hat\beta$ is a function of the sample, so it is a random vector:
$$
\hat\beta(\omega) = \left(\sum_i X_i(\omega) X_i(\omega)^\top\right)^{-1}\sum_i X_i(\omega) Y_i(\omega).
$$
- With a continuous error, $\mathrm{P}(\hat\beta = \beta) = 0$. Hitting $\beta$
  exactly is not the standard.
- **Definition.** An estimator $\hat\theta$ of $\theta$ is **unbiased** if
  $\E{\hat\theta} = \theta$.
- It is **conditionally unbiased given $X$** if $\E{\hat\theta \mid X} = \theta$.
  The second is the stronger statement, and it is the one this deck proves.

## Section 2. Unbiasedness

### 2.1 The sampling error

Source: `y2022_L4_sep15` p14 to p15, `y2023_L4_sep14` p1, `y2025_L4_sep11` p2.

- Substitute Assumption 1 into the estimator:
$$
\begin{aligned}
\hat\beta &= (X^\top X)^{-1} X^\top Y \\
&= (X^\top X)^{-1} X^\top (X\beta + U) \\
&= (X^\top X)^{-1} X^\top X\, \beta + (X^\top X)^{-1} X^\top U.
\end{aligned}
$$
- The first term collapses, and what is left is the **sampling error**:
$$
\boxed{\ \hat\beta = \underbrace{\beta}_{\text{signal}} + \underbrace{(X^\top X)^{-1} X^\top U}_{\text{noise}}\ }
$$
- Fall 2022 wrote signal and noise under the two terms in red. Everything in
  this section and the next is a statement about the second term.

### 2.2 Taking expectations, first attempt

Source: `y2023_L3_sep12` p12, `y2023_L4_sep14` p1 to p2, `y2022_L4_sep15` p16.

- Take expectations of the sampling error:
$$
\E{\hat\beta} = \beta + \E{(X^\top X)^{-1} X^\top U}.
$$
- Suppose only that $\E{X_i U_i} = 0$ for every $i$. Then
$$
\E{X^\top U} = \E{\sum_{i=1}^n X_i U_i} = \sum_{i=1}^n \E{X_i U_i} = 0.
$$
- That is not enough, because
$$
\E{(X^\top X)^{-1} X^\top U} \;\neq\; \E{(X^\top X)^{-1}}\,\E{X^\top U}.
$$
- The two factors are not independent. Both are built from the same $X$.

### 2.3 The expectation of a ratio

Source: `y2025_L4_sep11` p3, `y2023_L3_sep12` p13.

- The one-regressor case makes the failure visible:
$$
\E{\frac{\sum_i X_i U_i}{\sum_i X_i^2}} \;\neq\; \frac{\E{\sum_i X_i U_i}}{\E{\sum_i X_i^2}} = 0.
$$
- In general the expectation of a ratio is not the ratio of expectations:
$$
\E{\frac{Y}{X}} = \iint \frac{y}{x}\, f_{Y,X}(y,x)\, dy\, dx
\;\neq\;
\frac{\int y f_Y(y)\, dy}{\int x f_X(x)\, dx} = \frac{\E{Y}}{\E{X}}.
$$
- The way out is to condition on $X$, which turns $(X^\top X)^{-1}X^\top$ into a
  known matrix.

### 2.4 Conditional unbiasedness: the claim

Source: `y2022_L4_sep15` p14.

- **Claim.** Under Assumptions 1, 2 and 4,
$$
\E{\hat\beta \mid X} = \beta.
$$
- Assumption 3 is not used. Unbiasedness does not depend on the variance of the
  errors.

### 2.5 Proof of conditional unbiasedness

Source: `y2022_L4_sep15` p15, `y2023_L6_sep21` p3, `y2025_L4_sep11` p2.

- Condition the sampling error on $X$:
$$
\begin{aligned}
\E{\hat\beta \mid X} &= \E{\beta + (X^\top X)^{-1}X^\top U \mid X} \\
&= \beta + \E{(X^\top X)^{-1}X^\top U \mid X} \\
&= \beta + (X^\top X)^{-1}X^\top \underbrace{\E{U \mid X}}_{=\,0 \text{ by Assumption 2}} \\
&= \beta.
\end{aligned}
$$
- The third line is taking out what is known, from the first deck. Given $X$,
  the matrix $(X^\top X)^{-1}X^\top$ is a constant and comes out of the
  expectation. This step is exactly what the unconditional version could not do.

### 2.6 From conditional to unconditional

Source: `y2022_L4_sep15` p15, `y2023_L4_sep14` p8, `y2023_L6_sep21` p3.

- The law of iterated expectations, from the first deck, finishes it:
$$
\E{\hat\beta} = \E{\E{\hat\beta \mid X}} = \E{\beta} = \beta.
$$
- So conditional unbiasedness implies unbiasedness. The converse does not hold.

### 2.7 The scalar case

Source: `y2025_L4_sep11` p2.

- Take $k = 1$, so $X$ is $n \times 1$ and
$$
X^\top X = \sum_{i=1}^n X_i^2, \qquad X^\top Y = \sum_{i=1}^n X_i Y_i.
$$
- The estimator and its sampling error:
$$
\hat\beta = \frac{\sum_i X_i Y_i}{\sum_i X_i^2} = \beta + \frac{\sum_i X_i U_i}{\sum_i X_i^2}.
$$
- Conditioning on $X_1, \ldots, X_n$ makes the denominator and every $X_i$ in
  the numerator known:
$$
\E{\hat\beta \mid X} = \beta + \frac{\sum_i X_i \overbrace{\E{U_i \mid X}}^{=\,0}}{\sum_i X_i^2} = \beta.
$$

### 2.8 Why the conditioning matters (dropped)

**Dropped from the deck on 2026-09-14 at the author's request.** The outline below is kept as the record of what was planned.

Source: `y2025_L4_sep11` p3.

- Assumption 2 says the error has mean zero at every value of the regressors,
  not just on average across them.
- The board's reading: $\E{U \mid X} = 0$ is what holds when the values of $X$
  are chosen rather than observed, as in an experiment.
- With observational data it is an assumption about the unobserved error, and it
  is the assumption that everything in this deck rests on.

### 2.9 A weaker condition

Source: `y2022_L4_sep15` p16, `y2022_L5_sep20` p2, `y2025_L4_sep11` p2.

- Replace Assumption 2 by
$$
\E{X_i U_i} = 0 \quad \text{for all } i,
$$
which with $\E{U_i} = 0$ says each regressor is uncorrelated with the error.
- The first deck showed that $\beta$ is still identified under this condition.
- It is not enough for unbiasedness:
$$
\E{\hat\beta} = \beta + \underbrace{\E{(X^\top X)^{-1}X^\top U}}_{\text{a nonlinear function of } X, \ \neq\,0}.
$$
- So $\hat\beta$ is biased. Fall 2022 wrote "nonlinear function" under the brace
  and "$\hat\beta$ is biased" in red beside it.

### 2.10 Zero correlation does not pin down the conditional mean

Source: `y2023_L4_sep14` p3 to p4.

- Take one regressor, so $X_i$ is a scalar with density $f_X$, and write
  $g(x) = \E{U_i \mid X_i = x}$. By iterated expectations,
$$
\E{X_i U_i} = \E{\E{X_i U_i \mid X_i}} = \E{X_i\, g(X_i)} = \int x\, g(x) f_{X}(x)\, dx.
$$
- Assumption 2 says $g(x) = 0$ for every $x$, which certainly makes the integral
  zero. The weaker condition says only that the integral is zero.
- An integral vanishes when the positive and negative parts cancel. So
$$
\int x\, g(x) f_X(x)\, dx = 0 \quad \not\Longrightarrow \quad g(x) = 0 .
$$
- Fall 2023 struck out the downward arrow on the board to make this point.

### 2.11 The parabola

Source: `y2023_L4_sep14` p4 and p7, `y2025_L4_sep11` p3.

- Take the error to depend on the regressor through a parabola centred so that
  the positive and negative parts cancel in the average.
- Then $\E{X_i U_i} = 0$ holds while $\E{U_i \mid X_i} \neq 0$ at every value of
  $X_i$ except the two crossings.
- Fall 2023 labelled the axes ability and education, so the example reads as a
  case where ability is low for middling education and high at both ends.

**Picture 1, two panels side by side.** Left panel: horizontal axis labelled
$x$, vertical axis labelled $u$, a horizontal line at height zero drawn in a
second colour, and an upward-opening parabola that dips below the line in the
middle and rises above it at both ends, crossing the line twice. Left panel
caption: $\E{X_i U_i} = 0$ can hold here. Right panel: the same axes, and a
narrow horizontal band lying on the zero line across the whole width, with a
line drawn through it. Right panel caption: $\E{U_i \mid X_i} = 0$ looks like
this. The contrast between the two panels is the whole point of the picture.

### 2.12 Independence, mean independence, uncorrelatedness (dropped)

**Dropped from the deck on 2026-09-14 at the author's request.** The outline below is kept as the record of what was planned.

Source: `y2023_L4_sep14` p5 to p6.

- The first deck introduced all three. The chain, restated here because the two
  conditions above are its second and third links:
$$
\underbrace{f_{U \mid X}(u \mid x) = f_U(u) \ \text{ for all } u, x}_{\text{independence}}
\;\Longrightarrow\;
\underbrace{\E{U \mid X} = \E{U}}_{\text{mean independence}}
\;\Longrightarrow\;
\underbrace{\Cov{U, X} = 0}_{\text{uncorrelatedness}}.
$$
- Neither implication reverses. The parabola is the counterexample to the second
  one.
- Assumption 2 is mean independence with $\E{U} = 0$, which the first deck
  showed follows from it.

### 2.13 What survives under the weaker condition

Source: `y2023_L4_sep14` p4, the typed notes property 2, the first deck's
identification slide.

- Under $\E{X_i U_i} = 0$ and $\E{U_i} = 0$ alone: $\beta$ is identified, and
  $\hat\beta$ is still the method-of-moments and least-squares estimator.
- What is lost: $X_i^\top\beta$ need not be the conditional mean any more, and
  $\hat\beta$ is no longer unbiased in any sample size.
- Everything from here on assumes $\E{U \mid X} = 0$. **Dropped from the deck on
  2026-09-14, along with the bias example that the proof audit had added here.**

## Section 3. The variance of a random vector

### 3.1 The definition

Source: `y2022_L5_sep20` p3, `y2023_L4_sep14` p8 to p9, `y2025_L4_sep11` p4.

- For a random vector $V$ that is $n \times 1$, with
  $\E{V} = (\E{V_1}, \ldots, \E{V_n})^\top$, define
$$
\Var{V} = \E{\underset{n\times1}{(V - \E{V})}\ \underset{1\times n}{(V - \E{V})^\top}} \qquad (n \times n).
$$
- The product inside is an outer product, not an inner product, so the result is
  a matrix rather than a number.

### 3.2 The matrix entry by entry

Source: `y2022_L5_sep20` p3, `y2025_L4_sep11` p4 to p5, `y2023_L4_sep14` p9.

- Entry $(i,j)$ is $\E{(V_i - \E{V_i})(V_j - \E{V_j})}$, so
$$
\Var{V} = \begin{pmatrix}
\Var{V_1} & \Cov{V_1, V_2} & \cdots & \Cov{V_1, V_n} \\
\Cov{V_2, V_1} & \Var{V_2} & & \vdots \\
\vdots & & \ddots & \\
\Cov{V_n, V_1} & \cdots & & \Var{V_n}
\end{pmatrix}.
$$
- The variances sit on the diagonal and the covariances off it.

### 3.3 Symmetry

Source: `y2022_L5_sep20` p4, `y2025_L4_sep11` p5, `y2023_L4_sep14` p9.

- $\Var{V}^\top = \Var{V}$, because $\Cov{V_i, V_j} = \Cov{V_j, V_i}$.

### 3.4 Positive semidefiniteness

Source: `y2022_L5_sep20` p4, `y2025_L4_sep11` p5, `y2023_L4_sep14` p9.

- **Claim.** $\Var{V}$ is positive semidefinite.
- **Proof.** Take any non-random $a \in \mathbb{R}^n$ and set
  $W = a^\top (V - \E{V})$, a scalar. Then
$$
\begin{aligned}
a^\top \Var{V} a &= a^\top \E{(V - \E{V})(V - \E{V})^\top} a \\
&= \E{\underbrace{a^\top (V - \E{V})}_{W}\ \underbrace{(V - \E{V})^\top a}_{W}} \\
&= \E{W^2} \;\ge\; 0 .
\end{aligned}
$$
- The constant $a$ moves inside the expectation because expectation is linear.
- This is the same argument the first deck used for $\E{X_i X_i^\top}$, with
  $W = c^\top X_i$.

### 3.5 When it is positive definite

Source: `y2022_L5_sep20` p5, `y2025_L4_sep11` p5.

- For $a \neq 0$, tracking the equality case:
$$
a^\top \Var{V} a = 0 \iff \E{W^2} = 0 \iff a^\top (V - \E{V}) = 0,
$$
that is,
$$
a_1 (V_1 - \E{V_1}) + \cdots + a_n (V_n - \E{V_n}) = 0.
$$
- So $\Var{V}$ is positive definite exactly when no exact linear relation holds
  among $V_1, \ldots, V_n$.

### 3.6 Variance under a linear map

Source: `y2022_L5_sep20` p5, `y2023_L4_sep14` p10, `y2025_L4_sep11` p6 to p7.

- **Claim.** For a non-random $m \times n$ matrix $\Gamma$,
$$
\boxed{\ \Var{\Gamma V} = \Gamma \Var{V} \Gamma^\top \ } \qquad (m \times m).
$$
- **Proof.** $\E{\Gamma V} = \Gamma \E{V}$, so
$$
\begin{aligned}
\Var{\Gamma V} &= \E{\big(\Gamma V - \Gamma\E{V}\big)\big(\Gamma V - \Gamma\E{V}\big)^\top} \\
&= \E{\Gamma (V - \E{V}) (V - \E{V})^\top \Gamma^\top} \\
&= \Gamma \E{(V - \E{V})(V - \E{V})^\top} \Gamma^\top = \Gamma \Var{V} \Gamma^\top,
\end{aligned}
$$
using $(AB)^\top = B^\top A^\top$ on the second factor.
- Check against the scalar case: with $m = n = 1$ this is
  $\Var{\gamma V} = \gamma^2 \Var{V}$.

### 3.7 Adding a constant

Source: `y2022_L5_sep20` p5, `y2023_L4_sep14` p10.

- For a non-random $\mu$ that is $m \times 1$,
$$
\Var{\mu + \Gamma V} = \Var{\Gamma V} = \Gamma \Var{V} \Gamma^\top .
$$
- The constant shifts the mean and the deviations from the mean are unchanged,
  so it drops out. This is what will let us discard $\beta$ from the sampling
  error.

### 3.8 The conditional version

Source: `y2022_L5_sep20` p6, `y2025_L4_sep11` p6 and p8.

- The same definition with conditional expectations throughout:
$$
\Var{V \mid X} = \E{\big(V - \E{V \mid X}\big)\big(V - \E{V \mid X}\big)^\top \,\Big|\, X}.
$$
- Everything above holds conditionally, with $\Gamma$ allowed to be a function
  of $X$, since conditioning on $X$ makes such a $\Gamma$ known.
- When the mean is zero the definition simplifies. Under Assumption 2,
$$
\Var{U \mid X} = \E{U U^\top \mid X}.
$$

## Section 4. The variance of the OLS estimator

### 4.1 The question

Source: `y2025_L4_sep11` p4 and p6.

- $\hat\beta$ is $k \times 1$, so $\Var{\hat\beta \mid X}$ is a $k \times k$
  matrix. Its diagonal holds the variance of each estimated coefficient and its
  off-diagonal entries hold the covariances between them.
- Conditioning on $X$ again, for the same reason as in Section 2: it makes
  $(X^\top X)^{-1}X^\top$ a known matrix.

### 4.2 The sandwich formula

Source: `y2025_L4_sep11` p6 to p7, `y2023_L4_sep14` p11, `y2022_L5_sep20` p6,
`y2023_L6_sep21` p4.

- Start from the sampling error and name the matrix that multiplies $U$:
$$
\hat\beta = \beta + \underbrace{(X^\top X)^{-1} X^\top}_{\Gamma_X}\, U .
$$
- $\beta$ is a constant and drops out by slide 3.7, and $\Gamma_X$ is known
  given $X$, so slide 3.6 applies:
$$
\begin{aligned}
\Var{\hat\beta \mid X} &= \Var{\beta + \Gamma_X U \mid X} \\
&= \Var{\Gamma_X U \mid X} \\
&= \Gamma_X \Var{U \mid X} \Gamma_X^\top .
\end{aligned}
$$

### 4.3 The sandwich formula written out

Source: `y2023_L4_sep14` p11, the typed notes property 3.

- Substituting $\Gamma_X = (X^\top X)^{-1}X^\top$ and using symmetry of
  $X^\top X$:
$$
\boxed{\ \Var{\hat\beta \mid X} = (X^\top X)^{-1} X^\top\ \Var{U \mid X}\ X (X^\top X)^{-1}\ }
$$
- Under Assumption 2 the middle factor is $\E{U U^\top \mid X}$.
- This holds under Assumptions 1, 2 and 4 alone. Nothing yet has been assumed
  about the size of the errors or about how they move together.

### 4.4 Assumption 3: homoskedasticity and no autocorrelation

Source: `y2025_L4_sep11` p7 to p8, `y2023_L4_sep14` p11 to p12,
`y2022_L5_sep20` p6 to p7.

**One slide, decided 2026-09-14.** The outline below had this as two slides,
4.4 and 4.5. They are now a single slide carrying both halves of Assumption 3,
at the author's instruction.

- **Assumption 3.** $\Var{U \mid X} = \sigma^2 I_n$ for some $\sigma^2 > 0$,
  that is
$$
\Var{U \mid X} = \begin{pmatrix} \sigma^2 & & 0 \\ & \ddots & \\ 0 & & \sigma^2 \end{pmatrix}.
$$
- Reading the diagonal: every error has the same conditional variance,
$$
\Var{U_1 \mid X} = \cdots = \Var{U_n \mid X} = \sigma^2 .
$$
- This is **homoskedasticity**. It rules out errors that are more variable for
  some values of the regressors than for others.

- Reading the off-diagonal entries: for $i \neq j$,
$$
\Cov{U_i, U_j \mid X} = \E{U_i U_j \mid X} = 0 .
$$
- Different observations' errors are conditionally uncorrelated. This is
  **no autocorrelation**, also called no serial correlation.
- Assumption 3 is these two statements together, and nothing more. It does not
  say the errors are independent and it does not say they are normal.

### 4.6 The variance of OLS under Assumption 3

Source: `y2025_L4_sep11` p8, `y2023_L4_sep14` p12, `y2022_L5_sep20` p7,
`y2023_L6_sep21` p4.

- Put $\Var{U \mid X} = \sigma^2 I_n$ into the sandwich:
$$
\begin{aligned}
\Var{\hat\beta \mid X} &= (X^\top X)^{-1} X^\top\ \sigma^2 I_n\ X (X^\top X)^{-1} \\
&= \sigma^2 (X^\top X)^{-1} X^\top X (X^\top X)^{-1} \\
&= \sigma^2 (X^\top X)^{-1}.
\end{aligned}
$$
- Under Assumptions 1 to 4:
$$
\boxed{\ \E{\hat\beta \mid X} = \beta, \qquad \Var{\hat\beta \mid X} = \sigma^2 (X^\top X)^{-1}\ }
$$
- All three years boxed this pair. It is the central result of the deck.

### 4.7 What $\sigma^2$ is

Source: `y2023_L4_sep14` p12.

- From Assumption 3 and Assumption 2 together,
$$
\sigma^2 = \Var{U_i \mid X} = \E{U_i^2 \mid X},
$$
and since this holds for every value of $X$, iterated expectations gives
$$
\sigma^2 = \E{U_i^2} = \Var{U_i}.
$$
- $\sigma^2$ is one unknown number, the same for every observation. Estimating
  it is a question for the next deck.

### 4.8 One regressor

Source: `y2025_L4_sep11` p9, `y2023_L4_sep14` p13, `y2022_L5_sep20` p7 to p8.

- Take $k = 1$, no intercept, so $Y_i = \beta X_i + U_i$ and $X$ is $n\times1$.
  Then $X^\top X = \sum_i X_i^2$ and
$$
\Var{\hat\beta \mid X} = \frac{\sigma^2}{\sum_{i=1}^{n} X_i^2}.
$$
- Two things move the variance. Noisier errors raise it. More spread in the
  regressor lowers it.

### 4.9 Why spread in the regressor helps

Source: `y2025_L4_sep11` p9, `y2023_L4_sep14` p13, `y2022_L5_sep20` p8.

- With the regressor bunched together, many quite different slopes fit the data
  about equally well, so the estimate moves a lot from sample to sample.
- With the regressor spread out, the slope is pinned down.

**Picture 2, two panels side by side.** Left panel, captioned
$\sum_i X_i^2$ small: axes $x$ and $y$, a round cloud of points covering a
narrow range of $x$, and three straight lines of clearly different slopes drawn
through the cloud, all crossing near its centre and all fitting about equally
well. Right panel, captioned $\sum_i X_i^2$ large: the same axes, points lying
in a long thin upward-sloping band spanning a wide range of $x$, and two lines
drawn through them that nearly coincide. All three years drew this pair.

### 4.10 Without Assumption 3

Source: `y2023_L6_sep21` p5, `y2025_L5_sep16` p7.

- If the errors are heteroskedastic, so that
$$
\Var{U \mid X} = \Omega = \begin{pmatrix} \sigma_1^2 & & 0 \\ & \ddots & \\ 0 & & \sigma_n^2 \end{pmatrix},
$$
the sandwich does not collapse. The middle factor becomes
$$
X^\top \Omega X = \begin{pmatrix} X_1 & \cdots & X_n \end{pmatrix} \Omega \begin{pmatrix} X_1^\top \\ \vdots \\ X_n^\top \end{pmatrix} = \sum_{i=1}^{n} \sigma_i^2 X_i X_i^\top,
$$
so
$$
\Var{\hat\beta \mid X} = (X^\top X)^{-1} \left(\sum_{i=1}^{n} \sigma_i^2 X_i X_i^\top\right) (X^\top X)^{-1}.
$$
- Unbiasedness is untouched. Only the variance formula changes.

### 4.11 Where each assumption was used

Source: this deck, collecting slides 2.4, 4.3 and 4.6.

- A short table, three rows.
- Assumptions 1, 2, 4: $\E{\hat\beta \mid X} = \beta$ and $\E{\hat\beta} = \beta$.
- Assumptions 1, 2, 4: the sandwich formula for $\Var{\hat\beta \mid X}$.
- Assumptions 1, 2, 3, 4: $\Var{\hat\beta \mid X} = \sigma^2 (X^\top X)^{-1}$.

## Section 5. The Gauss-Markov theorem

### 5.1 Linear estimators

Source: the typed notes property 1, `y2025_L5_sep16` p2, `y2025_L4_sep11` p10.

- **Definition.** An estimator $b$ of $\beta$ is **linear** if it can be written
$$
b = A Y
$$
for a matrix $A$ that is $k \times n$ and depends on $X$ alone, not on $Y$.
- OLS is linear, with $A = (X^\top X)^{-1} X^\top$.
- Given $X$, a linear estimator is a fixed linear combination of the
  observations on the dependent variable.

### 5.2 Two more linear estimators

Source: `y2025_L4_sep11` p10, `y2025_L5_sep16` p1 and p4.

- **The two-point slope.** With $k = 1$ and $Y_i = \beta X_i + U_i$,
$$
\tilde\beta = \frac{Y_n - Y_1}{X_n - X_1} = -\frac{1}{X_n - X_1} Y_1 + \frac{1}{X_n - X_1} Y_n .
$$
It uses two observations and throws the rest away.
- **Weighted least squares.** For a known $n \times n$ matrix $W$ that is
  symmetric, positive definite and non-random,
$$
\tilde\beta = (X^\top W X)^{-1} X^\top W\, Y .
$$
OLS is the case $W = I_n$. With $W$ diagonal this weights observation $i$ by
$w_i$, as the first deck's closing slide described.

### 5.3 Both are unbiased

Source: `y2025_L4_sep11` p10, `y2025_L5_sep16` p4.

- The two-point slope. Substituting $Y_i = \beta X_i + U_i$,
$$
\tilde\beta = \beta + \frac{U_n - U_1}{X_n - X_1}, \qquad \E{\tilde\beta \mid X} = \beta .
$$
- Weighted least squares. Substituting $Y = X\beta + U$,
$$
\tilde\beta = \beta + (X^\top W X)^{-1} X^\top W\, U, \qquad \E{\tilde\beta \mid X} = \beta .
$$
- So being unbiased does not single OLS out. There are many unbiased linear
  estimators.

### 5.4 The variance of the weighted estimator

Source: `y2025_L4_sep11` p10.

- By the same route as slide 4.2, using $W^\top = W$ and Assumption 3,
$$
\Var{\tilde\beta \mid X} = \sigma^2 (X^\top W X)^{-1} X^\top W\, W X (X^\top W X)^{-1},
$$
which reduces to $\sigma^2 (X^\top X)^{-1}$ when $W = I_n$.
- The question is which of these matrices is smallest, and what smallest means
  for matrices.

### 5.5 The question

Source: `y2025_L5_sep16` p1.

- Given any linear estimator $\tilde\beta$ that is conditionally unbiased, is
$$
\underbrace{\Var{\tilde\beta \mid X}}_{k\times k} - \underbrace{\Var{\hat\beta \mid X}}_{k\times k} \;\ge\; 0
$$
in the sense of being positive semidefinite?
- Fall 2025 wrote the question exactly this way, with a question mark over the
  zero, and spent the rest of that meeting and the next answering it.

### 5.6 The Gauss-Markov theorem

Source: `y2025_L4_sep11` p11, the typed notes property 5.

- **Theorem.** Assume 1, 2, 3 and 4. Let $\tilde\beta$ be any estimator that is
  1. linear, $\tilde\beta = A Y$ with $A$ a function of $X$ alone, and
  2. conditionally unbiased, $\E{\tilde\beta \mid X} = \beta$.

  Then
$$
\Var{\tilde\beta \mid X} - \Var{\hat\beta \mid X} \ \text{ is positive semidefinite.}
$$
- OLS is the **best linear unbiased estimator**: best in the sense above, linear
  in $Y$, conditionally unbiased, and an estimator of $\beta$.
- Fall 2025 wrote the four words down the board with B, L, U and E beside them.
- The theorem is about conditional unbiasedness, because it compares conditional
  variances.

### 5.7 Reading the matrix ordering

Source: `y2025_L4_sep11` p11 to p12.

- If $A$ is positive semidefinite then $c^\top A c \ge 0$ for **every** $c$.
- Take $c$ to be the $j$th coordinate vector. Then $c^\top A c = A_{jj}$, so
  every diagonal entry of a positive semidefinite matrix is non-negative.
- Applied to $A = \Var{\tilde\beta \mid X} - \Var{\hat\beta \mid X}$, whose
  $j$th diagonal entry is the difference of the two variances of the $j$th
  coefficient:
$$
\Var{\tilde\beta_j \mid X} \ \ge\ \Var{\hat\beta_j \mid X}, \qquad j = 1, \ldots, k .
$$
- The same inequality with a general $c$ says the same thing about every linear
  combination $c^\top\beta$ of the coefficients.

### 5.8 Proof, step 1: linearity and unbiasedness force $A X = I_k$

Source: `y2025_L4_sep11` p13 to p14, `y2025_L5_sep16` p2.

- Take conditional expectations of $\tilde\beta = A Y$:
$$
\begin{aligned}
\beta = \E{\tilde\beta \mid X} &= \E{A(X\beta + U) \mid X} \\
&= A X \beta + A \underbrace{\E{U \mid X}}_{=\,0} \\
&= A X \beta .
\end{aligned}
$$
- This must hold for every $\beta \in \mathbb{R}^k$, so
$$
\boxed{\ A X = I_k\ }
$$
- Linearity plus conditional unbiasedness is exactly this one condition.

### 5.9 Step 1 checked on the examples

Source: `y2025_L5_sep16` p2 and p4.

- OLS: $A = (X^\top X)^{-1} X^\top$, so $A X = (X^\top X)^{-1} X^\top X = I_k$.
- Weighted least squares: $A = (X^\top W X)^{-1} X^\top W$, so
  $A X = (X^\top W X)^{-1} X^\top W X = I_k$.
- The two-point slope, with $k = 1$: $A$ has $-1/(X_n - X_1)$ in position 1 and
  $1/(X_n - X_1)$ in position $n$, so
  $A X = (X_n - X_1)/(X_n - X_1) = 1$.

### 5.10 Proof, step 2: the two sampling errors

Source: `y2025_L4_sep11` p14, `y2025_L5_sep16` p3 and p4.

- Using $A X = I_k$ for the general estimator and slide 2.1 for OLS,
$$
\hat\beta = \beta + (X^\top X)^{-1} X^\top U, \qquad
\tilde\beta = A X \beta + A U = \beta + A U .
$$
- Both estimators differ from $\beta$ only through a known matrix times $U$.
  Everything that follows is an expectation of $U U^\top$.

### 5.11 The transpose rule for covariance matrices

Source: `y2025_L4_sep11` p13.

- For random vectors $V$ that is $k \times 1$ and $Z$ that is $\ell \times 1$,
$$
\Cov{V, Z} = \E{(V - \E{V})(Z - \E{Z})^\top} \qquad (k \times \ell),
$$
and transposing gives
$$
\Cov{V, Z}^\top = \E{(Z - \E{Z})(V - \E{V})^\top} = \Cov{Z, V}.
$$
- Needed on the next slide but one, where both orders appear.

### 5.12 Proof, step 3: the covariance equals the variance of OLS

Source: `y2025_L4_sep11` p14, `y2025_L5_sep16` p3.

- Both estimators are conditionally unbiased, so their deviations from their
  conditional means are the two noise terms of slide 5.10:
$$
\begin{aligned}
\Cov{\tilde\beta, \hat\beta \mid X}
&= \E{\big(\tilde\beta - \beta\big)\big(\hat\beta - \beta\big)^\top \,\Big|\, X} \\
&= \E{A U\, U^\top X (X^\top X)^{-1} \,\big|\, X} \\
&= A\, \underbrace{\E{U U^\top \mid X}}_{=\,\sigma^2 I_n \text{ by Assumption 3}}\, X (X^\top X)^{-1} \\
&= \sigma^2 \underbrace{A X}_{=\, I_k} (X^\top X)^{-1} \\
&= \sigma^2 (X^\top X)^{-1}.
\end{aligned}
$$
- The right-hand side is $\Var{\hat\beta \mid X}$, so
$$
\boxed{\ \Cov{\tilde\beta, \hat\beta \mid X} = \Var{\hat\beta \mid X}\ }
$$
- Every linear unbiased estimator has the same covariance with OLS, namely the
  variance of OLS itself. This is the one surprising step in the proof.

### 5.13 Proof, step 4: the difference of the variances

Source: `y2025_L5_sep16` p5, `y2025_L4_sep11` p13.

- Expand the variance of the difference, as for a scalar:
$$
\Var{\tilde\beta - \hat\beta \mid X} = \Var{\tilde\beta \mid X} + \Var{\hat\beta \mid X}
- \Cov{\tilde\beta, \hat\beta \mid X} - \Cov{\hat\beta, \tilde\beta \mid X}.
$$
- Slide 5.12 gives the first covariance term. The second is its transpose by
  slide 5.11, and $\Var{\hat\beta \mid X}$ is symmetric, so both equal
  $\Var{\hat\beta \mid X}$. Three copies of it combine into one with a minus
  sign:
$$
\Var{\tilde\beta - \hat\beta \mid X} = \Var{\tilde\beta \mid X} - \Var{\hat\beta \mid X}.
$$
- The left-hand side is the variance matrix of a random vector, so it is
  positive semidefinite by slide 3.4. Therefore
$$
\Var{\tilde\beta \mid X} - \Var{\hat\beta \mid X} \ \ge\ 0,
$$
which is the theorem.

### 5.14 Uniqueness

Source: `y2025_L5_sep16` p5 to p6, the typed notes property 5.

- Suppose some linear conditionally unbiased $\tilde\beta$ attains the same
  variance:
$$
\Var{\tilde\beta \mid X} = \Var{\hat\beta \mid X}
\quad\Longrightarrow\quad
\Var{\tilde\beta - \hat\beta \mid X} = 0 .
$$
- A random vector with zero conditional variance equals its conditional mean, so
$$
\tilde\beta - \hat\beta = c(X)
$$
for some function of $X$ alone.
- Both are conditionally unbiased, so taking conditional expectations,
$$
\underbrace{\E{\tilde\beta \mid X}}_{=\,\beta} = \underbrace{\E{\hat\beta \mid X}}_{=\,\beta} + c(X)
\quad\Longrightarrow\quad c(X) = 0 .
$$
- Therefore $\tilde\beta = \hat\beta$. OLS is not just a
  best linear unbiased estimator, it is the only one.

### 5.15 Where Assumption 3 was used

Source: `y2025_L5_sep16` p6 to p7, the closing remark of the typed notes.

- Assumption 3 entered once, at slide 5.12, where $\E{U U^\top \mid X}$ was
  replaced by $\sigma^2 I_n$. Without it the cancellation that produced
  $\sigma^2 A X$ fails, and the covariance is no longer the variance of OLS.
- Assumptions 1, 2 and 4 give unbiasedness and the sandwich formula. Assumption
  4 is what makes OLS efficient.
- If Assumption 3 fails, OLS is still unbiased and no longer best.

## Section 6. Two extensions, and the summary

### 6.1 Adding normality

Source: the typed notes property 4, `y2023_L7_sep26_2` p8, `y2025_L8_oct02` p1.

- **Assumption 5.** $U \mid X \sim N(0, \sigma^2 I_n)$. Assumptions 1 to 5
  define the classical normal regression model.
- Given $X$, $\hat\beta = (X^\top X)^{-1}X^\top Y$ is a linear function of $Y$,
  and a linear function of a normal vector is normal:
$$
V \sim N(\mu, \Sigma) \quad\Longrightarrow\quad \alpha + \Gamma V \sim N(\alpha + \Gamma \mu,\ \Gamma \Sigma \Gamma^\top).
$$
- With the mean and variance already computed,
$$
\boxed{\ \hat\beta \mid X \ \sim\ N\big(\beta,\ \sigma^2 (X^\top X)^{-1}\big)\ }
$$
- Nothing in this deck needed this. It is what confidence intervals and tests
  will be built on.

### 6.2 If Assumption 3 fails: generalised least squares

Source: `y2025_L5_sep16` p7 to p12.

- Suppose $\Var{U \mid X} = \Omega$, known and positive definite, with
  $\Omega \neq \sigma^2 I_n$. Let $\Omega^{-1/2}$ be the symmetric matrix with
  $\Omega^{-1/2}\Omega^{-1/2} = \Omega^{-1}$, built from the eigenvalue
  decomposition $\Omega = C \Lambda C^\top$.
- Multiply the model through by $\Omega^{-1/2}$:
$$
\underbrace{\Omega^{-1/2} Y}_{Y^*} = \underbrace{\Omega^{-1/2} X}_{X^*} \beta + \underbrace{\Omega^{-1/2} U}_{U^*},
\qquad \E{U^* \mid X} = 0, \qquad \Var{U^* \mid X} = I_n .
$$
- The transformed model satisfies all four assumptions, so Gauss-Markov applies
  to it, and OLS on the transformed model is
$$
\hat\beta^* = (X^{*\top} X^*)^{-1} X^{*\top} Y^* = (X^\top \Omega^{-1} X)^{-1} X^\top \Omega^{-1} Y,
$$
which is weighted least squares with $W = \Omega^{-1}$.
- In practice $\Omega$ is not known. Later lectures return to this.

### 6.3 Summary: unbiasedness and variance

Source: this deck, Sections 2 to 4.

- Substituting the model into the estimator gives the sampling error
  $\hat\beta = \beta + (X^\top X)^{-1} X^\top U$. Everything follows from it.
- **Unbiasedness.** Under Assumptions 1, 2 and 4, conditioning on $X$ makes
  $(X^\top X)^{-1}X^\top$ known, so $\E{\hat\beta \mid X} = \beta$, and iterated
  expectations gives $\E{\hat\beta} = \beta$. The weaker condition
  $\E{X_i U_i} = 0$ is not enough, because the expectation of the noise term
  does not factor, and the parabola shows that zero correlation does not make
  the conditional mean zero.
- **Variance.** Under the same three assumptions,
$$
\Var{\hat\beta \mid X} = (X^\top X)^{-1} X^\top \Var{U \mid X} X (X^\top X)^{-1},
$$
and adding Assumption 3, that $\Var{U \mid X} = \sigma^2 I_n$, gives
$$
\Var{\hat\beta \mid X} = \sigma^2 (X^\top X)^{-1}.
$$
With one regressor this is $\sigma^2 / \sum_i X_i^2$: noisier errors raise it,
more spread in the regressor lowers it.

### 6.4 Summary: efficiency

Source: this deck, Section 5.

- **Gauss-Markov.** Under Assumptions 1 to 4, OLS has the smallest conditional
  variance among all estimators that are linear in $Y$ and conditionally
  unbiased. For every such $\tilde\beta$,
$$
\Var{\tilde\beta \mid X} - \Var{\hat\beta \mid X} \ \ge\ 0,
$$
so in particular $\Var{\tilde\beta_j \mid X} \ge \Var{\hat\beta_j \mid X}$ for
every coefficient.
- **The proof in three steps.** Linearity and conditional unbiasedness force
  $A X = I_k$. Assumption 3 then makes
  $\Cov{\tilde\beta, \hat\beta \mid X} = \Var{\hat\beta \mid X}$. Expanding
  $\Var{\tilde\beta - \hat\beta \mid X}$, which is positive semidefinite, leaves
  exactly the difference of the two variances.
- **Uniqueness.** Equality of the variances forces $\tilde\beta = \hat\beta$.
- Assumption 3 is what buys efficiency. Assumptions 1, 2 and 4 give
  unbiasedness on their own.

---

# Part 3. Decisions for the writer

**Assumption numbering.** Use 1 model, 2 zero conditional mean, 3
homoskedasticity and no autocorrelation, 4 rank condition. That is the typed
notes' numbering, `527_02.tex` lines 176 to 179, and **the deck follows the typed
notes** (decided 2026-09-14, and applied to this plan too). The board and the
typed notes disagree about the last two: in all three years the board introduces
the variance condition fourth, after the rank condition (`y2025_L4_sep11` p7,
`y2023_L4_sep14` p11, `y2022_L5_sep20` p6), while the typed notes call the
variance condition (A3) and the rank condition (A4). Fall 2022 relabelled the
assumptions on the board to the typed numbering on `y2022_L5_sep20` p9, which is
the same choice. The first deck's identification slide numbers its own three
Assumptions 1, 2 and 3 with the population rank condition third; the slide on
the four assumptions here says that Assumption 4 is the sample counterpart of
that condition, so the link between the decks is stated in words rather than
carried by the number.

**The error's expectation.** Do not restate the derivation of $\E{U_i} = 0$ from
$\E{U_i \mid X_i} = 0$. The first deck proves it and revised that slide once
already. Slide 2.9, which introduces the weaker condition, states
$\E{X_i U_i} = 0$ together with $\E{U_i} = 0$, because uncorrelatedness needs
both and the board wrote the pair on `y2023_L4_sep14` p4. Slide 2.13 refers back
to the first deck for what identification survives. The absorption of a nonzero
error mean into the intercept, which Fall 2022 did at `y2022_L4_sep15` p17 and
Fall 2023 at `y2023_L6_sep21` p11 to p12, is already a slide in the first deck
and is not repeated.

**Generalised least squares.** One slide, 6.2. Fall 2025 taught it in full on
`y2025_L5_sep16` p7 to p12, including the eigenvalue decomposition and the
symmetric square root. The other two years did not touch it. Keep the eigenvalue
construction to one line and state the estimator, because its role here is only
to say what efficiency costs when Assumption 3 fails. The first deck's closing
slide already names generalised least squares as weighted least squares with the
inverse error variance as the weight matrix, so slide 6.2 closes that loop.

**Normality.** One slide, 6.1. It is property 4 of the typed notes and sits
between the variance and Gauss-Markov there, so leaving it out entirely would
break the correspondence with the typed section the deck follows. The classes
reach it later, when confidence intervals need it: Fall 2023 on
`y2023_L7_sep26_2` p8 and Fall 2025 on `y2025_L8_oct02` p1. Place it in
Section 6 rather than between Sections 4 and 5, mark it as not needed for
anything in this deck, and keep it to the statement plus the affine
transformation rule.

**Which year the deck follows.** Fall 2025 is the only year that taught
Gauss-Markov in these meetings. Section 5 is therefore built entirely from
`y2025_L4_sep11` p10 to p14 and `y2025_L5_sep16` p1 to p6, with the typed notes
supplying the definition of a linear estimator and the wording of uniqueness.
Sections 2 to 4 are built from all three years, taking the fullest treatment of
each piece: Fall 2023 for why zero correlation is not enough, Fall 2022 and
Fall 2025 for the variance of a random vector, and all three for the scalar case
and its pictures.

**Naming the matrix that multiplies $U$.** Write
$\Gamma_X := (X^\top X)^{-1} X^\top$ for the OLS case, following
`y2023_L6_sep21` p4 and `y2025_L4_sep11` p6, and reserve $A$ for the matrix of a
general linear estimator, following the typed notes and `y2025_L5_sep16` p2.
Fall 2025 used $A_X$ for both on `y2025_L5_sep16` p1 and p2, which makes the
Gauss-Markov proof read as though OLS and the competing estimator share a
matrix. Splitting the two symbols removes that.

**Conditional against unconditional unbiasedness.** State the theorem
conditionally and derive the unconditional version from it, as Fall 2022 and
Fall 2023 did. Fall 2025 wrote only the conditional statement. The Gauss-Markov
theorem needs the conditional version anyway, since it compares conditional
variances, and the typed notes make the same point.

**No almost-sure qualifiers (decided 2026-09-14).** The deck states every
equality as a bare equality. Slides 3.5 and 5.14 had carried "with probability
one", following the first deck, and the author asked for all of them to come out
so that the statements read simply. The board wrote bare equalities in the same
places. One addition to what the board wrote survives: slide 5.7 states the consequence of the matrix ordering for a general vector $c$
as well as for the coordinate vectors the board used on `y2025_L4_sep11` p12;
it is the same inequality read for a general linear combination of the
coefficients, and it is what makes the ordering worth stating as a matrix
statement.

**Pictures.** Two, both described in Part 2. Picture 1, at slide 2.11, is the
parabola against the flat band. Draw the parabola opening upward, following
`y2023_L4_sep14` p4 and p7, which is the version with labelled axes; Fall 2025
drew it opening downward on `y2025_L4_sep11` p3 and the direction carries no
meaning. Picture 2, at slide 4.9, is the narrow cloud against the wide band.
Both are two-panel figures in the style of the first deck's density pair.

**Figure drawing (settled 2026-09-14).** Both pictures are drawn through
`tikzDevice`, so LaTeX itself typesets every label and the figure text matches
the mathematics on the slides. `latex2exp` was tried first and rejected: it
translates LaTeX into R's own plotmath, which is set in the graphics device's
font, so a sum still looked nothing like a sum in the surrounding text. The
deck now depends on the R packages `tikzDevice` and `png` and on `pdflatex` and
`pdftoppm` being on the path.

The helper is `tikz_fig()`, defined in a hidden chunk just after the macro
block near the top of the deck. It opens a `standAlone` tikz device in
`tempdir()`, runs the plotting code, compiles the `.tex` with `pdflatex`,
converts the page with `pdftoppm -r 300`, and draws the resulting image into
the chunk's own device with `rasterImage`. The last step is what keeps the
figure inside Quarto's normal output path: handing the file to
`knitr::include_graphics()` instead leaves an absolute temporary path in the
document that Quarto cannot fetch and LaTeX cannot read. Each figure chunk
therefore carries `fig-width: 9`, `fig-height: 3.6` and `fig-dpi: 300`, matching
the tikz device, and `echo: false`, so the plotting code stays out of the
slides.

Inside the plotting code the labels are written as ordinary LaTeX strings,
`"$X_i$"`, `"$\\sum_{i=1}^{n} X_i^2$ small"`, `"$\\mathrm{E}[U_i \\mid X_i] \\neq 0$"`,
with the backslashes doubled for R. Titles are set with `font.main = 1` so they
are not bold, which keeps them in the same weight as the mathematics. Axes are
drawn with `axes = FALSE` and a plain `box()`: the tick numbers are arbitrary
here and only distract. Lines are coloured from the Dark2 palette, `#d95f02`
orange, `#1b9e77` green and `#7570b3` purple, which stays readable in greyscale
and for colour-blind readers. In picture 1 the axis labels and the condition
below them are placed with `mtext`. In picture 2 the wide-spread panel carries
a single fitted line.
