/*
�ۼ���: 201911137 ���ο�
�ۼ���: 2022. 10. 26

3�� 3.2.1���� 3.3.4������ ��������(HR ��Ű���� ������� ���õ� ��������)�� Ǯ���Ͽ� �����մϴ�.


����: ���� �Լ�, GROUP BY

[����]
��� �޿��� �ְ�, ����, ��, ����� ���϶�. Maximum, Minimum, Sum, Average�� �÷� �̸��� ���Ѵ�.
�� JOB���� ��� �޿��� �ְ�, ����, ��, ����� ���϶�. Maximum, Minimum, Sum, Average�� �÷� �̸��� ���Ѵ�. JOB_ID�� �����Ѵ�.
���� JOB�� �ϴ� ����� ���ڸ� ����϶�. JOB_ID�� �����Ѵ�.
MANAGER ����(���)�� �ϰ� �ִ� ����� ���ڸ� ����϶�.(�μ��� ��簡 �ƴϴ�.)
�޿��� $5000 ������ ����鸸 �������, �μ���ȣ�� �޿��� ���� ����϶�.
����� ���� 5�� �̻��� JOB_ID ���� �޿��� �ּҰ��� ���϶�.
���� �μ����� ���� JOB�� �������� ����� ���ڸ� �μ���ȣ��, JOB_ID���� ����϶�. �μ���ȣ�� Ŀ���� ������ �����ϵ�, �μ���ȣ�� ���� ���� JOB_ID�� Ŀ���� ������ �����϶�.
�޿��� ����� 5000�� �Ѵ� �μ��� �������, �μ���ȣ�� �޿��� ���� ���϶�.
*/

-- 1. ��� �޿��� �ְ�, ����, ��, ����� ���϶�. Maximum, Minimum, Sum, Average�� �÷� �̸��� ���Ѵ�.
select MAX(salary) as "Maximum", MIN(salary) as "Minimum", SUM(salary) as "Sum", AVG(salary) as "Average"
from Employees;


/*
 2. �� JOB���� ��� �޿��� �ְ�, ����, ��, ����� ���϶�.
Maximum, Minimum, Sum, Average�� �÷� �̸��� ���Ѵ�. JOB_ID�� �����Ѵ�.
*/
select job_id, MAX(salary) as "Maximum", MIN(salary) as "Minimum", SUM(salary) as "Sum", AVG(salary) as "Average"
from Employees
group by job_id;


-- 3. ���� JOB�� �ϴ� ����� ���ڸ� ����϶�. JOB_ID�� �����Ѵ�.
select job_id, count(*)
from Employees
group by job_id;


-- 4. MANAGER ����(���)�� �ϰ� �ִ� ����� ���ڸ� ����϶�.(�μ��� ��簡 �ƴϴ�.)
select count(distinct manager_id)
from Employees;


-- 5. �޿��� $5000 ������ ����鸸 �������, �μ���ȣ�� �޿��� ���� ����϶�.
select department_id, SUM(salary)
from Employees
where salary <= 5000
group by department_id;


-- 6. ����� ���� 5�� �̻��� JOB_ID ���� �޿��� �ּҰ��� ���϶�.
select job_id, MIN(salary)
from Employees
group by job_id
having count(*) >= 5;


/*
7. ���� �μ����� ���� JOB�� �������� ����� ���ڸ� �μ���ȣ��, JOB_ID���� ����϶�.
�μ���ȣ�� Ŀ���� ������ �����ϵ�, �μ���ȣ�� ���� ���� JOB_ID�� Ŀ���� ������ �����϶�.
*/
select department_id, job_id, count(*)
from Employees
group by department_id, job_id
order by department_id, job_id;


-- 8. �޿��� ����� 5000�� �Ѵ� �μ��� �������, �μ���ȣ�� �޿��� ���� ���϶�.
select department_id, SUM(salary)
from Employees
group by department_id
having AVG(salary) > 5000;


