-- İstenen bölüm çalışanlarını döndüren paket içinde procedure yazın.
create or replace package bolum_pkg is
 type t_calisanlar is table of employees%rowtype index by pls_integer;
 function calisanlar(p_bolumno employees.department_id%type) return t_calisanlar;
end;
/
create or replace package body bolum_pkg is
 function calisanlar(p_bolumno employees.department_id%type) return t_calisanlar is
  v_sonuc t_calisanlar;
  i pls_integer := 1;
 begin
   for cal in (select * from employees where department_id = p_bolumno) loop
     v_sonuc(i) := cal;
     i := i + 1;
   end loop;
   return v_sonuc;
 end;
end;
/
set serveroutput on
declare
  v_sonuclar bolum_pkg.t_calisanlar;
  v_key pls_integer;
begin
  v_sonuclar := bolum_pkg.calisanlar(90);
  v_key := v_sonuclar.first;
  while v_key is not null loop
     dbms_output.put_line(v_sonuclar(v_key).first_name);
     v_key := v_sonuclar.next(v_key);
  end loop;
end;
/