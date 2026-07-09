WITH joined AS (
  SELECT
    r.year,
    r.country_of_origin,
    r.country_of_asylum,
    r.country_of_asylum_iso,
    r.country_of_origin_iso,
    r.asylum_seekers,
    r.idps,
    r.stateless_persons,
    r.refugees,
    r.in_conflict,
    r.n_conflicts,
    r.intensity_max,
    r.multi_country,
    p.population_total,
    p.population_female,
    p.population_male,
    p.rural_population,
    p.urban_population
  FROM `ontherun-499508.int.merged_refugees_conflict` r
  LEFT JOIN `ontherun-499508.int.int_populationdf1` p
    ON r.country_of_origin_iso = p.country_code
    AND r.year = p.year
),

filled AS ( --filled CTE here we clean up /replace null value for : country that is in_conflict except - ('XXA', 'UNK') stays null 
  SELECT
    *,
    CASE
      WHEN population_total IS NULL AND country_of_origin_iso = 'ESH' THEN 600000
      WHEN population_total IS NULL AND country_of_origin_iso = 'TIB' THEN 7000000
      WHEN population_total IS NULL AND country_of_origin_iso = 'GUF' THEN 292354
      WHEN population_total IS NULL AND country_of_origin_iso = 'VAT' THEN 506
      WHEN population_total IS NULL AND country_of_origin_iso = 'AIA' THEN 15753
      WHEN population_total IS NULL AND country_of_origin_iso = 'GLP' THEN 395726
      WHEN population_total IS NULL AND country_of_origin_iso = 'MTQ' THEN 340439
      WHEN population_total IS NULL AND country_of_origin_iso = 'COK' THEN 14987
      WHEN population_total IS NULL AND country_of_origin_iso = 'NIU' THEN 1689
      ELSE population_total
    END AS population_total_filled,
    CASE
      WHEN country_of_origin_iso IN ('XXA', 'UNK') THEN NULL
      ELSE COALESCE(in_conflict, 0)
    END AS in_conflict_filled
  FROM joined
)

SELECT
  f.*, -- we are taking everything from the filled CTE (which already includes refugees, conflict, population, and the two filled columns)
-- then we adds disaster columns from the disaster table
  CASE
    WHEN f.country_of_origin_iso IN ('XXA', 'UNK') THEN NULL
    ELSE COALESCE(d.disaster_present, 0)
  END AS disaster_present,-- here we are doong the same pattern as before, same ("XXA/UNK") for unknown  and stateless countries, leave it as NULL. For everyone else, if disaster_present was NULL (meaning no disaster row joined), change it to 0.
  COALESCE(d.n_events, 0) AS n_disaster_events, --The disaster type counts (n_earthquake, n_flood, n_storm, and so on) follow the same pattern. Each one defaults to 0 if missing.
  d.total_deaths AS disaster_deaths,
  d.total_affected AS disaster_total_affected,
  d.n_disaster_types,
  COALESCE(d.n_earthquake, 0) AS n_earthquake,
  COALESCE(d.n_flood, 0) AS n_flood,
  COALESCE(d.n_storm, 0) AS n_storm,
  COALESCE(d.n_biological, 0) AS n_biological,
  COALESCE(d.n_extremet, 0) AS n_extreme_temp,
  COALESCE(d.n_massmovement, 0) AS n_mass_movement,
  COALESCE(d.n_drought, 0) AS n_drought,
  COALESCE(d.n_wildfire, 0) AS n_wildfire
FROM filled f --the final join 
LEFT JOIN `ontherun-499508.int.int_disasters_countryyear` d
  ON f.country_of_origin_iso = d.country_iso
  AND f.year = d.year
