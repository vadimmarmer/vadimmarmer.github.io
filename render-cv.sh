#!/bin/bash
# Render CV PDF locally (same pipeline as GitHub Actions)
set -e
sed '1{/^---$/!q;};1,/^---$/d' _pages/cv.md > /tmp/cv_body.md
sed -i '' '/^\[Download PDF\]/d' /tmp/cv_body.md
UPDATED=$(grep -m1 '^Updated:' /tmp/cv_body.md || true)
sed -i '' '/^Updated:/d' /tmp/cv_body.md
sed -i '' 's/<br>$/\\/g' /tmp/cv_body.md
# LaTeX header: put "Updated" date in top-left of first page
cat > /tmp/cv_header.tex << TEXHEADER
\usepackage{fancyhdr}
\usepackage{etoolbox}
\usepackage{titling}
\setlength{\droptitle}{-5em}
\preauthor{}
\postauthor{}
\predate{}
\postdate{\vspace{-2em}}
\fancypagestyle{firstpage}{%
  \fancyhf{}%
  \fancyhead[L]{\footnotesize ${UPDATED}}%
  \fancyfoot[C]{\thepage}%
  \renewcommand{\headrulewidth}{0pt}%
}
\apptocmd{\maketitle}{\thispagestyle{firstpage}}{}{}
TEXHEADER
cat > /tmp/cv_render.md << 'HEADER'
---
title: "Vadim Marmer"
geometry: margin=0.8in
fontsize: 11pt
colorlinks: true
---

HEADER
cat /tmp/cv_body.md >> /tmp/cv_render.md
pandoc /tmp/cv_render.md -o files/vadim_marmer_CV.pdf --pdf-engine=xelatex -H /tmp/cv_header.tex
rm /tmp/cv_body.md /tmp/cv_render.md /tmp/cv_header.tex
echo "Rendered files/vadim_marmer_CV.pdf"
