---
title: "Training Data Quality and Mixtures"
project_group: "Image Generation and Evaluation"
project_order: 4
---

I studied how removing duplicates, filtering poorly matched image-text pairs, and changing the data mix affected image generation under matched training budgets.

## Experiment

I compared six data selections with the same number of examples and training updates on a controlled handwritten-digit task. Joint filtering reduced incorrect captions from 38 to five per 120 selected examples, but the downstream generator did not improve digit recognition relative to random sampling.

[View the measured results](https://github.com/zzXavier/generative-data-mixtures/blob/main/results/summary.csv)

## Repository

[View on GitHub](https://github.com/zzXavier/generative-data-mixtures)
