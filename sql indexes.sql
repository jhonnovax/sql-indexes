SET profiling = 1;

select sql_no_cache * from employees.employees
where first_name = 'Berni';

select sql_no_cache * from emp1.employees
where first_name = 'Sluis';


show profiles;