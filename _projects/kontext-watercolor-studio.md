---
title: "Kontext Watercolor Studio"
project_group: "Image Editing and Restoration"
project_order: 5
---

I used FLUX.1 Kontext in ComfyUI to turn photographs into watercolor paintings. Two instructions produced different treatments from the same photograph. One used transparent washes and the other added ink lines.

## Experiment

I rendered both treatments on two public-domain photographs using a quantized model on an 8 GB laptop GPU. With the same seed, the transparent wash kept the flag behind the astronaut and all four towers at the rocket launch pad. The ink-and-wash version left out the flag and kept only the two inner towers. The four images in the comparison sheet come from this run. The original FP8 practice workflow is archived separately. Its source photograph and render were not preserved.

[Compare the source photographs and four paintings](https://github.com/zzXavier/kontext-watercolor-studio/blob/main/results/comparison.jpg) · [Open the editable ComfyUI workflow](https://github.com/zzXavier/kontext-watercolor-studio/blob/main/workflows/watercolor-ui.json)

## Repository

[View on GitHub](https://github.com/zzXavier/kontext-watercolor-studio)
