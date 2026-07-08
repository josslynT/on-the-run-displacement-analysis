-- Updated version named : int_refugees_v2 in sql - to refer 
SELECT
  country_of_origin, country_of_origin_iso,
  country_of_asylum, country_of_asylum_iso,
  year,
  CONCAT(country_of_origin, '_', year) AS join_key_origin,
  CONCAT(country_of_asylum, '_', year) AS join_key_asylum,
  refugees,
  asylum_seekers, idps, stateless_persons
FROM (
  SELECT
    u.year, COALESCE(cw_origin.canonical, u.country_of_origin) AS country_of_origin,
    COALESCE(cw_asylum.canonical, u.country_of_asylum) AS country_of_asylum,
    country_of_origin_iso, country_of_asylum_iso,
    u.refugees,
    u.asylum_seekers, u.idps, u.stateless_persons
  FROM `ontherun-499508.int.int_refugees_total_clean` AS u
  LEFT JOIN `ontherun-499508.int.country_crosswalk` AS cw_origin
    ON u.country_of_origin = cw_origin.unhcr
  LEFT JOIN `ontherun-499508.int.country_crosswalk` AS cw_asylum
    ON u.country_of_asylum = cw_asylum.unhcr
)
