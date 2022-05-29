select games, count(distinct id) athletcount from olympics_athletes_events
group by games
order by athletcount desc
limit 1;

/** -----------

WITH subquery AS
  (SELECT games,
          count(DISTINCT id) AS athletes_count
   FROM olympics_athletes_events
   GROUP BY games
   ORDER BY athletes_count DESC)
SELECT *
FROM subquery
WHERE athletes_count =
    (SELECT max(athletes_count)
     FROM subquery)
