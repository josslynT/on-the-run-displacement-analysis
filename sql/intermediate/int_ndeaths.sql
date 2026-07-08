SELECT `Entity` as country,
`Code` as iso_code, `Year` as year, `Deaths in armed conflicts based on where they occurred` as n_deaths
 FROM `ontherun-499508.raw.ndeaths` 
 WHERE `Entity` NOT IN (
  -- regional/world aggregates
  'World', 'Europe', 'Middle East', 'Africa', 'Americas', 'Asia and Oceania'
  -- disputed territories / non-UN-recognized
  --'Abkhazia', 'Abyei', 'South Ossetia', 'Kosovo',
  -- historical/defunct states
  --'Czechoslovakia', 'East Germany', 'West Germany', 'Yugoslavia',
 -- "Yemen People's Republic"
)
