/*
1-3 : salary number(8, 2)�� ���� ����. (-0.2) 1-7 : ���̺� �� ����. (-0.2) 3-2, 3-10 : salary �� ����(�� -0.2) 3-9 : commit�� ���� ����.(-0.2)
*/

--3.4 ����(DDL)
--1. ���� ���̺� instance ��Ʈ�� ������� DEPT3 ���̺��� �����Ѵ�.
create table dept3(
    id number(7) primary key,
    name varchar2(25)
);

--2. ���� ���̺� instance ��Ʈ�� ������� EMP3 ���̺��� �����Ѵ�.
create table emp3(
    id number(7),
    last_name varchar(25),
    first_name varchar(25),
    dept_id number(7),
    foreign key(dept_id) references dept3(id)
);

/* 3. employees ���̺��� ������ ������� employees2 ���̺��� �����Ѵ�. 
employee_id, first_name, last_name, salary, department_id �� ���Խ�Ű��
�� �̸��� ���� id, first_name, last_name, salary, dept_id�� �����Ѵ�. ���̺� ������ �����ϰ� �����͸� �������� �ʴ´�.*/
create table employees2(
    id number(6),
    first_name varchar2(20),
    last_name varchar2(25),
    salary number(8, 2),
    dept_id number(4)
);

--4. ������ ���� �� ���� �Է��� �� �ֵ��� emp3 ���̺��� �����Ѵ�.
alter table emp3 modify last_name varchar2(50);

/*5. emp3 ���̺� loc��� �÷��� �߰��϶�. varchar2 ������ Ÿ���̾�� �ϸ�, �ִ� ���� 10�� ������.
����Ʈ ������ 'LA' ���� �Է��Ѵ�.*/
alter table emp3 add loc varchar2(10) default 'LA';

--6. emp3�� loc �÷��̸��� loc2�� �����϶�.
alter table emp3 rename column loc to loc2;

--7. employees2 ���̺��� first_name ���� �����Ѵ�. �����Ǿ����� Ȯ���Ѵ�.
alter table employees2 drop column first_name;

--8. dept3 ���̺��� id �÷��� �����Ѵ�. ������ �Ұ����ϴٸ�, �����ϵ��� �ض�.
alter table emp3 drop column dept_id;
alter table dept3 drop column id;

--9. emp3 ���̺��� �����Ѵ�.
drop table emp3;
drop table dept3;
--[����] ���� ���� ����

/*
1. DDL �ǽ����� ������ DEPT3 ���̺��� DEPARTMENTS ���̺��� �̿��Ͽ� �����϶�.
�����͵� �����Ͽ��� �Ѵ�. ID���� ����Ͽ� DEPT3 ���̺� ���� PRIMARY KEY ���������� �����Ѵ�. ���������� �̸��� my_dept_id_pk�� �����Ѵ�.
*/
create table dept3 as
select department_id id, department_name name
from departments;

alter table dept3 add constraints my_dept_id_pk primary key(id);

/*
2. DDL �ǽ�2�� ������ ���� EMP3 ���̺��� �����϶�. ��, ���̺� ������ ID �÷��� �⺻Ű�� �����϶�.
�ܷ�Ű�� �������� �ʴ´�. ���� ���̺��� �����Ѵٸ� ������ �� �����϶�. �⺻Ű �������� �̸��� EMP3_ID_PK�� �϶�.
*/
create table emp3(
    id number(7) constraints emp3_id_pk primary key,
    last_name varchar(25),
    first_name varchar(25),
    dept_id number(7)
);

/*
3. �������� �ʴ� �μ�(DEPT3)�� ����� �Ҵ���� �ʵ��� �ϴ� �ܷ�Ű ������ EMP3 ���̺� �߰��Ѵ�.
���� ���� �̸��� my_emp_dept_id�� �Ѵ�. �μ��� �����Ǹ�, �ش� �μ��� �ҼӵǾ��� ����� �ҼӺμ��� ������ NULL�� �����ǵ��� �϶�.
*/
alter table emp3
add constraints my_emp_dept_id foreign key(dept_id) references dept3(id) on delete set null;

