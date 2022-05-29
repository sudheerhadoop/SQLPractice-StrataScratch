select 
    name, 
    review_count 
from yelp_business
order by review_count desc
limit 5;


/***********************/

SELECT name,
       review_count
FROM yelp_business
WHERE business_id in
    (SELECT business_id
     FROM
       (SELECT business_id,
               rank() OVER (
                            ORDER BY review_count DESC)
        FROM yelp_business) sq
     WHERE rank <=5)
ORDER BY review_count DESC
