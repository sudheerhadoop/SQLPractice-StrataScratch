with user_purchases as
(
select user_id, 
created_at,
lag(created_at,1) over(partition by user_id order by created_at)  prev_purchase
from amazon_transactions)

select distinct user_id from user_purchases
where created_at - prev_purchase <= 7;
