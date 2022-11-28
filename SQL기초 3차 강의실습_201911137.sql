/*
�ۼ���: 201911137 ���ο�
�ۼ���: 2022. 11. 07

3�� 4.1���� �������� ��������(HR ��Ű���� ������� ���õ� ��������)�� Ǯ���Ͽ� �����մϴ�.


[����] ����(DDL)

1. ���� ���̺� instance ��Ʈ�� ������� DEPT3 ���̺��� �����Ѵ�.
2. ���� ���̺� instance ��Ʈ�� ������� EMP3 ���̺��� �����Ѵ�.
3. EMPLOYEES ���̺��� ������ ������� EMPLOYEES2 ���̺��� �����Ѵ�.
EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID�� ���Խ�Ű��,
�� �̸��� ���� ID, FIRST_NAME, LAST_NAME, SALARY, DEPT_ID�� �����Ѵ�. ���̺� ������ �����ϰ�, �����͸� ���������� �ʴ´�.
4. ������ ���� �� ���� �Է��� �� �ֵ��� EMP3 ���̺��� �����Ѵ�.
5. EMP3 ���̺� LOC��� �÷��� �߰��϶�.
Varchar2 ������ Ÿ���̾�� �ϸ�, �ִ� 10�� ���̸� ������. ����Ʈ ������ ��LA�� ���� �Է��Ѵ�.
6. EMP3�� LOC �÷��̸��� LOC2�� �����϶�.
7. EMPLOYEES2 ���̺��� FIRST_NAME ���� �����Ѵ�. �����Ǿ����� Ȯ���Ѵ�.
8. DEPT3 ���̺��� ID �÷��� �����Ѵ�. ������ �Ұ����ϴٸ�, �����ϵ��� �϶�.
9. EMP3 ���̺��� �����Ѵ�.
*/

-- 1. ���� ���̺� instance ��Ʈ�� ������� DEPT3 ���̺��� �����Ѵ�.
CREATE TABLE DEPT3 (
    ID      NUMBER(7) PRIMARY KEY,
    NAME    VARCHAR2(25));
  
-- 2. ���� ���̺� instance ��Ʈ�� ������� EMP3 ���̺��� �����Ѵ�.
CREATE TABLE EMP3 (
    ID          NUMBER(7),
    LAST_NAME   VARCHAR2(25),
    FIRST_NAME  VARCHAR2(25),
    DEPT_ID     NUMBER(7) REFERENCES DEPT3(id));
    
/*
3. EMPLOYEES ���̺��� ������ ������� EMPLOYEES2 ���̺��� �����Ѵ�.
EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID�� ���Խ�Ű��,
�� �̸��� ���� ID, FIRST_NAME, LAST_NAME, SALARY, DEPT_ID�� �����Ѵ�. ���̺� ������ �����ϰ�, �����͸� ���������� �ʴ´�.
*/
CREATE TABLE EMPLOYEES2 (
    ID          NUMBER,
    FIRST_NAME  VARCHAR2(20),
    LAST_NAME   VARCHAR2(25),
    SALARY      NUMBER(8, 2),
    DEPT_ID     NUMBER(4));
    
SELECT * FROM EMPLOYEES2;
    
DROP TABLE EMPLOYEES2;
    
CREATE TABLE EMPLOYEES2 AS
SELECT EMPLOYEE_ID ID, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID DEPT_ID
FROM EMPLOYEES
WHERE 1 = 2;

SELECT *
FROM EMPLOYEES2;

-- 4. ������ ���� �� ���� �Է��� �� �ֵ��� EMP3 ���̺��� �����Ѵ�.
ALTER TABLE EMP3 MODIFY LAST_NAME VARCHAR2(50);

/*
5. EMP3 ���̺� LOC��� �÷��� �߰��϶�.
Varchar2 ������ Ÿ���̾�� �ϸ�, �ִ� 10�� ���̸� ������. ����Ʈ ������ ��LA�� ���� �Է��Ѵ�.
*/
ALTER TABLE EMP3 ADD LOC VARCHAR2(10) DEFAULT 'LA';

-- 6. EMP3�� LOC �÷��̸��� LOC2�� �����϶�.
ALTER TABLE EMP3 RENAME COLUMN LOC TO LOC2;

