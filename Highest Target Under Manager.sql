with hightarget as
(select 
    first_name,
    target,
    rank() over(order by target desc) rn
from salesforce_employees 
where manager_id=13)

select first_name
       ,target 
       from 
hightarget 
where rn = 1;
