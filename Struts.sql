--Package
create or replace package strutsemp_pack as

procedure register(id number,name varchar2,address varchar2,salary number);
PROCEDURE getAll(struts_curse out emp_curse.cursor_strutsemp);
procedure getOne(id number,getById out emp_curse.cursor_strutsemp);
procedure update_emp(ename varchar2,eaddress varchar2,esalary number,eid number);
procedure delete_emp(eid number);

end strutsemp_pack;

--Package Body
create or replace package body strutsemp_pack as

procedure register(id number,name varchar2,address varchar2,salary number) as
begin
insert into strutsemp values(id,name,address,salary);
end register;

procedure getAll(struts_curse out emp_curse.cursor_strutsemp) as
begin
open struts_curse for select * from strutsemp;
end getAll;

procedure getOne(id number,getById out emp_curse.cursor_strutsemp) as

begin
open getById for 'select * from strutsemp where id ='||id||''; 
end getOne;

procedure update_emp(ename varchar2,eaddress varchar2,esalary number,eid number) as
begin 
update strutsemp set name=ename,address=eaddress,salary=esalary where id=eid;
end update_emp;

procedure delete_emp(eid number) as
begin
delete from strutsemp where id = eid;
end delete_emp;

end strutsemp_pack;

--execution of procedures in the above package
execute strutsemp_pack.getAll;

execute strutsemp_pack.register(8,'hh','adg',123);

execute strutsemp_pack.getOne(8);

execute strutsemp_pack.update_emp('e','bvrm',789,5);

execute strutsemp_pack.delete_emp(8);

select * from strutsemp;

create or replace package emp_curse as
type cursor_strutsemp is ref cursor;
end;