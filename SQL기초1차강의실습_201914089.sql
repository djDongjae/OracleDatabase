--�й�:201914089 �̸�:������

--����1: select
--1. DEPARTMENTS ���̺��� ��� ������ ����϶�.
select *
from departments;

/*
2. �� ��� (employee)�� ��(last name), job code, ����� (hire date),
�����ȣ(employee number)�� ����϶�. �����ȣ�� ���� �տ� ���;� �Ѵ�. HIRE_DATE�� STARTDATE�� ����϶�
*/
select employee_id, last_name, job_id, hire_date as startdate
from employees;

--3. ����鿡�� ������ job code�� ����϶�. �ߺ��� ���� �ѹ��� ����Ѵ�.
select distinct job_id
from employees


--4. ������ ��� job code�� ����϶�. ����鿡�� �������� ���� job code�� ��µǾ�� �Ѵ�.
select job_id
from jobs;

/*
5. ����� �̸�, �޿��� ����϶�. �� Į���� �̸��� Employee, Salary�̴�.
Employee�� ���� �̸��� ���� �پ �ϳ��� �÷����� ��µȴ�.
*/
select first_name||' '||last_name as Employee, salary as "Salary"
from employees;


--6. �μ��� �̸��� �μ���ȣ�� ����϶�.
select department_name, department_id
from departments;


--7. COUNTRIES ���̺� �����ϴ� ��� �����͸� ����϶�.
select *
from countries;

--����2: where, order by
--1. $12,000 �̻� ���� ����� ���� �޿��� ����϶�.
select last_name, salary
from employees
where salary >= 12000;

--2. �����ȣ 176���� ����� ���� �̸�, �μ���ȣ�� ����϶�.
select last_name, first_name, department_id 
from employees
where employee_id = 176;

--3. �޿��� $5000 ���� �ް� �ִ� ����� ���� �޿��� ����϶�.\
select last_name, salary
from employees
where salary <= 5000;

--4. �޿��� $12000 �̻� �ް� �ִ� ����� ���� �̸�, �޿�, �μ���ȣ�� ����϶�.
select first_name, last_name, salary, department_id
from employees
where salary >= 12000;

--5. �޿��� $5000 �̻�, $12000 ���Ϸ� �ް� �ִ� ����� �����ȣ, ��, �޿��� ����϶�. �޿��� ���� ������� ��µǾ�� �Ѵ�.
select employee_id, last_name, salary
from employees
where salary >= 5000 and salary <= 12000
order by salary desc;

--6. ���� Matos�̰ų� Taylor�� ����� ���� ���۳�¥, Job code�� ����϶�. ������� ���� ����� ���� ��µǾ�� �Ѵ�.
select last_name, hire_date, job_id
from employees
where last_name = 'Matos' or last_name = 'Taylor'
order by hire_date;

--7. �μ���ȣ 20�� 50 ������ ����� ��, �μ���ȣ�� ����϶�. ���� ���ĺ� �������� ��µǾ�� �Ѵ�.
select last_name, department_id
from employees
where department_id between 20 and 50
order by last_name desc;

--8. 50�� �μ����� ���ϴ� ������� �ٹ��ϴ� job id�� �ߺ� �����Ͽ� ����϶�.
select distinct job_id
from employees
where department_id = 50;