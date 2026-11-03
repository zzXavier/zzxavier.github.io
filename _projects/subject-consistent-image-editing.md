---
title: "Subject Consistency in Personalized Generation and Local Editing"
project_group: "Image Editing and Restoration"
project_order: 2
---

I used reference images to guide generation and local edits. I evaluated whether the subject stayed recognizable, whether the requested edit appeared, and what changed outside the edited region.

## Experiment

I compared text-only editing with global and masked IP-Adapter conditioning on the same products and seeds. On four held-out requests, global reference conditioning improved mean reference similarity from 0.562 to 0.589, while the share of the background matching the requested color fell from 22.7% to 12.4%.

[View the measured results](https://github.com/zzXavier/subject-consistent-image-editing/blob/main/results/formal/summary.json)

## Repository

[View on GitHub](https://github.com/zzXavier/subject-consistent-image-editing)
