# MathJax Fragment Issue in Quarto Revealjs

## Verified Working Solution (Current)

This is the confirmed setup that works (verified on February 12, 2026):

1. Keep the derivation in one `\begin{aligned}...\end{aligned}` block and continue using `\fragment{...}` in the math source.
2. Define `\fragment` differently by output target:
   - HTML/reveal: `\newcommand{\fragment}[1]{\class{mjxfrag}{#1}}`
   - PDF: `\newcommand{\fragment}[1]{#1}`
3. In revealjs YAML, keep `include-after-body` as a file include:
   - `include-after-body: reveal_mathjax_fragments.html`
4. In `reveal_mathjax_fragments.html`, run post-MathJax normalization that:
   - finds `.mjxfrag` markers,
   - maps them to row-level `mjx-mtr` targets,
   - removes existing `.fragment` classes in each affected `mjx-container`,
   - applies `.fragment` only to row-level targets,
   - resyncs Reveal fragments (`Reveal.syncFragments(...)`, fallback `Reveal.sync()`),
   - re-applies on `slidechanged` and on late MathJax node insertion (`MutationObserver`).

Verified behavior:

- First line is visible immediately.
- Each subsequent `= ...` line appears one-by-one.
- No phantom key presses before slide advance.

## Problem

In a Quarto revealjs presentation (`326_07_cis.qmd`), `\class{fragment}{...}` inside a MathJax `aligned` environment does not produce working revealjs fragments. The math content is always fully visible, but revealjs counts the fragment elements as steps — resulting in phantom key presses that do nothing visually before advancing to the next slide.

With 8 `\fragment{...}` calls (each expanding to `\class{fragment}{...}`), the user must press "next" 9 times (8 phantom fragment steps + 1 slide advance) with no visible change on any press.

## Status (Resolved)

As of February 12, 2026, this is fixed in `326_07_cis.qmd`.

## Root Cause

The core issue was not just timing; it was element granularity:

- `\class{fragment}{...}` inside MathJax caused `.fragment` classes to exist on MathJax-internal rendered nodes.
- Reveal.js counted those nodes as fragment steps, but they were not reliable row-level visibility controls for the aligned derivation.
- Result: Reveal advanced fragment indices, but visible content did not change (phantom presses).

Contributing factor:

- Quarto’s Reveal math integration path (MathJax config via reveal plugin compatibility layer) made simple `Reveal.sync()` retries insufficient by themselves.

## Implemented Solution (Working)

1. Keep the `\fragment{...}` macro API in the `aligned` block, but change it to a marker class:
   - Reveal/HTML macro: `\newcommand{\fragment}[1]{\class{mjxfrag}{#1}}`
   - PDF macro remains pass-through: `\newcommand{\fragment}[1]{#1}`
2. After MathJax typesets, run JS that:
   - scans each `mjx-container`,
   - finds `.mjxfrag` markers,
   - maps markers to row-level `mjx-mtr` elements (one fragment target per equation row),
   - removes pre-existing `.fragment` classes inside that container,
   - adds `.fragment` only to the selected row targets,
   - calls `Reveal.syncFragments(currentSlide)` (fallback `Reveal.sync()`).
3. Re-run normalization on `slidechanged` and via `MutationObserver` for late-rendered math.

## Outcome

- First derivation line stays visible immediately.
- Each subsequent `= ...` line reveals incrementally.
- Phantom fragment presses are eliminated.
- Works in Quarto revealjs with MathJax while keeping a single `aligned` environment.

## Desired Solution

- Use a `\fragment` macro inside a single `\begin{aligned}...\end{aligned}` environment
- The first line of the derivation is always visible
- Each subsequent line (prefixed with `= ...`) appears incrementally on key press
- Must work within Quarto revealjs with MathJax
- No switching to separate `{.fragment}` div blocks or other non-`aligned` approaches

## Original Setup (Before Fix)

### Macro Definitions (Before Fix)

**For revealjs/HTML** (in a `{=html}` block):
```html
<span style="display:none">\(\newcommand{\fragment}[1]{\class{fragment}{#1}}\)</span>
```

**For PDF** (in YAML `include-in-header`):
```latex
\newcommand{\fragment}[1]{#1}
```

