---
title: "Preference Alignment and Reward Hacking in Diffusion Models"
project_group: "Image Generation and Evaluation"
project_order: 2
---

I compared supervised fine-tuning with direct preference optimization (DPO) and examined cases where reward scores disagreed with an independent evaluation.

## Experiment

I trained SFT and DPO adapters for 64 updates on the same 24 prompts. On 12 held-out image pairs, the base model and SFT agreed with the human preference nine times each, and DPO agreed seven times. The repository includes the pairwise scores and the examples where the methods disagreed.

[View the measured results](https://github.com/zzXavier/diffusion-preference-alignment/blob/main/results/summary.csv)

## Repository

[View on GitHub](https://github.com/zzXavier/diffusion-preference-alignment)
