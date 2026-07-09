SELECT
    country_iso,
    start_year AS year,
    COUNT(*) AS disaster_events,
    SUM(total_deaths) AS disaster_deaths,
    SUM(total_affected) AS disaster_affected
FROM `ontherun-499508.int.int_natural_disasters_2_clean`
GROUP BY country_iso, start_year
