---3.3.1 ���� ����

--1. 100�� ���� �μ��� �Ҽӵ� ����� �����ȣ, ��, �μ���ȣ, �μ����� ����϶�.
select employee_id, employees.first_name, employees.department_id, departments.department_name
from departments, employees
where departments.department_id <= 100;

/*2. ��� �μ��� �ּҸ� ����Ѵ�. location ID, streets address, city, state �Ǵ� province, country�� ����ؾ��Ѵ�.
NATURAL JOIN�� ����϶�.*/
select department_id, location_id, street_address, city, state_province, country_id
from departments
natural join locations
order by department_id asc;

/*3. Toronto���� �ٹ��ϴ� ����� last name, job(job id), department number, department name�� ����϶�.*/

--4. ����� ��ȣ, ��, JOB_CODE, JOB_TITLE�� ����϶�.
select employee_id, last_name ,employees.job_id, job_title
from employees, jobs
where employees.job_id = jobs.job_id;

--5. ��� �μ��� ��ȣ, �̸�, �μ����� ���� ����϶�.
select departments.department_id, departments.department_name, employees.last_name
from employees, departments
where departments.manager_id = employees.employee_id;

--6. ���� JOB�� �ϴ� ����� ���ڸ� ����϶�. JOB�� �̸��� ��µǾ�� �Ѵ�.
select job_title, count(*)
from employees
natural join jobs
group by job_title;

--7. JOB �̷�(history)�� �ִ� ����� ���� �̸�, JOB_HISTORY ���Ƚ���� ����϶�.
select employees.first_name, employees.last_name, count(*)
from employees, job_history
where employees.job_id = job_history.job_id
group by (employees.first_name, employees.last_name);

--8. �޿��� 4000�̻��� ������� ���� �μ��� �̸��� �ߺ��� �����ϰ� ����϶�.
select distinct department_name 
from employees natural join departments
where salary >= 4000;

--3.3.1 Outer Join ����

--1. ����� �Ҽӵ��� ���� �μ��� �����Ͽ�, �μ��̸��� �ش� �μ��� �Ҽӵ� ��� �̸��� ����϶�.
select d.department_name, e.last_name
from departments d left outer join employees e
on d.department_id = e.department_id;

select d.department_name, e.last_name
from departments d left outer join employees e
using (department_id);

/*
2. ������ �������� ���� ����� ����� �������� ���� ������ �����Ͽ�,
��� ��� �̸�(first_name)�� ���� �̸�(job_title)�� ����϶�.
*/
select e.first_name, j.job_title
from employees e full outer join jobs j
using (job_id);

-- 3. �μ��� ��ġ���� ���� ��ġ(locations)�� �����Ͽ� ��� ��ġ�� �����̸�(city)�� �μ��̸��� ����϶�.

