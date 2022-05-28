select 
    first_name, 
    order_date, 
    order_details, 
    total_order_cost 
from orders ord
join customers cust 
on ord.cust_id=cust.id 
where 
    cust.first_name = 'Jill' or 
    cust.first_name = 'Eva' ;
