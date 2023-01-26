-- 3장_강의_SQL_기초_PPT_19p

-- 1. DEPARTMENTS 테이블의 모든 내용을 출력하라
select *
from departments;

/*
2. 각 사원 (EMpLoYEE)의 성(last name), job code, 고용일 (hire date),
사원번호(employee number)를 출력하라. 사원번호가 가장 앞에 나와야 한다. HIRE_DATE는 STARTDATE로 출력하라
*/
select employee_id, last_name, job_id, hire_date as STARTDATE
FROM EMPLOYEES;

-- 3. 사원들에게 배정된 job code를 출력하라. 중복된 값은 한번만 출력한다.
Select DISTINCT job_id
from empLOyees;

-- 4. 가능한 모든 job code를 출력하라. 사원들에게 배정되지 않은 job code도 출력되어야 한다.
select job_id
from jobs;

/*
5. 사원의 이름, 급여를 출력하라. 각 칼럼의 이름은 EMPlOYEE, SAlary이다.
EMPLoyee은 성과 이름이 같이 붙어서 하나의 컬럼으로 출력된다.
*/
select concat(first_name, " ", last_name) as Employee, salary as "Salary"
from employees;

-- 6. 부서의 이름과 부서번호를 출력하라.
select department_name, department_id
from departments;

-- 7. COUNTRIES 테이블에 존재하는 모든 데이터를 출력하라.
select *
from countries;