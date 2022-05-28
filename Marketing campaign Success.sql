select count(distinct mc1.user_id) as count
from
marketing_campaign mc1 
join 
(select 
    user_id, 
    product_id, 
    min(created_at) as created_at from 
marketing_campaign 
group by user_id, product_id) mc2
on mc1.user_id = mc2.user_id
and mc1.product_id != mc2.product_id
and mc2.created_at > mc1.created_at;


