insert into mounika_emp(id,name,contact_number,address,created_user,updated_user,SALARY) 
values (mounika_emp_seq.nextval,'Mounika',9876543210,'HYD',-2,-2,12000);

insert all into mounika_emp(id,name,contact_number,address,created_user,updated_user,salary) values (mounika_emp_seq.nextval,'A',9876543210,'HYD',-2,-2,15000)
into mounika_emp(id,name,contact_number,address,created_user,updated_user,salary) values (mounika_emp_seq.nextval,'B',1234567890,'HYD',-2,-2,11000)
into mounika_emp(id,name,contact_number,address,created_user,updated_user,salary) values (mounika_emp_seq.nextval,'C',1020304050,'HYD',-2,-2,12000)
into mounika_emp(id,name,contact_number,address,created_user,updated_user,salary) values (mounika_emp_seq.nextval,'D',6070809010,'HYD',-2,-2,13000)
into mounika_emp(id,name,contact_number,address,created_user,updated_user,salary) values (mounika_emp_seq.nextval,'E',1002003009,'HYD',-2,-2,14000)
select * from dual;

