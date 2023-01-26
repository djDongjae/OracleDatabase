-- 3장_강의_SQL_기초_PPT_34p

-- 1. 사원 급여의 최고, 최저, 합, 평균을 구하라. Maximum, Minimum, Sum, Average로 컬럼 이름을 정한다.
select max(salary) as Maximum, min(salary) as Minimum, sum(salary) as Sum, avg(salary) as Average
from employees;

/*
 2. 각 JOB마다 사원 급여의 최고, 최저, 합, 평균을 구하라.
Maximum, Minimum, Sum, Average로 컬럼 이름을 정한다. JOB_ID를 포함한다.
*/
select job_id, max(salary) as Maximum, min(salary) as Minimum, sum(salary) as Sum, avg(salary) as Average
from employees
group by job_id;

-- 3. 같은 JOB을 하는 사원의 숫자를 출력하라. JOB_ID를 포함한다.
select job_id, count(*)
from employees
group by job_id;

-- 4. MANAGER 역할(상사)을 하고 있는 사원의 숫자를 출력하라.(부서의 상사가 아니다.)
select count(*)
from employees
where job_id like '%MGR%';

-- 5. 급여가 $5000 이하인 사원들만 대상으로, 부서번호별 급여의 합을 출력하라.
select department_id, sum(salary)
from employees
where salary<=5000
group by department_id;

-- 6. 사원의 수가 5명 이상인 JOB_ID 별로 급여의 최소값을 구하라.
select job_id, min(salary)
from employees
group by job_id
having count(*)>=5;

/*
7. 같은 부서에서 같은 JOB을 수행중인 사원의 숫자를 부서번호별, JOB_ID별로 출력하라.
부서번호가 커지는 순서로 정렬하되, 부서번호가 같은 경우는 JOB_ID가 커지는 순서로 정렬하라.
*/
select department_id, job_id, count(*)
from employees
group by department_id, job_id
order by department_id, job_id;

-- 8. 급여의 평균이 5000이 넘는 부서를 대상으로, 부서번호와 급여의 합을 구하라.
select department_id, sum(salary)
from employees
group by department_id
having sum(salary)>=5000;