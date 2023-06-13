create or replace package mahesh_pkg2
as
procedure updatesal(eid in number,esal in number);
function salById(eid in number) return number;
function getSalCursor(eid in number) return number;
procedure cursorloop(eactive in number);
end mahesh_pkg2;

create or replace package body mahesh_pkg2
as
procedure updatesal(eid in number,esal in number)
is 
begin 
update mahesh_perikela_emp set sal=sal+esal where id =eid;
commit;
end updatesal;

function salById(eid number)
return number
is
esal mahesh_perikela_emp.sal%TYPE;
begin
select sal into esal from mahesh_perikela_emp where id =eid;
return esal;
end salById;

function getSalCursor(eid in number) 
return number
is
esal number;
cursor c1
is
select sal from mahesh_perikela_emp where id =eid;
begin
open c1;
FETCH c1 INTO esal;  
 if c1%notfound then  
      esal := 0;  
   end if;  
 CLOSE c1;  
RETURN esal;  
END getSalCursor;  

procedure cursorloop(eactive in number)
is 
eid mahesh_perikela_emp.id%TYPE;
ename mahesh_perikela_emp.name%TYPE;
cursor c2
is
select id,name into eid,ename from mahesh_perikela_emp where active=eactive;
begin
open c2;
loop
fetch c2 into eid,ename;
exit when c2%NOTFOUND;
 dbms_output.put_line('id  '||eid||'   name     '||ename);
end loop;
close c2;
end cursorloop; 
end;