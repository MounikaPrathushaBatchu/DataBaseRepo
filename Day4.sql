CREATE TABLE employee_m (
    id            NUMBER,
    name          VARCHAR2(40),
    doj           DATE,
    job           VARCHAR(20),
    salary        NUMBER(8, 2),
    created_on    DATE DEFAULT sysdate,
    created_user  NUMBER,
    updated_on    DATE DEFAULT sysdate,
    updated_user  NUMBER
);

create sequence employee_m_seq start with 1 nocycle nocache;

insert into employee_m (id,name,doj,job,salary,created_user,updated_user)
values (employee_m_seq.nextval,'F','21-MAY-1995','MANAGER',20000,-2,-2);

ALTER TABLE emplyoee_m
RENAME COLUMN name to FIRST_NAME;

ALTER TABLE emplyoee_m
ADD LAST_NAME VARCHAR2(40);

create table department_m (id number,name varchar2(25));
create sequence department_m_seq start with 1 nocycle nocache;

insert into department_m(id, name) values (department_m_seq.nextval,'MANAGING-LEAD');

SELECT * FROM department_m;

declare
    cursor c_employee_m is select first_name,last_name from employee_m;
    v_first_name employee_m.first_name%type;
    v_last_name employee_m.last_name%type;
begin
    open c_employee_m;
    fetch c_employee_m into v_first_name, v_last_name;
    dbms_output.put_line(v_first_name || ' ' || v_last_name);
    fetch c_employee_m into v_first_name, v_last_name;
    dbms_output.put_line(v_first_name || ' ' || v_last_name);
    close c_employee_m;
end;

create or replace trigger trg_employee_m before update on employee_m
    begin
    dbms_output.put_line('Record Updated');
    end;
    /
    
update employee_m set salary = salary * 1.5 where salary = 12000;
update employee_m set salary = salary * 1.5 where id = 6;

drop trigger trg_employee_m;
CREATE OR REPLACE TRIGGER trg1_employee_m BEFORE
    UPDATE ON employee_m
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Record Updated');
END;
/

update employee_m set salary = salary * 0.09 where salary = 18000;

create or replace procedure addnums(n1 number, n2 number) is n3 number;
begin
n3 := n1 + n2;
DBMS_OUTPUT.put_line(n3);
end;
/

exec addnums(10,20);

create or replace procedure get_salary (eid in employee_m.id%type, sal out employee_m.salary%type) is
begin
select salary into sal from employee_m where id=eid;
end;
/

variable n number;

execute get_salary (1, :n);

create or replace procedure emp_info is
cursor c1 is select * from employee_m;
begin
for e in c1 loop
dbms_output.put_line (e.id || ' ' || rpad(e.first_name || ' ' || e.last_name,20) || e.salary);
end loop;
end;
/

execute emp_info;

create or replace function addNumbers(a number, b number)
return number is
begin
return a + b;
end;
/

select addNumbers(10,20) from dual;

execute DBMS_OUTPUT.PUT_LINE(addNumbers(20,20));

create or replace function get_avg_sal(p_dept_id department_m.id%type)
return number as
v_avg_sal number;
begin
select avg(salary) into v_avg_sal from employee_m where id=p_dept_id;
return p_dept_id;
end get_avg_sal;
/

begin
dbms_output.put_line(get_avg_sal(5));
end;

select id,first_name,salary,get_avg_sal(id) avg_sal from employee_m;