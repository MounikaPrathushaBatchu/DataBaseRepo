CREATE TABLE mounika_emp (
    id              NUMBER,
    name            VARCHAR2(50),
    contact_number  NUMBER,
    address         VARCHAR2(50),
    active          NUMBER(1) DEFAULT 1,
    created_on      DATE DEFAULT sysdate,
    created_user    NUMBER,
    updated_on      DATE DEFAULT sysdate,
    updated_user    NUMBER
);
create sequence mounika_emp_seq start with 1 nocycle nocache;


insert into mounika_emp(id,name,contact_number,address,created_user,updated_user) 
values (mounika_emp_seq.nextval,'Mounika',9876543210,'HYD',-2,-2);