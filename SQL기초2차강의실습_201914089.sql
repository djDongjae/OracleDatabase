--학번:201914089 이름:오동재

--3.2 집계함수 및 GROUP BY 연습

--1. 사원 급여의 최고, 최저, 합, 평균을 구하라. Maximum, Minimum, Sum, Average로 컬럼 이름을 정한다.
select max(salary) as Maximum, min(salary) as Minimum, sum(salary) as Sum, avg(salary) as Average
from employees;

/*2. 각 JOB마다 사원 급여의 최고, 최저, 합, 평균을 구하라. Maximum, Minimum, Sum, Average로 컬럼 이름을 정한다.
JOB_ID를 포함한다.*/
select job_id, max(salary) as Maximum, min(salary) as Minimum, sum(salary) as Sum, avg(salary) as Average
from employees
group by job_id;

--3. 같은 JOB을 하는 사원의 숫자를 출력하라. JOB_ID를 포함한다.
select job_id, count(*)
from employees
group by job_id;

--4. MANAGER 역할(상사)를 하고 있는 사원의 숫자를 출력하라.
select count(*) 
from employees
where job_id like '%MGR%';

--5. 급여가 $5000 이하인 사원들만 대상으로, 부서번호별 급여의 합을 출력하라.
select department_id, sum(salary)
from employees
where salary <= 5000
group by department_id;

--6. 사원의 수가 5명 이상인 JOB_ID 별로 급여의 최소값을 구하라.
select job_id, min(salary)
from employees
group by job_id
having count(*) >= 5;

/*7. 같은 부서에서 같은 JOB을 수행중인 사원의 숫자를 부서번호별, JOB_ID별로 출력하라.
부서번호가 커지는 순서로 정렬하되, 부서번호가 같은 경우는 JOB_ID가 커지는 순서로 정렬하라.*/
select department_id, job_id, count(*)
from employees 
group by (department_id, job_id)
order by department_id asc, job_id asc;

--8. 급여의 평균이 5000이 넘는 부서를 대상으로, 부서번호와 급여의 합을 구하라.
select department_id, sum(salary)
from employees
group by department_id
having avg(salary) > 5000;

--3.3.1 조인 연습

--1. 100번 이하 부서에 소속된 사원의 사원번호, 성, 부서번호, 부서명을 출력하라
select employees.employee_id, employees.last_name, departments.department_id, departments.department_name
from departments, employees
where departments.department_id <= 100;

/*2. 모든 부서의 주소를 출력한다. location ID, streets address, city, state 또는 province, country를 출력해야한다.
NATURAL JOIN을 사용하라.*/
select location_id, locations.street_address, locations.city, locations.country_id, locations.state_province
from departments
natural join locations;

/*3. Toronto에서 근무하는 사원의 last name, job(job id), department number, department name을 출력하라.*/
select locations.city, employees.last_name, employees.job_id, departments.department_id, department_name
from employees, departments, locations
where departments.location_id = locations.location_id and locations.city = 'Toronto';

--4. 사원의 번호, 성, JOB_CODE, JOB_TITLE을 출력하라.
select employees.employee_id, employees.last_name, jobs.job_id, jobs.job_title
from employees, jobs
where employees.job_id = jobs.job_id;

--5. 모든 부서의 번호, 이름, 부서장의 성을 출력하라.
select departments.department_id, departments.department_name, employees.last_name
from departments, employees
where departments.manager_id = employees.employee_id;

--6. 같은 JOB을 하는 사원의 숫자를 출력하라. JOB의 이름이 출력되어야 한다.
select jobs.job_title, count(*)
from employees, jobs
where employees.job_id = jobs.job_id
group by jobs.job_title;

--7. JOB 이력(history)가 있는 사원의 성과 이름, JOB_HISTORY 기록횟수를 출력하라.
select employees.last_name, employees.first_name, count(*) as "job_history count"
from employees, job_history
where employees.employee_id = job_history.employee_id
group by (employees.last_name, employees.first_name);

--8. 급여가 4000이상인 사원들이 속한 부서의 이름을 중복을 제거하고 출력하라.
select distinct departments.department_name
from employees, departments
where employees.salary >= 4000;

--3.3.1 Outer Join 연습

--1. 사원이 소속되지 않은 부서를 포함하여, 부서이름과 해당 부서에 소속된 사원 이름을 출력하라.
select departments.department_name, employees.first_name, employees.last_name
from departments left outer join employees
on departments.department_id = employees.department_id;

/*2. 업무가 배정되지 않은 사원과 사원이 배정되지 않은 업무를 포함하여,
모든 사원 이름(first_name)과 업무 이름(job_title)을 출력하라.*/
select employees.first_name, jobs.job_title
from employees full outer join jobs
on employees.job_id = jobs.job_id;

--3. 부서가 배치되지 않은 위치(locations)를 포함하여 모든 위치의 도시이름(city)와 부서이름을 출력하라.
select locations.city, departments.department_name
from locations left outer join departments
on locations.location_id = departments.location_id;

/*4. 위치 번호가 1700인 부서중에서,
부서장(manager)이 배치되지 않은 부서를 포함하여, 모든 부서의
부서장의 이름(first_name)과 부서이름을 부서 이름의 역순으로 출력하라.*/
select employees.first_name, departments.department_name
from departments left outer join employees
on departments.manager_id = employees.employee_id
where departments.location_id = 1700
order by employees.first_name desc, departments.department_name desc;

--3.3.2 ~ 3.3.4 부속질의, 집합연산 연습

--1. 최고의 급여를 받고 있는 사원의 first_name을 출력하라.
select first_name
from employees
where salary = (
select max(salary)
from employees
);

--2. 사원의 수가 5명 이상인 부서의 부서 이름을 출력하라.
select department_name
from departments
where department_id in 
(select department_id
from employees
group by department_id
having count(*) >= 5);

--3. 업무 이름에 Purchasing이 들어간 업무를 하고 있는 사원의 first_name을 출력하라.
select first_name
from employees
where job_id in 
(select job_id
from jobs
where job_title like '%Purchasing%');

--4. 소속 사원이 없는 부서의 이름을 출력하라.
select de.department_name
from departments de
where not exists
(
select *
from employees ep
where de.department_id = ep.department_id
);

--5. 배당된 사원이 없는 업무의 이름(job_title)을 출력하라.
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

--6. Shipping 부서와 Human Resources 부서의 부서 이름과 주소(address)를 출력하라. 집합연산을 이용한다.

--7. IT 부서와 Finance 부서 둘 다가 같이 위치한 Country_ID를 출력하라. 집합연산을 이용한다.
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