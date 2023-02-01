-- 1. 100번 이하 부서에 소속된 사원의 사원번호, 성, 부서번호, 부서명을 출력하라.
select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id
	and e.department_id <= 100;

/*
2. 모든 부서의 주소를 출력한다.
location ID, street address, city, state 또는 province, country를 출력해야 한다.
NATURAL JOIN을 사용하라.
*/
select department_id, location_id, street_address, city, state_province, country_id
from departments natural join locations
order by department_id;

-- 3. Toronto에서 근무하는 사원의 last name, job(job id), department number, department name을 출력하라.
select e.last_name, e.job_id, e.department_id, d.department_name
from employees e, departments d
where e.department_id = (
	select department_id
    from locations NATURAL join departments
    where city = 'Toronto'
);
	

-- 4. 사원의 번호, 성, JOB_CODE, JOB_TITLE을 출력하라.
-- 5. 모든 부서의 번호, 이름, 부서장의 성을 출력하라.
-- 6. 같은 JOB을 하는 사원의 숫자를 출력하라. JOB의 이름이 출력되어야 한다.
-- 7. JOB 이력(history)가 있는 사원의 사원 성과 이름, JOB_HISTORY 기록 횟수를 출력하라.
-- 8. 급여가 4000 이상인 사원들이 속한 부서의 이름을 중복을 제거하고 출력하라.