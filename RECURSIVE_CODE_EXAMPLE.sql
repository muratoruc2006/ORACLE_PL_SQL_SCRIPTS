with emp(sicil, adi, mudur_sicil, maas, seviye) as 
(select employee_id, first_name, manager_id, salary, 1 from employees where manager_id is null
 union all
 select employee_id, first_name, manager_id, salary, seviye + 1 from employees e
 join emp on (emp.sicil = e.manager_id)
)
select seviye, count(*), avg(maas) from emp group by seviye order by 1;