/*
����: ����

[����]
100�� ���� �μ��� �Ҽӵ� ����� �����ȣ, ��, �μ���ȣ, �μ����� ����϶�.
��� �μ��� �ּҸ� ����Ѵ�. location ID, street address, city, state �Ǵ� province, country�� ����ؾ� �Ѵ�. NATURAL JOIN�� ����϶�.
Toronto���� �ٹ��ϴ� ����� last name, job(job id), department number, department name�� ����϶�.
����� ��ȣ, ��, JOB_CODE, JOB_TITLE�� ����϶�.
��� �μ��� ��ȣ, �̸�, �μ����� ���� ����϶�.
���� JOB�� �ϴ� ����� ���ڸ� ����϶�. JOB�� �̸��� ��µǾ�� �Ѵ�.
JOB �̷�(history)�� �ִ� ����� ��� ���� �̸�, JOB_HISTORY ��� Ƚ���� ����϶�.
�޿��� 4000 �̻��� ������� ���� �μ��� �̸��� �ߺ��� �����ϰ� ����϶�.
*/

-- 1. 100�� ���� �μ��� �Ҽӵ� ����� �����ȣ, ��, �μ���ȣ, �μ����� ����϶�.
select employee_id, last_name, e.department_id, department_name
from Employees e, Departments d
where e.department_id = d.department_id
    and e.department_id <= 100;


/*
2. ��� �μ��� �ּҸ� ����Ѵ�.
location ID, street address, city, state �Ǵ� province, country�� ����ؾ� �Ѵ�.
NATURAL JOIN�� ����϶�.
*/
select location_id, street_address, city, state_province, country_id
from Departments natural join Locations;


-- 3. Toronto���� �ٹ��ϴ� ����� last name, job(job id), department number, department name�� ����϶�.
select last_name, job_id, department_id, department_name
from Departments d join Employees e
    using (department_id)
    natural join Locations l
where l.city = 'Toronto';


-- 4. ����� ��ȣ, ��, JOB_CODE, JOB_TITLE�� ����϶�.
select employee_id, last_name, job_id, job_title
from Employees join Jobs
    using (job_id);
    
select employee_id, last_name, job_id, job_title
from Employees natural join Jobs;


-- 5. ��� �μ��� ��ȣ, �̸�, �μ����� ���� ����϶�.
select d.department_id, d.department_name, e.last_name
from Departments d join Employees e
    on d.manager_id = e.employee_id;


-- 6. ���� JOB�� �ϴ� ����� ���ڸ� ����϶�. JOB�� �̸��� ��µǾ�� �Ѵ�.
select job_title, COUNT(*)
from Employees join Jobs
    using (job_id)
group by job_title;


-- 7. JOB �̷�(history)�� �ִ� ����� ��� ���� �̸�, JOB_HISTORY ��� Ƚ���� ����϶�.
select last_name, first_name, COUNT(*)
from Employees join Job_history
    using (employee_id)
group by last_name, first_name;


-- 8. �޿��� 4000 �̻��� ������� ���� �μ��� �̸��� �ߺ��� �����ϰ� ����϶�.
select distinct department_name
from Employees join Departments
    using (department_id)
where salary >= 4000;


/*
����: Outer Join

[����]
����� �Ҽӵ��� ���� �μ��� �����Ͽ�, �μ��̸��� �ش� �μ��� �Ҽӵ� ��� �̸�(first_name)�� ����϶�.
������ �������� ���� ����� ����� �������� ���� ������ �����Ͽ�, ��� ��� �̸�(first_name)�� ���� �̸�(job_title)�� ����϶�.
�μ��� ��ġ���� ���� ��ġ(locations)�� �����Ͽ� ��� ��ġ�� �����̸�(city)�� �μ��̸��� ����϶�.
��ġ ��ȣ�� 1700�� �μ��߿���, �μ���(manager)�� ��ġ���� ���� �μ��� �����Ͽ�, ��� �μ��� �μ����� �̸�(first_name)�� �μ��̸��� �μ� �̸��� �������� ����϶�.
*/

/*
1. ����� �Ҽӵ��� ���� �μ��� �����Ͽ�,
�μ��̸��� �ش� �μ��� �Ҽӵ� ��� �̸�(first_name)�� ����϶�.
*/
select department_name, first_name
from Departments d left outer join Employees e
    on d.department_id = e.department_id;

select department_name, first_name
from Departments d left outer join Employees e
    using (department_id);