### Slide Source (QMD)

```markdown
## Infeasible CI validity ($\sigma^2$ known)

::: {.nonincremental}

- **Goal:** show that $P\left( \beta_{1}\in CI_{1-\alpha} \mid \mathbf{X}\right) =1-\alpha$.

- **Notation:** $\sigma_{\hat{\beta}_{1}} = \sqrt{\operatorname{Var}(\hat{\beta}_{1} \mid \mathbf{X})}$.

- **Key fact:** $Z=\dfrac{\hat{\beta}_{1}-\beta_{1}}{\sigma_{\hat{\beta}_{1}}}\sim N(0,1)$ conditionally on $\mathbf{X}$.

:::

$$
\begin{aligned}
&P\left(\beta_{1} \in CI_{1-\alpha} \mid \mathbf{X}\right) \\
&\fragment{{}= P\left(\hat{\beta}_{1} - z_{1-\alpha /2}\,\sigma_{\hat{\beta}_{1}} \leq \beta_{1} \leq \hat{\beta}_{1} + z_{1-\alpha /2}\,\sigma_{\hat{\beta}_{1}} \mid \mathbf{X}\right)} \\
&\fragment{{}= P\left(-z_{1-\alpha /2}\,\sigma_{\hat{\beta}_{1}} \leq \beta_{1} - \hat{\beta}_{1} \leq z_{1-\alpha /2}\,\sigma_{\hat{\beta}_{1}} \mid \mathbf{X}\right)} \\
&\fragment{{}= P\left(-z_{1-\alpha /2}\,\sigma_{\hat{\beta}_{1}} \leq \hat{\beta}_{1} - \beta_{1} \leq z_{1-\alpha /2}\,\sigma_{\hat{\beta}_{1}} \mid \mathbf{X}\right)} \\
&\fragment{{}= P\left(-z_{1-\alpha /2} \leq \frac{\hat{\beta}_{1} - \beta_{1}}{\sigma_{\hat{\beta}_{1}}} \leq z_{1-\alpha /2} \mid \mathbf{X}\right)} \\
&\fragment{{}= P\left(-z_{1-\alpha /2} \leq Z \leq z_{1-\alpha /2} \mid \mathbf{X}\right)} \\
&\fragment{{}= P\left(Z \leq z_{1-\alpha /2} \mid \mathbf{X}\right) - P\left(Z \leq -z_{1-\alpha /2} \mid \mathbf{X}\right)} \\
&\fragment{{}= \left(1-\alpha /2\right) - \alpha /2} \\
&\fragment{{}= 1-\alpha .}
\end{aligned}
$$
```

### Relevant YAML Configuration

```yaml
format:
  revealjs:
    theme: solarized
    css: slides_no_caps.css
    smaller: true
    slide-number: c/t
    incremental: true
    html-math-method: mathjax
    scrollable: true
    chalkboard: false
    self-contained: true
    transition: none
```

### MathJax Loading (from rendered HTML)

Quarto loads MathJax 3 via the **MathJax2 revealjs plugin handler**, using the URL:
```
https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml-full.js
```
The `tex-chtml-full.js` bundle includes all TeX extensions (including the `html` extension that provides `\class`, `\cssId`, `\style`).

The MathJax2 plugin handler calls `MathJax.Hub.Config(...)` and `MathJax.Hub.Queue(...)`, which are MathJax 2 API calls. MathJax 3 does not have `MathJax.Hub`. Despite this API mismatch, MathJax 3 auto-typesets the page on load, so math renders correctly. However, revealjs fragment integration may be broken by this mismatch.

### Observed Behavior

- All 8 fragment lines are **visible immediately** when the slide appears
- Pressing "next" produces **no visible change** for 8 presses
- The 9th press advances to the next slide
- This confirms revealjs **detects** 8 fragment elements but **cannot hide/show** them

### Rendered HTML Structure (server-side, before MathJax client-side rendering)

