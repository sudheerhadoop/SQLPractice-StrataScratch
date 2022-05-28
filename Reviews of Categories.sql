select 
    unnest(string_to_array(categories, ';')) as business_category, 
    sum(review_count) as reviewsum 
from yelp_business
group by 1
order by reviewsum desc;

/** string to array will convert as array using delimiter and unnest will explode as individual rows **/


WITH cats AS
  (SELECT unnest(string_to_array(categories, ';')) AS category,
          review_count
   FROM yelp_business)
SELECT category,
       sum(review_count) as review_cnt
FROM cats
GROUP BY category
ORDER BY review_cnt DESC
