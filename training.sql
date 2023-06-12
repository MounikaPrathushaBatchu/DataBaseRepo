create or replace procedure student_m_pro as 
begin
insert into student_m values(5,'E',25.30);
insert into student_m values(6,'F',26.30);
insert into student_m values(7,'G',24.30);
insert into student_m values(8,'H',23.30);
insert into student_m values(9,'I',28.30);
insert into student_m values(10,'J',29.30);
end student_m_pro;
/
execute student_m_pro;
/
create or replace procedure student_m_pro1(sno in number,sname in varchar2,smarks in number) as 
begin
insert into student_m values(sno,sname,smarks);
end student_m_pro1;
/

create or replace procedure update_student_m(uno in number,uname in varchar2,umarks in number) as 
begin
update student_m set smarks = umarks where sno = uno;
end update_student_m;
/

CREATE OR REPLACE PROCEDURE delete_student_m(dno in number) as
begin
delete from student_m where sno = dno;
end delete_student_m;
/

create or replace procedure get_student_m_info(stno in number,stname out varchar2,stmarks out varchar2) as
begin
select sname,smarks into stname,stmarks from student_m where sno = stno;
end get_student_m_info;
/

create or replace procedure getALlStudntInfo(stmarks in number, studs out sys_refcursor) as
begin
open studs for select * from student_m where smarks>stmarks;
end getALlStudntInfo;
/

create table users_m(name varchar2(25), doj date);
select * from users_m;

SELECT * FROM STUDENT_M;