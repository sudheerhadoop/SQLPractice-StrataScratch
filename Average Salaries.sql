select 
    department, 
    first_name, 
    salary,
    avg(salary) over(partition by department)  avg
from employee;
