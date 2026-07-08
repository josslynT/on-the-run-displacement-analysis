WITH unpivoted AS (
  SELECT
    CountryName,
    CountryCode,
    SeriesType,
    year,
    value
  FROM `ontherun-499508.raw.populationdf1`
  UNPIVOT(value FOR year IN (
    Y1990, Y1991, Y1992, Y1993, Y1994, Y1995, Y1996, Y1997, Y1998, Y1999,
    Y2000, Y2001, Y2002, Y2003, Y2004, Y2005, Y2006, Y2007, Y2008, Y2009,
    Y2010, Y2011, Y2012, Y2013, Y2014, Y2015, Y2016, Y2017, Y2018, Y2019,
    Y2020, Y2021, Y2022, Y2023, Y2024, Y2025, Y2026
  ))
), 
  pivoted AS (
SELECT *
FROM unpivoted
PIVOT(
  MAX(value) FOR SeriesType IN (
    'Population, total' AS population_total,
    'Population, female' AS population_female,
    'Population, male' AS population_male,
    'Rural population' AS rural_population,
    'Urban population' AS urban_population
    )
  )
)
SELECT
  CountryName AS country_name,
  CountryCode AS country_code,
  CAST(REPLACE(year, 'Y', '') AS INT64) AS year,
  SAFE_CAST(population_total AS INT64) AS population_total,
  SAFE_CAST(population_female AS INT64) AS population_female,
  SAFE_CAST(population_male AS INT64) AS population_male,
  SAFE_CAST(rural_population AS INT64) AS rural_population,
  SAFE_CAST(urban_population AS INT64) AS urban_population
FROM pivoted;
