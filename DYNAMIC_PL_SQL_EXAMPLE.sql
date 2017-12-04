create or replace procedure tabloBas(p_tablo_adi varchar2) is
  c_cursor number;
  rec_tab  DBMS_SQL.DESC_TAB;
  col_num  NUMBER;
  col_cnt  NUMBER;
  v_sonuc number;
  v_kolon_degeri varchar2(100);
  fdbk number;
begin
  c_cursor := dbms_sql.open_cursor;
  dbms_sql.parse(c_cursor, 'select * from '||p_tablo_adi, DBMS_SQL.NATIVE);
  v_sonuc := dbms_sql.execute(c_cursor);
  dbms_output.put_line('Kolonlar:');
  DBMS_SQL.DESCRIBE_COLUMNS(c_cursor, col_cnt, rec_tab);
  col_num := rec_tab.first;
  IF (col_num IS NOT NULL) THEN
    LOOP
      dbms_output.put_line(col_num||':'||rec_tab(col_num).col_name);
      col_num := rec_tab.next(col_num);
      EXIT WHEN (col_num IS NULL);
    END LOOP;
  END IF;
  for i in 1..col_cnt loop
    DBMS_SQL.DEFINE_COLUMN(c_cursor, i, v_kolon_degeri, 100);
  end loop;

  dbms_output.put_line('Icerik:');
  loop
    if (dbms_sql.fetch_rows(c_cursor)>0) then
      for i in 1..col_cnt loop
        DBMS_SQL.COLUMN_VALUE(c_cursor, i, v_kolon_degeri);
        dbms_output.put(v_kolon_degeri);
        if i!=col_cnt then dbms_output.put(','); end if;
      end loop;
      dbms_output.new_line;
    else exit;
    end if;
  end loop;
  DBMS_SQL.CLOSE_CURSOR(c_cursor);
end;
/
set serveroutput on
exec tabloBas('jobs');