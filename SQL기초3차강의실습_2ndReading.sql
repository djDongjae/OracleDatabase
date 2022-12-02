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

--1. DDL �ǽ����� ������ DEPT3 ���̺��� DEPARTMENTS ���̺��� �̿��Ͽ� �����϶�.
