---
title: "PokeBattle Insight"
collection: projects
date: 2026-05-27
url: "https://github.com/zzXavier/PokeBattle"
description: "A Pokemon analytics platform featuring data cleaning, statistical analysis, visualization, and machine-learning-based battle evaluation."
---

PokeBattle Insight is a full-stack Pokemon analytics and battle evaluation platform. I built a data workflow that transforms raw Pokemon records into structured, queryable features and presents the results through an interactive analytics dashboard.

## Data Processing and Analysis

- Cleaned and normalized Pokemon attributes with pandas and NumPy, including missing values, numeric fields, types, generations, and battle statistics.
- Performed grouped aggregation, ranking, distribution analysis, correlation analysis, and multidimensional stat comparison.
- Designed dashboard views for type strength, generation distribution, strongest Pokemon rankings, scatterplots, and six-stat correlation heatmaps.
- Built reusable FastAPI endpoints for filtering, querying, evaluating, and presenting analytical results.

## Modeling

- Trained a Random Forest classifier to estimate legendary potential from battle-stat profiles.
- Applied K-Means clustering to identify battle-role patterns.
- Implemented normalized Euclidean-distance matching to find Pokemon with similar stat structures.

## Tech Stack

- Python, pandas, NumPy, scikit-learn
- FastAPI, SQLite
- React, Vite
- Statistical analysis and data visualization

## Repository

[View on GitHub](https://github.com/zzXavier/PokeBattle)
