--1. ����� ���� �Բ� �޿��� commission�� ����϶�. �޿��� õ�� �ڸ� �̻� ���(�ݿø�)�ϰ�, commission�� �Ҽ� ù°�ڸ������� ���(�ݿø�)�϶�.
select last_name, round(salary, -3), round(commission_pct, 1)
from employees;

--2. 60�� �μ��� ���� ����� ���� �빮�ڷ� ����϶�.
select upper(last_name)
from employees
where department_id = 60;

--3. JOB_HISTORY ���̺��� �̿��Ͽ�, �� ��� ��ȣ�� �ش� ����� ���ᳯ¥, ������ ��¥�� 2���� �� ���� ������ ��¥�� ����϶�.
select employee_id, end_date, last_day(add_months(end_date, 2))
from job_history;

--4. �����ȣ�� 200������ ����� �����ȣ, ��볯¥�� ����϶�. ��¥�� ��. ��. ��. ������ ����Ѵ�.
select employee_id, to_char(hire_date, 'yyyy.mm.dd.dy')
from employees
where employee_id >= 200 and employee_id < 300;

--5. 2005.03.01������ ���� ����� ��, ������� ����϶�. �� ���Ǵ� NLS_LANG ������ � ������ �����Ǿ �۵��� �� �ֵ��� �϶�.
select last_name, to_char(hire_date, 'yyyy-mm-dd') "�����"
from employees
where hire_date < to_date('20050301', 'yyyymmdd');

/*
6. ������ 12���� �޿��� commission_pct��ŭ�� �߰��Ͽ� ���޵ȴ�.
commission�� NULL�� ��� 0���� �����Ͽ� ������ ����� ��, �����
�����ȣ�� ����(YEAR_SAL)�� ������ Ŀ���� ������ ����϶�.
*/
select employee_id, (salary*12) + (salary * 12 * nvl(commission_pct, 0)) as "year_salary"
from employees
order by "year_salary" asc;

--7. commission�� �����Ǿ� �ִ� ����� ��� ��ȣ�� commission_pct��, commission_pct�� ���� ū ������� ����϶�.
select employee_id, commission_pct
from employees
where commission_pct is not null
order by commission_pct desc;

--view ����

/*
1. �����ȣ, ����̸�(first_name�� last_name�� ��ĭ�� �־� �ٿ���
EMPLOYEE��� �÷����� ǥ��), �μ� ��ȣ�� ������ �� EMPLOYEE_VU�� ��
���϶�.
*/
create view employee_vu
as select employee_id,
first_name ||' '|| last_name as "EMPLOYEE",
department_id
from employees;

--2. EMPLOYEE_VU�� �̿��Ͽ�, ����̸��� �ش� ����� �Ҽӵ� �μ��� ����϶�.
select ev.employee, d.department_name
from employee_vu ev, departments d
where ev.department_id = d.department_id;

--3. �μ��̸�, �ش� �μ��� ��� �޿�(�÷� �̸��� AVG_SAL), �μ��� �̸��� ���� ���� DEPARTMENT_VU�� �����϶�. �並 ���� ������ Ȯ���϶�.
create view department_vu
as select d.department_name, round(avg(salary), 2) as "avg_sal"
from employees e, departments d
where e.department_id =  d.department_id
group by d.department_name;

--4. 80�� �μ��� ���� ����� ���̵��� 1������ ���ǵ� �並 �����϶�.
create view employee_vu_2
as select employee_id, first_name ||' '|| last_name as "EMPLOYEE", department_id
from employees
where department_id = 80;

--5. ����� ��(last_name)���� �˻��Ǵ� ��찡 ���Ҵ�. �˻��� ȿ���� ���� �� �ִ� ����� �ۼ��϶�.
create index ix
on employees(last_name);

--6. WHERE������ �����ȣ�� �μ���ȣ�� ���� �˻��Ǵ� ��찡 ����. �˻��� ȿ���� ���� �� �ִ� ����� �ۼ��϶�.
create index emp_id_with_department_id
on employees(employee_id, department_id);

--7. salary�� where������ �˻��� ���� �׻� salary�� ū ������� ���� ��� ������ �˻��Ǵ� ��찡 ���ٰ� ��������. �̸� �ݿ��Ͽ� �ε����� �����϶�.
create index ix_salary 
on employees (salary desc);

--8. 7���� ������ �ε����� �����϶�.
drop index ix_salary;