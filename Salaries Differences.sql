with deptmaxSalary as
(
select ddept.department as department, max(salary) as maxsal 
from db_employee demp
left join db_dept ddept on demp.department_id = ddept.id
where ddept.department in ('marketing','engineering')
group by ddept.department
)

select ((select maxsal from deptmaxSalary where department='marketing') - (select maxsal from deptmaxSalary where department='engineering')) as salary_difference
