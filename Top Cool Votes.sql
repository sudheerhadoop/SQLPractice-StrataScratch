select 
    business_name, 
    review_text 
from 
(select business_name, 
       review_text, 
       dense_rank() over(order by cool desc) rn  
from yelp_reviews) cool_votes
where cool_votes.rn=1;



SELECT business_name,
       review_text
FROM yelp_reviews
WHERE cool =
    (SELECT max(cool)
     FROM yelp_reviews);
