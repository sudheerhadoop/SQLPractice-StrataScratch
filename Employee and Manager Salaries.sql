select e1.first_name as employee_name, 
       e1.salary as employee_salary 
from 
    employee e1 
left join 
    employee e2 
on e1.manager_id = e2.id
where e1.salary > e2.salary;
