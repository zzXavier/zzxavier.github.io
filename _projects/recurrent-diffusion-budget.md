---
title: "Recurrent Image Generation under a Fixed Compute Budget"
project_group: "Image Generation and Evaluation"
project_order: 5
---

I built a small image generator that reuses weights across steps and compared architectures with matched parameter counts and compute budgets.

## Experiment

I trained five class-conditioned generators on handwritten digits. Holding the shared model at 64,390 parameters, increasing the loop count from one to four changed held-out MSE from 0.23528 to 0.23783. Separate unshared controls compared models at matched block counts.

[View the measured results](https://github.com/zzXavier/recurrent-diffusion-budget/blob/main/results/summary.csv)

## Repository

[View on GitHub](https://github.com/zzXavier/recurrent-diffusion-budget)
