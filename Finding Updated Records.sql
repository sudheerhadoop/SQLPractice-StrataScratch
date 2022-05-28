select 
    id,
    first_name,
    last_name,
    department_id,
    max
from
(select 
    id, 
    first_name,
    last_name,
    department_id,
    salary as max,
    rank() over(partition by id order by salary desc) rn 
from ms_employee_salary) emp
where emp.rn=1;



SELECT id,
       first_name,
       last_name,
       department_id,
       max(salary)
FROM ms_employee_salary
GROUP BY id,
         first_name,
         last_name,
         department_id
ORDER BY id ASC
