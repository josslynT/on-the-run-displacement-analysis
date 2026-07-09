SELECT
  country_of_origin,
  year,
  MAX(n_deaths)                    AS n_deaths,
  SUM(refugees)                    AS refugees,
  SUM(idps)                        AS idps,
  SUM(asylum_seekers)              AS asylum_seekers,
  COALESCE(SUM(refugees), 0) + COALESCE(SUM(idps), 0) + COALESCE(SUM(asylum_seekers), 0) AS total_displaced,
  SUM(n_disaster_events)           AS n_disasters,
  SUM(disaster_deaths)             AS dis_deaths,
  SUM(disaster_total_affected)     AS dis_affected
FROM `ontherun-499508.mart.mart_pop_ref_conf_dis_deaths`
GROUP BY country_of_origin, year
