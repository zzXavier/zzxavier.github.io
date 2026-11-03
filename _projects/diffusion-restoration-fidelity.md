---
title: "Detail Fidelity in Diffusion Restoration"
project_group: "Image Editing and Restoration"
project_order: 3
---

I compared diffusion restoration methods on fidelity to the input, invented details, text legibility, and inference cost.

## Experiment

Four original product photographs supplied the reference detail for blur, noise and JPEG recovery tests. Across six held-out cases, bicubic interpolation averaged 26.969 dB PSNR, the SwinIR first stage 26.896 dB and full DiffBIR 22.758 dB. The report includes package-label crops so readers can inspect the altered lettering.

[View the measured results](https://github.com/zzXavier/diffusion-restoration-fidelity/blob/main/results/formal/summary.json)

## Repository

[View on GitHub](https://github.com/zzXavier/diffusion-restoration-fidelity)
