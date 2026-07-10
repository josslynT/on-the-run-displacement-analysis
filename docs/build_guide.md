# Build Guide — On the Run
How the project was built and how to reproduce it.
## Pipeline overview
raw sources → BigQuery raw tables → intermediate (int_) views → mart tables → analysis + dashboard
## 1. Raw data
Source files (UNHCR, World Bank, UCDP, Our World in Data, EM-DAT) are stored in data/raw/ and loaded into BigQuery as raw tables. Raw data is never edited by hand.
## 2. Reference / lookup tables (data/lookup/)
- country_crosswalk — reconciles differing country spellings across all five sources to one canonical name, so they -can be joined on a common key.
- conflict_country_corrections — assigns the correct country for multi-country or ambiguous conflicts.
## 3. Intermediate layer (sql/intermediate/)
Each source is cleaned and standardised in an int_ view — casting types, standardising country names (via the crosswalk), and shaping to the country-year grain. Example: int_populationdf1 casts World Bank population fields and normalises the year format.
## 4. Mart layer (sql/mart/)
Cleaned sources are joined into analysis-ready mart tables at the country-year grain (e.g. mart_disaster_analysis, mart_dis_agg_pop, mart_country_year_metrics). Cleaned outputs are exported to data/processed/.
## 5. Analysis (notebooks/)
Python notebooks read the mart tables from BigQuery for exploration and charting. The exploration notebook is scratch working; validated logic lives in the SQL layer.
## 6. Presentation
- visuals/ — exported analysis charts.
- dashboard/ — Looker Studio dashboard screenshots + supporting data; live link in README.
- report/ — the dashboard exported as a PDF.
# Reproducing the analysis
1. Load the raw source files (see data/raw/) into BigQuery.
2. Create the lookup tables, then run the sql/intermediate/ views.
3. Run the sql/mart/ queries to build the mart tables.
4. Run the notebooks in notebooks/ (they read from the mart tables).
5. Build the dashboard in Looker Studio on top of the mart tables.
