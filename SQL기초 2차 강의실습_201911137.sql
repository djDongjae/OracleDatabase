/*
작성자: 201911137 강두오
작성일: 2022. 10. 26

3장 3.2.1부터 3.3.4까지의 연습문제(HR 스키마를 대상으로 제시된 연습문제)를 풀이하여 제출합니다.


주제: 집계 함수, GROUP BY

[문제]
사원 급여의 최고, 최저, 합, 평균을 구하라. Maximum, Minimum, Sum, Average로 컬럼 이름을 정한다.
각 JOB마다 사원 급여의 최고, 최저, 합, 평균을 구하라. Maximum, Minimum, Sum, Average로 컬럼 이름을 정한다. JOB_ID를 포함한다.
같은 JOB을 하는 사원의 숫자를 출력하라. JOB_ID를 포함한다.
MANAGER 역할(상사)을 하고 있는 사원의 숫자를 출력하라.(부서의 상사가 아니다.)
급여가 $5000 이하인 사원들만 대상으로, 부서번호별 급여의 합을 출력하라.
사원의 수가 5명 이상인 JOB_ID 별로 급여의 최소값을 구하라.
같은 부서에서 같은 JOB을 수행중인 사원의 숫자를 부서번호별, JOB_ID별로 출력하라. 부서번호가 커지는 순서로 정렬하되, 부서번호가 같은 경우는 JOB_ID가 커지는 순서로 정렬하라.
급여의 평균이 5000이 넘는 부서를 대상으로, 부서번호와 급여의 합을 구하라.
*/

-- 1. 사원 급여의 최고, 최저, 합, 평균을 구하라. Maximum, Minimum, Sum, Average로 컬럼 이름을 정한다.
select MAX(salary) as "Maximum", MIN(salary) as "Minimum", SUM(salary) as "Sum", AVG(salary) as "Average"
from Employees;


/*
 2. 각 JOB마다 사원 급여의 최고, 최저, 합, 평균을 구하라.
Maximum, Minimum, Sum, Average로 컬럼 이름을 정한다. JOB_ID를 포함한다.
*/
select job_id, MAX(salary) as "Maximum", MIN(salary) as "Minimum", SUM(salary) as "Sum", AVG(salary) as "Average"
from Employees
group by job_id;


-- 3. 같은 JOB을 하는 사원의 숫자를 출력하라. JOB_ID를 포함한다.
select job_id, count(*)
from Employees
group by job_id;


-- 4. MANAGER 역할(상사)을 하고 있는 사원의 숫자를 출력하라.(부서의 상사가 아니다.)
select count(distinct manager_id)
from Employees;


-- 5. 급여가 $5000 이하인 사원들만 대상으로, 부서번호별 급여의 합을 출력하라.
select department_id, SUM(salary)
from Employees
where salary <= 5000
group by department_id;


-- 6. 사원의 수가 5명 이상인 JOB_ID 별로 급여의 최소값을 구하라.
select job_id, MIN(salary)
from Employees
group by job_id
having count(*) >= 5;


/*
7. 같은 부서에서 같은 JOB을 수행중인 사원의 숫자를 부서번호별, JOB_ID별로 출력하라.
부서번호가 커지는 순서로 정렬하되, 부서번호가 같은 경우는 JOB_ID가 커지는 순서로 정렬하라.
*/
select department_id, job_id, count(*)
from Employees
group by department_id, job_id
order by department_id, job_id;


-- 8. 급여의 평균이 5000이 넘는 부서를 대상으로, 부서번호와 급여의 합을 구하라.
select department_id, SUM(salary)
from Employees
group by department_id
having AVG(salary) > 5000;


/*
주제: 조인

[문제]
100번 이하 부서에 소속된 사원의 사원번호, 성, 부서번호, 부서명을 출력하라.
모든 부서의 주소를 출력한다. location ID, street address, city, state 또는 province, country를 출력해야 한다. NATURAL JOIN을 사용하라.
Toronto에서 근무하는 사원의 last name, job(job id), department number, department name을 출력하라.
사원의 번호, 성, JOB_CODE, JOB_TITLE을 출력하라.
모든 부서의 번호, 이름, 부서장의 성을 출력하라.
같은 JOB을 하는 사원의 숫자를 출력하라. JOB의 이름이 출력되어야 한다.
JOB 이력(history)가 있는 사원의 사원 성과 이름, JOB_HISTORY 기록 횟수를 출력하라.
급여가 4000 이상인 사원들이 속한 부서의 이름을 중복을 제거하고 출력하라.
*/

-- 1. 100번 이하 부서에 소속된 사원의 사원번호, 성, 부서번호, 부서명을 출력하라.
select employee_id, last_name, e.department_id, department_name
from Employees e, Departments d
where e.department_id = d.department_id
    and e.department_id <= 100;


/*
2. 모든 부서의 주소를 출력한다.
location ID, street address, city, state 또는 province, country를 출력해야 한다.
NATURAL JOIN을 사용하라.
*/
select location_id, street_address, city, state_province, country_id
from Departments natural join Locations;


-- 3. Toronto에서 근무하는 사원의 last name, job(job id), department number, department name을 출력하라.
select last_name, job_id, department_id, department_name
from Departments d join Employees e
    using (department_id)
    natural join Locations l
where l.city = 'Toronto';


