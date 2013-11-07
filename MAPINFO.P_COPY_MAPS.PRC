CREATE OR REPLACE 
PROCEDURE P_COPY_MAPS 
is
-- mrosenblum - 11-11-2005
    cursor c1
    is
    select table_name
    from user_tables
    where substr(table_name,1,2)='T_';

    procedure p_process (in_table_name varchar2)
    is
       pragma autonomous_transaction;
    begin
       execute immediate 'delete from '||substr(in_table_name,3);
       execute immediate 'insert into '||substr(in_table_name,3)||' select * from '||in_table_name;
       execute immediate 'drop table '||in_table_name;
       commit;
    end;
begin
    dbms_output.put_line('-Copy Maps-');
    for c in c1
    loop
        dbms_output.put_line('<'||c.table_name||'>');
        p_process(c.table_name);
    end loop;
end;
/
