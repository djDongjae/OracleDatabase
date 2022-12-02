---3.3.1 조인 연습

--1. 100번 이하 부서에 소속된 사원의 사원번호, 성, 부서번호, 부서명을 출력하라.
select employee_id, employees.first_name, employees.department_id, departments.department_name
from departments, employees
where departments.department_id <= 100;

/*2. 모든 부서의 주소를 출력한다. location ID, streets address, city, state 또는 province, country를 출력해야한다.
NATURAL JOIN을 사용하라.*/
select department_id, location_id, street_address, city, state_province, country_id
from departments
natural join locations
order by department_id asc;

/*3. Toronto에서 근무하는 사원의 last name, job(job id), department number, department name을 출력하라.*/

--4. 사원의 번호, 성, JOB_CODE, JOB_TITLE을 출력하라.
select employee_id, last_name ,employees.job_id, job_title
from employees, jobs
where employees.job_id = jobs.job_id;

--5. 모든 부서의 번호, 이름, 부서장의 성을 출력하라.
select departments.department_id, departments.department_name, employees.last_name
from employees, departments
where departments.manager_id = employees.employee_id;

--6. 같은 JOB을 하는 사원의 숫자를 출력하라. JOB의 이름이 출력되어야 한다.
select job_title, count(*)
from employees
natural join jobs
group by job_title;

--7. JOB 이력(history)가 있는 사원의 성과 이름, JOB_HISTORY 기록횟수를 출력하라.
select employees.first_name, employees.last_name, count(*)
from employees, job_history
where employees.job_id = job_history.job_id
group by (employees.first_name, employees.last_name);

--8. 급여가 4000이상인 사원들이 속한 부서의 이름을 중복을 제거하고 출력하라.
select distinct department_name 
from employees natural join departments
where salary >= 4000;

--3.3.1 Outer Join 연습

--1. 사원이 소속되지 않은 부서를 포함하여, 부서이름과 해당 부서에 소속된 사원 이름을 출력하라.
select d.department_name, e.last_name
from departments d left outer join employees e
on d.department_id = e.department_id;

select d.department_name, e.last_name
from departments d left outer join employees e
using (department_id);

/*
2. 업무가 배정되지 않은 사원과 사원이 배정되지 않은 업무를 포함하여,
모든 사원 이름(first_name)과 업무 이름(job_title)을 출력하라.
*/
select e.first_name, j.job_title
from employees e full outer join jobs j
using (job_id);

-- 3. 부서가 배치되지 않은 위치(locations)를 포함하여 모든 위치의 도시이름(city)와 부서이름을 출력하라.
select l.city, d.department_name
from locations l left outer join departments d
using (location_id);

/*
4. 위치 번호가 1700인 부서중에서, 부서장(manager)이 배치되지 않은 부서를 포함하여,
모든 부서의 부서장의 이름(first_name)과 부서이름을 부서 이름의 역순으로 출력하라.
*/
select e.first_name, d.department_name
from departments d left outer join employees e
on e.employee_id = d.manager_id
where d.location_id = 1700
order by d.department_name desc;

--주제: 부속질의, 집합연산

--1. 최고의 급여를 받고 있는 사원의 first_name을 출력하라.
select first_name
from employees
where salary = (select max(salary) from employees);

--2. 사원의 수가 5명 이상인 부서의 부서 이름을 출력하라.
select department_name
from departments
where department_id in (
    select department_id
    from employees
    group by department_id
    having count(*) >= 5
);

--3. 업무 이름에 Purchasing이 들어간 업무를 하고 있는 사원의 first_name을 출력하라.
select first_name
from employees
where job_id in (
    select job_id
    from jobs
    where job_title like '%Purchasing%'
);

--4. 소속 사원이 없는 부서의 이름을 출력하라.
select department_name
from departments
where department_id not in (
    select distinct department_id
    from employees
);

--(집합 연산)

--1. 배당된 사원이 없는 업무의 이름(job_title)을 출력하라.
select job_title
from jobs
minus
select job_title
from jobs
where job_id in (
    select job_id
    from employees
);

--2. Shipping 부서와 Human Resources 부서의 부서 이름과 주소(address)를 출력하라. 집합연산을 이용한다.
select d.department_name, l.street_address
from departments d, locations l
where d.department_name = 'Shipping'
union
select d.department_name, l.street_address
from departments d, locations l
where d.department_name = 'Human Resources';

--3. IT 부서와 Finance 부서 둘 다가 같이 위치한 Country_ID를 출력하라. 집합연산을 이용한다.
select l.country_id
from departments d, locations l
where d.department_name = 'IT'
intersect
select l.country_id
from departments d, locations l
where d.department_name = 'Finance';