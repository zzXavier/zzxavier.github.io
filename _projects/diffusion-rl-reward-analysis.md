---
title: "Reinforcement Learning for Image Generation"
project_group: "Image Generation and Evaluation"
project_order: 6
---

I implemented a reinforcement learning loop for image generation and examined how training rewards compared with independent evaluations and sample diversity.

## Experiment

The experiments compare a frozen base, best-of-four reranking and two DDPO policies. On three held-out prompts, reranking had the highest mean preference reward. The repository reports requested-color coverage and candidate diversity alongside the reward and provides the policy-update traces.

[View the measured results](https://github.com/zzXavier/diffusion-rl-reward-analysis/blob/main/results/summary.csv)

## Repository

[View on GitHub](https://github.com/zzXavier/diffusion-rl-reward-analysis)
