SELECT business_postal_code,
       COUNT (DISTINCT CASE
                           WHEN left(business_address, 1) ~ '^[0-9]' THEN lower(split_part(business_address, ' ', 2))
                           ELSE lower(split_part(business_address, ' ', 1))
                       END)AS n_streets
FROM sf_restaurant_health_violations
WHERE business_postal_code IS NOT NULL
GROUP BY business_postal_code
ORDER BY n_streets DESC,
         business_postal_code ASC
