---
layout: archive
title: "CV"
permalink: /cv/
author_profile: true
redirect_from:
  - /resume
---

{% include base_path %}

Education
======
* B.S. in Computer Science and Technology, Beijing Normal-Hong Kong Baptist University, 2024–2028

Research Interests
======
* Computer Vision, Generative Models, one-step image editing

Research Experience
======
* **MFilter: Pair-Conditioned Keypoint Matchability for Lightweight Sparse Matching** — ACCV 2026 (Asian Conference on Computer Vision), co-first author (Xinpeng Zhu†, Zhixiong Zhang†, Wentao Cheng; †equal contribution). A lightweight approach to keypoint matchability for sparse feature matching.
* **One-Step Image Editing** — current research direction, advised by [Wentao Cheng](https://wtchengcv.github.io/) at BNBU.

Skills
======
* Python
* Data processing and statistical analysis with pandas and NumPy
* Data visualization and analytical dashboard design
* C++ algorithms
* Machine learning
* Web development
* Java development
* MySQL

Awards
======
* Provincial Second Prize, Chinese Mathematics Competitions
* Third Prize, Guangdong Collegiate Programming Contest (GDCPC)
* Provincial Second Prize, C++ Group, The 16th Lanqiao Cup
* National Second Prize, C++ Group, The 17th Lanqiao Cup

Selected Projects
======
  <ul>{% for post in site.projects reversed %}
    {% include archive-single-cv.html %}
  {% endfor %}</ul>
