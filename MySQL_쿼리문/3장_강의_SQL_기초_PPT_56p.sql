-- 주제: 부속질의, 집합연산

-- 1. 최고의 급여를 받고 있는 사원의 first_name을 출력하라.
select first_name
from employees
where salary = (
	select max(salary)
    from employees
);

-- 2. 사원의 수가 5명 이상인 부서의 부서 이름을 출력하라.
select department_name
from departments
where department_id in (
	select d.department_id
    from departments d, employees e
    where d.department_id = e.department_id
    group by d.department_id
    having count(*) >= 5
);

-- 3. 업무 이름에 Purchasing이 들어간 업무를 하고 있는 사원의 first_name을 출력하라.
select first_name
from employees
where job_id in (
	select job_id
    from jobs
    where job_title like '%Purchasing%'
);

-- 4. 소속 사원이 없는 부서의 이름을 출력하라.
select department_name
from departments
where department_id not in (
	select distinct department_id
    from employees
);

-- (집합 연산)

-- 1. 배당된 사원이 없는 업무의 이름(job_title)을 출력하라.
select job_title
from jobs
where job_id not in (
	select distinct job_id
    from employees
);

-- 2. Shipping 부서와 Human Resources 부서의 부서 이름과 주소(address)를 출력하라. 집합연산을 이용한다.
select d.department_name, l.street_address
from departments d, locations l
where d.location_id = l.location_id and d.department_name = 'Shipping'
union
select d.department_name, l.street_address
from departments d, locations l
where d.location_id = l.location_id and d.department_name = 'Human Resources';

-- 3. IT 부서와 Finance 부서 둘 다가 같이 위치한 Country_ID를 출력하라. 집합연산을 이용한다.
select a.country_id
from (	
    select l.country_id
	from departments d, locations l
	where d.location_id = l.location_id and d.department_name = 'IT'
) a, (	
    select l.country_id
	from departments d, locations l
	where d.location_id = l.location_id and d.department_name = 'Finance'
) b
where a.country_id = b.country_id;