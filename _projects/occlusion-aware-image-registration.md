---
title: "Unsupervised Image Registration under Partial Occlusion"
project_group: "Visual Localization and Matching"
project_order: 2
---

I implemented nonrigid registration for partially occluded images, compared it with baselines, and examined deformation errors and folding.

## Experiment

Three held-out photographs supplied 18 controlled deformations with known correspondence and occlusion. Adding mask weights to VoxelMorph training reduced displacement error within occluded regions relative to the unmasked model. Farnebäck optical flow achieved the lowest overall mean landmark error.

[View the measured results](https://github.com/zzXavier/occlusion-aware-image-registration/blob/main/results/summary.csv)

## Repository

[View on GitHub](https://github.com/zzXavier/occlusion-aware-image-registration)
