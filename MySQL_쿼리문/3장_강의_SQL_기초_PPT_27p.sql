-- 3장_강의_SQL_기초_PPT_27p

-- 1. $12,000 이상 버는 사원의 성과 급여를 출력하라.
select last_name, salary
from employees
where salary>=12000;

-- 2. 사원번호 176번인 사원의 성과 이름, 부서번호를 출력하라.
select concat(first_name, " ", last_name) as Employee, department_id
from employees
where employee_id=176;

-- 3. 급여를 $5000 이하 받고 있는 사원의 성과 급여를 출력하라.\
select last_name, salary
from employees
where salary<=5000;

-- 4. 급여를 $12000 이상 받고 있는 사원의 성과 이름, 급여, 부서번호를 출력하라.
select concat(first_name, " ", last_name) as Employee, salary, department_id
from employees
where salary>=12000;

-- 5. 급여를 $5000 이상, $12000 이하로 받고 있는 사원의 사원번호, 성, 급여를 출력하라. 급여가 많은 사람부터 출력되어야 한다.
select employee_id, last_name, salary
from employees
where salary between 5000 and 12000
order by salary desc;

-- 6. 성이 Matos이거나 Taylor인 사원의 성과 시작날짜, Job code를 출력하라. 고용일이 빠른 사람이 먼저 출력되어야 한다.
select last_name, hire_date, job_id
from employees
where last_name='Matos' or last_name='Taylor'
order by hire_date;

-- 7. 부서번호 20과 50 사이인 사원의 성, 부서번호를 출력하라. 성이 알파벳 역순으로 출력되어야 한다.
select last_name, department_id
from employees
where department_id between 20 and 50
order by last_name desc;

-- 8. 50번 부서에서 일하는 사원들이 근무하는 job id를 중복 제거하여 출력하라.
select distinct job_id
from employees
where department_id=50;