/*
4. DEPT3 ���̺� MANAGER_ID �÷��� �߰��϶�. �� �÷��� EMP3 ���̺��� ID�� �����Ѵ�.
�������� �ʴ� ����� �Ҵ���� �ʵ��� �����϶�.
*/
alter table dept3 add manager_id references emp3(id);

/*
5. EMP3 ���̺��� �����Ѵ�. ������������ NUMBER�̰� ��ü �ڸ��� 2, �Ҽ��� ���� �ڸ����� 2�� COMMISSION ���� �߰��Ѵ�.
COMMISSION �� ���� �׻� 0���� ũ�ų� ������ ���� ������ �����Ѵ�.
*/
alter table emp3
add commission number(2, 2) check(0<=commission);

-- 6. DEPT3 ���̺��� �����϶�. ���� �����Ѱ�? ������ �� ���ٸ� �� ������ ���.
drop table dept3;
--���� ���Ἲ ��������

/*
7. DEPT3�� Primary key ���������� �̸��� Ȯ���Ͽ�, �� ���������� �����϶�.
���� �����Ѱ�? ������ �� ���ٸ� �� ������ ���.MY_DEPT_ID_PK
*/
alter table dept3
drop constraints MY_DEPT_ID_PK;--�������Ἲ

-- 8. EMP3�� �����Ǿ� �ִ� �ܷ�Ű ���������� �����϶�.
alter table emp3
drop constraints MY_EMP_DEPT_ID;

-- 9. DEPT3�� Primary key ���������� �����϶�. ������ ���� �����Ѱ�?
alter table dept3
drop constraints MY_DEPT_ID_PK;

-- 10. DEPT3 ���̺��� �����϶�. ������ ������ �����Ѱ�?
drop table dept3;

/*
[����]
�ǽ������� �־��� lab_08_01.sql script�� �����Ͽ� MY_EMPLOYEE table�� �����϶�. �� ���̺� ���� �Ʒ� �۾����� �����Ѵ�.
*/
CREATE TABLE my_employee
  (id  NUMBER(4) CONSTRAINT my_employee_id_nn NOT NULL,
   last_name VARCHAR2(25),
   first_name VARCHAR2(25),
   userid  VARCHAR2(8),
   salary  NUMBER(9,2));

-- 1. ���� �׸��� ù��° ���� �Է��ϴ� ������ �����϶�. �÷��̸��� ������� ����.
insert into my_employee
values (1, 'Patel', 'Ralph', 'rpatel', 895);

-- 2. �ι�° ���� �Է��ϴ� ������ �����϶�. �÷��̸��� ����Ѵ�.
insert into my_employee(id, last_name, first_name, userid, salary)
values (2, 'Dancs', 'Betty', 'bdancs', 860);

/*
3. ����°, �׹�° ����� �Է��ϴ� ������ �����϶�. �÷��̸� ��� ���δ� �ʿ信 ���� �����϶�. 5��° ���� �������� �ʴ´�.
*/
insert into my_employee
values (3, 'Biri', 'Ben', 'bbiri', 1100);

insert into my_employee
values (4, 'Newman', 'Chad', 'cnewman', 750);

-- 4. ���̺� �����Ͱ� �ԷµǾ����� Ȯ���� �� �ִ� ������ �ۼ��Ͽ� �����϶�.
select *
from my_employee;

-- 5. �����ͺ��̽��� ���������� �ݿ��ǵ��� �����ϴ� ������ �����϶�.
commit;

-- 6. 3��° ����� ���� Drexler�� �����϶�.
update my_employee
set last_name = 'Drexler'
where id = 3;

-- 7. $1000���� ���� ���� ����� �޿��� $1000���� �����϶�.
update my_employee
set salary = 1000
where salary < 1000;

-- 8. �����Ͱ� ����� �����Ǿ����� Ȯ���϶�.
select *
from my_employee;

-- 9. Betty Dancs�� �����϶�. ������ ������ Ȯ���϶�. �����ͺ��̽��� ���������� �ݿ��ǵ��� �����ϴ� ������ �����϶�.
delete from my_employee
where first_name = 'Betty' and last_name = 'Dancs';

select *
from my_employee;

commit;

-- 10. 5��° ���� �����϶�. ������ ������ Ȯ���϶�.
insert into my_employee
values (5, 'Ropeburn', 'Audrey', 'aropebur', 1550);

select *
from my_employee;