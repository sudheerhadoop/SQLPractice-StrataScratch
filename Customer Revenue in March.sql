select cust_id, 
       sum(total_order_cost) as revenue 
from orders 
where extract(year from order_date::DATE)=2019 and 
      extract(month from order_date::DATE) = 03
group by cust_id
order by revenue desc;
