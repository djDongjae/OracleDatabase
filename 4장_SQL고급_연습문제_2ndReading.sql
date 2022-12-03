--1. 사원의 성과 함께 급여와 commission을 출력하라. 급여는 천의 자리 이상만 출력(반올림)하고, commission은 소수 첫째자리까지만 출력(반올림)하라.
select last_name, round(salary, -3), round(commission_pct, 1)
from employees;

--2. 60번 부서에 속한 사원의 성을 대문자로 출력하라.
select upper(last_name)
from employees
where department_id = 60;

--3. JOB_HISTORY 테이블을 이용하여, 각 사원 번호와 해당 사원의 종료날짜, 종료한 날짜의 2개월 후 달의 마지막 날짜를 출력하라.
select employee_id, end_date, last_day(add_months(end_date, 2))
from job_history;