---
title: "Confidence and Occlusion in Stereo Matching"
project_group: "Visual Localization and Matching"
project_order: 3
---

I evaluated stereo disparity estimates and their confidence in regions with little texture, repeated patterns, or occlusion.

## Experiment

I compared SGBM and RAFT-Stereo on three held-out Middlebury scenes. On Adirondack, a one-pixel left-right consistency cutoff reduced RAFT error from 0.426 to 0.260 pixels while retaining 87.8% of valid ground-truth pixels. The report tracks both error and coverage at each threshold.

[View the measured results](https://github.com/zzXavier/stereo-confidence-evaluation/blob/main/results/metrics.csv)

## Repository

[View on GitHub](https://github.com/zzXavier/stereo-confidence-evaluation)
