# On the Run — Global Forced Displacement, 1990–2025

Analysis of 35 years of forced displacement data to understand **who is
displaced, where they go, and how displacement patterns have changed over time.**

Why built On the run

### answer ---


## Key findings
Part 1:
1. **Most displaced people never cross a border.** 68% of all forcibly
   displaced people in 2025 are internally displaced (IDPs), trapped inside
   their own countries.
2. **When people do flee, the burden falls on neighbours, not the West.**
   Iran, Pakistan, Türkiye, and Uganda alone host 35% of the world's
   refugees in 2025.
3. **Different crises, different displacement.** Natural disasters
   predominantly cause internal displacement, while armed conflict and
   violence are the primary drivers of cross-border displacement.

![Best chart](visuals/chart1.png)

## Data sources

| Source | Used for | Link |
|---|---|---|
| UNHCR Refugee Data Finder | Displacement populations, 1990–2025 | [unhcr.org/refugee-statistics](https://www.unhcr.org/refugee-statistics/download) |
| World Bank — World Development Indicators | Population data, 1990–2026 | [databank.worldbank.org](https://databank.worldbank.org/source/world-development-indicators) |
| UCDP Georeferenced Event Dataset | Armed conflict events | [ucdp.uu.se](https://ucdp.uu.se/downloads/#ged_global) |
| EM-DAT | Natural disaster events | [emdat.be](https://www.emdat.be/) |

## Method

- Cleaning & prep: Google sheets, BigQuery SQL, Python (pandas)
- Analysis: trend analysis and origin–destination flows across the four
  joined datasets
- Visualisation: Data Studio, Matplotlib, Seaborn

## What us as the team has discovered first part ( Yulia, Bifftu, Joss) & second part (Yulia, Joss)
Part 1: Accomplished 


## What do next (Josslyn & Yulia)
Part 2: On-going 
- **Regression:** What drives refugee outflows? Modelling outflows against
  conflict intensity (UCDP fatalities, lagged by one year), disasters, and
  population — to separate the drivers of cross-border vs internal displacement.
- **Clustering:** Grouping countries into displacement profiles (IDP-heavy vs
  refugee-heavy, conflict-driven vs disaster-driven) to see whether the
  drivers differ by profile.
- Later: time-series forecasting of displacement trends.
  

## Team/ Credits 

Originally built as a team project at Le Wagon Data Analytics Bootcamp;
now being developed further. Details and further in-depth exploration coming as the
next phase ships.

## Repository Structure 
-------

## Full report
[report/on-the-run-report.pdf](report/on-the-run-report.pdf)
