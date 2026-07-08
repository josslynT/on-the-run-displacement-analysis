-- sourced in SQl refer to: int_armed_conflict_v2
SELECT
  country,
  year, 
  CONCAT(country, '_', year) AS join_key,
  in_conflict, n_conflicts,
  intensity_max,
  multi_country
FROM (
  SELECT
    COALESCE(cw.canonical, v.country) AS country,
    v.year, 
    COUNT(DISTINCT v.conflict_id)           AS n_conflicts,
    1                                 AS in_conflict,
    MAX(v.intensity_level)            AS intensity_max,
    MAX(v.multi_country)              AS multi_country
  FROM `ontherun-499508.int.int_armed_conflict` v
  LEFT JOIN `ontherun-499508.int.country_crosswalk` cw
    ON v.country = cw.armed_conflict
  GROUP BY COALESCE(cw.canonical, v.country), v.year
)
ORDER BY country, year
