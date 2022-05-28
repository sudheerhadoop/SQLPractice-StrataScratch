select first_name, 
       last_name, 
       city, 
       order_details 
from customers cust
    left join 
orders ord
on cust.id=ord.cust_id
order by first_name, order_details;
