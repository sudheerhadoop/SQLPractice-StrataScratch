with daily_order_cost as
(select cust_id, 
       order_date, 
       sum(total_order_cost) as total_cost 
from orders
where order_date >= '2019-02-01' and 
      order_date <= '2019-05-01'
group by cust_id, order_date)

select cust.first_name, 
       total_cost as total_order_cost,
       order_date
from 
(select cust_id,
       total_cost,
       order_date,
       rank() over(order by total_cost desc) rn
from daily_order_cost) dailycost
join customers cust on dailycost.cust_id = cust.id
where dailycost.rn=1;
