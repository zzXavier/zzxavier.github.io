---
title: "Planar Localization with Reliability Checks"
project_group: "Visual Localization and Matching"
project_order: 1
---

I built a system that can reject a planar localization estimate. I used inlier quality, spatial coverage, and reprojection error to diagnose failures.

## Experiment

I evaluated XFeat and ORB on 77 held-out HPatches sequences. Of 385 pairs, the combined XFeat rule accepted 384, with a median corner error of 1.07 pixels among accepted estimates. Twenty-nine accepted estimates exceeded five pixels, including a failure above 700 pixels.

[View the measured results](https://github.com/zzXavier/reliability-aware-planar-localization/blob/main/results/summary.csv)

## Repository

[View on GitHub](https://github.com/zzXavier/reliability-aware-planar-localization)
