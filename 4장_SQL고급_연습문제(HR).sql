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
select employee_id, to_char(hire_date, 'yyyy.mm.dd,dy')
from employees
where employee_id >= 200 and employee_id < 300;

--5. 2005.03.01������ ���� ����� ��, ������� ����϶�. �� ���Ǵ� NLS_LANG ������ � ������ �����Ǿ �۵��� �� �ֵ��� �϶�.
select nvl(last_name), nvl(hire_date)
from employees
where to_date();

/*
6. ������ 12���� �޿��� commission_pct��ŭ�� �߰��Ͽ� ���޵ȴ�.
commission�� NULL�� ��� 0���� �����Ͽ� ������ ����� ��, �����
�����ȣ�� ����(YEAR_SAL)�� ������ Ŀ���� ������ ����϶�.
*/
select employee_id, (salary*12) + (salary * 12 * nvl(commission_pct, 0)) as "year_sel"
from employees
order by "year_sel";

--7. commission�� �����Ǿ� �ִ� ����� ��� ��ȣ�� commission_pct��, commission_pct�� ���� ū ������� ����϶�.
select employee_id, commis

--view ����

/*
1. �����ȣ, ����̸�(first_name�� last_name�� ��ĭ�� �־� �ٿ���
EMPLOYEE��� �÷����� ǥ��), �μ� ��ȣ�� ������ �� EMPLOYEE_VU�� ��
���϶�.
*/

--2. EMPLOYEE_VU�� �̿��Ͽ�, ����̸��� �ش� ����� �Ҽӵ� �μ��� ����϶�.

--3. �μ��̸�, �ش� �μ��� ��� �޿�(�÷� �̸��� AVG_SAL), �μ��� �̸��� ���� ���� DEPARTMENT_VU�� �����϶�. �並 ���� ������ Ȯ���϶�.

--4. 80�� �μ��� ���� ����� ���̵��� 1������ ���ǵ� �並 �����϶�.

--5. ����� ��(last_name)���� �˻��Ǵ� ��찡 ���Ҵ�. �˻��� ȿ���� ���� �� �ִ� ����� �ۼ��϶�.

--6. WHERE������ �����ȣ�� �μ���ȣ�� ���� �˻��Ǵ� ��찡 ����. �˻��� ȿ���� ���� �� �ִ� ����� �ۼ��϶�.

--7. salary�� where������ �˻��� ���� �׻� salary�� ū ������� ���� ��� ������ �˻��Ǵ� ��찡 ���ٰ� ��������. �̸� �ݿ��Ͽ� �ε����� �����϶�.

--8. 7���� ������ �ε����� �����϶�.