```html
<section id="infeasible-ci-validity-sigma2-known" class="slide level2">
  <h2>Infeasible CI validity ...</h2>
  <ul>
    <li><p><strong>Goal:</strong> ...</p></li>
    <li><p><strong>Notation:</strong> ...</p></li>
    <li><p><strong>Key fact:</strong> ...</p></li>
  </ul>
  <p><span class="math display">\[
    \begin{aligned}
    &P(...) \\
    &\fragment{{}= P(...)} \\
    ...
    \end{aligned}
  \]</span></p>
</section>
```

Note: `<li>` elements do NOT have `class="fragment"` (nonincremental works correctly). The only fragments are inside MathJax.

## Failed Approaches

### 1. Two-argument `\fragment` macro

**Macro:** `\newcommand{\fragment}[2]{\class{fragment}{#2}}`
**Usage:** `\fragment{1}{content}`, `\fragment{2}{content}`, etc.

**Result:** The unused first argument `{N}` may have created additional phantom fragment elements, doubling the count. Changed to 1-argument macro.

### 2. One-argument `\fragment` macro (CSS class approach only)

**Macro:** `\newcommand{\fragment}[1]{\class{fragment}{#1}}`
**Usage:** `\fragment{content}`

**Result:** 8 phantom presses + 1 advance = 9 total. Content always visible. `\class{fragment}` appears to create elements that revealjs counts but cannot visually hide.

### 3. `Reveal.sync()` after MathJax renders

Added to YAML `include-after-body`:
```html
<script>
MathJax.startup.promise.then(function() {
  Reveal.sync();
});
</script>
```

**Result:** No change. Still 9 phantom presses.

### 4. CSS `!important` override for MathJax fragments

Added to `slides_no_caps.css`:
```css
mjx-container .fragment:not(.visible) {
  opacity: 0 !important;
}
```

**Result:** No change. The CSS rule IS present in the rendered HTML (confirmed via grep), but has no effect on visibility.

### 5. JavaScript inline style control with Reveal events

```html
<script>
MathJax.startup.promise.then(function() {
  document.querySelectorAll('mjx-container .fragment').forEach(function(el) {
    el.style.opacity = '0';
  });
  Reveal.sync();
  Reveal.on('fragmentshown', function(event) {
    event.fragments.forEach(function(el) {
      if (el.closest && el.closest('mjx-container')) {
        el.style.opacity = '1';
      }
    });
  });
  Reveal.on('fragmenthidden', function(event) {
    event.fragments.forEach(function(el) {
      if (el.closest && el.closest('mjx-container')) {
        el.style.opacity = '0';
      }
    });
  });
});
</script>
```

**Result:** No change.

### 6. MutationObserver and Row-level Synchronization (More aggressive)

Attempted to use a custom class `mj-mark` instead of `fragment` in the LaTeX to prevent Reveal from seeing them early, then used JS to find the parent table row (`mjx-mtr`) and add the `fragment` class there.

**Macro:** `\newcommand{\fragment}[1]{\class{mj-mark}{#1}}`

**Result:** This caused the entire presentation to fail to load (blank screen), likely due to a syntax error or logic crash in the complex script. After fixing the crash, the "phantom press" issue persisted.

### 7. Explicit Indexing and Set-based Deduplication

Attempted to manually assign `data-fragment-index` to the identified rows to ensure exactly one step per line.

**Result:** User reports that even after lines are shown, there are still 9 phantom presses remaining at the end of the display sequence. This suggests that Reveal.js is still detecting the original `\class{fragment}` elements (or multiple nested elements created by MathJax) as valid fragment steps, even if we attempt to redirect the fragment behavior to the row level.

## Resolved Findings

1. `\class{fragment}{...}` can lead to Reveal fragment registration on MathJax-internal nodes rather than stable row-level targets.
2. Syncing alone (`Reveal.sync()`) is not sufficient if the wrong nodes are tagged as fragments.
3. Converting `\fragment` into a marker class and promoting only row-level targets to `.fragment` resolves the phantom-step behavior.

## File Locations

- QMD source: `326_07_cis.qmd`
- Reveal fragment normalizer: `reveal_mathjax_fragments.html`
- CSS file: `slides_no_caps.css`
- Rendered slides: `output/326_07_cis_slides.html`
- Quarto render command: `quarto render 326_07_cis.qmd --to revealjs`
