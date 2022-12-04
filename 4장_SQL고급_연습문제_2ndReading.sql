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

--4. 사원번호가 200번대인 사원의 사원번호, 고용날짜를 출력하라. 날짜는 연. 월. 일. 요일을 출력한다.
select employee_id, to_char(hire_date, 'yyyy.mm.dd.dy')
from employees
where employee_id >= 200 and employee_id < 300;

--5. 2005.03.01이전에 고용된 사원의 성, 고용일을 출력하라. 이 질의는 NLS_LANG 변수가 어떤 변수로 설정되어도 작동할 수 있도록 하라.
select last_name, hire_date
from employees
where hire_date < to_date('2005.03.01', 'yyyy.mm.dd');

/*
6. 연봉은 12개월 급여에 commission_pct만큼을 추가하여 지급된다.
commission이 NULL인 경우 0으로 간주하여 연봉을 계산한 후, 사원의
사원번호와 연봉(YEAR_SAL)을 연봉이 커지는 순서로 출력하라.
*/
select employee_id, 12 * (salary + nvl(commission_pct, 0)) "year_sal"
from employees
order by "year_sal";

--7. commission이 설정되어 있는 사원의 사원 번호와 commission_pct를, commission_pct가 가장 큰 사원부터 출력하라.
select employee_id, commission_pct
from employees
where commission_pct is not null
order by commission_pct desc;

--view 연습

/*
1. 사원번호, 사원이름(first_name과 last_name을 빈칸을 넣어 붙여서
EMPLOYEE라는 컬럼으로 표시), 부서 번호를 가지는 뷰 EMPLOYEE_VU를 생
성하라.
*/
create view employee_vu
as select employee_id, first_name ||' '|| last_name as employee, department_id
from employees;

--2. EMPLOYEE_VU를 이용하여, 사원이름과 해당 사원이 소속된 부서를 출력하라.
select employee, department_id
from employee_vu;