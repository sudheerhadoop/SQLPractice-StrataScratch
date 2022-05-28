select state, count(name) as n_businesses from yelp_business
where stars = 5
group by state
order by n_businesses desc, state
limit 6;



Alternate approach to handle ties:

WITH cte AS
  (SELECT state,
          count(business_id) AS n_businesses
   FROM yelp_business
   WHERE stars = 5
   GROUP BY state)
SELECT state,
       n_businesses
FROM
  (SELECT *,
          rank() OVER (
                       ORDER BY n_businesses DESC) AS rnk
   FROM cte) a
WHERE rnk <= 5
ORDER BY n_businesses DESC,
         state ASC
