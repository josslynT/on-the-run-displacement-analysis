SELECT
    year,
    country_of_origin,
    country_of_origin_iso,
    ANY_VALUE(population_total_filled) AS population_total,
    SUM(refugees) AS refugees, ---refugees are counted per asylum destination, so summing collapses them to total refugees from that origin in that year
    MAX(idps) AS idps,---IDPs are tracked per origin country, so the value is the same in every asylum row. ANY_VALUE just picks one, which is correct here #use  ANY_VALUE was wrong need MAX - ANY_VALUE gives - wrong total(idps-refugee)
    ANY_VALUE(disaster_total_affected) AS disaster_total_affected,
    ANY_VALUE(n_disaster_events) AS n_disaster_events,
    ANY_VALUE(n_drought) AS n_drought,
    ANY_VALUE(n_flood) AS n_flood,
    ANY_VALUE(n_storm) AS n_storm,
    ANY_VALUE(n_earthquake) AS n_earthquake,
    ANY_VALUE(n_wildfire) AS n_wildfire,
    ANY_VALUE(n_mass_movement) AS n_mass_movement,
    ANY_VALUE(n_extreme_temp) AS n_extreme_temp,
    ANY_VALUE(n_biological) AS n_biological
  FROM `ontherun-499508.mart.mart_pop_ref_conf_dis`
  WHERE country_of_origin_iso NOT IN ('XXA', 'UNK') ---here we remove any row where country code is 'XXA','UNK'
  GROUP BY year, country_of_origin, country_of_origin_iso;
