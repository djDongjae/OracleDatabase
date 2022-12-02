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
select l.city, d.department_name
from locations l left outer join departments d
using (location_id);

/*
4. ��ġ ��ȣ�� 1700�� �μ��߿���, �μ���(manager)�� ��ġ���� ���� �μ��� �����Ͽ�,
��� �μ��� �μ����� �̸�(first_name)�� �μ��̸��� �μ� �̸��� �������� ����϶�.
*/
select e.first_name, d.department_name
from departments d left outer join employees e
on e.employee_id = d.manager_id
where d.location_id = 1700
order by d.department_name desc;

--����: �μ�����, ���տ���

--1. �ְ��� �޿��� �ް� �ִ� ����� first_name�� ����϶�.
select first_name
from employees
where salary = (select max(salary) from employees);

--2. ����� ���� 5�� �̻��� �μ��� �μ� �̸��� ����϶�.
select department_name
from departments
where department_id in (
    select department_id
    from employees
    group by department_id
    having count(*) >= 5
);

--3. ���� �̸��� Purchasing�� �� ������ �ϰ� �ִ� ����� first_name�� ����϶�.
select first_name
from employees
where job_id in (
    select job_id
    from jobs
    where job_title like '%Purchasing%'
);

--4. �Ҽ� ����� ���� �μ��� �̸��� ����϶�.
select department_name
from departments
where department_id not in (
    select distinct department_id
    from employees
);

--(���� ����)

--1. ���� ����� ���� ������ �̸�(job_title)�� ����϶�.
select job_title
from jobs
minus
select job_title
from jobs
where job_id in (
    select job_id
    from employees
);

--2. Shipping �μ��� Human Resources �μ��� �μ� �̸��� �ּ�(address)�� ����϶�. ���տ����� �̿��Ѵ�.
select d.department_name, l.street_address
from departments d, locations l
where d.department_name = 'Shipping'
union
select d.department_name, l.street_address
from departments d, locations l
where d.department_name = 'Human Resources';

--3. IT �μ��� Finance �μ� �� �ٰ� ���� ��ġ�� Country_ID�� ����϶�. ���տ����� �̿��Ѵ�.
select l.country_id
from departments d, locations l
where d.department_name = 'IT'
intersect
select l.country_id
from departments d, locations l
where d.department_name = 'Finance';