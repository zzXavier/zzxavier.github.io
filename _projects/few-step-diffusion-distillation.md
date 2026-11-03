---
title: "Few-Step Distillation and Inference Cost"
project_group: "Image Generation and Evaluation"
project_order: 3
---

I compared few-step distillation and inference settings, measuring image quality, end-to-end latency, and peak memory use.

## Experiment

I evaluated three step counts with a Stable Diffusion teacher, a public consistency adapter and a locally trained adapter. In the 256-pixel benchmark, four-step sampling with the local adapter took a median 0.655 seconds on a laptop RTX 4060, compared with 2.774 seconds for the 20-step teacher. The repository also shows a bicycle prompt the local adapter failed to render.

[View the measured results](https://github.com/zzXavier/few-step-diffusion-distillation/blob/main/results/summary.csv)

## Repository

[View on GitHub](https://github.com/zzXavier/few-step-diffusion-distillation)
