# Data Dictionary — On the Run

A brief overview of the key fields used in the analysis. Mart tables are at the **country-year** grain (one row per country per year).

## Displacement (UNHCR)

| Column | Description |
|---|---|
| year | Calendar year (1990–2025) |
| country_of_origin | Country people are displaced *from* |
| country_of_asylum | Country people are displaced *to* (destination/host) |
| refugees | Number of refugees |
| idps | Internally displaced persons |
| asylum_seekers | Pending asylum applicants |

## Population (World Bank)

| Column | Description |
|---|---|
| population_total | Total national population for that year |

## Conflict (UCDP / Our World in Data)

| Column | Description |
|---|---|
| n_conflicts | Number of armed conflicts in the country that year |
| n_deaths | Deaths in armed conflicts that year |

## Disasters (EM-DAT)

| Column | Description |
|---|---|
| n_disaster_events | Number of disaster events that year |
| disaster_total_affected | People affected by disasters that year |
| disaster_deaths | Deaths from disasters that year |

## Reference / lookup tables

| Table | Description |
|---|---|
| country_crosswalk | Maps source-specific country spellings to one canonical name so all sources join on a common key |
| conflict_country_corrections | Manually verified "true" country for multi-country / ambiguous conflicts |

*Note: this is a summary of the main fields. The mart tables contain additional supporting columns (e.g. disaster counts by type) used in the dashboard.*
