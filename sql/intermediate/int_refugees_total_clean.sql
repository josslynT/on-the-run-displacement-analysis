SELECT
  Year AS year,
  country_of_asylum,
  country_of_origin,
  country_of_asylum_iso,
  country_of_origin_iso,
  Refugees AS refugees,
  asylum_seekers,
  IDPs AS idps,
  other_people_in_need_of_international_protection,
  stateless_persons,
  host_community,
  others_of_concern
FROM `ontherun-499508.raw.refugees_total`
