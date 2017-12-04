--TOTAL 2005 2006 2007 2008
--------------------------
--107      29   24   19   11


select count(*) "Toplam", 
sum(decode(extract(year from hire_date),2005, 1, 0)) "2005",
sum(decode(extract(year from hire_date),2006, 1, 0)) "2006",
sum(decode(extract(year from hire_date),2007, 1, 0)) "2007",
sum(decode(extract(year from hire_date),2008, 1, 0)) "2008"
from employees;