-- 7. EMPLOYEES2 ���̺��� FIRST_NAME ���� �����Ѵ�. �����Ǿ����� Ȯ���Ѵ�.
ALTER TABLE EMPLOYEES2 DROP COLUMN FIRST_NAME;

-- 8. DEPT3 ���̺��� ID �÷��� �����Ѵ�. ������ �Ұ����ϴٸ�, �����ϵ��� �϶�.
ALTER TABLE EMP3 DROP CONSTRAINT SYS_C007071;
ALTER TABLE DEPT3 DROP COLUMN ID;

-- 9. EMP3 ���̺��� �����Ѵ�.
DROP TABLE EMP3;

/*
[����] ���� ���� ����

1. DDL �ǽ����� ������ DEPT3 ���̺��� DEPARTMENTS ���̺��� �̿��Ͽ� �����϶�.
�����͵� �����Ͽ��� �Ѵ�. ID���� ����Ͽ� DEPT3 ���̺� ���� PRIMARY KEY ���������� �����Ѵ�. ���������� �̸��� my_dept_id_pk�� �����Ѵ�.
2. DDL �ǽ�2�� ������ ���� EMP3 ���̺��� �����϶�. ��, ���̺� ������ ID �÷��� �⺻Ű�� �����϶�.
�ܷ�Ű�� �������� �ʴ´�. ���� ���̺��� �����Ѵٸ� ������ �� �����϶�. �⺻Ű �������� �̸��� EMP3_ID_PK�� �϶�.
3. �������� �ʴ� �μ�(DEPT3)�� ����� �Ҵ���� �ʵ��� �ϴ� �ܷ�Ű ������ EMP3 ���̺� �߰��Ѵ�.
���� ���� �̸��� my_emp_dept_id�� �Ѵ�. �μ��� �����Ǹ�, �ش� �μ��� �ҼӵǾ��� ����� �ҼӺμ��� ������ NULL�� �����ǵ��� �϶�.
4. DEPT3 ���̺� MANAGER_ID �÷��� �߰��϶�. �� �÷��� EMP3 ���̺��� ID�� �����Ѵ�.
�������� �ʴ� ����� �Ҵ���� �ʵ��� �����϶�.
5. EMP3 ���̺��� �����Ѵ�. ������������ NUMBER�̰� ��ü �ڸ��� 2, �Ҽ��� ���� �ڸ����� 2�� COMMISSION ���� �߰��Ѵ�.
COMMISSION �� ���� �׻� 0���� ũ�ų� ������ ���� ������ �����Ѵ�.
6. DEPT3 ���̺��� �����϶�. ���� �����Ѱ�? ������ �� ���ٸ� �� ������ ���.
7. DEPT3�� Primary key ���������� �̸��� Ȯ���Ͽ�, �� ���������� �����϶�.
���� �����Ѱ�? ������ �� ���ٸ� �� ������ ���.
8. EMP3�� �����Ǿ� �ִ� �ܷ�Ű ���������� �����϶�.
9. DEPT3�� Primary key ���������� �����϶�. ������ ���� �����Ѱ�?
10. DEPT3 ���̺��� �����϶�. ������ ������ �����Ѱ�?
*/

/*
1. DDL �ǽ����� ������ DEPT3 ���̺��� DEPARTMENTS ���̺��� �̿��Ͽ� �����϶�.
�����͵� �����Ͽ��� �Ѵ�. ID���� ����Ͽ� DEPT3 ���̺� ���� PRIMARY KEY ���������� �����Ѵ�. ���������� �̸��� my_dept_id_pk�� �����Ѵ�.
*/
drop table dept3;
create table dept3 as
select department_id id, department_name name
from departments;

select * from dept3;

alter table dept3 add constraint my_dept_id_pk primary key(id);

/*
2. DDL �ǽ�2�� ������ ���� EMP3 ���̺��� �����϶�. ��, ���̺� ������ ID �÷��� �⺻Ű�� �����϶�.
�ܷ�Ű�� �������� �ʴ´�. ���� ���̺��� �����Ѵٸ� ������ �� �����϶�. �⺻Ű �������� �̸��� EMP3_ID_PK�� �϶�.
*/
create table emp3 (
id number(7) constraint emp3_id_pk primary key,
last_name varchar2(25),
first_name varchar2(25),
dept_id number(7)
);

