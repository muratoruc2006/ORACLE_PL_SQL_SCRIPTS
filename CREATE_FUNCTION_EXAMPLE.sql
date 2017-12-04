create or replace function getOrtalamaMaas(p_department_id employees.department_id%type) 
return employees.salary%type is
  v_ort_maas employees.salary%type;
begin
  select avg(salary) into v_ort_maas from employees where department_id = p_department_id;
 -- insert into departments values(departments_seq.nextval, 'sdfsadf', 100, 1700);
  return v_ort_maas;
end;
/
set serveroutput on 
exec dbms_output.put_line(getOrtalamaMaas(90));

select employee_id, first_name, salary, getOrtalamaMaas(department_id) from employees;

select *  from employees where salary > getOrtalamaMaas(department_id);

update employees set salary=salary+500 where salary > getOrtalamaMaas(department_id);

rollback;

select employee_id, first_name from employees e
natural join (select department_id, avg(salary) ortmaas 
    from employees group by department_id) ort
where e.salary > ort.ortmaas;
