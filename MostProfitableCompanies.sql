with profit as 
(select 
    company, 
    profits,
    dense_rank() over(order by profits desc) as rn
from forbes_global_2010_2014)

select 
    company, 
    profits 
from profit
where rn <=3;
