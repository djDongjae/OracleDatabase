--�й�:201914089 �̸�:������

--3.2 �����Լ� �� GROUP BY ����

--1. ��� �޿��� �ְ�, ����, ��, ����� ���϶�. Maximum, Minimum, Sum, Average�� �÷� �̸��� ���Ѵ�.
select max(salary) as Maximum, min(salary) as Minimum, sum(salary) as Sum, avg(salary) as Average
from employees;

/*2. �� JOB���� ��� �޿��� �ְ�, ����, ��, ����� ���϶�. Maximum, Minimum, Sum, Average�� �÷� �̸��� ���Ѵ�.
JOB_ID�� �����Ѵ�.*/
select job_id, max(salary) as Maximum, min(salary) as Minimum, sum(salary) as Sum, avg(salary) as Average
from employees
group by job_id;

--3. ���� JOB�� �ϴ� ����� ���ڸ� ����϶�. JOB_ID�� �����Ѵ�.
select job_id, count(*)
from employees
group by job_id;

--4. MANAGER ����(���)�� �ϰ� �ִ� ����� ���ڸ� ����϶�.
select count(*) 
from employees
where job_id like '%MGR%';

--5. �޿��� $5000 ������ ����鸸 �������, �μ���ȣ�� �޿��� ���� ����϶�.
select department_id, sum(salary)
from employees
where salary <= 5000
group by department_id;

--6. ����� ���� 5�� �̻��� JOB_ID ���� �޿��� �ּҰ��� ���϶�.
select job_id, min(salary)
from employees
group by job_id
having count(*) >= 5;

/*7. ���� �μ����� ���� JOB�� �������� ����� ���ڸ� �μ���ȣ��, JOB_ID���� ����϶�.
�μ���ȣ�� Ŀ���� ������ �����ϵ�, �μ���ȣ�� ���� ���� JOB_ID�� Ŀ���� ������ �����϶�.*/
select department_id, job_id, count(*)
from employees 
group by (department_id, job_id)
order by department_id asc, job_id asc;

--8. �޿��� ����� 5000�� �Ѵ� �μ��� �������, �μ���ȣ�� �޿��� ���� ���϶�.
select department_id, sum(salary)
from employees
group by department_id
having avg(salary) > 5000;

--3.3.1 ���� ����

--1. 100�� ���� �μ��� �Ҽӵ� ����� �����ȣ, ��, �μ���ȣ, �μ����� ����϶�
select employees.employee_id, employees.last_name, departments.department_id, departments.department_name
from departments, employees
where departments.department_id <= 100;

/*2. ��� �μ��� �ּҸ� ����Ѵ�. location ID, streets address, city, state �Ǵ� province, country�� ����ؾ��Ѵ�.
NATURAL JOIN�� ����϶�.*/
select location_id, locations.street_address, locations.city, locations.country_id, locations.state_province
from departments
natural join locations;

/*3. Toronto���� �ٹ��ϴ� ����� last name, job(job id), department number, department name�� ����϶�.*/
select locations.city, employees.last_name, employees.job_id, departments.department_id, department_name
from employees, departments, locations
where departments.location_id = locations.location_id and locations.city = 'Toronto';

--4. ����� ��ȣ, ��, JOB_CODE, JOB_TITLE�� ����϶�.
select employees.employee_id, employees.last_name, jobs.job_id, jobs.job_title
from employees, jobs
where employees.job_id = jobs.job_id;

--5. ��� �μ��� ��ȣ, �̸�, �μ����� ���� ����϶�.
select departments.department_id, departments.department_name, employees.last_name
from departments, employees
where departments.manager_id = employees.employee_id;

--6. ���� JOB�� �ϴ� ����� ���ڸ� ����϶�. JOB�� �̸��� ��µǾ�� �Ѵ�.
select jobs.job_title, count(*)
from employees, jobs
where employees.job_id = jobs.job_id
group by jobs.job_title;

--7. JOB �̷�(history)�� �ִ� ����� ���� �̸�, JOB_HISTORY ���Ƚ���� ����϶�.
select employees.last_name, employees.first_name, count(*) as "job_history count"
from employees, job_history
where employees.employee_id = job_history.employee_id
group by (employees.last_name, employees.first_name);

--8. �޿��� 4000�̻��� ������� ���� �μ��� �̸��� �ߺ��� �����ϰ� ����϶�.
select distinct departments.department_name
from employees, departments
where employees.salary >= 4000;

--3.3.1 Outer Join ����

--1. ����� �Ҽӵ��� ���� �μ��� �����Ͽ�, �μ��̸��� �ش� �μ��� �Ҽӵ� ��� �̸��� ����϶�.
select departments.department_name, employees.first_name, employees.last_name
from departments left outer join employees
on departments.department_id = employees.department_id;

/*2. ������ �������� ���� ����� ����� �������� ���� ������ �����Ͽ�,
��� ��� �̸�(first_name)�� ���� �̸�(job_title)�� ����϶�.*/
select employees.first_name, jobs.job_title
from employees full outer join jobs
on employees.job_id = jobs.job_id;

--3. �μ��� ��ġ���� ���� ��ġ(locations)�� �����Ͽ� ��� ��ġ�� �����̸�(city)�� �μ��̸��� ����϶�.
select locations.city, departments.department_name
from locations left outer join departments
on locations.location_id = departments.location_id;

/*4. ��ġ ��ȣ�� 1700�� �μ��߿���,
�μ���(manager)�� ��ġ���� ���� �μ��� �����Ͽ�, ��� �μ���
�μ����� �̸�(first_name)�� �μ��̸��� �μ� �̸��� �������� ����϶�.*/
select employees.first_name, departments.department_name
from departments left outer join employees
on departments.manager_id = employees.employee_id
where departments.location_id = 1700
order by employees.first_name desc, departments.department_name desc;

--3.3.2 ~ 3.3.4 �μ�����, ���տ��� ����

--1. �ְ��� �޿��� �ް� �ִ� ����� first_name�� ����϶�.
select first_name
from employees
where salary = (
select max(salary)
from employees
);

--2. ����� ���� 5�� �̻��� �μ��� �μ� �̸��� ����϶�.
select department_name
from departments
where department_id in 
(select department_id
from employees
group by department_id
having count(*) >= 5);

--3. ���� �̸��� Purchasing�� �� ������ �ϰ� �ִ� ����� first_name�� ����϶�.
select first_name
from employees
where job_id in 
(select job_id
from jobs
where job_title like '%Purchasing%');

--4. �Ҽ� ����� ���� �μ��� �̸��� ����϶�.
select de.department_name
from departments de
where not exists
(
select *
from employees ep
where de.department_id = ep.department_id
);

--5. ���� ����� ���� ������ �̸�(job_title)�� ����϶�.
select job_title
from jobs
where job_id in
(
select job_id
from jobs
minus
select distinct job_id
from employees
);

--6. Shipping �μ��� Human Resources �μ��� �μ� �̸��� �ּ�(address)�� ����϶�. ���տ����� �̿��Ѵ�.

--7. IT �μ��� Finance �μ� �� �ٰ� ���� ��ġ�� Country_ID�� ����϶�. ���տ����� �̿��Ѵ�.
select country_id
from locations
where location_id in 
(select location_id
from departments
where department_name = 'IT')
intersect
select country_id
from locations
where location_id in 
(select location_id
from departments
where department_name = 'Finance');