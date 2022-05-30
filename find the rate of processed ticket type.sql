select 
    type, 
    sum(case when processed = TRUE then 1 else 0 end)::NUMERIC/count(*) processed_rate
from facebook_complaints
group by type;
