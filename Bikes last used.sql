with bikelastused as
(select 
    bike_number, 
    end_time,
    dense_rank() over(partition by bike_number order by end_time desc) rn
from dc_bikeshare_q1_2012)

select 
    bike_number,
    end_time 
from 
    bikelastused
where 
    rn=1;
