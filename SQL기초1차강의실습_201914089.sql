--학번:201914089 이름:오동재

--연습1: select
--1. DEPARTMENTS 테이블의 모든 내용을 출력하라.
select *
from departments;

/*
2. 각 사원 (employee)의 성(last name), job code, 고용일 (hire date),
사원번호(employee number)를 출력하라. 사원번호가 가장 앞에 나와야 한다. HIRE_DATE는 STARTDATE로 출력하라
*/
select employee_id, last_name, job_id, hire_date as startdate
from employees;

--3. 사원들에게 배정된 job code를 출력하라. 중복된 값은 한번만 출력한다.
select distinct job_id
from employees


--4. 가능한 모든 job code를 출력하라. 사원들에게 배정되지 않은 job code도 출력되어야 한다.
select job_id
from jobs;

/*
5. 사원의 이름, 급여를 출력하라. 각 칼럼의 이름은 Employee, Salary이다.
Employee은 성과 이름이 같이 붙어서 하나의 컬럼으로 출력된다.
*/
select first_name||' '||last_name as Employee, salary as "Salary"
from employees;


--6. 부서의 이름과 부서번호를 출력하라.
select department_name, department_id
from departments;


--7. COUNTRIES 테이블에 존재하는 모든 데이터를 출력하라.
select *
from countries;

--연습2: where, order by
--1. $12,000 이상 버는 사원의 성과 급여를 출력하라.
select last_name, salary
from employees
where salary >= 12000;

--2. 사원번호 176번인 사원의 성과 이름, 부서번호를 출력하라.
select last_name, first_name, department_id 
from employees
where employee_id = 176;

--3. 급여를 $5000 이하 받고 있는 사원의 성과 급여를 출력하라.\
select last_name, salary
from employees
where salary <= 5000;

--4. 급여를 $12000 이상 받고 있는 사원의 성과 이름, 급여, 부서번호를 출력하라.
select first_name, last_name, salary, department_id
from employees
where salary >= 12000;

--5. 급여를 $5000 이상, $12000 이하로 받고 있는 사원의 사원번호, 성, 급여를 출력하라. 급여가 많은 사람부터 출력되어야 한다.
select employee_id, last_name, salary
from employees
where salary >= 5000 and salary <= 12000
order by salary desc;

--6. 성이 Matos이거나 Taylor인 사원의 성과 시작날짜, Job code를 출력하라. 고용일이 빠른 사람이 먼저 출력되어야 한다.
select last_name, hire_date, job_id
from employees
where last_name = 'Matos' or last_name = 'Taylor'
order by hire_date;

--7. 부서번호 20과 50 사이인 사원의 성, 부서번호를 출력하라. 성이 알파벳 역순으로 출력되어야 한다.
select last_name, department_id
from employees
where department_id between 20 and 50
order by last_name desc;

--8. 50번 부서에서 일하는 사원들이 근무하는 job id를 중복 제거하여 출력하라.
select distinct job_id
from employees
where department_id = 50;