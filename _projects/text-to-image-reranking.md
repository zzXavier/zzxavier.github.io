---
title: "Multi-Attribute Scoring and Reranking for Text-to-Image Generation"
project_group: "Image Generation and Evaluation"
project_order: 1
---

I ranked candidate images three ways using whole-prompt scores, scores for individual prompt requirements, and preference comparisons.

## Experiment

On 12 held-out human choices, whole-prompt scoring agreed with 10 decisions, while attribute averaging and the trained ranking head each agreed with eight. The preferred image appeared first in 11 pairs, so the evaluation also checks what happens when each pair is shown in the opposite order.

[View the measured results](https://github.com/zzXavier/text-to-image-reranking/blob/main/results/summary.csv)

## Repository

[View on GitHub](https://github.com/zzXavier/text-to-image-reranking)
