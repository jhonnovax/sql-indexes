SET profiling = 1;

explain select * from employees.employees
where first_name = 'Berni';

select * from employees.employees
where first_name = 'Berni';

select sql_no_cache * from employees.employees
where first_name = 'Berni';

# Query performances
select * from employees.employees
where first_name = 'Sluis';

select * from emp1.employees
where first_name = 'Sluis';


show profiles;