---
title: "A Replayable Image Editing Agent"
project_group: "Image Editing and Restoration"
project_order: 4
---

I built an agent that coordinates editing tools, logs each step for replay, and limits retries. I compared a fixed editing sequence with one that uses feedback to decide its next step.

## Experiment

I recorded 18 ComfyUI workflows, including invalid masks and injected rendering errors. The fixed and feedback policies recovered images after both injected rendering errors. Neither of the two normal requests passed both editing criteria under any policy. Archived runs include input hashes, tool calls and stop decisions.

[View the measured results](https://github.com/zzXavier/replayable-image-editing-agent/blob/main/results/formal/summary.json)

## Repository

[View on GitHub](https://github.com/zzXavier/replayable-image-editing-agent)
