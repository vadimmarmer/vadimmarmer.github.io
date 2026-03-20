#!/bin/bash
# Render CV PDF locally (same pipeline as GitHub Actions)
set -e
sed '1{/^---$/!q;};1,/^---$/d' _pages/cv.md > /tmp/cv_body.md
sed -i '' '/^\[Download PDF\]/d' /tmp/cv_body.md
UPDATED=$(grep -m1 '^Updated:' /tmp/cv_body.md || true)
sed -i '' '/^Updated:/d' /tmp/cv_body.md
sed -i '' 's/<br>$/\\/g' /tmp/cv_body.md
cat > /tmp/cv_render.md << HEADER
---
title: "Vadim Marmer"
subtitle: "Curriculum Vitae"
date: "${UPDATED}"
geometry: margin=0.8in
fontsize: 11pt
colorlinks: true
---

HEADER
cat /tmp/cv_body.md >> /tmp/cv_render.md
pandoc /tmp/cv_render.md -o files/vadim_marmer_CV.pdf --pdf-engine=xelatex
rm /tmp/cv_body.md /tmp/cv_render.md
echo "Rendered files/vadim_marmer_CV.pdf"
