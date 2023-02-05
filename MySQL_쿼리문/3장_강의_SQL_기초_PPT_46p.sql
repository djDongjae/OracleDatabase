-- 3.3.1 Outer Join 연습

-- 1. 사원이 소속되지 않은 부서를 포함하여, 부서이름과 해당 부서에 소속된 사원 이름을 출력하라.
select d.department_name, e.last_name
from departments d left outer join employees e
on d.department_id = e.department_id;

/*
2. 업무가 배정되지 않은 사원과 사원이 배정되지 않은 업무를 포함하여,
모든 사원 이름(first_name)과 업무 이름(job_title)을 출력하라.
*/
select e.first_name, j.job_title
from employees e left outer join jobs j
on e.job_id = j.job_id
union
select e.first_name, j.job_title
from employees e right outer join jobs j
on e.job_id = j.job_id;

-- 3. 부서가 배치되지 않은 위치(locations)를 포함하여 모든 위치의 도시이름(city)와 부서이름을 출력하라.
select l.city, d.department_name
from locations l left outer join departments d
on l.location_id = d.location_id;

/*
4. 위치 번호가 1700인 부서중에서, 부서장(manager)이 배치되지 않은 부서를 포함하여,
모든 부서의 부서장의 이름(first_name)과 부서이름을 부서 이름의 역순으로 출력하라.
*/
select e.first_name, d.department_name
from departments d left outer join employees e
on d.manager_id = e.employee_id
order by d.department_name desc;
