

--02.11.2015
--EXAMPLE CODES
set verify off;
set serveroutput on;
DECLARE
  v_empId number := &empno;
  v_firstname varchar2(30);
  v_lastname varchar2(30);
begin
  SELECT first_name,last_name into v_firstname,v_lastname FROM Employees where employee_id=v_empId;
  --SELECT last_name into v_lastname FROM Employees where employee_id=v_empId;
  DBMS_OUTPUT.PUT_LINE(v_firstname);
  DBMS_OUTPUT.PUT_LINE(v_lastname);
end;
/
set serveroutput on;
DECLARE
  v_count number(10):=&empno;
begin
  SELECT count(*) into v_count FROM Employees;
  DBMS_OUTPUT.PUT_LINE('kayit sayisi : '||v_count);
end;
/

set serveroutput on;
set verify off;
DECLARE V_SOYAD VARCHAR2(250);

BEGIN

  SELECT LAST_NAME INTO V_SOYAD FROM EMPLOYEES WHERE FIRST_NAME='&ADI';
  DBMS_OUTPUT.PUT_LINE('SOYAD : '||V_SOYAD);
  
  EXCEPTION
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('BU İSİMDE BİRDEN FAZLA KAYIT VAR!');
END;
/

select * from employees;

DECLARE v_hire VARCHAR2(10) DEFAULT 'ATLANTA';




--03.11.2015
--Örnek Kodlar
--0..20 çift sayılar

SET serveroutput on
BEGIN
for i IN 0..20 LOOP 
  IF  MOD(i,2)=0 then  
      dbms_output.put_line(i);
  END IF;
END LOOP;
END;
/

SET serveroutput on
BEGIN
for i IN 0..10 LOOP 
  dbms_output.put_line(i*2);
END LOOP;
END;
/

SET serveroutput on
BEGIN
for i IN REVERSE 0..20 LOOP 
  IF  MOD(i,2)=1 then  
      dbms_output.put_line(i);
  END IF;
END LOOP;
END;
/

SET serveroutput on
BEGIN
for i IN REVERSE 0..10 LOOP 
  dbms_output.put_line(i*2-1);
END LOOP;
END;
/

SET serveroutput on
declare v_onceki NUMBER(4):=1;
 v_sayi NUMBER(4) := 1;
BEGIN

dbms_output.put_line(1);
dbms_output.put_line(1);

LOOP

 
    v_sayi := v_sayi + v_onceki;
    v_onceki := v_sayi - v_onceki;
EXIT WHEN V_SAYI > 1000;

    dbms_output.put_line(v_sayi);
   
END LOOP;
END;
/

SET serveroutput on
declare v_yildiz varchar2(50) :='*';
v_yildiz_tek varchar2(50) :='*';

BEGIN
dbms_output.put_line(v_yildiz);

for i in 0..3 loop
    v_yildiz:=v_yildiz||v_yildiz_tek;
    dbms_output.put_line(v_yildiz);
END LOOP;

END;
/


set serveroutput on;
set verify off;
CREATE OR REPLACE FUNCTION check_asal (p_sayi pls_integer)
RETURN BOOLEAN IS
asal_mi  boolean := true;
BEGIN
  
  for i IN 2..(p_sayi-1) LOOP
    
    if (mod(p_sayi,i)=0) then
      RETURN false;
    END IF;
    
  END LOOP;
  return true;  
end;
/

set serveroutput on;
set verify off;
BEGIN
for i in 2..100 loop
 if check_asal(i) then
   dbms_output.put_line(i);
  end if;
end loop;
END;
/

--04.11.2015
--SAMPLE CODES

set serveroutput on;

create or replace procedure test(p_sayi in out pls_integer) is
begin
  
  p_sayi := 3;
  dbms_output.put_line(p_sayi);
  p_sayi := p_sayi / 0;
  dbms_output.put_line(p_sayi);
  
end;
/

declare
  p_sayi pls_integer :=8;
begin
  test(p_sayi);
exception
  when others then
    dbms_output.put_line(p_sayi);
end;
/

/*
PROCEDURE TEST compiled
anonymous block completed
3
8
*/