/*
2. ������ �������� ���� ����� ����� �������� ���� ������ �����Ͽ�,
��� ��� �̸�(first_name)�� ���� �̸�(job_title)�� ����϶�.
*/
select e.first_name, job_title
from Employees e full outer join Jobs j
    on e.job_id = j.job_id;
    
select e.first_name, job_title
from Employees e full outer join Jobs j
    using (job_id);


-- 3. �μ��� ��ġ���� ���� ��ġ(locations)�� �����Ͽ� ��� ��ġ�� �����̸�(city)�� �μ��̸��� ����϶�.
select city, department_name
from Locations l left outer join Departments d
    on l.location_id = d.location_id;
    
select city, department_name
from Locations l left outer join Departments d
    using (location_id);


/*
4. ��ġ ��ȣ�� 1700�� �μ��߿���, �μ���(manager)�� ��ġ���� ���� �μ��� �����Ͽ�,
��� �μ��� �μ����� �̸�(first_name)�� �μ��̸��� �μ� �̸��� �������� ����϶�.
*/
select first_name, department_name
from Departments d left outer join Employees e
    on d.manager_id = e.employee_id
where location_id = 1700
order by department_name desc;


/*
����: �μ�����, ���տ���

[����]
(�μ� ����)
�ְ��� �޿��� �ް� �ִ� ����� first_name�� ����϶�.
����� ���� 5�� �̻��� �μ��� �μ� �̸��� ����϶�.
���� �̸��� Purchasing�� �� ������ �ϰ� �ִ� ����� first_name�� ����϶�.
�Ҽ� ����� ���� �μ��� �̸��� ����϶�.

(���տ���)
���� ����� ���� ������ �̸�(job_title)�� ����϶�.
Shipping �μ��� Human Resources �μ��� �μ� �̸��� �ּ�(address)�� ����϶�. ���տ����� �̿��Ѵ�.
IT �μ��� Finance �μ� �� �ٰ� ���� ��ġ�� Country_ID�� ����϶�. ���տ����� �̿��Ѵ�.
*/

-- 1. �ְ��� �޿��� �ް� �ִ� ����� first_name�� ����϶�.
select first_name
from Employees
where salary = (select MAX(salary)
                from Employees);


-- 2. ����� ���� 5�� �̻��� �μ��� �μ� �̸��� ����϶�.
select department_name
from Departments
where department_id IN (select department_id 
                        from Employees
                        group by department_id
                        having COUNT(*) >= 5);


-- 3. ���� �̸��� Purchasing�� �� ������ �ϰ� �ִ� ����� first_name�� ����϶�.
select first_name
from Employees
where job_id IN (select job_id
                from Jobs
                where job_title like '%Purchasing%');


-- 4. �Ҽ� ����� ���� �μ��� �̸��� ����϶�.
select department_name
from Departments
where department_id NOT IN (select department_id
                            from Employees);


-- 5. ���� ����� ���� ������ �̸�(job_title)�� ����϶�.
select job_title
from Jobs
MINUS
select job_title
from Jobs
where job_id IN (select job_id
                from Employees);


/*
6. Shipping �μ��� Human Resources �μ��� �μ� �̸��� �ּ�(address)�� ����϶�. 
���տ����� �̿��Ѵ�.
*/
select department_name, street_address
from Departments natural join Locations
where department_name = 'Shipping'
UNION
select department_name, street_address
from Departments natural join Locations
where department_name = 'Human Resources';

select department_name, street_address
from Departments natural join Locations
where department_name = 'Shipping' or department_name = 'Human Resources';

select department_name, street_address
from Departments natural join Locations
where department_name IN ('Shipping', 'Human Resources');


-- 7. IT �μ��� Finance �μ� �� �ٰ� ���� ��ġ�� Country_ID�� ����϶�. ���տ����� �̿��Ѵ�.
select country_id
from Departments join Locations
    using (location_id)
where department_name = 'IT'
INTERSECT
select country_id
from Departments join Locations
    using (location_id)
where department_name = 'Finance';

select distinct country_id
from Locations l
where country_id in (select country_id from Locations l1 natural join Departments where department_name = 'IT')
and country_id in (select country_id from Locations l1 natural join Departments where department_name = 'Finance');