/*
3. �������� �ʴ� �μ�(DEPT3)�� ����� �Ҵ���� �ʵ��� �ϴ� �ܷ�Ű ������ EMP3 ���̺� �߰��Ѵ�.
���� ���� �̸��� my_emp_dept_id�� �Ѵ�. �μ��� �����Ǹ�, �ش� �μ��� �ҼӵǾ��� ����� �ҼӺμ��� ������ NULL�� �����ǵ��� �϶�.
*/
alter table emp3 
add constraint my_emp_dept_id foreign key(dept_id) references dept3(id) on delete set null;
    
/*
4. DEPT3 ���̺� MANAGER_ID �÷��� �߰��϶�. �� �÷��� EMP3 ���̺��� ID�� �����Ѵ�.
�������� �ʴ� ����� �Ҵ���� �ʵ��� �����϶�.
*/
alter table dept3 add manager_id references emp3(id);

/*
5. EMP3 ���̺� LOC��� �÷��� �߰��϶�.
Varchar2 ������ Ÿ���̾�� �ϸ�, �ִ� 10�� ���̸� ������. ����Ʈ ������ ��LA�� ���� �Է��Ѵ�.
*/
alter table emp3 add commission number(2, 2) check (commission >= 0);

-- 6. DEPT3 ���̺��� �����϶�. ���� �����Ѱ�? ������ �� ���ٸ� �� ������ ���.
drop table dept3;
-- emp3�� dept_id�� �����ϰ� �����Ƿ�, ������ �� ����. (���� ���Ἲ) */

/*
7. DEPT3�� Primary key ���������� �̸��� Ȯ���Ͽ�, �� ���������� �����϶�.
���� �����Ѱ�? ������ �� ���ٸ� �� ������ ���.
*/
alter table dept3 drop constraint my_dept_id_pk;
-- ������ �� ����. (���� ���Ἲ)

-- 8. EMP3�� �����Ǿ� �ִ� �ܷ�Ű ���������� �����϶�.
alter table emp3 drop constraint my_emp_dept_id;

-- 9. DEPT3�� Primary key ���������� �����϶�. ������ ���� �����Ѱ�?
alter table dept3 drop constraint my_dept_id_pk;
-- ������ �� �ִ�.

-- 10. DEPT3 ���̺��� �����϶�. ������ ������ �����Ѱ�?
drop table dept3;
-- ������ �� �ִ�.

/*
[����]
�ǽ������� �־��� lab_08_01.sql script�� �����Ͽ� MY_EMPLOYEE table�� �����϶�. �� ���̺� ���� �Ʒ� �۾����� �����Ѵ�.

1. ���� �׸��� ù��° ���� �Է��ϴ� ������ �����϶�. �÷��̸��� ������� ����.
2. �ι�° ���� �Է��ϴ� ������ �����϶�. �÷��̸��� ����Ѵ�.
3. ����°, �׹�° ����� �Է��ϴ� ������ �����϶�. �÷��̸� ��� ���δ� �ʿ信 ���� �����϶�. 5��° ���� �������� �ʴ´�.
4. ���̺� �����Ͱ� �ԷµǾ����� Ȯ���� �� �ִ� ������ �ۼ��Ͽ� �����϶�.
5. �����ͺ��̽��� ���������� �ݿ��ǵ��� �����ϴ� ������ �����϶�.
6. 3��° ����� ���� Drexler�� �����϶�.
7. $1000���� ���� ���� ����� �޿��� $1000���� �����϶�.
8. �����Ͱ� ����� �����Ǿ����� Ȯ���϶�.
9. Betty Dancs�� �����϶�. ������ ������ Ȯ���϶�. �����ͺ��̽��� ���������� �ݿ��ǵ��� �����ϴ� ������ �����϶�.
10. 5��° ���� �����϶�. ������ ������ Ȯ���϶�.
*/

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
where last_name = 'Dancs' and first_name = 'Betty';

select * from my_employee;

commit;

-- 10. 5��° ���� �����϶�. ������ ������ Ȯ���϶�.
insert into my_employee
values (5, 'Ropeburn', 'Audrey', 'aropebur', 1550);

select * from my_employee;



