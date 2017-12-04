create table personel (isim varchar2(20));
insert into personel values('Kamuran');
commit;
update personel set isim = 'Visne';
commit;
update personel set isim = 'Abdulmuttalip';
commit;

select rowid, isim from personel;
select rowid, isim, versions_operation, versions_starttime, versions_endtime, versions_startscn, versions_endscn, versions_xid
from personel versions between scn minvalue and maxvalue;

select * from personel as of timestamp to_timestamp('04-11-2015 13:32:00', 'DD-MM-YYYY HH24:MI:SS');

alter table personel enable row movement;

flashback table personel to timestamp to_timestamp('04-11-2015 13:32:00', 'DD-MM-YYYY HH24:MI:SS');

select isim from personel;

drop table personel;

select * from user_recyclebin;

select * from "BIN$I7akk6x41ZjgUAB/AQAbDw==$0";

flashback table personel to before drop;

select isim from personel;

drop table personel;

create table personel (yas number(2));
insert into personel values (18);
commit;
drop table personel;
select * from user_recyclebin;

select * from "BIN$I7akk6x51ZjgUAB/AQAbDw==$0";
flashback table "BIN$I7akk6x51ZjgUAB/AQAbDw==$0" to before drop;

select * from personel;

flashback table personel to before drop rename to personel2;

select * from personel2;