-- 4. 사원의 번호, 성, JOB_CODE, JOB_TITLE을 출력하라.
select employee_id, last_name, job_id, job_title
from Employees join Jobs
    using (job_id);
    
select employee_id, last_name, job_id, job_title
from Employees natural join Jobs;


-- 5. 모든 부서의 번호, 이름, 부서장의 성을 출력하라.
select d.department_id, d.department_name, e.last_name
from Departments d join Employees e
    on d.manager_id = e.employee_id;


-- 6. 같은 JOB을 하는 사원의 숫자를 출력하라. JOB의 이름이 출력되어야 한다.
select job_title, COUNT(*)
from Employees join Jobs
    using (job_id)
group by job_title;


-- 7. JOB 이력(history)가 있는 사원의 사원 성과 이름, JOB_HISTORY 기록 횟수를 출력하라.
select last_name, first_name, COUNT(*)
from Employees join Job_history
    using (employee_id)
group by last_name, first_name;


-- 8. 급여가 4000 이상인 사원들이 속한 부서의 이름을 중복을 제거하고 출력하라.
select distinct department_name
from Employees join Departments
    using (department_id)
where salary >= 4000;


/*
주제: Outer Join

[문제]
사원이 소속되지 않은 부서를 포함하여, 부서이름과 해당 부서에 소속된 사원 이름(first_name)을 출력하라.
업무가 배정되지 않은 사원과 사원이 배정되지 않은 업무를 포함하여, 모든 사원 이름(first_name)과 업무 이름(job_title)을 출력하라.
부서가 배치되지 않은 위치(locations)를 포함하여 모든 위치의 도시이름(city)와 부서이름을 출력하라.
위치 번호가 1700인 부서중에서, 부서장(manager)이 배치되지 않은 부서를 포함하여, 모든 부서의 부서장의 이름(first_name)과 부서이름을 부서 이름의 역순으로 출력하라.
*/

/*
1. 사원이 소속되지 않은 부서를 포함하여,
부서이름과 해당 부서에 소속된 사원 이름(first_name)을 출력하라.
*/
select department_name, first_name
from Departments d left outer join Employees e
    on d.department_id = e.department_id;

select department_name, first_name
from Departments d left outer join Employees e
    using (department_id);


/*
2. 업무가 배정되지 않은 사원과 사원이 배정되지 않은 업무를 포함하여,
모든 사원 이름(first_name)과 업무 이름(job_title)을 출력하라.
*/
select e.first_name, job_title
from Employees e full outer join Jobs j
    on e.job_id = j.job_id;
    
select e.first_name, job_title
from Employees e full outer join Jobs j
    using (job_id);


-- 3. 부서가 배치되지 않은 위치(locations)를 포함하여 모든 위치의 도시이름(city)와 부서이름을 출력하라.
select city, department_name
from Locations l left outer join Departments d
    on l.location_id = d.location_id;
    
select city, department_name
from Locations l left outer join Departments d
    using (location_id);


/*
4. 위치 번호가 1700인 부서중에서, 부서장(manager)이 배치되지 않은 부서를 포함하여,
모든 부서의 부서장의 이름(first_name)과 부서이름을 부서 이름의 역순으로 출력하라.
*/
select first_name, department_name
from Departments d left outer join Employees e
    on d.manager_id = e.employee_id
where location_id = 1700
order by department_name desc;


/*
주제: 부속질의, 집합연산

[문제]
(부속 질의)
최고의 급여를 받고 있는 사원의 first_name을 출력하라.
사원의 수가 5명 이상인 부서의 부서 이름을 출력하라.
업무 이름에 Purchasing이 들어간 업무를 하고 있는 사원의 first_name을 출력하라.
소속 사원이 없는 부서의 이름을 출력하라.

(집합연산)
배당된 사원이 없는 업무의 이름(job_title)을 출력하라.
Shipping 부서와 Human Resources 부서의 부서 이름과 주소(address)를 출력하라. 집합연산을 이용한다.
IT 부서와 Finance 부서 둘 다가 같이 위치한 Country_ID를 출력하라. 집합연산을 이용한다.
*/

-- 1. 최고의 급여를 받고 있는 사원의 first_name을 출력하라.
select first_name
from Employees
where salary = (select MAX(salary)
                from Employees);


-- 2. 사원의 수가 5명 이상인 부서의 부서 이름을 출력하라.
select department_name
from Departments
where department_id IN (select department_id 
                        from Employees
                        group by department_id
                        having COUNT(*) >= 5);


-- 3. 업무 이름에 Purchasing이 들어간 업무를 하고 있는 사원의 first_name을 출력하라.
select first_name
from Employees
where job_id IN (select job_id
                from Jobs
                where job_title like '%Purchasing%');


-- 4. 소속 사원이 없는 부서의 이름을 출력하라.
select department_name
from Departments
where department_id NOT IN (select department_id
                            from Employees);


-- 5. 배당된 사원이 없는 업무의 이름(job_title)을 출력하라.
select job_title
from Jobs
MINUS
select job_title
from Jobs
where job_id IN (select job_id
                from Employees);


/*
6. Shipping 부서와 Human Resources 부서의 부서 이름과 주소(address)를 출력하라. 
집합연산을 이용한다.
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


-- 7. IT 부서와 Finance 부서 둘 다가 같이 위치한 Country_ID를 출력하라. 집합연산을 이용한다.
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

