ALTER TABLE mounika_emp ADD PRIMARY KEY ( id );

CREATE TABLE student_m (
    id             NUMBER,
    name           VARCHAR2(50),
    email_id       VARCHAR2(50),
    password       VARCHAR2(50),
    active         NUMBER(1) DEFAULT 1,
    delete_status  NUMBER(1) DEFAULT 0
);

ALTER TABLE student_m ADD PRIMARY KEY ( id );

ALTER TABLE student_m
    ADD FOREIGN KEY ( id )
        REFERENCES department_m ( id );

CREATE TABLE department_m (
    id             NUMBER,
    name           VARCHAR2(50),
    active         NUMBER(1) DEFAULT 1,
    delete_status  NUMBER(1) DEFAULT 0,
    PRIMARY KEY ( id )
);

CREATE TABLE courses_m (
    id             NUMBER,
    name           VARCHAR2(50),
    active         NUMBER(1) DEFAULT 1,
    delete_status  NUMBER(1) DEFAULT 0,
    PRIMARY KEY ( id ),
    FOREIGN KEY ( id )
        REFERENCES department_m ( id )
);
create sequence courses_m_seq start with 1 nocycle nocache;

insert all into courses_m (id,name) values (courses_m_seq.nextval,'DBMS')
 into courses_m (id,name) values (courses_m_seq.nextval,'JAVA')
 select * from dual;


insert into department_m (id,name) values (1,'CSC');
insert all into department_m(id,name) values (2,'Mech')
into department_m(id,name) values (3,'EEE')
into department_m(id,name) values (4,'ECE')
SELECT * FROM DUAL;

insert all into department_m(id,name) values (5,'Civil')
into department_m(id,name) values (6,'AI-ML')
into department_m(id,name) values (7,'Aeronautical')
into department_m(id,name) values (8,'Agricultural')
SELECT * FROM DUAL;

drop table department_m;
drop table courses_m;
drop table student_m;