-- for Yulia to add comment on what this int queries does:
SELECT
  u.country_of_origin,
  u.country_of_asylum,
  u.country_of_origin_iso,
  u.country_of_asylum_iso,
  u.year,
  u.join_key_origin,
  u.join_key_asylum,
  u.refugees,
  u.asylum_seekers, u.idps, u.stateless_persons,
  -- conflict vars (NULL if no match)
  ac.in_conflict, ac.n_conflicts,
  ac.intensity_max,
  ac.multi_country
FROM `ontherun-499508.int.int_refugees_v2` u
LEFT JOIN `ontherun-499508.int.int_armed_conflict_v2` ac
  ON u.join_key_origin = ac.join_key
ORDER BY u.country_of_origin, u.year
