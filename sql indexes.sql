SET profiling = 1;

explain select * from employees.employees
where first_name = 'Berni';


explain select sql_no_cache * from emp1.employees
where first_name = 'Berni';

select sql_no_cache * from employees.employees
where first_name = 'Berni';

# Query performances
select * from employees.employees
where first_name = 'Sluis';

explain select * from emp1.employees
where first_name = 'Sluis';


show profiles;



select * 
from employees.dept_emp;

select *
from employees.departments;

explain select * 
from employees.employees e
left join employees.dept_emp de on e.emp_no = de.emp_no
left join employees.departments d on de.dept_no = d.dept_name
and d.dept_name = 'Customer Service';

explain select * 
from employees.departments d
left join employees.dept_emp de on de.dept_no = d.dept_no 
left join employees.employees e on e.emp_no = de.emp_no
where d.dept_name = 'Customer Service'

