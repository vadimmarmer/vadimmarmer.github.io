---
description: Proofread an Econ 326 (Econometrics II) QMD lecture file (spelling, grammar, course title, notation, math, conditioning, layout, slide titles, reveal order, compilation)
argument-hint: <filename.qmd>
---

Proofread the Econ 326 lecture file `$ARGUMENTS`.

Delegate the entire proofreading job to a single **proofread-326** subagent via the Task tool:

```
subagent_type: "proofread-326"
prompt: "Proofread the file /Users/vmarmer/GitHub/vadimmarmer.github.io/files/Econ_326/$ARGUMENTS following every pass in your protocol (passes 1–9). Make all corrections directly in the file. After all edits, render with quarto and verify compilation. Return the full proofreading report."
```

Wait for the subagent to finish, then present its report to the user.
