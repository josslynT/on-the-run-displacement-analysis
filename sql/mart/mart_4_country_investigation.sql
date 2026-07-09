SELECT
    year,
    country_of_origin,
    country_of_origin_iso,
    ANY_VALUE(population_total_filled) AS population_total,
    MAX(idps) AS idps,
    SUM(refugees) AS refugees,
    ANY_VALUE(in_conflict) AS in_conflict,
    ANY_VALUE(n_conflicts) AS n_conflicts,
    ANY_VALUE(disaster_total_affected) AS disaster_total_affected,
    ANY_VALUE(n_disaster_events) AS n_disaster_events,
    ANY_VALUE(n_drought) AS n_drought,
    ANY_VALUE(n_flood) AS n_flood,
    ANY_VALUE(n_storm) AS n_storm,
    ANY_VALUE(n_earthquake) AS n_earthquake,
    SAFE_DIVIDE(ANY_VALUE(disaster_total_affected), ANY_VALUE(population_total_filled)) AS disaster_impact_ratio,
    SAFE_DIVIDE(MAX(idps), ANY_VALUE(population_total_filled)) AS idps_ratio,
    SAFE_DIVIDE(SUM(refugees), ANY_VALUE(population_total_filled)) AS refugees_ratio
  FROM `ontherun-499508.mart.mart_pop_ref_conf_dis`
  WHERE country_of_origin_iso IN ('PAK', 'SYR', 'SDN', 'SSD')
  GROUP BY year, country_of_origin, country_of_origin_iso
