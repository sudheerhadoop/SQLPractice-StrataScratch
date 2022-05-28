with employeecte as (
select 
    employee.department, 
    employee.first_name, 
    employee.salary,
    rank() over(partition by department order by salary desc) rn 
from employee)


select department, first_name as employee_name, salary from 
employeecte  
where rn = 1;
