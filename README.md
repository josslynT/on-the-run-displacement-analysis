# On the Run — Global Forced Displacement, 1990–2025

Analysis of 35 years of forced displacement data to understand **who is
displaced, where they go, and how displacement patterns have changed over time.**

## Why we built On the Run

We built On the Run to look beyond the headlines and understand what is
actually driving people from their homes. Our analysis focuses on three
core questions:

1. **What causes displacement?** We explored the role of armed conflict and
   natural disasters in driving both internal displacement and cross-border
   refugee flows — and how these two causes produce fundamentally different
   outcomes.
2. **How have patterns changed over time?** Across 35 years of data, we
   traced how the scale and nature of displacement has shifted — including
   the growing impact of climate-related disasters on temporary internal
   displacement.
3. **Who is displaced, and where do they go?** We identified which countries
   consistently appear as origins of displacement, and whether displaced
   people tend to stay within their borders or flee abroad.

## Key findings — Part 1: Identifying the primary drivers of displacement

1. **Most displaced people never cross a border.** 68% of all forcibly
   displaced people in 2025 are internally displaced (IDPs), trapped inside
   their own countries.
2. **When people do flee, the burden falls on neighbours, not the West.**
   Iran, Pakistan, Türkiye, and Uganda alone host 35% of the world's
   refugees in 2025.
3. **Different crises, different displacement.** Natural disasters
   predominantly cause internal displacement, while armed conflict and
   violence are the primary drivers of cross-border displacement.

## Data sources

| Source | Used for | Link |
|---|---|---|
| UNHCR Refugee Data Finder | Displacement populations, 1990–2025 | [unhcr.org/refugee-statistics](https://www.unhcr.org/refugee-statistics/download) |
| World Bank — World Development Indicators | Population data, 1990–2026 | [databank.worldbank.org](https://databank.worldbank.org/source/world-development-indicators) |
| UCDP Georeferenced Event Dataset | Armed conflict events | [ucdp.uu.se](https://ucdp.uu.se/downloads/#ged_global) |
| Our World in Data | Deaths in armed conflicts | [ourworldindata.org](https://ourworldindata.org/grapher/deaths-in-armed-conflicts) |
| EM-DAT | Natural disaster events | [emdat.be](https://www.emdat.be/) |

## Method

- Cleaning & prep: Google Sheets, BigQuery SQL, Python (pandas)
- Analysis: Trend analysis and origin–destination flows across the four
  joined datasets (Jupyter / Google Colab notebooks)
- Visualisation: Looker Studio, Plotly Express, Matplotlib, Seaborn

## Part 2: In progress — Can displacement be modelled and predicted?

Exploring whether displacement patterns can be modelled and predicted based
on event type, severity, and country context:

- **Economy:** Do poorer countries produce more displaced people for the
  same level of conflict or disaster? (Join World Bank GDP per capita /
  poverty index to the existing country-year data.)
- **Regression:** What drives refugee outflows? Modelling outflows against
  conflict intensity (UCDP fatalities, lagged by one year), disasters, and
  population — to separate the drivers of cross-border vs internal
  displacement.
- **Clustering:** Grouping countries into displacement profiles (IDP-heavy
  vs refugee-heavy, conflict-driven vs disaster-driven) to see whether the
  drivers differ by profile.
- Later: time-series forecasting of displacement trends.

## Repository structure

````
on-the-run/
├── data/             # raw + cleaned data (UNHCR, World Bank, UCDP, Our World in Data, EM-DAT)
│   ├── raw/
│   ├── processed/
│   └── lookup/       # country crosswalk + conflict corrections
├── sql/              # SQL cleaning & transformation
│   ├── intermediate/ # cleaning + transformation
│   └── mart/         # joined, analysis-ready tables
├── notebooks/        # Python analysis — data manipulation, visual exploration, relationship queries
├── visuals/          # exported analysis charts
├── dashboard/        # Looker Studio dashboard — 3 page screenshots
│   ├── displacement_trend_overview.png
│   ├── countries_origin.png
│   ├── countries_deep_dive.png
│   └── data/         # z_looker_*.csv feeds the dashboard
├── docs/                    # data dictionary, build guide, hypotheses
│   ├── data_dictionary.md   # unique reference
│   ├── build_guide.md       # pipeline + reproduction
│   └── hypotheses.md        # Part 1 + Part 2 roadmap
├── report/           # final 5-page report (PDF export of the dashboard)
└── README.md
````

## Team & credits
Part 1: Built as a team project at Le Wagon Data Analytics Bootcamp (Yulia, Bifftu, Josslyn).
Part 2: Further developed by (Josslyn & Yulia).

## Full report
📄 [Static report (PDF)](report/on_the_run_report.pdf) — all 5 pages, opens instantly
🔗 [Interactive dashboard on Looker Studio](https://datastudio.google.com/s/lvhqwPRxrwM) — filter and explore


