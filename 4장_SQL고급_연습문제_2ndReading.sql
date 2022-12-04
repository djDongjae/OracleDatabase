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
select last_name, hire_date
from employees
where hire_date < to_date('2005.03.01', 'yyyy.mm.dd');

/*
6. ������ 12���� �޿��� commission_pct��ŭ�� �߰��Ͽ� ���޵ȴ�.
commission�� NULL�� ��� 0���� �����Ͽ� ������ ����� ��, �����
�����ȣ�� ����(YEAR_SAL)�� ������ Ŀ���� ������ ����϶�.
*/
select employee_id, 12 * (salary + nvl(commission_pct, 0)) "year_sal"
from employees
order by "year_sal";

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
as select employee_id, first_name ||' '|| last_name as employee, department_id
from employees;

--2. EMPLOYEE_VU�� �̿��Ͽ�, ����̸��� �ش� ����� �Ҽӵ� �μ��� ����϶�.
select employee, department_id
from employee_vu;